const fs = require('fs');

// Load extracted data
const posts = JSON.parse(fs.readFileSync('posts.json', 'utf-8'));
const categories = JSON.parse(fs.readFileSync('categories.json', 'utf-8'));
const tags = JSON.parse(fs.readFileSync('tags.json', 'utf-8'));
const postCategories = JSON.parse(fs.readFileSync('post-categories.json', 'utf-8'));
const postTags = JSON.parse(fs.readFileSync('post-tags.json', 'utf-8'));
const postImages = JSON.parse(fs.readFileSync('post-images.json', 'utf-8'));

// Map categories to our structure
const categoryMap = {
  'berita': 'nasional',
  'lingkungan': 'madrasah',
  'budaya': 'pesantren',
  'edukasi': 'perguruan-tinggi',
  'politik': 'opini',
  'hiburan': 'tokoh',
};

// Generate clean excerpt from content
function generateExcerpt(content, maxLength = 200) {
  let text = content.replace(/<[^>]+>/g, ' ');
  text = text.replace(/\s+/g, ' ').trim();
  if (text.length > maxLength) {
    text = text.substring(0, maxLength).trim() + '...';
  }
  return text;
}

// Clean content
function cleanContent(content) {
  let clean = content.replace(/<!-- wp:[^>]+-->/g, '');
  clean = clean.replace(/<!-- \/wp:[^>]+-->/g, '');
  clean = clean.replace(/\n\n+/g, '\n\n').trim();
  return clean;
}

// Build post data for seed
const seedPosts = posts.map(post => {
  const cats = postCategories.filter(pc => pc.postId === post.id);
  const catSlug = cats.length > 0 ? (categoryMap[cats[0].categorySlug] || 'nasional') : 'nasional';
  const postTagSlugs = postTags.filter(pt => pt.postId === post.id).map(pt => pt.tagSlug);
  const publishedAt = new Date(post.date.replace(' ', 'T') + 'Z');
  const featuredImage = postImages[post.id] || null;

  return {
    title: post.title,
    slug: post.slug,
    content: cleanContent(post.content),
    excerpt: post.excerpt || generateExcerpt(post.content),
    featuredImage: featuredImage,
    categorySlug: catSlug,
    tagSlugs: postTagSlugs.slice(0, 5),
    publishedAt: publishedAt.toISOString(),
    viewCount: Math.floor(Math.random() * 5000) + 500,
  };
});

