import { NextRequest, NextResponse } from 'next/server'
import { auth } from '@/lib/auth'
import { prisma } from '@/lib/db'

export async function POST(request: NextRequest) {
  try {
    const session = await auth()

    if (!session?.user) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const body = await request.json()
    const {
      title,
      slug,
      content,
      excerpt,
      featuredImage,
      status,
      categoryIds,
      tagIds,
      metaTitle,
      metaDescription,
    } = body

    // Validate required fields
    if (!title || !slug || !content) {
      return NextResponse.json(
        { error: 'Judul, slug, dan konten wajib diisi' },
        { status: 400 }
      )
    }

    // Check if slug already exists
    const existingPost = await prisma.post.findUnique({
      where: { slug },
    })

    if (existingPost) {
      return NextResponse.json(
        { error: 'Slug sudah digunakan' },
        { status: 400 }
      )
    }

    // Create post
    const post = await prisma.post.create({
      data: {
        title,
        slug,
        content,
        excerpt: excerpt || null,
        featuredImage: featuredImage || null,
        status: status || 'DRAFT',
        authorId: session.user.id,
        publishedAt: status === 'PUBLISHED' ? new Date() : null,
        metaTitle: metaTitle || null,
        metaDescription: metaDescription || null,
        categories: {
          connect: (categoryIds || []).map((id: string) => ({ id })),
        },
        tags: {
          connect: (tagIds || []).map((id: string) => ({ id })),
        },
      },
    })

    return NextResponse.json({ success: true, post })
  } catch (error) {
    console.error('Error creating post:', error)
    return NextResponse.json(
      { error: 'Gagal membuat artikel' },
      { status: 500 }
    )
  }
}
