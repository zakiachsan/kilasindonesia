import { prisma } from '@/lib/db'
import CategoriesManager from './components/CategoriesManager'

async function getCategories() {
  try {
    const categories = await prisma.category.findMany({
      include: {
        _count: {
          select: { posts: true },
        },
      },
      orderBy: { name: 'asc' },
    })
    return categories.map((cat) => ({
      ...cat,
      postCount: cat._count.posts,
    }))
  } catch (error) {
    console.error('Failed to fetch categories:', error)
    return []
  }
}

export default async function CategoriesPage() {
  const categories = await getCategories()

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Kategori</h1>
        <p className="text-sm text-gray-500 mt-1">
          Kelola kategori artikel
        </p>
      </div>

      <CategoriesManager initialCategories={categories} />
    </div>
  )
}
