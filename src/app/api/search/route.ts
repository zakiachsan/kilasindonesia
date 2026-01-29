import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/db'

export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams
    const query = searchParams.get('q')
    const page = parseInt(searchParams.get('page') || '1')
    const limit = parseInt(searchParams.get('limit') || '10')

    if (!query || query.trim().length === 0) {
      return NextResponse.json({ posts: [], pagination: { total: 0 } })
    }

    const skip = (page - 1) * limit
    const searchTerm = query.trim()

    const where = {
      status: 'PUBLISHED' as const,
      OR: [
        { title: { contains: searchTerm, mode: 'insensitive' as const } },
        { excerpt: { contains: searchTerm, mode: 'insensitive' as const } },
        { content: { contains: searchTerm, mode: 'insensitive' as const } },
      ],
    }

    const [posts, total] = await Promise.all([
      prisma.post.findMany({
        where,
        include: {
          author: {
            select: { id: true, name: true, avatar: true },
          },
          categories: {
            select: { id: true, name: true, slug: true },
            take: 1,
          },
        },
        orderBy: { publishedAt: 'desc' },
        skip,
        take: limit,
      }),
      prisma.post.count({ where }),
    ])

    const totalPages = Math.ceil(total / limit)

    return NextResponse.json({
      posts,
      pagination: {
        page,
        limit,
        total,
        totalPages,
        hasMore: page < totalPages,
      },
    })
  } catch (error) {
    console.error('Error searching posts:', error)
    return NextResponse.json(
      { error: 'Failed to search posts' },
      { status: 500 }
    )
  }
}
