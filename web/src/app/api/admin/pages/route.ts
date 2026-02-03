import { NextRequest, NextResponse } from 'next/server'
import { auth } from '@/lib/auth'
import { db, pages, eq } from '@/db'

export async function POST(request: NextRequest) {
  try {
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

    // Check if slug already exists
    const [existingPage] = await db
      .select()
      .from(pages)
      .where(eq(pages.slug, slug))
      .limit(1)

    if (existingPage) {
      return NextResponse.json(
        { error: 'Slug sudah digunakan' },
        { status: 400 }
      )
    }

    // Create page
    const now = new Date()
    const [page] = await db
      .insert(pages)
      .values({
        title,
        slug,
        content: content || '',
        excerpt: excerpt || null,
        featuredImage: featuredImage || null,
        seoTitle: seoTitle || null,
        seoDescription: seoDescription || null,
        publishedAt: publish ? now : null,
        createdAt: now,
        updatedAt: now,
      })
      .returning()

    return NextResponse.json({ success: true, page })
  } catch (error) {
    console.error('Error creating page:', error)
    return NextResponse.json(
      { error: 'Gagal membuat halaman' },
      { status: 500 }
    )
  }
}
