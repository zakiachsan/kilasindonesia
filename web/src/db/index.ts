import { drizzle } from 'drizzle-orm/node-postgres'
import { Pool } from 'pg'
import * as schema from './schema'

const globalForDb = globalThis as unknown as {
  pool: Pool | undefined
}

function getPool() {
  if (!globalForDb.pool) {
    const connectionString = process.env.DATABASE_URL
    if (!connectionString) {
      throw new Error('DATABASE_URL is not defined')
    }
    globalForDb.pool = new Pool({ connectionString })
  }
  return globalForDb.pool
}

export const db = drizzle(getPool(), { schema })

export * from './schema'
export { eq, and, or, desc, asc, sql, like, ilike, inArray, isNull, isNotNull, count, ne, notInArray } from 'drizzle-orm'
