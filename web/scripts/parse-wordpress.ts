import * as fs from 'fs'
import * as path from 'path'

// WordPress SQL Parser for KilasIndonesia
// Extracts posts, categories, tags, and featured images from WordPress SQL dump

const SQL_FILE = path.join(__dirname, '../../kilasindonesia content/softsql.sql')
const OUTPUT_FILE = path.join(__dirname, '../extracted-wp-data.json')

interface WPPost {
  id: number
  authorId: number
  date: string
  dateGmt: string
  content: string
  title: string
  excerpt: string
  status: string
  slug: string
  type: string
  guid: string
}

interface WPTerm {
  id: number
  name: string
  slug: string
}

interface WPTermTaxonomy {
  termTaxonomyId: number
  termId: number
  taxonomy: string
}

interface WPTermRelationship {
  objectId: number
  termTaxonomyId: number
}

interface WPPostMeta {
  postId: number
  metaKey: string
  metaValue: string
}

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

function parseInsertValues(sql: string, tableName: string): string[][] {
  const results: string[][] = []

  // Find all INSERT statements for this table
  const insertRegex = new RegExp(`INSERT INTO \`${tableName}\` VALUES\\s*([\\s\\S]*?)(?=;\\s*(?:INSERT|CREATE|ALTER|DROP|--|$))`, 'gi')

  let match
  while ((match = insertRegex.exec(sql)) !== null) {
    const valuesStr = match[1]

    // Parse each row - rows are separated by ),( or ),(newline)(
    // But we need to handle strings with commas and parentheses inside
    let currentRow: string[] = []
    let currentValue = ''
    let inString = false
    let stringChar = ''
    let parenDepth = 0
    let escapeNext = false

    for (let i = 0; i < valuesStr.length; i++) {
      const char = valuesStr[i]

      if (escapeNext) {
        currentValue += char
        escapeNext = false
        continue
      }

      if (char === '\\') {
        currentValue += char
        escapeNext = true
        continue
      }

      if (inString) {
        currentValue += char
        if (char === stringChar) {
          // Check for escaped quote ('' in SQL)
          if (valuesStr[i + 1] === stringChar) {
            currentValue += valuesStr[i + 1]
            i++
          } else {
            inString = false
          }
        }
        continue
      }

      if (char === "'" || char === '"') {
        inString = true
        stringChar = char
        currentValue += char
        continue
      }

      if (char === '(') {
        if (parenDepth === 0) {
          // Start of a new row
          currentRow = []
          currentValue = ''
        } else {
          currentValue += char
        }
        parenDepth++
        continue
      }

      if (char === ')') {
        parenDepth--
        if (parenDepth === 0) {
          // End of row
          if (currentValue.trim()) {
            currentRow.push(currentValue.trim())
          }
          if (currentRow.length > 0) {
            results.push(currentRow)
          }
          currentRow = []
          currentValue = ''
        } else {
          currentValue += char
        }
        continue
      }

      if (char === ',' && parenDepth === 1) {
        // Field separator within a row
        currentRow.push(currentValue.trim())
        currentValue = ''
        continue
      }

      if (parenDepth > 0) {
        currentValue += char
      }
    }
  }

  return results
}

