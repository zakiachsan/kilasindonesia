import { NextRequest, NextResponse } from 'next/server'
import { prisma } from '@/lib/db'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { categories = [], excludeIds = [] } = body as {
      categories: string[]
      excludeIds: string[]
    }

    // Get recommendations based on user's reading history categories
    let recommendations = []

    if (categories.length > 0) {
      // Fetch posts from categories user has read
      recommendations = await prisma.post.findMany({
        where: {
          status: 'PUBLISHED',
          id: { notIn: excludeIds },
          categories: {
            some: {
              slug: { in: categories.slice(0, 3) } // Top 3 categories
            }
          }
        },
        include: {
          categories: { take: 1 },
        },
        orderBy: [
          { viewCount: 'desc' },
          { publishedAt: 'desc' }
        ],
        take: 3,
      })
    }

    // If not enough recommendations, fill with popular posts
    if (recommendations.length < 3) {
      const additionalPosts = await prisma.post.findMany({
        where: {
          status: 'PUBLISHED',
          id: {
            notIn: [...excludeIds, ...recommendations.map(r => r.id)]
          }
        },
        include: {
          categories: { take: 1 },
        },
        orderBy: { viewCount: 'desc' },
        take: 3 - recommendations.length,
      })

      recommendations = [...recommendations, ...additionalPosts]
    }

    return NextResponse.json({ recommendations })
  } catch (error) {
    console.error('Failed to fetch recommendations:', error)
    return NextResponse.json({ recommendations: [] })
  }
}
