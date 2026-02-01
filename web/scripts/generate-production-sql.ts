import * as fs from 'fs'
import * as path from 'path'
import { categoriesData, tagsData, postsData } from '../src/db/seed-data'

// Generate production SQL file for importing WordPress data
const OUTPUT_FILE = path.join(__dirname, '../production-import.sql')

// Simple CUID-like ID generator
function createId(): string {
  const timestamp = Date.now().toString(36)
  const randomPart = Math.random().toString(36).substring(2, 10)
  return `c${timestamp}${randomPart}`
}

function escapeSQL(s: string): string {
  if (!s) return ''
  return s.replace(/'/g, "''").replace(/\\/g, '\\\\')
}

async function main() {
  console.log('📝 Generating production SQL...')

  const lines: string[] = []

  // Header
  lines.push('-- KilasIndonesia Production Import SQL')
  lines.push(`-- Generated on ${new Date().toISOString()}`)
  lines.push('-- Run this SQL on production PostgreSQL database')
  lines.push('')
  lines.push('BEGIN;')
  lines.push('')

  // Admin user (hashed password for admin123)
  const adminId = createId()
  const hashedPassword = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'
  const now = new Date().toISOString()

  lines.push('-- Check and create admin user if not exists')
  lines.push(`INSERT INTO users (id, email, password, name, role, "createdAt", "updatedAt")`)
  lines.push(`SELECT '${adminId}', 'admin@kilasindonesia.com', '${hashedPassword}', 'Admin Kilas Indonesia', 'ADMIN', '${now}', '${now}'`)
  lines.push(`WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'admin@kilasindonesia.com');`)
  lines.push('')

  // Get admin ID for later use
  lines.push('-- Get admin user ID')
  lines.push(`DO $$ DECLARE admin_user_id TEXT; BEGIN`)
  lines.push(`  SELECT id INTO admin_user_id FROM users WHERE email = 'admin@kilasindonesia.com' LIMIT 1;`)
  lines.push('')

  // Categories
  lines.push('  -- Categories')
  const categoryIds: Record<string, string> = {}
  for (const cat of categoriesData) {
    const id = createId()
    categoryIds[cat.slug] = id
    lines.push(`  INSERT INTO categories (id, name, slug, description, "createdAt")`)
    lines.push(`  SELECT '${id}', '${escapeSQL(cat.name)}', '${escapeSQL(cat.slug)}', '${escapeSQL(cat.description || '')}', '${now}'`)
    lines.push(`  WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = '${escapeSQL(cat.slug)}');`)
  }
  lines.push('')

  // Tags
  lines.push('  -- Tags')
  const tagIds: Record<string, string> = {}
  for (const tag of tagsData) {
    const id = createId()
    tagIds[tag.slug] = id
    lines.push(`  INSERT INTO tags (id, name, slug, "createdAt")`)
    lines.push(`  SELECT '${id}', '${escapeSQL(tag.name)}', '${escapeSQL(tag.slug)}', '${now}'`)
    lines.push(`  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = '${escapeSQL(tag.slug)}');`)
  }
  lines.push('')

  // Posts
  lines.push('  -- Posts')
  const postIds: { id: string; slug: string; categorySlug: string; tagSlugs: string[] }[] = []
  for (const post of postsData) {
    const id = createId()
    postIds.push({ id, slug: post.slug, categorySlug: post.categorySlug, tagSlugs: post.tagSlugs })

    const publishedAt = post.publishedAt.toISOString()

    lines.push(`  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")`)
    lines.push(`  SELECT '${id}', '${escapeSQL(post.title)}', '${escapeSQL(post.slug)}', '${escapeSQL(post.content)}', '${escapeSQL(post.excerpt)}', ${post.featuredImage ? `'${escapeSQL(post.featuredImage)}'` : 'NULL'}, admin_user_id, 'PUBLISHED', ${post.viewCount}, '${publishedAt}', '${publishedAt}', '${now}'`)
    lines.push(`  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = '${escapeSQL(post.slug)}');`)
  }
  lines.push('')

  // Post-Category relationships
  lines.push('  -- Post-Category relationships')
  for (const post of postIds) {
    lines.push(`  INSERT INTO "_PostCategories" ("A", "B")`)
    lines.push(`  SELECT c.id, p.id FROM categories c, posts p`)
    lines.push(`  WHERE c.slug = '${escapeSQL(post.categorySlug)}' AND p.slug = '${escapeSQL(post.slug)}'`)
    lines.push(`  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);`)
  }
  lines.push('')

  // Post-Tag relationships
  lines.push('  -- Post-Tag relationships')
  for (const post of postIds) {
    for (const tagSlug of post.tagSlugs) {
      lines.push(`  INSERT INTO "_PostTags" ("A", "B")`)
      lines.push(`  SELECT p.id, t.id FROM posts p, tags t`)
      lines.push(`  WHERE p.slug = '${escapeSQL(post.slug)}' AND t.slug = '${escapeSQL(tagSlug)}'`)
      lines.push(`  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);`)
    }
  }
  lines.push('')

  // Settings (schema: key PRIMARY KEY, value)
  lines.push('  -- Settings')
  const settings = [
    { key: 'site_name', value: 'Kilas Indonesia' },
    { key: 'site_description', value: 'Portal Berita Pendidikan Islam Terpercaya' },
    { key: 'site_logo', value: 'https://res.cloudinary.com/dicwfbdgz/image/upload/v1769873625/logo_kilasindonesia_ww6s9k.png' },
    { key: 'contact_email', value: 'redaksi@kilasindonesia.com' },
    { key: 'social_facebook', value: 'https://facebook.com/kilasindonesia' },
    { key: 'social_twitter', value: 'https://twitter.com/kilasindonesia' },
  ]
  for (const setting of settings) {
    lines.push(`  INSERT INTO settings (key, value)`)
    lines.push(`  SELECT '${setting.key}', '${escapeSQL(setting.value)}'`)
    lines.push(`  WHERE NOT EXISTS (SELECT 1 FROM settings WHERE key = '${setting.key}');`)
  }
  lines.push('')

  lines.push('END $$;')
  lines.push('')
  lines.push('COMMIT;')
  lines.push('')
  lines.push('-- Summary')
  lines.push(`-- Categories: ${categoriesData.length}`)
  lines.push(`-- Tags: ${tagsData.length}`)
  lines.push(`-- Posts: ${postsData.length}`)

  // Write file
  fs.writeFileSync(OUTPUT_FILE, lines.join('\n'))
  console.log(`💾 Saved to: ${OUTPUT_FILE}`)
  console.log(`   Total lines: ${lines.length}`)
}

main().catch(console.error)
