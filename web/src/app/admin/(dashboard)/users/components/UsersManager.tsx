'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'

interface User {
  id: string
  email: string
  name: string
  avatar: string | null
  role: 'ADMIN' | 'AUTHOR'
  postCount: number
  createdAt: Date
}

interface UsersManagerProps {
  initialUsers: User[]
  currentUserId: string
}

function getPasswordStrength(password: string): { level: number; text: string; color: string } {
  if (!password) return { level: 0, text: '', color: '' }

  let strength = 0
  if (password.length >= 8) strength++
  if (password.length >= 12) strength++
  if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength++
  if (/\d/.test(password)) strength++
  if (/[^a-zA-Z0-9]/.test(password)) strength++

  if (strength <= 2) return { level: 1, text: 'Lemah', color: 'bg-red-500' }
  if (strength <= 3) return { level: 2, text: 'Sedang', color: 'bg-yellow-500' }
  return { level: 3, text: 'Kuat', color: 'bg-green-500' }
}

function formatDate(date: Date): string {
  return new Date(date).toLocaleDateString('id-ID', {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
  })
}

export default function UsersManager({ initialUsers, currentUserId }: UsersManagerProps) {
  const router = useRouter()
  const [users, setUsers] = useState(initialUsers)
  const [editingId, setEditingId] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')
  const [showPassword, setShowPassword] = useState(false)

  const [formData, setFormData] = useState({
    name: '',
    email: '',
    password: '',
    confirmPassword: '',
    role: 'AUTHOR' as 'ADMIN' | 'AUTHOR',
  })

  const passwordStrength = getPasswordStrength(formData.password)

  function resetForm() {
    setFormData({
      name: '',
      email: '',
      password: '',
      confirmPassword: '',
      role: 'AUTHOR',
    })
    setEditingId(null)
    setError('')
    setShowPassword(false)
  }

  function handleEdit(user: User) {
    setFormData({
      name: user.name,
      email: user.email,
      password: '',
      confirmPassword: '',
      role: user.role,
    })
    setEditingId(user.id)
    setError('')
    setShowPassword(false)
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault()
    setError('')

    // Validate password confirmation
    if (formData.password && formData.password !== formData.confirmPassword) {
      setError('Konfirmasi password tidak cocok')
      return
    }

    // Validate password for new user
    if (!editingId && formData.password.length < 8) {
      setError('Password minimal 8 karakter')
      return
    }

    // Validate password if provided during edit
    if (editingId && formData.password && formData.password.length < 8) {
      setError('Password minimal 8 karakter')
      return
    }

    setLoading(true)

    try {
      const url = editingId
        ? `/api/admin/users/${editingId}`
        : '/api/admin/users'
      const method = editingId ? 'PUT' : 'POST'

      const payload: {
        name: string
        email: string
        role: 'ADMIN' | 'AUTHOR'
        password?: string
      } = {
        name: formData.name,
        email: formData.email,
        role: formData.role,
      }

      // Only include password if provided
      if (formData.password) {
        payload.password = formData.password
      }

      const res = await fetch(url, {
        method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      })

      const data = await res.json()

      if (!res.ok) {
        throw new Error(data.error || 'Gagal menyimpan pengguna')
      }

      router.refresh()
      resetForm()

      // Update local state
      if (editingId) {
        setUsers((prev) =>
          prev.map((u) =>
            u.id === editingId
              ? { ...u, name: formData.name, email: formData.email, role: formData.role }
              : u
          )
        )
      } else {
        setUsers((prev) => [...prev, { ...data.user, postCount: 0 }])
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Gagal menyimpan pengguna')
    } finally {
      setLoading(false)
    }
  }

  async function handleDelete(id: string, name: string) {
    if (id === currentUserId) {
      alert('Tidak dapat menghapus akun sendiri')
      return
    }

    if (!confirm(`Yakin ingin menghapus pengguna "${name}"?`)) {
      return
    }

    try {
      const res = await fetch(`/api/admin/users/${id}`, {
        method: 'DELETE',
      })

      if (res.ok) {
        setUsers((prev) => prev.filter((u) => u.id !== id))
        router.refresh()
      } else {
        const data = await res.json()
        alert(data.error || 'Gagal menghapus pengguna')
      }
    } catch (error) {
      console.error('Delete error:', error)
      alert('Gagal menghapus pengguna')
    }
  }

  return (
    <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
      {/* Form */}
      <div className="lg:col-span-1">
        <div className="bg-white rounded-md shadow-sm border border-gray-200 p-4">
          <h2 className="font-semibold text-gray-900 text-sm mb-3">
            {editingId ? 'Edit Pengguna' : 'Tambah Pengguna'}
          </h2>

          {error && (
            <div className="mb-3 bg-red-50 border border-red-200 text-red-700 px-2.5 py-1.5 rounded text-xs">
              {error}
            </div>
          )}

          <form onSubmit={handleSubmit} className="space-y-3">
            <div>
              <label htmlFor="name" className="block text-xs font-medium text-gray-700 mb-1">
                Nama
              </label>
              <input
                type="text"
                id="name"
                value={formData.name}
                onChange={(e) => setFormData((prev) => ({ ...prev, name: e.target.value }))}
                required
                className="w-full px-2.5 py-1.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
              />
            </div>

            <div>
              <label htmlFor="email" className="block text-xs font-medium text-gray-700 mb-1">
                Email
              </label>
              <input
                type="email"
                id="email"
                value={formData.email}
                onChange={(e) => setFormData((prev) => ({ ...prev, email: e.target.value }))}
                required
                className="w-full px-2.5 py-1.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
              />
            </div>

            <div>
              <label htmlFor="password" className="block text-xs font-medium text-gray-700 mb-1">
                {editingId ? 'Password Baru (kosongkan jika tidak diubah)' : 'Password'}
              </label>
              <div className="relative">
                <input
                  type={showPassword ? 'text' : 'password'}
                  id="password"
                  value={formData.password}
                  onChange={(e) => setFormData((prev) => ({ ...prev, password: e.target.value }))}
                  required={!editingId}
                  minLength={8}
                  className="w-full px-2.5 py-1.5 pr-8 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
                />
                <button
                  type="button"
                  onClick={() => setShowPassword(!showPassword)}
                  className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                >
                  {showPassword ? (
                    <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                    </svg>
                  ) : (
                    <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                    </svg>
                  )}
                </button>
              </div>
              {formData.password && (
                <div className="mt-1.5">
                  <div className="flex gap-1 mb-1">
                    <div className={`h-1 flex-1 rounded ${passwordStrength.level >= 1 ? passwordStrength.color : 'bg-gray-200'}`} />
                    <div className={`h-1 flex-1 rounded ${passwordStrength.level >= 2 ? passwordStrength.color : 'bg-gray-200'}`} />
                    <div className={`h-1 flex-1 rounded ${passwordStrength.level >= 3 ? passwordStrength.color : 'bg-gray-200'}`} />
                  </div>
                  <p className="text-[10px] text-gray-500">
                    Kekuatan: <span className={passwordStrength.level === 1 ? 'text-red-600' : passwordStrength.level === 2 ? 'text-yellow-600' : 'text-green-600'}>{passwordStrength.text}</span>
                  </p>
                </div>
              )}
            </div>

            <div>
              <label htmlFor="confirmPassword" className="block text-xs font-medium text-gray-700 mb-1">
                Konfirmasi Password
              </label>
              <input
                type={showPassword ? 'text' : 'password'}
                id="confirmPassword"
                value={formData.confirmPassword}
                onChange={(e) => setFormData((prev) => ({ ...prev, confirmPassword: e.target.value }))}
                required={!editingId || !!formData.password}
                className="w-full px-2.5 py-1.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
              />
              {formData.password && formData.confirmPassword && formData.password !== formData.confirmPassword && (
                <p className="text-[10px] text-red-600 mt-0.5">Password tidak cocok</p>
              )}
            </div>

            <div>
              <label htmlFor="role" className="block text-xs font-medium text-gray-700 mb-1">
                Peran
              </label>
              <select
                id="role"
                value={formData.role}
                onChange={(e) => setFormData((prev) => ({ ...prev, role: e.target.value as 'ADMIN' | 'AUTHOR' }))}
                className="w-full px-2.5 py-1.5 border border-gray-300 rounded-md focus:ring-2 focus:ring-red-500 focus:border-red-500 text-sm"
              >
                <option value="AUTHOR">Author (Penulis)</option>
                <option value="ADMIN">Admin</option>
              </select>
              <p className="text-[10px] text-gray-500 mt-0.5">
                {formData.role === 'ADMIN'
                  ? 'Akses penuh ke semua fitur'
                  : 'Hanya bisa menulis artikel'}
              </p>
            </div>

            <div className="flex gap-2">
              <button
                type="submit"
                disabled={loading}
                className="flex-1 px-3 py-1.5 bg-red-600 text-white text-sm font-medium rounded-md hover:bg-red-700 transition-colors disabled:bg-red-400"
              >
                {loading ? 'Menyimpan...' : editingId ? 'Update' : 'Simpan'}
              </button>
              {editingId && (
                <button
                  type="button"
                  onClick={resetForm}
                  className="px-3 py-1.5 border border-gray-300 text-gray-700 text-sm rounded-md hover:bg-gray-50"
                >
                  Batal
                </button>
              )}
            </div>
          </form>
        </div>
      </div>

      {/* Users List */}
      <div className="lg:col-span-2">
        <div className="bg-white rounded-md shadow-sm border border-gray-200">
          <div className="px-3 py-2.5 border-b border-gray-200">
            <h2 className="font-semibold text-gray-900 text-sm">Daftar Pengguna</h2>
          </div>

          {users.length === 0 ? (
            <div className="p-6 text-center text-gray-500 text-sm">
              Belum ada pengguna
            </div>
          ) : (
            <table className="w-full">
              <thead className="bg-gray-50 border-b border-gray-200">
                <tr>
                  <th className="px-3 py-2 text-left text-[10px] font-medium text-gray-500 uppercase">
                    Pengguna
                  </th>
                  <th className="px-3 py-2 text-left text-[10px] font-medium text-gray-500 uppercase">
                    Peran
                  </th>
                  <th className="px-3 py-2 text-left text-[10px] font-medium text-gray-500 uppercase">
                    Artikel
                  </th>
                  <th className="px-3 py-2 text-left text-[10px] font-medium text-gray-500 uppercase">
                    Terdaftar
                  </th>
                  <th className="px-3 py-2 text-right text-[10px] font-medium text-gray-500 uppercase">
                    Aksi
                  </th>
                </tr>
              </thead>
              <tbody className="divide-y divide-gray-200">
                {users.map((user) => (
                  <tr key={user.id} className="hover:bg-gray-50">
                    <td className="px-3 py-2">
                      <div className="flex items-center gap-2">
                        <div className="w-7 h-7 bg-red-600 rounded-full flex items-center justify-center text-white text-xs font-bold flex-shrink-0">
                          {user.name.charAt(0).toUpperCase()}
                        </div>
                        <div className="min-w-0">
                          <p className="font-medium text-gray-900 text-sm truncate">
                            {user.name}
                            {user.id === currentUserId && (
                              <span className="ml-1 text-[10px] text-gray-400">(Anda)</span>
                            )}
                          </p>
                          <p className="text-xs text-gray-500 truncate">{user.email}</p>
                        </div>
                      </div>
                    </td>
                    <td className="px-3 py-2">
                      <span
                        className={`inline-flex items-center px-2 py-0.5 rounded text-[10px] font-medium ${
                          user.role === 'ADMIN'
                            ? 'bg-red-100 text-red-800'
                            : 'bg-gray-100 text-gray-800'
                        }`}
                      >
                        {user.role}
                      </span>
                    </td>
                    <td className="px-3 py-2 text-xs text-gray-500">
                      {user.postCount}
                    </td>
                    <td className="px-3 py-2 text-xs text-gray-500">
                      {formatDate(user.createdAt)}
                    </td>
                    <td className="px-3 py-2">
                      <div className="flex items-center justify-end gap-1">
                        <button
                          onClick={() => handleEdit(user)}
                          className="p-1 text-gray-400 hover:text-blue-600"
                          title="Edit"
                        >
                          <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                          </svg>
                        </button>
                        <button
                          onClick={() => handleDelete(user.id, user.name)}
                          disabled={user.id === currentUserId}
                          className={`p-1 ${
                            user.id === currentUserId
                              ? 'text-gray-200 cursor-not-allowed'
                              : 'text-gray-400 hover:text-red-600'
                          }`}
                          title={user.id === currentUserId ? 'Tidak dapat menghapus akun sendiri' : 'Hapus'}
                        >
                          <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                          </svg>
                        </button>
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </div>
      </div>
    </div>
  )
}
