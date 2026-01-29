import { NextRequest, NextResponse } from 'next/server'
import { auth } from '@/lib/auth'
import { prisma } from '@/lib/db'

interface RouteParams {
  params: Promise<{ id: string }>
}

export async function GET(request: NextRequest, { params }: RouteParams) {
  try {
    const session = await auth()

    if (!session?.user) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const { id } = await params

    const post = await prisma.post.findUnique({
      where: { id },
      include: {
        author: { select: { id: true, name: true } },
        categories: true,
        tags: true,
      },
    })

    if (!post) {
      return NextResponse.json({ error: 'Artikel tidak ditemukan' }, { status: 404 })
    }

    return NextResponse.json({ post })
  } catch (error) {
    console.error('Error fetching post:', error)
    return NextResponse.json(
      { error: 'Gagal mengambil artikel' },
      { status: 500 }
    )
  }
}

export async function PUT(request: NextRequest, { params }: RouteParams) {
  try {
    const session = await auth()

    if (!session?.user) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const { id } = await params
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

    // Check if post exists
    const existingPost = await prisma.post.findUnique({
      where: { id },
    })

    if (!existingPost) {
      return NextResponse.json({ error: 'Artikel tidak ditemukan' }, { status: 404 })
    }

    // Check if slug is taken by another post
    const slugPost = await prisma.post.findUnique({
      where: { slug },
    })

    if (slugPost && slugPost.id !== id) {
      return NextResponse.json(
        { error: 'Slug sudah digunakan' },
        { status: 400 }
      )
    }

    // Determine publishedAt
    let publishedAt = existingPost.publishedAt
    if (status === 'PUBLISHED' && !existingPost.publishedAt) {
      publishedAt = new Date()
    } else if (status !== 'PUBLISHED') {
      publishedAt = null
    }

    // Update post
    const post = await prisma.post.update({
      where: { id },
      data: {
        title,
        slug,
        content,
        excerpt: excerpt || null,
        featuredImage: featuredImage || null,
        status,
        publishedAt,
        metaTitle: metaTitle || null,
        metaDescription: metaDescription || null,
        categories: {
          set: (categoryIds || []).map((catId: string) => ({ id: catId })),
        },
        tags: {
          set: (tagIds || []).map((tagId: string) => ({ id: tagId })),
        },
      },
    })

    return NextResponse.json({ success: true, post })
  } catch (error) {
    console.error('Error updating post:', error)
    return NextResponse.json(
      { error: 'Gagal mengupdate artikel' },
      { status: 500 }
    )
  }
}

export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    const session = await auth()

    if (!session?.user) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const { id } = await params

    // Check if post exists
    const existingPost = await prisma.post.findUnique({
      where: { id },
    })

    if (!existingPost) {
      return NextResponse.json({ error: 'Artikel tidak ditemukan' }, { status: 404 })
    }

    // Delete post
    await prisma.post.delete({
      where: { id },
    })

    return NextResponse.json({ success: true })
  } catch (error) {
    console.error('Error deleting post:', error)
    return NextResponse.json(
      { error: 'Gagal menghapus artikel' },
      { status: 500 }
    )
  }
}
