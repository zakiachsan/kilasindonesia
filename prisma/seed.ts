import { PrismaClient, Role, PostStatus, CommentStatus } from '@prisma/client'
import bcrypt from 'bcryptjs'

const prisma = new PrismaClient()

async function main() {
  console.log('🌱 Starting seed...')

  // Clear existing data
  await prisma.menuItem.deleteMany()
  await prisma.menu.deleteMany()
  await prisma.comment.deleteMany()
  await prisma.post.deleteMany()
  await prisma.tag.deleteMany()
  await prisma.category.deleteMany()
  await prisma.user.deleteMany()
  await prisma.setting.deleteMany()

  // ===========================================
  // CREATE ADMIN USER
  // ===========================================
  console.log('👤 Creating admin user...')
  const hashedPassword = await bcrypt.hash('admin123', 10)

  const admin = await prisma.user.create({
    data: {
      email: 'admin@kilasindonesia.com',
      password: hashedPassword,
      name: 'Admin',
      role: Role.ADMIN,
    },
  })

  // ===========================================
  // CREATE CATEGORIES (from WordPress data)
  // ===========================================
  console.log('📁 Creating categories...')

  const categories = await Promise.all([
    prisma.category.create({
      data: { name: 'Berita', slug: 'berita', description: 'Berita terkini' },
    }),
    prisma.category.create({
      data: { name: 'Politik', slug: 'politik', description: 'Berita politik' },
    }),
    prisma.category.create({
      data: { name: 'Hiburan', slug: 'hiburan', description: 'Berita hiburan' },
    }),
    prisma.category.create({
      data: { name: 'Olahraga', slug: 'olahraga', description: 'Berita olahraga' },
    }),
    prisma.category.create({
      data: { name: 'Otomotif', slug: 'otomotif', description: 'Berita otomotif' },
    }),
    prisma.category.create({
      data: { name: 'Budaya', slug: 'budaya', description: 'Berita budaya' },
    }),
    prisma.category.create({
      data: { name: 'Lingkungan', slug: 'lingkungan', description: 'Berita lingkungan' },
    }),
    prisma.category.create({
      data: { name: 'Kriminal', slug: 'kriminal', description: 'Berita kriminal' },
    }),
  ])

  // ===========================================
  // CREATE TAGS
  // ===========================================
  console.log('🏷️ Creating tags...')

  const tags = await Promise.all([
    prisma.tag.create({ data: { name: 'DKI Jakarta', slug: 'dki-jakarta' } }),
    prisma.tag.create({ data: { name: 'Sepakbola', slug: 'sepakbola' } }),
    prisma.tag.create({ data: { name: 'Bulutangkis', slug: 'bulutangkis' } }),
    prisma.tag.create({ data: { name: 'Mitsubishi', slug: 'mitsubishi' } }),
    prisma.tag.create({ data: { name: 'Daihatsu', slug: 'daihatsu' } }),
    prisma.tag.create({ data: { name: 'Nissan', slug: 'nissan' } }),
    prisma.tag.create({ data: { name: 'Gerindra', slug: 'gerindra' } }),
    prisma.tag.create({ data: { name: 'Breaking News', slug: 'breaking-news' } }),
  ])

  // ===========================================
  // CREATE SAMPLE POSTS
  // ===========================================
  console.log('📝 Creating sample posts...')

  const samplePosts = [
    {
      title: 'Pemerintah Umumkan Kebijakan Ekonomi Baru untuk Tahun 2026',
      slug: 'pemerintah-umumkan-kebijakan-ekonomi-baru-2026',
      content: `
        <p>Jakarta - Pemerintah Indonesia melalui Kementerian Keuangan mengumumkan serangkaian kebijakan ekonomi baru yang akan diterapkan mulai tahun 2026. Kebijakan ini bertujuan untuk mempercepat pertumbuhan ekonomi nasional dan meningkatkan kesejahteraan masyarakat.</p>

        <p>Menteri Keuangan dalam konferensi pers yang digelar di Jakarta menyatakan bahwa kebijakan ini mencakup beberapa aspek penting, termasuk insentif pajak untuk sektor UMKM, program stimulus untuk industri manufaktur, dan peningkatan anggaran infrastruktur.</p>

        <p>"Kami optimis kebijakan ini akan memberikan dampak positif bagi perekonomian Indonesia. Target pertumbuhan ekonomi tahun depan adalah 5,5 persen," ujar Menteri Keuangan.</p>

        <p>Para pelaku usaha menyambut positif kebijakan ini. Ketua Asosiasi Pengusaha Indonesia menyatakan bahwa insentif pajak akan sangat membantu pengembangan bisnis di tengah situasi ekonomi global yang masih belum stabil.</p>
      `,
      excerpt: 'Pemerintah mengumumkan kebijakan ekonomi baru untuk mempercepat pertumbuhan ekonomi nasional dan meningkatkan kesejahteraan masyarakat.',
      categoryIndex: 1, // Politik
      tagIndices: [0, 7], // DKI Jakarta, Breaking News
    },
    {
      title: 'Timnas Indonesia Raih Kemenangan Bersejarah di Piala Asia',
      slug: 'timnas-indonesia-raih-kemenangan-piala-asia',
      content: `
        <p>Jakarta - Tim nasional Indonesia berhasil meraih kemenangan bersejarah dalam pertandingan Piala Asia melawan tim kuat Asia Tenggara. Pertandingan yang berlangsung di Stadion Gelora Bung Karno ini disaksikan puluhan ribu suporter yang memenuhi tribun.</p>

        <p>Gol kemenangan dicetak oleh striker andalan Timnas pada menit ke-78 melalui tendangan bebas yang tidak dapat dijangkau oleh kiper lawan. Suporter meledak dalam kegembiraan menyambut gol tersebut.</p>

        <p>"Ini adalah momen yang sangat spesial bagi sepakbola Indonesia. Kami persembahkan kemenangan ini untuk seluruh rakyat Indonesia," ujar pelatih Timnas dalam konferensi pers pasca pertandingan.</p>

        <p>Kemenangan ini membawa Indonesia ke posisi puncak klasemen grup dengan poin sempurna dari dua pertandingan.</p>
      `,
      excerpt: 'Timnas Indonesia meraih kemenangan bersejarah dalam pertandingan Piala Asia dengan dukungan puluhan ribu suporter.',
      categoryIndex: 3, // Olahraga
      tagIndices: [1], // Sepakbola
    },
    {
      title: 'Daihatsu Luncurkan Mobil Listrik Pertama untuk Pasar Indonesia',
      slug: 'daihatsu-luncurkan-mobil-listrik-pertama-indonesia',
      content: `
        <p>Jakarta - Daihatsu Indonesia resmi memperkenalkan mobil listrik pertamanya untuk pasar Indonesia. Peluncuran ini menandai langkah besar produsen otomotif Jepang tersebut dalam mendukung transisi energi bersih di Indonesia.</p>

        <p>Mobil listrik ini hadir dengan desain kompak yang cocok untuk kondisi jalanan Indonesia. Dengan jarak tempuh hingga 300 km dalam sekali pengisian, kendaraan ini ditargetkan untuk konsumen urban yang peduli lingkungan.</p>

        <p>"Kami bangga menjadi bagian dari revolusi kendaraan listrik di Indonesia. Mobil ini dirancang khusus dengan mempertimbangkan kebutuhan konsumen Indonesia," kata Presiden Direktur Daihatsu Indonesia.</p>

        <p>Harga mobil listrik ini dibanderol kompetitif dengan subsidi pemerintah untuk kendaraan ramah lingkungan.</p>
      `,
      excerpt: 'Daihatsu memperkenalkan mobil listrik pertamanya untuk pasar Indonesia dengan desain kompak dan harga kompetitif.',
      categoryIndex: 4, // Otomotif
      tagIndices: [4], // Daihatsu
    },
    {
      title: 'Festival Budaya Nusantara Digelar di 10 Kota Besar',
      slug: 'festival-budaya-nusantara-10-kota-besar',
      content: `
        <p>Jakarta - Kementerian Pendidikan dan Kebudayaan menggelar Festival Budaya Nusantara yang akan berlangsung serentak di 10 kota besar Indonesia. Festival ini bertujuan untuk melestarikan dan mempromosikan kekayaan budaya Indonesia kepada generasi muda.</p>

        <p>Festival akan menampilkan berbagai pertunjukan seni tradisional, pameran kerajinan tangan, kuliner khas daerah, dan workshop budaya. Setiap kota akan menampilkan keunikan budaya lokal masing-masing.</p>

        <p>"Festival ini adalah wujud komitmen kami dalam melestarikan budaya bangsa. Kami berharap generasi muda dapat lebih mengenal dan mencintai budaya Indonesia," ujar Menteri Pendidikan dan Kebudayaan.</p>

        <p>Festival akan berlangsung selama satu bulan dengan berbagai rangkaian acara menarik.</p>
      `,
      excerpt: 'Festival Budaya Nusantara digelar serentak di 10 kota besar untuk melestarikan dan mempromosikan kekayaan budaya Indonesia.',
      categoryIndex: 5, // Budaya
      tagIndices: [],
    },
    {
      title: 'Program Penghijauan Nasional Tanam 10 Juta Pohon',
      slug: 'program-penghijauan-nasional-10-juta-pohon',
      content: `
        <p>Jakarta - Pemerintah melalui Kementerian Lingkungan Hidup dan Kehutanan meluncurkan program penghijauan nasional dengan target menanam 10 juta pohon di seluruh Indonesia. Program ini merupakan bagian dari upaya mitigasi perubahan iklim.</p>

        <p>Program akan melibatkan partisipasi masyarakat, komunitas pecinta lingkungan, sekolah, dan perusahaan. Setiap provinsi akan mendapatkan alokasi bibit pohon sesuai dengan kebutuhan dan kondisi geografis masing-masing.</p>

        <p>"Dengan menanam 10 juta pohon, kita tidak hanya memperbaiki lingkungan tetapi juga menciptakan masa depan yang lebih hijau untuk generasi mendatang," kata Menteri LHK.</p>

        <p>Program ini akan dimulai pada musim penghujan untuk memastikan tingkat keberhasilan penanaman yang tinggi.</p>
      `,
      excerpt: 'Program penghijauan nasional diluncurkan dengan target menanam 10 juta pohon di seluruh Indonesia.',
      categoryIndex: 6, // Lingkungan
      tagIndices: [7], // Breaking News
    },
  ]

  for (const postData of samplePosts) {
    const post = await prisma.post.create({
      data: {
        title: postData.title,
        slug: postData.slug,
        content: postData.content,
        excerpt: postData.excerpt,
        authorId: admin.id,
        status: PostStatus.PUBLISHED,
        publishedAt: new Date(),
        viewCount: Math.floor(Math.random() * 1000),
        categories: {
          connect: [{ id: categories[postData.categoryIndex].id }],
        },
        tags: {
          connect: postData.tagIndices.map((i) => ({ id: tags[i].id })),
        },
      },
    })

    // Add sample comment
    await prisma.comment.create({
      data: {
        postId: post.id,
        authorName: 'Pembaca',
        authorEmail: 'pembaca@example.com',
        content: 'Artikel yang sangat informatif! Terima kasih atas informasinya.',
        status: CommentStatus.APPROVED,
      },
    })
  }

  // ===========================================
  // CREATE MENUS
  // ===========================================
  console.log('📋 Creating menus...')

  const primaryMenu = await prisma.menu.create({
    data: {
      name: 'Primary Menu',
      location: 'primary',
      items: {
        create: [
          { title: 'Beranda', url: '/', order: 0 },
          { title: 'Berita', url: '/category/berita', order: 1 },
          { title: 'Politik', url: '/category/politik', order: 2 },
          { title: 'Olahraga', url: '/category/olahraga', order: 3 },
          { title: 'Hiburan', url: '/category/hiburan', order: 4 },
          { title: 'Otomotif', url: '/category/otomotif', order: 5 },
        ],
      },
    },
  })

  const footerMenu = await prisma.menu.create({
    data: {
      name: 'Footer Menu',
      location: 'footer',
      items: {
        create: [
          { title: 'Tentang Kami', url: '/tentang-kami', order: 0 },
          { title: 'Kontak', url: '/kontak', order: 1 },
          { title: 'Kebijakan Privasi', url: '/kebijakan-privasi', order: 2 },
          { title: 'Syarat & Ketentuan', url: '/syarat-ketentuan', order: 3 },
        ],
      },
    },
  })

  // ===========================================
  // CREATE SETTINGS
  // ===========================================
  console.log('⚙️ Creating settings...')

  await prisma.setting.createMany({
    data: [
      { key: 'site_name', value: 'Kilas Indonesia' },
      { key: 'site_description', value: 'Portal Berita Indonesia Terkini' },
      { key: 'site_logo', value: '/images/logo.png' },
      { key: 'posts_per_page', value: '10' },
      { key: 'allow_comments', value: 'true' },
      { key: 'moderate_comments', value: 'true' },
    ],
  })

  console.log('✅ Seed completed!')
  console.log('')
  console.log('📊 Summary:')
  console.log(`   - Users: 1`)
  console.log(`   - Categories: ${categories.length}`)
  console.log(`   - Tags: ${tags.length}`)
  console.log(`   - Posts: ${samplePosts.length}`)
  console.log(`   - Menus: 2`)
  console.log('')
  console.log('🔐 Admin credentials:')
  console.log('   Email: admin@kilasindonesia.com')
  console.log('   Password: admin123')
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
