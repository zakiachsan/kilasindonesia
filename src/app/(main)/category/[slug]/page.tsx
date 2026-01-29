import Link from 'next/link'
import { notFound } from 'next/navigation'
import { Sidebar, SidebarWidget, SidebarAd } from '@/components/layout'
import { PostCard } from '@/components/posts'
import prisma from '@/lib/db'
import {
  generateCollectionSchema,
  generateBreadcrumbSchema,
  getCanonicalUrl,
} from '@/lib/seo'

// Force dynamic rendering to fetch data at runtime
export const dynamic = 'force-dynamic'

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

  const title = `${category.name} - Berita Terbaru`
  const description = category.description || `Kumpulan berita terbaru tentang ${category.name} di Kilas Indonesia`
  const canonicalUrl = getCanonicalUrl(`/category/${slug}`)

  return {
    title,
    description,
    alternates: {
      canonical: canonicalUrl,
    },
    openGraph: {
      title: `${category.name} | Kilas Indonesia`,
      description,
      type: 'website',
      url: canonicalUrl,
      siteName: 'Kilas Indonesia',
      locale: 'id_ID',
    },
    twitter: {
      card: 'summary_large_image',
      title: `${category.name} | Kilas Indonesia`,
      description,
      site: '@kilasindonesia',
    },
    robots: {
      index: true,
      follow: true,
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

  // Generate JSON-LD schemas
  const collectionSchema = generateCollectionSchema(
    'category',
    category.name,
    category.slug,
    category.description,
    category._count.posts,
    categoryPosts.map((p) => ({ slug: p.slug, title: p.title }))
  )

  const breadcrumbSchema = generateBreadcrumbSchema([
    { name: 'Beranda', url: getCanonicalUrl('/') },
    { name: category.name, url: getCanonicalUrl(`/category/${category.slug}`) },
  ])

  return (
    <>
      {/* JSON-LD Structured Data */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(collectionSchema) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema) }}
      />

      <div className="container py-6">
        <div className="flex flex-col lg:flex-row gap-8">
          {/* Main Content */}
          <div className="flex-1 min-w-0">
            {/* Breadcrumb */}
            <nav className="mb-4 text-sm" aria-label="Breadcrumb">
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
                <li className="text-gray-900 font-medium">{category.name}</li>
              </ol>
            </nav>

            {/* Category Header */}
            <header className="mb-8">
              <div className="bg-gradient-to-r from-primary-600 to-primary-800 rounded-xl p-8 text-white relative overflow-hidden">
                {/* Background Pattern */}
                <div className="absolute inset-0 opacity-10">
                  <svg className="w-full h-full" viewBox="0 0 100 100" preserveAspectRatio="none">
                    <defs>
                      <pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse">
                        <path d="M 10 0 L 0 0 0 10" fill="none" stroke="white" strokeWidth="0.5" />
                      </pattern>
                    </defs>
                    <rect width="100" height="100" fill="url(#grid)" />
                  </svg>
                </div>

                <div className="relative">
                  <span className="inline-block px-3 py-1 bg-white/20 rounded-full text-sm font-medium mb-3">
                    Kategori
                  </span>
                  <h1 className="text-3xl md:text-4xl font-bold mb-3">
                    {category.name}
                  </h1>
                  {category.description && (
                    <p className="text-primary-100 text-lg max-w-2xl">{category.description}</p>
                  )}
                  <p className="text-sm text-primary-200 mt-4 flex items-center gap-2">
                    <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z" />
                    </svg>
                    {category._count.posts} artikel
                  </p>
                </div>
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

                {/* Load More Button */}
                {categoryPosts.length >= 20 && (
                  <div className="mt-8 text-center">
                    <button className="btn btn-primary">
                      Muat Lebih Banyak
                      <svg className="w-4 h-4 ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                      </svg>
                    </button>
                  </div>
                )}
              </div>
            ) : (
              <div className="bg-white rounded-xl border border-gray-200 p-12 text-center">
                <svg
                  className="w-20 h-20 mx-auto text-gray-300 mb-4"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth={1}
                    d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z"
                  />
                </svg>
                <h3 className="text-xl font-semibold text-gray-700 mb-2">
                  Belum Ada Artikel
                </h3>
                <p className="text-gray-500 mb-6">
                  Belum ada artikel dalam kategori ini. Silakan cek kembali nanti.
                </p>
                <Link href="/" className="btn btn-outline">
                  Kembali ke Beranda
                </Link>
              </div>
            )}
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
            <SidebarAd height={250} />

            {/* Categories Widget */}
            <SidebarWidget title="Kategori Lainnya">
              <ul className="space-y-1">
                {allCategories
                  .filter((c) => c.slug !== slug)
                  .map((cat) => (
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
            <SidebarAd height={300} />
          </Sidebar>
        </div>
      </div>
    </>
  )
}
