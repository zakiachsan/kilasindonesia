import 'dotenv/config'
import { drizzle } from 'drizzle-orm/node-postgres'
import { Pool } from 'pg'
import * as schema from './schema'
import { categoriesData, tagsData, postsData } from './seed-data'

const pool = new Pool({ connectionString: process.env.DATABASE_URL })
const db = drizzle(pool, { schema })

async function main() {
  console.log('🌱 Starting seed with WordPress data...')

  // Clear existing data
  console.log('🗑️  Clearing existing data...')
  await db.delete(schema.menuItems)
  await db.delete(schema.menus)
  await db.delete(schema.comments)
  await db.delete(schema.postTags)
  await db.delete(schema.postCategories)
  await db.delete(schema.posts)
  await db.delete(schema.tags)
  await db.delete(schema.categories)
  await db.delete(schema.users)
  await db.delete(schema.settings)

  // ===========================================
  // CREATE ADMIN USER
  // ===========================================
  console.log('👤 Creating admin user...')
  const hashedPassword = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy' // admin123

  const now = new Date()
  const [admin] = await db.insert(schema.users).values({
    email: 'admin@kilasindonesia.com',
    password: hashedPassword,
    name: 'Admin Kilas Indonesia',
    role: 'ADMIN',
    createdAt: now,
    updatedAt: now,
  }).returning()

  // ===========================================
  // CREATE CATEGORIES
  // ===========================================
  console.log('📁 Creating categories...')

  const insertedCategories = await db.insert(schema.categories).values(categoriesData).returning()
  const categories: Record<string, typeof insertedCategories[0]> = {}
  for (const cat of insertedCategories) {
    categories[cat.slug] = cat
  }
  console.log(`   Created ${insertedCategories.length} categories`)

  // ===========================================
  // CREATE TAGS
  // ===========================================
  console.log('🏷️  Creating tags...')

  const insertedTags = await db.insert(schema.tags).values(tagsData).returning()
  const tags: Record<string, typeof insertedTags[0]> = {}
  for (const tag of insertedTags) {
    tags[tag.slug] = tag
  }
  console.log(`   Created ${insertedTags.length} tags`)

  // ===========================================
  // CREATE POSTS
  // ===========================================
  console.log('📝 Creating posts...')

  let successCount = 0
  let errorCount = 0

  for (const postData of postsData) {
    try {
      const category = categories[postData.categorySlug]
      if (!category) {
        console.log(`   ⚠️  Category not found: ${postData.categorySlug}, using 'nasional'`)
      }
      const categoryId = category?.id || categories['nasional'].id

      const postNow = new Date()
      const [post] = await db.insert(schema.posts).values({
        title: postData.title,
        slug: postData.slug,
        content: postData.content,
        excerpt: postData.excerpt,
        featuredImage: postData.featuredImage,
        authorId: admin.id,
        status: 'PUBLISHED',
        viewCount: postData.viewCount,
        publishedAt: postData.publishedAt,
        createdAt: postData.publishedAt,
        updatedAt: postNow,
      }).returning()

      // Link post to category
      await db.insert(schema.postCategories).values({
        categoryId: categoryId,
        postId: post.id,
      })

      // Link post to tags
      for (const tagSlug of postData.tagSlugs) {
        const tag = tags[tagSlug]
        if (tag) {
          await db.insert(schema.postTags).values({
            postId: post.id,
            tagId: tag.id,
          })
        }
      }

      successCount++
      if (successCount % 10 === 0) {
        console.log(`   Processed ${successCount}/${postsData.length} posts...`)
      }
    } catch (error) {
      errorCount++
      console.error(`   ❌ Error creating post "${postData.title.substring(0, 50)}...":`, error)
    }
  }

  console.log(`   ✅ Created ${successCount} posts (${errorCount} errors)`)

  // ===========================================
  // CREATE NAVIGATION MENUS
  // ===========================================
  console.log('🧭 Creating navigation menus...')

  const [primaryMenu] = await db.insert(schema.menus).values({
    name: 'Primary Menu',
    location: 'primary',
  }).returning()

  const [footerMenu] = await db.insert(schema.menus).values({
    name: 'Footer Menu',
    location: 'footer',
  }).returning()

  // Primary menu items
  await db.insert(schema.menuItems).values([
    { menuId: primaryMenu.id, title: 'Nasional', url: '/category/nasional', order: 1 },
    { menuId: primaryMenu.id, title: 'Madrasah', url: '/category/madrasah', order: 2 },
    { menuId: primaryMenu.id, title: 'Pesantren', url: '/category/pesantren', order: 3 },
    { menuId: primaryMenu.id, title: 'Perguruan Tinggi', url: '/category/perguruan-tinggi', order: 4 },
    { menuId: primaryMenu.id, title: 'Opini', url: '/category/opini', order: 5 },
    { menuId: primaryMenu.id, title: 'Tokoh', url: '/category/tokoh', order: 6 },
  ])

  // Footer menu items
  await db.insert(schema.menuItems).values([
    { menuId: footerMenu.id, title: 'Tentang Kami', url: '/tentang-kami', order: 1 },
    { menuId: footerMenu.id, title: 'Kontak', url: '/kontak', order: 2 },
    { menuId: footerMenu.id, title: 'Kebijakan Privasi', url: '/kebijakan-privasi', order: 3 },
    { menuId: footerMenu.id, title: 'Syarat & Ketentuan', url: '/syarat-ketentuan', order: 4 },
  ])

  // ===========================================
  // CREATE SETTINGS
  // ===========================================
  console.log('⚙️  Creating settings...')

  await db.insert(schema.settings).values([
    { key: 'site_name', value: 'Kilas Indonesia' },
    { key: 'site_description', value: 'Portal Berita Pendidikan Islam Terpercaya' },
    { key: 'site_logo', value: 'https://res.cloudinary.com/dicwfbdgz/image/upload/v1769873625/logo_kilasindonesia_ww6s9k.png' },
    { key: 'contact_email', value: 'redaksi@kilasindonesia.com' },
    { key: 'social_facebook', value: 'https://facebook.com/kilasindonesia' },
    { key: 'social_twitter', value: 'https://twitter.com/kilasindonesia' },
  ])

  console.log('✅ Seed completed successfully!')
  console.log(`   - 1 admin user`)
  console.log(`   - ${insertedCategories.length} categories`)
  console.log(`   - ${insertedTags.length} tags`)
  console.log(`   - ${successCount} posts`)
  console.log(`   - 2 menus`)
  console.log(`   - 6 settings`)

  await pool.end()
}

main().catch((error) => {
  console.error('Seed failed:', error)
  process.exit(1)
})
