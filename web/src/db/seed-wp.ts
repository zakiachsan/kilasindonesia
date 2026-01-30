import 'dotenv/config'
import { drizzle } from 'drizzle-orm/node-postgres'
import { Pool } from 'pg'
import * as schema from './schema'

const pool = new Pool({ connectionString: process.env.DATABASE_URL })
const db = drizzle(pool, { schema })

async function main() {
  console.log('🌱 Starting seed with WordPress data...')

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

  // ===========================================
  // CREATE ADMIN USER
  // ===========================================
  console.log('👤 Creating admin user...')
  const hashedPassword = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'

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
    { name: 'Balapan', slug: 'balapan' },
    { name: 'Berita Olahraga', slug: 'berita-olahraga' },
    { name: 'Berita Otomotif', slug: 'berita-otomotif' },
    { name: 'Bulutangkis', slug: 'bulutangkis' },
    { name: 'Daihatsu', slug: 'daihatsu' },
    { name: 'DKI Jakarta', slug: 'dki-jakarta' },
    { name: 'Gerindra', slug: 'gerindra' },
    { name: 'Kejahatan', slug: 'kejahatan' },
    { name: 'Mitsubishi', slug: 'mitsubishi' },
    { name: 'New Zealand', slug: 'new-zealand' },
    { name: 'Nissan', slug: 'nissan' },
    { name: 'Rohinya', slug: 'rohinya' },
    { name: 'Sepakbola', slug: 'sepakbola' },
    { name: 'Tag Berita', slug: 'tag-berita' },
    { name: 'Pendidikan Profesi Guru', slug: 'pendidikan-profesi-guru' },
    { name: 'Program Indonesia Pintar', slug: 'program-indonesia-pintar' },
    { name: 'MADADA', slug: 'madada' },
    { name: 'Akminas', slug: 'akminas' },
    { name: 'Prabowo Subianto', slug: 'prabowo-subianto' },
    { name: 'Nasaruddin Umar', slug: 'nasaruddin-umar' },
    { name: 'Indonesia Emas 2045', slug: 'indonesia-emas-2045' },
    { name: 'Asep Saepudin Jahar', slug: 'asep-saepudin-jahar' },
    { name: 'Pondok Pesantren Al-Khoziny', slug: 'pondok-pesantren-al-khoziny' },
    { name: 'Hari Santri Nasional', slug: 'hari-santri-nasional' },
    { name: 'Beasiswa Santri Berprestasi', slug: 'beasiswa-santri-berprestasi' },
    { name: 'Direktorat Jenderal Pesantren', slug: 'direktorat-jenderal-pesantren' },
    { name: 'MRC 2025', slug: 'mrc-2025' },
    { name: 'MAN 3 Bantul', slug: 'man-3-bantul' },
    { name: 'Puspresnas', slug: 'puspresnas' },
    { name: 'Smesco Exhibition Hall', slug: 'smesco-exhibition-hall' },
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
      title: "Solidaritas Korban Penembakan, DKI Beri Warna Bendera New Zealand di JPO GBK",
      slug: "solidaritas-korban-penembakan-dki-beri-warna-bendera-new-zealand-di-jpo-gbk",
      content: "Pemprov DKI turut berbelasungkawa atas penembakan di dua masjid di Christchurch, New Zealand, yang menewaskan 49 orang.\n\nWarna-warna bendera Selandia Baru akan dimunculkan selama seminggu di jembatan penyeberangan orang (JPO) Gelora Bung Karno.\n\nKepala Dinas Bina Marga Hari Nugroho mengatakan kombinasi warna itu dimunculkan di JPO GBK sebagai bentuk solidaritas dan dukungan Jakarta kepada Selandia Baru. Terutama keluarga korban penembakan massal di dua masjid tersebut.\n\n\"Ini sesuai dengan arahan Pak Gubernur,\" ujar Hari lewat keterangannya, Sabtu (16/3/2019).\n\nPemunculan warna-warna bendera Selandia Baru ini sudah dilakukan sejak Jumat (15/3) malam. Kombinasi warna yang ada di bendera tersebut adalah merah, biru, dan putih.",
      excerpt: "Pemprov DKI turut berbelasungkawa atas penembakan di dua masjid di Christchurch, New Zealand, yang menewaskan 49 orang. Warna-warna bendera Selandia Baru akan dimunculkan selama seminggu di jembatan p...",
      categorySlug: 'nasional',
      tagSlugs: ["new-zealand","tag-berita"],
      publishedAt: new Date('2019-03-16T07:48:14.000Z'),
      viewCount: 609,
    },
    {
      title: "Menag Kecam Penembakan di New Zealand: Tak Berperikemanusiaan!",
      slug: "menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan",
      content: "Jakarta - Menteri Agaman Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand. Dia mengatakan aksi terorisme itu bertentangan dengan nilai-nilai agama.\n\n\"Itu tindakan tidak berperikemanusiaan dan sangat bertentangan dengan nilai-nilai agama,\" kata Lukman dalam keterangan tertulis, Sabtu (16/3/2019).\n\nLukman mengatakan aksi terorisme tidak dibenarkan dalam ajaran agama apa pun. Jadi, menurutnya, penembakan terhadap jemaah di dua Masjid di Selandia Baru adalah aksi pengecut dan tak bertanggung jawab.\n\nDia mengajak seluruh umat beragam untuk menahan diri dan meningkatkan kewaspadaan. Pemerintah melalui Kementerian Luar Negeri juga bekerja keras mencari kabar perkembangan kondisi di Selandia Baru, termasuk memastikan kondisi keamanan warga negara Indonesia.\n\nDia juga meminta seluruh warga tidak menyebarkan video aksi penembakan yang dilakukan pelaku.",
      excerpt: "Jakarta - Menteri Agaman Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand. Dia mengatakan aksi terorisme itu bertentangan dengan nilai-nilai agama. \"Itu tinda...",
      categorySlug: 'nasional',
      tagSlugs: ["new-zealand","tag-berita"],
      publishedAt: new Date('2019-03-16T07:56:50.000Z'),
      viewCount: 5134,
    },
    {
      title: "2 Hari Hilang, Nelayan Tewas Mengambang di Pantai Cipalawah Garut",
      slug: "2-hari-hilang-nelayan-tewas-mengambang-di-pantai-cipalawah-garut",
      content: "Garut - Setelah melakukan pencarian selama dua hari, petugas Basarnas dan Polairud menemukan jasad Maulana di Pantai Cipalawah, Kabupaten Garut, Jawa Barat. Jenazah pria tersebut langsung dievakuasi petugas.\n\n\"Setelah melakukan pencarian selama 2 hari, Tim SAR Bandung akhirnya dapat menemukan korban.\n\nDitemukan dalam keadaan meninggal dunia,\" kata Humas Kantor SAR Bandung Joshua Banjarnahor via pesan singkat, Sabtu (16/3/2019).\n\nNelayan berusia 45 tahun asal Garut ini dilaporkan hilang di pesisir Pantai Cipalawah, Desa Sancang, Kecamatan Cibalong, Garut, Kamis (14/3).\n\nKapolsek Cibalong AKP Ridwan Tampubolon menyebutkan Maulana menghilang saat hendak mencari ikan dengan cara menyelam di pantai menggunakan busur panah.",
      excerpt: "Garut - Setelah melakukan pencarian selama dua hari, petugas Basarnas dan Polairud menemukan jasad Maulana di Pantai Cipalawah, Kabupaten Garut, Jawa Barat. Jenazah pria tersebut langsung dievakuasi p...",
      categorySlug: 'nasional',
      tagSlugs: ["kejahatan","tag-berita"],
      publishedAt: new Date('2019-03-16T08:22:08.000Z'),
      viewCount: 1648,
    },
    {
      title: "14 Tahun Terbunuhnya Munir, Polri Didesak Bentuk Tim Khusus",
      slug: "14-tahun-terbunuhnya-munir-polri-didesak-bentuk-tim-khusus",
      content: "Jakarta - Hari yang sama 14 tahun lalu, Munir Said Thalib meninggal di dalam pesawat yang mengantarnya ke Amsterdam, Belanda. Munir diracun di udara.\n\nPollycarpus Budihari Priyanto, seorang pilot senior Garuda Indonesia saat itu, ditangkap dan diadili. Dia divonis 14 tahun penjara, tetapi majelis hakim yang mengadilinya yakin ada dalang di balik pembunuhan Munir. Siapa?\n\nPertanyaan itu hingga Pollycarpus akhirnya bebas tahun ini pun belum terjawab. Presiden Joko Widodo (Jokowi) didesak mengambil tindakan.\n\n\"Kembali kami menegaskan negara belum mampu membongkar konspirasi dalam kejahatan ini.\n\nPernyataan Presiden Joko Widodo bahwa kasus pembunuhan Munir adalah pekerjaan rumah yang harus diselesaikan masih sebatas janji tanpa bukti,\" ujar salah satu aktivis HAM dari Kontras, Yati Andriani, di Jalan Kramat II, Senen, Jakarta Pusat, Jumat (7/9/2018).",
      excerpt: "Jakarta - Hari yang sama 14 tahun lalu, Munir Said Thalib meninggal di dalam pesawat yang mengantarnya ke Amsterdam, Belanda. Munir diracun di udara. Pollycarpus Budihari Priyanto, seorang pilot senio...",
      categorySlug: 'nasional',
      tagSlugs: ["kejahatan","tag-berita"],
      publishedAt: new Date('2019-03-16T08:28:00.000Z'),
      viewCount: 587,
    },
    {
      title: "Prabowo Resmikan Kantor DPD Gerindra di Banten",
      slug: "prabowo-resmikan-kantor-dpd-gerindra-di-banten",
      content: "Serang - Capres Prabowo Subianto meresmikan kantor baru DPD Gerindra Banten di Jalan Serang-Pandeglang. Selain meresmikan, kedatangannya ke Banten akan bertemu dengan pendukung di rumah aspirasi.\n\nKetua DPD Banten Desmon J Mahesa mengatakan, Prabowo secara khusus meresmikan rumah partai Gerindra Banten yang baru.\n\nPrabowo juga dijadwalkan menyapa partai koalisi, relawan dan masyarakat Banten.\n\n\"Hari ini Pak Prabowo datang dalam rangka meresmikan DPD partai, kedua akan ke rumah aspirasi saya di Ciwaru dalam rangka menyapa masyarakat,\" kata Desmon singkat di Jalan Serang-Pandeglang, Banten, Sabtu (16/3/2019).\n\nPrabowo langsung memberikan tumpeng ke salah satu tokoh Banten Buya Humaid Tanara sebagai prosesi peresmian. Ia juga menandatangani prasasti gedung DPD Gerindra.",
      excerpt: "Serang - Capres Prabowo Subianto meresmikan kantor baru DPD Gerindra Banten di Jalan Serang-Pandeglang. Selain meresmikan, kedatangannya ke Banten akan bertemu dengan pendukung di rumah aspirasi. Ketu...",
      categorySlug: 'nasional',
      tagSlugs: ["gerindra","tag-berita"],
      publishedAt: new Date('2019-03-16T08:55:46.000Z'),
      viewCount: 2255,
    },
    {
      title: "Video: Kelemahan dan Kelebihan All New Terios",
      slug: "video-kelemahan-dan-kelebihan-all-new-terios",
      content: "Daihatsu Terios pertama kali terjun ke pasar Tanah Air 2006 silam. Setelah berumur 10 tahun lebih, PT Astra Daihatsu Motor (ADM) sadar kalau persaingan mulai ketat, maka PT ADM meluncurkan model terbarunya pada November 2017 lalu dengan ubahan yang signifikan.\n\nMenariknya meskipun eksterior, interior berubah total dan berbagai fitur canggih sudah tertanam pada All New Terios harga jualnya masih sama dengan versi sebelumnya.\n\nSeperti diketahui, Terios baru ini sudah dibekali fitur smart keyless, vehicle stability control, around view monitor, dan Hill Start Assist.\n\nSementara untuk dapur pacunya, Terios baru ini juga memiliki mesin baru yang sama dengan mesin Toyota Avanza yakni, 2NR-VE berkapasitas 1.500 cc yang dapat menyemburkan tenaga 104 daya kuda dan torsi 135 newton meter, dengan pilihan transmisi matik konvensional 4-percepatan dan manual 5-percepatan.",
      excerpt: "Daihatsu Terios pertama kali terjun ke pasar Tanah Air 2006 silam. Setelah berumur 10 tahun lebih, PT Astra Daihatsu Motor (ADM) sadar kalau persaingan mulai ketat, maka PT ADM meluncurkan model terba...",
      categorySlug: 'madrasah',
      tagSlugs: ["berita-otomotif","daihatsu"],
      publishedAt: new Date('2019-03-16T09:03:53.000Z'),
      viewCount: 3252,
    },
    {
      title: "Aliansi Nissan-Mitsubishi Luncurkan Livina Versi Mungil",
      slug: "aliansi-nissan-mitsubishi-luncurkan-livina-versi-mungil",
      content: "Nissan meluncurkan Nissan Livina berbasis Xpander beberapa waktu lalu di Indonesia. Di Jepang, aliansi Nissan-Mitsubishi meluncurkan empat mobil jenis Kei car baru.\n\nBeberapa kendaraan di antaranya: Nissan Dayz, Nissan Dayz Highway Star, Mitsubishi eK Wagon dan Mitsubishi eK X. Bentuknya sangat mirip dengan Livina dan Xpander.\n\nNah, produksi mobil mini ini, ditangani oleh perusahaan patungan, NMKV. Dan mereka siap melakukan produksi di Pabrik Mizushima Mitsubishi di Kurashiki, Jepang.\n\nSebetulnya, kerja bareng antara Nissan dengan Mitsubishi meluncurkan Kei car terjalin pada 2013. Lalu terjadi peningkatan kolaborasi bisnis, sejak keduanya menjadi mitra aliansi pada 2016.\n\nUntuk pertama kalinya, Kei car Nissan dan Mitsubishi siap menawarkan teknologi mengemudi semi-otonom. Kemampuan yang dirancang untuk penggunaan jalur tunggal di jalan raya.",
      excerpt: "Nissan meluncurkan Nissan Livina berbasis Xpander beberapa waktu lalu di Indonesia. Di Jepang, aliansi Nissan-Mitsubishi meluncurkan empat mobil jenis Kei car baru. Beberapa kendaraan di antaranya: Ni...",
      categorySlug: 'madrasah',
      tagSlugs: ["berita-otomotif","nissan"],
      publishedAt: new Date('2019-03-16T09:37:12.000Z'),
      viewCount: 613,
    },
    {
      title: "Sosok New Nissan Livina Terungkap, Apa Kata NMI?",
      slug: "sosok-new-nissan-livina-terungkap-apa-kata-nmi",
      content: "Setelah pecinta otomotif dihebohkan dengan bocoran Toyota Avanza baru, kini muncul gambar yang disinyalir sebagai Nissan Livina anyar.\n\nGambar tersebut, beredar luas di media sosial dan juga grup aplikasi percakapan elektronik.\n\nDilihat dari gambar yang beredar, Nissan Livina baru ini memperlihatkan wajah depan yang cukup jelas.\n\nJika diperhatikan, muka low multi purpose vehicle (LMVP) andalan PT Nissan Motor Indonesia (NMI) ini mirip dengan salah satu sport utility vehicle (SUV) yang cukup populer, X-Trail.\n\n\"New Livina pesan sekarang, hanya di Nissan Datsun Sunter,\" tulis keterangan sebagai caption dalam foto yang beredar terebut.\n\nMencoba mengkonfirmasi kepada pihak NMI, melalui Head of Communicationnya, Hana Maharani enggan berkomentar terkait foto yang beredar tersebut.",
      excerpt: "Setelah pecinta otomotif dihebohkan dengan bocoran Toyota Avanza baru, kini muncul gambar yang disinyalir sebagai Nissan Livina anyar. Gambar tersebut, beredar luas di media sosial dan juga grup aplik...",
      categorySlug: 'madrasah',
      tagSlugs: ["berita-otomotif","nissan"],
      publishedAt: new Date('2019-03-16T09:43:44.000Z'),
      viewCount: 5392,
    },
    {
      title: "Demi Xpander, Mitsubishi Bakal Mengimpor Kembali Pajero Sport",
      slug: "demi-xpander-mitsubishi-bakal-mengimpor-kembali-pajero-sport",
      content: "Peningkatan penjualan yang sangat signifikan untuk small MPV PT Mitsubishi Motors Krama Yudha Sales Indonesia (MMKSI), Xpander sepertinya bakal berpengaruh terhadap model lain pabrikan berlambang tiga berlian ini.\n\nPasalnya, beredar rencana untuk mengejar produksi pesaing Toyota Avanza ini, Pajero Sport bakal kembali berstatus impor alias CBU.\n\nMenurut Direktur of Sales &amp; Marketing Division PT MMKSI, Irwan Kuncoro, hingga saat ini Pajero Sport masih diproduksi di Indonesia.\n\nJadi, kalaupun dikaitkan dengan rencana ada impor itu, sebetulnya itu rencana untuk sementara, karena itu bagian dari peningkatan kapasitas untuk Xpander,\" jelas Irwan di sela-sela media gathering, di bilangan Jakarta Pusat, belum lama ini.\n\nLanjut Irwan, rencana status Pajero Sport yang kembali impor memang belum terealisasi. Dan berbicara sampai kapan, memang harus dilihat dahulu, kapan waktu mulainya, karena hingga saat ini memang belum dilaksanakan (impor Pajero Sport).",
      excerpt: "Peningkatan penjualan yang sangat signifikan untuk small MPV PT Mitsubishi Motors Krama Yudha Sales Indonesia (MMKSI), Xpander sepertinya bakal berpengaruh terhadap model lain pabrikan berlambang tiga...",
      categorySlug: 'madrasah',
      tagSlugs: ["berita-otomotif","mitsubishi"],
      publishedAt: new Date('2019-03-16T10:53:59.000Z'),
      viewCount: 4552,
    },
    {
      title: "Jokowi Minta ASEAN Tangani Masalah Muslim Rohingya di Rakhine State",
      slug: "jokowi-minta-asean-tangani-masalah-muslim-rohingya-di-rakhine-state",
      content: "Presiden Jokowi menerima Menteri Luar Negeri Thailand Don Pramudwinai di Istana Merdeka, Jakarta Pusat, Rabu (13/3/2019).\n\nDalam pertemuan, Jokowi menyampaikan pentingnya konsep kerja sama Indo-Pasifik terkait nasib muslim Rohingya di Kota Rakhine, Myanmar.\n\n\"Mengenai masalah Rakhine State, Presiden menyampaikan pentingnya keterlibatan ASEAN dalam membantu Myanmar di dalam mempersiapkan repatriasi yang sukarela, damai, dan bermartabat,\" kata Menteri Luar Negeri Retno Marsudi usai melakukan pertemuan di Istana Merdeka, Jakara Pusat, Rabu (13/3/2019).\n\nRetno mengatakan, Thailand, yang saat ini menjadi Ketua Negara-Negara ASEAN, perlu membahas lebih jauh mengenai rencana itu.",
      excerpt: "Presiden Jokowi menerima Menteri Luar Negeri Thailand Don Pramudwinai di Istana Merdeka, Jakarta Pusat, Rabu (13/3/2019). Dalam pertemuan, Jokowi menyampaikan pentingnya konsep kerja sama Indo-Pasifik...",
      categorySlug: 'nasional',
      tagSlugs: ["rohinya","tag-berita"],
      publishedAt: new Date('2019-03-16T17:57:26.000Z'),
      viewCount: 2892,
    },
    {
      title: "Pergantian Jitu Luis Milla yang Mengantar Indonesia ke Semifinal",
      slug: "pergantian-jitu-luis-milla-yang-mengantar-indonesia-ke-semifinal",
      content: "Jakarta - Indonesia berhasil mengalahkan Kamboja 2-0. Sempat buntu di babak pertama, Luis Milla mengubah taktik dan berbuah hasil.\n\nBermain di Stadion Shah Alam, Malaysia, Kamis (24/8/2017) sore WIB, Luis Milla kembali menurunkan formasi andalal 4-2-3-1. Dengan target meraih kemenangan 3-0 atas Kamboja demi mengamankan tike ke semifinal. Marinus Maryanto Wanewar dimainkan sejak menit pertama.\n\nMarinus disokong oleh Septian David Maulan yang tepat ada di belakang. Sementara itu, Osvaldo Haay dan Saddil Ramdani bertugas sebagai penyisir sisi kanan dan kiri.\n\n<!--nextpage-->\n\nDi posisi poros tengah, Muhammad Hargianto berduet dengan Evan Dimas. Sementara itu, Ricky Fajrin kembali ke posisi semula sebagai bek kiri untuk menggantikan peran Rezaldi Hehanusa.\n\nSeperti yang sudah-sudah, Indonesia kembali menyerang dengan mengandalkan kecepatan di sisi lapangan. Umpan-umpan silang pun jadi opsi untuk masuk ke area kotak penalti.\n\nNamun, upaya tersebut kerap gagal. Osvaldo, yang ada di sisi kiri tampil kurang oke dalam memberi tusukan ke kotak penalti. Tak hanya itu, umpan silang yang dikirim dari kedua sisi Indonesia juga kerap mudah dipatahkan.",
      excerpt: "Jakarta - Indonesia berhasil mengalahkan Kamboja 2-0. Sempat buntu di babak pertama, Luis Milla mengubah taktik dan berbuah hasil. Bermain di Stadion Shah Alam, Malaysia, Kamis (24/8/2017) sore WIB, L...",
      categorySlug: 'pesantren',
      tagSlugs: ["berita-olahraga","sepakbola"],
      publishedAt: new Date('2019-03-17T08:28:54.000Z'),
      viewCount: 828,
    },
    {
      title: "Tontowi Ahmad/Liliyana Natsir Sabet Gelar Juara Dunia Kedua",
      slug: "tontowi-ahmad-liliyana-natsir-sabet-gelar-juara-dunia-kedua",
      content: "Ganda campuran Indonesia, Tontowi Ahmad/Liliyana Natsir menjadi juara pada Kejuaraan Dunia Bulu Tangkis 2017 di Glasgow, Skotlandia, Senin (28/8/2017) WIB.\n\nOwi/Butet mengalahkan pasangan asal China, Zheng Siwei/Chen Qingchen, dengan skor 15-21, 21-16, 21-15.\n\nIni menjadi gelar juara dunia bulu tangkis kedua bagi Tontowi/Liliyana.\n\nPenempatan bola yang mereka lakukan beberapa kali sukses mengelabui Tontowi/Liliyana.\n\nOwi/Butet bangkit pada gim kedua berkat sejumlah kesalahan yang dilakukan Zheng/Chen.\n\nGim kedua akhirnya dimenangi oleh Tontowi/Liliyana dan pertandingan harus ditentukan melalui rubber game.",
      excerpt: "Ganda campuran Indonesia, Tontowi Ahmad/Liliyana Natsir menjadi juara pada Kejuaraan Dunia Bulu Tangkis 2017 di Glasgow, Skotlandia, Senin (28/8/2017) WIB. Owi/Butet mengalahkan pasangan asal China, Z...",
      categorySlug: 'pesantren',
      tagSlugs: ["berita-olahraga","bulutangkis"],
      publishedAt: new Date('2019-03-17T08:32:45.000Z'),
      viewCount: 1759,
    },
    {
      title: "Klasemen F1 2019 Usai Bottas Menangi GP Australia",
      slug: "klasemen-f1-2019-usai-bottas-menangi-gp-australia",
      content: "Driver Mercedes Valtteri Bottas memenangi seri pembuka Formula 1 2019 dalam Grand Prix Australia. Berikut klasemen pebalap usai race tersebut.\n\nDi Sirkuit Melbourne Park, Australia, Minggu (17/3/2019), Bottas menjadi yang tercepat dengan waktu 1 jam 25 menit 27.325 detik, unggul 20,8 detik dari rekan setimnya di Mercedes Lewis Hamilton.\n\nHamilton sendiri finis kedua, meski memulai balapan dari posisi terdepan.\n\nDi tempat ketiga ada driver Red Bull Max Verstapen, disusul duo Ferrari Sebastian Vettel dan Charles Leclerc yang mengunci posisi lima besar.\n\nSementara Bottas pun memimpin klasemen pebalap dengan 26 poin. Driver asal Finlandia itu mendapat tambahan satu poin usai juga berhasil menorehkan waktu lap tercepat dalam balapan kali ini.\n\nAturan baru F1 sendiri akan memberi peraih waktu lap tercepat dalam posisi 10 besar tambahan satu angka.",
      excerpt: "Driver Mercedes Valtteri Bottas memenangi seri pembuka Formula 1 2019 dalam Grand Prix Australia. Berikut klasemen pebalap usai race tersebut. Di Sirkuit Melbourne Park, Australia, Minggu (17/3/2019),...",
      categorySlug: 'pesantren',
      tagSlugs: ["balapan","berita-olahraga"],
      publishedAt: new Date('2019-03-17T08:43:26.000Z'),
      viewCount: 5453,
    },
    {
      title: "Tunggal Putra Paceklik Gelar All England 25 Tahun, Ini Saran Untuk Jonatan dkk",
      slug: "tunggal-putra-paceklik-gelar-all-england-25-tahun-ini-saran-untuk-jonatan-dkk",
      content: "Sudah 25 tahun tunggal putra puasa gelar juara All England 2019. Legenda bulutangkis, Haryanto Arbi, meminta agar Jonatan Christie dkk berlatih lebih keras lagi.\n\nIndonesia hanya merebut satu gelar juara dari All England 2019, yakni dari pasangan nonpelatnas, Hendra Setiawan/Mohammad Ahsan.\n\nDengan kekuatan tiga pemain di sektor tunggal, tak satupun yang lolos ke semifinal.\n\nAnthony Sinisuka Ginting tersingkir di babak pertama, Jonatan Christie menyudahi penampilan di babak kedua, sedangkan Tommy harus pulang setelah kalah di perempatfinal.",
      excerpt: "Sudah 25 tahun tunggal putra puasa gelar juara All England 2019. Legenda bulutangkis, Haryanto Arbi, meminta agar Jonatan Christie dkk berlatih lebih keras lagi. Indonesia hanya merebut satu gelar jua...",
      categorySlug: 'pesantren',
      tagSlugs: ["berita-olahraga","bulutangkis"],
      publishedAt: new Date('2019-03-17T08:48:07.000Z'),
      viewCount: 2588,
    },
    {
      title: "Bersih-bersih, 60 Warga Tanjung Priok Ikuti Program Padat Karya",
      slug: "bersih-bersih-60-warga-tanjung-priok-ikuti-program-padat-karya",
      content: "Jakarta - Kementerian Perhubungan (Kemenhub) melalui Distrik Navigasi (Disnav) Kelas I Tanjung Priok Jakarta menggelar program padat karya.\n\nSedikitnya 60 orang warga dari Kelurahan Tanjung Priok, Pademangan Barat, Sungai Bambu, dan Warakas Jakarta Utara turut terlibat dalam kegiatan ini.\n\n\"Program padat karya yang dilaksanakan di berbagai kantor Distrik Navigasi yang tersebar di seluruh Indonesia, termasuk di Distrik Navigasi Kelas I Tanjung Priok ini dilaksanakan secara berkesinambungan dari tahun ke tahun secara swakelola,\" kata Direktur Kenavigasian, Basar Antonius dalam keterangan tertulis, Sabtu (16/3/2019).\n\nHal tersebut diungkapkannya saat membuka kegiatan padat karya tersebut di halaman Kantor Disnav Kelas I Tanjung Priok, Jakarta.\n\nMenurut Basar, kegiatan padat karya seperti ini dapat membuat lingkungan kerja yang bersih dan nyaman bagi para pegawai Disnav Tanjung Priok.",
      excerpt: "Jakarta - Kementerian Perhubungan (Kemenhub) melalui Distrik Navigasi (Disnav) Kelas I Tanjung Priok Jakarta menggelar program padat karya. Sedikitnya 60 orang warga dari Kelurahan Tanjung Priok, Pade...",
      categorySlug: 'nasional',
      tagSlugs: ["dki-jakarta","tag-berita"],
      publishedAt: new Date('2019-03-16T08:10:58.000Z'),
      viewCount: 2902,
    },
    {
      title: "Kado Hari Santri, Presiden Setujui Pembentukan Ditjen Pesantren",
      slug: "kado-hari-santri-presiden-setujui-pembentukan-ditjen-pesantren",
      content: "KILASINDONESIA.COM-Kabar gembira datang bertepatan dengan peringatan Hari Santri 2025. Presiden Prabowo Subianto menyetujui pembentukan Direktorat Jenderal (Ditjen) Pesantren di lingkungan Kementerian Agama.\r\n\r\nMenteri Agama Nasaruddin Umar bersyukur atas kabar ini. Ia mengapresiasi para pihak yang telah mengawal terbitnya izin prakarsa pembentukan Ditjen Pesantren, khususnya Wakil Menteri Agama Romo Muhammad Syafi’i.\r\n\r\n\"Wabil khusus Wamenag telah memerjuangkannya sesegera mungkin,\" sebut Menag di Jakarta usai memimpin Apel Hari Santri 2025 di halaman Kantor Kementerian Agama, Rabu (22/10/2025).\r\n\r\nUsul pembentukan Ditjen Pesantren sudah berlangsung sejak 2019, era Menag Lukman Hakim Saifuddin. Usulan Kemenag ke Kemenpan dan RB kembali diajukan pada 2021 dan 2023 pada era Menag Yaqut Cholil Qoumas. Terakhir, usulan itu kembali diajukan ke Kemenpan dan RB pada 2024, di era Menag Nasaruddin Umar.\r\n\r\nDalam kesempatan tersebut, Wakil Menteri Agama Romo Muhammad Syafi’i menyampaikan lebih detil terkait terbitnya izin prakarsa pembentukan Ditjen Pesantren.\r\n\r\n“Alhamdulillah, saya baru saja menerima kabar dari Kementerian Sekretariat Negara tentang terbitnya Persetujuan Izin Prakarsa Penyusunan Rancangan Peraturan Presiden Tentang Perubahan atas Perpres Nomor 152 Tahun 2024 tentang Kementerian Agama,” ujar Wamenag.\r\n\r\nMelalui surat nomor B-617/M/D-1/HK.03.00/10/2025 tertanggal 21 Oktober 2025, Presiden melalui Menteri Sekretaris Negara Prasetyo Hadi memerintahkan agar segera dibentuk Ditjen Pesantren di lingkungan Kementerian Agama.\r\n\r\n“Dengan surat ini, saya ingin menyampaikan bahwa Presiden telah menyetujui pembentukan Ditjen Pesantren. Pembentukan ini bertujuan agar perhatian terhadap pesantren semakin besar—baik dari sisi personalia, pendanaan, maupun program—sehingga pemerintah semakin hadir dalam mendukung perkembangan pesantren di seluruh Indonesia,” lanjutnya.\r\n\r\nRomo Syafi’i menambahkan, kehadiran Ditjen Pesantren akan memperkuat fungsi pesantren dalam tiga ranah utama: pendidikan, dakwah, dan pemberdayaan masyarakat.\r\n\r\n“Semoga dengan adanya Ditjen ini, pesantren ke depan dapat semakin berdaya dan berkontribusi besar bagi bangsa,” harapnya.\r\n\r\nIa juga menyampaikan terima kasih kepada Presiden Prabowo, jajaran Kabinet Merah Putih, serta seluruh insan Kemenag yang sejak 2019 konsisten memperjuangkan lahirnya Ditjen Pesantren.\r\n\r\n<strong>Menag Tegaskan Komitmen</strong>\r\n\r\nMenag Nasaruddin umar mengungkapkan, Ditjen Pesantren ini nantinya akan melakukan konsolidasi pondok pesantren secara nasional. Selama ini, mungkin ada pesantren yang belum terdata atau belum terjangkau bantuan pemerintah. “Dengan adanya Ditjen, hal-hal tersebut bisa tertangani dengan lebih baik karena ada perangkat kerja yang lebih luas dan sistem yang lebih terkoordinasi,” jelas Menag.\r\n\r\nMenag menegaskan bahwa keberadaan Ditjen Pesantren akan membantu pemerintah memastikan seluruh pesantren dapat menjalankan peran strategisnya dengan baik.\r\n\r\n“Dengan Ditjen ini, kita bisa memantau seluruh pesantren dalam arti positif. Pemerintah ingin memastikan semua pesantren benar-benar menjalankan fungsi pendidikan, dakwah, dan pemberdayaan masyarakat secara optimal,” tegasnya.\r\n\r\nMenurutnya, kehadiran Ditjen Pesantren juga akan memperkuat kontribusi Kemenag dalam menciptakan kerukunan umat, sekaligus membangun generasi santri yang kuat, cerdas, dan berakhlak mulia.\r\n\r\n“Harapan kita, Hari Santri menjadi momentum kebangkitan semangat santri untuk menjawab tantangan zaman,” ujar Menag.\r\n\r\nKe depan, lanjut Menag, sistem pendataan dan sertifikasi pesantren akan diintensifkan agar data menjadi lebih valid dan pelaksanaan program semakin tertib.\r\n\r\n“Selama ini sertifikasi sudah berjalan, tapi ke depan akan lebih diperkuat agar data pesantren semakin valid dan program-program pembinaannya lebih tepat sasaran,” tutup Menag.\r\n\r\n<strong>Apel Hari Santri Bernuansa Kebersamaan</strong>\r\n\r\nApel Hari Santri tahun ini berlangsung penuh kekhidmatan. Petugas apel adalah para pejabat eselon I Kemenag lintas agama—simbol kuatnya semangat kebersamaan dan moderasi beragama.\r\n\r\nDirjen Bimas Katolik Suparman bertindak sebagai Komandan Apel. Pembacaan Pancasila dilakukan oleh Dirjen Bimas Hindu I Nengah Duija, sementara Dirjen Bimas Buddha Supriyadi membacakan Naskah Pembukaan UUD 1945.\r\n\r\nDirjen Pendidikan Islam Amien Suyitno dan Kepala Badan Moderasi Beragama dan Pengembangan SDM M. Ali Ramdhani masing-masing membacakan Resolusi Jihad dan Ikrar Santri. Doa penutup dipimpin Dirjen Bimas Islam Abu Rokhmad.\r\n\r\nDirjen Bimas Kristen Jeane Marie Tulung bertugas sebagai pembawa acara, diiringi paduan suara dari Ditjen Bimas Kristen.\r\n\r\nApel ini dihadiri para pejabat eselon II, ASN Kemenag, dan ratusan santri dari berbagai lembaga pendidikan keagamaan.***",
      excerpt: "KILASINDONESIA.COM-Kabar gembira datang bertepatan dengan peringatan Hari Santri 2025. Presiden Prabowo Subianto menyetujui pembentukan Direktorat Jenderal (Ditjen) Pesantren di lingkungan Kementerian...",
      categorySlug: 'nasional',
      tagSlugs: [],
      publishedAt: new Date('2025-10-22T21:29:27.000Z'),
      viewCount: 5474,
    },
    {
      title: "Langkah Kemenag Wujudkan Asta Cita: dari Jaga Kerukunan untuk Pembangunan hingga Sejahterakan Guru",
      slug: "langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru",
      content: "<strong>KILASINDONESIA.COM</strong> - Setahun pemerintahan Presiden Prabowo Subianto–Gibran Rakabuming Raka menjadi momentum penting bagi Kementerian Agama (Kemenag) untuk menghadirkan wajah kehidupan beragama yang lebih inklusif, produktif, dan menyejahterakan.\r\n\r\nDi bawah kepemimpinan Menteri Agama Nasaruddin Umar, Kemenag meneguhkan komitmennya untuk menerjemahkan Asta Cita ke dalam langkah nyata: menjaga kerukunan yang menjasi prasyarat pembangunan, memperkuat pendidikan keagamaan, serta meningkatkan kesejahteraan guru pendidikan agama dan keagamaan.\r\n\r\n“Asta Cita bukan sekadar rencana politik, tapi arah moral bangsa. Di Kementerian Agama, kami terus berupaya agar nilai agama tidak berhenti di mimbar, tetapi hidup dalam kebijakan yang memuliakan manusia,” ujar Menag Nasaruddin Umar, dalam refleksi satu tahun perjalanan Kemenag mengawal Asta Cita, di Jakarta, Selasa (21/10/2025).\r\n\r\n<strong>Merawat Kerukunan untuk Pembangunan</strong>\r\n\r\nMenjaga dan merawat kerukunan menjadi fondasi utama kerja Kemenag dalam mengawal Asta Cita Presiden — terutama cita ke-8 yang menekankan pentingnya harmoni sosial, toleransi, dan kehidupan beragama yang damai. Bagi Kemenag, kerukunan bukan hanya soal toleransi, tetapi juga syarat utama pembangunan. Karena tanpa kedamaian sosial, pembangunan tidak akan berjalan d kokoh.\r\n\r\nDalam setahun terakhir, Kemenag mengembangkan sistem dan program yang konkret untuk memperkuat harmoni bangsa. Melalui aplikasi Si-Rukun (Early Warning System), potensi konflik keagamaan bisa dideteksi sejak dini di berbagai daerah. Penyuluh agama menjadi garda terdepan dalam mengoperasikan aplikasi ini.\r\n\r\nPengembangan Si-Rukun merupakan ikhtiar bersama seluruh unit eselon I Kemenag, mulai dari Ditjen Bimas Islam, Ditjen Bimas Kristen, Katolik, Hindu, Buddha, hingga Pusat Kerukunan Umat Beragama (PKUB). Sistem ini dibangun berdasarkan penelitian terkait peta potensi konflik keagamaan di berbagai daerah, termasuk pemetaan zona merah, kuning, dan hijau.\r\n\r\nUntuk memperkuat kesiapan di lapangan, Kemenag telah melatih 500 penyuluh agama di KUA sebagai aktor resolusi konflik. Mereka dibekali pengetahuan dan keterampilan agar mampu melakukan deteksi dini serta penanganan cepat di wilayah dengan potensi konflik tinggi.\r\n\r\nSelain itu, Kemenag juga membina 300 penyuluh agama dalam pemetaan masalah sosial-keagamaan, memperkuat kapasitas 600 penceramah agar berdakwah dengan pendekatan moderat dan literasi digital, serta membina 200 dai muda untuk melahirkan generasi dai yang berwawasan moderat, adaptif, dan mandiri (dakwah kontekstual dan keterampilan entrepreneurship).\r\n\r\nKemenag juga menggelar Program Akademi Kepemimpinan Mahasiswa Nasional (Akminas) juga melahirkan 1.192 kader lintas agama yang dibekali semangat kepemimpinan plural dan damai. Kemenag bahkan melakukan rekonstruksi terhadap 25 pesantren eks-Jamaah Islamiyah dengan total 5.077 santri, sebagai langkah deradikalisasi berbasis pendidikan .\r\n\r\n“Kerukunan adalah prasyarat pembangunan. Indonesia hanya bisa maju bila umatnya damai, saling menghormati, dan memiliki kesadaran kebangsaan yang kuat,” tegas Menag.\r\n\r\nCapaian ini juga tercermin dalam hasil survei Poltracking Indonesia, yang menempatkan “menjaga kerukunan antarumat beragama” sebagai keberhasilan tertinggi pemerintahan Prabowo–Gibran dengan tingkat kepuasan publik mencapai 86,7%, disusul menjaga kehidupan keagamaan (80,2%) dan menjaga persatuan bangsa (77,1%).\r\n\r\n<strong>Menyukseskan MBG dan CKG</strong>\r\n\r\nDalam semangat Asta Cita yang menekankan pemerataan ekonomi dan peningkatan kualitas hidup masyarakat, Kemenag juga ikut menyukseskan pelaksanaan dua program prioritas nasional: Makan Bergizi Gratis (MBG) dan Cek Kesehatan Gratis (CKG). Langkah ini menjadi bagian dari ikhtiar Kemenag dalam mendukung upaya Presiden meningkatkan kesejahteraan sosial.\r\n\r\nHingga hari ini, tercatat sebanyak 1.373.761 siswa madrasah dan 337.442 santri pesantren telah menikmati manfaat MBG. Sementara itu, lebih dari 12,5 juta siswa dari madrasah, pesantren, dan lembaga pendidikan Kristen, Katolik, Hindu, dan Buddha juga menerima layanan CKG.\r\n\r\nUpaya lain dalam meningkatkan kesejahteraan sosial yang dilakukan Kemenag adalah membantu 4.450 UMKM melalui pinjaman tanpa bunga (qardul hasan) melalui program Masjid Berdaya dan Berdampak (MADADA). Sebanyak 1.350 takmir masjid bahkan diberikan bimtek secara khusus untuk meningkatkan kompetensi mereka dalam pengelolaan dan pemberdayaan ekonomi berbasis masjid.\r\n\r\nUntuk menekan angka perceraian dan membangun keluarga, lebih dari 17.266 pasangan nikah diberi pembinaan keluarg, baik dalam bentuk Bimbingan Perkawinan Islam, bimbingan keluarga sukinah bagi pasangan Hindu, maupun Hittasukhaya untuk umat Buddha. “Inilah makna dakwah sosial. Kemenag berupaya agar ajaran agama hadir bukan hanya di rumah ibadah, tapi di ruang publik: berbagi makanan, menjaga kesehatan, dan memperkuat keluarga,” kata Menag.\r\n\r\n<strong>Menyejahterakan Pendidik</strong>\r\n\r\nPeningkatan kesejahteraan pendidik, menjadi perhatian Presiden Prabowo, termasuk bagi guru dan dosen lembaga pendidikan agama dan keagamaan. Untuk kali pertama dalam sejarah, tunjangan profesi guru non-PNS dinaikkan secara signifikan, dari Rp1,5 juta menjadi Rp2 juta per bulan.\r\n\r\nTahun ini, sebanyak 206.325 guru telah mengikuti Pendidikan Profesi Guru (PPG), meningkat hingga 700% dibanding tahun sebelumnya. Selain itu ada lebih 5.000 dosen Perguruan Tinggi Keagamaan yang juga mengikuti PPG di 2025. Langkah ini menjadi bagian dari akselerasi peningkatan kesejahteraan karena guru dan dosen yang lulus PPG maka dapat menerima tunjangan profesi di tahun mendatang.\r\n\r\n“Guru dan dosen adalah ruh pendidikan. Ketika mereka sejahtera dan dihargai, maka pendidikan agama akan bermartabat, dan bangsa akan berkarakter,” ujar Menag.\r\n\r\nKemenag juga memperluas akses pendidikan tinggi dengan memberikan 156.581 beasiswa KIP Kuliah, 6.453 Beasiswa Indonesia Bangkit, serta 2.270 Beasiswa Santri Berprestasi (PBSB). Tak hanya bagi umat Islam, beasiswa juga diberikan untuk 329 mahasiswa Orang Asli Papua (OAP), dan 153 penerima beasiswa zakat di 21 kampus negeri maupun swasta.\r\n\r\nDalam setahun terakhir, bantuan Program Indonesia Pintar (PIP) disalurkan kepada 19.264 siswa Pada Satuan Pendidikan Keagamaan Kristen, 161.591 Santri, serta 1.469 Siswa pada Satuan Pendidikan Keagamaan Hindu. “Lebih dari 9 triliun rupiah, anggaran Bantuan Operasional Pendidikan (BOP) Raudlatul Athfal dan Bantuan Operasional Sekolah (BOS) Madrasah disalurkan untuk mendukung peningkatan mutu pembelajaran,” sebut Menag.\r\n\r\nLangkah besar lainnya adalah pendirian Sekolah Tinggi Agama Khonghucu Indonesia Negeri (SETIAKIN) di Bangka Belitung. Ini adalah sekolah tinggi Khonghucu negeri pertama di Indonesia. Selain perluasan akses, kehadiran SETIAKIN menjadi simbol kehadiran negara atas kebutuhan pendidikan tinggi keagamaan Khonghucu.\r\n\r\nKemenag juga hadir dalam menyukseskan program Sekolah Rakyat, Sekolah Garuda, dan Program Hasil Terbaik Cepat (PHTC) dalam revitalisasi madrasah. Untuk Sekolah Rakyat, Kemenag siapkan kurikulum pendidikan agama, serta 152 guru dan tenaga pendidik. Ada dua madrasah unggulan yang terpilih sebagai Sekolah Garuda Transformasi, yaitu: Madrasah Aliyah Negeri Insan Cendekia (MAN IC) Gorontalo dan Ogan Komering Ilir (Sumsel). Selain itu, ada 1.414 madrasah yang direvitalisasi dalam PHTC Presiden Prabowo.\r\n\r\n“Buah dari upaya Kemenag memajukan pendidikan agama dan keagamaan menampakkan hasil. MAN IC Serpong menjadi Sekolah Terbaik berdasarkan nilai UTBK 2025, sedang MAN 2 Kota Malang menjadi Sekolah Terbaik dalam Olimpiade Sains Nasional (OSN) 2025,” papar Menag.\r\n\r\n<strong>Memberdayakan Ekonomi Umat dan Ekoteologi</strong>\r\n\r\nDalam mendukung Asta Cita poin kedua tentang kemandirian ekonomi hijau, Kemenag terus memperluas pemberdayaan ekonomi umat berbasis zakat dan wakaf. Hingga Oktober 2025, Kemenag telah mengembangkan 37 Kampung Zakat, 29 inkubasi wakaf produktif, dan 10 Kota Wakaf di berbagai provinsi. Lebih dari 105.000 sertifikat tanah wakaf diterbitkan, dan ini sangat penting dalam upaya menekan potensi sengketa lahan. Selain itu, 40 hektare Hutan Wakaf digulirkan sebagai bentuk integrasi antara ekonomi dan ekoteologi.\r\n\r\nUntuk memperkuat tata kelola dana keagamaan, Kemenag juga menggagas pembentukan Lembaga Pengelola Dana Umat (LPDU) — sebuah institusi modern untuk mengelola zakat, wakaf, infak, fidyah, dan sedekah secara profesional, transparan, dan berdaya guna tinggi bagi ekonomi rakyat.\r\n\r\nSelain itu, Kemenag mendorong gerakan ekoteologi — kesadaran spiritual dalam menjaga bumi. Melalui aksi nyata, Kemenag menanam lebih dari satu juta pohon di seluruh Indonesia, membangun 13 KUA berbasis green building, dan menerbitkan buku “Tafsir Ayat-Ayat Ekologi” yang memperkuat gerakan hijau berbasis nilai keagamaan.\r\n\r\nMembumikan Nilai Keagamaan\r\n\r\nMenutup refleksi setahun perjalanan, Menag Nasaruddin Umar menegaskan bahwa keberhasilan Kemenag bukan hanya diukur dari program yang selesai, tetapi dari nilai-nilai agama yang benar-benar menjadi napas kebijakan publik. Karenanya, upaya membumikan nilai keagamaan perlu terus dilakukan.\r\n\r\n“Agama tidak boleh berhenti di mimbar. Agama harus mewujud dalam kebijakan yang menyejahterakan, mendidik, dan memuliakan manusia. Inilah semangat Asta Cita yang kami kawal dengan sepenuh hati,” tegasnya.\r\n\r\nMenag menyampaikan apresiasi kepada seluruh jajarannya yang terus bekerja keras dalam ikut mewujudkan Asta Protas Presiden Prabowo dan Wakil Presiden Gibran Rakabuming Raka. Menag juga menyampaikan apresiasi kepada media dan masyarakat yang terus mengawal perjalanan Kemenag dengan kritis dan konstruktif.\r\n\r\n“Terima kasih kepada insan pers yang telah menjaga ruang publik tetap sehat. Kritik dan dukungan Anda adalah bagian dari ibadah kami dalam melayani umat,” pungkas Menag.***(sut)",
      excerpt: "KILASINDONESIA.COM - Setahun pemerintahan Presiden Prabowo Subianto–Gibran Rakabuming Raka menjadi momentum penting bagi Kementerian Agama (Kemenag) untuk menghadirkan wajah kehidupan beragama yang le...",
      categorySlug: 'perguruan-tinggi',
      tagSlugs: ["pendidikan-profesi-guru","program-indonesia-pintar","madada","akminas","prabowo-subianto"],
      publishedAt: new Date('2025-10-23T11:46:36.000Z'),
      viewCount: 5267,
    },
    {
      title: "Gelar Peringatan HSN 2025, Rektor UIN Jakarta Harap Para Santri Terus Tingkatkan Ilmu dan Akhlak",
      slug: "gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak",
      content: "<strong>KILASINDONESIA.COM</strong>  - Rektor UIN Syarif Hidayatullah Jakarta, Prof Asep Saepudin Jahar, memimpin Upacara Peringatan Hari Santri Nasional (HSN) 2025 di Lapangan Student Center Kampus 1, Ciputat, Tangerang Selatan, Banten, Rabu 22 Oktober 2025.\r\n\r\nMengenakan sarung, jas dan kopiah hitam, Prof Asep pun menyampaikan amanat dari Menteri Agama (Menag) Prof Nasaruddin Umar. Dalam amanatnya yang dibacakan Prof Asep, Menag menyampaikan belasungkawa terhadap insiden di Pondok Pesantren Al-Khoziny, Sidoarjo, Jawa Timur.\r\n\r\n“Izinkan saya menyampaikan rasa duka cita yang mendalam atas wafatnya 67 santri dalam musibah yang menimpa Pesantren Al-Khoziny,” ungkap Prof Asep mengutip amanat Menag.\r\n\r\nSebagai wujud kepedulian negara, Menag menyampaikan, pihaknya telah hadir langsung di lokasi kejadian guna meninjau kondisi, menyampaikan bantuan serta memastikan agar proses pemulihan berjalan dengan baik.\r\n\r\n“Langkah ini adalah bukti nyata bahwa negara hadir dan peduli terhadap pesantren dan para santri,” ujarnya.\r\n\r\nSementara itu, Prof Asep berharap, agar ke depannya para santri terus berkembang, tidak hanya dari segi keilmuan saja, tapi juga dari segi karakter yang berintegritas.\r\n\r\n“Saya berharap kepada para santri untuk terus meningkatkan ilmu, meningkatkan akhlak dan juga memperkuat komitmen kepada bangsa. Semoga mereka terus berjuang menjadi generasi masa depan yang membanggakan,” katanya.\r\n\r\nProf Asep pun menilai, tema Hari Santri Nasional 2025 ‘Mengawal Indonesia Merdeka Menuju Peradaban Dunia’ sangatlah tepat. Karena, menurut Prof Asep, hal ini sejalan dengan cita-cita Presiden Prabowo Subianto yang ingin mencapai Indonesia Emas 2045.\r\n\r\n“Di hari santri ini saya harapkan menjadi penggugah kembali bagaimana peran santri dan peran Indonesia di dunia internasional. Ini juga adalah komitmen Presiden Prabowo untuk ikut mencerdaskan bangsa dan menjaga ketertiban dunia,” ungkapnya.***(Sut)",
      excerpt: "KILASINDONESIA.COM - Rektor UIN Syarif Hidayatullah Jakarta, Prof Asep Saepudin Jahar, memimpin Upacara Peringatan Hari Santri Nasional (HSN) 2025 di Lapangan Student Center Kampus 1, Ciputat, Tangera...",
      categorySlug: 'madrasah',
      tagSlugs: ["nasaruddin-umar","indonesia-emas-2045","asep-saepudin-jahar","pondok-pesantren-al-khoziny","hari-santri-nasional"],
      publishedAt: new Date('2025-10-23T11:50:06.000Z'),
      viewCount: 959,
    },
    {
      title: "Malam Bakti Santri, Menag Sampaikan Terima Kasih atas Perhatian Presiden ke Pesantren",
      slug: "malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren",
      content: "<strong>KILASINDONESIA.COM</strong> --- Menteri Agama Nasaruddin Umar menyampakan terima kasih kepada Presiden Prabowo atas perhatiannya ke dunia pesantren. Hal ini disampaikan Menag Nasaruddin Umar saat memberikan sambutan pada malam Bakti Santri untuk Negeri di TMII, Jakarta.\r\n\r\nGiat ini menjadi rangkaian dari peringata Hari Santri 2025. Hadir, keluarga besar Kementerian Agama, serta ratusan santri dan pengasuh pondok pesantren. Hadir juga sejumlah santri penerima manfaat beasiswa sehingga bisa melanjutkan kuliah pada beragam program studi dan perguruan tinggi ternama di Indonesia.\r\n\r\n\"Izinkan saya menyampaikan terima kasih dan apresiasi yang setinggi-tingginya kepada Presiden Republik Indonesia, Bapak Prabowo Subianto, atas keberpihakan nyata beliau kepada dunia pesantren. Di bawah kepemimpinan beliau, berbagai program yang menyentuh kepentingan pesantren terus mendapatkan penguatan, termasuk persetujuan pembentukan Ditjen Pesantren di Kemenag,” ucap Menag di Jakarta, Jumat (24/10/2025).\r\n\r\nMenag menegaskan bahwa pembentukan Ditjen Pesantren merupakan amanah besar. Amanag ini diharapkan akan semakin memperkuat tata kelola dan pelayanan pemerintah terhadap pesantren di seluruh Indonesia.\r\n\r\n\"Kami berkomitmen, dengan terbentuknya Direktorat Jenderal Pesantren, layanan negara bagi pesantren akan semakin cepat, tepat, dan berdampak,\" ujarnya.\r\n\r\nLangkah strategis ini diharapkan mampu mendorong pesantren bertransformasi menjadi pusat inovasi, pusat pemberdayaan ekonomi, dan pusat peradaban. Hingga 2025, Kemenag mencatat terdapat 42.369 pesantren yang tersebar di seluruh Nusantara, dengan jutaan santri yang belajar.\r\n\r\n\"Ini bukan sekadar angka, melainkan bukti betapa pesantren telah menjadi ekosistem besar pembangunan manusia Indonesia seutuhnya,” jelas Menag.\r\n\r\n\"Inilah wajah baru pesantren Indonesia. Bukan hanya pusat ilmu dan dakwah, tetapi juga pusat inovasi dan pemberdayaan ekonomi masyarakat,\" lanjutnya.\r\n\r\nMenag juga menerangkan peran Kemenag dalam mendukung kesejahteraan santri melalui program-program sosial dari Pemerintah. Program Cek Kesehatan Gratis (CKG) dan Makan Bergizi Gratis (MBG) juga telah dirasakan manfaatnya oleh jutaan santri. \"Program-program ini menunjukkan bagaimana negara hadir untuk memastikan santri tumbuh sehat, kuat, dan bersemangat dalam menuntut ilmu serta berkontribusi bagi bangsa,\" jelas Menag.\r\n\r\nBerikut sejumlah program unggulan Kemenag yang berdampak signifikan terhadap pesantren:\r\n\r\n1. Beasiswa Santri Berprestasi (PBSB)\r\nSebanyak 7.973 santri telah menerima beasiswa penuh dari negara melalui Program Beasiswa Santri Berprestasi (PBSB) dalam 20 tahun terakhir (2005 – 2025). Saat ini, lebih dari 5.000 alumni program ini mengabdi sebagai dokter, dosen, peneliti, teknolog, dan penggerak sosial di berbagai daerah.\r\n\r\n2. Kemandirian Ekonomi Pesantren\r\nKemenag telah menyalurkan bantuan inkubasi bisnis mencapai Rp499,55 miliar untuk 4.186 pesantren (2021 – 2024). Program ini berhasil melahirkan 1.052 Badan Usaha Milik Pesantren (BUMP).\r\n\r\n3. Koperasi Pesantren\r\nHingga saat ini, ada 2.347 koperasi pesantren telah berdiri dan beroperasi. Koperasi pesantren menjadi penggerak ekonomi umat di berbagai daerah.",
      excerpt: "KILASINDONESIA.COM --- Menteri Agama Nasaruddin Umar menyampakan terima kasih kepada Presiden Prabowo atas perhatiannya ke dunia pesantren. Hal ini disampaikan Menag Nasaruddin Umar saat memberikan sa...",
      categorySlug: 'nasional',
      tagSlugs: ["nasaruddin-umar","hari-santri-nasional","beasiswa-santri-berprestasi","direktorat-jenderal-pesantren"],
      publishedAt: new Date('2025-10-25T10:38:10.000Z'),
      viewCount: 3259,
    },
    {
      title: "Menag Nasaruddin Dorong Siswa Madrasah Bukan Hanya Unggul dalam Agama tapi juga Teknologi",
      slug: "menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi",
      content: "KILASINDONESIA.COM – Menteri Agama Nasaruddin Umar membuka ajang Madrasah Robotics Competition (MRC) 2025 yang digelar di Atrium Utama Living World Kota Wisata Cibubur, Sabtu (1/11/2025). Dalam arahannya, Menag menegaskan bahwa madrasah hari ini harus menjadi simbol kemajuan — tidak hanya dalam ilmu agama, tetapi juga sains dan teknologi.\r\n\r\n“Anak-anak madrasah jangan hanya bisa mengaji dan berdoa, tapi juga harus mampu menciptakan robot, meneliti, dan berinovasi. Itu baru madrasah masa depan,” ujar Nasaruddin.\r\n\r\nMenurut Menag, perintah Allah dalam Al-Qur’an yang berbunyi ‘I’malū’ (berkaryalah) harus dimaknai secara luas. “Kata ‘amal’ dalam Islam bukan sekadar melakukan sesuatu, tapi melakukan dengan perencanaan, perhitungan, dan kecermatan. Sama seperti robot, yang tak bisa bergerak tanpa sensor dan logika,” tegasnya.\r\n\r\nNasaruddin juga menyinggung kisah Nabi Sulaiman yang mampu mengalahkan jin dengan kecerdasan. “Kecerdasan manusia bisa menembus batas. Kalau anak-anak madrasah memadukan konsentrasi dan kontemplasi, mereka bisa melahirkan keajaiban-keajaiban baru,” katanya.\r\n\r\nMenag pun mengapresiasi semangat para peserta MRC 2025. Tahun ini tercatat 616 tim dari berbagai jenjang madrasah di seluruh Indonesia ikut berkompetisi, jumlah terbanyak sepanjang penyelenggaraan MRC sejak pertama kali digelar pada 2015.\r\n\r\nDalam kesempatan itu, Menag juga mengumumkan kabar menggembirakan: Pemerintah Emirat Arab siap memberikan dukungan besar bagi pengembangan madrasah di Indonesia.\r\n\r\n“Emirat Arab akan membantu peningkatan keterampilan guru dan siswa madrasah. Insyaallah, MoU akan segera ditandatangani dalam waktu dekat,” tutur Nasaruddin.\r\n\r\nIa berharap, kolaborasi tersebut dapat memperkuat posisi madrasah sebagai pusat keunggulan ilmu dan karakter. “Kita ingin madrasah bukan sekadar pilihan alternatif, tapi menjadi kebanggaan nasional,” katanya menutup sambutannya.\r\n\r\nSementara itu, Direktur Jenderal Pendidikan Islam, Amien Suyitno, menyampaikan bahwa MRC 2025 menjadi momentum kebangkitan inovasi madrasah setelah sempat vakum dua tahun.\r\n\r\n“Tahun ini kami hadir dengan semangat baru. Tema ‘Robotic Technology for a Green Future’ kami pilih untuk menegaskan bahwa teknologi juga harus berpihak pada keberlanjutan lingkungan,” ujar Dirjen.\r\n\r\nIa menambahkan, ajang ini menjadi wadah untuk menampilkan bakat dan kreativitas siswa madrasah dalam bidang sains, teknologi, dan lingkungan. “Madrasah bukan hanya mencetak ulama, tapi juga calon ilmuwan dan insinyur yang berakhlak mulia,” katanya.\r\n\r\nMenurut Amien, MRC 2025 juga menjadi bagian dari strategi Kemenag menyongsong era baru pendidikan madrasah. Tahun ini, madrasah akan menerapkan Tes Kemampuan Akademik (TKA) sebagai pengganti Ujian Nasional (UN) yang menjadi salah satu indikator penerimaan di perguruan tinggi negeri.\r\n\r\n“Kita ingin memastikan bahwa anak-anak madrasah siap bersaing, baik secara akademik maupun dalam kompetensi teknologi,” ungkapnya.\r\n\r\nTahun ini, kompetisi terbagi menjadi dua kategori utama yaitu Robot Karya Inovasi dan Mobile Robot Labirin, keduanya menekankan kreativitas, penerapan teknologi, serta kepedulian terhadap kelestarian lingkungan.\r\n\r\nTahun ini merupakan kompetisi robot dengan jumlah peserta terbesar sepanjang sejarah MRC. Tema yang diusung, “Robotic Technology for a Green Future”, sejalan dengan visi Kementerian Agama dalam membangun madrasah hijau, pondok pesantren hijau, dan kampus hijau.\r\n\r\nPembukaan MRC 2025 dihadiri para pejabat eselon I dan II Kementerian Agama, khususnya di lingkungan Direktorat Jenderal Pendidikan Islam, Dirjen Bimas Islam, para staf ahli dan staf khusus Menteri, para juri, guru, kepala madrasah, dan peserta MRC 2025.***",
      excerpt: "KILASINDONESIA.COM – Menteri Agama Nasaruddin Umar membuka ajang Madrasah Robotics Competition (MRC) 2025 yang digelar di Atrium Utama Living World Kota Wisata Cibubur, Sabtu (1/11/2025). Dalam arahan...",
      categorySlug: 'nasional',
      tagSlugs: ["nasaruddin-umar","mrc-2025"],
      publishedAt: new Date('2025-11-01T20:13:51.000Z'),
      viewCount: 2109,
    },
    {
      title: "MAN 3 Bantul Sabet Medali Emas FIKSI 2025",
      slug: "man-3-bantul-sabet-medali-emas-fiksi-2025",
      content: "KILAS INDONESIA - Prestasi luar biasa ditorehkan siswa MAN 3 Bantul (Mantaba) dalam ajang Festival Inovasi dan Kewirausahaan Siswa Indonesia (FIKSI) Tingkat Nasional Tahun 2025. Dua siswa yang tergabung dalam Excellent Entrepreneurs Club (EEC) MAN 3 Bantul, Muhammad Fauzan (XI-E) dan Muhammad Iqwan (XI-D) berhasil melaju final hingga sukses meraih medali emas bidang pariwisata FIKSI 2025. Ajang bergengsi diselenggarakan atas kolaborasi Balai Pengembangan Talenta Indonesia (BPTI), Kementerian Pendidikan Dasar dan Menengah (Kemendikdasmen), serta Pusat Prestasi Nasional (Puspresnas) . Pengumuman pemenang digelar dalam final FIKSI 2025 di Smesco Exhibition Hall, Jakarta, Jumat (30/10/2025).\r\nKemenangan tersebut diraih setelah kedua inovator muda ini mempresentasikan Wukirtech hasil karya aplikasi untuk mengembangkan pariwisata daerah. Proses penyusunan karya, penampilan dan penguasaan materi, serta kecakapan dalam presentasi telah membuahkan hasil membanggakan dengan meraih juara 1 di tingkat nasional.\r\nSuasana haru terasa saat Fauzan dan Iqwan terpanggil untuk maju ke panggung untuk menerima medali. \"Alhamdulillah, puji syukur tak henti-hentinya kami panjatkan atas kesuksesan dalam FIKSI ini. Terima kasih atas doa restu, bimbingan bapak ibu guru dan orang tua, dukungan bapak ibu pegawai, keluarga, dan seluruh keluarga besar MAN 3 Bantul,” ungkap Iqwan.\r\n“Kami sangat terharu sampai di titik ini. Doa dan dukungan bapak ibu guru, keluarga, dan seluruh keluarga besar MAN 3 Bantul menguatkan kami hingga dapat meraih medali emas FIKSI 2025. Semoga karya yang tercipta melalui FIKSI ini dapat bermanfaat untuk masyarakat luas,\" imbuh Fauzan.\r\nKepala MAN 3 Bantul, Suyanto mengungkapkan apresiasi atas raihan prestasi FIKSI 2025, “MasyaAllah haru dan bangga dengan anak-anak yang meraih prestasi dalam FIKSI. Saya menyaksikan anak-anak sangat telaten mempersiapkan semuanya, turut mendampingi proses latihan hingga acara puncak. Anak-anak sangat menguasai konten yang telah disiapkan. Karya tersebut sangat bermanfaat untuk pengempangan pariwisata Wukirsari. Prestasi ini menjadi inspirasi bagi siswa-siswi di MAN 3 Bantul untuk semangat meraih prestasi. Selamat untuk Ananda Fauzan, Ananda Iqwan,” tutur Suyanto.\r\nGuru pembimbing EEC MAN 3 Bantul, Ismariyati bangga atas raihan anak-anak didiknya. \"Kami senang dan bangga dengan anak-anak kami. Mereka belajar begitu semangat. Anak-anak totalitas dalam menyusun karyanya. Lomba demi lomba mereka ikuti hingga kali ini menuai buah keberhasilan,\" ungkap Isma.\r\nKabar prestasi ini menjadi kebahagiaan seluruh civitas MAN 3 Bantul. Wakil kepala madrasah bidang kesiswaan, M. Munawar Yasin menjelaskan prestasi ini diraih melalui sinergi yang dibangun MAN 3 Bantul. “Bersyukur atas prestasi yang diraih siswa MAN 3 Bantul. Prestasi yang diraih ini adalah buah kerja keras, semangat, dan kerja sama yang baik antara anak-anak dengan pembimbing. Selain itu, dukungan dan doa segenap civitas MAN 3 Bantul serta Panti Asuhan Al Dzikro, tempat tinggal salah satu murid kami yang mengikuti FIKSI mendorong anak-anak semakin semangat hingga sukses berprestasi,” terang Yasin.\r\nLebih lanjut, wakil kepala madrasah bidang kurikulum, Wahyudi mengungkapkan bahwa MAN 3 Bantul senantiasa memberikan bimbingan kepada siswa untuk menumbuhkan potensi, minat dan bakat di berbagai bidang, salah satunya kewirausahaan, . “Dalam pengembangan potensi siswa, MAN 3 Bantul membentuk Excellent Entrepreneurs Club (ERC). Siswa mendapatkan bimbingan untuk menumbuhkan dan mengembangkan potensi kewirausahaan mereka mulalui EEC hingga meraih berbagai prestasi, salah satunya dalam ajang bergengsi FIKSI. Selamat atas prestasi yang diraih anak-anak,” ungkap Wahyudi.",
      excerpt: "KILAS INDONESIA - Prestasi luar biasa ditorehkan siswa MAN 3 Bantul (Mantaba) dalam ajang Festival Inovasi dan Kewirausahaan Siswa Indonesia (FIKSI) Tingkat Nasional Tahun 2025. Dua siswa yang tergabu...",
      categorySlug: 'perguruan-tinggi',
      tagSlugs: ["man-3-bantul","puspresnas","smesco-exhibition-hall"],
      publishedAt: new Date('2025-11-01T20:16:33.000Z'),
      viewCount: 2231,
    },
    {
      title: "Curi Perhatian, Mahasiswa UIN Jakarta Pamerkan Robot Pengumpul Sampah Berbasis AI di AICIS+ 2025",
      slug: "351-2",
      content: "KILAS INDONESIA - Ada pemandangan menarik dalam perhelatan Annual International Conference on Islamic Studies (AICIS+) 2025 yang digelar di Kampus UIII Depok 29-31 Oktober 2025. Adalah Mahasiswa Program Studi Teknik Informatika, Fakultas Sains dan Teknologi (FST) UIN Syarif Hidayatullah Jakarta, Muhamad Daffa Muis yang berhasil menarik perhatian pengunjung dalam ajang melalui karyanya berjudul “Robot Pengumpul Sampah Menggunakan MobileNet-SSD Berbasis Raspberry Pi.”\r\n\r\nKarya robotik ini menjadi salah satu inovasi mahasiswa UIN Jakarta yang dipamerkan pada kegiatan bergengsi tersebut. Daffa menjelaskan, robot ciptaannya dirancang untuk membantu mengumpulkan sampah secara otomatis menggunakan teknologi Artificial Intelligence (AI).\r\n\r\n“Robot ini diperuntukkan untuk mengumpulkan sampah secara otomatis,” ujarnya saat ditemui di stan pameran UIN Jakarta di Kampus UIII Depok, Kamis (30/10/2025).\r\n\r\nRobot ini mengandalkan sistem MobileNet-SSD, model AI yang digunakan untuk mendeteksi objek berupa botol plastik. Setelah mendeteksi, robot akan menggerakkan alat capit untuk mengambil sampah dan mengumpulkannya ke dalam wadah yang disediakan. Menariknya, Daffa juga merancang bagian mekanik robot agar mampu mengangkat beban 300 gram dan disiapkan hingga 1 kilogram.\r\n\r\n\"Pengembangan selanjutnya baru diharapkan bisa sampai 1 kilogram,\" tuturnya.\r\n\r\nKe depan, ia berencana mengembangkan sistem kecerdasan buatan agar robot dapat mengenali berbagai jenis sampah, tidak hanya botol plastik. “Saya ingin AI-nya bisa dikembangkan agar lebih cerdas dalam mendeteksi jenis sampah lain,” ungkapnya.\r\n\r\nRobot pengumpul sampah karya Daffa menjadi salah satu inovasi yang ditampilkan UIN Jakarta di Pameran AICIS+ 2025 yang digelar oleh Kementerian Agama RI di kampus Universitas Islam Internasional Indonesia (UIII), Depok, Jawa Barat, pada 29–30 Oktober 2025.\r\n\r\nDalam pameran tersebut, UIN Jakarta menampilkan beragam karya inovatif hasil riset dosen dan mahasiswa dari berbagai fakultas dan pusat penelitian. Selain dari FST, inovasi juga ditampilkan oleh Fakultas Kedokteran (FK) dan Fakultas Ilmu Kesehatan (Fikes). Dari Fikes, pengunjung dapat melihat aplikasi bidang Industrial Hygiene karya Dr. Iting Shofwati, ST., MKK., HIU., serta karya mahasiswa seperti Siti Meluria dan Safna Praweswari tentang edukasi penggunaan inhaler dan antibiotik. Dari FK, ada aplikasi SihatTB karya Yogiek Febrilianto dkk., serta riset unggulan Azkiya Alika Putri Ahmudi berjudul Propolisul: Immunostimulant Evidence-Based Medicine.\r\n\r\nSementara dari FST, selain robot karya Daffa, turut dipamerkan riset Mitigasi Risiko Agribisnis karya Dr. Ahmad Mahbubi, Manajemen Pemasaran Kayu Jati karya Iwan Aminudin dan Dinda Rama Haribowo, serta riset Eco-Enzyme oleh Prof. La Ode Sumarlin. Beberapa teknologi lain yang juga mencuri perhatian ialah Teknologi EcoCluster karya Dr. Taufik Sutanto dan Paten Helm yang Disempurnakan karya Dr. Neny Anggraini dkk.\r\n\r\nSelain dari fakultas, Pusat Penelitian, Pusat Rumah Jurnal, Pusat Halal, dan Pusat Pengembangan Green Campus UIN Jakarta juga turut menampilkan hasil riset dan program unggulan mereka. Pusat Rumah Jurnal, misalnya, memperkenalkan pengelolaan jurnal ilmiah UIN Jakarta yang telah banyak terindeks Scopus dan SINTA, sedangkan Pusat Halal menampilkan riset dan layanan sertifikasi halal berbasis sains.\r\n\r\nRektor UIN Jakarta Prof. Asep Saepudin Jahar, M.A., Ph.D. menyampaikan apresiasinya atas semangat sivitas akademika yang aktif berinovasi. “Partisipasi UIN Jakarta dalam AICIS+ menunjukkan bahwa semangat riset dan inovasi di kampus kita terus tumbuh dan memberikan dampak nyata bagi masyarakat. Ini juga mencerminkan semangat integrasi ilmu dan iman yang menjadi karakter UIN Jakarta,” ujarnya.\r\n\r\nPartisipasi Daffa dan para dosen serta mahasiswa UIN Jakarta di AICIS+ 2025 lanjut Rektor menjadi bukti nyata bahwa kampus ini terus mengembangkan potensi riset dan inovasi teknologi sejalan dengan visinya sebagai Green, Smart, and Humanistic University — universitas yang mengintegrasikan ilmu pengetahuan, teknologi, dan nilai kemanusiaan untuk kemaslahatan masyarakat.",
      excerpt: "KILAS INDONESIA - Ada pemandangan menarik dalam perhelatan Annual International Conference on Islamic Studies (AICIS+) 2025 yang digelar di Kampus UIII Depok 29-31 Oktober 2025. Adalah Mahasiswa Progr...",
      categorySlug: 'nasional',
      tagSlugs: ["uin-jakarta","universitas-islam-internasional-indonesia","program-studi-teknik-informatika","fakultas-sains-dan-teknologi"],
      publishedAt: new Date('2025-11-01T20:18:50.000Z'),
      viewCount: 1002,
    },
    {
      title: "Kemenag Umumkan Juara Madrasah Robotics Competition 2025, Berikut Daftarnya!",
      slug: "kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya",
      content: "KILAS INDONESIA — Kementerian Agama Republik Indonesia resmi mengumumkan para pemenang Madrasah Robotics Competition (MRC) 2025) pada malam puncak yang digelar di Atrium Utama Living World, Kota Wisata Cibubur, Sabtu (1/11/2025) malam.\r\n\r\nMengusung tema “Robotic Technology for a Green Future”, ajang bergengsi ini menjadi wadah bagi pelajar madrasah dari seluruh Indonesia untuk menunjukkan kreativitas dan inovasi teknologi yang mendukung masa depan hijau dan berkelanjutan.\r\n\r\nWakil Menteri Agama H. Romo Syafii yang hadir dan menutup secara resmi MRC 2025, menegaskan bahwa penguasaan teknologi merupakan bagian dari pengamalan ajaran Islam.\r\n\r\n“Teknologi tidak bisa dipisahkan dari nilai-nilai keislaman. Dalam Islam, segala bentuk inovasi yang membawa kemaslahatan bagi manusia adalah ibadah,” ungkap Romo Syafi’i dalam sambutannya.\r\n\r\nIa juga berpesan agar para pelajar madrasah terus berkarya dan menciptakan teknologi yang berlandaskan etika serta nilai spiritual.\r\n\r\n“Robot dan kecerdasan buatan harus tetap dalam kendali manusia yang beriman. Madrasah harus menjadi pelopor teknologi yang berkeadaban,” tegasnya.\r\n\r\nDalam kesempatan yang sama, Direktur Jenderal Pendidikan Islam Kemenag, Amien Suyitno, menegaskan bahwa MRC 2025 merupakan momentum kebangkitan madrasah dalam penguasaan sains dan teknologi.\r\n\r\n“Kompetisi tahun ini diikuti lebih dari 600 peserta dari berbagai madrasah di seluruh Indonesia. Ini menjadi rekor tersendiri dan bukti bahwa madrasah penuh dengan talenta muda yang inovatif dan siap bersaing di era digital,” ungkap Amien Suyitno.\r\n\r\nMenurutnya, madrasah kini tidak lagi identik hanya dengan pendidikan agama, tetapi juga menjadi motor penggerak dalam bidang teknologi terapan, kecerdasan buatan, hingga inovasi robotik ramah lingkungan.\r\n\r\nDaftar Juara Madrasah Robotics Competition 2025\r\n\r\nKategori Mobile Robot MI\r\n\r\nJuara 1: Batu Bara Robotik (BBR) – MIN 2 Kota Sawahlunto\r\n\r\nJuara 2: MIKUGreen – MI Khoiru Ummah\r\n<p class=\"class-paragraph\">Juara 3: Anak Krakatau – MI Diniyah Putri Lampung</p>\r\nJuara 4: Gemintang – MIN 1 Kota Malang\r\n\r\nJuara 5: Robot OneSix – MIN 16 Jakarta\r\n\r\nJuara 6: Robozhaluvi – MI Assulthoniyah Bogor\r\n\r\nJuara 7: SundraBot – MI Ma’arif NU Sunan Draja\r\n\r\nJuara 8: Robotik MINS AJA – MIN 1 Jembrana\r\n\r\nJuara 9: Robin – MI An-Noor Karangsari\r\n\r\nJuara 10: The MicroMice – MI Manbaul Huda Purwodadi\r\n\r\nKategori Mobile Robot MTs\r\n\r\nJuara 1: SCR Team Alpha – MTs Negeri 1 Lombok Timur\r\n\r\nJuara 2: M3AI Robotic – MTsN 3 Malang\r\n\r\nJuara 3: MINO1 – MTsN 1 Kota Bima\r\n\r\nJuara 4: M4RC Buzzy – MTs Negeri 4 Jakarta\r\n\r\nJuara 5: AIROS – MTs Al Hikam Jombang\r\n\r\nJuara 6: Sleko Robotik – MTs Negeri 4 Sleman\r\n<p class=\"class-paragraph\">Juara 7: Firdaus – MTs Negeri 2 Sukoharjo</p>\r\nJuara 8: Dar El Hikmah Robotic Club – MTs Darul Hikmah Pekanbaru\r\n\r\nJuara 9: Marsada Robo – MTsN 1 Padangsidimpuan\r\n\r\nJuara 10: Matsaci Robot Team – MTs Negeri 1 Cirebon\r\n\r\nKategori Mobile Robot MA\r\n\r\nJuara 1: MDR Bismillah – MAN 2 Tulungagung\r\n\r\nJuara 2: M2 R-Solver – MA Negeri 2 Kota Bima\r\n\r\nJuara 3: ManSuko Mobile – MAN 1 Metro\r\n\r\nJuara 4: Nassy – MA Negeri 1 Bogor\r\n\r\nJuara 5: Robocom – MAN Pinrang\r\n\r\nJuara 6: Robot Bima – MA Bilingual Al Amanah Sidoarjo\r\n\r\nJuara 7: Lembu Sikat Abis – MA Negeri 1 Pekanbaru\r\n\r\nJuara 8: Manduwo Highland – MAN 2 Wonosobo\r\n\r\nJuara 9: Rapidclaw – MAS Husnul Khotimah Kuningan\r\n\r\nJuara 10: Madina – MAN 1 Mandailing Natal\r\n<p class=\"class-paragraph\">Kategori Karya Inovasi MTs</p>\r\nJuara 1: Matsal RC – MTs Al Hamid Jakarta\r\n\r\nJuara 2: Matansa 1 – MTs Negeri 1 Kebumen, Jawa Tengah\r\n\r\nJuara 3: Matsanewa Go – MTsN 1 Kota Malang, Jawa Timur\r\n\r\nJuara 4: Robotic MTs Al-Ma’Tuq Nusa Farm – MTs Al-Ma’Tuq Sukabumi, Jawa Barat\r\n\r\nJuara 5: Robomint – MTs Minhajut Tholabah\r\n\r\nJuara 6: Auto Tsanda – MTsN 2 Jeneponto, Sulawesi Selatan\r\n\r\nJuara 7: Madsanepat – MTsN 4 Kota Surabaya, Jawa Timur\r\n\r\nJuara 8: TechFarmer – MTs Sekolah International Technonapura\r\n\r\nJuara 9: Matsantura – MTs Negeri 1 Jepara, Jawa Tengah\r\n\r\nJuara 10: Green Robotik 31 – MTs Negeri 31 Jakarta\r\n\r\nKategori Karya Inovasi MA\r\n\r\nJuara 1: Romap – MA Negeri 4 Tasikmalaya, Jawa Barat\r\n\r\nJuara 2: Romancis Inovasi – MAN 1 Cirebon, Jawa Barat\r\n\r\nJuara 3: Ninestars – MAN 13 Jakarta\r\n<p class=\"class-paragraph\">Juara 4: Troptech – MAN 1 Gunung Kidul, DI Yogyakarta</p>\r\nJuara 5: Paradox – MAN Insan Cendekia Tanah Laut, Kalimantan Selatan\r\n\r\nJuara 6: Tricky Boy – MAN Insan Cendekia Kota Kendari, Sulawesi Tenggara\r\n\r\nJuara 7: BlueGreen – MA Negeri 3 Tangerang, Banten\r\n\r\nJuara 8: Mangestic Aquatech – MAN 2 Gresik\r\n\r\nJuara 9: EcoSigmaStrive – MAN 2 Kudus, Jawa Tengah\r\n\r\nJuara 10: Romantsa – MA Negeri 2 Kota Malang, Jawa Timur\r\n\r\nMelalui ajang ini, Kementerian Agama menegaskan komitmennya untuk mendorong transformasi pendidikan Islam berbasis teknologi dan mengukuhkan posisi madrasah sebagai pusat inovasi yang melahirkan generasi kreatif, adaptif, dan berdaya saing global.\r\n\r\n“Tema ‘Robotic Technology for a Green Future’ merefleksikan semangat generasi madrasah dalam menciptakan solusi teknologi yang ramah lingkungan dan membawa maslahat bagi umat,” tutup Romo Syafi’i.",
      excerpt: "KILAS INDONESIA — Kementerian Agama Republik Indonesia resmi mengumumkan para pemenang Madrasah Robotics Competition (MRC) 2025) pada malam puncak yang digelar di Atrium Utama Living World, Kota Wisat...",
      categorySlug: 'nasional',
      tagSlugs: ["mrc-2025","madrasah-robotics-competition","kementerian-agama"],
      publishedAt: new Date('2025-11-02T18:51:14.000Z'),
      viewCount: 3099,
    },
    {
      title: "Olimpiade Madrasah Dorong SDM Unggul dan Berdaya Saing Global",
      slug: "olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global",
      content: "<strong>KILAS INDONESIA </strong>- Kementerian Agama (Kemenag) menggelar Welcoming Dinner dalam rangka Grand Final Olimpiade Madrasah Indonesia (OMI) 2025 di Kantor Wali Kota Tangerang, Jalan Satria-Sudirman, Kota Tangerang, Banten, Senin (10/11/2025) malam. Acara tersebut menjadi penanda rangkaian ajang kompetisi sains dan teknologi tingkat nasional bagi siswa madrasah di bawah naungan Kemenag.\r\n\r\nDirektur Jenderal Pendidikan Islam (Pendis) Kemenag, Prof. Amien Suyitno, menjelaskan bahwa OMI bertujuan untuk mendukung program Asta Cita Presiden Prabowo Subianto.\r\n\r\n“Tahun ini kami gabungkan menjadi Olimpiade Madrasah Indonesia. Tujuannya untuk mendukung program Asta Cita Presiden, khususnya cita keempat, yaitu menciptakan SDM unggul yang terintegrasi,” ujar Amin.\r\n\r\nMenurut Amien, lebih dari 204.000 siswa madrasah dari seluruh Indonesia mengikuti seleksi OMI tahun ini. Dari jumlah tersebut, hanya 484 peserta terbaik yang berhasil lolos ke babak final.\r\n\r\n“Ini menunjukkan bahwa madrasah memiliki potensi besar. Anak-anak madrasah kini tidak hanya belajar kajian keislaman, tapi juga melakukan riset empiris, bahkan sampai menemukan inovasi untuk kesehatan dan teknologi,” ujarnya.\r\n\r\nOMI 2025 menjadi ajang perdana yang digelar di Kota Tangerang, Banten. Kompetisi ini mengusung tema “Islam dan Teknologi Digital: Inovasi Sains untuk Generasi Indonesia Maju yang Berdaya Saing Global”.\r\n\r\nKegiatan yang berlangsung hingga 14 November 2025 ini diikuti peserta dari seluruh provinsi di Indonesia, mulai dari tingkat madrasah ibtidaiyah, tsanawiyah, hingga aliyah.\r\n\r\nOMI diharapkan menjadi wadah bagi siswa madrasah untuk menampilkan riset dan inovasi mereka di bidang sains dan teknologi, sekaligus memperkuat semangat kolaborasi lintas disiplin ilmu.\r\n\r\nDalam kesempatan yang sama, Wakil Menteri Agama (Wamenag) Romo Muhammad Syafi’i menegaskan bahwa pendidikan di madrasah kini tidak hanya berfokus pada ilmu keagamaan seperti fikih, tauhid, tarikh Islam, dan adab. Madrasah telah berkembang menjadi lembaga pendidikan yang juga menekankan penguasaan ilmu pengetahuan dan teknologi, termasuk astronomi.\r\n\r\n“Madrasah hari ini tidak melulu hanya mempelajari pelajaran fikih, tarikh Islam, tauhid, adab, dan sebagainya. Tapi juga sudah mempelajari teknologi,” ujar Romo Syafi’i.\r\n\r\nIa mengungkapkan, teknologi merupakan bagian dari ajaran Islam yang mencakup bidang kedokteran, pertanian, kelautan, hingga astronomi.\r\n\r\n“Kita ingin meredefinisi kembali pengajaran Islam agar tidak sebatas pengetahuan untuk ibadah mahdah, tapi juga untuk menjalani kehidupan di semua lini, termasuk bidang teknologi,” tambahnya.\r\n\r\nRomo Syafi’i juga menyampaikan bahwa perkembangan madrasah kini sudah menunjukkan hasil yang membanggakan. Salah satunya terlihat dari capaian Madrasah Aliyah Negeri (MAN) Insan Cendekia Serpong, Banten, yang dinobatkan sebagai sekolah lanjutan tingkat atas terbaik di Indonesia.\r\n\r\n“Yang terbaik atau peringkat tertinggi di republik ini adalah madrasah, yaitu MAN Insan Cendekia Serpong. Di bawahnya baru sekolah-sekolah lain,” tuturnya.\r\n\r\nSementara itu, Ketua Komisi VIII DPR RI, Marwan Dasopang, yang turut hadir dalam acara tersebut, mengaku bangga atas kemajuan pendidikan madrasah di Indonesia. Ia menilai, pengakuan terhadap pendidikan keagamaan kini semakin luas di tengah masyarakat.\r\n\r\n“Sebagai Ketua Komisi VIII DPR RI, saya bahagia karena diskusi panjang kami di DPR mulai menunjukkan hasil. Pengakuan terhadap pendidikan agama kini datang dari berbagai pihak,” ujar Marwan.\r\n\r\nIa mengungkapkan, pendidikan madrasah memiliki peran penting dalam sejarah perjuangan bangsa, terutama dalam menanamkan semangat cinta tanah air dan nilai-nilai keagamaan.\r\n\r\n“Pelaku perjuangan kemerdekaan banyak berasal dari kalangan santri dan siswa pendidikan agama. Itu bukti bahwa madrasah dan pesantren berperan besar dalam sejarah bangsa,” katanya.\r\n\r\nTurut hadir dalam acara tersebut Gubernur Banten Andra Soni, Ketua DPRD Banten Fahmi Hakim, Wali Kota Tangerang Sachrudin beserta Wakil Wali Kota Maryono Hasan, para pejabat eselon I dan II Kemenag, serta pendamping peserta OMI dari berbagai Kemenag kabupaten/kota se-Indonesia.***",
      excerpt: "KILAS INDONESIA - Kementerian Agama (Kemenag) menggelar Welcoming Dinner dalam rangka Grand Final Olimpiade Madrasah Indonesia (OMI) 2025 di Kantor Wali Kota Tangerang, Jalan Satria-Sudirman, Kota Tan...",
      categorySlug: 'madrasah',
      tagSlugs: ["prabowo-subianto","man-insan-cendekia-serpong","komisi-viii-dpr-ri","wakil-menteri-agama","omi-2025"],
      publishedAt: new Date('2025-11-13T09:43:56.000Z'),
      viewCount: 1816,
    },
    {
      title: "Buka Kick Off HGN 2025, Menag Nasaruddin Tekankan Pentingnya Integrasi Ilmu dan Iman bagi Para Guru",
      slug: "buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru",
      content: "<strong>KILAS INDONESIA</strong> —Menteri Agama Nasaruddin Umar, membuka secara resmi kegiatan Kick Off Hari Guru Nasional (HGN) Tahun 2025 di Universitas Islam Negeri (UIN) Syber Syekh Nurjati Cirebon, Rabu (12/11/2025). Kegiatan ini menjadi pembuka rangkaian peringatan Hari Guru Nasional yang akan digelar secara serentak di berbagai daerah di Indonesia.\r\n\r\nDalam sambutannya, Menag Nasaruddin menyampaikan pandangan filosofis tentang makna dan keteladanan seorang guru. Menurutnya, guru bukan sekadar pengajar ilmu, tetapi juga penyalur cahaya bagi jiwa manusia.\r\n\r\n“Guru bukan hanya mengisi pikiran, tetapi menumbuhkan kesadaran dan meluruskan jalan berpikir. Dalam pandangan Islam, guru adalah warasatul anbiya (pewaris para nabi) yang meneruskan cahaya ilmu dan nilai kehidupan,” ungkap Menag.\r\n\r\nMenag juga menekankan pentingnya mengintegrasikan antara ilmu dan iman dalam dunia pendidikan. Ia menilai bahwa pendidikan yang hanya menekankan aspek kognitif tanpa spiritualitas akan kehilangan arah moral.\r\n\r\n“Madrasah harus menjadi pusat pencerahan baru. Tempat lahirnya generasi berilmu, beriman, dan berakhlak. Sekolah dan madrasah sejatinya memiliki tujuan yang sama, tetapi madrasah menambahkan dimensi hikmah dan spiritual,” tegasnya.\r\n\r\nDalam kesempatan tersebut, Menag turut mengenang sosok ayahnya yang merupakan seorang guru di sekolah rakyat. Dengan penuh haru, ia menuturkan bagaimana sang ayah tetap mengajar meskipun dalam keterbatasan.\r\n\r\n“Guru sejati bukan hanya mentransfer pengetahuan, tetapi mentransformasi kesadaran dan keikhlasan. Itulah keteladanan yang harus kita hidupkan,” ujarnya.\r\n\r\n<strong>Hari Guru untuk Semua</strong>\r\n\r\nSementara itu, Dirjen Pendidikan Islam Amien Suyitno melaporkan bahwa peringatan Hari Guru Nasional tahun ini merupakan Teachers Day for All atau Hari Guru untuk Semua. Menurutnya, ini pencerminan semangat inklusif dan lintas iman sesuai arahan Menteri Agama.\r\n\r\n“Hari Guru tahun ini tidak hanya milik guru madrasah, tetapi juga milik semua guru di Indonesia, lintas iman dan lintas lembaga. Semua guru berperan penting dalam menanamkan nilai-nilai kemanusiaan dan kebangsaan,” jelas Dirjen.\r\n\r\nSuyitno juga menyampaikan capaian penting tahun ini, yakni peningkatan signifikan dalam program Pendidikan Profesi Guru (PPG). Tahun 2025, Kementerian Agama memperoleh tambahan kuota untuk 95.000 guru, meningkat lebih dari 1.000% dibanding tahun-tahun sebelumnya.\r\n\r\n“Ini bukti nyata perhatian pemerintah dan dukungan Komisi VIII DPR RI terhadap profesionalisme dan kesejahteraan guru. Setelah lulus PPG, para guru berhak mendapatkan tunjangan profesi sebagai bentuk penghargaan atas pengabdian mereka,” ungkapnya.\r\n\r\nSelain itu, Ditjen Pendis juga memperkuat transformasi digital pendidikan Islam melalui dua aplikasi unggulan yaitu MAGIS dan MAGITA yang kini menjadi model nasional dalam pengelolaan kompetensi dan kinerja guru.\r\n\r\n“Mengajar dengan cinta adalah kunci membangun peradaban. Itulah makna dari tema kita tahun ini, Merawat Semesta dengan Cinta,” tutur Suyitno.\r\n\r\n<strong>Sinergi Pusat dan Daerah</strong>\r\n\r\nDalam sambutannya, Wali Kota Cirebon yang diwakili PA Asisten Kepemerintahan dan Kesejahteraan Rakyat, Sutikno, menyampaikan apresiasi atas terpilihnya Kota Cirebon sebagai tuan rumah kegiatan pembuka HGN 2025. Ia menilai kehadiran Menteri Agama menjadi kebanggaan bagi masyarakat Kota Wali.\r\n\r\n“Kami merasa terhormat karena Bapak Menteri kembali hadir di Kota Cirebon. Pemerintah daerah berkomitmen untuk terus bersinergi dengan Kementerian Agama dan UIN Syekh Nurjati dalam meningkatkan mutu pendidikan dan spiritualitas masyarakat,” ujarnya.\r\n\r\nIa juga menegaskan pentingnya peran guru dalam membentuk karakter dan menjaga moralitas bangsa di tengah perkembangan teknologi.\r\n\r\n“Teknologi bisa membantu proses belajar, tetapi keteladanan guru tidak bisa digantikan oleh mesin atau algoritma,” tegasnya.\r\n\r\nKegiatan Hari Guru Nasional 2025 diisi dengan berbagai agenda menarik, di antaranya:\r\n\r\n1. Senam dan Gowes Lintas Iman bersama Menteri Agama;\r\n2. Talk Show Inspiratif menghadirkan Najelaa Shihab dan tokoh pendidikan nasional;\r\n3. Annual Conference of MORA Teachers;\r\n4. Upacara Puncak Hari Guru Nasional dan\r\n5. Awarding Night bagi guru-guru inspiratif, inovatif, dan berdedikasi dari daerah 3T.\r\n\r\nSeluruh kegiatan ini menjadi simbol penghargaan pemerintah terhadap dedikasi guru di seluruh Indonesia, sekaligus memperkuat nilai persaudaraan lintas agama dan budaya.\r\n\r\nMelalui peringatan Hari Guru Nasional 2025, Kementerian Agama menegaskan kembali komitmen untuk menjadikan pendidikan sebagai sarana mencerdaskan dan memanusiakan manusia.\r\n\r\n“Bangsa yang besar lahir dari guru-guru yang mencintai muridnya dengan tulus. Mari terus menyalakan obor ilmu dan iman, menjadikan madrasah dan sekolah sebagai rumah peradaban,” pesan Menag Nasaruddin Umar menutup sambutannya.\r\n\r\nHadir dalam kegiatan tersebut, Menteri Agama, Penasihat DWP Kementerian Agama, Direktur Jenderal Pendidikan Islam, Wali Kota Cirebon, anggota Komisi VIII DPR RI, para pejabat eselon I Kementerian Agama, Pejabat eselon II dan III serta ratusan guru madrasah dan tenaga pendidik dari berbagai daerah.***",
      excerpt: "KILAS INDONESIA —Menteri Agama Nasaruddin Umar, membuka secara resmi kegiatan Kick Off Hari Guru Nasional (HGN) Tahun 2025 di Universitas Islam Negeri (UIN) Syber Syekh Nurjati Cirebon, Rabu (12/11/20...",
      categorySlug: 'madrasah',
      tagSlugs: ["pendidikan-profesi-guru","nasaruddin-umar","amien-suyitno","menteri-agama","cirebon"],
      publishedAt: new Date('2025-11-13T10:04:08.000Z'),
      viewCount: 693,
    },
    {
      title: "Kongres Rohis Nasional I 2025 Ditutup, Terpilih Presiden Rohis Indonesia Pertama dan Arah Baru Pembinaan Pelajar Muslim",
      slug: "kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim",
      content: "<p style=\"text-align: left;\">KILAS INDONESIA — Untuk pertama kalinya dalam sejarah, Indonesia resmi memiliki Presiden Rohis Indonesia. Muhamad Ridanara Adiyatma, delegasi dari Jawa Tengah, terpilih melalui mekanisme e-voting dalam Kongres Rohis Nasional I 2025 yang diselenggarakan di Jakarta, 12-15 November 2025. Kongres perdana ini menjadi momentum strategis yang memayungi arah pembinaan Rohani Islam di sekolah umum seluruh Indonesia.</p>\r\nKongres yang mempertemukan ratusan peserta muslim yang tergabung dalam organisasi Rohis dari seluruh provinsi ini menandai keseriusan pemerintah dalam membangun ekosistem kepemimpinan pelajar yang modern, inklusif, dan berintegritas. Dari total 306 peserta, 34 ketua Rohis provinsi tercatat sebagai pemilik suara sah, sekaligus menentukan masa depan kepemimpinan Rohis nasional.\r\n\r\nMenteri Agama Nasaruddin Umar menegaskan bahwa kepemimpinan sejati tidak hanya dibangun dari kecerdasan, tetapi juga keluhuran akhlak dan kerendahan hati.\r\n\r\n“Banyak yang pintar, tetapi tidak semua bisa memimpin dengan hati. Ilmu adalah bekal, tetapi akhlak adalah kompas,” ujarnya.\r\n\r\nMenag menekankan bahwa pemimpin muda harus menguasai ilmu, menjaga integritas, dan senantiasa memelihara kerendahan hati sebagai pondasi kepemimpinan yang amanah. Ia mengajak pelajar membiasakan disiplin, refleksi diri, dan keteladanan sebagai karakter pemimpin masa depan.\r\n\r\n\"Kemenag juga memastikan kemudahan akses pendidikan bagi semua peserta kongres. \"Saya mengapresiasi kalian semua, semua yang hadir di sini, kami akan memberikan kesempatan untuk masuk ke UIN tanpa tes, bahkan Insya Allah juga kita usahakan beasiswa\", jelasnya.\"\r\n\r\nJalur beasiswa luar negeri dibuka untuk negara-negara seperti Mesir, Maroko, Arab Saudi, hingga sejumlah universitas di Eropa. Serta peserta dengan hafalan Al-Qur’an dan rekam jejak pembinaan Rohis mendapat prioritas khusus.\r\n\r\n“Tidak boleh ada anak Rohis yang tertinggal karena soal biaya. Negara hadir,” tegas Menag.\r\n\r\nDalam kesempatan yang sama, Dirjen Pendidikan Islam, Amien Suyitno mengukuhkan Pengurus Rohis Nasional periode 2025–2027 melalui pembacaan naskah resmi dan penyerahan simbol organisasi.\r\n\r\nIa menyampaikan pesan yang menjadi sorotan kongres: pelajar tidak perlu menunggu untuk menjadi pemimpin.\r\n\r\n“Subbanul yaum rijalul al-an. Anda bukan pemimpin masa depan—Anda pemimpin hari ini,” tegasnya.\r\n\r\nDirjen menilai bahwa dinamika sosial menuntut pelajar untuk berani mengambil peran strategis sejak dini, baik di sekolah, komunitas Rohis, maupun ruang digital. Proses pemilihan Presiden Rohis dianggap sebagai miniatur pelatihan kepemimpinan nyata yang melatih komunikasi, jejaring, pengambilan keputusan, serta kemampuan merumuskan visi.\r\n\r\nKongres ini memadukan pembinaan karakter, kompetisi inovasi, hingga pelatihan jejaring kepemimpinan. Peserta mengikuti beragam agenda, termasuk pemilihan presiden, diskusi kebangsaan, hingga branding competition untuk mengasah kreativitas generasi muda.\r\n\r\nKemenag menegaskan bahwa Kongres Rohis Nasional I adalah investasi jangka panjang untuk menyiapkan pemimpin menuju Indonesia Emas 2045. Pembinaan pelajar kini diarahkan agar tidak terjebak dalam dikotomi antara sekolah umum dan madrasah, melainkan berdiri sebagai satu ekosistem pembentukan karakter bangsa.\r\n\r\nDirjen Pendis menyimpulkan, “Kongres ini bukan sekadar pertemuan. Ini adalah pijakan penting lahirnya generasi muslim yang cerdas, moderat, adaptif, dan siap memimpin perubahan.”\r\n\r\nDengan terpilihnya Presiden Rohis Indonesia pertama, babak baru pembinaan pelajar muslim resmi dimulai. Sebuah langkah bersejarah yang tidak hanya memperkuat organisasi Rohis di sekolah, tetapi juga mengokohkan komitmen negara dalam menyiapkan pemimpin masa depan yang berilmu, berakhlak, dan berwawasan luas.",
      excerpt: "KILAS INDONESIA — Untuk pertama kalinya dalam sejarah, Indonesia resmi memiliki Presiden Rohis Indonesia. Muhamad Ridanara Adiyatma, delegasi dari Jawa Tengah, terpilih melalui mekanisme e-voting dala...",
      categorySlug: 'perguruan-tinggi',
      tagSlugs: ["nasaruddin-umar","amien-suyitno","rohis","kemenag"],
      publishedAt: new Date('2025-11-17T06:08:08.000Z'),
      viewCount: 1670,
    },
    {
      title: "Kemenag Kolaborasi dengan LPDP Gelar Penguatan Moderasi Beragama di 4 Perguruan Tinggi Keagamaan",
      slug: "kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama",
      content: "Jakarta—Kementerian agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA) Sekretariat Jenderal berkolaborasi dengan Lembaga Pengelola Dana Pendidikan (LPDP), menggelar Penguatan Moderasi Beragama di empat Perguruan Tinggi Keagamaan (PTK).\r\n\r\nEmpat perguruan tinggi penyelenggara (PTP) sebagai Mitra Kementerian Agama tersebut adalah UIN Syarif Hidayatullah Jakarta, UIN Sunan Gunungdjati Bandung, UIN Sunan Kudus dan UIN Sayyid Ali Rahmatullah (UIN SATU) Tulungagung.\r\n\r\nKepala Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan, Ruchman Basori mengatakan, Penguatan Moderasi Beragama yang dirangkai dengan pengenalan ekoteologi dimaksudkan untuk mencetak para penggerak moderasi beragama dan ekoteologi di Indonesia.\r\n\r\n“Lahirnya para penggerak moderasi beragama yang akan terus-menerus mengkampanyekan model keberagamaan yang inklusif, toleran dan damai, ditengah pluralitas sangat penting”, ujar Ruchman, dihadapan para peserta Penguatan Moderasi Beragama UIN Jakarta, pada Senin (17/11/2025).\r\n\r\nAktivis Mahasiswa 1998 ini meneggaskan lembaga pendidikan dari mulai Raudlatul Athfal, MI, MTs, MA hingga Perguruan Tinggi Keagamaan harus mempunyai komitmen kuat, agar kelompok intoleran dan radikal tidak berkecambah di bumi Nusantara ini.\r\n\r\nRuchman berharap para peserta mampu menindaklanjuti penguatan moderasi beragama dengan aksi nyata di lingkungan masyarakatnya masing-masing dan juga di media sosial. “Media sosial menjadi piranti yang strategis melakukan desiminasi moderasi beragama dan ekoteologi terutama untuk generasi millenial dan Gen-Z”, kata Ruchman.\r\n\r\nPeserta Penguatan Moderasi Beragama dan Ekoteologi berjumlah 240 orang terbagi dalam empat klaster; Pertama, Klaster Dosen Perguruan Tinggi Keagamaan, dibawah binaan Ditjen Pendidikan Islam, Ditjen Bimas Kristen, Katolik, Hindu, Buddha dan Pusat Konghucu; Kedua, klaster Guru dan Tendik pada Madrasah dan Pendidikan Dasar dan Mennegah Kegamaan; Ketiga, Klaster Pondok Pesantren yang terdiri dari kyai muda, ustadz, dan dosen Ma’had Aly; Keempat kaster ASN Kementerian Agama RI dari Pusat hingga Daerah.\r\n\r\nMasing-masing Perguruan Tinggi Penyelenggara (PTP) diikuti oleh 60 orang dengan menggandeng nara sumber, instruktur dan fasilitator dari Pusbangkom Kementerian Agama juga para dosen serta tokoh agama dan Masyarakat yang kompeten. Penyelenggaraan kegiatan pada UIN Jakarta dilaksanakan pada tanggal 12 sd 18 November 2025, UIN Bandung pada 13 sd 19 November 2025, UIN Sunan Kudus pada 24 sd 30 November 2025 dan UIN SATU Tulungagung pada 19 sd 25 November 2025.\r\n\r\nRektor UIN Sunan Gunungdjati Bandung Prof. Dr. Rosikhon Anwar, M.A mengatakan Islam mengajarkan nilai-nilai yang terbuka, tolaran dan damai, yang perlu dimoderasikan adalah orangnya, agar menerima pelbagai perbedaan paham.\r\n\r\nRosikhon menegaskan apa yang dilakukan oleh Kemenag melalui Puspenma adalah bentuk komitmen riil, mencetak para kader-kader moderasi beragama dan ekoteologi dari pesantren, perguruan tinggi dan madrasah. “Kami bangga diberikan amanah melatih dan menguatkan orang-orang terpilih dari segenap penjuru nusantara dan dikumpulakan di Bandung ini”, kata Rosikhon.\r\n\r\nKepala Pusat Rumah Moderasi Beragama UIN Jakarta Prof. Dr. Arif Zamhari, M.A memberikan apresiasi atas penyelenggaraan penguatan moderasi beragama yang merupakan kolaborasi Kemenag dengan LPDP. “Kami berterimakasih komitmen Kemenag dan LPDP mencetak para aktivis penggerak moderasi beragama, yang akan berada di garda terdepan pengarusutamaan nilai-nilai agama yang moderat”, katanya.\r\n\r\n“Para peserta sangat antusias dan siap mengawal Islam yang rahmatan lil ‘alamin di tengah Indon esia yang multikultural”, tegas Arif. (Maria Ulfah)",
      excerpt: "Jakarta—Kementerian agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA) Sekretariat Jenderal berkolaborasi dengan Lembaga Pengelola Dana Pendidikan (LPDP), menggelar Pe...",
      categorySlug: 'nasional',
      tagSlugs: ["kementerian-agama","moderasi-beragama","lpdp","perguruan-tinggi","kolaborasi"],
      publishedAt: new Date('2025-11-19T18:07:35.000Z'),
      viewCount: 5253,
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
    if (categories[postData.categorySlug]) {
      await db.insert(schema.postCategories).values({
        postId: post.id,
        categoryId: categories[postData.categorySlug].id,
      })
    }

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
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e)
    process.exit(1)
  })
  .finally(async () => {
    await pool.end()
  })
