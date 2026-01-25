import { prisma } from '@/lib/db'
import PostEditor from '../components/PostEditor'

async function getData() {
  try {
    const [categories, tags] = await Promise.all([
      prisma.category.findMany({ orderBy: { name: 'asc' } }),
      prisma.tag.findMany({ orderBy: { name: 'asc' } }),
    ])
    return { categories, tags }
  } catch (error) {
    console.error('Failed to fetch data:', error)
    return { categories: [], tags: [] }
  }
}

export default async function NewPostPage() {
  const { categories, tags } = await getData()

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Artikel Baru</h1>
        <p className="text-sm text-gray-500 mt-1">
          Buat artikel baru untuk website
        </p>
      </div>

      <PostEditor categories={categories} tags={tags} />
    </div>
  )
}
