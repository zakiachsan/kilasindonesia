import { db, posts, categories, postCategories, eq, and, gte, desc } from '@/db'

const BASE_URL = process.env.NEXT_PUBLIC_APP_URL || 'https://kilasindonesia.com'
const SITE_NAME = 'Kilas Indonesia'

export async function GET() {
  try {
    // Google News requires articles from the last 48 hours
    const twoDaysAgo = new Date(Date.now() - 48 * 60 * 60 * 1000)

    // Get recent published posts
    const recentPosts = await db
      .select({
        id: posts.id,
        slug: posts.slug,
        title: posts.title,
        publishedAt: posts.publishedAt,
      })
      .from(posts)
      .where(
        and(
          eq(posts.status, 'PUBLISHED'),
          gte(posts.publishedAt, twoDaysAgo)
        )
      )
      .orderBy(desc(posts.publishedAt))
      .limit(1000)

    // Build news sitemap XML
    const urls = recentPosts.map((post) => {
      const postUrl = `${BASE_URL}/${post.slug}`
      const pubDate = post.publishedAt
        ? new Date(post.publishedAt).toISOString().split('T')[0]
        : new Date().toISOString().split('T')[0]

      return `  <url>
    <loc>${postUrl}</loc>
    <news:news>
      <news:publication>
        <news:name>${SITE_NAME}</news:name>
        <news:language>id</news:language>
      </news:publication>
      <news:publication_date>${pubDate}</news:publication_date>
      <news:title>${escapeXml(post.title)}</news:title>
    </news:news>
  </url>`
    })

    const xml = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:news="http://www.google.com/schemas/sitemap-news/0.9">
${urls.join('\n')}
</urlset>`

    return new Response(xml, {
      headers: {
        'Content-Type': 'application/xml; charset=utf-8',
        'Cache-Control': 'public, max-age=3600, s-maxage=3600',
      },
    })
  } catch (error) {
    console.error('Error generating news sitemap:', error)
    return new Response(
      `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:news="http://www.google.com/schemas/sitemap-news/0.9">
</urlset>`,
      {
        headers: {
          'Content-Type': 'application/xml; charset=utf-8',
        },
      }
    )
  }
}

function escapeXml(unsafe: string): string {
  return unsafe
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}
