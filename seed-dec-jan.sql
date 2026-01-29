-- New articles from December 2025 and January 2026
-- Fetched from https://kilasindonesia.com/indeks/

DO $$
DECLARE
  admin_id TEXT;
BEGIN
  SELECT id INTO admin_id FROM users WHERE email = 'admin@kilasindonesia.com' LIMIT 1;

  IF admin_id IS NULL THEN
    RAISE EXCEPTION 'Admin user not found';
  END IF;

  -- Article 1: Kemenag Pastikan KBM Madrasah di Sumatera Barat (Jan 7, 2026)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_kbm_sumbar',
    'Kemenag Pastikan KBM Madrasah di Sumatera Barat Berjalan Pascabanjir',
    'kemenag-pastikan-kbm-madrasah-di-sumatera-barat-berjalan-pascabanjir',
    E'KILAS INDONESIA — Kementerian Agama memastikan kegiatan belajar mengajar (KBM) tetap berjalan di madrasah-madrasah yang terdampak banjir di Sumatera Barat. Direktur Jenderal Pendidikan Islam Amien Suyitno mengunjungi MTs Selasar Air dan MTs Tarbiyah Islamiyah di Kabupaten Agam untuk meninjau kondisi.\n\nMTs Selasar Air mengalami kerusakan parah, dengan fasilitas yang tersapu bersih. Saat ini kegiatan belajar dilaksanakan di masjid terdekat.\n\nPemerintah mengalokasikan dana bantuan bencana sebesar Rp6,4 miliar untuk 64 lembaga pendidikan keagamaan di Sumatera Barat. Setiap lembaga menerima Rp100 juta untuk rehabilitasi ringan, bahan pendukung pembelajaran, dan pemulihan lingkungan. Distribusi meliputi 22 madrasah negeri (Rp2,2 miliar), 29 madrasah swasta (Rp2,9 miliar), dan 13 PAUD Islam (Rp1,3 miliar).\n\nSuyitno menyatakan bahwa "keberlangsungan proses pembelajaran menjadi prioritas utama pemerintah", menekankan bahwa siswa tidak boleh kehilangan akses pendidikan akibat bencana.\n\nKementerian berkomitmen untuk memperkuat sistem respons cepat bencana dan membangun fasilitas pendidikan yang tangguh di daerah berisiko tinggi.',
    'Kementerian Agama memastikan KBM tetap berjalan di madrasah terdampak banjir Sumatera Barat dengan alokasi dana Rp6,4 miliar.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/kbm-sumbar.jpeg',
    '2026-01-07 10:00:00',
    '2026-01-07 10:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 2: Kajari Depok Kunjungi MUI (Jan 6, 2026)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_kajari_depok_mui',
    'Kajari Depok Kunjungi MUI Jalin Sinergitas Perkuat Kerjasama',
    'kajari-depok-kunjungi-mui-jalin-sinergitas-perkuat-kerjasama',
    E'KILAS INDONESIA — Kepala Kejaksaan Negeri (Kajari) Depok, Dr. Arif Budiman, S.H., M.H., mengunjungi kantor Majelis Ulama Indonesia (MUI) di Pancoran Mas pada 5 Januari 2026. Kunjungan ini disambut oleh Ketua MUI KH. Syihabuddin Ahmad dan anggota dewan lainnya.\n\nMenurut Budiman, ini adalah kunjungan pertamanya ke MUI Depok sejak menjabat. Ia menyatakan: "Ini pertama kali saya datang ke MUI Depok, apalagi saya baru di Kajari Depok." Tujuannya adalah untuk menjalin hubungan dan mengeksplorasi peluang kolaborasi antara kejaksaan dan dewan keagamaan.\n\nBudiman menekankan kerjasama dalam penegakan hukum, khususnya terkait "PAKEM (Pengawasan Aliran Kepercayaan dan Keagamaan Masyarakat)" dan inisiatif lain untuk membangun masyarakat yang taat hukum di Depok.\n\nKetua MUI Syihabuddin Ahmad merespons positif, menyatakan: "Kami sangat bersyukur atas kunjungan ini dan berharap kita bisa bekerja sama secara sinergis." Ia menyoroti bahwa MUI Depok aktif melayani masyarakat setiap hari melalui sembilan komisi, menangani berbagai hal termasuk konversi Islam, konsultasi keagamaan, dan masalah waris.\n\nKedua belah pihak sepakat untuk merencanakan kegiatan bersama ke depan.',
    'Kajari Depok Dr. Arif Budiman kunjungi MUI untuk jalin sinergitas dan kerjasama penegakan hukum.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/kajari-depok-mui.jpeg',
    '2026-01-06 14:00:00',
    '2026-01-06 14:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 3: Kemenag Rayakan HAB ke-80 (Jan 6, 2026)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_hab_ke80',
    'Kemenag Rayakan HAB ke-80 Dengan Sederhana, Dana Difokuskan untuk Korban Bencana',
    'kemenag-rayakan-hab-ke-80-dengan-sederhana-dana-difokuskan-untuk-korban-bencana',
    E'KILAS INDONESIA — Kementerian Agama (Kemenag) merayakan Hari Amal Bhakti (HAB) ke-80 dengan upacara sederhana pada 5 Januari 2026 di Auditorium HM Rasjidi, Jakarta.\n\nMenteri Agama Nasaruddin Umar menjelaskan bahwa perayaan sederhana ini mencerminkan solidaritas dengan korban bencana di Sumatera, khususnya di Aceh, Sumatera Utara, dan Sumatera Barat. Ia menyatakan: "Peringatan dilaksanakan secara sederhana. Ini merupakan wujud solidaritas kita terhadap saudara-saudara di Sumatera yang sedang mengalami musibah."\n\nRealokasi anggaran memungkinkan kementerian untuk menyalurkan sekitar 155 miliar rupiah bantuan dari berbagai sumber termasuk APBN, BAZNAS (Badan Amil Zakat Nasional), dan berbagai organisasi di bawah koordinasi Kemenag.\n\nTarget Bantuan:\n- 1.137 masjid terdampak\n- 500 madrasah\n- 357 pondok pesantren\n- 11.202 guru madrasah\n- 112.964 siswa madrasah\n\nPerkembangan hingga saat ini:\n- 935 masjid telah dipulihkan\n- 9.000 Al-Quran telah didistribusikan\n- 435 madrasah siap untuk kegiatan belajar\n- Berbagai bahan pembelajaran dan peralatan darurat telah disalurkan\n\nUpacara juga mengapresiasi kegiatan donor darah oleh Dharma Wanita Persatuan (DWP) Kemenag yang mengumpulkan hampir 300 unit darah untuk didistribusikan ke daerah terdampak.',
    'Kemenag rayakan HAB ke-80 secara sederhana, dana 155 miliar rupiah dialihkan untuk bantuan korban bencana di Sumatera.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/hab-ke80.jpeg',
    '2026-01-06 10:00:00',
    '2026-01-06 10:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 4: PDSS SPAN-PTKIN 2026 (Jan 5, 2026)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_pdss_span_ptkin',
    'Pengisian PDSS SPAN-PTKIN 2026 Resmi Dibuka, Sekolah Diminta Pastikan Keakuratan Data Siswa',
    'pengisian-pdss-span-ptkin-2026-resmi-dibuka-sekolah-diminta-pastikan-keakuratan-data-siswa',
    E'KILAS INDONESIA — Panitia Nasional Penerimaan Mahasiswa Baru Perguruan Tinggi Keagamaan Islam Negeri (PMB PTKIN) telah resmi membuka fase pendaftaran Pangkalan Data Sekolah dan Siswa (PDSS) untuk tahun 2026. Ini menandai dimulainya proses seleksi SPAN-PTKIN, yang merupakan sistem seleksi nasional berbasis prestasi akademik tanpa ujian tertulis.\n\nJadwal Pendaftaran:\n- Pendaftaran PDSS: 5 Januari - 7 Februari 2026\n- Entri Data, Verifikasi, dan Finalisasi: 5 Januari - 9 Februari 2026\n\nKetua PMB PTKIN 2026 Prof. Dr. Abd. Aziz menekankan bahwa sekolah harus memastikan keakuratan data, menyatakan: "Validitas data prestasi akademik siswa adalah faktor utama dalam proses seleksi SPAN-PTKIN."\n\nDirjen Pendidikan Islam Prof. Dr. Amien Suyitno menambahkan bahwa sistem 2026 telah ditingkatkan untuk meningkatkan kualitas layanan dan aksesibilitas.\n\nSekolah yang berpartisipasi harus memiliki Nomor Pokok Sekolah Nasional (NPSN) dan mencakup MA/MAK, SMA, SMK, dan satuan pendidikan yang sederajat.\n\nInformasi lebih lanjut:\n- Portal resmi: https://span.ptkin.ac.id\n- Panduan teknis: https://pdss.ptkin.ac.id\n- Kontak: info@ptkin.ac.id atau WhatsApp 0815-7890-1030',
    'PMB PTKIN resmi buka pendaftaran PDSS SPAN-PTKIN 2026, sekolah diminta pastikan keakuratan data siswa.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/pdss-span-ptkin.jpeg',
    '2026-01-05 09:00:00',
    '2026-01-05 09:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 5: Kemenag Tegaskan Pendidikan Islam (Dec 31, 2025)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_pendidikan_islam_krisis',
    'Kemenag Tegaskan Pendidikan Islam Harus Jawab Krisis Global',
    'kemenag-tegaskan-pendidikan-islam-harus-jawab-krisis-global',
    E'KILAS INDONESIA — Menteri Agama Nasaruddin Umar bersama Menteri Koordinator Bidang Pembangunan Manusia dan Kebudayaan Pratikno menegaskan bahwa pendidikan Islam harus bertransformasi untuk menjawab krisis global yang ditandai dengan perubahan cepat, ketidakpastian, dan tantangan etika teknologi.\n\nPernyataan tersebut muncul dalam forum review dan desain Pendidikan Islam yang diselenggarakan oleh Kementerian Agama pada 30 Desember 2025, dihadiri oleh pimpinan kementerian, rektor universitas Islam negeri, mitra internasional, dan pemangku kepentingan pendidikan.\n\nMenteri Umar menekankan peran penting kurikulum, menyatakan bahwa jenis manusia yang lahir di masa depan bergantung pada kerangka pendidikan hari ini. Ia mengadvokasi kurikulum yang berlandaskan kasih sayang dan ekoteologi, beralih dari formalitas ke substansi, dari pandangan dunia antroposentris ke kesadaran ekologis, dan dari religiusitas yang kaku ke praktik keimanan yang membebaskan.\n\nMenko Pratikno menggambarkan dunia saat ini berada dalam era VUCA—volatility, uncertainty, complexity, dan ambiguity—yang diperparah oleh misinformasi, kecerdasan buatan, dan manipulasi teknologi termasuk deepfake.\n\nIa menyoroti pencapaian Islam klasik melalui integrasi pengetahuan dengan nilai-nilai spiritual, menekankan bahwa para cendekiawan Muslim tidak hanya menerjemahkan pengetahuan tetapi menciptakan pemahaman baru melalui integrasi sains dan etika.\n\nPratikno memperingatkan bahwa Islam berada di persimpangan jalan: menjadi solusi moral secara global atau tetap terpinggirkan sebagai tidak relevan. Ia mengadvokasi penguatan kurikulum STREAM Plus—Science, Technology, Religion, Engineering, Arts, Mathematics, plus Sports—untuk mengembangkan generasi yang sehat, berprinsip, dan kompetitif.',
    'Menag dan Menko PMK tegaskan pendidikan Islam harus bertransformasi menjawab krisis global era VUCA.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/pendidikan-islam-krisis.jpeg',
    '2025-12-31 14:00:00',
    '2025-12-31 14:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 6: Kinerja Komunikasi Direktorat PAI (Dec 30, 2025)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_kinerja_pai',
    'Kinerja Komunikasi Direktorat PAI Menguat, Publik Apresiasi Program Pendidikan Agama Islam',
    'kinerja-komunikasi-direktorat-pai-menguat-publik-apresiasi-program-pendidikan-agama-islam',
    E'KILAS INDONESIA — Direktorat Pendidikan Agama Islam (PAI) Kementerian Agama menunjukkan penguatan kinerja komunikasi publik dari 23 Desember 2024 hingga 23 Desember 2025. Direktorat ini mencapai 229 mention di berbagai kanal digital, menghasilkan sekitar 2,2 juta akun media sosial unik yang terjangkau dengan sekitar 9.000 interaksi engagement.\n\nDirjen Amien Suyitno menyatakan bahwa "kebijakan dan program pendidikan Islam semakin dikenal, dipahami, dan mendapat perhatian luas dari publik." Ia menekankan bahwa komunikasi berfungsi sebagai alat strategis yang menjembatani kebijakan dengan kebutuhan publik sekaligus membangun kepercayaan.\n\nAnalisis sentimen menunjukkan lebih dari 80 persen diskusi publik bersifat positif, dengan sentimen negatif minimal. Positivitas berpusat pada inisiatif utama PAI termasuk program Pendidikan Profesi Guru, PAI Fair 2025, dan upaya peningkatan kualitas madrasah.\n\nDirektur PAI M. Munir mencatat bahwa pesan yang konsisten melalui platform sosial seperti Instagram dan YouTube terbukti efektif dalam menjangkau pendidik dan demografi yang lebih muda. Organisasi ini fokus pada penerjemahan kebijakan teknis ke dalam bahasa yang dapat diakses oleh audiens yang lebih luas sambil mempertahankan akurasi substantif.\n\nSecara geografis, mayoritas percakapan publik berasal dari dalam Indonesia menggunakan bahasa Indonesia, menunjukkan jangkauan yang ditargetkan di antara pendidik, siswa, dan pemangku kepentingan pendidikan di tingkat nasional.',
    'Direktorat PAI catat 229 mention digital dengan sentimen positif lebih dari 80 persen sepanjang 2025.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/kinerja-pai.jpeg',
    '2025-12-30 15:00:00',
    '2025-12-30 15:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 7: Direktorat PAI Teguhkan Pendidikan Agama Islam (Dec 30, 2025)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_direktorat_pai_2025',
    'Direktorat PAI Teguhkan Pendidikan Agama Islam sebagai Investasi Peradaban Bangsa Sepanjang 2025',
    'direktorat-pai-teguhkan-pendidikan-agama-islam-sebagai-investasi-peradaban-bangsa-sepanjang-2025',
    E'KILAS INDONESIA — Sepanjang tahun 2025, Direktorat Pendidikan Agama Islam (PAI) memperkuat peran pendidikan Islam sebagai bagian integral dari pembangunan nasional.\n\nSemua pencapaian dan kebijakan strategis dirancang untuk selaras dengan Asta Cita Presiden Prabowo Subianto dan Delapan Prioritas Kementerian Agama, memposisikan pendidikan agama sebagai fondasi moderasi beragama, ketahanan sosial, dan moralitas publik.\n\nPendidikan agama Islam dibingkai bukan sekadar sebagai suplemen kurikulum tetapi sebagai "investasi peradaban yang menentukan pembentukan karakter, etika publik, dan ketahanan sosial di tengah tantangan global."\n\nStatistik Utama:\n- 262.971 guru Pendidikan Agama Islam bertugas\n- 41,8 juta siswa Muslim di\n- 317.520 sekolah umum di seluruh negeri\n\nKemajuan Sertifikasi Guru:\n- 90,2% guru PAI kini merupakan pendidik tersertifikasi\n- 9,8% (sekitar 25.880 guru) tetap menjadi prioritas untuk program pengembangan profesional berkelanjutan\n\nInisiatif Strategis:\n- Pengembangan Literasi: Gerakan nasional pemberantasan buta huruf Al-Quran di sekolah, didukung oleh penjaminan kualitas Universitas PTIQ dan platform digital CintaQu.\n- Program Asesmen: Asesmen literasi nasional menggunakan kerangka Taksonomi Bloom yang mengukur dimensi kognitif, psikomotorik, dan afektif.\n- Inovasi Digital: Pengembangan 40 buku teks pendidikan Islam digital terintegrasi AI (Smart PAI) untuk jutaan siswa dan guru.\n- Keterlibatan Pemuda: Pembentukan Duta Wakaf Sekolah di 34 provinsi, kongres organisasi siswa nasional, dan program kepemimpinan siswa yang menekankan moderasi beragama dan ketahanan nasional.\n\nDirjen Amin Suyitno menyatakan bahwa guru PAI harus diposisikan sebagai agen sentral pembangunan peradaban nasional, menekankan bahwa "pendidikan agama tidak bisa berhenti pada hafalan dan simbol tetapi harus membentuk pemikiran, kepekaan sosial, dan etika publik."',
    'Direktorat PAI teguhkan pendidikan Islam sebagai investasi peradaban dengan 262.971 guru dan 41,8 juta siswa.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/direktorat-pai-2025.jpeg',
    '2025-12-30 10:00:00',
    '2025-12-30 10:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 8: Kemenag Perkuat Literasi Al-Quran (Dec 18, 2025)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_literasi_alquran',
    'Kemenag Perkuat Literasi Al-Qur''an di Sekolah, Asesmen Nasional Jadi Fondasi Kebijakan Pendidikan Agama',
    'kemenag-perkuat-literasi-al-quran-di-sekolah-asesmen-nasional-jadi-fondasi-kebijakan-pendidikan-agama',
    E'KILAS INDONESIA — Kementerian Agama memperkuat inisiatif literasi Al-Quran di sekolah melalui program asesmen nasional. Menteri Nasaruddin Umar menekankan bahwa "Al-Quran harus dipahami sebagai petunjuk hidup yang dibaca dengan benar."\n\nKementerian melaksanakan asesmen berbasis digital yang melibatkan lebih dari 120.000 guru dan pengawas pendidikan di seluruh Jawa pada tahun 2025. Hasil menunjukkan kesenjangan yang mengkhawatirkan: sekitar 55-60% mendapat skor di kategori "Pratama" (dasar), sementara hanya 13-15% yang mencapai status "Mahir" (cakap).\n\nAsesmen mengevaluasi empat kompetensi inti: akurasi pengucapan, karakteristik huruf, kaidah Al-Quran, dan perpanjangan vokal yang tepat. Kesalahan mengurangi skor dari nilai awal 100, dengan pengurangan berkisar dari 0,5 hingga 4 poin tergantung pada tingkat keparahan.\n\nKementerian mengembangkan aplikasi CintaQu—platform digital terstandarisasi—untuk menyederhanakan asesmen dan memetakan kemampuan guru secara sistematis. Data ini akan menginformasikan program pengembangan profesional yang ditargetkan dan perbaikan kebijakan untuk pendidikan Islam di seluruh negeri.',
    'Kemenag perkuat literasi Al-Quran dengan asesmen nasional, hasil menunjukkan 55-60% guru di kategori Pratama.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/literasi-alquran.jpeg',
    '2025-12-18 11:00:00',
    '2025-12-18 11:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 9: Program TBQ Guru Madrasah (Dec 17, 2025)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_tbq_guru_madrasah',
    'Program TBQ Guru Madrasah Resmi Dibuka, Kemenag Catat 403 Ribu Guru Masuk Basis Data',
    'program-tbq-guru-madrasah-resmi-dibuka-kemenag-catat-403-ribu-guru-masuk-basis-data',
    E'KILAS INDONESIA — Kementerian Agama resmi meluncurkan program Tuntas Baca Al-Quran (TBQ) untuk guru madrasah secara nasional pada 16 Desember 2025. Inisiatif ini bertujuan untuk memperkuat kompetensi dasar guru dalam membaca Al-Quran.\n\nStatistik Utama:\n- 403.996 guru madrasah terdaftar dalam sistem\n- 105.901 guru terverifikasi (mewakili 53% dari kuota nasional 200.000 orang)\n- 94.099 slot masih tersedia\n\nIkhtisar Program:\nAsesmen berfungsi sebagai alat pemetaan awal untuk mengevaluasi kemahiran membaca Al-Quran guru. Hasil akan menginformasikan program pelatihan dan pendampingan yang ditargetkan sesuai dengan tingkat kompetensi tertentu.\n\nMenurut pimpinan program, "guru adalah kuncinya. Guru yang belum menguasai bacaan Al-Quran tidak dapat secara efektif mengajarkan keterampilan yang sama kepada siswanya." Inisiatif ini menggunakan asesmen pengiriman video online yang dievaluasi oleh ratusan asesor dari PTIQ Jakarta.\n\nHasil yang Diharapkan:\nPejabat mengantisipasi program ini akan meningkatkan kualitas pengajaran di seluruh madrasah secara nasional, yang pada akhirnya bermanfaat bagi pengembangan karakter siswa dan literasi Al-Quran di seluruh lembaga pendidikan Islam Indonesia.',
    'Kemenag luncurkan program TBQ untuk 403.996 guru madrasah, 105.901 guru sudah terverifikasi.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/tbq-guru-madrasah.jpeg',
    '2025-12-17 14:00:00',
    '2025-12-17 14:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  -- Article 10: 75 Peserta LAPP (Dec 17, 2025)
  INSERT INTO posts (id, title, slug, content, excerpt, "authorId", status, "viewCount", "featuredImage", "publishedAt", "createdAt", "updatedAt")
  VALUES (
    'post_lapp_75_peserta',
    '75 Peserta LAPP Siap Berangkat Studi S2 dan S3 ke Luar Negeri',
    '75-peserta-lapp-siap-berangkat-studi-s2-dan-s3-ke-luar-negeri',
    E'KILAS INDONESIA — Program Language and Academic Preparation Program (LAPP), yang diselenggarakan oleh Kementerian Agama, berhasil menyelesaikan kursus intensif selama dua bulan di lima universitas Islam negeri. Inisiatif ini mempersiapkan penerima beasiswa dari program Beasiswa Indonesia Bangkit (BIB) untuk studi pascasarjana di luar negeri.\n\nSebanyak 75 peserta menyelesaikan program di universitas-universitas termasuk UIN Malang, UIN Jakarta, UIN Semarang, UIN Surabaya, dan UIN Makassar antara 12 November dan 12 Desember 2025.\n\nTujuan Program Utama:\nKurikulum memperkuat kemahiran bahasa Inggris dan persiapan akademik sambil memperkenalkan siswa pada budaya dan kebiasaan akademik internasional. Peserta belajar tata krama yang tepat saat berinteraksi dengan profesor di luar negeri, termasuk bentuk sapaan yang sesuai.\n\nDetail Peserta:\nLima belas peserta mengikuti sesi tatap muka di UIN Malang, sementara enam puluh lainnya berpartisipasi secara jarak jauh di empat universitas lainnya.\n\nInformasi Beasiswa:\nKementerian Agama memberikan 1.029 beasiswa pada tahun 2025 untuk program sarjana, magister, dan doktoral. Tujuan yang dimaksud meliputi Australia, Inggris, Amerika, Belanda, dan Jerman. Penerima dengan surat penerimaan memulai studi pada Januari 2026, sementara mereka yang masih mencari penerimaan memiliki waktu hingga Desember 2026.',
    '75 peserta LAPP siap berangkat studi S2 dan S3 ke luar negeri dengan beasiswa Indonesia Bangkit.',
    admin_id,
    'PUBLISHED',
    0,
    '/uploads/lapp-75-peserta.jpeg',
    '2025-12-17 10:00:00',
    '2025-12-17 10:00:00',
    NOW()
  ) ON CONFLICT (slug) DO NOTHING;

  RAISE NOTICE 'Successfully inserted 10 new articles from Dec 2025 - Jan 2026';
