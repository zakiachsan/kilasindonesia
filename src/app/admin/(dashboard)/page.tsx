import Link from 'next/link'
import { prisma } from '@/lib/db'

async function getStats() {
  try {
    const [
      totalPosts,
      publishedPosts,
      draftPosts,
      totalCategories,
      totalComments,
      pendingComments,
    ] = await Promise.all([
      prisma.post.count(),
      prisma.post.count({ where: { status: 'PUBLISHED' } }),
      prisma.post.count({ where: { status: 'DRAFT' } }),
      prisma.category.count(),
      prisma.comment.count(),
      prisma.comment.count({ where: { status: 'PENDING' } }),
    ])

    return {
      totalPosts,
      publishedPosts,
      draftPosts,
      totalCategories,
      totalComments,
      pendingComments,
    }
  } catch (error) {
    console.error('Failed to fetch stats:', error)
    return {
      totalPosts: 0,
      publishedPosts: 0,
      draftPosts: 0,
      totalCategories: 0,
      totalComments: 0,
      pendingComments: 0,
    }
  }
}

async function getRecentPosts() {
  try {
    return await prisma.post.findMany({
      take: 5,
      orderBy: { createdAt: 'desc' },
      include: {
        author: { select: { name: true } },
        categories: { select: { name: true }, take: 1 },
      },
    })
  } catch (error) {
    console.error('Failed to fetch recent posts:', error)
    return []
  }
}

async function getRecentComments() {
  try {
    return await prisma.comment.findMany({
      take: 5,
      orderBy: { createdAt: 'desc' },
      include: {
        post: { select: { title: true, slug: true } },
      },
    })
  } catch (error) {
    console.error('Failed to fetch recent comments:', error)
    return []
  }
}

export default async function AdminDashboard() {
  const [stats, recentPosts, recentComments] = await Promise.all([
    getStats(),
    getRecentPosts(),
    getRecentComments(),
  ])

  const statCards = [
    {
      name: 'Total Artikel',
      value: stats.totalPosts,
      icon: (
        <svg className="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z" />
        </svg>
      ),
      color: 'bg-blue-500',
      href: '/admin/posts',
    },
    {
      name: 'Dipublikasi',
      value: stats.publishedPosts,
      icon: (
        <svg className="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
      ),
      color: 'bg-green-500',
      href: '/admin/posts?status=published',
    },
    {
      name: 'Draft',
      value: stats.draftPosts,
      icon: (
        <svg className="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
        </svg>
      ),
      color: 'bg-yellow-500',
      href: '/admin/posts?status=draft',
    },
    {
      name: 'Komentar Pending',
      value: stats.pendingComments,
      icon: (
        <svg className="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
        </svg>
      ),
      color: 'bg-red-500',
      href: '/admin/comments?status=pending',
    },
  ]

  return (
    <div className="space-y-6">
      {/* Page Title */}
      <div className="flex items-center justify-between">
        <h1 className="text-2xl font-bold text-gray-900">Dashboard</h1>
        <Link
          href="/admin/posts/new"
          className="px-4 py-2 bg-red-600 text-white font-medium rounded-lg hover:bg-red-700 transition-colors flex items-center gap-2"
        >
          <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
          </svg>
          Artikel Baru
        </Link>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {statCards.map((stat) => (
          <Link
            key={stat.name}
            href={stat.href}
            className="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow"
          >
            <div className="flex items-center gap-4">
              <div className={`${stat.color} text-white p-3 rounded-lg`}>
                {stat.icon}
              </div>
              <div>
                <p className="text-sm text-gray-500">{stat.name}</p>
                <p className="text-2xl font-bold text-gray-900">{stat.value}</p>
              </div>
            </div>
          </Link>
        ))}
      </div>

      {/* Recent Content Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Recent Posts */}
        <div className="bg-white rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center justify-between p-4 border-b border-gray-200">
            <h2 className="font-semibold text-gray-900">Artikel Terbaru</h2>
            <Link href="/admin/posts" className="text-sm text-red-600 hover:text-red-700">
              Lihat Semua →
            </Link>
          </div>
          <div className="divide-y divide-gray-100">
            {recentPosts.length === 0 ? (
              <div className="p-6 text-center text-gray-500">
                Belum ada artikel
              </div>
            ) : (
              recentPosts.map((post) => (
                <div key={post.id} className="p-4 hover:bg-gray-50">
                  <div className="flex items-start justify-between gap-4">
                    <div className="flex-1 min-w-0">
                      <h3 className="font-medium text-gray-900 truncate">
                        {post.title}
                      </h3>
                      <p className="text-sm text-gray-500 mt-1">
                        {post.author.name} •{' '}
                        {new Date(post.createdAt).toLocaleDateString('id-ID')}
                      </p>
                    </div>
                    <span
                      className={`px-2 py-1 text-xs rounded ${
                        post.status === 'PUBLISHED'
                          ? 'bg-green-100 text-green-700'
                          : post.status === 'DRAFT'
                          ? 'bg-yellow-100 text-yellow-700'
                          : 'bg-gray-100 text-gray-700'
                      }`}
                    >
                      {post.status === 'PUBLISHED'
                        ? 'Publik'
                        : post.status === 'DRAFT'
                        ? 'Draft'
                        : 'Arsip'}
                    </span>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>

        {/* Recent Comments */}
        <div className="bg-white rounded-lg shadow-sm border border-gray-200">
          <div className="flex items-center justify-between p-4 border-b border-gray-200">
            <h2 className="font-semibold text-gray-900">Komentar Terbaru</h2>
            <Link href="/admin/comments" className="text-sm text-red-600 hover:text-red-700">
              Lihat Semua →
            </Link>
          </div>
          <div className="divide-y divide-gray-100">
            {recentComments.length === 0 ? (
              <div className="p-6 text-center text-gray-500">
                Belum ada komentar
              </div>
            ) : (
              recentComments.map((comment) => (
                <div key={comment.id} className="p-4 hover:bg-gray-50">
                  <div className="flex items-start gap-3">
                    <div className="w-8 h-8 bg-gray-200 rounded-full flex items-center justify-center flex-shrink-0">
                      <span className="text-gray-600 text-sm font-medium">
                        {comment.authorName.charAt(0).toUpperCase()}
                      </span>
                    </div>
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2">
                        <span className="font-medium text-gray-900 text-sm">
                          {comment.authorName}
                        </span>
                        <span
                          className={`px-1.5 py-0.5 text-xs rounded ${
                            comment.status === 'APPROVED'
                              ? 'bg-green-100 text-green-700'
                              : comment.status === 'PENDING'
                              ? 'bg-yellow-100 text-yellow-700'
                              : 'bg-red-100 text-red-700'
                          }`}
                        >
                          {comment.status === 'APPROVED'
                            ? 'OK'
                            : comment.status === 'PENDING'
                            ? 'Pending'
                            : 'Ditolak'}
                        </span>
                      </div>
                      <p className="text-sm text-gray-600 line-clamp-2 mt-1">
                        {comment.content}
                      </p>
                      <p className="text-xs text-gray-400 mt-1">
                        pada &quot;{comment.post.title.substring(0, 30)}...&quot;
                      </p>
                    </div>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
