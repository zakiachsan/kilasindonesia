import * as fs from 'fs'
import * as path from 'path'

// Generate seed data from extracted WordPress JSON
const INPUT_FILE = path.join(__dirname, '../extracted-wp-data.json')
const OUTPUT_FILE = path.join(__dirname, '../src/db/seed-data.ts')

// Map WordPress categories to KilasIndonesia categories
const CATEGORY_MAP: Record<string, string> = {
  'berita': 'nasional',
  'pendidikan': 'edukasi',
  'edukasi': 'edukasi',
  'lingkungan': 'nasional',
  'budaya': 'nasional',
  'politik': 'nasional',
  'hiburan': 'nasional',
}

// KilasIndonesia categories
const CATEGORIES = [
  { name: 'Nasional', slug: 'nasional', description: 'Berita nasional terkini' },
  { name: 'Madrasah', slug: 'madrasah', description: 'Berita seputar madrasah di Indonesia' },
  { name: 'Pesantren', slug: 'pesantren', description: 'Berita seputar pesantren dan santri' },
  { name: 'Perguruan Tinggi', slug: 'perguruan-tinggi', description: 'Berita seputar perguruan tinggi keagamaan' },
  { name: 'Opini', slug: 'opini', description: 'Opini dan pandangan' },
  { name: 'Tokoh', slug: 'tokoh', description: 'Profil tokoh pendidikan dan keagamaan' },
  { name: 'Edukasi', slug: 'edukasi', description: 'Berita pendidikan umum' },
]

interface ExtractedPost {
  id: number
  title: string
  slug: string
  content: string
  excerpt: string
  featuredImage: string | null
  categorySlug: string
  tagSlugs: string[]
  publishedAt: string
  viewCount: number
}

interface ExtractedData {
  posts: ExtractedPost[]
  tags: { name: string; slug: string }[]
  categories: { name: string; slug: string }[]
}

function escapeString(s: string): string {
  return s
    .replace(/\\/g, '\\\\')
    .replace(/'/g, "\\'")
    .replace(/"/g, '\\"')
    .replace(/\n/g, '\\n')
    .replace(/\r/g, '\\r')
    .replace(/\t/g, '\\t')
}

async function main() {
  console.log('📖 Reading extracted data...')
  const data: ExtractedData = JSON.parse(fs.readFileSync(INPUT_FILE, 'utf-8'))

  console.log(`   Found ${data.posts.length} posts, ${data.tags.length} tags`)

  // Collect unique tags from posts
  const usedTags = new Set<string>()
  data.posts.forEach(p => p.tagSlugs.forEach(t => usedTags.add(t)))
  const tags = data.tags.filter(t => usedTags.has(t.slug))

  console.log(`   Using ${tags.length} tags`)

  // Generate TypeScript code
  let output = `// Auto-generated seed data from WordPress backup
// Generated on ${new Date().toISOString()}

export const categoriesData = ${JSON.stringify(CATEGORIES, null, 2)};

export const tagsData = ${JSON.stringify(tags, null, 2)};

export const postsData = [
`

  data.posts.forEach((post, index) => {
    const mappedCategory = CATEGORY_MAP[post.categorySlug] || 'nasional'
    const date = new Date(post.publishedAt.replace(' ', 'T') + '.000Z')

    output += `  {
    title: "${escapeString(post.title)}",
    slug: "${escapeString(post.slug)}",
    content: \`${post.content.replace(/`/g, '\\`').replace(/\$\{/g, '\\${')}\`,
    excerpt: "${escapeString(post.excerpt)}",
    featuredImage: ${post.featuredImage ? `"${post.featuredImage}"` : 'null'},
    categorySlug: '${mappedCategory}',
    tagSlugs: ${JSON.stringify(post.tagSlugs)},
    publishedAt: new Date('${date.toISOString()}'),
    viewCount: ${post.viewCount},
  },\n`
  })

  output += `];
`

  console.log('💾 Writing output file...')
  fs.writeFileSync(OUTPUT_FILE, output)
  console.log(`   Saved to: ${OUTPUT_FILE}`)
}

main().catch(console.error)