END $$;

-- Link posts to categories (Pendidikan)
INSERT INTO "_PostCategories" ("A", "B")
SELECT c.id, p.id FROM categories c, posts p
WHERE c.slug = 'pendidikan' AND p.slug IN (
  'kemenag-pastikan-kbm-madrasah-di-sumatera-barat-berjalan-pascabanjir',
  'pengisian-pdss-span-ptkin-2026-resmi-dibuka-sekolah-diminta-pastikan-keakuratan-data-siswa',
  'kemenag-tegaskan-pendidikan-islam-harus-jawab-krisis-global',
  'kinerja-komunikasi-direktorat-pai-menguat-publik-apresiasi-program-pendidikan-agama-islam',
  'direktorat-pai-teguhkan-pendidikan-agama-islam-sebagai-investasi-peradaban-bangsa-sepanjang-2025',
  'kemenag-perkuat-literasi-al-quran-di-sekolah-asesmen-nasional-jadi-fondasi-kebijakan-pendidikan-agama',
  'program-tbq-guru-madrasah-resmi-dibuka-kemenag-catat-403-ribu-guru-masuk-basis-data',
  '75-peserta-lapp-siap-berangkat-studi-s2-dan-s3-ke-luar-negeri'
)
ON CONFLICT DO NOTHING;

-- Link posts to categories (Nasional)
INSERT INTO "_PostCategories" ("A", "B")
SELECT c.id, p.id FROM categories c, posts p
WHERE c.slug = 'nasional' AND p.slug IN (
  'kajari-depok-kunjungi-mui-jalin-sinergitas-perkuat-kerjasama',
  'kemenag-rayakan-hab-ke-80-dengan-sederhana-dana-difokuskan-untuk-korban-bencana'
)
ON CONFLICT DO NOTHING;
