/**
 * WordPress to Prisma Migration Script
 *
 * This script parses a WordPress database.sql backup file and migrates:
 * - Categories
 * - Tags
 * - Posts with their category/tag relationships
 * - Featured images (references)
 *
 * Usage: npx tsx scripts/migrate-wp.ts
 */

import { PrismaClient } from '@prisma/client'
import { PrismaPg } from '@prisma/adapter-pg'
import { Pool } from 'pg'
import { readFileSync } from 'fs'
import { join } from 'path'
import bcrypt from 'bcryptjs'
import 'dotenv/config'

// Initialize Prisma with pg adapter (required for Prisma 7)
function createPrismaClient() {
  const connectionString = process.env.DATABASE_URL
  if (!connectionString) {
    throw new Error('DATABASE_URL is not defined. Make sure .env file exists.')
  }
  const pool = new Pool({ connectionString })
  const adapter = new PrismaPg(pool)
  return new PrismaClient({ adapter })
}

const prisma = createPrismaClient()

// Path to the WordPress SQL backup
const SQL_FILE_PATH = join(__dirname, '../../database.sql')

// Regex patterns for parsing SQL INSERT statements
const INSERT_PATTERN = /INSERT INTO `SERVMASK_PREFIX_(\w+)` VALUES \((.+)\);/g

interface WPTerm {
  term_id: string
  name: string
  slug: string
  term_group: string
}

interface WPTermTaxonomy {
  term_taxonomy_id: string
  term_id: string
  taxonomy: string
  description: string
  parent: string
  count: string
}

interface WPPost {
  ID: string
  post_author: string
  post_date: string
  post_date_gmt: string
  post_content: string
  post_title: string
  post_excerpt: string
  post_status: string
  comment_status: string
  ping_status: string
  post_password: string
  post_name: string
  to_ping: string
  pinged: string
  post_modified: string
  post_modified_gmt: string
  post_content_filtered: string
  post_parent: string
  guid: string
  menu_order: string
  post_type: string
  post_mime_type: string
  comment_count: string
}

interface WPTermRelationship {
  object_id: string
  term_taxonomy_id: string
  term_order: string
}

interface WPPostMeta {
  meta_id: string
  post_id: string
  meta_key: string
  meta_value: string
}

