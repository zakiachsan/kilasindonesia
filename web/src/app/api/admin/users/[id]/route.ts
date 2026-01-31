import { NextRequest, NextResponse } from 'next/server'
import { auth, hashPassword } from '@/lib/auth'
import { db, users, eq } from '@/db'

interface RouteParams {
  params: Promise<{ id: string }>
}

// PUT - Update user (admin only)
export async function PUT(request: NextRequest, { params }: RouteParams) {
  try {
    const session = await auth()

    if (!session?.user || session.user.role !== 'ADMIN') {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const { id } = await params
    const body = await request.json()
    const { name, email, password, role } = body

    // Validate required fields
    if (!name || !email) {
      return NextResponse.json(
        { error: 'Nama dan email wajib diisi' },
        { status: 400 }
      )
    }

    // Validate role
    if (role && !['ADMIN', 'AUTHOR'].includes(role)) {
      return NextResponse.json(
        { error: 'Role tidak valid' },
        { status: 400 }
      )
    }

    // Check if user exists
    const [existingUser] = await db
      .select({ id: users.id })
      .from(users)
      .where(eq(users.id, id))
      .limit(1)

    if (!existingUser) {
      return NextResponse.json(
        { error: 'Pengguna tidak ditemukan' },
        { status: 404 }
      )
    }

    // Check if email already used by another user
    const [emailInUse] = await db
      .select({ id: users.id })
      .from(users)
      .where(eq(users.email, email))
      .limit(1)

    if (emailInUse && emailInUse.id !== id) {
      return NextResponse.json(
        { error: 'Email sudah digunakan' },
        { status: 400 }
      )
    }

    // Prepare update data
    const updateData: {
      name: string
      email: string
      role?: 'ADMIN' | 'AUTHOR'
      password?: string
      updatedAt: Date
    } = {
      name,
      email,
      updatedAt: new Date(),
    }

    if (role) {
      updateData.role = role
    }

    // Hash new password if provided
    if (password && password.length > 0) {
      if (password.length < 8) {
        return NextResponse.json(
          { error: 'Password minimal 8 karakter' },
          { status: 400 }
        )
      }
      updateData.password = await hashPassword(password)
    }

    // Update user
    const [updatedUser] = await db
      .update(users)
      .set(updateData)
      .where(eq(users.id, id))
      .returning({
        id: users.id,
        name: users.name,
        email: users.email,
        role: users.role,
        createdAt: users.createdAt,
      })

    return NextResponse.json({ success: true, user: updatedUser })
  } catch (error) {
    console.error('Error updating user:', error)
    return NextResponse.json(
      { error: 'Gagal mengupdate pengguna' },
      { status: 500 }
    )
  }
}

// DELETE - Delete user (admin only, prevent self-deletion)
export async function DELETE(request: NextRequest, { params }: RouteParams) {
  try {
    const session = await auth()

    if (!session?.user || session.user.role !== 'ADMIN') {
      return NextResponse.json({ error: 'Unauthorized' }, { status: 401 })
    }

    const { id } = await params

    // Prevent self-deletion
    if (id === session.user.id) {
      return NextResponse.json(
        { error: 'Tidak dapat menghapus akun sendiri' },
        { status: 400 }
      )
    }

    // Check if user exists
    const [existingUser] = await db
      .select({ id: users.id })
      .from(users)
      .where(eq(users.id, id))
      .limit(1)

    if (!existingUser) {
      return NextResponse.json(
        { error: 'Pengguna tidak ditemukan' },
        { status: 404 }
      )
    }

    // Delete user
    await db.delete(users).where(eq(users.id, id))

    return NextResponse.json({ success: true })
  } catch (error) {
    console.error('Error deleting user:', error)
    return NextResponse.json(
      { error: 'Gagal menghapus pengguna' },
      { status: 500 }
    )
  }
}
