import Link from 'next/link'
import { BannerAd } from '@/components/ads'
import { PostCard } from '@/components/posts'
import { prisma } from '@/lib/db'

// Force dynamic rendering to fetch data at runtime (not build time)
// This ensures the page always gets fresh data from the database
export const dynamic = 'force-dynamic'

async function getHomeData() {
  try {
    const [posts, popularPosts, categories, trendingPosts] = await Promise.all([
      // Recent posts - get more for better layout
      prisma.post.findMany({
        where: { status: 'PUBLISHED' },
        include: {
          categories: { take: 1 },
          author: { select: { name: true } },
        },
        orderBy: { publishedAt: 'desc' },
        take: 13,
      }),
      // Popular posts by view count
      prisma.post.findMany({
        where: { status: 'PUBLISHED' },
        include: {
          categories: { take: 1 },
        },
        orderBy: { viewCount: 'desc' },
        take: 5,
      }),
      // Categories with post count
      prisma.category.findMany({
        include: {
          _count: { select: { posts: true } },
        },
        orderBy: { name: 'asc' },
      }),
      // Trending posts (most viewed in recent time)
      prisma.post.findMany({
        where: {
          status: 'PUBLISHED',
          publishedAt: {
            gte: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000), // Last 7 days
          },
        },
        include: {
          categories: { take: 1 },
        },
        orderBy: { viewCount: 'desc' },
        take: 4,
      }),
    ])

    return { posts, popularPosts, categories, trendingPosts }
  } catch (error) {
    console.error('Failed to fetch home data:', error)
    return { posts: [], popularPosts: [], categories: [], trendingPosts: [] }
  }
}

