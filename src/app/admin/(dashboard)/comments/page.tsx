import Link from 'next/link'
import { prisma } from '@/lib/db'
import CommentsTable from './components/CommentsTable'

interface PageProps {
  searchParams: Promise<{ status?: string; page?: string }>
}

async function getComments(status?: string, page = 1) {
  const limit = 20
  const skip = (page - 1) * limit

  try {
    const where: { status?: 'PENDING' | 'APPROVED' | 'REJECTED' } = {}

    if (status && ['PENDING', 'APPROVED', 'REJECTED'].includes(status.toUpperCase())) {
      where.status = status.toUpperCase() as 'PENDING' | 'APPROVED' | 'REJECTED'
    }

    const [comments, total, pendingCount] = await Promise.all([
      prisma.comment.findMany({
        where,
        include: {
          post: { select: { title: true, slug: true } },
        },
        orderBy: { createdAt: 'desc' },
        skip,
        take: limit,
      }),
      prisma.comment.count({ where }),
      prisma.comment.count({ where: { status: 'PENDING' } }),
    ])

    return {
      comments,
      total,
      totalPages: Math.ceil(total / limit),
      currentPage: page,
      pendingCount,
    }
  } catch (error) {
    console.error('Failed to fetch comments:', error)
    return { comments: [], total: 0, totalPages: 0, currentPage: 1, pendingCount: 0 }
  }
}

export default async function CommentsPage({ searchParams }: PageProps) {
  const params = await searchParams
  const status = params.status
  const page = parseInt(params.page || '1')

  const { comments, total, totalPages, currentPage, pendingCount } = await getComments(status, page)

  const statusTabs = [
    { name: 'Semua', value: '', count: null },
    { name: 'Pending', value: 'pending', count: pendingCount },
    { name: 'Disetujui', value: 'approved', count: null },
    { name: 'Ditolak', value: 'rejected', count: null },
  ]

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Komentar</h1>
        <p className="text-sm text-gray-500 mt-1">
          Moderasi komentar dari pengunjung
        </p>
      </div>

      <div className="bg-white rounded-lg shadow-sm border border-gray-200">
        {/* Status Tabs */}
        <div className="border-b border-gray-200">
          <nav className="flex -mb-px">
            {statusTabs.map((tab) => {
              const isActive = (status || '') === tab.value
              const href = tab.value
                ? `/admin/comments?status=${tab.value}`
                : '/admin/comments'

              return (
                <Link
                  key={tab.value}
                  href={href}
                  className={`px-6 py-3 text-sm font-medium border-b-2 transition-colors flex items-center gap-2 ${
                    isActive
                      ? 'border-red-600 text-red-600'
                      : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
                  }`}
                >
                  {tab.name}
                  {tab.count !== null && tab.count > 0 && (
                    <span className="px-2 py-0.5 bg-red-100 text-red-700 text-xs rounded-full">
                      {tab.count}
                    </span>
                  )}
                </Link>
              )
            })}
          </nav>
        </div>

        <div className="p-4 border-b border-gray-200 text-sm text-gray-500">
          {total} komentar ditemukan
        </div>

        <CommentsTable comments={comments} />

        {/* Pagination */}
        {totalPages > 1 && (
          <div className="p-4 border-t border-gray-200 flex items-center justify-between">
            <div className="text-sm text-gray-500">
              Halaman {currentPage} dari {totalPages}
            </div>
            <div className="flex gap-2">
              {currentPage > 1 && (
                <Link
                  href={`/admin/comments?page=${currentPage - 1}${status ? `&status=${status}` : ''}`}
                  className="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 text-sm"
                >
                  Sebelumnya
                </Link>
              )}
              {currentPage < totalPages && (
                <Link
                  href={`/admin/comments?page=${currentPage + 1}${status ? `&status=${status}` : ''}`}
                  className="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 text-sm"
                >
                  Selanjutnya
                </Link>
              )}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}
