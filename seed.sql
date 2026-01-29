-- Seed data for Kilas Indonesia

-- Clear existing data
DELETE FROM menu_items;
DELETE FROM menus;
DELETE FROM comments;
DELETE FROM "_PostCategories";
DELETE FROM "_PostTags";
DELETE FROM posts;
DELETE FROM tags;
DELETE FROM categories;
DELETE FROM users;
DELETE FROM settings;

-- Create admin user
-- Password: admin123 (bcrypt hash)
INSERT INTO users (id, email, password, name, role, "createdAt", "updatedAt")
VALUES (
  'cluser001admin',
  'admin@kilasindonesia.com',
  '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
  'Admin Kilas Indonesia',
  'ADMIN',
  NOW(),
  NOW()
);

-- Create categories
INSERT INTO categories (id, name, slug, description, "createdAt") VALUES
  ('clcat001nasional', 'Nasional', 'nasional', 'Berita nasional terkini', NOW()),
  ('clcat002madrasah', 'Madrasah', 'madrasah', 'Berita seputar madrasah di Indonesia', NOW()),
  ('clcat003pesantren', 'Pesantren', 'pesantren', 'Berita seputar pesantren dan santri', NOW()),
  ('clcat004perguruan', 'Perguruan Tinggi', 'perguruan-tinggi', 'Berita seputar perguruan tinggi keagamaan', NOW()),
  ('clcat005opini', 'Opini', 'opini', 'Opini dan pandangan', NOW()),
  ('clcat006tokoh', 'Tokoh', 'tokoh', 'Profil tokoh pendidikan dan keagamaan', NOW()),
  ('clcat007edukasi', 'Edukasi', 'edukasi', 'Berita pendidikan umum', NOW());

-- Create tags
INSERT INTO tags (id, name, slug, "createdAt") VALUES
  ('cltag001kemenag', 'Kemenag', 'kemenag', NOW()),
  ('cltag002santri', 'Hari Santri', 'hari-santri', NOW()),
  ('cltag003menag', 'Menteri Agama', 'menteri-agama', NOW()),
  ('cltag004pendidik', 'Pendidikan Islam', 'pendidikan-islam', NOW()),
  ('cltag005prabowo', 'Prabowo Subianto', 'prabowo-subianto', NOW()),
  ('cltag006robotik', 'Robotik', 'robotik', NOW()),
  ('cltag007beasiswa', 'Beasiswa', 'beasiswa', NOW()),
  ('cltag008uin', 'UIN Jakarta', 'uin-jakarta', NOW()),
  ('cltag009ditjen', 'Ditjen Pesantren', 'ditjen-pesantren', NOW()),
  ('cltag010mrc', 'MRC 2025', 'mrc-2025', NOW()),
  ('cltag011asta', 'Asta Cita', 'asta-cita', NOW());

-- Create posts
INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt") VALUES
-- Post 1
('clpost001mrc',
 'Menag Nasaruddin Dorong Siswa Madrasah Bukan Hanya Unggul dalam Agama tapi juga Teknologi',
 'menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi',
 '<p><strong>KILASINDONESIA.COM</strong> – Menteri Agama Nasaruddin Umar membuka ajang Madrasah Robotics Competition (MRC) 2025 yang digelar di Atrium Utama Living World Kota Wisata Cibubur, Sabtu (1/11/2025). Dalam arahannya, Menag menegaskan bahwa madrasah hari ini harus menjadi simbol kemajuan — tidak hanya dalam ilmu agama, tetapi juga sains dan teknologi.</p><p>"Anak-anak madrasah jangan hanya bisa mengaji dan berdoa, tapi juga harus mampu menciptakan robot, meneliti, dan berinovasi. Itu baru madrasah masa depan," ujar Nasaruddin.</p><p>Menag pun mengapresiasi semangat para peserta MRC 2025. Tahun ini tercatat 616 tim dari berbagai jenjang madrasah di seluruh Indonesia ikut berkompetisi, jumlah terbanyak sepanjang penyelenggaraan MRC sejak pertama kali digelar pada 2015.</p>',
 'Menteri Agama Nasaruddin Umar membuka Madrasah Robotics Competition (MRC) 2025 dan menegaskan bahwa madrasah harus menjadi simbol kemajuan dalam ilmu agama dan teknologi.',
 'cluser001admin',
 'PUBLISHED',
 1250,
 '2025-11-01 13:13:51',
 NOW(),
 NOW()),

