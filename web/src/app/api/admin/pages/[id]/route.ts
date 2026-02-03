import { NextRequest, NextResponse } from 'next/server'
import { auth } from '@/lib/auth'
import { db, pages, eq, and, ne } from '@/db'

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const session = await auth()

    if (!session?.user || session.user.role !== 'ADMIN') {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const body = await request.json()
    const {
      title,
      slug,
      content,
      excerpt,
      featuredImage,
      seoTitle,
      seoDescription,
      publish,
    } = body

    // Validate required fields
    if (!title || !slug) {
      return NextResponse.json(
        { error: 'Judul dan slug wajib diisi' },
        { status: 400 }
      )
    }

    // Check if slug already exists (excluding current page)
    const [existingPage] = await db
      .select()
      .from(pages)
      .where(and(eq(pages.slug, slug), ne(pages.id, id)))
      .limit(1)

    if (existingPage) {
      return NextResponse.json(
        { error: 'Slug sudah digunakan' },
        { status: 400 }
      )
    }

    // Get current page to check publishedAt
    const [currentPage] = await db
      .select()
      .from(pages)
      .where(eq(pages.id, id))
      .limit(1)

    if (!currentPage) {
      return NextResponse.json(
        { error: 'Halaman tidak ditemukan' },
        { status: 404 }
      )
    }

    // Update page
    const now = new Date()
    const [page] = await db
      .update(pages)
      .set({
        title,
        slug,
        content: content || '',
        excerpt: excerpt || null,
        featuredImage: featuredImage || null,
        seoTitle: seoTitle || null,
        seoDescription: seoDescription || null,
        publishedAt: publish ? (currentPage.publishedAt || now) : null,
        updatedAt: now,
      })
      .where(eq(pages.id, id))
      .returning()

    return NextResponse.json({ success: true, page })
  } catch (error) {
    console.error('Error updating page:', error)
    return NextResponse.json(
      { error: 'Gagal memperbarui halaman' },
      { status: 500 }
    )
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params
    const session = await auth()

    if (!session?.user || session.user.role !== 'ADMIN') {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    await db.delete(pages).where(eq(pages.id, id))

    return NextResponse.json({ success: true })
  } catch (error) {
    console.error('Error deleting page:', error)
    return NextResponse.json(
      { error: 'Gagal menghapus halaman' },
      { status: 500 }
    )
  }
}