// Generate TypeScript seed file
const seedContent = `import 'dotenv/config'
import { drizzle } from 'drizzle-orm/node-postgres'
import { Pool } from 'pg'
import * as schema from './schema'

const pool = new Pool({ connectionString: process.env.DATABASE_URL })
const db = drizzle(pool, { schema })

async function main() {
  console.log('🌱 Starting seed with WordPress data...')

  // Clear existing data
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
  const hashedPassword = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'

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

  const categoriesData = [
    { name: 'Nasional', slug: 'nasional', description: 'Berita nasional terkini' },
    { name: 'Madrasah', slug: 'madrasah', description: 'Berita seputar madrasah di Indonesia' },
    { name: 'Pesantren', slug: 'pesantren', description: 'Berita seputar pesantren dan santri' },
    { name: 'Perguruan Tinggi', slug: 'perguruan-tinggi', description: 'Berita seputar perguruan tinggi keagamaan' },
    { name: 'Opini', slug: 'opini', description: 'Opini dan pandangan' },
    { name: 'Tokoh', slug: 'tokoh', description: 'Profil tokoh pendidikan dan keagamaan' },
    { name: 'Edukasi', slug: 'edukasi', description: 'Berita pendidikan umum' },
  ]

  const insertedCategories = await db.insert(schema.categories).values(categoriesData).returning()
  const categories: Record<string, typeof insertedCategories[0]> = {}
  for (const cat of insertedCategories) {
    categories[cat.slug] = cat
  }

  // ===========================================
  // CREATE TAGS
  // ===========================================
  console.log('🏷️ Creating tags...')

  const tagsData = [
${tags.slice(0, 30).map(t => `    { name: '${t.name.replace(/'/g, "\\'")}', slug: '${t.slug}' },`).join('\n')}
  ]

  const insertedTags = await db.insert(schema.tags).values(tagsData).returning()
  const tags: Record<string, typeof insertedTags[0]> = {}
  for (const tag of insertedTags) {
    tags[tag.slug] = tag
  }

  // ===========================================
  // CREATE POSTS
  // ===========================================
  console.log('📝 Creating posts...')

  const postsData = [
${seedPosts.map(p => `    {
      title: ${JSON.stringify(p.title)},
      slug: ${JSON.stringify(p.slug)},
      content: ${JSON.stringify(p.content)},
      excerpt: ${JSON.stringify(p.excerpt)},
      featuredImage: ${p.featuredImage ? JSON.stringify(p.featuredImage) : 'null'},
      categorySlug: '${p.categorySlug}',
      tagSlugs: ${JSON.stringify(p.tagSlugs)},
      publishedAt: new Date('${p.publishedAt}'),
      viewCount: ${p.viewCount},
    },`).join('\n')}
  ]

  for (const postData of postsData) {
    const [post] = await db.insert(schema.posts).values({
      title: postData.title,
      slug: postData.slug,
      content: postData.content,
      excerpt: postData.excerpt,
      featuredImage: postData.featuredImage,
      authorId: admin.id,
      status: 'PUBLISHED',
      publishedAt: postData.publishedAt,
      viewCount: postData.viewCount,
      createdAt: postData.publishedAt,
      updatedAt: postData.publishedAt,
    }).returning()

    // Add category relation
    if (categories[postData.categorySlug]) {
      await db.insert(schema.postCategories).values({
        postId: post.id,
        categoryId: categories[postData.categorySlug].id,
      })
    }

    // Add tag relations
    for (const tagSlug of postData.tagSlugs) {
      if (tags[tagSlug]) {
        await db.insert(schema.postTags).values({
          postId: post.id,
          tagId: tags[tagSlug].id,
        })
      }
    }

    console.log(\`   Created post: \${post.title.substring(0, 50)}...\`)
  }

  // ===========================================
  // CREATE MENUS
  // ===========================================
  console.log('📋 Creating menus...')

  const [primaryMenu] = await db.insert(schema.menus).values({
    name: 'Primary Menu',
    location: 'primary',
  }).returning()

  await db.insert(schema.menuItems).values([
    { menuId: primaryMenu.id, title: 'Beranda', url: '/', order: 0 },
    { menuId: primaryMenu.id, title: 'Nasional', url: '/category/nasional', order: 1 },
    { menuId: primaryMenu.id, title: 'Madrasah', url: '/category/madrasah', order: 2 },
    { menuId: primaryMenu.id, title: 'Pesantren', url: '/category/pesantren', order: 3 },
    { menuId: primaryMenu.id, title: 'Perguruan Tinggi', url: '/category/perguruan-tinggi', order: 4 },
    { menuId: primaryMenu.id, title: 'Opini', url: '/category/opini', order: 5 },
    { menuId: primaryMenu.id, title: 'Tokoh', url: '/category/tokoh', order: 6 },
  ])

  const [footerMenu] = await db.insert(schema.menus).values({
    name: 'Footer Menu',
    location: 'footer',
  }).returning()

  await db.insert(schema.menuItems).values([
    { menuId: footerMenu.id, title: 'Tentang Kami', url: '/tentang-kami', order: 0 },
    { menuId: footerMenu.id, title: 'Kontak', url: '/kontak', order: 1 },
    { menuId: footerMenu.id, title: 'Kebijakan Privasi', url: '/kebijakan-privasi', order: 2 },
    { menuId: footerMenu.id, title: 'Syarat & Ketentuan', url: '/syarat-ketentuan', order: 3 },
  ])

  // ===========================================
  // CREATE SETTINGS
  // ===========================================
  console.log('⚙️ Creating settings...')

  await db.insert(schema.settings).values([
    { key: 'site_name', value: 'Kilas Indonesia' },
    { key: 'site_description', value: 'Portal Berita Pendidikan Islam Indonesia' },
    { key: 'site_logo', value: '/images/logo.png' },
    { key: 'posts_per_page', value: '10' },
    { key: 'allow_comments', value: 'true' },
    { key: 'moderate_comments', value: 'true' },
  ])

  console.log('✅ Seed completed!')
  console.log('')
  console.log('📊 Summary:')
  console.log(\`   - Users: 1\`)
  console.log(\`   - Categories: \${Object.keys(categories).length}\`)
  console.log(\`   - Tags: \${Object.keys(tags).length}\`)
  console.log(\`   - Posts: \${postsData.length}\`)
  console.log(\`   - Menus: 2\`)
  console.log('')
  console.log('🔐 Admin credentials:')
  console.log('   Email: admin@kilasindonesia.com')
  console.log('   Password: admin123')
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e)
    process.exit(1)
  })
  .finally(async () => {
    await pool.end()
  })
`;

fs.writeFileSync('../web/src/db/seed-wp.ts', seedContent);
console.log('Generated seed-wp.ts with ' + seedPosts.length + ' posts (with images)');

// Show image count
const withImages = seedPosts.filter(p => p.featuredImage).length;
console.log(`Posts with images: ${withImages}/${seedPosts.length}`);
