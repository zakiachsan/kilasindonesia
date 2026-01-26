import { PrismaClient, Role, PostStatus, CommentStatus } from '@prisma/client'
import { PrismaPg } from '@prisma/adapter-pg'
import { Pool } from 'pg'

const connectionString = process.env.DATABASE_URL

if (!connectionString) {
  throw new Error('DATABASE_URL is not defined')
}

const pool = new Pool({ connectionString })
const adapter = new PrismaPg(pool)

const prisma = new PrismaClient({
  adapter,
  log: ['error', 'warn'],
})

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
  // Pre-hashed password for 'admin123' using bcrypt with 10 rounds
  // Generated using: bcrypt.hashSync('admin123', 10)
  const hashedPassword = '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy'

  const admin = await prisma.user.create({
    data: {
      email: 'admin@kilasindonesia.com',
      password: hashedPassword,
      name: 'Admin Kilas Indonesia',
      role: Role.ADMIN,
    },
  })

  // ===========================================
  // CREATE CATEGORIES (sesuai tema portal berita pendidikan Islam)
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

  const categories: Record<string, { id: string; name: string; slug: string }> = {}
  for (const cat of categoriesData) {
    const created = await prisma.category.create({ data: cat })
    categories[cat.slug] = created
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

  const tags: Record<string, { id: string; name: string; slug: string }> = {}
  for (const tag of tagsData) {
    const created = await prisma.tag.create({ data: tag })
    tags[tag.slug] = created
  }

  // ===========================================
  // CREATE POSTS (dari data WordPress kilasindonesia.com)
  // ===========================================
  console.log('📝 Creating posts...')

  const postsData = [
    {
      title: 'Menag Nasaruddin Dorong Siswa Madrasah Bukan Hanya Unggul dalam Agama tapi juga Teknologi',
      slug: 'menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi',
      content: `<p><strong>KILASINDONESIA.COM</strong> – Menteri Agama Nasaruddin Umar membuka ajang Madrasah Robotics Competition (MRC) 2025 yang digelar di Atrium Utama Living World Kota Wisata Cibubur, Sabtu (1/11/2025). Dalam arahannya, Menag menegaskan bahwa madrasah hari ini harus menjadi simbol kemajuan — tidak hanya dalam ilmu agama, tetapi juga sains dan teknologi.</p>

<p>"Anak-anak madrasah jangan hanya bisa mengaji dan berdoa, tapi juga harus mampu menciptakan robot, meneliti, dan berinovasi. Itu baru madrasah masa depan," ujar Nasaruddin.</p>

<p>Menurut Menag, perintah Allah dalam Al-Qur'an yang berbunyi 'I'malū' (berkaryalah) harus dimaknai secara luas. "Kata 'amal' dalam Islam bukan sekadar melakukan sesuatu, tapi melakukan dengan perencanaan, perhitungan, dan kecermatan. Sama seperti robot, yang tak bisa bergerak tanpa sensor dan logika," tegasnya.</p>

<p>Nasaruddin juga menyinggung kisah Nabi Sulaiman yang mampu mengalahkan jin dengan kecerdasan. "Kecerdasan manusia bisa menembus batas. Kalau anak-anak madrasah memadukan konsentrasi dan kontemplasi, mereka bisa melahirkan keajaiban-keajaiban baru," katanya.</p>

<p>Menag pun mengapresiasi semangat para peserta MRC 2025. Tahun ini tercatat 616 tim dari berbagai jenjang madrasah di seluruh Indonesia ikut berkompetisi, jumlah terbanyak sepanjang penyelenggaraan MRC sejak pertama kali digelar pada 2015.</p>

<p>Dalam kesempatan itu, Menag juga mengumumkan kabar menggembirakan: Pemerintah Emirat Arab siap memberikan dukungan besar bagi pengembangan madrasah di Indonesia.</p>

<p>"Emirat Arab akan membantu peningkatan keterampilan guru dan siswa madrasah. Insyaallah, MoU akan segera ditandatangani dalam waktu dekat," tutur Nasaruddin.</p>

<p>Ia berharap, kolaborasi tersebut dapat memperkuat posisi madrasah sebagai pusat keunggulan ilmu dan karakter. "Kita ingin madrasah bukan sekadar pilihan alternatif, tapi menjadi kebanggaan nasional," katanya menutup sambutannya.</p>`,
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

<p>Giat ini menjadi rangkaian dari peringata Hari Santri 2025. Hadir, keluarga besar Kementerian Agama, serta ratusan santri dan pengasuh pondok pesantren. Hadir juga sejumlah santri penerima manfaat beasiswa sehingga bisa melanjutkan kuliah pada beragam program studi dan perguruan tinggi ternama di Indonesia.</p>

<p>"Izinkan saya menyampaikan terima kasih dan apresiasi yang setinggi-tingginya kepada Presiden Republik Indonesia, Bapak Prabowo Subianto, atas keberpihakan nyata beliau kepada dunia pesantren. Di bawah kepemimpinan beliau, berbagai program yang menyentuh kepentingan pesantren terus mendapatkan penguatan, termasuk persetujuan pembentukan Ditjen Pesantren di Kemenag," ucap Menag di Jakarta, Jumat (24/10/2025).</p>

<p>Menag menegaskan bahwa pembentukan Ditjen Pesantren merupakan amanah besar. Amanag ini diharapkan akan semakin memperkuat tata kelola dan pelayanan pemerintah terhadap pesantren di seluruh Indonesia.</p>

<p>"Kami berkomitmen, dengan terbentuknya Direktorat Jenderal Pesantren, layanan negara bagi pesantren akan semakin cepat, tepat, dan berdampak," ujarnya.</p>

<p>Langkah strategis ini diharapkan mampu mendorong pesantren bertransformasi menjadi pusat inovasi, pusat pemberdayaan ekonomi, dan pusat peradaban. Hingga 2025, Kemenag mencatat terdapat 42.369 pesantren yang tersebar di seluruh Nusantara, dengan jutaan santri yang belajar.</p>

<p>"Ini bukan sekadar angka, melainkan bukti betapa pesantren telah menjadi ekosistem besar pembangunan manusia Indonesia seutuhnya," jelas Menag.</p>`,
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

<p>Mengenakan sarung, jas dan kopiah hitam, Prof Asep pun menyampaikan amanat dari Menteri Agama (Menag) Prof Nasaruddin Umar. Dalam amanatnya yang dibacakan Prof Asep, Menag menyampaikan belasungkawa terhadap insiden di Pondok Pesantren Al-Khoziny, Sidoarjo, Jawa Timur.</p>

<p>"Izinkan saya menyampaikan rasa duka cita yang mendalam atas wafatnya 67 santri dalam musibah yang menimpa Pesantren Al-Khoziny," ungkap Prof Asep mengutip amanat Menag.</p>

<p>Sebagai wujud kepedulian negara, Menag menyampaikan, pihaknya telah hadir langsung di lokasi kejadian guna meninjau kondisi, menyampaikan bantuan serta memastikan agar proses pemulihan berjalan dengan baik.</p>

<p>"Langkah ini adalah bukti nyata bahwa negara hadir dan peduli terhadap pesantren dan para santri," ujarnya.</p>

<p>Sementara itu, Prof Asep berharap, agar ke depannya para santri terus berkembang, tidak hanya dari segi keilmuan saja, tapi juga dari segi karakter yang berintegritas.</p>

<p>"Saya berharap kepada para santri untuk terus meningkatkan ilmu, meningkatkan akhlak dan juga memperkuat komitmen kepada bangsa. Semoga mereka terus berjuang menjadi generasi masa depan yang membanggakan," katanya.</p>

<p>Prof Asep pun menilai, tema Hari Santri Nasional 2025 'Mengawal Indonesia Merdeka Menuju Peradaban Dunia' sangatlah tepat. Karena, menurut Prof Asep, hal ini sejalan dengan cita-cita Presiden Prabowo Subianto yang ingin mencapai Indonesia Emas 2045.</p>`,
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

<p>Di bawah kepemimpinan Menteri Agama Nasaruddin Umar, Kemenag meneguhkan komitmennya untuk menerjemahkan Asta Cita ke dalam langkah nyata: menjaga kerukunan yang menjasi prasyarat pembangunan, memperkuat pendidikan keagamaan, serta meningkatkan kesejahteraan guru pendidikan agama dan keagamaan.</p>

<p>"Asta Cita bukan sekadar rencana politik, tapi arah moral bangsa. Di Kementerian Agama, kami terus berupaya agar nilai agama tidak berhenti di mimbar, tetapi hidup dalam kebijakan yang memuliakan manusia," ujar Menag Nasaruddin Umar.</p>

<h3>Merawat Kerukunan untuk Pembangunan</h3>

<p>Menjaga dan merawat kerukunan menjadi fondasi utama kerja Kemenag dalam mengawal Asta Cita Presiden — terutama cita ke-8 yang menekankan pentingnya harmoni sosial, toleransi, dan kehidupan beragama yang damai.</p>

<p>Dalam setahun terakhir, Kemenag mengembangkan sistem dan program yang konkret untuk memperkuat harmoni bangsa. Melalui aplikasi Si-Rukun (Early Warning System), potensi konflik keagamaan bisa dideteksi sejak dini di berbagai daerah.</p>

<h3>Menyejahterakan Pendidik</h3>

<p>Peningkatan kesejahteraan pendidik, menjadi perhatian Presiden Prabowo, termasuk bagi guru dan dosen lembaga pendidikan agama dan keagamaan. Untuk kali pertama dalam sejarah, tunjangan profesi guru non-PNS dinaikkan secara signifikan, dari Rp1,5 juta menjadi Rp2 juta per bulan.</p>

<p>Tahun ini, sebanyak 206.325 guru telah mengikuti Pendidikan Profesi Guru (PPG), meningkat hingga 700% dibanding tahun sebelumnya.</p>`,
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

<p>Menteri Agama Nasaruddin Umar bersyukur atas kabar ini. Ia mengapresiasi para pihak yang telah mengawal terbitnya izin prakarsa pembentukan Ditjen Pesantren, khususnya Wakil Menteri Agama Romo Muhammad Syafi'i.</p>

<p>"Wabil khusus Wamenag telah memerjuangkannya sesegera mungkin," sebut Menag di Jakarta usai memimpin Apel Hari Santri 2025 di halaman Kantor Kementerian Agama, Rabu (22/10/2025).</p>

<p>Usul pembentukan Ditjen Pesantren sudah berlangsung sejak 2019, era Menag Lukman Hakim Saifuddin. Usulan Kemenag ke Kemenpan dan RB kembali diajukan pada 2021 dan 2023 pada era Menag Yaqut Cholil Qoumas. Terakhir, usulan itu kembali diajukan ke Kemenpan dan RB pada 2024, di era Menag Nasaruddin Umar.</p>

<p>Dalam kesempatan tersebut, Wakil Menteri Agama Romo Muhammad Syafi'i menyampaikan lebih detil terkait terbitnya izin prakarsa pembentukan Ditjen Pesantren.</p>

<p>"Alhamdulillah, saya baru saja menerima kabar dari Kementerian Sekretariat Negara tentang terbitnya Persetujuan Izin Prakarsa Penyusunan Rancangan Peraturan Presiden Tentang Perubahan atas Perpres Nomor 152 Tahun 2024 tentang Kementerian Agama," ujar Wamenag.</p>

<h3>Menag Tegaskan Komitmen</h3>

<p>Menag Nasaruddin Umar mengungkapkan, Ditjen Pesantren ini nantinya akan melakukan konsolidasi pondok pesantren secara nasional. Selama ini, mungkin ada pesantren yang belum terdata atau belum terjangkau bantuan pemerintah.</p>

<p>"Dengan adanya Ditjen, hal-hal tersebut bisa tertangani dengan lebih baik karena ada perangkat kerja yang lebih luas dan sistem yang lebih terkoordinasi," jelas Menag.</p>`,
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

<p>Warna-warna bendera Selandia Baru akan dimunculkan selama seminggu di jembatan penyeberangan orang (JPO) Gelora Bung Karno.</p>

<p>Kepala Dinas Bina Marga Hari Nugroho mengatakan kombinasi warna itu dimunculkan di JPO GBK sebagai bentuk solidaritas dan dukungan Jakarta kepada Selandia Baru. Terutama keluarga korban penembakan massal di dua masjid tersebut.</p>

<p>"Ini sesuai dengan arahan Pak Gubernur," ujar Hari lewat keterangannya, Sabtu (16/3/2019).</p>

<p>Pemunculan warna-warna bendera Selandia Baru ini sudah dilakukan sejak Jumat (15/3) malam. Kombinasi warna yang ada di bendera tersebut adalah merah, biru, dan putih.</p>`,
      excerpt: 'Pemprov DKI memunculkan warna bendera New Zealand di JPO GBK sebagai bentuk solidaritas atas penembakan di dua masjid di Christchurch.',
      categorySlug: 'nasional',
      tagSlugs: [],
      publishedAt: new Date('2019-03-16T07:48:14Z'),
      viewCount: 890,
    },
    {
      title: 'Menag Kecam Penembakan di New Zealand: Tak Berperikemanusiaan!',
      slug: 'menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan',
      content: `<p>Jakarta - Menteri Agaman Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand. Dia mengatakan aksi terorisme itu bertentangan dengan nilai-nilai agama.</p>

<p>"Itu tindakan tidak berperikemanusiaan dan sangat bertentangan dengan nilai-nilai agama," kata Lukman dalam keterangan tertulis, Sabtu (16/3/2019).</p>

<p>Lukman mengatakan aksi terorisme tidak dibenarkan dalam ajaran agama apa pun. Jadi, menurutnya, penembakan terhadap jemaah di dua Masjid di Selandia Baru adalah aksi pengecut dan tak bertanggung jawab.</p>

<p>Dia mengajak seluruh umat beragam untuk menahan diri dan meningkatkan kewaspadaan. Pemerintah melalui Kementerian Luar Negeri juga bekerja keras mencari kabar perkembangan kondisi di Selandia Baru, termasuk memastikan kondisi keamanan warga negara Indonesia.</p>

<p>Dia juga meminta seluruh warga tidak menyebarkan video aksi penembakan yang dilakukan pelaku.</p>`,
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

<p>Dalam pertemuan, Jokowi menyampaikan pentingnya konsep kerja sama Indo-Pasifik terkait nasib muslim Rohingya di Kota Rakhine, Myanmar.</p>

<p>"Mengenai masalah Rakhine State, Presiden menyampaikan pentingnya keterlibatan ASEAN dalam membantu Myanmar di dalam mempersiapkan repatriasi yang sukarela, damai, dan bermartabat," kata Menteri Luar Negeri Retno Marsudi usai melakukan pertemuan di Istana Merdeka, Jakara Pusat, Rabu (13/3/2019).</p>

<p>Retno mengatakan, Thailand, yang saat ini menjadi Ketua Negara-Negara ASEAN, perlu membahas lebih jauh mengenai rencana itu.</p>`,
      excerpt: 'Presiden Jokowi menyampaikan pentingnya keterlibatan ASEAN dalam menangani masalah Muslim Rohingya di Rakhine State, Myanmar.',
      categorySlug: 'nasional',
      tagSlugs: [],
      publishedAt: new Date('2019-03-16T17:57:26Z'),
      viewCount: 980,
    },
    {
      title: 'Bersih-bersih, 60 Warga Tanjung Priok Ikuti Program Padat Karya',
      slug: 'bersih-bersih-60-warga-tanjung-priok-ikuti-program-padat-karya',
      content: `<p>Jakarta - Kementerian Perhubungan (Kemenhub) melalui Distrik Navigasi (Disnav) Kelas I Tanjung Priok Jakarta menggelar program padat karya.</p>

<p>Sedikitnya 60 orang warga dari Kelurahan Tanjung Priok, Pademangan Barat, Sungai Bambu, dan Warakas Jakarta Utara turut terlibat dalam kegiatan ini.</p>

<p>"Program padat karya yang dilaksanakan di berbagai kantor Distrik Navigasi yang tersebar di seluruh Indonesia, termasuk di Distrik Navigasi Kelas I Tanjung Priok ini dilaksanakan secara berkesinambungan dari tahun ke tahun secara swakelola," kata Direktur Kenavigasian, Basar Antonius dalam keterangan tertulis, Sabtu (16/3/2019).</p>

<p>Hal tersebut diungkapkannya saat membuka kegiatan padat karya tersebut di halaman Kantor Disnav Kelas I Tanjung Priok, Jakarta.</p>

<p>Menurut Basar, kegiatan padat karya seperti ini dapat membuat lingkungan kerja yang bersih dan nyaman bagi para pegawai Disnav Tanjung Priok.</p>`,
      excerpt: 'Kementerian Perhubungan melalui Distrik Navigasi Kelas I Tanjung Priok menggelar program padat karya dengan melibatkan 60 warga.',
      categorySlug: 'nasional',
      tagSlugs: [],
      publishedAt: new Date('2019-03-16T08:10:58Z'),
      viewCount: 560,
    },
    {
      title: 'Pergantian Jitu Luis Milla yang Mengantar Indonesia ke Semifinal',
      slug: 'pergantian-jitu-luis-milla-yang-mengantar-indonesia-ke-semifinal',
      content: `<p>Jakarta - Indonesia berhasil mengalahkan Kamboja 2-0. Sempat buntu di babak pertama, Luis Milla mengubah taktik dan berbuah hasil.</p>

<p>Bermain di Stadion Shah Alam, Malaysia, Kamis (24/8/2017) sore WIB, Luis Milla kembali menurunkan formasi andalal 4-2-3-1. Dengan target meraih kemenangan 3-0 atas Kamboja demi mengamankan tike ke semifinal. Marinus Maryanto Wanewar dimainkan sejak menit pertama.</p>

<p>Marinus disokong oleh Septian David Maulan yang tepat ada di belakang. Sementara itu, Osvaldo Haay dan Saddil Ramdani bertugas sebagai penyisir sisi kanan dan kiri.</p>

<p>Di posisi poros tengah, Muhammad Hargianto berduet dengan Evan Dimas. Sementara itu, Ricky Fajrin kembali ke posisi semula sebagai bek kiri untuk menggantikan peran Rezaldi Hehanusa.</p>

<p>Seperti yang sudah-sudah, Indonesia kembali menyerang dengan mengandalkan kecepatan di sisi lapangan. Umpan-umpan silang pun jadi opsi untuk masuk ke area kotak penalti.</p>`,
      excerpt: 'Timnas Indonesia berhasil mengalahkan Kamboja 2-0 berkat pergantian taktik jitu dari Luis Milla yang mengantar ke semifinal.',
      categorySlug: 'nasional',
      tagSlugs: [],
      publishedAt: new Date('2019-03-17T08:28:54Z'),
      viewCount: 2340,
    },
    {
      title: 'Tontowi Ahmad/Liliyana Natsir Sabet Gelar Juara Dunia Kedua',
      slug: 'tontowi-ahmad-liliyana-natsir-sabet-gelar-juara-dunia-kedua',
      content: `<p>Ganda campuran Indonesia, Tontowi Ahmad/Liliyana Natsir menjadi juara pada Kejuaraan Dunia Bulu Tangkis 2017 di Glasgow, Skotlandia, Senin (28/8/2017) WIB.</p>

<p>Owi/Butet mengalahkan pasangan asal China, Zheng Siwei/Chen Qingchen, dengan skor 15-21, 21-16, 21-15.</p>

<p>Ini menjadi gelar juara dunia bulu tangkis kedua bagi Tontowi/Liliyana.</p>

<p>Penempatan bola yang mereka lakukan beberapa kali sukses mengelabui Tontowi/Liliyana.</p>

<p>Owi/Butet bangkit pada gim kedua berkat sejumlah kesalahan yang dilakukan Zheng/Chen.</p>

<p>Gim kedua akhirnya dimenangi oleh Tontowi/Liliyana dan pertandingan harus ditentukan melalui rubber game.</p>`,
      excerpt: 'Ganda campuran Indonesia Tontowi Ahmad/Liliyana Natsir meraih gelar juara dunia kedua di Kejuaraan Dunia Bulu Tangkis 2017.',
      categorySlug: 'nasional',
      tagSlugs: [],
      publishedAt: new Date('2019-03-17T08:32:45Z'),
      viewCount: 3450,
    },
  ]

  for (const postData of postsData) {
    const post = await prisma.post.create({
      data: {
        title: postData.title,
        slug: postData.slug,
        content: postData.content,
        excerpt: postData.excerpt,
        authorId: admin.id,
        status: PostStatus.PUBLISHED,
        publishedAt: postData.publishedAt,
        viewCount: postData.viewCount,
        categories: {
          connect: [{ id: categories[postData.categorySlug].id }],
        },
        tags: {
          connect: postData.tagSlugs.filter(slug => tags[slug]).map((slug) => ({ id: tags[slug].id })),
        },
      },
    })

    console.log(`   Created post: ${post.title.substring(0, 50)}...`)
  }

  // ===========================================
  // CREATE MENUS
  // ===========================================
  console.log('📋 Creating menus...')

  await prisma.menu.create({
    data: {
      name: 'Primary Menu',
      location: 'primary',
      items: {
        create: [
          { title: 'Beranda', url: '/', order: 0 },
          { title: 'Nasional', url: '/category/nasional', order: 1 },
          { title: 'Madrasah', url: '/category/madrasah', order: 2 },
          { title: 'Pesantren', url: '/category/pesantren', order: 3 },
          { title: 'Perguruan Tinggi', url: '/category/perguruan-tinggi', order: 4 },
          { title: 'Opini', url: '/category/opini', order: 5 },
          { title: 'Tokoh', url: '/category/tokoh', order: 6 },
        ],
      },
    },
  })

  await prisma.menu.create({
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
      { key: 'site_description', value: 'Portal Berita Pendidikan Islam Indonesia' },
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
    await prisma.$disconnect()
    await pool.end()
  })
