import Link from 'next/link'
import { Sidebar, SidebarWidget } from '@/components/layout'
import { BannerAd } from '@/components/ads'
import { PostCard } from '@/components/posts'
import { db, pages, eq, desc } from '@/db'
import { getCanonicalUrl } from '@/lib/seo'
import { notFound } from 'next/navigation'

// Force dynamic rendering
export const dynamic = 'force-dynamic'

// Fetch about page content
async function getAboutPage() {
  try {
    const [page] = await db
      .select()
      .from(pages)
      .where(eq(pages.slug, 'tentang-kami'))
      .limit(1)
    return page
  } catch (error) {
    console.error('Failed to fetch about page:', error)
    return null
  }
}

// Fetch popular posts
async function getPopularPosts() {
  try {
    const { posts } = await import('@/db')
    const { eq, desc, sql } = await import('drizzle-orm')
    
    const sevenDaysAgo = new Date()
    sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7)

    return await db
      .select()
      .from(posts)
      .where(eq(posts.status, 'PUBLISHED'))
      .orderBy(desc(posts.viewCount))
      .limit(5)
  } catch (error) {
    console.error('Failed to fetch popular posts:', error)
    return []
  }
}

// Fetch categories
async function getCategories() {
  try {
    const { categories, postCategories, posts } = await import('@/db')
    const { eq, asc, count } = await import('drizzle-orm')

    const allCats = await db
      .select()
      .from(categories)
      .orderBy(asc(categories.name))

    return Promise.all(allCats.map(async (cat) => {
      const [result] = await db
        .select({ count: count() })
        .from(postCategories)
        .innerJoin(posts, eq(postCategories.postId, posts.id))
        .where(eq(posts.status, 'PUBLISHED'))
      return { ...cat, _count: { posts: result?.count || 0 } }
    }))
  } catch (error) {
    console.error('Failed to fetch categories:', error)
    return []
  }
}

export async function generateMetadata() {
  const page = await getAboutPage()
  
  const title = page?.seoTitle || 'Tentang Kami - Kilas Indonesia'
  const description = page?.seoDescription || 'Kilas Indonesia adalah portal berita yang menyajikan informasi terkini, akurat, dan terpercaya seputar pendidikan Islam, madrasah, pesantren, dan berbagai topik menarik lainnya.'
  const canonicalUrl = getCanonicalUrl('/tentang-kami')

  return {
    title,
    description,
    alternates: {
      canonical: canonicalUrl,
    },
    openGraph: {
      title: `${title} | Kilas Indonesia`,
      description,
      type: 'website',
      url: canonicalUrl,
      siteName: 'Kilas Indonesia',
      locale: 'id_ID',
    },
    twitter: {
      card: 'summary_large_image',
      title: `${title} | Kilas Indonesia`,
      description,
      site: '@kilasindonesia',
    },
    robots: {
      index: true,
      follow: true,
    },
  }
}

export default async function AboutPage() {
  const page = await getAboutPage()
  
  if (!page) {
    notFound()
  }

  const popularPosts = await getPopularPosts()
  const categories = await getCategories()

  return (
    <>
      {/* Hero Section */}
      <div className="bg-gradient-to-r from-primary-800 to-primary-900 text-white py-16">
        <div className="container">
          <h1 className="text-4xl md:text-5xl font-bold mb-4">
            {page.title}
          </h1>
          {page.excerpt && (
            <p className="text-lg text-gray-300 max-w-3xl">
              {page.excerpt}
            </p>
          )}
        </div>
      </div>

      <div className="container py-12">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Main Content */}
          <div className="flex-1 min-w-0">
            {/* Breadcrumb */}
            <nav className="mb-6 text-sm" aria-label="Breadcrumb">
              <ol className="flex items-center gap-2 text-gray-500">
                <li>
                  <Link href="/" className="hover:text-primary-600 transition-colors">
                    Beranda
                  </Link>
                </li>
                <li>
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </li>
                <li className="text-gray-900 font-medium">Tentang Kami</li>
              </ol>
            </nav>

            {/* Featured Image */}
            {page.featuredImage && (
              <div className="mb-8">
                <img
                  src={page.featuredImage}
                  alt={page.title}
                  className="w-full h-64 md:h-96 object-cover rounded-xl"
                />
              </div>
            )}

            {/* Content */}
            <article 
              className="prose prose-lg max-w-none"
              dangerouslySetInnerHTML={{ __html: page.content }}
            />
          </div>

          {/* Sidebar */}
          <Sidebar>
            {/* Popular Posts Widget */}
            <SidebarWidget title="Berita Populer">
              <div className="space-y-4">
                {popularPosts.map((post, index) => (
                  <PostCard
                    key={post.id}
                    id={post.id}
                    title={post.title}
                    slug={post.slug}
                    featuredImage={post.featuredImage}
                    publishedAt={post.publishedAt}
                    viewCount={post.viewCount}
                    variant="compact"
                    index={index}
                  />
                ))}
              </div>
            </SidebarWidget>

            {/* Ad Placeholder */}
            <BannerAd slot="sidebar-1" />

            {/* Categories Widget */}
            <SidebarWidget title="Kategori">
              <ul className="space-y-1">
                {categories.map((cat) => (
                  <li key={cat.slug}>
                    <Link
                      href={`/category/${cat.slug}`}
                      className="flex items-center justify-between py-2.5 px-3 rounded-lg hover:bg-primary-50 text-gray-700 hover:text-primary-700 transition-colors group"
                    >
                      <span className="text-sm font-medium">{cat.name}</span>
                      <span className="text-xs bg-gray-100 group-hover:bg-primary-100 text-gray-600 group-hover:text-primary-700 px-2 py-1 rounded-full transition-colors">
                        {cat._count.posts}
                      </span>
                    </Link>
                  </li>
                ))}
              </ul>
            </SidebarWidget>

            {/* Another Ad */}
            <BannerAd slot="sidebar-2" />
          </Sidebar>
        </div>
      </div>
    </>
  )
}
