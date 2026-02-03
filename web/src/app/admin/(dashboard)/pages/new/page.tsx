import { auth } from '@/lib/auth'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import PageEditor from '../components/PageEditor'

export const dynamic = 'force-dynamic'

export default async function NewPageRoute() {
  const session = await auth()

  if (!session?.user || session.user.role !== 'ADMIN') {
    redirect('/admin/auth/signin')
  }

  return (
    <div className="p-4">
      <div className="flex items-center justify-between mb-4">
        <h1 className="text-xl font-bold">Halaman Baru</h1>
        <Link
          href="/admin/pages"
          className="text-gray-600 hover:text-gray-900 text-sm"
        >
          ← Kembali
        </Link>
      </div>

      <PageEditor />
    </div>
  )
}