-- Post 2
('clpost002bakti',
 'Malam Bakti Santri, Menag Sampaikan Terima Kasih atas Perhatian Presiden ke Pesantren',
 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren',
 '<p><strong>KILASINDONESIA.COM</strong> --- Menteri Agama Nasaruddin Umar menyampakan terima kasih kepada Presiden Prabowo atas perhatiannya ke dunia pesantren. Hal ini disampaikan Menag Nasaruddin Umar saat memberikan sambutan pada malam Bakti Santri untuk Negeri di TMII, Jakarta.</p><p>"Izinkan saya menyampaikan terima kasih dan apresiasi yang setinggi-tingginya kepada Presiden Republik Indonesia, Bapak Prabowo Subianto, atas keberpihakan nyata beliau kepada dunia pesantren," ucap Menag di Jakarta, Jumat (24/10/2025).</p><p>Hingga 2025, Kemenag mencatat terdapat 42.369 pesantren yang tersebar di seluruh Nusantara, dengan jutaan santri yang belajar.</p>',
 'Menteri Agama Nasaruddin Umar menyampaikan terima kasih kepada Presiden Prabowo atas perhatiannya ke dunia pesantren dalam acara Bakti Santri untuk Negeri.',
 'cluser001admin',
 'PUBLISHED',
 2340,
 '2025-10-25 03:38:10',
 NOW(),
 NOW()),

-- Post 3
('clpost003hsn',
 'Gelar Peringatan HSN 2025, Rektor UIN Jakarta Harap Para Santri Terus Tingkatkan Ilmu dan Akhlak',
 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak',
 '<p><strong>KILASINDONESIA.COM</strong> - Rektor UIN Syarif Hidayatullah Jakarta, Prof Asep Saepudin Jahar, memimpin Upacara Peringatan Hari Santri Nasional (HSN) 2025 di Lapangan Student Center Kampus 1, Ciputat, Tangerang Selatan, Banten, Rabu 22 Oktober 2025.</p><p>"Saya berharap kepada para santri untuk terus meningkatkan ilmu, meningkatkan akhlak dan juga memperkuat komitmen kepada bangsa. Semoga mereka terus berjuang menjadi generasi masa depan yang membanggakan," katanya.</p>',
 'Rektor UIN Syarif Hidayatullah Jakarta memimpin Upacara Peringatan Hari Santri Nasional 2025 dan berharap para santri terus meningkatkan ilmu dan akhlak.',
 'cluser001admin',
 'PUBLISHED',
 1890,
 '2025-10-23 04:50:06',
 NOW(),
 NOW()),

-- Post 4
('clpost004asta',
 'Langkah Kemenag Wujudkan Asta Cita: dari Jaga Kerukunan untuk Pembangunan hingga Sejahterakan Guru',
 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru',
 '<p><strong>KILASINDONESIA.COM</strong> - Setahun pemerintahan Presiden Prabowo Subianto–Gibran Rakabuming Raka menjadi momentum penting bagi Kementerian Agama (Kemenag) untuk menghadirkan wajah kehidupan beragama yang lebih inklusif, produktif, dan menyejahterakan.</p><p>"Asta Cita bukan sekadar rencana politik, tapi arah moral bangsa. Di Kementerian Agama, kami terus berupaya agar nilai agama tidak berhenti di mimbar, tetapi hidup dalam kebijakan yang memuliakan manusia," ujar Menag Nasaruddin Umar.</p><p>Tahun ini, sebanyak 206.325 guru telah mengikuti Pendidikan Profesi Guru (PPG), meningkat hingga 700% dibanding tahun sebelumnya.</p>',
 'Kemenag mewujudkan Asta Cita Presiden dengan menjaga kerukunan, memperkuat pendidikan keagamaan, dan meningkatkan kesejahteraan guru.',
 'cluser001admin',
 'PUBLISHED',
 3450,
 '2025-10-23 04:46:36',
 NOW(),
 NOW()),

