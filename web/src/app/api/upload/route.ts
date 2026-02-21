import { NextRequest, NextResponse } from 'next/server'
import { auth } from '@/lib/auth'
import { getSupabaseAdmin, getPublicUrl } from '@/lib/supabase'
import sharp from 'sharp'

export const runtime = 'nodejs'

const ALLOWED_TYPES = ['image/jpeg', 'image/jpg', 'image/png', 'image/webp']
const MAX_SIZE = 5 * 1024 * 1024 // 5MB
const BUCKET_NAME = 'upload'

export async function POST(request: NextRequest) {
  try {
    const session = await auth()

    if (!session?.user) {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const formData = await request.formData()
    const file = formData.get('file') as File | null

    if (!file) {
      return NextResponse.json({ error: 'No file provided' }, { status: 400 })
    }

    // Validate file type
    if (!ALLOWED_TYPES.includes(file.type)) {
      return NextResponse.json(
        { error: 'Invalid file type. Allowed: jpeg, jpg, png, webp' },
        { status: 400 }
      )
    }

    // Validate file size
    if (file.size > MAX_SIZE) {
      return NextResponse.json(
        { error: 'File too large. Maximum size: 5MB' },
        { status: 400 }
      )
    }

    // Convert file to buffer
    const bytes = await file.arrayBuffer()
    const buffer = Buffer.from(bytes)

    // Check if resize should be skipped (e.g. for ads with custom dimensions)
    const url = new URL(request.url)
    const skipResize = url.searchParams.get('skipResize') === 'true'

    // Process image with sharp: convert to WebP + optional resize
    let processedBuffer: Buffer
    if (skipResize) {
      processedBuffer = await sharp(buffer)
        .webp({ quality: 80 })
        .toBuffer()
    } else {
      processedBuffer = await sharp(buffer)
        .resize(1200, 675, {
          fit: 'cover',
          position: 'center',
          withoutEnlargement: true,
        })
        .webp({ quality: 80 })
        .toBuffer()
    }

    // Generate unique filename (always .webp)
    const timestamp = Date.now()
    const randomStr = Math.random().toString(36).substring(2, 8)
    const filename = `${timestamp}-${randomStr}.webp`

    // Get Supabase client
    const supabase = getSupabaseAdmin()

    // Upload to Supabase Storage
    const { data, error } = await supabase.storage
      .from(BUCKET_NAME)
      .upload(filename, processedBuffer, {
        contentType: 'image/webp',
        upsert: false,
      })

    if (error) {
      console.error('Supabase upload error:', error)
      return NextResponse.json(
        {
          error: 'Failed to upload file to storage',
          details: process.env.NODE_ENV === 'development' ? error.message : undefined,
        },
        { status: 500 }
      )
    }

    // Get public URL
    const publicUrl = getPublicUrl(BUCKET_NAME, filename)

    return NextResponse.json({
      success: true,
      url: publicUrl,
      filename,
      path: data.path,
    })
  } catch (error) {
    console.error('Upload error:', error)
    const message = error instanceof Error ? error.message : 'Failed to upload file'
    return NextResponse.json(
      {
        error: message,
        details: process.env.NODE_ENV === 'development' && error instanceof Error ? error.stack : undefined,
      },
      { status: 500 }
    )
  }
}
