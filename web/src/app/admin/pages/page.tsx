import { db, pages, eq } from '@/db'
import { auth } from '@/lib/auth'
import { redirect } from 'next/navigation'
import Link from 'next/link'

export const dynamic = 'force-dynamic'

// Fetch all pages
async function getPages() {
  try {
    return await db.select().from(pages).orderBy(pages.createdAt)
  } catch (error) {
    console.error('Failed to fetch pages:', error)
    return []
  }
}

export default async function PagesAdmin() {
  const session = await auth()
  
  if (!session?.user || session.user.role !== 'ADMIN') {
    redirect('/admin/auth/signin')
  }

  const pagesList = await getPages()

  return (
    <div className="p-6">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold">Halaman Statis</h1>
        <Link
          href="/admin/pages/new"
          className="bg-primary-600 text-white px-4 py-2 rounded-lg hover:bg-primary-700"
        >
          + Halaman Baru
        </Link>
      </div>

      {pagesList.length === 0 ? (
        <div className="bg-white rounded-lg border p-6 text-center text-gray-500">
          <p>Belum ada halaman. Klik tombol di atas untuk membuat halaman baru.</p>
        </div>
      ) : (
        <div className="bg-white rounded-lg border overflow-hidden">
          <table className="w-full">
            <thead className="bg-gray-50 border-b">
              <tr>
                <th className="text-left p-4 font-medium">Judul</th>
                <th className="text-left p-4 font-medium">Slug</th>
                <th className="text-left p-4 font-medium">Status</th>
                <th className="text-left p-4 font-medium">Tanggal</th>
                <th className="text-left p-4 font-medium">Aksi</th>
              </tr>
            </thead>
            <tbody>
              {pagesList.map((page) => (
                <tr key={page.id} className="border-b hover:bg-gray-50">
                  <td className="p-4">
                    <Link
                      href={`/tentang-kami`}
                      className="text-primary-600 hover:underline"
                      target="_blank"
                    >
                      {page.title}
                    </Link>
                  </td>
                  <td className="p-4 text-gray-500">/{page.slug}</td>
                  <td className="p-4">
                    {page.publishedAt ? (
                      <span className="bg-green-100 text-green-800 px-2 py-1 rounded text-sm">
                        Dipublish
                      </span>
                    ) : (
                      <span className="bg-gray-100 text-gray-800 px-2 py-1 rounded text-sm">
                        Draft
                      </span>
                    )}
                  </td>
                  <td className="p-4 text-gray-500">
                    {page.createdAt.toLocaleDateString('id-ID')}
                  </td>
                  <td className="p-4">
                    <Link
                      href={`/admin/pages/${page.id}/edit`}
                      className="text-primary-600 hover:underline mr-4"
                    >
                      Edit
                    </Link>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
