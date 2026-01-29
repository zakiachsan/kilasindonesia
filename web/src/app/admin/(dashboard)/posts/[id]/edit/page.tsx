import { notFound } from 'next/navigation'
import { prisma } from '@/lib/db'
import PostEditor from '../../components/PostEditor'

interface PageProps {
  params: Promise<{ id: string }>
}

async function getData(id: string) {
  try {
    const [post, categories, tags] = await Promise.all([
      prisma.post.findUnique({
        where: { id },
        include: {
          categories: { select: { id: true } },
          tags: { select: { id: true } },
        },
      }),
      prisma.category.findMany({ orderBy: { name: 'asc' } }),
      prisma.tag.findMany({ orderBy: { name: 'asc' } }),
    ])

    return { post, categories, tags }
  } catch (error) {
    console.error('Failed to fetch data:', error)
    return { post: null, categories: [], tags: [] }
  }
}

export default async function EditPostPage({ params }: PageProps) {
  const { id } = await params
  const { post, categories, tags } = await getData(id)

  if (!post) {
    notFound()
  }

  const postData = {
    id: post.id,
    title: post.title,
    slug: post.slug,
    content: post.content,
    excerpt: post.excerpt || '',
    featuredImage: post.featuredImage || '',
    status: post.status,
    categoryIds: post.categories.map((c) => c.id),
    tagIds: post.tags.map((t) => t.id),
    metaTitle: post.metaTitle || '',
    metaDescription: post.metaDescription || '',
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Edit Artikel</h1>
        <p className="text-sm text-gray-500 mt-1">
          {post.title}
        </p>
      </div>

      <PostEditor post={postData} categories={categories} tags={tags} isEdit />
    </div>
  )
}