export default async function HomePage() {
  const { posts, popularPosts, categories, trendingPosts } = await getHomeData()

  const featuredPost = posts[0]
  const secondaryPosts = posts.slice(1, 4)
  const recentPosts = posts.slice(5)

  return (
    <div className="min-h-screen">
      {/* Top Banner Ad */}
      <div className="container py-4">
        <div className="flex justify-center">
          <BannerAd slot="header" width={970} height={250} />
        </div>
      </div>

      {/* Featured Article - Full Width like Detik */}
      <section className="container mb-6">
        {featuredPost && (
          <PostCard
            id={featuredPost.id}
            title={featuredPost.title}
            slug={featuredPost.slug}
            excerpt={featuredPost.excerpt}
            featuredImage={featuredPost.featuredImage}
            category={featuredPost.categories[0]}
            publishedAt={featuredPost.publishedAt}
            variant="featured"
          />
        )}
      </section>

      {/* Berita untuk Anda Section - Simple header like Detik */}
      <section className="container mb-8">
        <h2 className="text-xl font-bold text-primary-600 mb-4">
          Berita untuk Anda
        </h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {secondaryPosts.map((post) => (
            <PostCard
              key={post.id}
              id={post.id}
              title={post.title}
              slug={post.slug}
              featuredImage={post.featuredImage}
              category={post.categories[0]}
              publishedAt={post.publishedAt}
              variant="default"
            />
          ))}
          {/* Add one more post if available */}
          {posts[4] && (
            <PostCard
              id={posts[4].id}
              title={posts[4].title}
              slug={posts[4].slug}
              featuredImage={posts[4].featuredImage}
              category={posts[4].categories[0]}
              publishedAt={posts[4].publishedAt}
              variant="default"
            />
          )}
        </div>
      </section>

      <div className="container pb-8">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Main Content */}
          <div className="flex-1 min-w-0">
            {/* Trending Section */}
            {trendingPosts.length > 0 && (
              <section className="mb-8">
                <h2 className="text-xl font-bold text-primary-600 mb-4">
                  Trending Minggu Ini
                </h2>
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  {trendingPosts.map((post) => (
                    <PostCard
                      key={post.id}
                      id={post.id}
                      title={post.title}
                      slug={post.slug}
                      featuredImage={post.featuredImage}
                      category={post.categories[0]}
                      publishedAt={post.publishedAt}
                      variant="default"
                    />
                  ))}
                </div>
              </section>
            )}

            {/* Recent News Section */}
            <section>
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-xl font-bold text-primary-600">
                  Berita Terbaru
                </h2>
                <Link href="/category/nasional" className="text-primary-600 hover:text-primary-700 text-sm font-medium flex items-center gap-1">
                  Lihat Semua
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </Link>
              </div>

              {recentPosts.length > 0 ? (
                <div className="space-y-4">
                  {recentPosts.map((post) => (
                    <PostCard
                      key={post.id}
                      id={post.id}
                      title={post.title}
                      slug={post.slug}
                      excerpt={post.excerpt}
                      featuredImage={post.featuredImage}
                      category={post.categories[0]}
                      publishedAt={post.publishedAt}
                      variant="horizontal"
                    />
                  ))}
                </div>
              ) : (
                <div className="py-12 text-center bg-white rounded-xl border border-gray-200">
                  <svg className="w-16 h-16 mx-auto text-gray-300 mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z" />
                  </svg>
                  <p className="text-gray-500">Belum ada artikel</p>
                </div>
              )}

              {/* Load More Button */}
              {recentPosts.length > 0 && (
                <div className="mt-6 text-center">
                  <Link href="/category/nasional" className="btn btn-primary">
                    Lihat Semua Berita
                    <svg className="w-4 h-4 ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 8l4 4m0 0l-4 4m4-4H3" />
                    </svg>
                  </Link>
                </div>
              )}
            </section>
          </div>

          {/* Sidebar */}
          <aside className="w-full lg:w-80 flex-shrink-0">
            <div className="sticky top-16 space-y-6">
              {/* Popular Posts Widget */}
              <div className="widget-card">
                <div className="widget-header">
                  <h3>
                    <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                      <path d="M12 7a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0V8.414l-4.293 4.293a1 1 0 01-1.414 0L8 10.414l-4.293 4.293a1 1 0 01-1.414-1.414l5-5a1 1 0 011.414 0L11 10.586 14.586 7H12z" />
                    </svg>
                    Berita Terpopuler
                  </h3>
                </div>
                <div className="p-4">
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
                    {popularPosts.length === 0 && (
                      <p className="text-sm text-gray-500 text-center py-4">Belum ada data</p>
                    )}
                  </div>
                </div>
              </div>

              {/* Sidebar Ad */}
              <BannerAd slot="sidebar" width={300} height={250} />

              {/* Categories Widget */}
              <div className="widget-card">
                <div className="widget-header">
                  <h3>
                    <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z" />
                    </svg>
                    Kategori
                  </h3>
                </div>
                <div className="p-4">
                  <ul className="space-y-1">
                    {categories.map((category) => (
                      <li key={category.slug}>
                        <Link
                          href={`/category/${category.slug}`}
                          className="flex items-center justify-between py-2.5 px-3 rounded-lg hover:bg-primary-50 text-gray-700 hover:text-primary-700 transition-colors group"
                        >
                          <span className="text-sm font-medium">{category.name}</span>
                          <span className="text-xs bg-gray-100 group-hover:bg-primary-100 text-gray-600 group-hover:text-primary-700 px-2 py-1 rounded-full transition-colors">
                            {category._count.posts}
                          </span>
                        </Link>
                      </li>
                    ))}
                  </ul>
                </div>
              </div>

              {/* Newsletter CTA */}
              <div className="bg-gradient-to-br from-primary-600 to-primary-800 rounded-xl p-6 text-white">
                <h3 className="font-bold text-lg mb-2">Berlangganan Newsletter</h3>
                <p className="text-primary-100 text-sm mb-4">
                  Dapatkan berita terbaru langsung ke inbox Anda.
                </p>
                <form className="space-y-3">
                  <input
                    type="email"
                    placeholder="Email Anda"
                    className="w-full px-4 py-2.5 rounded-lg bg-white/10 border border-white/20 text-white placeholder-white/60 focus:outline-none focus:ring-2 focus:ring-white/50"
                  />
                  <button
                    type="submit"
                    className="w-full px-4 py-2.5 bg-accent-500 hover:bg-accent-600 text-white font-medium rounded-lg transition-colors"
                  >
                    Berlangganan
                  </button>
                </form>
              </div>

              {/* Another Sidebar Ad */}
              <BannerAd slot="sidebar" width={300} height={250} />
            </div>
          </aside>
        </div>
      </div>
    </div>
  )
}
