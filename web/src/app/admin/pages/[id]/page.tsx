import { db, pages, eq } from '@/db'
import { auth } from '@/lib/auth'
import { redirect } from 'next/navigation'
import Link from 'next/link'

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

// Update page action
async function updatePage(formData: FormData) {
  'use server'
  
  const id = formData.get('id') as string
  const title = formData.get('title') as string
  const slug = formData.get('slug') as string
  const content = formData.get('content') as string
  const excerpt = formData.get('excerpt') as string
  const featuredImage = formData.get('featuredImage') as string
  const seoTitle = formData.get('seoTitle') as string
  const seoDescription = formData.get('seoDescription') as string
  const publish = formData.get('publish') === 'true'
  
  await db.update(pages)
    .set({
      title,
      slug,
      content,
      excerpt: excerpt || null,
      featuredImage: featuredImage || null,
      seoTitle: seoTitle || null,
      seoDescription: seoDescription || null,
      publishedAt: publish ? new Date() : null,
      updatedAt: new Date(),
    })
    .where(eq(pages.id, id))
  
  redirect('/admin/pages')
}

export default async function EditPage({ params }: { params: Promise<{ id: string }> }) {
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
    <div className="p-6 max-w-4xl">
      <div className="flex items-center justify-between mb-6">
        <h1 className="text-2xl font-bold">Edit Halaman</h1>
        <Link
          href="/admin/pages"
          className="text-gray-600 hover:text-gray-900"
        >
          ← Kembali
        </Link>
      </div>

      <form action={updatePage} className="space-y-6">
        <input type="hidden" name="id" value={page.id} />

        <div className="bg-white rounded-lg border p-6">
          <h2 className="font-medium mb-4">Informasi Dasar</h2>
          
          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Judul Halaman *
              </label>
              <input
                type="text"
                name="title"
                defaultValue={page.title}
                required
                className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Slug *
              </label>
              <div className="flex items-center">
                <span className="px-3 py-2 bg-gray-100 border border-r-0 rounded-l-lg text-gray-500">
                  /
                </span>
                <input
                  type="text"
                  name="slug"
                  defaultValue={page.slug}
                  required
                  className="flex-1 px-3 py-2 border rounded-r-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Excerpt
              </label>
              <textarea
                name="excerpt"
                defaultValue={page.excerpt || ''}
                rows={2}
                className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                URL Gambar Utama
              </label>
              <input
                type="url"
                name="featuredImage"
                defaultValue={page.featuredImage || ''}
                placeholder="https://example.com/image.jpg"
                className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
              />
            </div>
          </div>
        </div>

        <div className="bg-white rounded-lg border p-6">
          <h2 className="font-medium mb-4">Konten Halaman</h2>
          
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Konten (HTML)
            </label>
            <textarea
              name="content"
              defaultValue={page.content}
              rows={15}
              className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500 font-mono text-sm"
              placeholder="<p>Konten halaman...</p>"
            />
            <p className="text-sm text-gray-500 mt-1">
              Supports HTML tags: h2, h3, p, ul, li, a, b, i, etc.
            </p>
          </div>
        </div>

        <div className="bg-white rounded-lg border p-6">
          <h2 className="font-medium mb-4">SEO</h2>
          
          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                SEO Title
              </label>
              <input
                type="text"
                name="seoTitle"
                defaultValue={page.seoTitle || ''}
                className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
              />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                SEO Description
              </label>
              <textarea
                name="seoDescription"
                defaultValue={page.seoDescription || ''}
                rows={2}
                className="w-full px-3 py-2 border rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
              />
            </div>
          </div>
        </div>

        <div className="flex items-center justify-between bg-white rounded-lg border p-6">
          <div className="flex items-center">
            <input
              type="checkbox"
              name="publish"
              value="true"
              id="publish"
              defaultChecked={!!page.publishedAt}
              className="mr-2"
            />
            <label htmlFor="publish" className="text-sm">
              Publish halaman ini
            </label>
          </div>

          <div className="flex gap-4">
            <Link
              href="/admin/pages"
              className="px-4 py-2 border rounded-lg hover:bg-gray-50"
            >
              Batal
            </Link>
            <button
              type="submit"
              className="px-4 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700"
            >
              Simpan Perubahan
            </button>
          </div>
        </div>
      </form>
    </div>
  )
}
