import Link from 'next/link'
import Image from 'next/image'
import { Sidebar, SidebarWidget, SidebarAd } from '@/components/layout'
import { prisma } from '@/lib/db'

// ISR: Revalidate every 5 minutes
export const revalidate = 300

async function getHomeData() {
  try {
    const [posts, popularPosts, categories] = await Promise.all([
      // Recent posts
      prisma.post.findMany({
        where: { status: 'PUBLISHED' },
        include: {
          categories: { take: 1 },
          author: { select: { name: true } },
        },
        orderBy: { publishedAt: 'desc' },
        take: 10,
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
    ])

    return { posts, popularPosts, categories }
  } catch (error) {
    console.error('Failed to fetch home data:', error)
    return { posts: [], popularPosts: [], categories: [] }
  }
}

function formatDate(date: Date | null): string {
  if (!date) return ''
  return new Date(date).toLocaleDateString('id-ID', {
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  })
}

export default async function HomePage() {
  const { posts, popularPosts, categories } = await getHomeData()

  const featuredPost = posts[0]
  const recentPosts = posts.slice(1)

  return (
    <div className="container py-6">
      <div className="flex flex-col lg:flex-row gap-6">
        {/* Main Content */}
        <div className="flex-1">
          {/* Featured Post */}
          {featuredPost && (
            <section className="mb-8">
              <Link href={`/${featuredPost.slug}`} className="block">
                <div className="bg-white rounded-lg overflow-hidden shadow-sm border border-gray-200 group">
                  <div className="aspect-video relative bg-gradient-to-br from-gray-200 to-gray-300">
                    {featuredPost.featuredImage ? (
                      <Image
                        src={featuredPost.featuredImage}
                        alt={featuredPost.title}
                        fill
                        className="object-cover"
                        priority
                      />
                    ) : (
                      <div className="absolute inset-0 bg-gradient-to-br from-red-600 to-red-800" />
                    )}
                    <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent" />
                    <div className="absolute bottom-0 left-0 right-0 p-6 text-white">
                      {featuredPost.categories[0] && (
                        <span className="category-badge mb-3 inline-block">
                          {featuredPost.categories[0].name}
                        </span>
                      )}
                      <h1 className="text-2xl md:text-3xl font-bold mb-2 group-hover:text-red-300 transition-colors">
                        {featuredPost.title}
                      </h1>
                      {featuredPost.excerpt && (
                        <p className="text-gray-300 line-clamp-2 max-w-2xl">
                          {featuredPost.excerpt}
                        </p>
                      )}
                      <div className="mt-3 text-sm text-gray-400">
                        {formatDate(featuredPost.publishedAt)}
                      </div>
                    </div>
                  </div>
                </div>
              </Link>
            </section>
          )}

          {/* Recent News */}
          <section>
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-xl font-bold text-gray-900 flex items-center gap-2">
                <span className="w-1 h-6 bg-red-600 rounded"></span>
                Berita Terkini
              </h2>
              <Link
                href="/category/berita"
                className="text-sm text-red-600 hover:text-red-700 font-medium"
              >
                Lihat Semua →
              </Link>
            </div>

            <div className="space-y-4">
              {recentPosts.map((post) => (
                <article
                  key={post.id}
                  className="post-card bg-white rounded-lg border border-gray-200 overflow-hidden"
                >
                  <div className="flex flex-col sm:flex-row">
                    {/* Thumbnail */}
                    <Link
                      href={`/${post.slug}`}
                      className="sm:w-48 h-32 sm:h-auto relative bg-gradient-to-br from-gray-200 to-gray-300 flex-shrink-0"
                    >
                      {post.featuredImage ? (
                        <Image
                          src={post.featuredImage}
                          alt={post.title}
                          fill
                          className="object-cover"
                        />
                      ) : (
                        <div className="absolute inset-0 flex items-center justify-center">
                          <svg
                            className="w-10 h-10 text-gray-400"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                          >
                            <path
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              strokeWidth={1.5}
                              d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"
                            />
                          </svg>
                        </div>
                      )}
                    </Link>

                    {/* Content */}
                    <div className="flex-1 p-4">
                      <div className="flex items-center gap-2 mb-2">
                        {post.categories[0] && (
                          <Link
                            href={`/category/${post.categories[0].slug}`}
                            className="category-badge"
                          >
                            {post.categories[0].name}
                          </Link>
                        )}
                        <span className="text-xs text-gray-500">
                          {formatDate(post.publishedAt)}
                        </span>
                      </div>

                      <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2 hover:text-red-600 transition-colors">
                        <Link href={`/${post.slug}`}>{post.title}</Link>
                      </h3>

                      {post.excerpt && (
                        <p className="text-sm text-gray-600 line-clamp-2">
                          {post.excerpt}
                        </p>
                      )}

                      <div className="mt-3 flex items-center gap-4 text-xs text-gray-500">
                        <span className="flex items-center gap-1">
                          <svg
                            className="w-4 h-4"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                          >
                            <path
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              strokeWidth={2}
                              d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                            />
                            <path
                              strokeLinecap="round"
                              strokeLinejoin="round"
                              strokeWidth={2}
                              d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                            />
                          </svg>
                          {post.viewCount.toLocaleString('id-ID')} views
                        </span>
                      </div>
                    </div>
                  </div>
                </article>
              ))}
            </div>

            {posts.length === 0 && (
              <div className="bg-white rounded-lg border border-gray-200 p-8 text-center">
                <p className="text-gray-500">Belum ada artikel</p>
              </div>
            )}
          </section>
        </div>

        {/* Sidebar */}
        <Sidebar>
          {/* Popular Posts Widget */}
          <SidebarWidget title="Berita Populer">
            <div className="space-y-4">
              {popularPosts.map((post, index) => (
                <div key={post.id} className="flex gap-3">
                  <span className="flex-shrink-0 w-8 h-8 bg-red-600 text-white rounded flex items-center justify-center font-bold text-sm">
                    {index + 1}
                  </span>
                  <div className="flex-1 min-w-0">
                    <h4 className="text-sm font-medium text-gray-900 line-clamp-2 hover:text-red-600 transition-colors">
                      <Link href={`/${post.slug}`}>{post.title}</Link>
                    </h4>
                    <p className="text-xs text-gray-500 mt-1">
                      {post.viewCount.toLocaleString('id-ID')} views
                    </p>
                  </div>
                </div>
              ))}
              {popularPosts.length === 0 && (
                <p className="text-sm text-gray-500">Belum ada data</p>
              )}
            </div>
          </SidebarWidget>

          {/* Ad Placeholder */}
          <SidebarAd height={250} />

          {/* Categories Widget */}
          <SidebarWidget title="Kategori">
            <ul className="space-y-2">
              {categories.map((category) => (
                <li key={category.slug}>
                  <Link
                    href={`/category/${category.slug}`}
                    className="flex items-center justify-between py-2 px-3 rounded hover:bg-gray-50 transition-colors"
                  >
                    <span className="text-sm text-gray-700">{category.name}</span>
                    <span className="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded">
                      {category._count.posts}
                    </span>
                  </Link>
                </li>
              ))}
            </ul>
          </SidebarWidget>

          {/* Another Ad */}
          <SidebarAd height={300} />
        </Sidebar>
      </div>
    </div>
  )
}