-- Post 5
('clpost005ditjen',
 'Kado Hari Santri, Presiden Setujui Pembentukan Ditjen Pesantren',
 'kado-hari-santri-presiden-setujui-pembentukan-ditjen-pesantren',
 '<p><strong>KILASINDONESIA.COM</strong>-Kabar gembira datang bertepatan dengan peringatan Hari Santri 2025. Presiden Prabowo Subianto menyetujui pembentukan Direktorat Jenderal (Ditjen) Pesantren di lingkungan Kementerian Agama.</p><p>"Wabil khusus Wamenag telah memerjuangkannya sesegera mungkin," sebut Menag di Jakarta usai memimpin Apel Hari Santri 2025 di halaman Kantor Kementerian Agama, Rabu (22/10/2025).</p><p>"Dengan adanya Ditjen, hal-hal tersebut bisa tertangani dengan lebih baik karena ada perangkat kerja yang lebih luas dan sistem yang lebih terkoordinasi," jelas Menag.</p>',
 'Presiden Prabowo Subianto menyetujui pembentukan Direktorat Jenderal Pesantren di Kementerian Agama sebagai kado Hari Santri 2025.',
 'cluser001admin',
 'PUBLISHED',
 5670,
 '2025-10-22 14:29:27',
 NOW(),
 NOW()),

-- Post 6
('clpost006solid',
 'Solidaritas Korban Penembakan, DKI Beri Warna Bendera New Zealand di JPO GBK',
 'solidaritas-korban-penembakan-dki-beri-warna-bendera-new-zealand-di-jpo-gbk',
 '<p>Pemprov DKI turut berbelasungkawa atas penembakan di dua masjid di Christchurch, New Zealand, yang menewaskan 49 orang.</p><p>Warna-warna bendera Selandia Baru akan dimunculkan selama seminggu di jembatan penyeberangan orang (JPO) Gelora Bung Karno.</p><p>"Ini sesuai dengan arahan Pak Gubernur," ujar Hari lewat keterangannya, Sabtu (16/3/2019).</p>',
 'Pemprov DKI memunculkan warna bendera New Zealand di JPO GBK sebagai bentuk solidaritas atas penembakan di dua masjid di Christchurch.',
 'cluser001admin',
 'PUBLISHED',
 890,
 '2019-03-16 07:48:14',
 NOW(),
 NOW()),

-- Post 7
('clpost007menag',
 'Menag Kecam Penembakan di New Zealand: Tak Berperikemanusiaan!',
 'menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan',
 '<p>Jakarta - Menteri Agaman Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand. Dia mengatakan aksi terorisme itu bertentangan dengan nilai-nilai agama.</p><p>"Itu tindakan tidak berperikemanusiaan dan sangat bertentangan dengan nilai-nilai agama," kata Lukman dalam keterangan tertulis, Sabtu (16/3/2019).</p>',
 'Menteri Agama Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand sebagai tindakan tidak berperikemanusiaan.',
 'cluser001admin',
 'PUBLISHED',
 1230,
 '2019-03-16 07:56:50',
 NOW(),
 NOW()),

