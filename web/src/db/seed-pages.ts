import 'dotenv/config'
import { drizzle } from 'drizzle-orm/node-postgres/driver'
import { Pool } from 'pg'
import * as schema from './schema'
import { eq } from 'drizzle-orm'

const pool = new Pool({ connectionString: process.env.DATABASE_URL || 'postgresql://postgres:postgres@localhost:5432/kilasindonesia' })
const db = drizzle(pool, { schema })

async function main() {
  console.log('📄 Seeding static pages...')

  const now = new Date()

  const aboutContent = `
<h2>Kilas Indonesia</h2>
<p>Kilas Indonesia adalah portal berita yang menyajikan informasi terkini, akurat, dan terpercaya seputar pendidikan Islam, madrasah, pesantren, dan berbagai topik menarik lainnya.</p>

<h3>Visi</h3>
<p>Menjadi portal berita terpercaya untuk menyajikan informasi seputar dunia pendidikan Islam dan keagamaan di Indonesia.</p>

<h3>Misi</h3>
<ul>
<li>Menyajikan berita yang akurat, terpercaya, dan terkini</li>
<li>Mendukung perkembangan pendidikan Islam di Indonesia</li>
<li>Memberikan wawasan tentang dunia pesantren dan madrasah</li>
<li>Memperluas informasi tentang perguruan tinggi keagamaan</li>
</ul>

<h3>Redaksi</h3>
<p>Tim redaksi Kilas Indonesia terdiri dari jurnalis profesional yang berkomitmen menghadirkan berita berkualitas.</p>

<h3>Kontak</h3>
<p>Untuk informasi lebih lanjut, silakan hubungi kami melalui:</p>
<ul>
<li>Email: redaksi@kilasindonesia.com</li>
<li>WhatsApp: +62 8xx-xxxx-xxxx</li>
</ul>
`

  // Check if page already exists
  const [existingPage] = await db
    .select()
    .from(schema.pages)
    .where(eq(schema.pages.slug, 'tentang-kami'))
    .limit(1)

  if (existingPage) {
    console.log('⚠️ Page "tentang-kami" already exists, updating...')
    await db.update(schema.pages)
      .set({
        title: 'Tentang Kilas Indonesia',
        content: aboutContent,
        excerpt: 'Kilas Indonesia adalah portal berita yang menyajikan informasi terkini, akurat, dan terpercaya seputar pendidikan Islam, madrasah, pesantren, dan berbagai topik menarik lainnya.',
        publishedAt: existingPage.publishedAt || now,
        updatedAt: now,
      })
      .where(eq(schema.pages.slug, 'tentang-kami'))
    console.log('✅ Page "tentang-kami" updated!')
  } else {
    console.log('➕ Creating page "tentang-kami"...')
    await db.insert(schema.pages).values({
      slug: 'tentang-kami',
      title: 'Tentang Kilas Indonesia',
      content: aboutContent,
      excerpt: 'Kilas Indonesia adalah portal berita yang menyajikan informasi terkini, akurat, dan terpercaya seputar pendidikan Islam, madrasah, pesantren, dan berbagai topik menarik lainnya.',
      publishedAt: now,
      createdAt: now,
      updatedAt: now,
    })
    console.log('✅ Page "tentang-kami" created!')
  }

  console.log('')
  console.log('📊 Done! You can now access /tentang-kami on your website.')
}

main()
  .catch((e) => {
    console.error('❌ Failed to seed pages:', e)
    process.exit(1)
  })
  .finally(async () => {
    await pool.end()
  })
