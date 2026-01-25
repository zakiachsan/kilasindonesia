import Link from 'next/link'
import { notFound } from 'next/navigation'
import { Sidebar, SidebarWidget, SidebarAd } from '@/components/layout'
import { PostCard } from '@/components/posts'
import prisma from '@/lib/db'

// ISR: Revalidate every 5 minutes
export const revalidate = 300

// Fetch category by slug
async function getCategory(slug: string) {
  try {
    const category = await prisma.category.findUnique({
      where: { slug },
      include: {
        _count: { select: { posts: true } },
      },
    })
    return category
  } catch (error) {
    console.error('Failed to fetch category:', error)
    return null
  }
}

// Fetch posts by category
async function getCategoryPosts(categoryId: string) {
  try {
    const posts = await prisma.post.findMany({
      where: {
        status: 'PUBLISHED',
        categories: {
          some: { id: categoryId },
        },
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
    console.error('Failed to fetch category posts:', error)
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

// Fetch all categories for sidebar
async function getAllCategories() {
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
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params
  const category = await getCategory(slug)

  if (!category) {
    return {
      title: 'Kategori Tidak Ditemukan',
    }
  }

  return {
    title: `${category.name} - Berita Terbaru`,
    description: category.description || `Berita terbaru tentang ${category.name}`,
    openGraph: {
      title: `${category.name} - Kilas Indonesia`,
      description: category.description || `Berita terbaru tentang ${category.name}`,
    },
  }
}

export default async function CategoryPage({ params }: PageProps) {
  const { slug } = await params
  const category = await getCategory(slug)

  if (!category) {
    notFound()
  }

  // Fetch posts, popular posts, and categories in parallel
  const [categoryPosts, popularPosts, allCategories] = await Promise.all([
    getCategoryPosts(category.id),
    getPopularPosts(),
    getAllCategories(),
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
              <li className="text-gray-700">{category.name}</li>
            </ol>
          </nav>

          {/* Category Header */}
          <header className="mb-6">
            <div className="bg-gradient-to-r from-red-600 to-red-700 rounded-lg p-6 text-white">
              <h1 className="text-2xl md:text-3xl font-bold mb-2">
                {category.name}
              </h1>
              {category.description && (
                <p className="text-red-100">{category.description}</p>
              )}
              <p className="text-sm text-red-200 mt-2">
                {category._count.posts} artikel
              </p>
            </div>
          </header>

          {/* Posts List */}
          {categoryPosts.length > 0 ? (
            <div className="space-y-4">
              {categoryPosts.map((post) => (
                <PostCard
                  key={post.id}
                  id={post.id}
                  title={post.title}
                  slug={post.slug}
                  excerpt={post.excerpt}
                  featuredImage={post.featuredImage}
                  category={post.categories[0] || { name: category.name, slug: category.slug }}
                  author={post.author}
                  publishedAt={post.publishedAt}
                  viewCount={post.viewCount}
                  variant="horizontal"
                />
              ))}

              {/* Load More Button - could be enhanced with pagination */}
              {categoryPosts.length >= 20 && (
                <div className="mt-6 text-center">
                  <button className="px-6 py-3 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors">
                    Muat Lebih Banyak
                  </button>
                </div>
              )}
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
                  d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z"
                />
              </svg>
              <h3 className="text-lg font-semibold text-gray-700 mb-2">
                Belum Ada Artikel
              </h3>
              <p className="text-gray-500">
                Belum ada artikel dalam kategori ini. Silakan cek kembali nanti.
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
          <SidebarWidget title="Kategori Lainnya">
            <ul className="space-y-2">
              {allCategories
                .filter((c) => c.slug !== slug)
                .map((cat) => (
                  <li key={cat.slug}>
                    <Link
                      href={`/category/${cat.slug}`}
                      className="flex items-center justify-between py-2 px-3 rounded hover:bg-gray-50 transition-colors"
                    >
                      <span className="text-sm text-gray-700">{cat.name}</span>
                      <span className="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded">
                        {cat._count.posts}
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
