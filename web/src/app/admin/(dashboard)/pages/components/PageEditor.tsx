'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import Link from 'next/link'
import dynamic from 'next/dynamic'

const RichTextEditor = dynamic(
  () => import('@/components/admin/RichTextEditor'),
  { ssr: false, loading: () => <div className="h-[400px] bg-gray-100 animate-pulse rounded-lg" /> }
)

interface PageData {
  id?: string
  title: string
  slug: string
  content: string
  excerpt: string
  featuredImage: string
  seoTitle: string
  seoDescription: string
  publish: boolean
}

interface PageEditorProps {
  page?: PageData
  isEdit?: boolean
}

function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .trim()
}

export default function PageEditor({ page, isEdit = false }: PageEditorProps) {
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const [formData, setFormData] = useState<PageData>({
    title: page?.title || '',
    slug: page?.slug || '',
    content: page?.content || '',
    excerpt: page?.excerpt || '',
    featuredImage: page?.featuredImage || '',
    seoTitle: page?.seoTitle || '',
    seoDescription: page?.seoDescription || '',
    publish: page?.publish ?? false,
  })

  const [autoSlug, setAutoSlug] = useState(!isEdit)
  const [autoSeoTitle, setAutoSeoTitle] = useState(!isEdit)

  function handleTitleChange(title: string) {
    setFormData((prev) => ({
      ...prev,
      title,
      slug: autoSlug ? slugify(title) : prev.slug,
      seoTitle: autoSeoTitle ? title : prev.seoTitle,
    }))
  }

  function handleSlugChange(slug: string) {
    setAutoSlug(false)
    setFormData((prev) => ({ ...prev, slug: slugify(slug) }))
  }

  function handleContentChange(content: string) {
    setFormData((prev) => ({ ...prev, content }))
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError('')
    setLoading(true)

    try {
      const url = isEdit ? `/api/admin/pages/${page?.id}` : '/api/admin/pages'
      const method = isEdit ? 'PUT' : 'POST'

      const res = await fetch(url, {
        method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(formData),
      })

      const data = await res.json()

      if (!res.ok) {
        throw new Error(data.error || 'Gagal menyimpan halaman')
      }

      router.push('/admin/pages')
      router.refresh()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Gagal menyimpan halaman')
    } finally {
      setLoading(false)
    }
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      {error && (
        <div className="bg-red-50 border border-red-200 text-red-700 px-3 py-2 rounded-md text-sm">
          {error}
        </div>
      )}

      <div className="flex flex-col lg:flex-row gap-4">
        {/* Main Content */}
        <div className="flex-1 space-y-4">
          {/* Title & Slug */}
          <div className="bg-white rounded-md shadow-sm border border-gray-200 p-4">
            <div className="space-y-3">
              <div>
                <label htmlFor="title" className="block text-xs font-medium text-gray-700 mb-1">
                  Judul Halaman
                </label>
                <input
                  type="text"
                  id="title"
                  value={formData.title}
                  onChange={(e) => handleTitleChange(e.target.value)}
                  required
                  className="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
                  placeholder="Masukkan judul halaman"
                />
              </div>

              <div>
                <label htmlFor="slug" className="block text-xs font-medium text-gray-700 mb-1">
                  Slug (URL)
                </label>
                <div className="flex items-center">
                  <span className="text-gray-500 text-xs mr-2">kilasindonesia.com/</span>
                  <input
                    type="text"
                    id="slug"
                    value={formData.slug}
                    onChange={(e) => handleSlugChange(e.target.value)}
                    required
                    className="flex-1 px-2 py-1.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-xs"
                  />
                </div>
              </div>
            </div>
          </div>

          {/* Content */}
          <div className="bg-white rounded-md shadow-sm border border-gray-200 p-4">
            <label className="block text-xs font-medium text-gray-700 mb-1.5">
              Konten Halaman
            </label>
            <RichTextEditor
              content={formData.content}
              onChange={handleContentChange}
              placeholder="Tulis konten halaman..."
            />
          </div>

          {/* Excerpt */}
          <div className="bg-white rounded-md shadow-sm border border-gray-200 p-4">
            <label htmlFor="excerpt" className="block text-xs font-medium text-gray-700 mb-1.5">
              Ringkasan
            </label>
            <textarea
              id="excerpt"
              value={formData.excerpt}
              onChange={(e) => setFormData((prev) => ({ ...prev, excerpt: e.target.value }))}
              rows={2}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
              placeholder="Ringkasan singkat halaman (opsional)"
            />
          </div>

          {/* SEO */}
          <div className="bg-white rounded-md shadow-sm border border-gray-200 p-4">
            <h3 className="font-medium text-gray-900 text-sm mb-3">SEO Settings</h3>
            <div className="space-y-3">
              <div>
                <label htmlFor="seoTitle" className="block text-xs font-medium text-gray-700 mb-1">
                  SEO Title
                </label>
                <input
                  type="text"
                  id="seoTitle"
                  value={formData.seoTitle}
                  onChange={(e) => {
                    setAutoSeoTitle(false)
                    setFormData((prev) => ({ ...prev, seoTitle: e.target.value }))
                  }}
                  className="w-full px-2 py-1.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
                  placeholder="Otomatis dari judul halaman"
                />
              </div>
              <div>
                <label htmlFor="seoDescription" className="block text-xs font-medium text-gray-700 mb-1">
                  SEO Description
                </label>
                <textarea
                  id="seoDescription"
                  value={formData.seoDescription}
                  onChange={(e) => setFormData((prev) => ({ ...prev, seoDescription: e.target.value }))}
                  rows={2}
                  className="w-full px-2 py-1.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
                  placeholder="Deskripsi untuk mesin pencari"
                />
              </div>
            </div>
          </div>
        </div>

        {/* Sidebar */}
        <div className="lg:w-72 space-y-4">
          {/* Publish Box */}
          <div className="bg-white rounded-md shadow-sm border border-gray-200 p-4">
            <h3 className="font-medium text-gray-900 text-sm mb-3">Publikasi</h3>
            <div className="space-y-3">
              <label className="flex items-center gap-2 cursor-pointer">
                <input
                  type="checkbox"
                  checked={formData.publish}
                  onChange={(e) => setFormData((prev) => ({ ...prev, publish: e.target.checked }))}
                  className="w-4 h-4 text-red-600 border-gray-300 rounded focus:ring-red-500"
                />
                <span className="text-sm text-gray-700">Publish halaman ini</span>
              </label>

              <div className="pt-3 border-t border-gray-200 flex gap-2">
                <button
                  type="submit"
                  disabled={loading}
                  className="flex-1 px-3 py-1.5 bg-red-600 text-white text-sm font-medium rounded-md hover:bg-red-700 transition-colors disabled:bg-red-400"
                >
                  {loading ? 'Menyimpan...' : isEdit ? 'Update' : 'Simpan'}
                </button>
                <Link
                  href="/admin/pages"
                  className="px-3 py-1.5 border border-gray-300 text-gray-700 text-sm rounded-md hover:bg-gray-50"
                >
                  Batal
                </Link>
              </div>
            </div>
          </div>

          {/* Featured Image */}
          <div className="bg-white rounded-md shadow-sm border border-gray-200 p-4">
            <h3 className="font-medium text-gray-900 text-sm mb-3">Gambar Utama</h3>
            <div className="space-y-2">
              <input
                type="text"
                value={formData.featuredImage}
                onChange={(e) => setFormData((prev) => ({ ...prev, featuredImage: e.target.value }))}
                className="w-full px-2 py-1.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-xs"
                placeholder="URL gambar (opsional)"
              />

              {formData.featuredImage && (
                <div className="relative mt-2 aspect-video bg-gray-100 rounded-md overflow-hidden">
                  <img
                    src={formData.featuredImage}
                    alt="Preview"
                    className="w-full h-full object-cover"
                    onError={(e) => {
                      (e.target as HTMLImageElement).style.display = 'none'
                    }}
                  />
                  <button
                    type="button"
                    onClick={() => setFormData((prev) => ({ ...prev, featuredImage: '' }))}
                    className="absolute top-1 right-1 p-1 bg-red-600 text-white rounded-full hover:bg-red-700"
                  >
                    <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>
              )}
            </div>
          </div>
        </div>
      </div>
    </form>
  )
}