// Parse SQL value, handling escaped quotes and special characters
function parseSQLValue(value: string): string {
  // Remove surrounding quotes
  let result = value.trim()
  if (result.startsWith("'") && result.endsWith("'")) {
    result = result.slice(1, -1)
  }

  // Unescape MySQL escaped characters
  result = result
    .replace(/\\'/g, "'")
    .replace(/\\"/g, '"')
    .replace(/\\\\/g, '\\')
    .replace(/\\n/g, '\n')
    .replace(/\\r/g, '\r')
    .replace(/\\t/g, '\t')

  return result
}

// Parse INSERT VALUES into an array of values
function parseValues(valuesStr: string): string[] {
  const values: string[] = []
  let current = ''
  let inQuotes = false
  let escaped = false

  for (let i = 0; i < valuesStr.length; i++) {
    const char = valuesStr[i]

    if (escaped) {
      current += char
      escaped = false
      continue
    }

    if (char === '\\') {
      current += char
      escaped = true
      continue
    }

    if (char === "'" && !escaped) {
      inQuotes = !inQuotes
      current += char
      continue
    }

    if (char === ',' && !inQuotes) {
      values.push(parseSQLValue(current))
      current = ''
      continue
    }

    current += char
  }

  if (current) {
    values.push(parseSQLValue(current))
  }

  return values
}

// Extract all INSERT statements from SQL file
function extractInserts(sql: string): {
  terms: WPTerm[]
  termTaxonomies: WPTermTaxonomy[]
  posts: WPPost[]
  termRelationships: WPTermRelationship[]
  postMeta: WPPostMeta[]
} {
  const terms: WPTerm[] = []
  const termTaxonomies: WPTermTaxonomy[] = []
  const posts: WPPost[] = []
  const termRelationships: WPTermRelationship[] = []
  const postMeta: WPPostMeta[] = []

  // Process line by line for memory efficiency
  const lines = sql.split('\n')

  for (const line of lines) {
    const trimmedLine = line.trim()

    if (!trimmedLine.startsWith('INSERT INTO')) continue

    // Parse terms
    const termsMatch = trimmedLine.match(
      /INSERT INTO `SERVMASK_PREFIX_terms` VALUES \((.+)\);/
    )
    if (termsMatch) {
      const values = parseValues(termsMatch[1])
      if (values.length >= 4) {
        terms.push({
          term_id: values[0],
          name: values[1],
          slug: values[2],
          term_group: values[3],
        })
      }
      continue
    }

    // Parse term_taxonomy
    const taxMatch = trimmedLine.match(
      /INSERT INTO `SERVMASK_PREFIX_term_taxonomy` VALUES \((.+)\);/
    )
    if (taxMatch) {
      const values = parseValues(taxMatch[1])
      if (values.length >= 6) {
        termTaxonomies.push({
          term_taxonomy_id: values[0],
          term_id: values[1],
          taxonomy: values[2],
          description: values[3],
          parent: values[4],
          count: values[5],
        })
      }
      continue
    }

    // Parse posts
    const postsMatch = trimmedLine.match(
      /INSERT INTO `SERVMASK_PREFIX_posts` VALUES \((.+)\);/
    )
    if (postsMatch) {
      const values = parseValues(postsMatch[1])
      if (values.length >= 23) {
        posts.push({
          ID: values[0],
          post_author: values[1],
          post_date: values[2],
          post_date_gmt: values[3],
          post_content: values[4],
          post_title: values[5],
          post_excerpt: values[6],
          post_status: values[7],
          comment_status: values[8],
          ping_status: values[9],
          post_password: values[10],
          post_name: values[11],
          to_ping: values[12],
          pinged: values[13],
          post_modified: values[14],
          post_modified_gmt: values[15],
          post_content_filtered: values[16],
          post_parent: values[17],
          guid: values[18],
          menu_order: values[19],
          post_type: values[20],
          post_mime_type: values[21],
          comment_count: values[22],
        })
      }
      continue
    }

    // Parse term_relationships
    const relMatch = trimmedLine.match(
      /INSERT INTO `SERVMASK_PREFIX_term_relationships` VALUES \((.+)\);/
    )
    if (relMatch) {
      const values = parseValues(relMatch[1])
      if (values.length >= 3) {
        termRelationships.push({
          object_id: values[0],
          term_taxonomy_id: values[1],
          term_order: values[2],
        })
      }
      continue
    }

    // Parse postmeta (for featured images)
    const metaMatch = trimmedLine.match(
      /INSERT INTO `SERVMASK_PREFIX_postmeta` VALUES \((.+)\);/
    )
    if (metaMatch) {
      const values = parseValues(metaMatch[1])
      if (values.length >= 4) {
        postMeta.push({
          meta_id: values[0],
          post_id: values[1],
          meta_key: values[2],
          meta_value: values[3],
        })
      }
      continue
    }
  }

  return { terms, termTaxonomies, posts, termRelationships, postMeta }
}

// Convert WordPress HTML content to cleaner format
function cleanContent(content: string): string {
  // Remove WordPress Gutenberg block comments
  let cleaned = content
    .replace(/<!-- wp:\w+[^>]*-->/g, '')
    .replace(/<!-- \/wp:\w+ -->/g, '')
    .replace(/<!--nextpage-->/g, '\n\n---\n\n')

  // Clean up extra whitespace
  cleaned = cleaned.trim()

  return cleaned
}

// Get featured image URL from post meta
function getFeaturedImage(
  postId: string,
  postMeta: WPPostMeta[],
  posts: WPPost[]
): string | null {
  // Find _thumbnail_id meta
  const thumbnailMeta = postMeta.find(
    (m) => m.post_id === postId && m.meta_key === '_thumbnail_id'
  )

  if (!thumbnailMeta) return null

  // Find the attachment post
  const attachment = posts.find(
    (p) => p.ID === thumbnailMeta.meta_value && p.post_type === 'attachment'
  )

  if (!attachment) return null

  // Extract filename from guid
  const guidMatch = attachment.guid.match(/\/([^\/]+\.(jpg|jpeg|png|gif|webp))$/i)
  if (guidMatch) {
    return `/uploads/${guidMatch[1]}`
  }

  return null
}

async function migrate() {
  console.log('Starting WordPress to Prisma migration...\n')

  // Read SQL file
  console.log(`Reading SQL file: ${SQL_FILE_PATH}`)
  const sql = readFileSync(SQL_FILE_PATH, 'utf-8')
  console.log(`SQL file size: ${(sql.length / 1024 / 1024).toFixed(2)} MB\n`)

  // Parse SQL
  console.log('Parsing SQL data...')
  const { terms, termTaxonomies, posts, termRelationships, postMeta } =
    extractInserts(sql)

  console.log(`Found:`)
  console.log(`  - ${terms.length} terms`)
  console.log(`  - ${termTaxonomies.length} term taxonomies`)
  console.log(`  - ${posts.length} posts (all types)`)
  console.log(`  - ${termRelationships.length} term relationships`)
  console.log(`  - ${postMeta.length} post meta entries\n`)

  // Create term lookup maps
  const termById = new Map(terms.map((t) => [t.term_id, t]))
  const taxById = new Map(termTaxonomies.map((t) => [t.term_taxonomy_id, t]))
  const taxByTermId = new Map(termTaxonomies.map((t) => [t.term_id, t]))

  // Separate categories and tags
  const categories = termTaxonomies
    .filter((t) => t.taxonomy === 'category')
    .map((t) => {
      const term = termById.get(t.term_id)
      return {
        wpId: t.term_id,
        wpTaxId: t.term_taxonomy_id,
        name: term?.name || '',
        slug: term?.slug || '',
        description: t.description || null,
      }
    })
    .filter((c) => c.name && c.slug)

  const tags = termTaxonomies
    .filter((t) => t.taxonomy === 'post_tag')
    .map((t) => {
      const term = termById.get(t.term_id)
      return {
        wpId: t.term_id,
        wpTaxId: t.term_taxonomy_id,
        name: term?.name || '',
        slug: term?.slug || '',
      }
    })
    .filter((t) => t.name && t.slug)

  // Filter only published posts
  const publishedPosts = posts.filter(
    (p) => p.post_type === 'post' && p.post_status === 'publish'
  )

  console.log(`Filtered data:`)
  console.log(`  - ${categories.length} categories`)
  console.log(`  - ${tags.length} tags`)
  console.log(`  - ${publishedPosts.length} published posts\n`)

  // Create or get admin user
  console.log('Creating/getting admin user...')
  let adminUser = await prisma.user.findFirst({
    where: { role: 'ADMIN' },
  })

  if (!adminUser) {
    const hashedPassword = await bcrypt.hash('admin123', 10)
    adminUser = await prisma.user.create({
      data: {
        email: 'admin@kilasindonesia.com',
        password: hashedPassword,
        name: 'Admin',
        role: 'ADMIN',
      },
    })
    console.log('Created admin user: admin@kilasindonesia.com / admin123')
  } else {
    console.log(`Using existing admin user: ${adminUser.email}`)
  }

  // Import categories
  console.log('\nImporting categories...')
  const categoryIdMap = new Map<string, string>() // wpTaxId -> prismaId

  for (const cat of categories) {
    try {
      const existing = await prisma.category.findUnique({
        where: { slug: cat.slug },
      })

      if (existing) {
        categoryIdMap.set(cat.wpTaxId, existing.id)
        console.log(`  [skip] Category "${cat.name}" already exists`)
      } else {
        const created = await prisma.category.create({
          data: {
            name: cat.name,
            slug: cat.slug,
            description: cat.description,
          },
        })
        categoryIdMap.set(cat.wpTaxId, created.id)
        console.log(`  [+] Created category: ${cat.name}`)
      }
    } catch (error) {
      console.error(`  [!] Error importing category ${cat.name}:`, error)
    }
  }

  // Import tags
  console.log('\nImporting tags...')
  const tagIdMap = new Map<string, string>() // wpTaxId -> prismaId

  for (const tag of tags) {
    try {
      const existing = await prisma.tag.findUnique({
        where: { slug: tag.slug },
      })

      if (existing) {
        tagIdMap.set(tag.wpTaxId, existing.id)
        console.log(`  [skip] Tag "${tag.name}" already exists`)
      } else {
        const created = await prisma.tag.create({
          data: {
            name: tag.name,
            slug: tag.slug,
          },
        })
        tagIdMap.set(tag.wpTaxId, created.id)
        console.log(`  [+] Created tag: ${tag.name}`)
      }
    } catch (error) {
      console.error(`  [!] Error importing tag ${tag.name}:`, error)
    }
  }

  // Build relationship lookups
  const postCategoryMap = new Map<string, string[]>() // postId -> categoryPrismaIds[]
  const postTagMap = new Map<string, string[]>() // postId -> tagPrismaIds[]

  for (const rel of termRelationships) {
    const tax = taxById.get(rel.term_taxonomy_id)
    if (!tax) continue

    if (tax.taxonomy === 'category') {
      const prismaId = categoryIdMap.get(rel.term_taxonomy_id)
      if (prismaId) {
        const existing = postCategoryMap.get(rel.object_id) || []
        existing.push(prismaId)
        postCategoryMap.set(rel.object_id, existing)
      }
    } else if (tax.taxonomy === 'post_tag') {
      const prismaId = tagIdMap.get(rel.term_taxonomy_id)
      if (prismaId) {
        const existing = postTagMap.get(rel.object_id) || []
        existing.push(prismaId)
        postTagMap.set(rel.object_id, existing)
      }
    }
  }

  // Import posts
  console.log('\nImporting posts...')
  let importedCount = 0
  let skippedCount = 0

  for (const post of publishedPosts) {
    try {
      // Check if post already exists by slug
      const existing = await prisma.post.findUnique({
        where: { slug: post.post_name },
      })

      if (existing) {
        console.log(`  [skip] Post "${post.post_title.substring(0, 50)}..." already exists`)
        skippedCount++
        continue
      }

      // Get category and tag IDs
      const categoryIds = postCategoryMap.get(post.ID) || []
      const tagIds = postTagMap.get(post.ID) || []

      // Get featured image
      const featuredImage = getFeaturedImage(post.ID, postMeta, posts)

      // Parse date
      let publishedAt: Date | null = null
      if (post.post_date && post.post_date !== '0000-00-00 00:00:00') {
        publishedAt = new Date(post.post_date)
      }

      // Create post
      await prisma.post.create({
        data: {
          title: post.post_title,
          slug: post.post_name,
          content: cleanContent(post.post_content),
          excerpt: post.post_excerpt || null,
          featuredImage,
          authorId: adminUser.id,
          status: 'PUBLISHED',
          publishedAt,
          categories: {
            connect: categoryIds.map((id) => ({ id })),
          },
          tags: {
            connect: tagIds.map((id) => ({ id })),
          },
        },
      })

      console.log(`  [+] Imported: ${post.post_title.substring(0, 50)}...`)
      importedCount++
    } catch (error) {
      console.error(`  [!] Error importing post ${post.post_title}:`, error)
    }
  }

  console.log('\n=== Migration Complete ===')
  console.log(`Categories: ${categories.length}`)
  console.log(`Tags: ${tags.length}`)
  console.log(`Posts imported: ${importedCount}`)
  console.log(`Posts skipped: ${skippedCount}`)
}

// Run migration
migrate()
  .catch((error) => {
    console.error('Migration failed:', error)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
