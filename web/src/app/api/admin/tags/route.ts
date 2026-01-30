import { NextRequest, NextResponse } from 'next/server'
import { auth } from '@/lib/auth'
import { db, tags, eq } from '@/db'

function slugify(text: string): string {
  return text
    .toLowerCase()
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .trim()
}

export async function POST(request: NextRequest) {
  try {
    const session = await auth()

    if (!session?.user || session.user.role !== 'ADMIN') {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const body = await request.json()
    const { name } = body

    if (!name || !name.trim()) {
      return NextResponse.json(
        { error: 'Nama tag wajib diisi' },
        { status: 400 }
      )
    }

    const slug = slugify(name.trim())

    if (!slug) {
      return NextResponse.json(
        { error: 'Nama tag tidak valid' },
        { status: 400 }
      )
    }

    // Check if slug already exists
    const [existing] = await db
      .select()
      .from(tags)
      .where(eq(tags.slug, slug))
      .limit(1)

    if (existing) {
      return NextResponse.json(
        { error: 'Tag sudah ada' },
        { status: 400 }
      )
    }

    const [tag] = await db
      .insert(tags)
      .values({
        name: name.trim(),
        slug,
      })
      .returning()

    return NextResponse.json(tag)
  } catch (error) {
    console.error('Error creating tag:', error)
    return NextResponse.json(
      { error: 'Gagal membuat tag' },
      { status: 500 }
    )
  }
}

export async function GET() {
  try {
    const session = await auth()

    if (!session?.user || session.user.role !== 'ADMIN') {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const allTags = await db
      .select()
      .from(tags)
      .orderBy(tags.name)

    return NextResponse.json(allTags)
  } catch (error) {
    console.error('Error fetching tags:', error)
    return NextResponse.json(
      { error: 'Gagal mengambil data tag' },
      { status: 500 }
    )
  }
}
