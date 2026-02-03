import 'dotenv/config'
import { drizzle } from 'drizzle-orm/node-postgres/driver'
import { Pool } from 'pg'
import bcrypt from 'bcryptjs'
import * as schema from './schema'
import { eq } from 'drizzle-orm'

const pool = new Pool({ connectionString: process.env.DATABASE_URL || 'postgresql://postgres:postgres@localhost:5432/kilasindonesia' })
const db = drizzle(pool, { schema })

async function main() {
  // Get email and password from command line args or use defaults
  const email = process.argv[2] || 'admin@kilasindonesia.com'
  const newPassword = process.argv[3] || 'admin123'

  console.log(`🔐 Resetting password for: ${email}`)

  // Check if user exists
  const [existingUser] = await db
    .select()
    .from(schema.users)
    .where(eq(schema.users.email, email))
    .limit(1)

  if (!existingUser) {
    console.error(`❌ User not found: ${email}`)
    process.exit(1)
  }

  // Hash new password
  const hashedPassword = await bcrypt.hash(newPassword, 12)

  // Update password
  await db.update(schema.users)
    .set({
      password: hashedPassword,
      updatedAt: new Date()
    })
    .where(eq(schema.users.email, email))

  console.log('✅ Password updated successfully!')
  console.log('')
  console.log('📝 Login credentials:')
  console.log(`   Email: ${email}`)
  console.log(`   Password: ${newPassword}`)
}

main()
  .catch((e) => {
    console.error('❌ Failed to reset password:', e)
    process.exit(1)
  })
  .finally(async () => {
    await pool.end()
  })