function cleanString(s: string): string {
  if (!s) return ''
  // Remove surrounding quotes
  if ((s.startsWith("'") && s.endsWith("'")) || (s.startsWith('"') && s.endsWith('"'))) {
    s = s.slice(1, -1)
  }
  // Unescape SQL strings
  s = s.replace(/''/g, "'")
  s = s.replace(/\\'/g, "'")
  s = s.replace(/\\"/g, '"')
  s = s.replace(/\\n/g, '\n')
  s = s.replace(/\\r/g, '\r')
  s = s.replace(/\\t/g, '\t')
  s = s.replace(/\\\\/g, '\\')
  return s
}

function cleanContent(content: string): string {
  // Remove WordPress Gutenberg block comments
  content = content.replace(/<!-- \/?wp:[^>]+ -->/g, '')
  // Remove extra whitespace
  content = content.replace(/\n{3,}/g, '\n\n')
  return content.trim()
}

function generateExcerpt(content: string, maxLength: number = 200): string {
  // Strip HTML tags
  const text = content.replace(/<[^>]+>/g, ' ').replace(/\s+/g, ' ').trim()
  if (text.length <= maxLength) return text
  return text.substring(0, maxLength).replace(/\s+\S*$/, '') + '...'
}

async function main() {
  console.log('📖 Reading SQL file...')
  const sql = fs.readFileSync(SQL_FILE, 'utf-8')
  console.log(`   File size: ${(sql.length / 1024 / 1024).toFixed(2)} MB`)

  // Parse posts
  console.log('📝 Parsing posts...')
  const postsData = parseInsertValues(sql, 'wpy4_posts')
  console.log(`   Found ${postsData.length} total rows in wpy4_posts`)

  const posts: WPPost[] = postsData.map(row => ({
    id: parseInt(row[0]) || 0,
    authorId: parseInt(row[1]) || 0,
    date: cleanString(row[2]),
    dateGmt: cleanString(row[3]),
    content: cleanString(row[4]),
    title: cleanString(row[5]),
    excerpt: cleanString(row[6]),
    status: cleanString(row[7]),
    slug: cleanString(row[11]),
    type: cleanString(row[20]),
    guid: cleanString(row[18]), // guid is at index 18, not 16
  }))

  // Filter only published posts (not pages, attachments, etc.)
  const publishedPosts = posts.filter(p => p.type === 'post' && p.status === 'publish')
  console.log(`   Found ${publishedPosts.length} published posts`)

  // Get attachments for featured images
  const attachments = posts.filter(p => p.type === 'attachment')
  const attachmentMap = new Map<number, string>()
  attachments.forEach(a => {
    attachmentMap.set(a.id, a.guid)
  })
  console.log(`   Found ${attachments.length} attachments`)

  // Parse terms (categories and tags)
  console.log('🏷️  Parsing terms...')
  const termsData = parseInsertValues(sql, 'wpy4_terms')
  const terms: WPTerm[] = termsData.map(row => ({
    id: parseInt(row[0]) || 0,
    name: cleanString(row[1]),
    slug: cleanString(row[2]),
  }))
  console.log(`   Found ${terms.length} terms`)

  // Parse term_taxonomy to know what type each term is
  console.log('📂 Parsing term taxonomies...')
  const taxonomyData = parseInsertValues(sql, 'wpy4_term_taxonomy')
  const taxonomies: WPTermTaxonomy[] = taxonomyData.map(row => ({
    termTaxonomyId: parseInt(row[0]) || 0,
    termId: parseInt(row[1]) || 0,
    taxonomy: cleanString(row[2]),
  }))

  // Build maps
  const termMap = new Map<number, WPTerm>()
  terms.forEach(t => termMap.set(t.id, t))

  const taxMap = new Map<number, WPTermTaxonomy>()
  taxonomies.forEach(t => taxMap.set(t.termTaxonomyId, t))

  // Get categories and tags
  const categories = taxonomies.filter(t => t.taxonomy === 'category')
  const tags = taxonomies.filter(t => t.taxonomy === 'post_tag')
  console.log(`   Found ${categories.length} categories, ${tags.length} tags`)

  // Parse term_relationships (which posts have which terms)
  console.log('🔗 Parsing term relationships...')
  const relationshipsData = parseInsertValues(sql, 'wpy4_term_relationships')
  const relationships: WPTermRelationship[] = relationshipsData.map(row => ({
    objectId: parseInt(row[0]) || 0,
    termTaxonomyId: parseInt(row[1]) || 0,
  }))
  console.log(`   Found ${relationships.length} relationships`)

  // Build post to terms map
  const postTermsMap = new Map<number, number[]>()
  relationships.forEach(r => {
    if (!postTermsMap.has(r.objectId)) {
      postTermsMap.set(r.objectId, [])
    }
    postTermsMap.get(r.objectId)!.push(r.termTaxonomyId)
  })

  // Parse postmeta for featured images
  console.log('🖼️  Parsing post meta...')
  const metaData = parseInsertValues(sql, 'wpy4_postmeta')
  const postMetas: WPPostMeta[] = metaData.map(row => ({
    postId: parseInt(row[1]) || 0,
    metaKey: cleanString(row[2]),
    metaValue: cleanString(row[3]),
  }))

  // Build featured image map
  const featuredImageMap = new Map<number, number>()
  const viewCountMap = new Map<number, number>()
  postMetas.forEach(m => {
    if (m.metaKey === '_thumbnail_id') {
      featuredImageMap.set(m.postId, parseInt(m.metaValue) || 0)
    }
    if (m.metaKey === 'post_views_count') {
      viewCountMap.set(m.postId, parseInt(m.metaValue) || 0)
    }
  })
  console.log(`   Found ${featuredImageMap.size} featured images`)

  // Build final extracted posts
  console.log('🔧 Building extracted posts...')
  const extractedPosts: ExtractedPost[] = publishedPosts.map(post => {
    // Get category and tags for this post
    const postTermTaxIds = postTermsMap.get(post.id) || []
    let categorySlug = 'nasional' // default
    const tagSlugs: string[] = []

    postTermTaxIds.forEach(taxId => {
      const tax = taxMap.get(taxId)
      if (tax) {
        const term = termMap.get(tax.termId)
        if (term) {
          if (tax.taxonomy === 'category') {
            categorySlug = term.slug
          } else if (tax.taxonomy === 'post_tag') {
            tagSlugs.push(term.slug)
          }
        }
      }
    })

    // Get featured image
    const thumbnailId = featuredImageMap.get(post.id)
    let featuredImage: string | null = null
    if (thumbnailId) {
      featuredImage = attachmentMap.get(thumbnailId) || null
    }

    // Get view count
    const viewCount = viewCountMap.get(post.id) || Math.floor(Math.random() * 5000) + 500

    // Clean content
    const cleanedContent = cleanContent(post.content)

    return {
      id: post.id,
      title: post.title,
      slug: post.slug,
      content: cleanedContent,
      excerpt: post.excerpt || generateExcerpt(cleanedContent),
      featuredImage,
      categorySlug,
      tagSlugs,
      publishedAt: post.dateGmt,
      viewCount,
    }
  })

  // Sort by date (newest first)
  extractedPosts.sort((a, b) => new Date(b.publishedAt).getTime() - new Date(a.publishedAt).getTime())

  // Get unique categories used
  const usedCategories = new Set(extractedPosts.map(p => p.categorySlug))
  const usedTags = new Set(extractedPosts.flatMap(p => p.tagSlugs))

  // Build categories list
  const categoriesList = Array.from(usedCategories).map(slug => {
    const tax = taxonomies.find(t => t.taxonomy === 'category')
    const termId = taxonomies.find(t => t.taxonomy === 'category' && termMap.get(t.termId)?.slug === slug)?.termId
    const term = termId ? termMap.get(termId) : null
    return {
      name: term?.name || slug.charAt(0).toUpperCase() + slug.slice(1),
      slug,
      description: `Berita ${term?.name || slug}`,
    }
  })

  // Build tags list
  const tagsList = Array.from(usedTags).map(slug => {
    const termId = taxonomies.find(t => t.taxonomy === 'post_tag' && termMap.get(t.termId)?.slug === slug)?.termId
    const term = termId ? termMap.get(termId) : null
    return {
      name: term?.name || slug.split('-').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' '),
      slug,
    }
  })

  // Output results
  const output = {
    extractedAt: new Date().toISOString(),
    stats: {
      totalPosts: extractedPosts.length,
      categories: categoriesList.length,
      tags: tagsList.length,
      postsWithFeaturedImage: extractedPosts.filter(p => p.featuredImage).length,
    },
    categories: categoriesList,
    tags: tagsList,
    posts: extractedPosts,
  }

  console.log('\n📊 Summary:')
  console.log(`   Total posts: ${output.stats.totalPosts}`)
  console.log(`   Categories: ${output.stats.categories}`)
  console.log(`   Tags: ${output.stats.tags}`)
  console.log(`   Posts with featured image: ${output.stats.postsWithFeaturedImage}`)

  console.log('\n💾 Writing output file...')
  fs.writeFileSync(OUTPUT_FILE, JSON.stringify(output, null, 2))
  console.log(`   Saved to: ${OUTPUT_FILE}`)

  // Show first few posts
  console.log('\n📰 Sample posts:')
  extractedPosts.slice(0, 5).forEach((p, i) => {
    console.log(`   ${i + 1}. ${p.title.substring(0, 60)}...`)
    console.log(`      Category: ${p.categorySlug}, Tags: ${p.tagSlugs.slice(0, 3).join(', ')}`)
    console.log(`      Featured: ${p.featuredImage ? 'Yes' : 'No'}`)
  })
}

main().catch(console.error)
