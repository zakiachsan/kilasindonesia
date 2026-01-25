import Link from 'next/link'
import { notFound } from 'next/navigation'
import { Sidebar, SidebarWidget, SidebarAd } from '@/components/layout'
import { PostCard } from '@/components/posts'
import prisma from '@/lib/db'

// ISR: Revalidate every 5 minutes
export const revalidate = 300

// Fetch tag by slug
async function getTag(slug: string) {
  try {
    const tag = await prisma.tag.findUnique({
      where: { slug },
      include: {
        _count: { select: { posts: true } },
      },
    })
    return tag
  } catch (error) {
    console.error('Failed to fetch tag:', error)
    return null
  }
}

// Fetch posts by tag
async function getTagPosts(tagId: string) {
  try {
    const posts = await prisma.post.findMany({
      where: {
        status: 'PUBLISHED',
        tags: {
          some: { id: tagId },
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
    console.error('Failed to fetch tag posts:', error)
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

// Fetch all tags for sidebar
async function getAllTags() {
  try {
    const tags = await prisma.tag.findMany({
      include: {
        _count: { select: { posts: true } },
      },
      orderBy: { name: 'asc' },
    })
    return tags
  } catch (error) {
    console.error('Failed to fetch tags:', error)
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
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params
  const tag = await getTag(slug)

  if (!tag) {
    return {
      title: 'Tag Tidak Ditemukan',
    }
  }

  return {
    title: `Tag: ${tag.name} - Berita Terbaru`,
    description: `Kumpulan artikel dengan tag ${tag.name}`,
    openGraph: {
      title: `Tag: ${tag.name} - Kilas Indonesia`,
      description: `Kumpulan artikel dengan tag ${tag.name}`,
    },
  }
}

export default async function TagPage({ params }: PageProps) {
  const { slug } = await params
  const tag = await getTag(slug)

  if (!tag) {
    notFound()
  }

  // Fetch posts, popular posts, tags, and categories in parallel
  const [tagPosts, popularPosts, allTags, categories] = await Promise.all([
    getTagPosts(tag.id),
    getPopularPosts(),
    getAllTags(),
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
              <li>Tag</li>
              <li>/</li>
              <li className="text-gray-700">{tag.name}</li>
            </ol>
          </nav>

          {/* Tag Header */}
          <header className="mb-6">
            <div className="bg-gray-100 rounded-lg p-6 border border-gray-200">
              <div className="flex items-center gap-3 mb-2">
                <span className="text-2xl text-gray-400">#</span>
                <h1 className="text-2xl md:text-3xl font-bold text-gray-900">
                  {tag.name}
                </h1>
              </div>
              <p className="text-gray-600">
                {tag._count.posts} artikel dengan tag ini
              </p>
            </div>
          </header>

          {/* Posts List */}
          {tagPosts.length > 0 ? (
            <div className="space-y-4">
              {tagPosts.map((post) => (
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

              {/* Load More Button - could be enhanced with pagination */}
              {tagPosts.length >= 20 && (
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
                  d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"
                />
              </svg>
              <h3 className="text-lg font-semibold text-gray-700 mb-2">
                Belum Ada Artikel
              </h3>
              <p className="text-gray-500">
                Belum ada artikel dengan tag ini. Silakan cek kembali nanti.
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

          {/* Tag Cloud Widget */}
          <SidebarWidget title="Tag Populer">
            <div className="flex flex-wrap gap-2">
              {allTags.slice(0, 20).map((t) => (
                <Link
                  key={t.slug}
                  href={`/tag/${t.slug}`}
                  className={`px-3 py-1 text-sm rounded-full transition-colors ${
                    t.slug === slug
                      ? 'bg-red-600 text-white'
                      : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
                  }`}
                >
                  #{t.name}
                </Link>
              ))}
            </div>
          </SidebarWidget>

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
