import { db, pages, eq } from '@/db'
import { auth } from '@/lib/auth'
import { redirect } from 'next/navigation'
import Link from 'next/link'
import PageEditor from '../components/PageEditor'

export const dynamic = 'force-dynamic'

// Fetch page by ID
async function getPage(id: string) {
  try {
    const [page] = await db.select().from(pages).where(eq(pages.id, id)).limit(1)
    return page
  } catch (error) {
    console.error('Failed to fetch page:', error)
    return null
  }
}

export default async function EditPageRoute({ params }: { params: Promise<{ id: string }> }) {
  const resolvedParams = await params
  const session = await auth()
  const page = await getPage(resolvedParams.id)

  if (!page) {
    redirect('/admin/pages')
  }

  if (!session?.user || session.user.role !== 'ADMIN') {
    redirect('/admin/auth/signin')
  }

  return (
    <div className="p-4">
      <div className="flex items-center justify-between mb-4">
        <h1 className="text-xl font-bold">Edit Halaman</h1>
        <Link
          href="/admin/pages"
          className="text-gray-600 hover:text-gray-900 text-sm"
        >
          ← Kembali
        </Link>
      </div>

      <PageEditor
        page={{
          id: page.id,
          title: page.title,
          slug: page.slug,
          content: page.content,
          excerpt: page.excerpt || '',
          featuredImage: page.featuredImage || '',
          seoTitle: page.seoTitle || '',
          seoDescription: page.seoDescription || '',
          publish: !!page.publishedAt,
        }}
        isEdit
      />
    </div>
  )
}
