import { NextRequest, NextResponse } from 'next/server'
import { auth } from '@/lib/auth'
import { db, posts, postCategories, postTags, eq } from '@/db'

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
      scheduledAt,
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

    // Validate scheduledAt for SCHEDULED status
    if (status === 'SCHEDULED') {
      if (!scheduledAt) {
        return NextResponse.json(
          { error: 'Tanggal jadwal wajib diisi untuk artikel terjadwal' },
          { status: 400 }
        )
      }
      if (new Date(scheduledAt) <= new Date()) {
        return NextResponse.json(
          { error: 'Tanggal jadwal harus di masa depan' },
          { status: 400 }
        )
      }
    }

    // Check if slug already exists
    const [existingPost] = await db
      .select()
      .from(posts)
      .where(eq(posts.slug, slug))
      .limit(1)

    if (existingPost) {
      return NextResponse.json(
        { error: 'Slug sudah digunakan' },
        { status: 400 }
      )
    }

    // Create post
    const now = new Date()
    const [post] = await db
      .insert(posts)
      .values({
        title,
        slug,
        content,
        excerpt: excerpt || null,
        featuredImage: featuredImage || null,
        status: status || 'DRAFT',
        authorId: session.user.id,
        publishedAt: status === 'PUBLISHED' ? now : null,
        scheduledAt: status === 'SCHEDULED' && scheduledAt ? new Date(scheduledAt) : null,
        metaTitle: metaTitle || null,
        metaDescription: metaDescription || null,
        createdAt: now,
        updatedAt: now,
      })
      .returning()

    // Add categories
    if (categoryIds && categoryIds.length > 0) {
      await db.insert(postCategories).values(
        categoryIds.map((catId: string) => ({
          postId: post.id,
          categoryId: catId,
        }))
      )
    }

    // Add tags
    if (tagIds && tagIds.length > 0) {
      await db.insert(postTags).values(
        tagIds.map((tagId: string) => ({
          postId: post.id,
          tagId: tagId,
        }))
      )
    }

    return NextResponse.json({ success: true, post })
  } catch (error) {
    console.error('Error creating post:', error)
    return NextResponse.json(
      { error: 'Gagal membuat artikel' },
      { status: 500 }
    )
  }
}
