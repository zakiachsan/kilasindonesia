import 'dotenv/config'
import { drizzle } from 'drizzle-orm/node-postgres/driver'
import { Pool } from 'pg'
import bcrypt from 'bcryptjs'
import * as schema from './schema'

// Prevent running in production - use specific scripts instead
if (process.env.NODE_ENV === 'production') {
  console.error('❌ Cannot run full seed in production!')
  console.error('   Use specific scripts: npm run db:reset-password or npm run db:seed-pages')
  process.exit(1)
}

const pool = new Pool({ connectionString: process.env.DATABASE_URL || 'postgresql://postgres:postgres@localhost:5432/kilasindonesia' })
const db = drizzle(pool, { schema })

async function main() {
  console.log('🌱 Starting seed...')

  // Clear existing data
  await db.delete(schema.menuItems)
  await db.delete(schema.menus)
  await db.delete(schema.comments)
  await db.delete(schema.postTags)
  await db.delete(schema.postCategories)
  await db.delete(schema.posts)
  await db.delete(schema.tags)
  await db.delete(schema.categories)
  await db.delete(schema.users)
  await db.delete(schema.settings)
  await db.delete(schema.pages)

  // ===========================================
  // CREATE ADMIN USER
  // ===========================================
  console.log('👤 Creating admin user...')
  // Hash password dynamically to ensure it's always correct
  const hashedPassword = await bcrypt.hash('admin123', 12)

  const now = new Date()
  const [admin] = await db.insert(schema.users).values({
    email: 'admin@kilasindonesia.com',
    password: hashedPassword,
    name: 'Admin Kilas Indonesia',
    role: 'ADMIN',
    createdAt: now,
    updatedAt: now,
  }).returning()

  // ===========================================
  // CREATE CATEGORIES
  // ===========================================
  console.log('📁 Creating categories...')

  const categoriesData = [
    { name: 'Nasional', slug: 'nasional', description: 'Berita nasional terkini' },
    { name: 'Madrasah', slug: 'madrasah', description: 'Berita seputar madrasah di Indonesia' },
    { name: 'Pesantren', slug: 'pesantren', description: 'Berita seputar pesantren dan santri' },
    { name: 'Perguruan Tinggi', slug: 'perguruan-tinggi', description: 'Berita seputar perguruan tinggi keagamaan' },
    { name: 'Opini', slug: 'opini', description: 'Opini dan pandangan' },
    { name: 'Tokoh', slug: 'tokoh', description: 'Profil tokoh pendidikan dan keagamaan' },
    { name: 'Edukasi', slug: 'edukasi', description: 'Berita pendidikan umum' },
  ]

  const insertedCategories = await db.insert(schema.categories).values(categoriesData).returning()
  const categories: Record<string, typeof insertedCategories[0]> = {}
  for (const cat of insertedCategories) {
    categories[cat.slug] = cat
  }

  // ===========================================
  // CREATE TAGS
  // ===========================================
  console.log('🏷️ Creating tags...')

  const tagsData = [
    { name: 'Kemenag', slug: 'kemenag' },
    { name: 'Hari Santri', slug: 'hari-santri' },
    { name: 'Menteri Agama', slug: 'menteri-agama' },
    { name: 'Pendidikan Islam', slug: 'pendidikan-islam' },
    { name: 'Prabowo Subianto', slug: 'prabowo-subianto' },
    { name: 'Robotik', slug: 'robotik' },
    { name: 'Beasiswa', slug: 'beasiswa' },
    { name: 'UIN Jakarta', slug: 'uin-jakarta' },
    { name: 'Ditjen Pesantren', slug: 'ditjen-pesantren' },
    { name: 'MRC 2025', slug: 'mrc-2025' },
    { name: 'Asta Cita', slug: 'asta-cita' },
  ]

  const insertedTags = await db.insert(schema.tags).values(tagsData).returning()
  const tags: Record<string, typeof insertedTags[0]> = {}
  for (const tag of insertedTags) {
    tags[tag.slug] = tag
  }

  // ===========================================
  // CREATE POSTS
  // ===========================================
  console.log('📝 Creating posts...')

  const postsData = [
    {
      title: 'Menag Nasaruddin Dorong Siswa Madrasah Bukan Hanya Unggul dalam Agama tapi juga Teknologi',
      slug: 'menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi',
      content: `<p><strong>KILASINDONESIA.COM</strong> – Menteri Agama Nasaruddin Umar membuka ajang Madrasah Robotics Competition (MRC) 2025 yang digelar di Atrium Utama Living World Kota Wisata Cibubur, Sabtu (1/11/2025). Dalam arahannya, Menag menegaskan bahwa madrasah hari ini harus menjadi simbol kemajuan — tidak hanya dalam ilmu agama, tetapi juga sains dan teknologi.</p>

<p>"Anak-anak madrasah jangan hanya bisa mengaji dan berdoa, tapi juga harus mampu menciptakan robot, meneliti, dan berinovasi. Itu baru madrasah masa depan," ujar Nasaruddin.</p>

<p>Menag pun mengapresiasi semangat para peserta MRC 2025. Tahun ini tercatat 616 tim dari berbagai jenjang madrasah di seluruh Indonesia ikut berkompetisi.</p>`,
      excerpt: 'Menteri Agama Nasaruddin Umar membuka Madrasah Robotics Competition (MRC) 2025 dan menegaskan bahwa madrasah harus menjadi simbol kemajuan dalam ilmu agama dan teknologi.',
      categorySlug: 'madrasah',
      tagSlugs: ['kemenag', 'menteri-agama', 'robotik', 'mrc-2025'],
      publishedAt: new Date('2025-11-01T13:13:51Z'),
      viewCount: 1250,
    },
    {
      title: 'Malam Bakti Santri, Menag Sampaikan Terima Kasih atas Perhatian Presiden ke Pesantren',
      slug: 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren',
      content: `<p><strong>KILASINDONESIA.COM</strong> --- Menteri Agama Nasaruddin Umar menyampakan terima kasih kepada Presiden Prabowo atas perhatiannya ke dunia pesantren. Hal ini disampaikan Menag Nasaruddin Umar saat memberikan sambutan pada malam Bakti Santri untuk Negeri di TMII, Jakarta.</p>

<p>"Izinkan saya menyampaikan terima kasih dan apresiasi yang setinggi-tingginya kepada Presiden Republik Indonesia, Bapak Prabowo Subianto, atas keberpihakan nyata beliau kepada dunia pesantren," ucap Menag di Jakarta, Jumat (24/10/2025).</p>`,
      excerpt: 'Menteri Agama Nasaruddin Umar menyampaikan terima kasih kepada Presiden Prabowo atas perhatiannya ke dunia pesantren dalam acara Bakti Santri untuk Negeri.',
      categorySlug: 'pesantren',
      tagSlugs: ['kemenag', 'menteri-agama', 'hari-santri', 'prabowo-subianto', 'ditjen-pesantren'],
      publishedAt: new Date('2025-10-25T03:38:10Z'),
      viewCount: 2340,
    },
    {
      title: 'Gelar Peringatan HSN 2025, Rektor UIN Jakarta Harap Para Santri Terus Tingkatkan Ilmu dan Akhlak',
      slug: 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak',
      content: `<p><strong>KILASINDONESIA.COM</strong> - Rektor UIN Syarif Hidayatullah Jakarta, Prof Asep Saepudin Jahar, memimpin Upacara Peringatan Hari Santri Nasional (HSN) 2025 di Lapangan Student Center Kampus 1, Ciputat, Tangerang Selatan, Banten, Rabu 22 Oktober 2025.</p>

<p>"Saya berharap kepada para santri untuk terus meningkatkan ilmu, meningkatkan akhlak dan juga memperkuat komitmen kepada bangsa," katanya.</p>`,
      excerpt: 'Rektor UIN Syarif Hidayatullah Jakarta memimpin Upacara Peringatan Hari Santri Nasional 2025 dan berharap para santri terus meningkatkan ilmu dan akhlak.',
      categorySlug: 'perguruan-tinggi',
      tagSlugs: ['hari-santri', 'uin-jakarta', 'pendidikan-islam'],
      publishedAt: new Date('2025-10-23T04:50:06Z'),
      viewCount: 1890,
    },
    {
      title: 'Langkah Kemenag Wujudkan Asta Cita: dari Jaga Kerukunan untuk Pembangunan hingga Sejahterakan Guru',
      slug: 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru',
      content: `<p><strong>KILASINDONESIA.COM</strong> - Setahun pemerintahan Presiden Prabowo Subianto–Gibran Rakabuming Raka menjadi momentum penting bagi Kementerian Agama (Kemenag) untuk menghadirkan wajah kehidupan beragama yang lebih inklusif, produktif, dan menyejahterakan.</p>

<p>"Asta Cita bukan sekadar rencana politik, tapi arah moral bangsa," ujar Menag Nasaruddin Umar.</p>`,
      excerpt: 'Kemenag mewujudkan Asta Cita Presiden dengan menjaga kerukunan, memperkuat pendidikan keagamaan, dan meningkatkan kesejahteraan guru.',
      categorySlug: 'nasional',
      tagSlugs: ['kemenag', 'menteri-agama', 'asta-cita', 'prabowo-subianto'],
      publishedAt: new Date('2025-10-23T04:46:36Z'),
      viewCount: 3450,
    },
    {
      title: 'Kado Hari Santri, Presiden Setujui Pembentukan Ditjen Pesantren',
      slug: 'kado-hari-santri-presiden-setujui-pembentukan-ditjen-pesantren',
      content: `<p><strong>KILASINDONESIA.COM</strong>-Kabar gembira datang bertepatan dengan peringatan Hari Santri 2025. Presiden Prabowo Subianto menyetujui pembentukan Direktorat Jenderal (Ditjen) Pesantren di lingkungan Kementerian Agama.</p>

<p>Menteri Agama Nasaruddin Umar bersyukur atas kabar ini. "Wabil khusus Wamenag telah memerjuangkannya sesegera mungkin," sebut Menag di Jakarta usai memimpin Apel Hari Santri 2025.</p>`,
      excerpt: 'Presiden Prabowo Subianto menyetujui pembentukan Direktorat Jenderal Pesantren di Kementerian Agama sebagai kado Hari Santri 2025.',
      categorySlug: 'pesantren',
      tagSlugs: ['kemenag', 'hari-santri', 'prabowo-subianto', 'ditjen-pesantren', 'menteri-agama'],
      publishedAt: new Date('2025-10-22T14:29:27Z'),
      viewCount: 5670,
    },
    {
      title: 'Solidaritas Korban Penembakan, DKI Beri Warna Bendera New Zealand di JPO GBK',
      slug: 'solidaritas-korban-penembakan-dki-beri-warna-bendera-new-zealand-di-jpo-gbk',
      content: `<p>Pemprov DKI turut berbelasungkawa atas penembakan di dua masjid di Christchurch, New Zealand, yang menewaskan 49 orang.</p>

<p>Warna-warna bendera Selandia Baru akan dimunculkan selama seminggu di jembatan penyeberangan orang (JPO) Gelora Bung Karno.</p>`,
      excerpt: 'Pemprov DKI memunculkan warna bendera New Zealand di JPO GBK sebagai bentuk solidaritas atas penembakan di dua masjid di Christchurch.',
      categorySlug: 'nasional',
      tagSlugs: [],
      publishedAt: new Date('2019-03-16T07:48:14Z'),
      viewCount: 890,
    },
    {
      title: 'Menag Kecam Penembakan di New Zealand: Tak Berperikemanusiaan!',
      slug: 'menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan',
      content: `<p>Jakarta - Menteri Agaman Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand.</p>

<p>"Itu tindakan tidak berperikemanusiaan dan sangat bertentangan dengan nilai-nilai agama," kata Lukman dalam keterangan tertulis, Sabtu (16/3/2019).</p>`,
      excerpt: 'Menteri Agama Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand sebagai tindakan tidak berperikemanusiaan.',
      categorySlug: 'nasional',
      tagSlugs: ['kemenag', 'menteri-agama'],
      publishedAt: new Date('2019-03-16T07:56:50Z'),
      viewCount: 1230,
    },
    {
      title: 'Jokowi Minta ASEAN Tangani Masalah Muslim Rohingya di Rakhine State',
      slug: 'jokowi-minta-asean-tangani-masalah-muslim-rohingya-di-rakhine-state',
      content: `<p>Presiden Jokowi menerima Menteri Luar Negeri Thailand Don Pramudwinai di Istana Merdeka, Jakarta Pusat, Rabu (13/3/2019).</p>

<p>Dalam pertemuan, Jokowi menyampaikan pentingnya konsep kerja sama Indo-Pasifik terkait nasib muslim Rohingya di Kota Rakhine, Myanmar.</p>`,
      excerpt: 'Presiden Jokowi menyampaikan pentingnya keterlibatan ASEAN dalam menangani masalah Muslim Rohingya di Rakhine State, Myanmar.',
      categorySlug: 'nasional',
      tagSlugs: [],
      publishedAt: new Date('2019-03-16T17:57:26Z'),
      viewCount: 980,
    },
  ]

  for (const postData of postsData) {
    const [post] = await db.insert(schema.posts).values({
      title: postData.title,
      slug: postData.slug,
      content: postData.content,
      excerpt: postData.excerpt,
      authorId: admin.id,
      status: 'PUBLISHED',
      publishedAt: postData.publishedAt,
      viewCount: postData.viewCount,
      createdAt: postData.publishedAt,
      updatedAt: postData.publishedAt,
    }).returning()

    // Add category relation
    await db.insert(schema.postCategories).values({
      postId: post.id,
      categoryId: categories[postData.categorySlug].id,
    })

    // Add tag relations
    for (const tagSlug of postData.tagSlugs) {
      if (tags[tagSlug]) {
        await db.insert(schema.postTags).values({
          postId: post.id,
          tagId: tags[tagSlug].id,
        })
      }
    }

    console.log(`   Created post: ${post.title.substring(0, 50)}...`)
  }

  // ===========================================
  // CREATE MENUS
  // ===========================================
  console.log('📋 Creating menus...')

  const [primaryMenu] = await db.insert(schema.menus).values({
    name: 'Primary Menu',
    location: 'primary',
  }).returning()

  await db.insert(schema.menuItems).values([
    { menuId: primaryMenu.id, title: 'Beranda', url: '/', order: 0 },
    { menuId: primaryMenu.id, title: 'Nasional', url: '/category/nasional', order: 1 },
    { menuId: primaryMenu.id, title: 'Madrasah', url: '/category/madrasah', order: 2 },
    { menuId: primaryMenu.id, title: 'Pesantren', url: '/category/pesantren', order: 3 },
    { menuId: primaryMenu.id, title: 'Perguruan Tinggi', url: '/category/perguruan-tinggi', order: 4 },
    { menuId: primaryMenu.id, title: 'Opini', url: '/category/opini', order: 5 },
    { menuId: primaryMenu.id, title: 'Tokoh', url: '/category/tokoh', order: 6 },
  ])

  const [footerMenu] = await db.insert(schema.menus).values({
    name: 'Footer Menu',
    location: 'footer',
  }).returning()

  await db.insert(schema.menuItems).values([
    { menuId: footerMenu.id, title: 'Tentang Kami', url: '/tentang-kami', order: 0 },
    { menuId: footerMenu.id, title: 'Kontak', url: '/kontak', order: 1 },
    { menuId: footerMenu.id, title: 'Kebijakan Privasi', url: '/kebijakan-privasi', order: 2 },
    { menuId: footerMenu.id, title: 'Syarat & Ketentuan', url: '/syarat-ketentuan', order: 3 },
  ])

  // ===========================================
  // CREATE SETTINGS
  // ===========================================
  console.log('⚙️ Creating settings...')

  await db.insert(schema.settings).values([
    { key: 'site_name', value: 'Kilas Indonesia' },
    { key: 'site_description', value: 'Portal Berita Pendidikan Islam Indonesia' },
    { key: 'site_logo', value: '/images/logo.png' },
    { key: 'posts_per_page', value: '10' },
    { key: 'allow_comments', value: 'true' },
    { key: 'moderate_comments', value: 'true' },
  ])

  console.log('✅ Seed completed!')
  console.log('')
  console.log('📊 Summary:')
  console.log(`   - Users: 1`)
  console.log(`   - Categories: ${Object.keys(categories).length}`)
  console.log(`   - Tags: ${Object.keys(tags).length}`)
  console.log(`   - Posts: ${postsData.length}`)
  console.log(`   - Menus: 2`)
  console.log('')
  console.log('🔐 Admin credentials:')
  console.log('   Email: admin@kilasindonesia.com')
  console.log('   Password: admin123')

  // ===========================================
  // CREATE STATIC PAGES
  // ===========================================
  console.log('📄 Creating static pages...')

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

  await db.insert(schema.pages).values({
    slug: 'tentang-kami',
    title: 'Tentang Kilas Indonesia',
    content: aboutContent,
    excerpt: 'Kilas Indonesia adalah portal berita yang menyajikan informasi terkini, akurat, dan terpercaya seputar pendidikan Islam, madrasah, pesantren, dan berbagai topik menarik lainnya.',
    publishedAt: now,
    createdAt: now,
    updatedAt: now,
  })

  console.log('✅ Static pages created')
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e)
    process.exit(1)
  })
  .finally(async () => {
    await pool.end()
  })