-- Post 8
('clpost008rohingya',
 'Jokowi Minta ASEAN Tangani Masalah Muslim Rohingya di Rakhine State',
 'jokowi-minta-asean-tangani-masalah-muslim-rohingya-di-rakhine-state',
 '<p>Presiden Jokowi menerima Menteri Luar Negeri Thailand Don Pramudwinai di Istana Merdeka, Jakarta Pusat, Rabu (13/3/2019).</p><p>"Mengenai masalah Rakhine State, Presiden menyampaikan pentingnya keterlibatan ASEAN dalam membantu Myanmar di dalam mempersiapkan repatriasi yang sukarela, damai, dan bermartabat," kata Menteri Luar Negeri Retno Marsudi.</p>',
 'Presiden Jokowi menyampaikan pentingnya keterlibatan ASEAN dalam menangani masalah Muslim Rohingya di Rakhine State, Myanmar.',
 'cluser001admin',
 'PUBLISHED',
 980,
 '2019-03-16 17:57:26',
 NOW(),
 NOW()),

-- Post 9
('clpost009padat',
 'Bersih-bersih, 60 Warga Tanjung Priok Ikuti Program Padat Karya',
 'bersih-bersih-60-warga-tanjung-priok-ikuti-program-padat-karya',
 '<p>Jakarta - Kementerian Perhubungan (Kemenhub) melalui Distrik Navigasi (Disnav) Kelas I Tanjung Priok Jakarta menggelar program padat karya.</p><p>Sedikitnya 60 orang warga dari Kelurahan Tanjung Priok, Pademangan Barat, Sungai Bambu, dan Warakas Jakarta Utara turut terlibat dalam kegiatan ini.</p>',
 'Kementerian Perhubungan melalui Distrik Navigasi Kelas I Tanjung Priok menggelar program padat karya dengan melibatkan 60 warga.',
 'cluser001admin',
 'PUBLISHED',
 560,
 '2019-03-16 08:10:58',
 NOW(),
 NOW()),

-- Post 10
('clpost010milla',
 'Pergantian Jitu Luis Milla yang Mengantar Indonesia ke Semifinal',
 'pergantian-jitu-luis-milla-yang-mengantar-indonesia-ke-semifinal',
 '<p>Jakarta - Indonesia berhasil mengalahkan Kamboja 2-0. Sempat buntu di babak pertama, Luis Milla mengubah taktik dan berbuah hasil.</p><p>Bermain di Stadion Shah Alam, Malaysia, Kamis (24/8/2017) sore WIB, Luis Milla kembali menurunkan formasi andalal 4-2-3-1.</p>',
 'Timnas Indonesia berhasil mengalahkan Kamboja 2-0 berkat pergantian taktik jitu dari Luis Milla yang mengantar ke semifinal.',
 'cluser001admin',
 'PUBLISHED',
 2340,
 '2019-03-17 08:28:54',
 NOW(),
 NOW()),

-- Post 11
('clpost011badmin',
 'Tontowi Ahmad/Liliyana Natsir Sabet Gelar Juara Dunia Kedua',
 'tontowi-ahmad-liliyana-natsir-sabet-gelar-juara-dunia-kedua',
 '<p>Ganda campuran Indonesia, Tontowi Ahmad/Liliyana Natsir menjadi juara pada Kejuaraan Dunia Bulu Tangkis 2017 di Glasgow, Skotlandia, Senin (28/8/2017) WIB.</p><p>Owi/Butet mengalahkan pasangan asal China, Zheng Siwei/Chen Qingchen, dengan skor 15-21, 21-16, 21-15.</p>',
 'Ganda campuran Indonesia Tontowi Ahmad/Liliyana Natsir meraih gelar juara dunia kedua di Kejuaraan Dunia Bulu Tangkis 2017.',
 'cluser001admin',
 'PUBLISHED',
 3450,
 '2019-03-17 08:32:45',
 NOW(),
 NOW());

