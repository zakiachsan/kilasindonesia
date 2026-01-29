-- Additional articles to import
-- Missing 9 articles from WordPress backup

-- Get admin user ID
DO $$
DECLARE
  admin_id TEXT;
BEGIN
  SELECT id INTO admin_id FROM users WHERE email = 'admin@kilasindonesia.com' LIMIT 1;

  IF admin_id IS NULL THEN
    RAISE EXCEPTION 'Admin user not found';
  END IF;

  -- Article 1: Nelayan Garut
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_nelayan_garut',
    '2 Hari Hilang, Nelayan Tewas Mengambang di Pantai Cipalawah Garut',
    '2-hari-hilang-nelayan-tewas-mengambang-di-pantai-cipalawah-garut',
    E'Garut - Setelah melakukan pencarian selama dua hari, petugas Basarnas dan Polairud menemukan jasad Maulana di Pantai Cipalawah, Kabupaten Garut, Jawa Barat. Jenazah pria tersebut langsung dievakuasi petugas.\n\n"Setelah melakukan pencarian selama 2 hari, Tim SAR Bandung akhirnya dapat menemukan korban. Ditemukan dalam keadaan meninggal dunia," kata Humas Kantor SAR Bandung Joshua Banjarnahor via pesan singkat, Sabtu (16/3/2019).\n\nNelayan berusia 45 tahun asal Garut ini dilaporkan hilang di pesisir Pantai Cipalawah, Desa Sancang, Kecamatan Cibalong, Garut, Kamis (14/3).\n\nKapolsek Cibalong AKP Ridwan Tampubolon menyebutkan Maulana menghilang saat hendak mencari ikan dengan cara menyelam di pantai menggunakan busur panah.',
    'Setelah melakukan pencarian selama dua hari, petugas Basarnas dan Polairud menemukan jasad Maulana di Pantai Cipalawah.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2019/03/thumbnail-berita-4-min.jpg',
    '2019-03-16 08:22:08',
    '2019-03-16 08:22:08',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 2: Munir
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_munir_14thn',
    '14 Tahun Terbunuhnya Munir, Polri Didesak Bentuk Tim Khusus',
    '14-tahun-terbunuhnya-munir-polri-didesak-bentuk-tim-khusus',
    E'Jakarta - Hari yang sama 14 tahun lalu, Munir Said Thalib meninggal di dalam pesawat yang mengantarnya ke Amsterdam, Belanda. Munir diracun di udara.\n\nPollycarpus Budihari Priyanto, seorang pilot senior Garuda Indonesia saat itu, ditangkap dan diadili. Dia divonis 14 tahun penjara, tetapi majelis hakim yang mengadilinya yakin ada dalang di balik pembunuhan Munir. Siapa?\n\nPertanyaan itu hingga Pollycarpus akhirnya bebas tahun ini pun belum terjawab. Presiden Joko Widodo (Jokowi) didesak mengambil tindakan.\n\n"Kembali kami menegaskan negara belum mampu membongkar konspirasi dalam kejahatan ini. Pernyataan Presiden Joko Widodo bahwa kasus pembunuhan Munir adalah pekerjaan rumah yang harus diselesaikan masih sebatas janji tanpa bukti," ujar salah satu aktivis HAM dari Kontras, Yati Andriani, di Jalan Kramat II, Senen, Jakarta Pusat, Jumat (7/9/2018).',
    'Hari yang sama 14 tahun lalu, Munir Said Thalib meninggal di dalam pesawat yang mengantarnya ke Amsterdam, Belanda.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2019/03/thumbnail-berita-5-min.jpg',
    '2019-03-16 08:28:00',
    '2019-03-16 08:28:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 3: Prabowo Gerindra
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_prabowo_gerindra',
    'Prabowo Resmikan Kantor DPD Gerindra di Banten',
    'prabowo-resmikan-kantor-dpd-gerindra-di-banten',
    E'Serang - Capres Prabowo Subianto meresmikan kantor baru DPD Gerindra Banten di Jalan Serang-Pandeglang. Selain meresmikan, kedatangannya ke Banten akan bertemu dengan pendukung di rumah aspirasi.\n\nKetua DPD Banten Desmon J Mahesa mengatakan, Prabowo secara khusus meresmikan rumah partai Gerindra Banten yang baru.\n\nPrabowo juga dijadwalkan menyapa partai koalisi, relawan dan masyarakat Banten.\n\n"Hari ini Pak Prabowo datang dalam rangka meresmikan DPD partai, kedua akan ke rumah aspirasi saya di Ciwaru dalam rangka menyapa masyarakat," kata Desmon singkat di Jalan Serang-Pandeglang, Banten, Sabtu (16/3/2019).\n\nPrabowo langsung memberikan tumpeng ke salah satu tokoh Banten Buya Humaid Tanara sebagai prosesi peresmian. Ia juga menandatangani prasasti gedung DPD Gerindra.',
    'Capres Prabowo Subianto meresmikan kantor baru DPD Gerindra Banten di Jalan Serang-Pandeglang.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2019/03/thumbnail-berita-6-min.jpg',
    '2019-03-16 08:55:46',
    '2019-03-16 08:55:46',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 4: MAN 3 Bantul FIKSI
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_man3_bantul_fiksi',
    'MAN 3 Bantul Sabet Medali Emas FIKSI 2025',
    'man-3-bantul-sabet-medali-emas-fiksi-2025',
    E'KILAS INDONESIA - Prestasi luar biasa ditorehkan siswa MAN 3 Bantul (Mantaba) dalam ajang Festival Inovasi dan Kewirausahaan Siswa Indonesia (FIKSI) Tingkat Nasional Tahun 2025. Dua siswa yang tergabung dalam Excellent Entrepreneurs Club (EEC) MAN 3 Bantul, Muhammad Fauzan (XI-E) dan Muhammad Iqwan (XI-D) berhasil melaju final hingga sukses meraih medali emas bidang pariwisata FIKSI 2025.\n\nAjang bergengsi diselenggarakan atas kolaborasi Balai Pengembangan Talenta Indonesia (BPTI), Kementerian Pendidikan Dasar dan Menengah (Kemendikdasmen), serta Pusat Prestasi Nasional (Puspresnas). Pengumuman pemenang digelar dalam final FIKSI 2025 di Smesco Exhibition Hall, Jakarta, Jumat (30/10/2025).\n\nKemenangan tersebut diraih setelah kedua inovator muda ini mempresentasikan Wukirtech hasil karya aplikasi untuk mengembangkan pariwisata daerah.',
    'Dua siswa MAN 3 Bantul berhasil meraih medali emas FIKSI 2025 bidang pariwisata.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2025/11/WhatsApp-Image-2025-10-31-at-13.17.35.jpeg',
    '2025-11-01 20:16:33',
    '2025-11-01 20:16:33',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 5: MRC 2025
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_mrc_2025_juara',
    'Kemenag Umumkan Juara Madrasah Robotics Competition 2025, Berikut Daftarnya!',
    'kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya',
    E'KILAS INDONESIA — Kementerian Agama Republik Indonesia resmi mengumumkan para pemenang Madrasah Robotics Competition (MRC) 2025 pada malam puncak yang digelar di Atrium Utama Living World, Kota Wisata Cibubur, Sabtu (1/11/2025) malam.\n\nMengusung tema "Robotic Technology for a Green Future", ajang bergengsi ini menjadi wadah bagi pelajar madrasah dari seluruh Indonesia untuk menunjukkan kreativitas dan inovasi teknologi yang mendukung masa depan hijau dan berkelanjutan.\n\nWakil Menteri Agama H. Romo Syafii yang hadir dan menutup secara resmi MRC 2025, menegaskan bahwa penguasaan teknologi merupakan bagian dari pengamalan ajaran Islam.\n\n"Teknologi tidak bisa dipisahkan dari nilai-nilai keislaman. Dalam Islam, segala bentuk inovasi yang membawa kemaslahatan bagi manusia adalah ibadah," ungkap Romo Syafi''i dalam sambutannya.',
    'Kementerian Agama resmi mengumumkan para pemenang Madrasah Robotics Competition (MRC) 2025.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2025/11/WhatsApp-Image-2025-11-02-at-11.50.49.jpeg',
    '2025-11-02 18:51:14',
    '2025-11-02 18:51:14',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 6: Olimpiade Madrasah
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_olimpiade_madrasah',
    'Olimpiade Madrasah Dorong SDM Unggul dan Berdaya Saing Global',
    'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global',
    E'KILAS INDONESIA - Kementerian Agama (Kemenag) menggelar Welcoming Dinner dalam rangka Grand Final Olimpiade Madrasah Indonesia (OMI) 2025 di Kantor Wali Kota Tangerang, Jalan Satria-Sudirman, Kota Tangerang, Banten, Senin (10/11/2025) malam.\n\nDirektur Jenderal Pendidikan Islam (Pendis) Kemenag, Prof. Amien Suyitno, menjelaskan bahwa OMI bertujuan untuk mendukung program Asta Cita Presiden Prabowo Subianto.\n\n"Tahun ini kami gabungkan menjadi Olimpiade Madrasah Indonesia. Tujuannya untuk mendukung program Asta Cita Presiden, khususnya cita keempat, yaitu menciptakan SDM unggul yang terintegrasi," ujar Amin.\n\nMenurut Amien, lebih dari 204.000 siswa madrasah dari seluruh Indonesia mengikuti seleksi OMI tahun ini. Dari jumlah tersebut, hanya 484 peserta terbaik yang berhasil lolos ke babak final.',
    'Kementerian Agama menggelar Grand Final Olimpiade Madrasah Indonesia (OMI) 2025.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2025/11/WhatsApp-Image-2025-11-11-at-08.31.46.jpeg',
    '2025-11-13 09:58:04',
    '2025-11-13 09:43:56',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 7: HGN 2025
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_hgn_2025_kickoff',
    'Buka Kick Off HGN 2025, Menag Nasaruddin Tekankan Pentingnya Integrasi Ilmu dan Iman bagi Para Guru',
    'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru',
    E'KILAS INDONESIA — Menteri Agama Nasaruddin Umar, membuka secara resmi kegiatan Kick Off Hari Guru Nasional (HGN) Tahun 2025 di Universitas Islam Negeri (UIN) Syber Syekh Nurjati Cirebon, Rabu (12/11/2025).\n\nDalam sambutannya, Menag Nasaruddin menyampaikan pandangan filosofis tentang makna dan keteladanan seorang guru. Menurutnya, guru bukan sekadar pengajar ilmu, tetapi juga penyalur cahaya bagi jiwa manusia.\n\n"Guru bukan hanya mengisi pikiran, tetapi menumbuhkan kesadaran dan meluruskan jalan berpikir. Dalam pandangan Islam, guru adalah warasatul anbiya (pewaris para nabi) yang meneruskan cahaya ilmu dan nilai kehidupan," ungkap Menag.\n\nMenag juga menekankan pentingnya mengintegrasikan antara ilmu dan iman dalam dunia pendidikan.',
    'Menteri Agama Nasaruddin Umar membuka secara resmi kegiatan Kick Off Hari Guru Nasional 2025.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2025/11/WhatsApp-Image-2025-11-12-at-21.28.58.jpeg',
    '2025-11-13 10:04:08',
    '2025-11-13 10:04:08',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 8: Kongres Rohis
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_kongres_rohis',
    'Kongres Rohis Nasional I 2025 Ditutup, Terpilih Presiden Rohis Indonesia Pertama dan Arah Baru Pembinaan Pelajar Muslim',
    'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim',
    E'KILAS INDONESIA — Untuk pertama kalinya dalam sejarah, Indonesia resmi memiliki Presiden Rohis Indonesia. Muhamad Ridanara Adiyatma, delegasi dari Jawa Tengah, terpilih melalui mekanisme e-voting dalam Kongres Rohis Nasional I 2025 yang diselenggarakan di Jakarta, 12-15 November 2025.\n\nKongres perdana ini menjadi momentum strategis yang memayungi arah pembinaan Rohani Islam di sekolah umum seluruh Indonesia.\n\nMenteri Agama Nasaruddin Umar menegaskan bahwa kepemimpinan sejati tidak hanya dibangun dari kecerdasan, tetapi juga keluhuran akhlak dan kerendahan hati.\n\n"Banyak yang pintar, tetapi tidak semua bisa memimpin dengan hati. Ilmu adalah bekal, tetapi akhlak adalah kompas," ujarnya.',
    'Indonesia resmi memiliki Presiden Rohis Indonesia pertama melalui Kongres Rohis Nasional I 2025.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2025/11/IMG-20251117-WA0003.jpg',
    '2025-11-17 06:08:08',
    '2025-11-17 06:08:08',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 9: Kemenag LPDP
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_kemenag_lpdp',
    'Kemenag Kolaborasi dengan LPDP Gelar Penguatan Moderasi Beragama di 4 Perguruan Tinggi Keagamaan',
    'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama',
    E'Jakarta — Kementerian agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA) Sekretariat Jenderal berkolaborasi dengan Lembaga Pengelola Dana Pendidikan (LPDP), menggelar Penguatan Moderasi Beragama di empat Perguruan Tinggi Keagamaan (PTK).\n\nEmpat perguruan tinggi penyelenggara (PTP) sebagai Mitra Kementerian Agama tersebut adalah UIN Syarif Hidayatullah Jakarta, UIN Sunan Gunungdjati Bandung, UIN Sunan Kudus dan UIN Sayyid Ali Rahmatullah (UIN SATU) Tulungagung.\n\nKepala Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan, Ruchman Basori mengatakan, Penguatan Moderasi Beragama yang dirangkai dengan pengenalan ekoteologi dimaksudkan untuk mencetak para penggerak moderasi beragama dan ekoteologi di Indonesia.',
    'Kementerian Agama berkolaborasi dengan LPDP menggelar Penguatan Moderasi Beragama di 4 PTK.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/2025/11/WhatsApp-Image-2025-11-19-at-15.00.14.jpeg',
    '2025-11-19 19:09:21',
    '2025-11-19 18:07:35',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  RAISE NOTICE 'Successfully inserted 9 additional articles';
END $$;

-- Link posts to categories
INSERT INTO "_PostCategories" ("A", "B")
SELECT c.id, p.id FROM categories c, posts p
WHERE c.slug = 'nasional' AND p.slug IN (
  '2-hari-hilang-nelayan-tewas-mengambang-di-pantai-cipalawah-garut',
  '14-tahun-terbunuhnya-munir-polri-didesak-bentuk-tim-khusus',
  'prabowo-resmikan-kantor-dpd-gerindra-di-banten'
)
ON CONFLICT DO NOTHING;

INSERT INTO "_PostCategories" ("A", "B")
SELECT c.id, p.id FROM categories c, posts p
WHERE c.slug = 'pendidikan' AND p.slug IN (
  'man-3-bantul-sabet-medali-emas-fiksi-2025',
  'kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya',
  'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global',
  'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru',
  'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim',
  'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama'
)
ON CONFLICT DO NOTHING;
