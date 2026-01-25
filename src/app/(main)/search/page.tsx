import Link from 'next/link'
import { Sidebar, SidebarWidget, SidebarAd } from '@/components/layout'
import { PostCard } from '@/components/posts'
import prisma from '@/lib/db'

// Search posts by query
async function searchPosts(query: string) {
  if (!query) return []

  try {
    const posts = await prisma.post.findMany({
      where: {
        status: 'PUBLISHED',
        OR: [
          { title: { contains: query, mode: 'insensitive' } },
          { excerpt: { contains: query, mode: 'insensitive' } },
          { content: { contains: query, mode: 'insensitive' } },
        ],
      },
      include: {
        categories: { take: 1 },
        author: { select: { name: true } },
      },
      orderBy: { publishedAt: 'desc' },
      take: 20,
    })
    return posts
  } catch (error) {
    console.error('Failed to search posts:', error)
    return []
  }
}

// Fetch popular posts for sidebar
async function getPopularPosts() {
  try {
    const posts = await prisma.post.findMany({
      where: { status: 'PUBLISHED' },
      orderBy: { viewCount: 'desc' },
      take: 5,
    })
    return posts
  } catch (error) {
    console.error('Failed to fetch popular posts:', error)
    return []
  }
}

// Fetch categories for sidebar
async function getCategories() {
  try {
    const categories = await prisma.category.findMany({
      include: {
        _count: { select: { posts: true } },
      },
      orderBy: { name: 'asc' },
    })
    return categories
  } catch (error) {
    console.error('Failed to fetch categories:', error)
    return []
  }
}

interface PageProps {
  searchParams: Promise<{ q?: string }>
}

export async function generateMetadata({ searchParams }: PageProps) {
  const { q } = await searchParams

  if (q) {
    return {
      title: `Hasil Pencarian: ${q}`,
      description: `Hasil pencarian untuk "${q}" di Kilas Indonesia`,
    }
  }

  return {
    title: 'Pencarian',
    description: 'Cari berita dan artikel di Kilas Indonesia',
  }
}

export default async function SearchPage({ searchParams }: PageProps) {
  const { q } = await searchParams
  const query = q?.trim() || ''

  // Fetch search results, popular posts, and categories in parallel
  const [searchResults, popularPosts, categories] = await Promise.all([
    searchPosts(query),
    getPopularPosts(),
    getCategories(),
  ])

  return (
    <div className="container py-6">
      <div className="flex flex-col lg:flex-row gap-6">
        {/* Main Content */}
        <div className="flex-1">
          {/* Breadcrumb */}
          <nav className="mb-4 text-sm">
            <ol className="flex items-center gap-2 text-gray-500">
              <li>
                <Link href="/" className="hover:text-red-600">
                  Beranda
                </Link>
              </li>
              <li>/</li>
              <li className="text-gray-700">Pencarian</li>
            </ol>
          </nav>

          {/* Search Form */}
          <div className="mb-6">
            <form action="/search" method="GET">
              <div className="flex gap-2">
                <input
                  type="text"
                  name="q"
                  defaultValue={query}
                  placeholder="Cari berita..."
                  className="flex-1 px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 text-lg"
                />
                <button
                  type="submit"
                  className="px-6 py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors flex items-center gap-2"
                >
                  <svg
                    className="w-5 h-5"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                    />
                  </svg>
                  Cari
                </button>
              </div>
            </form>
          </div>

          {/* Search Results */}
          {query ? (
            <>
              <header className="mb-6">
                <h1 className="text-xl font-bold text-gray-900">
                  Hasil Pencarian: &quot;{query}&quot;
                </h1>
                <p className="text-gray-600 mt-1">
                  Ditemukan {searchResults.length} hasil
                </p>
              </header>

              {searchResults.length > 0 ? (
                <div className="space-y-4">
                  {searchResults.map((post) => (
                    <PostCard
                      key={post.id}
                      id={post.id}
                      title={post.title}
                      slug={post.slug}
                      excerpt={post.excerpt}
                      featuredImage={post.featuredImage}
                      category={post.categories[0] || { name: 'Berita', slug: 'berita' }}
                      author={post.author}
                      publishedAt={post.publishedAt}
                      viewCount={post.viewCount}
                      variant="horizontal"
                    />
                  ))}
                </div>
              ) : (
                <div className="bg-white rounded-lg border border-gray-200 p-8 text-center">
                  <svg
                    className="w-16 h-16 mx-auto text-gray-300 mb-4"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={1.5}
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                    />
                  </svg>
                  <h3 className="text-lg font-semibold text-gray-700 mb-2">
                    Tidak Ditemukan
                  </h3>
                  <p className="text-gray-500 mb-4">
                    Tidak ada hasil yang cocok dengan pencarian &quot;{query}&quot;.
                  </p>
                  <p className="text-sm text-gray-400">
                    Coba gunakan kata kunci yang berbeda atau lebih umum.
                  </p>
                </div>
              )}
            </>
          ) : (
            <div className="bg-white rounded-lg border border-gray-200 p-8 text-center">
              <svg
                className="w-16 h-16 mx-auto text-gray-300 mb-4"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={1.5}
                  d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                />
              </svg>
              <h3 className="text-lg font-semibold text-gray-700 mb-2">
                Cari Berita
              </h3>
              <p className="text-gray-500">
                Masukkan kata kunci untuk mencari berita dan artikel.
              </p>
            </div>
          )}
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