-- Link posts to categories
INSERT INTO "_PostCategories" ("A", "B") VALUES
  ('clcat002madrasah', 'clpost001mrc'),
  ('clcat003pesantren', 'clpost002bakti'),
  ('clcat004perguruan', 'clpost003hsn'),
  ('clcat001nasional', 'clpost004asta'),
  ('clcat003pesantren', 'clpost005ditjen'),
  ('clcat001nasional', 'clpost006solid'),
  ('clcat001nasional', 'clpost007menag'),
  ('clcat001nasional', 'clpost008rohingya'),
  ('clcat001nasional', 'clpost009padat'),
  ('clcat001nasional', 'clpost010milla'),
  ('clcat001nasional', 'clpost011badmin');

-- Link posts to tags
INSERT INTO "_PostTags" ("A", "B") VALUES
  ('clpost001mrc', 'cltag001kemenag'),
  ('clpost001mrc', 'cltag003menag'),
  ('clpost001mrc', 'cltag006robotik'),
  ('clpost001mrc', 'cltag010mrc'),
  ('clpost002bakti', 'cltag001kemenag'),
  ('clpost002bakti', 'cltag003menag'),
  ('clpost002bakti', 'cltag002santri'),
  ('clpost002bakti', 'cltag005prabowo'),
  ('clpost002bakti', 'cltag009ditjen'),
  ('clpost003hsn', 'cltag002santri'),
  ('clpost003hsn', 'cltag008uin'),
  ('clpost003hsn', 'cltag004pendidik'),
  ('clpost004asta', 'cltag001kemenag'),
  ('clpost004asta', 'cltag003menag'),
  ('clpost004asta', 'cltag011asta'),
  ('clpost004asta', 'cltag005prabowo'),
  ('clpost005ditjen', 'cltag001kemenag'),
  ('clpost005ditjen', 'cltag002santri'),
  ('clpost005ditjen', 'cltag005prabowo'),
  ('clpost005ditjen', 'cltag009ditjen'),
  ('clpost005ditjen', 'cltag003menag'),
  ('clpost007menag', 'cltag001kemenag'),
  ('clpost007menag', 'cltag003menag');

-- Create menus
INSERT INTO menus (id, name, location) VALUES
  ('clmenu001primary', 'Primary Menu', 'primary'),
  ('clmenu002footer', 'Footer Menu', 'footer');

INSERT INTO menu_items (id, "menuId", title, url, target, "order") VALUES
  ('clmi001home', 'clmenu001primary', 'Beranda', '/', '_self', 0),
  ('clmi002nasional', 'clmenu001primary', 'Nasional', '/category/nasional', '_self', 1),
  ('clmi003madrasah', 'clmenu001primary', 'Madrasah', '/category/madrasah', '_self', 2),
  ('clmi004pesantren', 'clmenu001primary', 'Pesantren', '/category/pesantren', '_self', 3),
  ('clmi005perguruan', 'clmenu001primary', 'Perguruan Tinggi', '/category/perguruan-tinggi', '_self', 4),
  ('clmi006opini', 'clmenu001primary', 'Opini', '/category/opini', '_self', 5),
  ('clmi007tokoh', 'clmenu001primary', 'Tokoh', '/category/tokoh', '_self', 6),
  ('clmi008tentang', 'clmenu002footer', 'Tentang Kami', '/tentang-kami', '_self', 0),
  ('clmi009kontak', 'clmenu002footer', 'Kontak', '/kontak', '_self', 1),
  ('clmi010privasi', 'clmenu002footer', 'Kebijakan Privasi', '/kebijakan-privasi', '_self', 2),
  ('clmi011syarat', 'clmenu002footer', 'Syarat & Ketentuan', '/syarat-ketentuan', '_self', 3);

-- Create settings
INSERT INTO settings (key, value) VALUES
  ('site_name', 'Kilas Indonesia'),
  ('site_description', 'Portal Berita Pendidikan Islam Indonesia'),
  ('site_logo', '/images/logo.png'),
  ('posts_per_page', '10'),
  ('allow_comments', 'true'),
  ('moderate_comments', 'true');
