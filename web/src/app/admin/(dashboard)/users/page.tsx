import { redirect } from 'next/navigation'
import { auth } from '@/lib/auth'
import { db, users, posts, eq, asc, count } from '@/db'
import UsersManager from './components/UsersManager'

async function getUsers() {
  try {
    const allUsers = await db
      .select({
        id: users.id,
        email: users.email,
        name: users.name,
        avatar: users.avatar,
        role: users.role,
        createdAt: users.createdAt,
      })
      .from(users)
      .orderBy(asc(users.name))

    return Promise.all(
      allUsers.map(async (user) => {
        const [result] = await db
          .select({ count: count() })
          .from(posts)
          .where(eq(posts.authorId, user.id))
        return {
          ...user,
          postCount: result?.count || 0,
        }
      })
    )
  } catch (error) {
    console.error('Failed to fetch users:', error)
    return []
  }
}

export default async function UsersPage() {
  const session = await auth()

  // ADMIN-only access check
  if (!session?.user || session.user.role !== 'ADMIN') {
    redirect('/admin')
  }

  const usersList = await getUsers()
  const currentUserId = session.user.id

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Pengguna</h1>
        <p className="text-sm text-gray-500 mt-1">
          Kelola akun pengguna
        </p>
      </div>

      <UsersManager
        initialUsers={usersList}
        currentUserId={currentUserId}
      />
    </div>
  )
}
