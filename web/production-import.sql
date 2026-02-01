-- KilasIndonesia Production Import SQL
-- Generated on 2026-02-01T00:20:45.986Z
-- Run this SQL on production PostgreSQL database

BEGIN;

-- Check and create admin user if not exists
INSERT INTO users (id, email, password, name, role, "createdAt", "updatedAt")
SELECT 'cml2zvw2stekadtt0', 'admin@kilasindonesia.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'Admin Kilas Indonesia', 'ADMIN', '2026-02-01T00:20:45.988Z', '2026-02-01T00:20:45.988Z'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email = 'admin@kilasindonesia.com');

-- Get admin user ID
DO $$ DECLARE admin_user_id TEXT; BEGIN
  SELECT id INTO admin_user_id FROM users WHERE email = 'admin@kilasindonesia.com' LIMIT 1;

  -- Categories
  INSERT INTO categories (id, name, slug, description, "createdAt")
  SELECT 'cml2zvw2si7bz01fg', 'Nasional', 'nasional', 'Berita nasional terkini', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'nasional');
  INSERT INTO categories (id, name, slug, description, "createdAt")
  SELECT 'cml2zvw2shpkjl9nn', 'Madrasah', 'madrasah', 'Berita seputar madrasah di Indonesia', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'madrasah');
  INSERT INTO categories (id, name, slug, description, "createdAt")
  SELECT 'cml2zvw2sbflis2wg', 'Pesantren', 'pesantren', 'Berita seputar pesantren dan santri', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'pesantren');
  INSERT INTO categories (id, name, slug, description, "createdAt")
  SELECT 'cml2zvw2s8fpirain', 'Perguruan Tinggi', 'perguruan-tinggi', 'Berita seputar perguruan tinggi keagamaan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'perguruan-tinggi');
  INSERT INTO categories (id, name, slug, description, "createdAt")
  SELECT 'cml2zvw2sph30pa2v', 'Opini', 'opini', 'Opini dan pandangan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'opini');
  INSERT INTO categories (id, name, slug, description, "createdAt")
  SELECT 'cml2zvw2spt2si4zx', 'Tokoh', 'tokoh', 'Profil tokoh pendidikan dan keagamaan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'tokoh');
  INSERT INTO categories (id, name, slug, description, "createdAt")
  SELECT 'cml2zvw2sw6mddbet', 'Edukasi', 'edukasi', 'Berita pendidikan umum', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM categories WHERE slug = 'edukasi');

  -- Tags
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s2inck08u', 'Aceh', 'aceh', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'aceh');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sewwvy278', 'Belajar Mengajar', 'belajar-mengajar', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'belajar-mengajar');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sn3zapcrl', 'KBM', 'kbm', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kbm');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s0dldtwt1', 'Depok', 'depok', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'depok');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s0pdgm8t8', 'MUI', 'mui', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'mui');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s3u38h0bu', 'Kejari Depok', 'kejari-depok', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kejari-depok');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sa3kxq6ue', 'Kementerian Agama', 'kementerian-agama', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kementerian-agama');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s5fk85jax', '2026', '2026', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = '2026');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2ss2dwn2dt', 'PTKIN', 'ptkin', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'ptkin');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s8zmo16g9', 'Pendidikan Islam', 'pendidikan-islam', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'pendidikan-islam');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s86lcytj8', '2025', '2025', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = '2025');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2ssnbxorgq', 'Kinerja', 'kinerja', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kinerja');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s0lz7bftk', 'Direktorat Pendidikan Agama Islam (PAI)', 'direktorat-pendidikan-agama-islam-pai', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'direktorat-pendidikan-agama-islam-pai');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2swxfe7aqw', 'Literasi', 'literasi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'literasi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s2q08gfv8', 'TBQ', 'tbq', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'tbq');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s3ikz0629', 'Guru Madrasah', 'guru-madrasah', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'guru-madrasah');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s9rplyuzu', 'Surakarta', 'surakarta', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'surakarta');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2stufc0wvj', 'Beasiswa', 'beasiswa', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'beasiswa');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2srsfjtqnd', 'Diskusi', 'diskusi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'diskusi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sukqdbu5y', 'UIN Surabaya', 'uin-surabaya', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-surabaya');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sfayvgcoi', 'Anti Korupsi', 'anti-korupsi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'anti-korupsi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2schrhf127', 'Penghargaan', 'penghargaan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'penghargaan');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2slwt9kfnc', 'DIY', 'diy', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'diy');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sk1oar4d3', 'KPK', 'kpk', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kpk');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s23001ude', 'Sekjen KEMENAG', 'sekjen-kemenag', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'sekjen-kemenag');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s0e0a6eb2', 'Penelitian', 'penelitian', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'penelitian');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sdsoahmi0', 'UIN Jakarta', 'uin-jakarta', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-jakarta');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2siqobddmr', 'STAI', 'stai', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'stai');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sxfahhro4', 'Pati', 'pati', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'pati');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sfzwftwiy', 'Hari Guru Nasional', 'hari-guru-nasional', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'hari-guru-nasional');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sfc5uaspd', 'Anugerah Hari Guru Nasional', 'anugerah-hari-guru-nasional', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'anugerah-hari-guru-nasional');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sbp8keboz', 'MCC', 'mcc', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'mcc');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2syptfnfea', 'UIN Jember', 'uin-jember', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-jember');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sh98cg2ya', 'Buku', 'buku', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'buku');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s5onzalsa', 'LPDP', 'lpdp', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'lpdp');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sqkuk1ger', 'implementasi ekoteologi', 'implementasi-ekoteologi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'implementasi-ekoteologi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2skdqtjg53', 'Hari Gunu Nasional', 'hari-gunu-nasional', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'hari-gunu-nasional');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2scjsdolb6', 'Beasiswa Indonesia Bangkit', 'beasiswa-indonesia-bangkit', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'beasiswa-indonesia-bangkit');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sa0np3gin', 'PUSPENMA', 'puspenma', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'puspenma');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s3flcv4ri', 'Monitoring', 'monitoring', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'monitoring');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sy95yorxp', 'Evaluasi', 'evaluasi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'evaluasi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sgo0jzdgg', 'Money', 'money', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'money');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2seh2qg6r3', 'FSH UIN Jakarta', 'fsh-uin-jakarta', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'fsh-uin-jakarta');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sdglwmmdk', 'Lomba Debat', 'lomba-debat', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'lomba-debat');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sx2vsiflq', 'Debat Hukum', 'debat-hukum', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'debat-hukum');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s5hqxrpbn', 'Pesantren', 'pesantren', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'pesantren');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2smfmpeh76', 'Halaqah', 'halaqah', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'halaqah');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sw8cnlb81', 'Modernisasi', 'modernisasi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'modernisasi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sq96i5b4c', 'Direktorat Jenderal Pesantren', 'direktorat-jenderal-pesantren', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'direktorat-jenderal-pesantren');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sy4fdynfr', 'UIN Sunan Kalijaga Yogyakarta', 'uin-sunan-kalijaga-yogyakarta', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-sunan-kalijaga-yogyakarta');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2szzpzjc3e', 'Transformasi Pesantren', 'transformasi-pesantren', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'transformasi-pesantren');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2skouda6iw', 'Mandiri', 'mandiri', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'mandiri');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sawb6oepi', 'Kompetitif', 'kompetitif', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kompetitif');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s7t31922n', 'Wakil Menteri Agama', 'wakil-menteri-agama', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'wakil-menteri-agama');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sjm6j8fl8', 'Ulama', 'ulama', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'ulama');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2swwg1lr7s', 'Transformasi', 'transformasi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'transformasi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2szlcbnmom', 'UIN Maulana Malik Ibrahim Malang', 'uin-maulana-malik-ibrahim-malang', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-maulana-malik-ibrahim-malang');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2si3137rry', 'UIN Imam Bonjol Padang', 'uin-imam-bonjol-padang', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-imam-bonjol-padang');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2svfwqvcwd', 'Ekosistem Pendidikan', 'ekosistem-pendidikan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'ekosistem-pendidikan');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s1ks92icn', 'Prodi Manajemen Pendidikan', 'prodi-manajemen-pendidikan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'prodi-manajemen-pendidikan');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2skjg8bxpj', 'UIN Syarif Hidayatullah Jakarta', 'uin-syarif-hidayatullah-jakarta', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-syarif-hidayatullah-jakarta');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sek88h8tj', 'Temu Tahunan PPMPI', 'temu-tahunan-ppmpi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'temu-tahunan-ppmpi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sqvc98wg9', 'Menteri Agama', 'menteri-agama', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'menteri-agama');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s3e7hl2ss', 'Anugerah Penggerak Nusantara 2025', 'anugerah-penggerak-nusantara-2025', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'anugerah-penggerak-nusantara-2025');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2su30ccsqz', 'Intelektualisasi Santri', 'intelektualisasi-santri', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'intelektualisasi-santri');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2szrgr5xxd', 'UIN Raden Fatah Palembang', 'uin-raden-fatah-palembang', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-raden-fatah-palembang');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sztnchd15', 'Kolaborasi', 'kolaborasi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kolaborasi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sxgc7svoa', 'British Council', 'british-council', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'british-council');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2syz54b3fu', 'Bahasa Inggris', 'bahasa-inggris', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'bahasa-inggris');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s0em0z6cu', 'Majelis', 'majelis', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'majelis');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s80jaww1r', 'Dakwah', 'dakwah', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'dakwah');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sducnq22o', 'Fakultas Dakwah', 'fakultas-dakwah', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'fakultas-dakwah');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s088viwze', 'UIN Datokarama Palu', 'uin-datokarama-palu', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'uin-datokarama-palu');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s3wd3gu9q', 'Haul', 'haul', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'haul');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sov0ret13', 'Moderasi Beragama', 'moderasi-beragama', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'moderasi-beragama');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s9hm3j06f', 'Perguruan Tinggi', 'perguruan-tinggi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'perguruan-tinggi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s029aow1e', 'Nasaruddin Umar', 'nasaruddin-umar', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'nasaruddin-umar');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2scs9eeagc', 'Amien Suyitno', 'amien-suyitno', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'amien-suyitno');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sbjlxpq5k', 'ROHIS', 'rohis', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'rohis');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2snu2d6o33', 'Kemenag', 'kemenag', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kemenag');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sdvc67t1m', 'Pendidikan Profesi Guru', 'pendidikan-profesi-guru', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'pendidikan-profesi-guru');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s1yvkcuza', 'Cirebon', 'cirebon', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'cirebon');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2ss5v6bpwe', 'Prabowo Subianto', 'prabowo-subianto', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'prabowo-subianto');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sl5490dkp', 'MAN Insan Cendekia Serpong', 'man-insan-cendekia-serpong', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'man-insan-cendekia-serpong');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s92dppcfr', 'Komisi VIII DPR RI', 'komisi-viii-dpr-ri', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'komisi-viii-dpr-ri');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s4vbtvgh4', 'OMI 2025', 'omi-2025', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'omi-2025');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2spum0o1ki', 'MRC 2025', 'mrc-2025', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'mrc-2025');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2siphwvsxn', 'Madrasah Robotics Competition', 'madrasah-robotics-competition', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'madrasah-robotics-competition');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2spe7af56b', 'Universitas Islam Internasional Indonesia', 'universitas-islam-internasional-indonesia', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'universitas-islam-internasional-indonesia');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sfxryyfwd', 'Program Studi Teknik Informatika', 'program-studi-teknik-informatika', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'program-studi-teknik-informatika');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s0uat1gx9', 'Fakultas Sains dan Teknologi', 'fakultas-sains-dan-teknologi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'fakultas-sains-dan-teknologi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sr018lai8', 'MAN 3 Bantul', 'man-3-bantul', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'man-3-bantul');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sm3c419s4', 'Puspresnas', 'puspresnas', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'puspresnas');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s4f95u6zx', 'Smesco Exhibition Hall', 'smesco-exhibition-hall', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'smesco-exhibition-hall');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sosv6rmeg', 'Hari Santri Nasional', 'hari-santri-nasional', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'hari-santri-nasional');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sf10c5vtf', 'Beasiswa Santri Berprestasi', 'beasiswa-santri-berprestasi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'beasiswa-santri-berprestasi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sm3mfn2ps', 'Indonesia Emas 2045', 'indonesia-emas-2045', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'indonesia-emas-2045');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s5xrrnczj', 'Asep Saepudin Jahar', 'asep-saepudin-jahar', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'asep-saepudin-jahar');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2swertkguf', 'Pondok Pesantren Al-Khoziny', 'pondok-pesantren-al-khoziny', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'pondok-pesantren-al-khoziny');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sx0abs6wq', 'Program Indonesia Pintar', 'program-indonesia-pintar', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'program-indonesia-pintar');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sjbgzhtxs', 'MADADA', 'madada', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'madada');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sjjao7kxp', 'Akminas', 'akminas', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'akminas');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2ssm0wdgeu', 'Berita Olahraga', 'berita-olahraga', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'berita-olahraga');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sc9sa6s9n', 'Bulutangkis', 'bulutangkis', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'bulutangkis');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sk06gpyuv', 'Balapan', 'balapan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'balapan');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sk65o41wc', 'Sepakbola', 'sepakbola', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'sepakbola');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2slvq5k9p6', 'Rohinya', 'rohinya', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'rohinya');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2su7iieh5b', 'Tag Berita', 'tag-berita', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'tag-berita');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s4ekjunsh', 'Berita Otomotif', 'berita-otomotif', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'berita-otomotif');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s408asjto', 'Mitsubishi', 'mitsubishi', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'mitsubishi');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s7r25y8dv', 'Nissan', 'nissan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'nissan');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2se3gimn5e', 'Daihatsu', 'daihatsu', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'daihatsu');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s79wopp28', 'Gerindra', 'gerindra', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'gerindra');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sdtr17vh8', 'Kejahatan', 'kejahatan', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'kejahatan');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2sggat7lng', 'DKI Jakarta', 'dki-jakarta', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'dki-jakarta');
  INSERT INTO tags (id, name, slug, "createdAt")
  SELECT 'cml2zvw2s8ty9e26b', 'New Zealand', 'new-zealand', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM tags WHERE slug = 'new-zealand');

  -- Posts
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2sk86myn9y', 'Kemenag Pastikan KBM Madrasah di Sumatera Barat Berjalan Pascabanjir', 'kemenag-pastikan-kbm-madrasah-di-sumatera-barat-berjalan-pascabanjir', 'Agam (Kemenag) — Kementerian Agama melalui Direktorat Jenderal Pendidikan Islam memastikan kegiatan belajar mengajar (KBM) Madrasah terdampak bencana di Sumatera Barat tetap berjalan dengan baik pasca banjir.

Kepastian ini disampaikan oleh Direktur Jenderal Pendidikan Islam, Amien Suyitno saat mengunjungi langsung ke MTs Selasar Air dan MTs Tarbiyah Islamiyah, kab. Agam.

Kedua MTs tersebut terdampak cukup berat dan MTs Selasar Air hanyut tak tersisa. Saat ini proses KBM dilaksanakan di area Masjid.

Direktur Jenderal Pendidikan Islam Kemenag Amien Suyitno menegaskan, keberlangsungan proses pembelajaran menjadi prioritas utama pemerintah, terutama di satuan pendidikan yang terdampak bencana alam.

“Bantuan yang disalurkan Kemenag difokuskan untuk pemulihan sarana prasarana agar madrasah dapat segera beroperasi normal dan peserta didik tidak kehilangan hak belajarnya,” ujar Amien Suyitno, Selasa (6/1/2026).

Kemenag telah menyalurkan bantuan penanganan dampak bencana banjir pendidikan sebesar Rp6,4 miliar untuk 64 madrasah dan RA di Sumatera Barat. Setiap lembaga penerima memperoleh Rp100 juta, yang digunakan untuk rehabilitasi ringan, pengadaan sarana pendukung pembelajaran, serta pemulihan lingkungan belajar.

Rincian bantuan tersebut meliputi 22 Madrasah Negeridengan total bantuan Rp2,2 miliar; 29 Madrasah Swasta dengan total bantuan Rp2,9 miliar; serta 13 RA dengan total bantuan Rp1,3 miliar.

Di MTs Selasar Air dan MTs Tarbiyah Islamiyah, bantuan tersebut dimanfaatkan untuk menyiapkan kelancaran proses belajar mengajar dengan baik. Dengan langkah cepat ini, madrasah mulai kembali melaksanakan kegiatan belajar mengajar.

Amien Suyitno menambahkan, Kemenag terus memperkuat sistem respons cepat kebencanaan di sektor pendidikan Islam, terutama di wilayah yang memiliki kerentanan tinggi terhadap bencana hidrometeorologi.

“Madrasah harus menjadi ruang belajar yang tangguh menghadapi bencana. Negara hadir tidak hanya saat darurat, tetapi juga memastikan pemulihan berjalan cepat dan tepat sasaran,” tegasnya.

Lebih lanjut, Dirjen Pendis juga menyampaikan terima kasih kepada masyarakat sekitar, wali murid, dan pihak terkait yang secara gotong royong membantu madrasah untuk bangkit kembali.

​"Semangat gotong royong inilah yang mempercepat pemulihan. Kami berkomitmen untuk terus mendukung agar fasilitas yang rusak segera diperbaiki melalui skema bantuan darurat maupun anggaran sarana prasarana," pungkasnya.

​Hadir mendampingi dalam kunjungan ini, Mustafa - Kepala Kantor Wilayah Kemenag Sumatera Barat, Thomas Febria - Kepala Kantor Kemenag Kab. Agam, Abdullah Hanif - Kabag Umum Pendis, serta jajaran pimpinan madrasah setempat.', 'Agam (Kemenag) — Kementerian Agama melalui Direktorat Jenderal Pendidikan Islam memastikan kegiatan belajar mengajar (KBM) Madrasah terdampak bencana di Sumatera Barat tetap berjalan dengan baik...', 'https://kilasindonesia.com/wp-content/uploads/2026/01/6.jpeg', admin_user_id, 'PUBLISHED', 3704, '2026-01-07T13:34:31.000Z', '2026-01-07T13:34:31.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-pastikan-kbm-madrasah-di-sumatera-barat-berjalan-pascabanjir');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2scnm9rtdy', 'Kajari Depok Kunjungi MUI Jalin Sinergitas Perkuat Kerjasama', 'kajari-depok-kunjungi-mui-jalin-sinergitas-perkuat-kerjasama', 'Depok - Jajaran Pimpinan Kejaksaan Negeri (Kejari) Kota Depok mengunjungi kantor Majelis Ulama Indonesia (MUI) Kota Depok di Pancoran Mas, Senin, 05/01/26.

Dalam kesempatan tersebut Kepala Kejari Depok Dr. Arif Budiman, S.H.,M.H. disambut Ketua MUI Kota Depok KH. Syihabuddin Ahmad, didampingi Sekretaris Umum MUI KH. Ahmad Fihri, KH. Achmad Solechan, Bendahara MUI KH. Samwari, Ust. Kostia dan Ust. Aan Humaidi.

Meski silaturahmi mendadak, namun nampak suasana keakraban dan penuh kekeluargaan. “Agenda kali adalah Sidak (Silaturahmi Dadakan) ke MUI DepoK. Ini adalah pertama kali datang ke MUI Depok, apalagi kita baru di Kejari Depok,”ujarnya di kantor MUI Depok.

Menurutnya, kedatangannya ke MUI dalam rangka silaturahmi dan memperkenalkan diri. Pihaknya juga berharap agar bisa saling kerjasama antara Kejari Depok dan MUI Depok, salah satunya dalam mendukung penegakan hukum di Kota Depok agar memberikan manfaat bagi masyarakat.

“Kami ucapkan terima kasih kepada MUI Kota Depok semoga ke depan bisa saling bekerjasama, berkordinasi dan mendukung. Apalagi, kita ada PAKEM (Pengawasan Aliran Kepercayaan dan Keagamaan Masyarakat) dan lainnya,”terang warga Cinere ini.

Sementara itu, Ketua MUI Kota Depok KH. Syihabuddin Ahmad menyambut baik kehadiran rombongan kepala Kejari kota Depok. Menurutnya, dengan kehadiran Kejari akan memberikan banyak hal kebaikan. “Kami ucapkan terima kasih atas kedatangannya di MUI kota Depok.

Selamat bertugas dan mengabdi semoga bisa menjalankan amanah dengan baik serta bisa saling bersinergi.

Sebelumnya, kita sering datang ke Kejari dan alhamdulillah sekarang kita dikunjungi,”terangnya. Kiyai Syihab menjelaskan bahwa MUI Kota Depok aktif menjalankan tugas dan kegiatan berdasarkan program kerja. Ia menambahkan, setiap hari bersama Pengurus harian MUI Kota Depok mengadakan piket dari Hari Senin sampai Jumat.

“Alhamdulillah, bersama dengan sembilan Komisi MUI Kota Depok aktif dengan kegiatannya. Sebagai informasi, di MUI ini tiap hari kita menerima masyarakat mulai dari masuk Islam, konsultasi agama, waris, dan lainnya,”katanya.

Pada kesempatan tersebut, terlaksana diskusi yang berlangsung dengan dinamis. Rencananya ke depan akan ada kegiatan bersama yang akan dilakukan antara Kejari dan MUI kota Depok.

Pertemuan ini merupakan langkah awal untuk membangun masyarakat kota Depok agar menjadi masyarakat yang sadar dan taat hukum.', 'Depok - Jajaran Pimpinan Kejaksaan Negeri (Kejari) Kota Depok mengunjungi kantor Majelis Ulama Indonesia (MUI) Kota Depok di Pancoran Mas, Senin, 05/01/26. Dalam kesempatan tersebut Kepala Kejari...', 'https://kilasindonesia.com/wp-content/uploads/2026/01/5.jpeg', admin_user_id, 'PUBLISHED', 2224, '2026-01-05T19:56:34.000Z', '2026-01-05T19:56:34.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kajari-depok-kunjungi-mui-jalin-sinergitas-perkuat-kerjasama');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2snt3ny6ns', 'Kemenag Rayakan HAB ke-80 Dengan Sederhana, Dana Difokuskan untuk Korban Bencana', 'kemenag-rayakan-hab-ke-80-dengan-sederhana-dana-difokuskan-untuk-korban-bencana', 'Kementerian Agama Republik Indonesia menggelar Tasyakuran Hari Amal Bakti (HAB) ke-80 Tahun 2026 dengan tema “Umat Rukun dan Sinergi, Indonesia Damai dan Maju”. Acara berlangsung di Auditorium HM Rasjidi, Kantor Kementerian Agama RI, Jakarta, Senin (5/1/2026).

Menteri Agama Nasaruddin Umar menjelaskan bahwa seluruh rangkaian peringatan Hari Amal Bakti ke-80 telah dilaksanakan selama kurang lebih dua bulan dan ditutup dengan tasyakuran sederhana. Kesederhanaan tersebut, menurut Menag, merupakan wujud solidaritas Kementerian Agama terhadap masyarakat yang terdampak bencana di sejumlah wilayah Sumatra.

“Peringatan Hari Amal Bakti tahun ini dilaksanakan secara sederhana. Hal ini merupakan bentuk solidaritas kita terhadap saudara-saudara di Sumatra, khususnya di Aceh, Sumatra Utara, dan Sumatra Barat, yang tengah mengalami musibah. Dana yang tersedia kemudian dikonsentrasikan untuk memberikan bantuan kepada masyarakat yang terdampak,” ujar Menag.

Menag mengungkapkan, terdapat hikmah di balik pelaksanaan HAB ke-80 yang sederhana. Sejumlah program Kementerian Agama yang sempat mengalami penundaan pencairan anggaran memperoleh izin relokasi, sehingga dapat dialokasikan untuk bantuan kemanusiaan di wilayah terdampak bencana.

“Dari situlah kami dapat mengalokasikan bantuan dengan nilai yang cukup signifikan untuk masyarakat di Aceh, Sumatra Utara, dan Sumatra Barat. Ke depan, kita berharap Kementerian Agama akan semakin cerah dan mampu mencerahkan kehidupan masyarakat bangsa,” kata Menag.

Bantuan untuk wilayah Sumatera bersumber dari Kementerian Agama serta sinergi dengan Badan Amil Zakat Nasional (BAZNAS), Badan Wakaf Indonesia (BWI), dan lembaga-lembaga di bawah koordinasi Kementerian Agama, termasuk masjid-masjid dan Masjid Istiqlal.

Kementerian Agama hingga saat ini telah menyalurkan bantuan sekitar Rp66,470 miliar yang bersumber dari APBN. Selain itu, ada juga bantuan Kemenag Peduli yang bersumber dari donasi ASN Kementerian Agama dan masyarakat. Ada juga bantuan dari Baznas, Forum Zakat (FOZ), dan Poroz. Total bantuan yang dialokasikan mencapai sekitar Rp155 miliar.

Menag menjelaskan, penyaluran bantuan dilakukan secara bertahap dan hati-hati dengan mempertimbangkan kondisi di lapangan. Sejumlah wilayah masih tergenang air, kondisi tanah belum sepenuhnya kering, serta terdapat infrastruktur yang sebelumnya terputus akibat bencana.

“Alhamdulillah, saat ini sebagian besar jembatan telah tersambung sehingga renovasi rumah ibadah, madrasah, dan pondok pesantren dapat dilanjutkan sebagai bagian dari tanggung jawab Kementerian Agama,” pungkas Menag.

Target dana bantuan ini dialokasikan untuk pemulihan 1.137 masjid terdampak, 500 madrasah, 357 pesantren, 13 perguruan tinggi keagamaan Islam, bantuan 11.202 guru madrasah, 1.122 tenaga kependidikan, dan 112.964 siswa madrasah.

Adapun sampai saat ini 935 masjid telah dipulihkan, 9.000 mushaf Al-Qur''an telah tersalurkan, 435 madrasah terdampak sudah siap kegiatan belajar-mengajar, serta bantuan-bantuan lain yang telah tersalurkan seperti 5.886 paket sarana pembelajaran (meja, kursi, papan tulis, laptop, dan printer), 6.410 paket alat kebersihan, dan 792 paket peralatan darurat (tenda, genset, pompa air, dan alat semprot).

Menag juga menyampaikan apresiasi kepada Dharma Wanita Persatuan Kemenag yang telah menggelar kegiatan donor darah pada rangkaian HAB ke-80. Kegiatan tersebut berhasil mengumpulkan hampir 300 kantong darah yang akan disalurkan untuk membantu masyarakat, termasuk di wilayah Aceh, Sumatra Utara, dan Sumatra Barat.

“Kegiatan ini sangat membantu, mengingat stok darah di Palang Merah Indonesia dan rumah sakit sering kali menipis, khususnya menjelang dan saat bulan suci Ramadan,” ujar Menag.

Melalui peringatan HAB ke-80 ini, Kementerian Agama menegaskan komitmennya untuk terus menumbuhkan semangat kerja ikhlas beramal di lingkungan aparatur serta menghadirkan manfaat nyata bagi masyarakat, sejalan dengan upaya mewujudkan Indonesia yang damai dan maju.

Dalam arahannya, Menag jug mengajak seluruh jajaran Kementerian Agama untuk mensyukuri perjalanan delapan dekade Kemenag. Menurutnya, usia 80 tahun merupakan fase yang sarat pengalaman, tantangan, dan prestasi, namun sekaligus menjadi pengingat agar tidak larut dalam kebanggaan.

“Capaian-capaian Kementerian Agama, termasuk indeks kerukunan umat beragama yang tertinggi sejak Republik Indonesia berdiri, patut kita syukuri. Namun, setiap capaian adalah amanah yang harus terus dijaga dan ditingkatkan,” tegasnya.

Terkait tema HAB ke-80, Menag menekankan bahwa persatuan dan kerukunan umat beragama harus diarahkan pada terwujudnya Indonesia yang damai dan maju. Sinergi lintas sektor, mulai dari pemerintah pusat dan daerah, kementerian dan lembaga, hingga masyarakat dan sektor swasta, menjadi kunci dalam menghadapi tantangan bangsa ke depan.

Tasyakuran HAB ke-80 dihadiri Menteri Agama Nasaruddin Umar, Wakil Menteri Agama Romo Muhammad Syafi’i, Wakil Menteri Agama periode 2019–2024 Zainut Tauhid Sa’adi, Sekretaris Jenderal Kemenag Kamaruddin Amin, Penasehat Dharma Wanita Persatuan (DWP) Kemenag Helmi Nasaruddin Umar, para staf khusus, staf ahli, tenaga ahli, pejabat eselon I dan II, serta seluruh jajaran pegawai Kementerian Agama. Sejumlah tokoh lintas agama turut hadir dan menambah kekhidmatan acara.', 'Kementerian Agama Republik Indonesia menggelar Tasyakuran Hari Amal Bakti (HAB) ke-80 Tahun 2026 dengan tema “Umat Rukun dan Sinergi, Indonesia Damai dan Maju”. Acara berlangsung di Auditorium HM...', 'https://kilasindonesia.com/wp-content/uploads/2026/01/4.jpeg', admin_user_id, 'PUBLISHED', 4307, '2026-01-05T19:38:44.000Z', '2026-01-05T19:38:44.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-rayakan-hab-ke-80-dengan-sederhana-dana-difokuskan-untuk-korban-bencana');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2s87whvyjp', 'Pengisian PDSS SPAN-PTKIN 2026 Resmi Dibuka, Sekolah Diminta Pastikan Keakuratan Data Siswa', 'pengisian-pdss-span-ptkin-2026-resmi-dibuka-sekolah-diminta-pastikan-keakuratan-data-siswa', 'Jakarta – Panitia Nasional Penerimaan Mahasiswa Baru Perguruan Tinggi Keagamaan Islam Negeri (PMB PTKIN) Tahun 2026 secara resmi membuka tahapan pengisian Pangkalan Data Sekolah dan Siswa (PDSS). Tahapan ini merupakan langkah awal yang sangat krusial bagi satuan pendidikan dalam mendaftarkan siswa-siswi terbaiknya melalui jalur Seleksi Prestasi Akademik Nasional (SPAN-PTKIN) 2026.

SPAN-PTKIN merupakan pola seleksi nasional berbasis prestasi akademik tanpa ujian tulis yang diikuti oleh seluruh Universitas Islam Negeri (UIN), Institut Agama Islam Negeri (IAIN), dan Sekolah Tinggi Agama Islam Negeri (STAIN) di seluruh Indonesia.

Seluruh proses pengisian PDSS dilaksanakan secara daring melalui laman resmi
https://span.ptkin.ac.id.

Ketua PMB PTKIN 2026, Prof. Dr. Abd. Aziz, menegaskan pentingnya ketelitian dan ketepatan waktu dalam proses pengisian PDSS oleh pihak sekolah.

“Kami mengimbau kepada seluruh Kepala Madrasah, Kepala Sekolah, serta operator agar tidak menunda pengisian PDSS hingga mendekati batas akhir. Validitas data prestasi akademik siswa merupakan faktor utama dalam proses seleksi SPAN-PTKIN.

Oleh karena itu, nilai rapor dan data prestasi pendukung harus diinput secara jujur, lengkap, dan akurat agar tidak merugikan hak siswa di kemudian hari,” ujarnya.

Sementara itu, Direktur Jenderal Pendidikan Islam Kementerian Agama Republik Indonesia,
Prof. Dr. Amien Suyitno, menyampaikan bahwa sistem PDSS SPAN-PTKIN 2026 telah disempurnakan untuk meningkatkan kualitas layanan dan aksesibilitas.

“SPAN-PTKIN 2026 merupakan wujud komitmen Kementerian Agama dalam menyediakan akses pendidikan tinggi keagamaan Islam yang berkualitas, inklusif, dan berkeadilan. Sistem PDSS tahun ini telah dioptimalkan untuk meminimalkan kendala teknis. Pendidikan Islam harus menjadi garda terdepan dalam mencetak generasi unggul, dan hal tersebut dimulai dari proses seleksi yang transparan serta akuntabel,” jelasnya.

Jadwal Penting SPAN-PTKIN 2026
1. Pendaftaran PDSS: 05 Januari – 07 Februari 2026
2. Pengisian, Verifikasi, dan Finalisasi PDSS: 05 Januari – 09 Februari 2026

Pengisian PDSS dilakukan sepenuhnya oleh satuan pendidikan, meliputi MA/MAK, SMA, SMK, PDF, PKPPS, Satuan Pendidikan Muadalah Mu’allimin, Satuan Pendidikan Muadalah Salafiyah, serta satuan pendidikan sederajat yang memiliki Nomor Pokok Sekolah Nasional (NPSN).

Satuan pendidikan wajib mendaftarkan sekolah serta menginput data rapor siswa yang akan mengikuti jalur Seleksi Prestasi Akademik Nasional (SPAN) PTKIN 2026.

<strong>Himbauan Bagi Siswa Kelas XII</strong>

Para siswa kelas XII diimbau untuk aktif berkoordinasi dan berkonsultasi dengan pihak sekolah guna memastikan telah didaftarkan serta data PDSS-nya diinput secara benar dan tepat waktu.

Ketentuan Umum Pendaftaran dan Pengisian PDSS
1. Satuan pendidikan memiliki NPSN dan Kode Registrasi Sekolah (tertera pada akun Dapodik atau EMIS).
2. Kepala Satuan Pendidikan memiliki nomor WhatsApp dan alamat email aktif yang dapat dihubungi.
3. Satuan pendidikan melakukan registrasi melalui laman https://pdss.ptkin.ac.id.
4. Satuan pendidikan berbentuk MA/MAK/SMA/SMK disarankan menggunakan aplikasi E-Rapor untuk mengunggah nilai rapor siswa.
5. Nilai rapor yang diunggah mencakup: a. Kelas X Semester 1 dan 2, b. Kelas XI Semester 1 dan 2 dan c. Kelas XII Semester 1;
6. Satuan pendidikan wajib mengunggah Kriteria Ketuntasan Minimal (KKM) untuk semester yang ditentukan.
7. Pendaftaran PDSS dinyatakan selesai setelah satuan pendidikan melakukan finalisasi PDSS.
8. Satuan pendidikan wajib memiliki dan menginput nilai mata pelajaran sesuai ketentuan peraturan yang berlaku.

Petunjuk teknis pendaftaran dan pengisian PDSS dapat diakses melalui laman
https://pdss.ptkin.ac.id atau diunduh melalui tautan https://s.id/juknispdss202.

<strong>Layanan Bantuan
</strong>Apabila mengalami kendala dalam proses pendaftaran atau pengisian PDSS, satuan pendidikan dapat menghubungi:
1. Email: info@ptkin.ac.id
2. Website: https://span.ptkin.ac.id
3. WhatsApp: 0815-7890-1030 (Chat), 0857-6872-3600 (Call).', 'Jakarta – Panitia Nasional Penerimaan Mahasiswa Baru Perguruan Tinggi Keagamaan Islam Negeri (PMB PTKIN) Tahun 2026 secara resmi membuka tahapan pengisian Pangkalan Data Sekolah dan Siswa (PDSS)....', 'https://kilasindonesia.com/wp-content/uploads/2026/01/3.jpeg', admin_user_id, 'PUBLISHED', 4505, '2026-01-05T08:37:31.000Z', '2026-01-05T08:37:31.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'pengisian-pdss-span-ptkin-2026-resmi-dibuka-sekolah-diminta-pastikan-keakuratan-data-siswa');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2s2rs93337', 'Kemenag Tegaskan Pendidikan Islam Harus Jawab Krisis Global', 'kemenag-tegaskan-pendidikan-islam-harus-jawab-krisis-global', 'Jakarta — Menteri Agama RI Nasaruddin Umar bersama Menteri Koordinator Pembangunan Manusia dan Kebudayaan (Menko PMK) Pratikno menegaskan bahwa pendidikan Islam harus bertransformasi agar mampu menjawab krisis global yang ditandai perubahan cepat, ketidakpastian, hingga tantangan etika teknologi.

Penegasan tersebut disampaikan dalam kegiatan Review and Design on Islamic Education Direktorat Jenderal Pendidikan Islam Tahun 2025 yang digelar Kementerian Agama, dihadiri pimpinan kementerian/lembaga, rektor UIN, mitra internasional, serta pemangku kepentingan pendidikan Islam pada Selasa (30/12/2025).

“Umat seperti apa yang lahir di masa depan sangat ditentukan oleh kurikulum hari ini. Kurikulum adalah penentu arah peradaban,” kata Menag Nasaruddin Umar.

Menag menekankan pentingnya kurikulum berbasis cinta dan ekoteologi sebagai fondasi pendidikan Islam masa depan. Menurutnya, kurikulum harus mendorong pergeseran dari formalitas ke substansi, dari cara pandang antroposentris ke kesadaran ekologis, serta dari keberagamaan yang kaku menuju keberagamaan yang membebaskan.

“Agama tidak boleh menjadi penjara kreativitas. Agama adalah kompas moral yang membimbing manusia agar kreatif, beradab, dan bertanggung jawab,” ujarnya.

Menko PMK Pratikno menilai dunia saat ini berada dalam era VUCA—volatility, uncertainty, complexity, dan ambiguity—yang diperparah oleh disinformasi, kecerdasan buatan, dan manipulasi teknologi seperti deep fake.

Ia mengingatkan bahwa kejayaan Islam klasik lahir dari visi jangka panjang yang mengintegrasikan ilmu pengetahuan dan nilai spiritual. “Ilmuwan Muslim tidak hanya menerjemahkan ilmu, tetapi menciptakan pengetahuan baru. Kuncinya integrasi sains dan etika,” kata Pratikno.

Menurutnya, Islam kini berada di persimpangan: menjadi solusi moral global atau ditinggalkan karena dianggap tidak relevan. “Di sinilah pendidikan Islam dan UIN harus tampil sebagai pusat etika teknologi berbasis nilai Islam,” tegasnya.

Pratikno menyoroti tantangan etika teknologi modern, mulai dari bias algoritma AI hingga surveillance capitalism. Ia mendorong penguatan kurikulum STREAM Plus—Science, Technology, Religion, Engineering, Arts, Mathematics, ditambah Sport—untuk membangun generasi yang sehat, berkarakter, dan kompetitif.

“Teknologi harus melayani manusia, bukan sebaliknya. Inovasi harus berpihak pada keadilan dan martabat manusia,” ujarnya.

Direktur Jenderal Pendidikan Islam Amien Suyitno menjelaskan bahwa R&amp;D dalam forum ini berarti Review and Design, bukan Research and Development. Kegiatan ini, kata dia, menjadi proses refleksi strategis untuk mengevaluasi capaian dan merancang masa depan pendidikan Islam.

“Tiga agenda utama kita adalah mini-tour pendidikan Islam masa depan, kajian future studies, dan peluncuran Peta Jalan Pendidikan Islam,” jelasnya.

Ia menegaskan bahwa pendidikan Islam harus melahirkan insan unggul secara akademik sekaligus memiliki kepekaan sosial dan karakter kuat.

Melalui forum ini, Kementerian Agama menegaskan arah pendidikan Islam yang terintegrasi antara ilmu dan nilai, profesionalisme dan etika. Targetnya, lulusan pendidikan Islam mampu berperan sebagai insinyur AI yang humanis, dokter beretika, hingga pemimpin teknologi yang bertanggung jawab.

“Kita ingin pendidikan Islam menjadi motor kebangkitan peradaban Islam abad ke-21,” pungkas Menag.', 'Jakarta — Menteri Agama RI Nasaruddin Umar bersama Menteri Koordinator Pembangunan Manusia dan Kebudayaan (Menko PMK) Pratikno menegaskan bahwa pendidikan Islam harus bertransformasi agar mampu...', 'https://kilasindonesia.com/wp-content/uploads/2026/01/2.jpeg', admin_user_id, 'PUBLISHED', 937, '2025-12-31T14:30:03.000Z', '2025-12-31T14:30:03.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-tegaskan-pendidikan-islam-harus-jawab-krisis-global');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2sfnwyu7t8', 'Kinerja Komunikasi Direktorat PAI Menguat, Publik Apresiasi Program Pendidikan Agama Islam', 'kinerja-komunikasi-direktorat-pai-menguat-publik-apresiasi-program-pendidikan-agama-islam', 'Jakarta — Kinerja komunikasi publik Direktorat Pendidikan Agama Islam (PAI), Direktorat Jenderal Pendidikan Islam, Kementerian Agama, menunjukkan tren yang semakin menguat sepanjang periode 23 Desember 2024 hingga 23 Desember 2025. Hal ini tercermin dari tingginya eksposur media, luasnya jangkauan informasi, serta dominasi sentimen positif dalam percakapan publik di media daring dan media sosial.

Berdasarkan hasil pemantauan media (media monitoring) dan analisis percakapan digital (social listening), Direktorat PAI tercatat memperoleh 229 penyebutan di berbagai kanal digital. Penyebutan tersebut berasal dari media daring nasional dan lokal, serta berbagai platform media sosial seperti Facebook, Instagram, YouTube, dan TikTok. Dari total tersebut, jangkauan media sosial mencapai sekitar 2,2 juta akun unik, dengan tingkat keterlibatan publik atau engagement sekitar 9.000 interaksi.

Direktur Jenderal Pendidikan Islam, Amien Suyitno, menilai capaian tersebut menunjukkan efektivitas komunikasi kebijakan pendidikan Islam yang semakin baik dan terarah.

“Data ini memperlihatkan bahwa kebijakan dan program pendidikan Islam semakin dikenal, dipahami, dan mendapat perhatian luas dari masyarakat. Ini menjadi indikator penting bahwa upaya kami dalam membangun komunikasi publik yang terbuka dan partisipatif berjalan dengan baik,” ujar Amien Suyitno di Jakarta (23/12)

Menurut Dirjen Suyitno, komunikasi publik bukan sekadar penyampaian informasi, tetapi juga bagian dari tanggung jawab pemerintah dalam membangun kepercayaan dan memastikan kebijakan berdampak nyata bagi masyarakat.

“Kami menempatkan komunikasi sebagai instrumen strategis untuk menjembatani kebijakan dengan kebutuhan publik. Informasi harus sampai secara utuh, tidak terpotong, dan dapat dipertanggungjawabkan,” tegasnya.

Hasil analisis sentimen menunjukkan bahwa lebih dari 80 persen percakapan publik bernada positif, sementara sentimen negatif berada pada kisaran yang sangat kecil dan bersifat insidental. Sentimen positif tersebut banyak berkaitan dengan program strategis Direktorat PAI, antara lain Pendidikan Profesi Guru (PPG) PAI, PAI Fair 2025, penguatan literasi dan asesmen keagamaan, serta berbagai program peningkatan mutu madrasah dan pendidikan tinggi keagamaan Islam.

Analisis emosi publik juga memperlihatkan dominasi emosi apresiasi dan optimisme, tanpa adanya indikasi emosi negatif yang bersifat masif, seperti ketakutan atau resistensi. Hal ini menandakan stabilitas reputasi Direktorat PAI di ruang publik.

Direktur Pendidikan Agama Islam, M. Munir, menyampaikan bahwa capaian positif tersebut tidak terlepas dari konsistensi Direktorat PAI dalam mengomunikasikan kebijakan dan program secara berkelanjutan.

“Kami berupaya memastikan setiap kebijakan dan program Direktorat PAI disampaikan secara jelas, terbuka, dan relevan dengan kebutuhan pemangku kepentingan, khususnya guru, peserta didik, dan satuan pendidikan,” kata Munir.

Ia menjelaskan bahwa media sosial kini menjadi kanal strategis dalam membangun kedekatan dengan publik, terutama generasi muda dan pendidik yang aktif di ruang digital.

“Platform seperti Instagram dan YouTube terbukti efektif dalam memperluas jangkauan dan meningkatkan keterlibatan publik. Karena itu, kami terus mengembangkan konten visual dan video yang informatif, edukatif, dan humanis,” lanjutnya.

Munir menambahkan, Direktorat PAI juga terus memperkuat narasi kebijakan agar isu-isu teknis dapat dipahami dengan lebih sederhana oleh masyarakat luas, tanpa mengurangi substansi kebijakan itu sendiri.

Secara geografis, mayoritas percakapan publik berasal dari wilayah Indonesia dengan dominasi penggunaan Bahasa Indonesia. Hal ini menunjukkan bahwa komunikasi Direktorat PAI telah menjangkau audiens utama secara tepat sasaran, yakni pendidik, peserta didik, pengelola satuan pendidikan keagamaan, serta para pemangku kepentingan pendidikan Islam di tingkat nasional.

Kementerian Agama menegaskan komitmennya untuk terus meningkatkan kualitas komunikasi publik yang transparan, responsif, dan berorientasi pada pelayanan. Penguatan komunikasi ini diharapkan dapat mendukung keberhasilan program-program pendidikan agama Islam sekaligus memperkokoh kepercayaan masyarakat terhadap kebijakan pemerintah di bidang pendidikan keagamaan.', 'Jakarta — Kinerja komunikasi publik Direktorat Pendidikan Agama Islam (PAI), Direktorat Jenderal Pendidikan Islam, Kementerian Agama, menunjukkan tren yang semakin menguat sepanjang periode 23...', 'https://kilasindonesia.com/wp-content/uploads/2026/01/kinerja-kemenag.jpeg', admin_user_id, 'PUBLISHED', 5354, '2025-12-30T14:08:08.000Z', '2025-12-30T14:08:08.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kinerja-komunikasi-direktorat-pai-menguat-publik-apresiasi-program-pendidikan-agama-islam');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tfxuitj3a', 'Direktorat PAI Teguhkan Pendidikan Agama Islam sebagai Investasi Peradaban Bangsa Sepanjang 2025', 'direktorat-pai-teguhkan-pendidikan-agama-islam-sebagai-investasi-peradaban-bangsa-sepanjang-2025', 'Jakarta — Sepanjang tahun 2025, Direktorat Pendidikan Agama Islam (PAI) Kementerian Agama RI mengukuhkan peran pendidikan agama Islam sebagai bagian integral dari agenda pembangunan nasional.

Seluruh capaian dan kebijakan strategis Direktorat PAI dirancang selaras dengan Asta Cita Presiden Prabowo Subianto dalam penguatan karakter bangsa serta Asta Protas Menteri Agama yang menempatkan pendidikan agama sebagai fondasi moderasi beragama, ketahanan sosial, dan moral publik Indonesia.

Dalam kerangka tersebut, pendidikan agama Islam tidak diposisikan semata sebagai pelengkap kurikulum, melainkan sebagai investasi peradaban yang menentukan arah pembentukan karakter, etika publik, dan daya tahan sosial bangsa di tengah tantangan global dan disrupsi nilai.

Berdasarkan data nasional hingga akhir 2025, jumlah Guru Pendidikan Agama Islam (PAI) tercatat sebanyak 262.971 orang yang melayani 41.883.439 siswa Muslim pada 317.520 sekolah umum di seluruh Indonesia. Rasio ini mencerminkan besarnya mandat strategis guru PAI sebagai penjaga nilai keagamaan, etika sosial, dan moderasi beragama dalam ekosistem pendidikan nasional yang semakin kompleks.

Dalam rangka memperkuat profesionalisme pendidik, Direktorat PAI terus mengakselerasi pelaksanaan Pendidikan Profesi Guru (PPG) sebagai instrumen utama peningkatan mutu dan sertifikasi. Hingga 2025, 90,2 persen Guru PAI telah bersertifikat pendidik, sementara 9,8 persen atau 25.880 guru lainnya menjadi prioritas kebijakan lanjutan melalui skema PPG prajabatan dan afirmasi peningkatan kualifikasi pada tahun berikutnya.

Seiring dengan peningkatan kompetensi, negara juga memastikan keberlanjutan kesejahteraan guru PAI melalui pembayaran Tunjangan Profesi Guru (TPG) bagi guru yang telah memenuhi persyaratan sertifikasi. Kebijakan ini diposisikan sebagai bentuk kehadiran negara dalam menjaga kesinambungan peran guru PAI sebagai aktor utama pembentukan karakter peserta didik.

Direktur Jenderal Pendidikan Islam Kementerian Agama RI, Amin Suyitno, menegaskan bahwa capaian sepanjang 2025 merupakan hasil perubahan paradigma kebijakan pendidikan agama Islam—dari pendekatan administratif menuju pendekatan strategis yang berorientasi dampak jangka panjang.

“Sepanjang tahun 2025, Direktorat Pendidikan Agama Islam tidak sekadar mengelola program, tetapi membangun fondasi jangka panjang pendidikan agama Islam sebagai penyangga karakter bangsa. Peningkatan kompetensi guru, afirmasi kesejahteraan, serta penguatan literasi keagamaan merupakan ikhtiar sistemik agar pendidikan agama tidak berhenti pada hafalan dan simbol, tetapi membentuk cara berpikir, kepekaan sosial, dan etika publik,” ujar Amin Suyitno.

Ia menegaskan bahwa gur PAI harus ditempatkan sebagai subjek utama perubahan dalam pembangunan peradaban bangsa.

“Guru PAI adalah aktor strategis peradaban. Karena itu, kehadiran negara tidak cukup melalui regulasi, tetapi harus diwujudkan melalui afirmasi nyata—peningkatan kompetensi, kepastian kesejahteraan, dan ekosistem pendukung yang sehat. Pendidikan agama Islam harus melahirkan religiositas yang matang, moderasi yang berakar, dan keberagamaan yang memberi solusi atas persoalan sosial,” tegasnya.

Amin Suyitno juga menekankan bahwa arah kebijakan PAI ke depan akan semakin berbasis data, asesmen, dan akuntabilitas publik.

“Asesmen literasi beragama, indeks pendidikan agama, dan pemetaan kompetensi guru menjadi pijakan agar setiap kebijakan terukur dan berdampak. Pendidikan agama Islam tidak boleh berjalan dalam ruang asumsi, tetapi harus berada dalam ruang data dan tanggung jawab publik,” imbuhnya.

Pada aspek penguatan literasi keagamaan, Direktorat PAI melaksanakan Gerakan Bebas Buta Huruf Al-Qur’an di Sekolah, yang diawali dengan Asesmen Tuntas Baca Al-Qur’an (TBQ) bagi Guru PAI di enam provinsi. Program ini dilaksanakan dengan penjaminan mutu oleh Universitas PTIQ serta memanfaatkan platform digital CintaQu, sebagai respons atas rendahnya kemampuan baca Al-Qur’an yang selama ini belum terpetakan secara objektif.

Selain itu, Direktorat PAI juga melaksanakan Asesmen Nasional Literasi Pendidikan Agama di Sekolah terhadap guru dan siswa sekolah dasar. Asesmen ini dirancang dengan pendekatan pedagogis berbasis Taksonomi Bloom yang mengukur aspek kognitif, psikomotorik, dan afektif, serta diposisikan sebagai data dasar komplementer dalam penguatan mutu pembelajaran PAI.

Direktur Pendidikan Agama Islam, M. Munir, menegaskan bahwa seluruh capaian tersebut dirancang dalam satu kerangka kebijakan yang saling terhubung dan berorientasi keberlanjutan.

“Kami tidak merancang program secara terpisah dan seremonial. Seluruh capaian Direktorat PAI sepanjang 2025—mulai dari penguatan kompetensi guru, asesmen literasi beragama, digitalisasi pembelajaran, hingga pembinaan pelajar dan mahasiswa—disusun sebagai satu ekosistem kebijakan yang saling menguatkan,” ujar Munir.

Ia menegaskan bahwa pendidikan agama Islam harus hadir secara nyata dalam kehidupan sehari-hari peserta didik.

“Pendidikan agama Islam tidak boleh berhenti di ruang kelas dan dokumen kebijakan. Karena itu, penguatan literasi Al-Qur’an, pengembangan sekolah moderasi, kantin halal dan sehat, serta kultur keagamaan di sekolah terus kami dorong agar nilai agama benar-benar hidup dalam praktik keseharian,” jelasnya.

Dalam bidang inovasi, Direktorat PAI mencatat capaian digitalisasi layanan pendidikan melalui penyusunan 40 buku PAI berbasis digital dan Artificial Intelligence (Smart PAI) yang dirancang untuk diakses oleh puluhan juta siswa, guru, mahasiswa, dan dosen PAI di sekolah serta perguruan tinggi umum.

Pada ranah penguatan ekosistem keagamaan generasi muda, Direktorat PAI mendorong berbagai program strategis, antara lain pembentukan Duta Wakaf Sekolah dari 34 provinsi, penyelenggaraan Kongres Rohis Nasional I, Pesantren Ramadan Pelajar Nasional, serta Kongres Pergerakan Mahasiswa Moderasi Beragama dan Bela Negara (PMMBN).

Melalui PMMBN dan Rohis, Direktorat PAI secara sistematis menumbuhkembangkan ekosistem moderasi beragama dan religious culture di kalangan pelajar dan mahasiswa sebagai bagian dari pembentukan kesadaran kebangsaan dan keberagamaan yang inklusif.

"Melalui Rohis dan PMMBN, kami memastikan bahwa moderasi beragama tidak berhenti sebagai wacana kebijakan, tetapi tumbuh sebagai kesadaran kolektif dan kultur keagamaan generasi muda. Inilah investasi jangka panjang pendidikan agama Islam bagi bangsa dan negara,” tuturnya.

Dengan tingkat serapan anggaran yang tinggi pada tahun ini, Direktorat PAI optimistis dapat terus memperkuat pendidikan agama Islam sebagai fondasi karakter bangsa, moral publik, dan ketahanan sosial Indonesia di masa depan.', 'Jakarta — Sepanjang tahun 2025, Direktorat Pendidikan Agama Islam (PAI) Kementerian Agama RI mengukuhkan peran pendidikan agama Islam sebagai bagian integral dari agenda pembangunan nasional. Seluruh...', 'https://kilasindonesia.com/wp-content/uploads/2026/01/direktorat-pai.jpeg', admin_user_id, 'PUBLISHED', 5030, '2025-12-30T13:52:59.000Z', '2025-12-30T13:52:59.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'direktorat-pai-teguhkan-pendidikan-agama-islam-sebagai-investasi-peradaban-bangsa-sepanjang-2025');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t1gmhc6ue', 'Kemenag Perkuat Literasi Al-Qur’an di Sekolah, Asesmen Nasional Jadi Fondasi Kebijakan Pendidikan Agama', 'kemenag-perkuat-literasi-al-quran-di-sekolah-asesmen-nasional-jadi-fondasi-kebijakan-pendidikan-agama', 'Jakarta (Kemenag) — Kementerian Agama terus memperkuat komitmen peningkatan literasi Al-Qur’an di lingkungan pendidikan nasional. Komitmen tersebut ditegaskan dalam kegiatan Ekspos Hasil Asesmen Baca Al-Qur’an di Sekolah yang merupakan bagian dari Program Bebas Buta Huruf Al-Qur’an, dilaksanakan oleh Direktorat Pendidikan Agama Islam (PAI) bekerja sama dengan Universitas PTIQ Jakarta.

Menteri Agama Nasaruddin Umar, menegaskan bahwa Al-Qur’an harus dipahami sebagai petunjuk hidup yang dibaca dengan benar, dilafalkan sesuai kaidah, dan dihayati maknanya.

“Tilawah Al-Qur’an adalah bagian dari ibadah. Membaca Al-Qur’an tidak cukup dalam hati, tetapi harus dilafalkan secara benar dan tartil. Karena itu, kemampuan membaca Al-Qur’an menjadi fondasi utama pendidikan agama,” tegas Menag di Jakarta pada Rabu (17/12/2025).

Menag menambahkan bahwa rendahnya kemampuan baca Al-Qur’an dapat berdampak pada kualitas pemahaman dan pengamalan ajaran Islam. Oleh sebab itu, negara perlu hadir melalui kebijakan yang sistematis, terukur, dan berkelanjutan.

Hasil asesmen membaca Al-Qur’an menunjukkan bahwa kemampuan literasi Al-Qur’an peserta didik dan pendidik di sekolah umum masih berada pada kategori sedang dan memerlukan perhatian serius. Sejumlah survei Kementerian Agama dan lembaga terkait mencatat rendahnya tingkat kelulusan baca Al-Qur’an siswa SLTP dan SLTA, dengan hanya sebagian kecil yang mampu membaca sesuai kaidah tajwid secara benar. Kondisi ini juga diperkuat oleh belum tersedianya pemetaan menyeluruh terhadap kemampuan baca Al-Qur’an guru Pendidikan Agama Islam (PAI), padahal peran guru menjadi kunci dalam peningkatan mutu pembelajaran agama di sekolah.

<strong>Asesmen Nasional Berbasis Digital</strong>

Merespons kondisi tersebut, Kementerian Agama melalui Direktorat PAI melaksanakan asesmen kemampuan baca Al-Qur’an berbasis digital sebagai langkah strategis penjaminan mutu pendidikan agama Islam. Program ini bertujuan menstandarkan kemampuan baca Al-Qur’an guru PAI, meningkatkan kompetensi pendidik dan pengawas, serta memperkuat budaya literasi Al-Qur’an di lingkungan pendidikan nasional.

Asesmen dilaksanakan dengan metode wawancara mendalam (deep interview) secara luring dan daring, sehingga memungkinkan penilaian yang komprehensif terhadap ketepatan tajwid, kelancaran, dan kefasihan membaca.

Untuk mendukung pelaksanaan asesmen secara nasional, digunakan aplikasi CintaQu (Cinta Tartil al-Qur’an), sebuah platform digital terstandar yang memudahkan proses asesmen, pendokumentasian hasil, serta pemetaan kemampuan baca Al-Qur’an guru PAI secara sistematis dan terintegrasi.

Direktur Jenderal Pendidikan Islam, Amien Suyitno, menyampaikan bahwa asesmen ini bukan sekadar pengukuran, tetapi menjadi dasar pembinaan berkelanjutan.

“Asesmen ini tidak dimaksudkan untuk memberi label, melainkan untuk memetakan kebutuhan riil guru. Dari sinilah kebijakan pelatihan, penguatan kompetensi, dan pendampingan akan disusun secara lebih tepat sasaran,” ujar Dirjen.

<strong>Metode dan Komponen Penilaian</strong>

Sistem penilaian menggunakan metode pengurangan bobot, di mana setiap peserta pada awalnya memperoleh nilai 100. Kesalahan dalam membaca akan mengurangi nilai dengan skala 0,5 hingga 4 poin, bergantung pada tingkat kesalahan dan dampaknya terhadap makna bacaan.

Empat komponen utama yang menjadi dasar penilaian meliputi Makharij Al-Huruf, Shifat Al-Huruf, Ahkam Al-Huruf dan Ahkam Al-Mad wa Qashr. Hasil asesmen diklasifikasikan ke dalam tiga kategori, yakni Mahir (96–100), Menengah (91–95), dan Pratama (0–90).

Sepanjang tahun 2025, asesmen kemampuan baca Al-Qur’an guru dan pengawas PAI telah dilaksanakan di wilayah Pulau Jawa dengan melibatkan lebih dari 120 ribu peserta dari jenjang PAUD/TK, SD, SMP, hingga SMA/SMK.

Secara rata-rata, hasil asesmen wilayah Jawa menunjukkan:

Kategori Mahir: sekitar 13–15 persen

Kategori Menengah: sekitar 28–30 persen

Kategori Pratama: sekitar 55–60 persen

Deputi Bidang Pembangunan Manusia dan Kebudayaan, Pungkas Bahjurii Ali, menilai temuan ini menunjukkan eratnya hubungan antara kualitas pendidikan dan pembangunan sumber daya manusia.

“Literasi, termasuk literasi Al-Qur’an, sangat menentukan kualitas manusia. Penguatan pendidikan dasar menjadi kunci agar dampaknya terasa pada sektor lain seperti kesehatan dan kesejahteraan,” ujarnya.

Direktur BUMD, BLUD, dan Barang Milik Daerah (BMD) Kementerian Dalam Negeri, H. Yudia Ramli, M.Si, menegaskan pentingnya sinergi lintas sektor dalam menyukseskan program ini.

“Permasalahan literasi tidak bisa diselesaikan secara parsial. Dibutuhkan tata kelola, regulasi, dan pengawasan yang kuat agar program ini berkelanjutan dan akuntabel,” kata Yudia.

Ia menambahkan bahwa dukungan pemerintah daerah sangat penting, terutama dalam pemberian apresiasi dan insentif bagi guru mengaji dan pendidik agama di tingkat akar rumput.

Kementerian Agama menegaskan bahwa hasil asesmen ini akan menjadi baseline nasional dalam penyusunan kebijakan peningkatan kompetensi guru PAI. Ke depan, Kemenag akan menyiapkan program pelatihan berjenjang, penguatan kapasitas guru, serta mendorong peran aktif pemerintah daerah dalam mendukung budaya literasi Al-Qur’an di sekolah.

Asesmen akan terus dilanjutkan secara bertahap ke wilayah lain di luar Jawa, sehingga pemetaan kemampuan baca Al-Qur’an dapat dilakukan secara nasional dan komprehensif, sejalan dengan visi penguatan moderasi beragama dan peningkatan kualitas pendidikan agama Islam di Indonesia.', 'Jakarta (Kemenag) — Kementerian Agama terus memperkuat komitmen peningkatan literasi Al-Qur’an di lingkungan pendidikan nasional. Komitmen tersebut ditegaskan dalam kegiatan Ekspos Hasil Asesmen Baca...', 'https://kilasindonesia.com/wp-content/uploads/2026/01/asasmen-2.jpeg', admin_user_id, 'PUBLISHED', 5397, '2025-12-18T13:28:27.000Z', '2025-12-18T13:28:27.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-perkuat-literasi-al-quran-di-sekolah-asesmen-nasional-jadi-fondasi-kebijakan-pendidikan-agama');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t6rvfc1pu', 'Program TBQ Guru Madrasah Resmi Dibuka, Kemenag Catat 403 Ribu Guru Masuk Basis Data', 'program-tbq-guru-madrasah-resmi-dibuka-kemenag-catat-403-ribu-guru-masuk-basis-data', 'Jakarta — Kementerian Agama RI resmi membuka Program Tuntas Baca Al-Qur’an (TBQ) bagi Guru Madrasah se-Indonesia, Selasa (16/12/2025). Program ini menjadi langkah strategis nasional untuk memperkuat kompetensi dasar guru madrasah dalam membaca Al-Qur’an secara baik dan benar.

Berdasarkan data real-time dashboard nasional TBQ per 16 Desember 2025, tercatat 403.996 guru madrasah telah masuk dalam basis data pendaftaran. Dari jumlah tersebut, 105.901 guru telah terverifikasi, atau setara 53 persen dari kuota nasional sebanyak 200.000 peserta. Hingga saat ini, masih tersedia 94.099 slot kosong yang dapat dimanfaatkan oleh guru madrasah di seluruh Indonesia.

Mewakili Direktur Jenderal Pendidikan Islam, Kepala Subdirektorat Bina GTK MA/MAK, Dr. Imam Bukhori, M.Pd., menegaskan bahwa Program TBQ merupakan fondasi penting dalam upaya peningkatan mutu pendidikan madrasah secara menyeluruh.

“Tujuan akhir dari program ini adalah peserta didik mampu membaca Al-Qur’an dengan baik dan benar. Namun kunci utamanya ada pada guru. Guru yang belum tuntas membaca Al-Qur’an tidak mungkin menuntaskan bacaan murid-muridnya,” tegas Imam.

Ia menjelaskan, asesmen TBQ berfungsi sebagai pemetaan awal untuk mengetahui tingkat kemampuan baca Al-Qur’an guru madrasah. Hasil pemetaan tersebut akan menjadi dasar penyusunan program pembinaan dan pelatihan lanjutan yang lebih terarah dan berkelanjutan.

Sementara itu, Wakil Rektor PTIQ Jakarta, Abdul Rohim, menyampaikan bahwa keterlibatan PTIQ dalam program TBQ merupakan bagian dari khidmat institusi terhadap penguatan Ahlul Qur’an di lingkungan pendidikan.

“Asesmen ini adalah langkah awal yang sangat penting. Dari hasil asesmen inilah dapat dirancang pembinaan dan pelatihan guru madrasah secara lebih tepat sasaran, sehingga dampaknya benar-benar dirasakan hingga ke peserta didik,” ujarnya.

Ketua Panitia sekaligus Kepala Subdit Fasilitasi Profesi Guru Direktorat GTK Madrasah, Dr. Fakhrurozi, M.Si, menjelaskan bahwa Program TBQ tahap awal menyasar 200 ribu guru madrasah dari berbagai jenjang pendidikan.

“Asesmen nasional ini menjadi basis utama. Hasilnya akan dikelompokkan ke dalam beberapa kategori kompetensi, yang selanjutnya menjadi dasar penyusunan program tindak lanjut berupa pelatihan dan pendampingan,” jelas Fakhrurozi.

Pelaksanaan asesmen TBQ dilakukan secara daring melalui mekanisme unggah video, dengan melibatkan ratusan asesor dari PTIQ Jakarta. Skema ini dipilih agar pelaksanaan asesmen dapat menjangkau peserta dalam jumlah besar secara efektif dan efisien, tanpa mengurangi kualitas penilaian.

Program Tuntas Baca Al-Qur’an yang dilaksanakan oleh Direktorat GTK Madrasah diharapkan mampu meningkatkan kompetensi guru dan dapat berlangsung secara merata di seluruh Indonesia. Dengan guru yang memiliki kemampuan baca Al-Qur’an yang baik dan benar, pembelajaran di madrasah diharapkan semakin berkualitas serta berdampak langsung pada penguatan karakter peserta didik.', 'Jakarta — Kementerian Agama RI resmi membuka Program Tuntas Baca Al-Qur’an (TBQ) bagi Guru Madrasah se-Indonesia, Selasa (16/12/2025). Program ini menjadi langkah strategis nasional untuk memperkuat...', 'https://kilasindonesia.com/wp-content/uploads/2026/01/TBQ-Guru-Madrasah.jpeg', admin_user_id, 'PUBLISHED', 2094, '2025-12-17T14:01:26.000Z', '2025-12-17T14:01:26.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'program-tbq-guru-madrasah-resmi-dibuka-kemenag-catat-403-ribu-guru-masuk-basis-data');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tr0wtq83k', '75 Peserta LAPP Siap Berangkat Studi S2 dan S3 ke Luar Negeri', '75-peserta-lapp-siap-berangkat-studi-s2-dan-s3-ke-luar-negeri', '<p style="text-align: left;">Kota Malang — Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (Puspenma), Sekretarat Jenderal, Kementerian Agama RI sukses menggelar Language and Academic Preparation Program (LAPP) selama 2 bulan penuh di 5 Perguruan Tinggi Keagamaan Islam Negeri (PTKIN).</p>
LAPP dimaksudkan sebagai pembekalan kemampuan Bahasa Inggris dan Akademik bagi calon Awardee yang telah dinyatakan lulus seleksi Beasiswa Indonesia Bangkit (BIB) Kemenag, dan selanjutnya berangkat studi lanjut program magister dan doktor ke Luar Negeri.

Kepala Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (Puspenma), Sekretariat Jenderal Kemenag, Ruchman Basori mengatakan melalui LAPP calon awardee dapat memperkuat kemampuan bahasa Inggris sesuai level yang ditetapkan oleh PT tujuan sekaligus memperkuat persiapan akademik serta kultur budaya di Luar Negeri.

Pada tahun 2025, Puspenma Kembali merekrut penerima beasiswa berjumlah 1.029 orang tersebar di perguruan tinggi di Dalam Negeri dan Luar Negeri, mulai program sarjana, magister dan doktor. “LAPP diperuntukan bagi calon awardee yang mengambil studi magister dan doktor ke luar negeri, Australia, Inggris, Amerika, Belanda, Jerman, dan lain sebagainya”, terang Alumni IAIN Walisongo ini.

Kepada 15 peserta di UIN Malang yang hadir secara luring dan 60 peserta di 4 PTP lainnya secara relay, Ruchman Basori berharap agar calon awardee harus bisa berangkat ke kampus tujuan secara lancar, segera mendapatkan LOA kampus di Luar Negeri, dan jangan sampai gagal. “Dua bulan walaupun bukan waktu ideal, tetapi jadikanlah sebagai kawah candradimuka untuk menempa diri dalam hal bahasa, dan kultur serta tradisi akademik bagaimana belajar di negeri orang”, kata Aktivis Mahasiswa 1998 ini.

“Para calon Awardee BIB Luar Negeri yang telah mendapatkan Letter of Acceptance (LOA) dari Kampus di Luar Negeri akan mulai intake kuliah pada Januari 2026. Namun bagi calon awardee yang sedang mencari LOA masih diberikan waktu hingga Akhir Desember 2026 untuk mendapatkan LOA,” imbuh Ruchman.

Penyelenggaraan LAPP berlangsung dari mulai 12 November s.d 12 Desember 2025 di 5 Perguruan Tinggi Penyelenggara (PTP), yaitu Pusat Bahasa pada UIN Alauddin Makasar, UIN Syarif Hidayatullah Jakarta, UIN Walisongo Semarang, UIN Sunan Ampel Surabaya dan UIN Maulana Malik Ibrahim Malang.

Wakil Rektor I UIN Maulana Malik Ibrahim Malang, Basri mengatakan selain kemampuan Bahasa Inggris, para peserta harus memahami kultur dan budaya pergaulan di negara tujuan. Bagaimana bergaul dengan para dosen dengan sopan, pun dalam masalah panggilan kepada para dosen. “Jangan panggil nama langsung dan Mr., tetapi sebaiknya dipanggil professor”, kata Basri kepada para peserta.

Pihaknya lanjut Basri memberikan apresiasi kepada Puspenma yang telah menggelar LAPP ini dan mempercayakan kepada UIN Maulana Malik Ibrahim Malang dan 4 PTP lainnya. “Kami sangat serius menggembleng para Awardee dengan menghadirkan tutor dan narasumber yang memiliki reputasi internasional”, katanya.

Kegiatan penutupan LAPP Puspenma Kemenag RI dihadiri oleh Rektor UIN Walisongo Semarang Nizar Ali, Rektor UIN Bandung Rosikhon Anwar, Rektor UIN Sunan Ampel Surabaya Akh. Muzakki, Rektor UIN Alauddin Makasar Hamdan Juhanis, Wakil Rektor I UIN Malang Basri, Wakil Rektor IV UIN Malang Abdul Hamid, Ketua Pusat Pengembangan Bahasa UIN Malang Mamluatul Hasanah dan sejumlah Ketua Pusat Pengembangan Bahasa di 5 PTP. (Maria Ulfah)', 'Kota Malang — Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (Puspenma), Sekretarat Jenderal, Kementerian Agama RI sukses menggelar Language and Academic Preparation Program (LAPP) selama...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/77c219fa-d6a2-4cc8-b5eb-f877fecf0514.jpeg', admin_user_id, 'PUBLISHED', 2061, '2025-12-17T12:09:36.000Z', '2025-12-17T12:09:36.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = '75-peserta-lapp-siap-berangkat-studi-s2-dan-s3-ke-luar-negeri');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t78qv3cds', 'Kemenag Lakukan Penguatan Mutu Pendidikan MI di Kota Surakarta Melalui Pelatihan Literasi untuk Pengawas dan Kepala Madrasah', 'kemenag-lakukan-penguatan-mutu-pendidikan-mi-di-kota-surakarta-melalui-pelatihan-literasi-untuk-pengawas-dan-kepala-madrasah', 'SURAKARTA – Dalam upaya meningkatkan kualitas pembelajaran dan hasil belajar siswa di Madrasah Ibtidaiyah (MI) se-Surakarta, Kementerian Agama Republik Indonesia telah sukses menyelenggarakan Pelatihan Literasi bagi Kepala dan Pengawas Madrasah Ibtidaiyah. Kegiatan ini dirancang sebagai upaya strategis untuk memperkuat pondasi literasi sebagai kunci utama penguatan mutu pendidikan madrasah. Direktorat GTK Madrasah menghelat kegiatan pelatihan ini di kota Surakarta pada Senin, 15 Desember 2025.

Pelatihan yang berlangsung selama 1 (satu) hari dari pagi hingga sore, diikuti oleh seluruh Pengawas Madrasah dan Kepala MI di wilayah Karesidenan Surakarta sebanyak 55 peserta. Fokus utama materi adalah pemahaman mendalam terhadap konsep literasi dasar dan implementasinya di lingkungan madrasah.

Dalam sambutannya Kasubdit Bina GTK MI dan MTs, Rini menekankan pentingnya peran kepala madrasah dan pengawas sebagai motor penggerak perubahan di satuan pendidikan masing-masing madrasah. Materi yang disampaikan dalam pelatihan ini mencakup berbagai aspek, mulai dari penyusunan program literasi sekolah (GLS), strategi asesmen literasi, hingga pemanfaatan teknologi untuk mendukung pembelajaran literasi digital. Para peserta tampak antusias mengikuti setiap sesi, terutama saat berdiskusi mengenai tantangan dan solusi penerapan literasi di daerah masing-masing, tambahnya.

Kasi Pendidikan Madrasah Kantor Kementerian Agama Kota Surakarta, Agam Rifhamdani, dalam kegiatan tersebut menekankan pentingnya peran sentral pimpinan dan pengawas madrasah. Kepala Madrasah dan Pengawas adalah motor penggerak perubahan. Dengan penguasaan konsep literasi yang kuat, mereka diharapkan mampu menjadi mentor dan fasilitator bagi para guru di madrasah masing-masing, memastikan setiap siswa MI memiliki kompetensi literasi yang memadai, ujar beliau.

Materi yang disampaikan oleh para narasumber, termasuk akademisi dan praktisi pendidikan literasi, meliputi, Strategi Pembelajaran Berbasis Literasi: Teknik mengintegrasikan literasi (membaca, menulis, berbicara, menghitung, dan berpikir kritis) dalam semua mata pelajaran. Pemanfaatan Sumber Belajar: Optimalisasi perpustakaan madrasah dan sumber digital. Penyusunan Program Literasi Madrasah: Merancang kegiatan harian, mingguan, dan tahunan yang berkesinambungan (misalnya, gerakan 15 menit membaca, Supervisi Akademik Berbasis Literasi: Pedoman bagi pengawas untuk melakukan pendampingan yang berfokus pada peningkatan kemampuan literasi guru).

Salah satu peserta pelatihan peningkatan kompetensi literasi memberikan apresiasinya terhadap kegiatan ini. "Pelatihan ini sangat relevan. Kami mendapatkan tools praktis untuk tidak hanya meningkatkan minat baca, tetapi juga meningkatkan daya nalar kritis siswa. Kami berkomitmen untuk segera menindaklanjuti dengan pembentukan Tim Literasi di madrasah," ungkapnya.

Dengan berakhirnya pelatihan ini, Kantor Kementerian Agama Kota Surakarta berharap terjadi peningkatan signifikan dalam ekosistem literasi di seluruh MI di Kota Surakarta. Penguatan kapasitas pemimpin madrasah ini merupakan langkah nyata dalam mewujudkan visi pendidikan madrasah yang unggul dan berdaya saing, khususnya dalam mempersiapkan generasi emas yang cakap literasi dan numerasi.', 'SURAKARTA – Dalam upaya meningkatkan kualitas pembelajaran dan hasil belajar siswa di Madrasah Ibtidaiyah (MI) se-Surakarta, Kementerian Agama Republik Indonesia telah sukses menyelenggarakan...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-15-at-22.11.57.jpeg', admin_user_id, 'PUBLISHED', 2565, '2025-12-16T13:10:48.000Z', '2025-12-16T13:10:48.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-lakukan-penguatan-mutu-pendidikan-mi-di-kota-surakarta-melalui-pelatihan-literasi-untuk-pengawas-dan-kepala-madrasah');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tbh5quqlc', 'Kemenag di Wisuda STIT Muhammadiyah Ngawi, Manfaatkan Beasiswa untuk Lanjut Studi Magister', 'kemenag-di-wisuda-stit-muhammadiyah-ngawi-manfaatkan-beasiswa-untuk-lanjut-studi-magister', 'Ngawi — Kementerian Agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (Puspenma) Sekretariat Jenderal Kementerian Agama RI memberikan kesempatan kepada para Sarjana Ilmu Tarbiyah di Kampus STIT Muhammadiyah Ngawi untuk melanjutkan magister dengan beasiswa.

Harapan itu dikatakan Kepala Puspenma Ruchman Basori, saat memberikan Orasi Ilmiah pada Wisuda Sarjana ke 25, Sekolah Tinggi Ilmu Tarbiyah (STIT) Muhammadiyah Ngawi, pada Sabtu, (13/12/25). “Meningkatkan kualitas diri sangat penting, di tengah persaingan bebas, apalagi bagi sarjana ilmu tarbiyah dan keguruan yang saat ini membludak”, tegas Ruchman.

Dihadapan 70 Wisudawan/i, Doktor Manajemen Kependidikan Universitas Negeri Semarang (UNNES) ini berharap agar para sarjana yang nanti akan terjun ke tengah-tengah masyarakat harus tampil sebagai pribadi yang professional, terampil dan peka terhadap realitas sosial”, katanya.

Ruchman menerangkan, ada dua madzhab tugas lembaga Pendidikan tinggi; pertama, mencetak tenaga kerja; kedua menyiapkan manusia yang siap mengemban beban pembangunan. “Saya menganut madzhab kedua, yaitu tugas STIT Muhammadiyah Ngawi adalah mencetak para sarjana yang mampu mengemban amanah pembangunan dan peka terhadap Masyarakat”, terang Ruchman.

Ditambahkan Ruchman, Indonesia Emas 2045 harus disambut dengan ketersediaan sumber daya manusia (SDM) yang berkualitas. “Kemenag berkolaborasi dengan LPDP memberikan beasiswa S1, S2 dan S3 di Dalam dan Luar Negeri, untuk meningkatkan kualitas alumni PTKI, para guru dan tenaga kependidikan serta ustadz dan kyai muda Pesantren”, terang Aktivis Mahasiswa 1998 ini.

Alumni S1 IAIN Walisongo ini berharap agar para wisudawan/i tidak berkecil hati, kalau berada dalam ketidakberuntungan ekonomi. “Beasiswa Kemenag diperuntukan bagi mereka yang pintar dan cerdas, baik dari kalangan mustadh’afin maupun dari kalangan yang mampu secara ekonomi”, kata Ruchman.

Sebagaimana diberitakan sebelumnya, Kemenag melalui Puspenma telah memberikan beasiswa sejak tahun 2022-2025 dengan skeme dana abadi Pendidikan terhadap kurang lebih 7.850 orang mulai S1-S3 di dalam PT Luar Negeri dan Dalam Negeri.

Prosesi Wisuda Sarjana STIT Muhammadiyah Ngawi berlangsung Khidmah dihadiri oleh sejumlah tokoh di Ngawi, Ketua Pimpinan Daerah Muhammadiyah yang juga Ketua Badan Pembina Harian (BPH) STIT Muhammadiyah Ngawi Suhardi, Asisten I Pemkab Ngawi Didik Purwanto, Wakil Ketua DPRD Kabupaten Ngawi Dr. Gunadi Ash Cidiq, Ketua Baznas Dr. Samsul Hadi, Kasipenmad Kankemenag Ngawi M. Yusuf, Sesepuh Kampus STIT Muhammadiyah Ngawi Dr. Singgih Basuki, MA dan Sejumlah tokoh lainnya.

Ketua STIT Muhammadiyah Ngawi Sumarno, S.Pd.I, M.Pd mengatakan sekolah tinggi ini menjadi kebanggaan Masyarakat Muhammadiyah Ngawi bahkan Masyarakat di Kabupaten Ngawi. “Mahasiswa kami berasal dari berbagai daerah baik Ngawi, Sragen, Magetan, Solo dan daerah lain sekitarnya baik dari masyarakat umum, pondok pesantren juga para guru serta tenaga kependidikan”, katanya.

Kandidat Doktor UIN Raden Mas Said Surakarta ini berterimakasih kepada Kepala Puspenma Kemenag RI yang telah berkenan hadir dan memberikan orasi ilmiah. “Kehadiran Kapuspenma menjadi momentum strategis agar para wisudawan dan wisudawati mengakses layanan beasiswa KIP Kuliah dan Beasiswa Indonesia Bangkit (BIB) Kemenag”, kata Marno, sapaan akrabnya.

Ketua STIT Sumarno dan Ketua Badan Pembina Harian STIT Muhammadiyah Ngawi Suhardi berharap agar Kemenag dapat membantu mempercepat alih status dari Sekolah Tinggi (STIT) menjadi Institut Agama Islam (IAI) yang menjadi cita-cita dari civitas akademika kampus tersebut. (Maria Ulfah)', 'Ngawi — Kementerian Agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (Puspenma) Sekretariat Jenderal Kementerian Agama RI memberikan kesempatan kepada para Sarjana Ilmu...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-15-at-20.44.43.jpeg', admin_user_id, 'PUBLISHED', 4389, '2025-12-14T13:47:41.000Z', '2025-12-14T13:47:41.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-di-wisuda-stit-muhammadiyah-ngawi-manfaatkan-beasiswa-untuk-lanjut-studi-magister');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2th8n489bj', 'Kemenag di FISIP UIN Surabaya, Budaya Mutu Bekal Terbaik Menyambut Indonesia Emas 2045', 'kemenag-di-fisip-uin-surabaya-budaya-mutu-bekal-terbaik-menyambut-indonesia-emas-2045', 'Surabaya — Budaya mutu menjadi bekal terbaik bagi sebuah perguruan tinggi menghadapi era persaingan, menyambut Indonesia Emas 20245. Salah satunya dutentukan dengan penyiapan sumber daya manusia yang berkualitas.

Hal itu dikatakan Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (Puspenma), Sekretariat Jenderal Kementerian Agama Ruchman Basori, pada kegiatan diskusi terbatas dengan Pimpinan Fakultas Ilmu Sosial dan Ilmu Politik (FISIP) UIN Sunan Ampel Surabaya, pada Kamis (11/12/25) di Kampus Gunung Anyar, Surabaya.

Lebih lanjut dikatakan Ruchman, saat ini rasio magister dan doctor di Indonesia masih berkisar 0,53% masih tertinggal dengan Malaysia, Vietnam dan Thailan yang sudah diangka 2,43%. Sementara tertinggal jauh dengan negara-negara seperti USA, Jepang, Korea, New Zaelan, Kanada dan Jerman sudah diangka 9,80%.

Alumni IAIN Walisongo ini menerangkan pelbagai program Puspenma, layanan Beasiswa Indonesia Bangkit, MoRA The Air Funds, PIP pada Pendidikan dasar dan menengah Keagamaan, KIP Kuliah dan investasi Pendidikan lainnya.

“Pendanaan Riset Indonesia Bangkit (MoRA The Air Funds) menjadi tema menarik untuk para dosen, di tengah anggaran riset yang terbatas”, kata Ruchman.

Sebagaimana diketahui, Kememag berkolaborasi dengan Lembaga Pengelola Dana Pendidikan (LPDP) memberian anggaran yang relatif besar untuk riset-riset keagamaan, sosial humaniora, ekonomi dan lingkungan, sains dan teknologi dan kebijakan bidang agama dan pendiidikan. Nilai penelitian berkisar antara 500 juta hingga 2 milyard.

Kegiatan diskusi terbatas, diikuti oleh jajaran Dekanat FISIP UIN Surabaya, mulai dari Dekan, Wakil Dekan, Ketua Jurusan, Sekretaris Jurusan, Kaprodi dan Sekprodi.

Soal Beasiswa Indonesia Bangkit (BIB) juga dipaparkan oleh Ruchman kepada para pemangku kebijakan di fakultas yang cukup bergengsi di UIN Sunan Ampel ini. “Prodi pada FISIP UIN Sunan Ampel dengan akreditasi unggul dapat menjadi destinasi bagi calon awardee BIB karena institusi UIN SA juga sudah unggul”, kata Doktor Manajemen Kependidikan Universitas Negeri Semarang (UNNES) ini.

“Yang kurang mampu secara ekonomi, tetapi berpotensi secara akademik untuk studi maka diberikan KIP Kuliah, sementara bagi yang pintar tidak melihat latar belakang ekonomi dapat mengambil beasiswa”, terang Ruchman.

Sementara itu Dekan FISIP UIN Surabaya Abdul Chalik mengatakan, sengaja kita datangkan Kepala Puspenma, agar kita mendapatkan penjelasan yang cukup tentang pembiayaan pendidikan untuk meningkatkan SDM. “saya berharap para dosen memanfaatkan kesempatan studi lanjut S3 di Dalam dan Luar Negeri, karena disediakan anggaran yang cukup dari Kementerian Agama”, katanya.

“Kita siap berkolaborasi dan mengimplementasikan program-program pembiayaan Pendidikan, khusunya MoRA The Air Funds dan BIB Kemenag”, tegas Khalik.

Forum terbatas itu berlangsung dengan gayeng, antusias dan produktif. FISIP UIN Surabaya, dipimpin oleh kaum muda yang bersemangat, berdedikasi dan memiliki masa depan yang prospektif. (Maria Ulfah)', 'Surabaya — Budaya mutu menjadi bekal terbaik bagi sebuah perguruan tinggi menghadapi era persaingan, menyambut Indonesia Emas 20245. Salah satunya dutentukan dengan penyiapan sumber daya manusia yang...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-15-at-18.53.00.jpeg', admin_user_id, 'PUBLISHED', 1631, '2025-12-12T12:27:40.000Z', '2025-12-12T12:27:40.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-di-fisip-uin-surabaya-budaya-mutu-bekal-terbaik-menyambut-indonesia-emas-2045');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2trvn1180s', 'Kemenag Raih Dua Penghargaan dari KPK di Hari Antikorupsi Sedunia 2025', 'kemenag-raih-dua-penghargaan-dari-kpk-di-hari-antikorupsi-sedunia-2025', 'Kementerian Agama mencatat dua capaian penting pada Peringatan Hari Antikorupsi Sedunia (HAKORDIA) 2025 yang digelar di Kantor Gubernur DIY, Selasa (9/12/2025). Selain meluncurkan Seri Buku Pendidikan Antikorupsi lintas agama hasil kolaborasi dengan KPK, Kemenag juga meraih dua penghargaan nasional atas kontribusinya dalam penguatan integritas di masyarakat.

Penghargaan pertama diberikan kepada Kementerian Agama atas kerja sama penyusunan Buku Keagamaan Antikorupsi yang diinisiasi bersama Direktorat Pembinaan Peran Serta Masyarakat KPK. Kolaborasi ini dinilai berhasil membuka ruang baru pendidikan antikorupsi melalui pendekatan lintas agama.

Penghargaan kedua diraih oleh Forum Penyuluh Antikorupsi (PAKSI) Guru dan Tenaga Kependidikan (GTK) Madrasah Kemenag, yang dinobatkan sebagai Terbaik Kedua Nasional dalam Forum PAKSI–API Berdaya kategori Kementerian/Lembaga. Penghargaan ini diberikan atas kiprah GTK Madrasah dalam penyuluhan integritas dan pendidikan antikorupsi di sektor pendidikan.

Dua penghargaan yang diterima Kemenag pada HAKORDIA 2025 mencerminkan kuatnya komitmen institusi ini dalam membangun ekosistem pendidikan antikorupsi—baik melalui literasi keagamaan maupun penyuluhan di lembaga pendidikan.

Kemenag menegaskan akan terus memperkuat kolaborasi dengan KPK dan berbagai pemangku kepentingan, serta mendorong penerapan nilai integritas dari tingkat pusat hingga daerah.

<strong>Luncurkan Enam Buku Serial Antikorupsi Lintas Agama</strong>

HAKORDIA 2025 juga menjadi momentum Kemenag dan KPK meluncurkan enam buku antikorupsi lintas agama. Peluncuran enam buku antikorupsi lintas agama ini menjadi simbol komitmen Kemenag dan KPK dalam memperkuat pemahaman (logos) dan aksi nyata (ethos) masyarakat terhadap integritas. Setiap buku menggali ajaran agama masing-masing untuk membangun perilaku antikorupsi yang mengakar.

Menag berharap seri buku tersebut dapat menyentuh kesadaran terdalam masyarakat dan menjadi landasan moral untuk hidup tanpa korupsi. Ia menegaskan bahwa korupsi bukan hanya pelanggaran hukum, tetapi ancaman yang merusak sendi-sendi kemanusiaan.

“Pada hakikatnya, semua agama mengajarkan integritas. Korupsi adalah musuh bersama, musuh kemanusiaan,” tegas Menag.

Menag menjelaskan bahwa pemberantasan korupsi harus disampaikan dalam berbagai bahasa—politik, hukum, budaya, dan agama. Di tengah masyarakat Indonesia yang religius, bahasa agama menjadi medium yang paling efektif untuk menanamkan batasan moral dan nilai-nilai kejujuran.

“Dengan bahasa agama, kita membatasi diri dengan konsep pahala dan dosa. Bahasa ini efektif untuk membentuk nilai luhur di masyarakat,” ujarnya.

Judul Buku Pendidikan Antikorupsi Lintas Agama:

1. Jalan Dhamma Jalan Anti Korupsi: Cara Menjadi Buddhis Berintegritas dan Berani Menolak Korupsi
2. Hidup Satya: Berani Menolak Korupsi (Hindu)
3. Integritas &amp; Antikorupsi: Perspektif Islam dalam Pemberantasan Korupsi
4. Integritas dan Iman: Peran Gereja Katolik dalam Pemberantasan Korupsi
5. Peran Gereja dalam Mewujudkan Bangsa Tanpa Korupsi (Kristen)
6. Kebajikan sebagai Landasan Antikorupsi dalam Perspektif Khonghucu

Humas dan Komunikasi Publik', 'Kementerian Agama mencatat dua capaian penting pada Peringatan Hari Antikorupsi Sedunia (HAKORDIA) 2025 yang digelar di Kantor Gubernur DIY, Selasa (9/12/2025). Selain meluncurkan Seri Buku...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-09-at-22.27.581.jpeg', admin_user_id, 'PUBLISHED', 4779, '2025-12-09T15:31:25.000Z', '2025-12-09T15:31:25.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-raih-dua-penghargaan-dari-kpk-di-hari-antikorupsi-sedunia-2025');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t0stuvve6', 'Sekjen Kemenag Harap Luaran Penelitian Harus Berdampak', 'sekjen-kemenag-harap-luaran-penelitian-harus-berdampak', 'Jakarta — Sekretaris Jenderal Kementerian Agama Prof. Phil. Kamaruddin Amin, M.A., Ph.D berharap agar penelitian yang dilakukan dalam program riset Indonesia bangkit (MoRA The Air Funds) berdampak pada masyarakat.

“Riset-riset dengan anggaran ratusan juta bahkan milyaran harus mendatangkan manfaat dan berdampak langsung kepada masyarakat. Dampak social, ekonomi, budaya dan pembangunan”, tegas Kamaruddin Amin saat membuka acara Evaluasi dan Koordinasi Pendanaan Riset Indonesia Bangkit (MoRA The Air Funds), pada Senin (8/12/25) di Jakarta.

Lebih lanjut dikatakan Kamaruddin, anggaran yang besar dari mulai 500 juta hingga 2 milyard harus menghadirkan solusi atas pelbagai problem-problem kemasyarakatan dan kebangsaan. “Kita ingin riset MoRA The Air Funds dikelola secara professional dan dibantu oleh Tim yang expert, sehingga menghasilkan luaran riset yang berdampak”, tegas Kamaruddin.

Kamar sapaan akrab Sekjen berharap agar Diktis dan Puspenma bersinergi dan berkolaborasi, mendesain riset yang bagus. “Puspenma bertanggungjawab untuk pembiayaannya sementara Diktis merancang disain riset secara sistematis”, katanya.

Dihadapan para peserta koordinasi, Kamaruddin Amin mengatakan seleksi proposal harus profesional, ditangani oleh sebuah tim yang expert, sehingga menghasilkan para peneliti yang bernar-benar kualified. "Harus juga di evaluasi penyelenggaraan riset, tahun 2024 bagaimana dampaknya sehingga memudahkan kami untuk mengusulkan tambahan anggaran kepada LPDP", katanya.

Hadir pula Direktur Pendidikan Tinggi Keagamaan Islam (Diktis) Prof. Phil. Sahiron Syamsuddin, M.A., Ph.D, Kepala Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA) Ruchman Basori, Kasubdit Penelitian dan Pengabdian kepada Masyaraat Nur Khafid, Ketua Tim Investasi Pendidikan, Kerjasama dan Riset Hendro Dwi Antoro, para Kasubtim dan juga pegawai pada Direktorat Diktis dan Puspenma.

Kepala Puspenma Ruchman Basori mengatakan bahwa dalam tiga tahun terakhir ini, 2024, 2025 dan 2026 Kementerian Agama mendapatkan anggaran riset sebanyak 50 milyard per tahun. Pada tahun 2027, 2028 dan 2029 insya Alloh akan ada kenaikan sejalan dengan komitmen penanganan yang professional dan banyaknya dosen yang antusias mengajukan proposal riset bergengsi ini.

“Pada tahun 2024 kita telah menyeleksi 362 proposal dan lolos seleksi 47 tim periset dan pada tahun 2025 akan mengambil kurang lebih 90 Tim Periset dengan 90 judul penelitian”, terang Ruchman.

Sementara itu Direktur Diktis Prof. Phil. Sahiron Syamsuddin, M.A., Ph.D berkomitmen menjalin Kerjasama dengan Puspenma untuk melahirkan karya-karya penelitian untuk memperkuat ecotheology, kurikulum berbasis cinta dan pengembangan ekonomi umat.

“Kita akan dorong para periset untuk mengambil tema-tema yang selama ini menjadi konsen Bapak Menteri Agama terutama ecotheology, kurikulum berbasis cinta dan pengembangan ekonomi umat”, kata Sahiron. (Ulfah)', 'Jakarta — Sekretaris Jenderal Kementerian Agama Prof. Phil. Kamaruddin Amin, M.A., Ph.D berharap agar penelitian yang dilakukan dalam program riset Indonesia bangkit (MoRA The Air Funds) berdampak...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-09-at-19.38.07.jpeg', admin_user_id, 'PUBLISHED', 2408, '2025-12-09T15:21:59.000Z', '2025-12-09T15:21:59.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'sekjen-kemenag-harap-luaran-penelitian-harus-berdampak');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t58p6t36a', 'Sukses Optimalkan Unit Bisnis, Kemenag Dorong Kampus BLU Contoh Kemandirian Finansial UIN Jakarta', 'sukses-optimalkan-unit-bisnis-kemenag-dorong-kampus-blu-contoh-kemandirian-finansial-uin-jakarta', 'Tangerang Selatan - Universitas Islam Negeri (UIN) Syarif Hidayatullah Jakarta menggelar Focus Group Discussion (FGD) bertema "Transformasi dan Inovasi Bisnis: Sistem, Strategi, dan Sinergi Menuju Pusat Pengembangan Bisnis yang Unggul dan Mandiri di Adia Suites, Tangerang Selatan, Senin (8/12/2025).

Kegiatan ini mempertemukan para pengelola pusat bisnis Perguruan Tinggi Keagamaan Islam Negeri (PTKIN) se-Indonesia untuk merumuskan strategi kemandirian finansial an percepatan menuju status Perguruan Tinggi Negeri Berbadan Hukum (PTNBH).

Mewakili Menteri Agama, Direktur Pendidikan Tinggi Keagamaan Islam (DIKTIS) Prof. Dr. Phil. Sahiron Syamsudin, M.A menyoroti pentingnya optimalisasi status Badan Layanan Umum (BLU) di Lingkungan PTKIN. Guru Besar UIN Sunan Kalijaga Yogyakarta ini menekankan bahwa fleksibilitas keuangan BLU harus dimanfaatkan untuk pengembangan akademik dan operasional, termasuk menjalankan usaha barang dan jasa penunjang.

"UIN Syarif Hidayatullah Jakarta menjadi contoh nyata dalam optimalisasi unit bisnis," ujar Prof. Sahiron. Ia menyebut PNBP UIN Jakarta kini mencapai sekitar Rp530–560 miliar, di mana 15–30 persen di antaranya berasal dari unit bisnis. Angka ini jauh melampaui rata-rata kontribusi bisnis PTKIN BLU lain yang baru menyumbang 4–6 persen terhadap PNBP.

Lebih lanjut, Kemenag menegaskan komitmen untuk mendorong transformasi PTKIN menuju PTNBH. "UIN Syarif Hidayatullah Jakarta menjadi kandidat terkuat untuk diusulkan sebagai PTNBH berikutnya," tegasnya, disusul oleh UIN Surabaya dan PTKIN lain yang siap tata kelolanya.

Ditempat yang sama, Wakil Rektor II UIN Syarif Hidayatullah Jakarta, Prof. Dr. Imam Subchi, M.A., dalam paparannya menegaskan arah universitas menuju kemandirian finansial yang berdaya saing. Dengan populasi 36 ribu mahasiswa, dosen dan tendik sekitar 2000 orang dan aset-aset strategis seperti RS UIN Syarif Hidayatullah Jakarta Pondok Gede, RS Syarif Hidayatullah Ciputat dan beberapa Klinik serta perhotelan, maka UIN Jakarta memiliki potensi ekonomi kampus yang cukup besar.

Selain itu, kebijakan strategis yang mengarahkan semua pengadaan internal melalui Pusat Pengembangan Bisnis (P2B) telah memberikan lonjakan pendapatan unit tersebut secara signifikan.

"Dengan perputaran keuangan yang potensial, UIN Jakarta siap menjadi universitas yang mandiri, maju, dan berdaya saing tinggi melalui penguatan P2B, restrukturisasi aset, dan percepatan pembentukan PTNBH," tutup Prof. Imam Subchi.

Kepala Pusat Pengembangan Bisnis UIN Jakarta, Prof. Dr. Asep Syarifuddin Hidayat, S.H., M.H., selaku panitia, menyampaikan bahwa FGD ini diikuti oleh 27 dari 39 UIN se-Indonesia, melampaui target yang ditetapkan.

Prof. Asep Syarifuddin menekankan bahwa terbitnya PMA No. 31 Tahun 2021 tentang Pusat Pengembangan Bisnis menandai era baru, di mana P2B diharapkan bertransformasi dari unit struktural menjadi motor penggerak kemandirian universitas dan berkembang menjadi holding company yang profesional. Pihaknya mendorong prinsip kolaborasi, bukan kompetisi, untuk memajukan unit-unit bisnis PTKIN secara nasional.

"Transformasi menuju PTKIN-BH menuntut kesiapan sistem, SDM, regulasi, serta model bisnis yang kuat. FGD ini bertujuan untuk merumuskan arah tata kelola bisnis yang visioner dan membangun sinergi antar-PTKIN," ujarnya.

<strong>Dukungan Luas untuk Berinovasi</strong>

Terpisah, Rektor UIN Syarif Hidayatullah Jakarta, Prof. Asep Saepudin Jahar, M.A., Ph.D., mengungkapkan penguatan Pusat Pengembangan Bisnis sebagai bagian penting dari agenda strategis universitas menuju kemandirian finansial dan kesiapan PTNBH. Ia menyampaikan bahwa P2B kini diposisikan sebagai Unit Pelaksana Teknis (UPT) dengan kewenangan yang lebih luas dalam pengelolaan bisnis universitas.

"Penetapan P2B sebagai UPT adalah langkah struktural yang memberikan ruang gerak lebih besar bagi universitas untuk mengelola usaha dan aset secara profesional,” ujarnya.

Rektor menambahkan, P2B juga diberikan kewenangan merekrut sumber daya manusia profesional dari luar ASN. Menurutnya, langkah ini diperlukan agar unit bisnis universitas memiliki fleksibilitas kompetensi dan kapasitas manajerial dalam operasionalnya.

Selain itu, Rektor Asep Jahar menegaskan komitmen universitas mendorong inovasi dalam pengelolaan bisnis, terutama dalam pemenuhan kebutuhan logistik kampus.

“Kami ingin memastikan P2B bekerja dengan prinsip transparansi dan akuntabilitas, namun tetap diberi ruang berinovasi agar mampu menghasilkan nilai tambah bagi universitas,” imbuhnya.

Menurut Rektor, tiga kebijakan tersebut menjadi fondasi penting dalam memperkuat tata kelola bisnis UIN Jakarta dan mempercepat langkah universitas menuju kemandirian yang berkelanjutan. “Semoga dengan langkah-langkah ini, UIN Jakarta dapat melanjutkan transformasi menuju kampus modern berbasis tata kelola yang sehat, inovatif, dan siap bersaing,” pungkas Rektor.', 'Tangerang Selatan - Universitas Islam Negeri (UIN) Syarif Hidayatullah Jakarta menggelar Focus Group Discussion (FGD) bertema "Transformasi dan Inovasi Bisnis: Sistem, Strategi, dan Sinergi Menuju...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-12-at-16.53.41.jpeg', admin_user_id, 'PUBLISHED', 3121, '2025-12-09T09:56:23.000Z', '2025-12-09T09:56:23.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'sukses-optimalkan-unit-bisnis-kemenag-dorong-kampus-blu-contoh-kemandirian-finansial-uin-jakarta');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tl0sodf9b', 'Stadium General STAI Pati, Kemenag Buka Pendidikan Untuk Semua', 'stadium-general-stai-pati-kemenag-buka-pendidikan-untuk-semua', 'Pati — Layanan pendidikan tinggi pada Kementerian Agama, terbuka untuk semua sebagai implementasi dari education for all, dari berbagai latar belakang sosial, ekonomi dan politik. Karena menjadi mandat undang-undang dan komitmen kementerian.
Pernyataan itu ditegaskan oleh Kepala Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (Puspenma) Sekretariat Jenderal, Kementerian Agama, Ruchman Basori, pada Stadium General sekolah Tinggi Agama Islam Pati (STAIP), pada pada Sabtu (6/12/25).

Lebih lanjut dikatakan oleh Alumni IAIN Walisongo ini bahwa pemerintah telah menyiapkan skema untuk pembiayaan pendidikan untuk semua warga, agar tercipta keadilan sosial. “Yang pinter-pinter dan memenuhi kualifikasi diberikan beasiswa indonesia bangkit, yang kurang mampu secara ekonomi namun berpotensi untuk studi diberikan layanan Kartu Indonesia Pintar Kuliah untuk jenjang pendidikan tinggi dan PIP untuk jenjang Pendidikan Dasar dan Menengah Keagamaan”, kata Ruchman.
Ruchman didaulat menjadi nara sumber stadium general STAIP, yang diberi tajuk: "Biaya Pendidikan dan Keadilan Sosial: Tantangan Pendidikan Untuk Semua". Diikuti oleh kurang lebih 400-san mahasiswa, dosen dan tenaga kependidikan.

Disadari oleh Ruchman, rasio Master-Doktor di Indonesia masih cukup sangat rendah jika dibandingkan Populasi Usia Produktif. Saat ini jumlah Master-Doktor di Indonesia hanya 0,53% dibandingkan Populasi Usia Produktif. Angka tersebut lebih rendah dibandingkan negara tetangga seperti Malaysia, Vietnam, dan Thailand yang memiliki Rasio Master-Doktor di kisaran angka 2,43 persen. Dibandingkan negara maju seperti Amerika Serikat, Jepang, Korea, Selandia Baru, Kanada, dan Jerman, selisihnya semakin besar. Rasio Master-Doktor di negara-negara maju tadi berkisar di angka 9,80 persen.
Stadium General dipandu oleh Ahmad Jukari, Dosen STAIP yang juga aktivis lembaga swadaya masyarakat. Mantan KPU Pati dua periode dan aktif dalam kegiatan-kegiatan demokrasi, pemilu dan social lainnya. Hadir unsur pimpinan lengkap, Ketua STAIP Abd. Aziz, mantan Ketua Aida Husna, Sekrataris Yayasan Pendididikan Islam yang menaungi STAIP Dr. Muhammad Dhofir, M.A, para Wakil Kedtua, Kaprodi, dan segenap dosen.

Kepada para mahasiswa Ruchman yang juga Doktor Manajemen Kependidikan Universitas Negeri Semarang ini menyampaikan pelbagai peluang beasiswa yang ada di Kemenag mulai dari S1, S2 dan S3 Dalam Negeri dan Luar Negeri dengan full funding. "Jangan lama-lama lulusnya di S1, segera lulus, 4 tahun atau bahkan 3,5 tahun lalu ambil beasiswa S2 ke Luar Negeri", demikian himbau Ruchman. "Perguruan Tinggi di Luar Negeri melambai-lambai untuk kalian masuki, dan tugas Puspenma membiayainya", kata Ruchman sambail senyum-senyum.

Bagi para dosen STAIP dan PTKIS lainnya, Ruchman mempersilahkan untuk memanfaatkan layanan beasiswa S3, tentu disesuaikan dengan tugas fungsional yang saat ini di embannya. Kecuali mau balik kanan keilmuannya. “Meningkat jenjang S3 bagi para dosen adalah keharusan untuk menambah modal bagi tercapainya akreditasi kelembagaan dan program studi, termasuk berusaha mengurus jabatan fungsioanl dari Lektor hingga Guru Besar” harap Ruchman dihadapan puluhan para dosen STAIP.

Sementara itu Ketua STAI Pati Abdul Aziz menyampaikan apresiasinya kepada Kemenag yang telah menyapa STAIP dengan program-program layanan Pendidikan seperti KIP Kuliah, Bantuan Penyelesaian Pendidikan (BPP) dan juga bantuan sarpras. Hal itu di amini oleh Sekretaris Yayasan Muhammad Dhofir mengatakan bahwa perhatian pemerintah tidak kurang-kurang, sekarang tinggal kita yang ada di STAI Pati. “Puspenma di bawah Pak Ruchman telah menawarkan pelbagai program peningkatan capacitas tinggal para dosen dan mahasiswa untuk memanfaatkannya”, katanya. (Ulfah)', 'Pati — Layanan pendidikan tinggi pada Kementerian Agama, terbuka untuk semua sebagai implementasi dari education for all, dari berbagai latar belakang sosial, ekonomi dan politik. Karena menjadi...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-09-at-22.07.41.jpeg', admin_user_id, 'PUBLISHED', 1771, '2025-12-07T15:04:10.000Z', '2025-12-07T15:04:10.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'stadium-general-stai-pati-kemenag-buka-pendidikan-untuk-semua');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tfi1sw2tw', 'Kemenag Umumkan Peraih Anugerah GTK pada Puncak HGN 2025, Berikut Daftarnya!', 'kemenag-umumkan-peraih-anugerah-gtk-pada-puncak-hgn-2025-berikut-daftarnya', 'Jakarta — Kementerian Agama resmi mengumumkan peraih Anugerah GTK 2025 pada Puncak Hari Guru Nasional (HGN) 2025, Sabtu (6/12/2025). Penganugerahan ini diberikan sebagai bentuk apresiasi atas dedikasi, inovasi, karakter, dan keteladanan para pendidik dan tenaga kependidikan dari berbagai daerah di Indonesia.

Acara yang diselenggarakan di TMII ini juga menghadirkan suasana haru ketika ribuan guru dari seluruh Indonesia memanjatkan doa bersama untuk masyarakat yang terdampak banjir dan longsor di Aceh, Sumatera Utara, dan Sumatera Barat. Doa yang dipimpin secara serentak itu menjadi simbol kuat bahwa guru tidak hanya hadir sebagai pendidik, tetapi juga sebagai penyangga moral dan spiritual bangsa di tengah ujian.

Menteri Agama Nasaruddin Umar menyampaikan bahwa doa guru memiliki kekuatan yang melampaui ruang kelas.

“Dalam setiap kesedihan yang menimpa saudara-saudara kita, doa para guru menjadi pelita yang menguatkan. Mereka mendoakan tanpa pamrih, karena kecintaan mereka kepada negeri melekat dalam hati,” ujarnya.

Dirjen Pendidikan Islam, Amien Suyitno, menegaskan bahwa kepekaan dan solidaritas guru adalah pilar karakter bangsa.

“Empati para guru selalu menjadi energi yang menggerakkan masyarakat saling menopang,” tuturnya.

Berikut daftar peraih Anugerah GTK 2025:

<strong>GURU INSPIRATIF</strong>

Juara I – Herdiansah, MAN Insan Cendekia Aceh Timur, Aceh Timur – Aceh (Rp15.000.000)

Juara II – Dodi Saputra, MAN Insan Cendekia Padang Pariaman, Padang Pariaman – Sumatera Barat (Rp12.500.000)

Juara III – Ayu Mutmainnah Halim, MAN Insan Cendekia Gowa, Gowa – Sulawesi Selatan (Rp10.000.000)

<strong>GURU INOVATIF</strong>

Juara I – Anik Lestari, MTsN 1 Yogyakarta, Kota Yogyakarta – D.I. Yogyakarta (Rp15.000.000)

Juara II – Yulia Wahyuni, MAN 2 Kota Parepare, Parepare – Sulawesi Selatan (Rp12.500.000)

Juara III – Leni Reziyustikha, MIN 1 Belitung Timur, Belitung Timur – Kep. Bangka Belitung (Rp10.000.000)

<strong>GURU BERDEDIKASI</strong>

Juara I – Hermansyah, MIN 2 Sikka, Sikka – Nusa Tenggara Timur (Rp15.000.000)

Juara II – Rohili, MTsN 10 Jakarta, Jakarta Barat – DKI Jakarta (Rp12.500.000)

Juara III – Gusmawitri, MIN 8 Agam, Agam – Sumatera Barat (Rp10.000.000)

<strong>KEPALA INSPIRATIF</strong>

Juara I – Riski Ayu Amaliah, MTs Mir’atul Mujahid Kampung Bajo Kolaka, Kolaka – Sulawesi Tenggara (Rp15.000.000)

Juara II – Umi Salamah, MI Ma''arif Ketegan, Sidoarjo – Jawa Timur (Rp12.500.000)

Juara III – Lilik Fatkhu Diniyah, MI Al Iman Kota Magelang, Kota Magelang – Jawa Tengah (Rp10.000.000)

<strong>KEPALA INOVATIF</strong>

Juara I – Afrizal Manurung, MIS Madinatussalam, Deli Serdang – Sumatera Utara (Rp15.000.000)

Juara II – Amiruddin, MTsN 11 Tasikmalaya, Tasikmalaya – Jawa Barat (Rp12.500.000)

Juara III – Muhammad Nashir Maulana, MA Tahassus Welahan, Jepara – Jawa Tengah (Rp10.000.000)

<strong>KEPALA BERDEDIKASI</strong>

Juara I – Hatman Pa’Mudin, MIN 2 Lembata, Lembata – Nusa Tenggara Timur (Rp15.000.000)

Juara II – Zulfah Magdalena, MAN 1 Balangan, Balangan – Kalimantan Selatan (Rp12.500.000)

Juara III – Febriancu Nasulili, MA Daarul Hikmah, Banggai – Sulawesi Tengah (Rp10.000.000)

<strong>TENDIK INSPIRATIF</strong>

Juara I – Ahya Mujahidin, MAN 2 Kota Kediri, Kota Kediri – Jawa Timur (Rp15.000.000)

Juara II – Fikriah, Kankemenag Kota Banda Aceh, Banda Aceh – Aceh (Rp12.500.000)

Juara III – Rini Nuraeni, MTsN 4 Gunungkidul, Gunungkidul – D.I. Yogyakarta (Rp10.000.000)

<strong>TENDIK INOVATIF</strong>

Juara I – Widayanti, Kankemenag Kabupaten Purwakarta, Purwakarta – Jawa Barat (Rp12.500.000)

Juara II – Ziya Syifa Ulya, MTsN 4 Jakarta Selatan, Jakarta Selatan – DKI Jakarta (Rp15.000.000)

Juara III – Ahmad Edi Darmawan, Kankemenag Kabupaten Jembrana, Jembrana – Bali (Rp10.000.000)

<strong>TENDIK BERDEDIKASI</strong>

Juara I – Nuriyah, Kankemenag Kabupaten Tulungagung, Tulungagung – Jawa Timur (Rp15.000.000)

Juara II – Rusnan, Kankemenag Kota Mataram, Mataram – Nusa Tenggara Barat (Rp12.500.000)

Juara III – Norhalimah, MAN 2 Balangan, Balangan – Kalimantan Selatan (Rp10.000.000)

<strong>GURU LINTAS IMAN</strong>

Juara I – Zetty Azizatun Ni’mah, MAN 1 Kota Kediri, Kota Kediri – Jawa Timur (Rp15.000.000)

Juara II – Surya Bunawan, MA Kulliyatul Muballighin Muhammadiyah, Padang Panjang – Sumatera Barat (Rp12.500.000)

Juara III – Eka Wiyati, MI Islamiyah Sumberrejo Batanghari, Lampung Timur – Lampung (Rp10.000.000)

<strong>KISAH INSPIRATIF GURU MENGABDI UNTUK NEGERI</strong>

Guru yang Berjuang di Tengah Keterbatasan – Dyah Witasokah, MAN 1 Banyuasin (Rp15.000.000)

Guru yang Berjuang di Pinggiran Negeri – Irna Kamayanti, Guru Ngaji dari Seko, Sulawesi Selatan (Rp15.000.000)

Melalui doa, empati, dan penghargaan ini, Kementerian Agama menegaskan kembali bahwa kekuatan pendidikan Indonesia tumbuh dari dedikasi para guru yang tidak hanya mengajar, tetapi juga menopang harapan bangsa dengan cinta dan pengabdian yang tulus.', 'Jakarta — Kementerian Agama resmi mengumumkan peraih Anugerah GTK 2025 pada Puncak Hari Guru Nasional (HGN) 2025, Sabtu (6/12/2025). Penganugerahan ini diberikan sebagai bentuk apresiasi atas...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-07-at-12.35.35.jpeg', admin_user_id, 'PUBLISHED', 3422, '2025-12-07T07:51:04.000Z', '2025-12-07T07:51:04.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-umumkan-peraih-anugerah-gtk-pada-puncak-hgn-2025-berikut-daftarnya');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tb27ntk6h', 'Puncak HGN 2025: Doa Guru, Ekoteologi, Kedermawanan, dan Kolaborasi Nasional Menguatkan Ekosistem Pendidikan Islam', 'puncak-hgn-2025-doa-guru-ekoteologi-kedermawanan-dan-kolaborasi-nasional-menguatkan-ekosistem-pendidikan-islam', 'Jakarta (Kemenag) — Peringatan Puncak Hari Guru Nasional (HGN) 2025 yang dikemas dalam “Doa Guru dan Donasi untuk Negeri" dengan tema "Merawat Semesta dengan Cinta” menjadi momentum refleksi dan konsolidasi nasional bagi dunia pendidikan Indonesia. Rangkaian puncak HGN 2025 memperlihatkan arah besar pembangunan ekosistem pendidikan Islam yang bertumpu pada spiritualitas, karakter, lingkungan, dan kesejahteraan guru.

Dalam sambutannya, Menteri Agama menegaskan kembali kedudukan guru sebagai “orang tua intelektual dan spiritual” bagi anak bangsa. Ia menyebut doa guru sebagai kekuatan yang ikut menopang negeri di tengah berbagai ujian, termasuk bencana yang melanda Aceh, Sumatera Utara, dan Sumatera Barat.

“Guru adalah pintu berkah. Doa mereka untuk murid seperti doa orang tua untuk anak,” ujar Menag di Jakarta pada Sabtu (6/12/2025).

Ia juga mengapresiasi pengabdian guru di wilayah terpencil yang menembus ombak dan medan berat demi hadir bagi para murid. Menurut Menag, pengorbanan tersebut mencerminkan karakter bangsa yang tumbuh dari cinta, ketulusan, dan tanggung jawab.

Masih dalam rangkaian HGN 2025, Menag menegaskan pentingnya memasukkan perspektif ekoteologi ke dalam kurikulum madrasah. Ia menyebut bahasa agama sebagai medium efektif menanamkan kesadaran ekologis, mengingat kerusakan lingkungan adalah isu moral dan spiritual.

“Merusak lingkungan adalah dosa, merawat lingkungan adalah pahala,” tegasnya.

Menag mendorong guru menjadi teladan cinta lingkungan, mengingat kualitas bumi akan menentukan kualitas manusia sebagai hamba dan khalifah. Program ekoteologi yang telah diluncurkan Kemenag disebut sebagai prioritas strategis dalam membangun peradaban hijau melalui madrasah yang berkarakter 24 jam—di sekolah, rumah, dan masyarakat.

Indonesia kembali tercatat sebagai negara paling dermawan di dunia pada 2023–2024. Menag menegaskan bahwa capaian ini merupakan buah pendidikan karakter yang dirawat para guru sejak dini—baik di madrasah, sekolah, maupun pesantren.

“Spirit gotong royong lahir dari ruang-ruang pendidikan. Guru membentuk kohesi sosial yang membuat dunia melihat Indonesia dengan simpati,” ungkapnya.

Menag juga menyoroti kebijakan strategis bagi guru, termasuk kenaikan capaian PPG hingga 700% dan perluasan dukungan bagi guru nonformal seperti guru ngaji. Menurutnya, perhatian negara kepada para pendidik adalah bentuk penghormatan atas peran mereka dalam menanamkan nilai kemanusiaan dan solidaritas.

Direktur Jenderal Pendidikan Islam, Amien Suyitno melaporkan bahwa Kementerian Agama telah menyalurkan tambahan pembayaran sebesar Rp198 miliar bagi guru non-ASN serta menyiapkan Bantuan Subsidi Upah (BSU) sebesar Rp270 miliar bagi guru non-sertifikasi. Formasi Pendidikan Profesi Guru (PPG) tahun ini juga melonjak hingga 700%, membuka lebih banyak peluang bagi para pendidik untuk memperoleh kepastian status.

“Ini bukan hanya bantuan, tetapi investasi untuk masa depan pendidikan agama,” ujar Dirjen.

Selain itu, Kemenag mengalokasikan Rp10 miliar untuk KKG dan MGMP PAI sebagai bagian dari penguatan komunitas profesi pendidik.

Dalam sesi kebudayaan, Dirjen Pendis mengajak guru meneladani filosofi Tari Saman—kompak, fokus, dan bersahaja—sebagai representasi ideal dunia pendidikan di era perubahan cepat. Nilai kebersamaan ini diyakini menjadi energi yang menjaga relevansi pendidikan Islam.

Acara juga diwarnai penyaluran donasi kemanusiaan dari berbagai lembaga mitra yang mencapai lebih dari Rp410 juta. Donasi ini diperuntukkan bagi program sosial serta penguatan kegiatan penyuluh dan pendidik agama.

Dirjen Pendis menegaskan bahwa keberhasilan berbagai capaian pendidikan Islam sepanjang tahun tidak terlepas dari sinergi banyak pihak—mulai dari lembaga perbankan, lembaga pendidikan, hingga institusi mitra pemerintah.

“Kerja bersama ini membuat program pendidikan Islam tumbuh lebih cepat dan lebih kuat,” ujarnya.

Donasi mitra senilai Rp 410 juta, program BSU Rp270 miliar, dan dukungan anggaran lainnya menjadi bagian dari kolaborasi yang memperkuat ekosistem pendidikan Islam berbasis cinta, kepedulian, dan visi kebangsaan.

Puncak HGN 2025 ditutup dengan penyerahan penghargaan bagi guru berprestasi oleh Menteri Agama. Suasana haru dan hangat mengiringi penghormatan kepada para pendidik yang menjadi teladan bangsa.

“Memuliakan guru berarti menjaga masa depan Indonesia. Negeri ini dermawan karena guru menanamkan cinta dan tanggung jawab,” tegas Menag.

Kementerian Agama menegaskan komitmennya untuk terus memperkuat ekosistem pendidikan Islam melalui spiritualitas, karakter, kepedulian lingkungan, kesejahteraan guru, dan kolaborasi nasional lintas sektor.', 'Jakarta (Kemenag) — Peringatan Puncak Hari Guru Nasional (HGN) 2025 yang dikemas dalam “Doa Guru dan Donasi untuk Negeri" dengan tema "Merawat Semesta dengan Cinta” menjadi momentum refleksi dan...', NULL, admin_user_id, 'PUBLISHED', 1255, '2025-12-06T18:44:55.000Z', '2025-12-06T18:44:55.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'puncak-hgn-2025-doa-guru-ekoteologi-kedermawanan-dan-kolaborasi-nasional-menguatkan-ekosistem-pendidikan-islam');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tu4cx8bcx', 'Delegasi Fakultas Syariah UIN KHAS Jember Raih Juara Favorit Lomba Peradilan Semu Tingkat Nasional 2025', 'delegasi-fakultas-syariah-uin-khas-jember-raih-juara-favorit-lomba-peradilan-semu-tingkat-nasional-2025', 'Jember - Delegasi Fakultas Syariah Universitas Islam Negeri (UIN KHAS) Jember kembali menorehkan prestasi gemilang di kancah nasional. Kali ini, prestasi tersebut ditunjukkan dengan raihan kemenangan sebagai Tim Favorit MCC 2025 pada event Legal Forum and Tournament Moot Court Community (MCC) From Courtroom Practice to Real Justice yang diselenggarakan oleh UIN Raden Fatah Palembang bekerja sama dengan Pengadilan Agama Kelas IA Palembang pada 28 November hingga 1 Desember 2025.

Kompetisi bergengsi yang diikuti oleh 12 perguruan tinggi, baik Perguruan Tinggi Keagamaan Islam Negeri (PTKIN) maupun Perguruan Tinggi Umum (PTU) se-Indonesia ini, menjadi ajang adu argumentasi, analisis hukum, dan keterampilan beracara yang ketat. Usai melalui tahapan panjang, enam delegasi terpilih untuk berkompetisi di babak final, dengan melakukan praktik langsung atau peradilan semu.

Adapun enam tim yang berkompetisi di final yakni delegasi dari Universitas Sriwijaya Palembang, Universitas Muhammadiyah Palembang, UIN Sultan Maulana Hasanuddin Banten, UIN K.H. Abdurrahman Wahid Pekalongan, UIN Kiai Haji Achmad Siddiq Jember, dan Universitas Indonesia Bangun Bangsa (IBA).

Atas prestasi ini, Dekan Fakultas Syariah UIN KHAS Jember Wildani Hefni mengapresiasi pencapaian para mahasiswanya. Menurutnya, prestasi ini merupakan buah manis dari konsistensi program pembinaan peradilan semu (moot court) di Fakultas Syariah UIN KHAS Jember yang selama ini kerapkali menjadi juara di berbagai event nasional.

“Pencapaian ini membuktikan bahwa dedikasi dan proses pembinaan yang berkelanjutan mampu mengantarkan mahasiswa Fakultas Syariah UIN KHAS Jember bersaing dengan kualitas terbaik di tingkat nasional. Tentu tidak mudah berkompetisi di tingkat nasional. Namun, prestasi ini membuktikan bahwa mahasiswa Fakultas Syariah UIN KHAS Jember berhasil mewujudkannya”, ungkap Dekan Fakultas Syariah UIN KHAS Jember Wildani Hefni di Jember (5/12/2025).

Ditambahkan Dekan, gelar tim favorit sekaligus meraih prestasi juara IV yang disandang oleh delegasi Fakultas Syariah UIN KHAS Jember menunjukkan bahwa tim tidak hanya unggul secara substansi hukum tetapi juga memiliki penampilan dan kerja tim yang berkesan di mata juri dan peserta lain.

“Prestasi ini meneguhkan posisi Fakultas Syariah UIN KHAS Jember sebagai salah satu lembaga pendidikan yang tidak hanya unggul dalam bidang akademik, tetapi juga dalam pengembangan keterampilan praktis mahasiswa di bidang hukum dan peradilan,” terang Wildani Hefni.

“Selamat kepada tim delegasi Fakultas Syariah UIN KHAS Jember yang berlaga di UIN Raden Fatah Palembang dan telah bekerja keras serta membawa nama baik almamater. Semoga ini menjadi motivasi bagi mahasiswa lainnya,” tambah Wildani Hefni.

Selamat kepada seluruh delegasi atas prestasi yang membanggakan! Teruslah berkarya dan mengukir prestasi.

(Fasya Media).', 'Jember - Delegasi Fakultas Syariah Universitas Islam Negeri (UIN KHAS) Jember kembali menorehkan prestasi gemilang di kancah nasional. Kali ini, prestasi tersebut ditunjukkan dengan raihan kemenangan...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-06-at-16.59.48.jpeg', admin_user_id, 'PUBLISHED', 3947, '2025-12-06T10:00:19.000Z', '2025-12-06T10:00:19.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'delegasi-fakultas-syariah-uin-khas-jember-raih-juara-favorit-lomba-peradilan-semu-tingkat-nasional-2025');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tqlr7ep0j', 'Lagi, Fakultas Syariah UIN KHAS Jember Luncurkan 15 Buku dan HKI Karya Dosen dan Mahasiswa', 'lagi-fakultas-syariah-uin-khas-jember-luncurkan-15-buku-dan-hki-karya-dosen-dan-mahasiswa', 'Jember – Fakultas Syariah Universitas Islam Negeri Kiai Haji Achmad Siddiq (UIN KHAS) Jember terus mendorong peningkatan publikasi ilmiah para dosen dengan memfasilitasi penerbitan buku dan Hak Kekayaan Intelektual (HKI). Untuk tahun 2025, Fakultas Syariah UIN KHAS Jember meluncurkan sejumlah 15 buku dan HKI karya dosen dan mahasiswa. Peluncuran buku ini digelar berbarengan dengan acara Sharia Faculty Award (SFA) dan Sharia Faculty Festival and Competition (SFFC) 2025, di Gedung Business and Education Center kampus UIN KHAS Jember, Kamis, (4/12/2025).

Penerbitan buku dan HKI tersebut difasilitasi oleh Fakultas Syariah melalui Unit Penerbitan, Penelitian, dan Pengabdian Masyarakat (UP3M) Fakultas Syariah UIN KHAS Jember bekerjasama dengan salah satu penerbit di Yogyakarta.

Rektor UIN KHAS Jember Prof Hepni Zain mengapresiasi peluncuran buku oleh UP3M Fakultas Syariah. Menurut Prof Hepni, Fakultas Syariah tidak pernah kehilangan inovasi dan kreativitas. Salah satu inovasinya kali ini adalah penerbitan buku untuk terus mengasah produktifitas sebagai bentuk kontribusi intelektual kampus kepada masyarakat.

“Saya mengapresiasi tim Fakultas Syariah atas penerbitan karya civitas akademika. Lahirnya karya-karya para dosen dan mahasiswa dapat memberikan kontribusi besar kepada masyarakat. Bentuk kontribusinya itu berupa gagasan, ide dan konsep mengingat masyarakat setiap hari selalu berhadapan dengan problematika sosial dan termasuk wawasan tentang hukum dan kemasyarakatan”, terang Rektor UIN KHAS Jember Prof Hepni Zain.

Sementara Dekan Fakultas Syariah UIN KHAS Jember Dr. Wildani Hefni menuturkan bahwa pihaknya mendorong peningkatan rekognisi para dosen Fakultas Syariah, yang salah satunya melalui kepemilikan karya-karya akademik, baik itu artikel, buku, HKI atau hak paten.

“Sejumlah 15 karya dosen dan mahasiswa Fakultas Syariah yang kita luncurkan hari ini menjadi bukti nyata adanya penguatan tradisi intelektual dan akademik di Fakultas Syariah UIN KHAS Jember. Kami terus mendorong, dan juga memfasilitasi peningkatan karya-karya akademik para dosen untuk kemudian dipublikasikan dan dapat dibaca oleh masyarakat,” kata Dekan Fakultas Syariah UIN KHAS Jember, Wildani Hefni.

Adapun judul buku karya dosen dan mahasiswa Fakultas Syariah UIN KHAS Jember yang diluncurkan, antara lain:

1. Law and Sharia : Integrasi, Interrelasi Nilai-Nilai Syariah Dan Sains Dalam Pembangunan Hukum Yang Progresi Dan Berkeadilan
2. Judicial Pardon Dalam Sistem Hukum Indonesia
3. Asas Kedaulatan Rakyat Atas Eksistensi Partai Politik
4. Dominasi Partai Politik dalam Penempatan Jabatan Publik: Problematika Demokrasi yang Sering Terabaikan.
5. Penyelesaian Perkara Pidana Berbasis Pada Kearifan Lokal : Sebuah pendekatan Implementatif Konsep Keadilan Restoratif
6. Metode Istinbath Hukum Islam
7. Sejarah Perkembangan Hukum Islam
8. Belajar Nahwu Termudah Untuk Pemula
9. Hukum Desa Adat Di Indonesia
10. Fiqh Akbari (Gagasan Spiritualitas Hukum Islam Ibn ''Arabi)
11. Dispensasi Nikah dan Fenomena Pernikahan Dini: Antara Idealitas dan Realitas
12. Jaringan Intelektual dan Wacana Keagamaan Kontemporer
13. Ekoteologi: Kritik terhadap Kapitalisme Ekologis dalam Wacana Pembangunan Global
14. Teori Dasar Fiqh Muamalah: Sebuah Pengantar
15. Pengantar Hukum Tata Negara: Konsep dan Kajian Kantemporer

Kontributor : Fasya Media', 'Jember – Fakultas Syariah Universitas Islam Negeri Kiai Haji Achmad Siddiq (UIN KHAS) Jember terus mendorong peningkatan publikasi ilmiah para dosen dengan memfasilitasi penerbitan buku dan Hak...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-06-at-07.18.02.jpeg', admin_user_id, 'PUBLISHED', 2792, '2025-12-06T09:55:36.000Z', '2025-12-06T09:55:36.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'lagi-fakultas-syariah-uin-khas-jember-luncurkan-15-buku-dan-hki-karya-dosen-dan-mahasiswa');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tfka3drc1', 'Kemenag Buka Pengajuan Kenaikan Jabatan Akademik Dosen Lektor Kepala dan Guru Besar Rumpun Ilmu Agama Periode III Tahun 2025', 'kemenag-buka-pengajuan-kenaikan-jabatan-akademik-dosen-lektor-kepala-dan-guru-besar-rumpun-ilmu-agama-periode-iii-tahun-2025', 'Jakarta, (4/12) Kementerian Agama Republik Indonesia melalui Direktorat Jenderal Pendidikan Islam secara resmi mengumumkan pembukaan pengajuan kenaikan Jabatan Akademik Dosen (JAD) Lektor Kepala dan Guru Besar/ Profesor rumpun ilmu agama untuk Periode III Tahun 2025. Pengumuman tersebut disampaikan melalui surat bernomor B-728/DJ.I/Dt.I.III/HM.00/12/2025 yang ditujukan kepada Pimpinan PTKN, Koordinator Kopertais Wilayah I–XV, serta Direktur Pendidikan pada Ditjen Bimas Kristen, Protestan, Hindu, Buddha, dan Pusat Bimbingan dan Pembinaan Konghuchu.

Direktur Pendidikan Tinggi Keagamaan Islam, Sahiron mengatakan bahwa kebijakan ini merupakan tindak lanjut dari Keputusan Menteri Agama Nomor 828 Tahun 2024 mengenai Pedoman Pembinaan dan Pengembangan Profesi dan Karier Jabatan Fungsional Dosen Rumpun Ilmu Agama serta Surat Edaran Dirjen Pendidikan Islam Nomor B-163/DJ.I/Dt.I.III/HM.00/03/2025. Pengajuan pada periode ini dibuka kembali untuk memberikan kesempatan bagi dosen yang telah siap memenuhi ketentuan serta pengusul pada periode sebelumnya yang belum lolos.

“Dosen pada periode II tahun 2025 yang belum lolos dapat mengajukan kembali usulan tersebut apabila telah memenuhi semua ketentuan dan persyaratan.” Terang Sahiron.

Kementerian Agama memastikan bahwa seluruh proses kenaikan jabatan akademik harus mengacu pada regulasi terbaru, termasuk Keputusan Dirjen Pendidikan Islam Nomor 6237 Tahun 2024 tentang SOP Penilaian dan Uji Kompetensi. Seluruh pengajuan wajib dilakukan secara daring melalui sistem pakptk.kemenag.go.id, baik oleh PTKIN, Kopertais, Ditjen Bimas maupun Pusat Bimdik Konghuchu.

“Mekanisme digital ini sejalan dengan komitmen Menteri Agama RI dalam meningkatkan tata kelola layanan pendidikan melalui pemanfaatan teknologi.” Tambahnya.

Lini masa pengajuan telah ditetapkan sebagai panduan seluruh satuan kerja. Pengajuan berlangsung mulai 15 Desember 2025 hingga 9 Januari 2026, disusul tahapan penilaian pada 16–31 Januari 2026. Masa perbaikan dan klarifikasi bagi asesor ditetapkan pada 1–14 Februari 2026, dan penilaian kembali perbaikan pada 15–28 Februari 2026. Sementara itu, publikasi hasil calon Lektor Kepala dan calon Guru Besar dilakukan pada 1–10 Maret 2026, sebelum dilaksanakan Uji Kompetensi Guru Besar pada 1–10 April 2026. Penetapan akhir hasil UKOM dijadwalkan pada April 2026.

Lebih lanjut, Sahiron menyampaikan apresiasi dan harapan atas dibukanya periode ketiga ini. Ia menekankan bahwa langkah ini merupakan bagian dari upaya Kemenag memperkuat standar mutu akademik dosen rumpun ilmu agama. "Dan proses ini adalah upaya untuk menghadirkan mekanisme penilaian yang lebih transparan, akuntabel, dan sesuai standar nasional pendidikan tinggi.” Tegas pria yang juga Guru Besar bidang ilmu tafsir.

Kementerian Agama mendorong seluruh PTKI, Kopertais, dan unit terkait untuk memberikan pendampingan optimal bagi para dosen yang mengajukan kenaikan jabatan. Melalui proses yang lebih terstruktur dan berbasis regulasi terbaru, Kemenag berharap semakin banyak dosen Indonesia yang mencapai jabatan Lektor Kepala maupun Guru Besar.

“Sehingga hasilnya memberi dampak, dapat memperluas kontribusi keilmuan dan memperkuat ekosistem akademik nasional.” Pungkasnya.', 'Jakarta, (4/12) Kementerian Agama Republik Indonesia melalui Direktorat Jenderal Pendidikan Islam secara resmi mengumumkan pembukaan pengajuan kenaikan Jabatan Akademik Dosen (JAD) Lektor Kepala dan...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-04-at-22.29.12.jpeg', admin_user_id, 'PUBLISHED', 897, '2025-12-05T06:23:45.000Z', '2025-12-05T06:23:45.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-buka-pengajuan-kenaikan-jabatan-akademik-dosen-lektor-kepala-dan-guru-besar-rumpun-ilmu-agama-periode-iii-tahun-2025');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2ta69e3g09', 'Kemenag Lakukan Percepatan Penyaluran Beasiswa, Jelang LPDP Tutup Buku 2025', 'kemenag-lakukan-percepatan-penyaluran-beasiswa-jelang-lpdp-tutup-buku-2025', 'Jakarta—Pusat pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA), Sekretariat Jenderal Kementerian Agama bersama dengan Lembaga Pengelola Dana Pendidikan (LPDP) Kementerian Keuangan RI, melaksanakan rekonsiliasi percepatan penyaluran beasiswa menjelang tutup buku tahun anggaran 2025.

Kegiatan dilaksanakan pada tanggal 2 s.d 4 Desember 2025 membahas tentang akselerasi penyaluran baik program beasiswa gelar maupun program non gelar.

Kepala Pusat Pembiayaan Pendidikan Agama dan Pendidikan Agama (PUSPENMA), Ruchman Basori mengatakan kegiatan ini penting untuk menjamin semua pembiayaan beasiswa on going dan rekrutmen baru 2025 dapat tersalurkan, baik biaya hidup, biaya studi, tunjangan buku, penelitian, jurnal scopus mapun tunjangan keluarga.

Lebih lanjut dikatakan Ruchman, langkah ini diambil dalam rangka memberikan pelayanan terbaik kepada para awardee agar pembiayaannya tidak terlambat dibayarkan. Karena akhir tahun ini, ditetapkan batas waktu penyampaikan pengajuan pencairan seluruh komponen pendanaan pada tanggal 5 Desember 2025.

Aktivis Mahasiswa 1998 ini berharap bahwa para Awardee baik program gelar dan non gelar, untuk segera mengajukan pencairan sebelum tanggal 5 Desember 2025. Sebelum diteruskan ke LPDP, terlebih dahulu akan diverifikasi oleh Tim Verifikator dari PUSPENMA untuk kemudian diteruskan ke feeder LPDP.

Tidak lupa Ruchman yang juga Alumni IAIN Walisongo Semarang ini meminta kepada LPDP untuk mengalokasikan tambahan pendanaan, mengingat banyaknya stakeholders di Kemenag baik dosen, guru, ustadz, kyai, santri, siswa, mahasiswa, alumni, dan pegawai Kemenag yang membutuhkan Beasiswa Indonesia Bangkit ini.

Kepada Bu Juni dan Pak Gendro yang mewakili LPDP, Ruchman meyakinkan, LPDP tak perlu ragu menyalurkan beasiswa kepada Keluarga Besar Kemenag, karena pasti akan bermanfaat dan berdampak pada peningkatan kualitas SDM untuk menyambut Indonesia Emas 2045.

Kepala Divisi Keuangan LPDP, Juni Damanik berkomitmen untuk membantu proses percepatan penyaluran ini berjalan dengan lancar sehingga seluruh program beasiawa 2025 seluruhnya bisa dibayarkan di tahun anggaran 2025.

Juni berharap proses rekonsiliasi ini lancar dan catatan-catatan verifikasi yang ada saat ini, segera bisa ditindaklanjuti dengan cepat dan seluruh program bisa diajukan maksimal 5 Desember 2025.

Sebagaimana diketahui Kemenag telah memberikan layanan beasiswa kepada 7.800-an Awardee sejak tahun 2022 hingga sekarang baik program S1, S2 dan S3 di Dalam dan Luar Negeri. Untuk tahun 2025 telah direkrut sebanyak 1.029 orang semuanya beasiswa degree. Sementara untuk non degree diwujudkan dalam bentuk Language Academic Preperation Program (LAPP) 75 orang, Pelatihan Multimedia Pesantren 240 orang dan Penguatan Moderasi Beragagama 240 orang.

Ketua Tim Beasiswa Pendidikan Tinggi Keagamaan Siti Maria Ulfa, mengatakan kepada seluruh tim penyaluran di PUPENMA, untuk fokus dalam percepatan pencairan ini dan segera menindaklanjuti segala bentuk catatan verifikasi dari tim penyaluran LPDP.(Maul)', 'Jakarta—Pusat pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA), Sekretariat Jenderal Kementerian Agama bersama dengan Lembaga Pengelola Dana Pendidikan (LPDP) Kementerian Keuangan RI,...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-05-at-06.08.40.jpeg', admin_user_id, 'PUBLISHED', 2405, '2025-12-05T05:01:38.000Z', '2025-12-05T05:01:38.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-lakukan-percepatan-penyaluran-beasiswa-jelang-lpdp-tutup-buku-2025');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tebzu3iif', 'Kemenag Teguhkan Ekoteologi sebagai Gerakan Nasional Pendidikan Ramah Iklim', 'kemenag-teguhkan-ekoteologi-sebagai-gerakan-nasional-pendidikan-ramah-iklim', 'Jakarta (Kemenag) — Kementerian Agama menegaskan komitmennya untuk memperkuat implementasi ekoteologi sebagai gerakan nasional dalam pendidikan. Penegasan ini disampaikan Sekretaris Jenderal Kementerian Agama, Kamaruddin Amin, saat membuka International Conference on Moral Teachers yang menjadi bagian dari rangkaian peringatan Hari Guru Nasional. Konferensi ini juga menjadi lanjutan dari agenda internasional bertema “Caring for the Universe with Love” yang sebelumnya digelar untuk memperkuat gerakan pendidikan ramah iklim di lingkungan Kemenag.

Dalam sambutannya, Sekjen menekankan bahwa ekoteologi kini berada pada fase implementasi, bukan sekadar wacana. Ia menyampaikan bahwa pembahasan teoretis mengenai hubungan spiritual manusia dan alam sudah cukup panjang, dan saat ini Kemenag bergerak menuju langkah teknis yang terukur.

“Konsep ekoteologi telah lama dibahas. Yang kini jauh lebih penting adalah bagaimana memastikan langkah-langkah teknis dan terukur agar konsep ini benar-benar terimplementasi dan berdampak pada lingkungan,” tegasnya di Jakarta pada Selasa (2/12/2025).

Kamaruddin menyebut bahwa Kemenag memiliki potensi sosial yang sangat besar untuk menggerakkan perubahan ekologis. Dengan lebih dari satu juta guru, sepuluh juta siswa madrasah, serta 1,5 juta peristiwa nikah setiap tahun, Kemenag memegang kekuatan transformasi yang tidak dimiliki institusi lain.

“Jika setiap guru menanam satu pohon, kita bisa menanam minimal satu juta pohon setahun. Jika setiap calon pengantin menanam satu pohon, kita menambah 1,5 juta pohon lagi. Potensinya sangat besar,” ujarnya.

Ia juga menggarisbawahi peran guru sebagai aktor utama dalam membentuk karakter ekologis peserta didik. Menurutnya, teladan dari Jepang dan Finlandia yang menempatkan cinta lingkungan sebagai bagian dari pendidikan moral dapat menjadi inspirasi.

“Mengajar dengan cinta, membentuk kepedulian sejak dini, dan menciptakan budaya merawat lingkungan adalah tugas strategis para guru,” kata Kamaruddin.

Sementara itu, Direktur Jenderal Pendidikan Islam, Amien Suyitno, menegaskan bahwa ekoteologi merupakan amanat prioritas yang sejak awal dikemukakan Menteri Agama. Ia menilai bahwa tingkat kerusakan alam yang terus meningkat mengharuskan adanya penyesuaian dalam tujuan syariah.

“Sudah saatnya menjaga lingkungan—hifdzul biah—menjadi bagian dari maqashid syariah, karena kerusakan ekologis telah memasuki fase darurat,” ungkapnya.

Amien menjelaskan bahwa implementasi ekoteologi bukan lagi sebuah gagasan abstrak. Di berbagai lembaga pendidikan Kemenag, program-program ramah lingkungan sudah berjalan secara nyata, mulai dari Adiwiyata, pengelolaan sampah berbasis recycling, program konservasi energi, hingga pengembangan green campus.

“Ini bukti bahwa Kemenag tidak berhenti pada konsep. Kita sudah bergerak, dan akan terus memperluas praktik baik ini,” ujarnya.

Konferensi internasional ini turut menghadirkan narasumber dari berbagai negara yang memberikan pandangan strategis mengenai pendidikan ramah lingkungan. Mereka menekankan pentingnya kolaborasi global dan lokal, penguatan literasi ekologis, serta pembiasaan praktik perawatan bumi dalam keseharian sekolah dan madrasah. Pandangan-pandangan tersebut memperkaya wawasan peserta sekaligus memperkuat kesadaran bahwa tantangan ekologis membutuhkan respons terpadu dari seluruh ekosistem pendidikan.

Rangkaian pembukaan semakin bermakna dengan peluncuran Buku Induk Pendidikan Ramah Iklim dan Panduan Pendidikan Ramah Iklim sebagai panduan nasional dalam mengintegrasikan isu lingkungan ke dalam pendidikan madrasah, pesantren, dan lembaga pendidikan Islam.

Memasuki sesi materi, seminar menghadirkan berbagai perspektif global mengenai pendidikan ramah semesta. Irina Vorobyeva dari Kedutaan Besar Rusia memaparkan pengalaman negaranya dalam membangun kesadaran lingkungan melalui kegiatan praktik, termasuk gerakan “Clean Games” yang melibatkan siswa dalam kompetisi memungut sampah secara kreatif.

Sementara itu, Mark Heyward dari INNOVATION menekankan bahwa guru memiliki peran strategis sebagai agen kasih sayang dan perdamaian, yang mampu menularkan semangat “Think Globally, Act Locally” kepada para pelajar agar isu global seperti perubahan iklim dapat direspons dengan tindakan nyata di lingkungan sekolah.

Sorotan besar juga muncul dari paparan Dr. Haidar Bagir yang menyampaikan pandangan sufistik mengenai alam sebagai ayat-ayat Tuhan. Ia mengingat kembali pengalamannya saat mendirikan sekolah dan menolak penebangan pohon karena meyakini bahwa setiap unsur alam adalah makhluk yang bertasbih kepada Sang Pencipta. Pandangan ini mengajak pendidik menumbuhkan spiritualitas ekologis dalam praktik pembelajaran.

Selain itu, Irfan Amali dari Peace Generation berbagi pengalaman inspiratif tentang pesantrennya yang telah enam tahun menerapkan konsep zero waste. Semua sampah dikelola menjadi kompos, pakan maggot, hingga bata plastik yang kemudian digunakan untuk membangun masjid—sebuah bukti bahwa pendidikan lingkungan dapat diwujudkan secara nyata, bukan sekadar konsep.

Melalui seminar ini, Kementerian Agama menegaskan bahwa pendidikan adalah kunci untuk menumbuhkan generasi yang tidak hanya cerdas, tetapi juga memiliki kepekaan moral dan cinta yang tulus kepada alam semesta. Gerakan pendidikan ramah iklim bukan sekadar program, melainkan ikhtiar jangka panjang untuk memastikan masa depan bumi tetap terjaga bagi generasi yang akan datang.', 'Jakarta (Kemenag) — Kementerian Agama menegaskan komitmennya untuk memperkuat implementasi ekoteologi sebagai gerakan nasional dalam pendidikan. Penegasan ini disampaikan Sekretaris Jenderal...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-03-at-18.22.57.jpeg', admin_user_id, 'PUBLISHED', 2630, '2025-12-03T11:27:19.000Z', '2025-12-03T11:27:19.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-teguhkan-ekoteologi-sebagai-gerakan-nasional-pendidikan-ramah-iklim');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t07uob8ku', 'BIB Kemenag Di University of Groningen, Awardee Studi Theologi Hingga Artivicial Intelligent', 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent', 'Groningen — Mahasiswa penerima Beasiswa Indonesia Bangkit Kementerian Agama RI, studi S3 di University of Groningen dari mulai kajian theologi hingga artificial intelligent (AI). Mereka berasal dari beberapa Perguruan Tinggi Keagamaan (PTK) di Indonesia.

Kemenag melakukan monitoring dan evaluasi (Monev) kepada para penerima beasiswa (Awardee) Beasiswa Indonesia Bangkit (BIB) pada tanggal 25 November hingga 02 Desember 2025, ke Inggris dan Belanda. Di Belanda dilakukan kepada para Awardee Program S3 di University of Groningen dan University of Amsterdam. Kegiatan ditempatkan di Universitas Groningen, pada Senin, (1/12/25) waktu setempat.

Tim Monev terdiri dari Kepala Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA), Sekretariat Jenderal Ruchman Basori, Sekretaris Jenderal Pendidikan Islam Arskal Salim, Inspektur II, Inspektorat Jenderal Ali Irfan dan Kasubtim Humas Ditjen Pendidikan Islam Alip Nuryanto.

Kepala Pusat Pembiayaan Pendidikan Agama Dan Pendidikan Keagamaan (PUSPENMA), Sekretariat Jenderal Ruchman Basori mengatakan bahwa mahasiswa yang studi pada University of Groningen memilih program-program yang keren, seperti farmasi, ekonomi, pendidikan, theology hingga artificial intelligence (AI).

Ruchman menerangkan para Awardee memilih sendiri secara bebas keilmuan yang dipelajari di negeri kincir angin ini, disesuaikan dengan tugas sebagai akademisi pada UIN, IAIN, STAIN, PTKI dan PTK pada Bimas Kristen, Katholik, Hindu, Buddha dan Konghucu. “Saat ini Kemenag telah dan sedang membiayai 424 Awardee di luar negeri, tersebar di 119 perguruan tinggi dan 24 negara”, terang Ruchman.

Data Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA) tahun 2022-2025, ada 85 Awardee di Inggris dan 21 orang di Belanda. Sementara di Jerman 18, Irlandia 3, Perancis 10, Belgia, Finlandia dan Denmark masing-masing 1 orang.

Ruchman yang juga Alumni IAIN Walisongo Semarang mengatakan bahwa tujuan Monev Adalah ingin memastikan bahwa layanan BIB kepada mahasiswa semakin berkualitas, lancar, nyaman, baik layanan akademik, pembiayaan, dan administrasi beasiswa di kampus tujuan.

Doktor Manajemen Kependidikan Univerisitas Negeri Semarang (UNNES) ini mengatakan masukan dari para Awardee BIB sangat penting sebagai bahan perbaikan dan melakukan proyeksi beasiswa di masa yang akan datang yang tujuan utamanya agar kualitas dosen, guru, ustadz, kyai, santri dan alumni Pendidikan Keagamaan di bawah Kemenag meningkat kualitasnya.

Pertemuan dimoderatori oleh Sekretaris Ditjen Pendidikan Islam Prof. Arskal Salim, M.A., Ph.D dan dihadiri oleh 8 orang Awardee. Mereka berasal dari dosen UIN Syarif Hidayatullah Jakarta, UIN Sunan Kalijaga Jogjakarta, UIN Maulana Malik Ibrahim Malang, UIN Antasari Banjarmasin, UIN Ar-Raniry Aceh, UIN Sultan Thaha Saifuddin Jambi, IAIN Parepare dan Universitas Hindu Negeri (UHN) I Gusti Bagus Sugriwa Denpasar.

M. Arskal Salim menyampaikan apresiasi kepada para Mahasiswa BIB Kemenag yang telah meraih kesempatan studi di kampus-kampus terbaik dunia seperti di Belanda ini. “Saya bangga dengan Saudara semua, karena akan menambah mutu PTK di tanah air bisa bersaing ditengah tantangan dunia global”, katanya.

Para Awardee memberikan apresiasi kepada Puspenma Kemenag atas kelancaran penyaluran biaya hidup (living allowent) dan pendampingan serta kesigapan dalam merespon permasalahan yang dihadapi para Awardee. “kami mengucapkan terimakasih dan penghargaan yang setinggi-tingginya kepada Puspenma, atas kerja keras dan komitmennya mendampingi kami”, kata Dosen UIN Jambi.

Umumnya para awardee mengaku nyaman studi di Belanda, hanya saja karena biaya hidup yang tinggi dan membawa keluarga, diantara mereka salah satunya (suami/istri) harus bekerja, terang Dhani Wijaya Dosen Sains dan Teknologi UIN Malang.

Tim Monev Kemenag mendengarkan dan mencatat aspirasi pelbagai hal dari para Awardee seperti penambahan biaya hidup (living allowent), karena biaya sewa rumah meningkat tajam, dokumen teknis pencairan, soal tugas belajar dan ijin belajar hingga pemantauan Awardee yang karena satu hal belum menyelesaikan studi tepat waktu.

“Saya berharap Kemenag memiliki data mahasiswa 5000 Doktor yang kini pendanaannya dialihkan ke Puspenma dan melacak keberadaan alumninya”, kata Azzam Masduqi Mahasiswa Awardee Theologi Universitas Groningen, yang juga dosen STISA Ash-Shofa Tasikmalaya.

Inspektur II Inspektorat Jenderal Kemenag Ali Irfan menyoroti tentang kewajiban para Awardee untuk kembali mengabdi ke kampusnya masing-masing dan para awardee harusnya diberikan tugas belajar bukan ijin belajar. “Pemberian tugas belajar menjadi penting, jangan ijin belajar karena nanti yang bersangkutan harus menjalankan kewajibannhya sebagai dosen”, katanya.

Sebagaimana diketahui, Kemenag melalui Puspenma telah memberikan pendanaan beasiswa kepada 7.500-an orang sejak tahun 2022, untuk mengambil studi S1, S2, dan S3 pada perguruan tinggi di Dalam maupun Luar Negeri, berkolaborasi dengan Lembaga Pengelola Dana Pendidikan (LPDP). (Alip/Humas)', 'Groningen — Mahasiswa penerima Beasiswa Indonesia Bangkit Kementerian Agama RI, studi S3 di University of Groningen dari mulai kajian theologi hingga artificial intelligent (AI). Mereka berasal dari...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-03-at-18.08.34.jpeg', admin_user_id, 'PUBLISHED', 520, '2025-12-03T11:13:54.000Z', '2025-12-03T11:13:54.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t6swr99ly', 'FSH PTKIN Unggul dalam Lomba Debat Hukum Bawaslu RI', 'fsh-ptkin-unggul-dalam-lomba-debat-hukum-bawaslu-ri', 'Jumat, 28 November 2025. Delegasi Fakultas Syariah dan Hukum UIN Jakarta menjuarai lomba Debat Nasional Hukum Pengawasan Pemilu 2025 yang diselenggarakan Badan Pengawas Pemilu Republik Indonesia (Bawaslu RI). Menduduki juara ke-2 juga dari Perguruan Tinggi Keagamaan Islam Negeri (PTKIN) yaitu Fakultas Syariah dan Hukum UIN Yogyakarta. Di posisi ketiga direbut delegasi dari Fakultas Hukum Universitas Indonesia.

Di babak semifinal, FSH UIN Jakarta dapat mengalahkan FH Universitas Indonesia. Demikian pula, FSH UIN Yogyakarta mengungguli Fakultas Hukum Universitas Airlangga. Dua delegasi tersebut, FSH UIN Jakarta dan FSH UIN Yogyakarta akhirnya bertemu di babak final yang diselenggarakan hari Jumat 28 November 2025 malam hari.

"Inilah adalah pertemuan antara saudara, UIN Yogyakarta yang lebih tua dengan saudaranya mudanya, UIN Jakarta", tutur Ali Sodiqin, Dekan FSH UIN Yogyakarta. Sebagaimana diketahui, UIN Jakarta awalnya sebagai cabang dari UIN Yogyakarta. Kemudian UIN Jakarta dipisahkan dan menjadi perguruan tinggi mandiri. "Siapapun juaranya, tetap dari PTKIN", jelas Muhammad Maksum, Dekan FSH ketika mengetahui dua FSH tersebut bertemu di babak final.

Pertemuan dua fakultas ini membuktikan mahasiswa FSH memiliki kompetensi yang bagus dan dapat bersaing dengan mahasiswa lain. Keterbukaan akses untuk semua kalangan menjadikan mahasiswa FSH dapat menunjukkan kemampuannya. Kemenangan ini bukanlah yang pertama kali. Sebelumnya, mahasiswa FSH juga telah menjuarai kompetisi berbagai perlombaan nasional. Awal November ini, mahasiswa FSH juara 1 Lomba Debat Hukum Nasional yang diselenggarakan di Fakultas Hukum Universitas Jenderal Sudirman Purwokerto. Di akhir September, prestasi membanggakan juga ditorehkan dalam perlombaan sidang semu pajak yang diselenggarakan Sekolah Tinggi Akuntansi Negara (STAN).

Delegasi yang ikut lomba di Bawaslu adalah Sainia Miftahullia, Wahyu Indra Triyadi, dan Bayu Ansori. Ketiganya berasal dari Program Studi Ilmu Hukum dan Hukum Pidana Islam. Ketiganya merupakan anggota Moot Court Community (MCC) FSH UIN Jakarta.

MCC merupakan lembaga semi otonom FSH yang dibentuk untuk membina kemampuan menulis, berdebat, dan sidang semu. Lembaga ini dibina oleh dosen-dosen aktif dan alumni yang sebelumnya aktif di MCC. Setiap tahun, lembaga ini menyeleksi anggota kemudian memberikan pelatihan kompetensi yang relevan. Sudah ratusan perlombaan diikuti dan juara yang diraih.

FSH UIN Jakarta terus mengembangkan kemampuan akademik dan nonakademik mahasiswa. Memberikan fasilitas pendukung untuk pencapaian tersebut. Tahun depan, FSH mencanangkan perlombaan berskala internasional terutama Asia Tenggara. Kesepakatan antara FSH dan University Malaya telah dilakukan untuk penyelenggaraan perlombaan mahasiswa tersebut.', 'Jumat, 28 November 2025. Delegasi Fakultas Syariah dan Hukum UIN Jakarta menjuarai lomba Debat Nasional Hukum Pengawasan Pemilu 2025 yang diselenggarakan Badan Pengawas Pemilu Republik Indonesia...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-02-at-15.05.00.jpeg', admin_user_id, 'PUBLISHED', 1469, '2025-12-02T08:10:37.000Z', '2025-12-02T08:10:37.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'fsh-ptkin-unggul-dalam-lomba-debat-hukum-bawaslu-ri');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tm1tga54t', 'Penguatan Pembentukan Direktorat Jenderal, Pesantren Didorong Jadi Pelopor Ekoteologi Nasional', 'penguatan-pembentukan-direktorat-jenderal-pesantren-didorong-jadi-pelopor-ekoteologi-nasional', 'Jakarta — Upaya modernisasi tata kelola pesantren di Indonesia memasuki fase krusial. Melalui Halaqah Penguatan Kelembagaan bertema “Pesantren, Ekoteologi dan Kemandirian Ekonomi Umat” yang digelar di UIN Jakarta, Kementerian Agama menegaskan arah baru pengembangan pesantren: memperkuat struktur negara, membangun gerakan ekoteologi, dan mendorong kemandirian ekonomi berbasis unit usaha yang profesional.

Kehadiran para kiai pengasuh pesantren besar, akademisi, dan pejabat Kemenag dalam forum ini menghadirkan gambaran komprehensif tentang masa depan pesantren sebagai pusat peradaban yang lebih terstruktur dan berdaya saing.

Dalam pemaparannya, KH. Ahmad Mahrus Iskandar menekankan pentingnya menjadikan pesantren sebagai garda depan gerakan ekoteologi—sebuah pendekatan keagamaan yang menempatkan kelestarian alam sebagai bagian integral dari spiritualitas Islam. Ia menyoroti bahwa Indonesia dianugerahi kekayaan ekologis yang seharusnya melahirkan kesadaran lingkungan sejak dini di lingkungan pesantren.

Ia mencontohkan praktik yang telah dilakukan Pondok Pesantren Darunajah, mulai dari pemilahan sampah, penggunaan air yang efisien, hingga sistem penyiraman otomatis untuk mendukung area penghijauan. KH. Mahrus menegaskan pentingnya membangun gerakan ekologis yang lebih terstruktur melalui kurikulum, pembiasaan santri, hingga unit usaha berbasis lingkungan.

Tidak hanya soal ekologi, KH. Mahrus juga menampilkan bagaimana Darunajah membangun kemandirian ekonomi melalui wakaf produktif, pertanian, peternakan, dan berbagai usaha yang dikelola secara profesional. Dengan model tersebut, hampir setengah kebutuhan operasional pesantren dapat dipenuhi tanpa bergantung pada bantuan eksternal. Dari total 1.117 hektare aset yang dikelola yayasan, lebih dari 1.000 hektare merupakan hasil pengembangan wakaf produktif. “Amanah masyarakat datang seiring kesungguhan kita mengelola,” ujarnya.

Kiai Sofwan Manaf memperkuat pandangan tersebut dengan menekankan bahwa pesantren harus dikelola berdasarkan delapan komponen dasar yang saling terhubung, mulai dari pendidikan, pengasuhan, administrasi, sarpras, hubungan masyarakat, usaha, SDM, hingga legalitas. Menurutnya, ruang gerak pesantren yang lebih fleksibel dibanding lembaga pendidikan formal menjadi modal besar untuk memperkuat kemandirian ekonomi lembaga.

Ia menyoroti pentingnya pengelolaan keuangan berbasis akuntabilitas, termasuk zakat, infak, sedekah, dan wakaf. Setelah lembaganya memperoleh legalitas nasional sebagai amil zakat, tingkat kepercayaan publik meningkat drastis dan pemasukan melonjak hingga 20 kali lipat.

Sofwan juga menekankan bahwa penguatan ekoteologi dan ekonomi pesantren selaras dengan tujuan pembangunan berkelanjutan (SDGs), terutama pada isu kemiskinan, pendidikan, dan kewirausahaan. Ia mengusulkan pembentukan Direktur Ekonomi Pesantren yang fokus pada perencanaan dan pengembangan usaha berbasis data.

Dari sisi negara, Staf Khusus Menteri Agama Bidang Kebijakan Publik, Media, dan SDM Ismail Cawidu menekankan urgensi pembentukan Direktorat Jenderal Pondok Pesantren sebagai bagian dari reformasi besar tata kelola pendidikan Islam. Ia menyebut kondisi saat ini—dengan 42 ribu pesantren dan enam juta santri—mustahil dikelola hanya oleh satu direktorat.

“Pesantren hadir jauh sebelum negara membiayai pendidikan. Kini jutaan santri dibiayai masyarakat. Negara wajib memastikan struktur tata kelola yang kuat,” ujarnya.

Ismail menyebut tiga persoalan mendesak yang membutuhkan intervensi struktural: ketimpangan fasilitas, minimnya pendampingan manajerial, dan belum solidnya basis data nasional pesantren. Dirjen Pesantren, menurutnya, akan hadir sebagai pusat koordinasi untuk memastikan standar mutu, pemerataan bantuan, hingga penguatan peran sosial dan ekonomi pesantren. “Ini mandat peradaban, bukan semata-mata penambahan struktur,” tegasnya.

Direktur Pesantren Basnang Said memaparkan perjalanan panjang negara dalam memperjuangkan regulasi pesantren, mulai dari era program kesetaraan, peringatan Hari Santri, hingga UU Pesantren. Ia menegaskan bahwa tantangan utama bukan pada regulasi, tetapi implementasi.

Lebih jauh, Basnang mengungkapkan bahwa pemerintah telah menyiapkan rancangan struktur SOTK baru, termasuk wacana membentuk direktorat khusus seperti Pendidikan Ma’had Aly, Muadalah dan Lembaga Formal, hingga Pemberdayaan Ekonomi Pesantren. Langkah ini disebutnya sebagai jawaban konkret pemerintahan Presiden Prabowo dan Menag Nasaruddin Umar terhadap kebutuhan pesantren.

Halaqah ini juga memunculkan gagasan jangka panjang, termasuk pengembangan Program Studi Manajemen Pesantren di tingkat S2 dan S3 sebagai fondasi akademik penguatan lembaga.

Seluruh narasumber sepakat bahwa masa depan pesantren Indonesia menuntut tata kelola yang lebih profesional, berkelanjutan, dan terbuka pada kolaborasi. Pesantren diharapkan menjadi model harmonisasi spiritualitas, ekologis, dan ekonomi yang mampu memperkuat kemandirian umat.

Halaqah ditutup dengan optimisme bahwa pengasuh pesantren akan menjadi motor utama dalam merumuskan kebutuhan teknis pembentukan Ditjen Pesantren. “Struktur ini hadir untuk melayani pesantren, bukan sebaliknya,” ujar Ismail.', 'Jakarta — Upaya modernisasi tata kelola pesantren di Indonesia memasuki fase krusial. Melalui Halaqah Penguatan Kelembagaan bertema “Pesantren, Ekoteologi dan Kemandirian Ekonomi Umat” yang digelar...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-28-at-21.12.47.jpeg', admin_user_id, 'PUBLISHED', 4531, '2025-11-28T14:42:23.000Z', '2025-11-28T14:42:23.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'penguatan-pembentukan-direktorat-jenderal-pesantren-didorong-jadi-pelopor-ekoteologi-nasional');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2twzl8sem1', 'Pendirian Ditjen Pesantren Dimantapkan, Para Kiai di Yogyakarta Soroti Transformasi Digital, Penguatan Karakter, dan Kepemimpinan Santri', 'pendirian-ditjen-pesantren-dimantapkan-para-kiai-di-yogyakarta-soroti-transformasi-digital-penguatan-karakter-dan-kepemimpinan-santri', 'Yogyakarta — Kementerian Agama RI menggelar Halaqah Penguatan Kelembagaan Pendirian Direktorat Jenderal Pesantren di UIN Sunan Kalijaga Yogyakarta, Kamis (27/11/2025). Forum strategis yang mempertemukan akademisi, para kiai, nyai, habib, pengasuh pesantren, dan pimpinan perguruan tinggi Islam ini menjadi ajang penghimpunan gagasan substantif sebagai fondasi pembentukan Ditjen Pesantren.

Mewakili Menteri Agama, Direktur Pendidikan Tinggi Keagamaan Islam Ditjen Pendidikan Islam, Sahiron membuka halaqah sekaligus membawa kabar penting: Presiden RI telah menyetujui pendirian Direktorat Jenderal Pesantren.

“Kita patut bersyukur bahwa pembentukan Direktorat Jenderal Pesantren sudah mendapat restu Presiden. Kini saatnya kita menyusun arah besar kelembagaan ini bersama para pemangku kepesantrenan,” ujarnya.

Ia menegaskan bahwa halaqah digelar bukan sekadar seremoni, melainkan sarana menyerap pandangan substantif para kiai dan nyai. “Kita ingin mendengarkan langsung. Ketika Direktorat Jenderal Pesantren nanti resmi berdiri, apa yang paling urgen dan apa yang harus dikerjakan pertama? Ini momentum menentukan,” katanya.

Dalam dialog yang berlangsung dinamis, para tokoh pesantren menekankan beberapa isu strategis yang akan menjadi bekal penyusunan roadmap Ditjen Pesantren.

Prof. Sahiron mengingatkan bahwa sistem AI menyerap pengetahuan dari konten yang tersedia di internet. Karena itu, pesantren harus hadir secara aktif agar nilai-nilai Islam yang moderat, santun, dan beradab menjadi referensi utama.

“Jika ruang digital dikuasai kelompok berwawasan keras, maka AI pun akan memantulkan nilai keras. Karena itu para kiai, ustaz, dan santri harus masuk, mengisi, dan mengarahkan,” tegasnya.

Para kiai menekankan bahwa sistem pendidikan pesantren telah terbukti melahirkan generasi beradab, rendah hati, serta tahan banting. Tradisi tersebut harus menjadi kerangka utama penyusunan kebijakan Ditjen Pesantren.

“Alumni pesantren sangat dibutuhkan untuk memimpin negara. Fondasinya ada di pendidikan adab dan kitab kuning,” ujar Prof. Sahiron.

<strong>Kepemimpinan santri yang adaptif, berpengetahuan luas, peduli lingkungan dan HAM</strong>

KH. Drs. M. Syakir Ali menekankan bahwa santri ideal adalah pemimpin masa depan yang merangkul ilmu agama dan pengetahuan umum sekaligus. “Orang pesantren harus jadi pemimpin yang rendah hati, berwawasan luas, ramah terhadap anak, peduli lingkungan, serta menjunjung kemanusiaan,” paparnya. Ia juga mendorong penguatan kecerdasan holistik: IQ, EQ, SQ, dan kecerdasan digital.

Sementara, KH. Dr. Hilmy Muhammad meminta pesantren membuka ruang kajian yang bersentuhan dengan problem modern, agar santri tetap relevan di tengah perubahan zaman dan tidak memosisikan teknologi sebagai ancaman.

“Lingkungan pesantren itu damai. Dari tempat sejuk inilah santri harus dibimbing agar mampu bicara di panggung publik sambil tetap membawa nilai akhlak,” ujarnya.

Ia menambahkan pentingnya perhatian pemerintah dan alumni terhadap kelayakan fasilitas dan infrastruktur pesantren.

<strong>UIN Sunan Kalijaga Dukung 100% Pembentukan Ditjen Pesantren</strong>

Rektor UIN Sunan Kalijaga menegaskan dukungan penuh kampusnya.
“UIN Sunan Kalijaga mendukung seratus persen pendirian Direktorat Jenderal Pesantren. Pesantren adalah pilar utama pendidikan Islam dan penopang karakter kebangsaan sejak masa perjuangan,” ujarnya.

Rektor mengingatkan bahwa pesantren tidak hanya penjaga tradisi keilmuan Islam, tetapi juga benteng kebangsaan yang sejak dulu berkontribusi pada perjuangan dan kemerdekaan Indonesia.

Halaqah ini meneguhkan komitmen pemerintah dan komunitas pesantren dalam merumuskan arah kelembagaan baru yang lebih kuat, strategis, dan relevan dengan perkembangan zaman. Semua masukan yang dihimpun akan menjadi bahan penyusunan desain kelembagaan Ditjen Pesantren, yang akan menjadi tonggak baru dalam penguatan pendidikan pesantren di Indonesia.', 'Yogyakarta — Kementerian Agama RI menggelar Halaqah Penguatan Kelembagaan Pendirian Direktorat Jenderal Pesantren di UIN Sunan Kalijaga Yogyakarta, Kamis (27/11/2025). Forum strategis yang...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-28-at-14.40.18.jpeg', admin_user_id, 'PUBLISHED', 1931, '2025-11-28T07:51:31.000Z', '2025-11-28T07:51:31.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'pendirian-ditjen-pesantren-dimantapkan-para-kiai-di-yogyakarta-soroti-transformasi-digital-penguatan-karakter-dan-kepemimpinan-santri');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t535ne1la', 'Negara Dorong Era Baru Transformasi Pesantren, Santri Ditarget Lebih Mandiri dan Kompetitif', 'negara-dorong-era-baru-transformasi-pesantren-santri-ditarget-lebih-mandiri-dan-kompetitif', 'Makassar — Pemerintah dalam hal ini Kementerian Agama menegaskan pentingnya transformasi tata kelola pesantren sebagai agenda strategis nasional. Penegasan tersebut disampaikan Direktur Pesantren, Basnang Said, dalam Halaqah Penguatan Kelembagaan Pendirian Direktorat Jenderal Pesantren bertema “Transformasi Pendidikan Pesantren”, yang berlangsung di UIN Alauddin Makassar, Rabu (26/11/2025).

Kegiatan yang dihadiri puluhan pimpinan pesantren dan akademisi dengan menghadirkan dua narasumber yakni Prof. Dr. K.H. Hamzah Harun Ar-Rasyid selaku Pimpinan PPTQ Halaqah Hafizhah dan Ketua Tanfidziyah PWNU Sulawesi Selatan, dan Dr. Hj. Nurfadjri Fadeli Luran, M.Pd selaku Ketua Umum Yasdic IMMIM.

Dalam sambutannya, Basnang Said menegaskan bahwa pesantren merupakan lembaga pendidikan tertua di Nusantara. “Pesantren sudah ada sejak abad ke-14, jauh sebelum Belanda datang dengan sistem sekolah modern,” ujarnya.

Ia mengingatkan bahwa perjalanan panjang pesantren juga mencatat masa ketika lembaga ini terpinggirkan oleh modernisasi kolonial. Momentum kebangkitan kembali diperkuat melalui Program PBSB era Menteri Agama M. Maftuh Basyuni yang mendorong santri tampil sebagai lulusan terbaik di berbagai perguruan tinggi ternama.

Basnang turut menyoroti evolusi pengakuan negara terhadap pesantren, mulai dari program kesetaraan pada masa Presiden Gus Dur, penetapan Hari Santri oleh Presiden Joko Widodo, hingga lahirnya UU No. 18/2019 tentang Pesantren. *“Undang-undang itu menguatkan martabat pesantren sebagai bagian dari sistem pendidikan nasional,” tegasnya.

Meski demikian, ia menyoroti tantangan baru yang muncul, terutama hilangnya kajian kitab-kitab klasik seperti balaghah, mantik, dan arudh pada beberapa pesantren yang terintegrasi dengan pendidikan formal. Kemenag, katanya, telah menyiapkan langkah sistematis untuk mengembalikan kekuatan tradisi keilmuan pesantren.

Hamzah Harun Ar-Rasyid, menekankan bahwa pendidikan pesantren berakar pada pembentukan karakter yang berkesadaran spiritual. “Santri harus merasa selalu dalam pengawasan Allah. Jika itu tertanam, maka seorang santri tidak akan mungkin berkhianat, meskipun nanti ia menjadi rektor atau menteri,” ujarnya.

Ia menguraikan enam pilar pendidikan menurut Imam Syafi’i—kecerdasan, semangat, kesungguhan, kecukupan ekonomi, kedekatan dengan guru, dan ketekunan waktu—namun menegaskan bahwa kebutuhan zaman menuntut lebih. “Pesantren harus masuk ke dunia digital, memperkuat ekonomi, dan membangun jejaring global,” tambahnya.

Prof. Hamzah mencontohkan keberhasilan muadalah As’adiyah yang diakui pemerintah Mesir dan terbukanya peluang pertukaran dosen serta mahasiswa melalui kerja sama internasional.

Sementara itu, Nurfadjri Fadeli Luran menegaskan bahwa transformasi manajemen pesantren kini menjadi kebutuhan mendesak. Dari total 42.000 pesantren dengan 6 juta santri, sebagian besar masih bertahan dengan pola pengelolaan tradisional sehingga sulit berkompetisi di tengah percepatan digital.

Ia menjelaskan perbedaan antara model pesantren tradisional dan pesantren modern, mulai dari struktur organisasi, adopsi teknologi, hingga tata kelola keuangan. “Transformasi bukan berarti menghapus tradisi. Keikhlasan, keberkahan, dan kejujuran tetap menjadi ruh pesantren. Yang berubah adalah kualitas tata kelolanya,” ujar Nurfadjri.

Transformasi menurutnya meliputi tiga dimensi, Struktur (penguatan organisasi dan kepemimpinan), Proses (penyusunan SOP, digitalisasi layanan, dan transparansi keuangan, serta Budaya (penguatan asrama sesuai UU Pesantren serta kolaborasi dengan alumni dan mitra global).

Halaqah ini menjadi ruang strategis untuk merumuskan arah baru transformasi pesantren Indonesia. Diskusi para pimpinan pesantren menegaskan bahwa perubahan tidak lagi dapat ditunda. Pesantren harus memastikan santri tidak hanya kuat secara spiritual, tetapi juga kompetitif di tingkat nasional maupun global.

Menutup acara, Dr. Basnang Said menyampaikan pesan tegas bahwa pesantren harus tetap kokoh pada tradisi, tetapi tidak boleh berjalan mundur dari zaman. Inilah saatnya pesantren menjadi pusat lahirnya pemimpin bangsa yang berilmu, berakhlak, dan berdaya saing.', 'Makassar — Pemerintah dalam hal ini Kementerian Agama menegaskan pentingnya transformasi tata kelola pesantren sebagai agenda strategis nasional. Penegasan tersebut disampaikan Direktur Pesantren,...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-28-at-13.53.43.jpeg', admin_user_id, 'PUBLISHED', 3363, '2025-11-28T07:03:51.000Z', '2025-11-28T07:03:51.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'negara-dorong-era-baru-transformasi-pesantren-santri-ditarget-lebih-mandiri-dan-kompetitif');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tq1uqdpwf', 'Transformasi Pesantren, Ulama Jawa Tengah Tekankan Rekognisi Alumni, Etika Teknologi, dan Penguatan Ruang Publik Santri', 'transformasi-pesantren-ulama-jawa-tengah-tekankan-rekognisi-alumni-etika-teknologi-dan-penguatan-ruang-publik-santri', 'Semarang — Transformasi besar dunia pesantren kembali mendapat penegasan dari para tokoh penting dalam ekosistem pesantren. Wakil Menteri Agama RI bersama KH. A. Fadhullah Turmudzi dan KH. Ubaidillah Shodaqoh menyampaikan arahan strategis mengenai masa depan pesantren, meliputi rekognisi alumni, penguatan kapasitas keilmuan, serta etika penggunaan teknologi dalam belajar.

Ketiga tokoh tersebut sepakat bahwa era baru pesantren menuntut penguatan tradisi, moral, dan kapasitas akademik, sekaligus kemampuan santri mengisi ruang digital dan ruang publik secara cerdas. Hal ini disampaikan saat Halaqah Pesantren Penguatan Kelembagaan Pendirian Direktorat Jenderal Pesantren di UIN Walisongo Semarang pada Rabu (26/11/2025).

Wakil Menteri Agama RI, H. Romo Muhammas Syafi''i kembali menegaskan bahwa berdirinya Direktorat Jenderal Pesantren merupakan momentum strategis yang harus dimanfaatkan untuk memperluas peran pesantren di tengah dinamika global saat ini. Menurutnya, pesantren memiliki modal tradisi intelektual yang kuat, tinggal didorong agar santri mampu tampil di berbagai sektor kehidupan modern.

“Pesantren adalah peradaban. Dengan Ditjen Pesantren, kita ingin melahirkan generasi yang menguasai agama sekaligus memimpin teknologi. Tradisi keilmuan harus berjalan seiring dengan inovasi,” ujar Wamenag.

Wamenag juga menekankan bahwa santri dan alumni pesantren harus menjadi bagian dari pembentukan opini publik, riset, dan pengambilan keputusan di berbagai bidang. Negara, kata Wamenag, memiliki kewajiban membuka ruang yang lebih besar agar alumni pesantren mengisi sektor-sektor strategis yang relevan dengan kapasitas keilmuannya.

Ketua Rabitah Ma''ahid Islami PWNU Jawa Tengah, KH. A. Fadhullah Turmudzi pentingnya rekognisi dan pengakuan terhadap alumni pesantren, terutama lulusan Ma’had Aly yang selama ini memiliki kapasitas keilmuan tinggi namun belum terserap optimal di ruang publik.

“Rekognisi terhadap alumni pesantren harus menjadi perhatian lebih. Selama ini belum maksimal. Alumni Ma’had Aly harus mengisi ruang publik sesuai kapasitas keilmuan. Kemenag harus memberi ruang dan fasilitas bagi mereka,” tegasnya.

Menurutnya, alumni pesantren tidak hanya siap berdakwah, tetapi juga berperan sebagai analis kebijakan, peneliti, konsultan syariah, pendidik publik, hingga fasilitator moderasi beragama. Karena itu, ia meminta Kemenag mendorong sistem penyetaraan, akses kerja, dan ruang aktualisasi yang lebih luas.

Dalam sesi berikutnya, KH. Ubaidillah Shodaqah selaku Rais Syuriah PWNU Jawa Tengah memberikan pandangan mendalam mengenai efek teknologi terhadap pembelajaran pesantren. Ia menegaskan bahwa kemudahan akses informasi harus disertai kedalaman adab dan kontrol moral.

“Sesuatu yang dicapai dengan mudah akan hilang dengan mudah. Teknologi membantu, tetapi jangan sampai membuat tumpul dan menghilangkan semangat dalam mengkaji,” pesan Mbah Ubed.

Ia menjelaskan, santri zaman dulu membutuhkan ketekunan tinggi untuk mencari satu referensi di kitab. Namun kini, aplikasi digital memungkinkan pencarian hanya dengan mengetik kata kunci. Kemudahan ini harus dimaknai sebagai alat bantu, bukan pengganti mujahadah.

Mbah Ubed menegaskan bahwa ruang digital harus diisi oleh suara pesantren. Santri, menurutnya, wajib mengambil bagian dalam produksi konten keislaman yang sehat, moderat, dan berakar pada tradisi keilmuan pesantren.

“Santri dan pesantren harus mengisi ruang digital dengan konten kepesantrenan. Jangan biarkan ruang itu kosong dan diisi pihak yang tidak memahami pesantren,” tegasnya.

Ia juga menyinggung tantangan baru berupa penggunaan Artificial Intelligence (AI) dalam belajar. Informasi yang terbuka harus tetap dibatasi oleh etika, maqashid syariah, dan bimbingan moral.

Menurut Mbah Ubed, tantangan terbesar saat ini bukan lagi akses pengetahuan, tetapi bagaimana menjaga moral, adab, dan tujuan belajar agar tidak melenceng dari nilai-nilai pesantren.

“Tugas kita hari ini adalah mengontrol moral. Ilmu bisa didapat di mana saja, tetapi adab dan bimbingan kyai tidak bisa digantikan,” ungkapnya.

Kementerian Agama menyambut pandangan para ulama tersebut sebagai langkah memperkuat Ditjen Pesantren dalam menyusun program rekognisi alumni, penguatan literasi digital, dan pengembangan ekosistem pembelajaran yang tetap menjaga adab, etika, dan integritas keilmuan pesantren.', 'Semarang — Transformasi besar dunia pesantren kembali mendapat penegasan dari para tokoh penting dalam ekosistem pesantren. Wakil Menteri Agama RI bersama KH. A. Fadhullah Turmudzi dan KH. Ubaidillah...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-27-at-14.37.501.jpeg', admin_user_id, 'PUBLISHED', 2846, '2025-11-27T10:16:35.000Z', '2025-11-27T10:16:35.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'transformasi-pesantren-ulama-jawa-tengah-tekankan-rekognisi-alumni-etika-teknologi-dan-penguatan-ruang-publik-santri');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2trsqvae6f', 'Halaqah Pesantren di UIN Malang : Momentum Penguatan Mutu dan Kemandirian Ditjen Pesantren', 'halaqah-pesantren-di-uin-malang-momentum-penguatan-mutu-dan-kemandirian-ditjen-pesantren', 'Malang (Pendis) — Gelaran Halaqah Penguatan Kelembagaan di UIN Maulana Malik Ibrahim Malang pada Senin (24/11/2025) menjadi salah satu rangkaian penting yang menegaskan komitmen berbagai pihak terhadap kemajuan pesantren di Indonesia. Dengan dukungan akademisi, pemerintah, dan komunitas pesantren, gagasan pembentukan Direktorat Jenderal Pesantren semakin mendapat legitimasi publik dan akademis.

Kegiatan yang dipusatkan di Aula Lantai 5 Gedung Rektorat UIN Maliki Malang menegaskan komitmen untuk meningkatkan mutu pendidikan Islam dan tata kelola pesantren di Indonesia. Salah satu langkah strategis yang ditempuh adalah penyelenggaraan Halaqah bekerja sama dengan Direktorat Jenderal Pesantren Kementerian Agama RI sebagai upaya memperkuat tata kelola pesantren yang mandiri, modern, dan berkelanjutan.

Rektor UIN Maliki Malang Ilfi Nur Diana menyampaikan bahwa penguatan tata kelola pesantren menjadi bagian penting dari peningkatan kualitas pendidikan Islam. “UIN Maliki Malang berkomitmen menjadi bagian dari transformasi pesantren agar semakin mandiri, adaptif, dan tetap menjaga nilai-nilai tradisi keilmuan Islam,” ujarnya.
Prof. Ilfi juga mengutip pernyataan Menteri Agama RI, Prof. Dr. KH. Nasruddin Umar, MA, bahwa pendirian Direktorat Jenderal Pesantren merupakan langkah strategis pemerintah untuk memperkuat tata kelola dan mutu pendidikan pesantren yang selama berabad-abad telah menjadi pilar peradaban Islam di Indonesia.

Pembentukan Ditjen Pesantren merupakan masa depan ekosistem pesantren sebagai pusat keilmuan, moderasi beragama, pemberdayaan masyarakat, dan penjaga peradaban Islam dan mendorong transformasi tata kelola pesantren di Indonesia, tambahnya.

Tenaga Ahli Menteri Agama Bidang Hukum, Hak Asasi Manusia dan Kerukunan Umat Beragama, Prof. Andi Salman Manggalatung, menegaskan bahwa pembentukan Direktorat Jenderal Pesantren merupakan langkah strategis negara dalam memperkuat peran pesantren sebagai pilar peradaban Islam Indonesia.

Dalam kesempatan menghadiri Halaqah Penguatan Kelembagaan Pesantren di UIN Maulana Malik Ibrahim Malang, Andi Salman menyatakan bahwa pesantren telah menjadi basis pendidikan dan pemberdayaan masyarakat selama berabad-abad, sehingga diperlukan tata kelola yang lebih terstruktur, modern, dan responsif terhadap dinamika zaman.

“Pembentukan Ditjen Pesantren bukan sekadar perubahan struktur birokrasi, tetapi tonggak penting yang mengakui peran historis dan masa depan pesantren. Negara ingin hadir lebih kuat untuk memastikan pesantren semakin mandiri, berkualitas, dan mampu beradaptasi dengan tantangan global tanpa kehilangan jati diri keilmuan Islam,” ucapnya.

Kegiatan ini dihadiri para pimpinan pesantren, ulama, akademisi, dan para pemangku kebijakan pendidikan Islam dari wilayah Malang dan berbagai daerah di Jawa Timur turut diundang. Keterlibatan mereka menjadi wujud nyata sinergi UIN Malang dengan pesantren sebagai pusat pendidikan Islam berkelanjutan.

Halaqah ini diharapkan menjadi wadah strategis untuk membangun kolaborasi, memperkuat kapasitas kelembagaan pesantren, serta merumuskan arah kebijakan bersama untuk mendorong kemandirian pesantren dalam menghadapi tantangan zaman.

Hadir sebagai narasumber Prof. Dr. KH. Asep Saifuddin Chalim, MA (Pimpinan PP Amanatul Ummah, Mojokerto), Prof. Dr. KH. Ali Masykur Musa, M.Si., M.Hum (Mudir Aly JATMAN) dan Prof. Dr. H.M. Zainuddin, MA (Guru Besar UIN Maulana Malik Ibrahim Malang).', 'Malang (Pendis) — Gelaran Halaqah Penguatan Kelembagaan di UIN Maulana Malik Ibrahim Malang pada Senin (24/11/2025) menjadi salah satu rangkaian penting yang menegaskan komitmen berbagai pihak...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-25-at-05.31.02.jpeg', admin_user_id, 'PUBLISHED', 1527, '2025-11-25T06:17:45.000Z', '2025-11-25T06:17:45.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'halaqah-pesantren-di-uin-malang-momentum-penguatan-mutu-dan-kemandirian-ditjen-pesantren');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2txdd1kunh', 'Harmonisasi Tradisi dan Modernitas Warnai Gagasan Penguatan Pesantren di Sumatera Barat', 'harmonisasi-tradisi-dan-modernitas-warnai-gagasan-penguatan-pesantren-di-sumatera-barat', 'Padang – Upaya pemerintah memperkuat ekosistem pendidikan Islam melalui pembentukan Direktorat Jenderal Pesantren mendapat respons kuat dari para tokoh pesantren dan akademisi Sumatera Barat. Dalam Halaqah Penguatan Kelembagaan Pesantren yang digelar di UIN Imam Bonjol Padang, Senin (24/11), para narasumber menegaskan perlunya menjaga tradisi pesantren yang berakar pada nilai-nilai surau sekaligus mendorong modernisasi agar pesantren mampu bersaing di tingkat global. Kegiatan ini diikuti sekitar 150 perwakilan pesantren se-Sumatera Barat.

Staf Khusus Menteri Agama Bidang Kerukunan Umat Beragama, Pengawasan, dan Kerja Sama Luar Negeri, Gugun Gumilar, membuka halaqah dengan penegasan bahwa pesantren adalah pusat ilmu sekaligus pusat peradaban yang membentuk karakter bangsa. Menurutnya, kehadiran negara melalui Ditjen Pesantren merupakan langkah strategis dalam memperkuat peran pesantren pada level nasional maupun internasional.

“Ulama telah meletakkan fondasi bangsa sejak masa perjuangan. Negara kini berkewajiban hadir lebih kuat, dan pembentukan Ditjen Pesantren adalah momentum penting untuk menata ulang ekosistem pendidikan Islam,” ujar Gugun.

Ia memaparkan bahwa masa depan pesantren harus dibangun di atas tiga fondasi utama: ontologi pesantren sebagai institusi pendidikan paling autentik, epistemologi sebagai pusat ilmu keislaman yang berkontribusi global, dan aksiologi sebagai social capital yang manfaatnya diakui dunia. Modernisasi kurikulum, penguatan bahasa asing, dan ruang riset bagi santri menjadi syarat agar pesantren dapat berkompetisi di era global.

KH. Moch. Chozein Adnan, Rois Syuriah PWNU Sumatera Barat menyebut lahirnya Ditjen Pesantren sebagai “hadiah negara” yang sudah lama dinantikan para kiai dan lembaga pesantren. Namun ia mengingatkan bahwa kemandirian pesantren adalah identitas yang tidak boleh hilang. Bantuan dan regulasi pemerintah harus menjadi stimulan, bukan intervensi yang mengubah tradisi dan otoritas pengajaran di pesantren.

Ia menekankan pentingnya sinergi ulama dan umara dalam mengawal agenda besar ini. Administrasi, katanya, tidak boleh menghambat inti pendidikan. PWNU Sumbar siap mengawal agar program-program seperti Dana Abadi Pesantren tersalurkan merata hingga ke pelosok, bukan hanya kepada pesantren yang dekat pusat kekuasaan.

Prof. Dr. Duski Samad, Guru Besar UIN Imam Bonjol &amp; Tokoh Adat, menegaskan bahwa pesantren Sumbar harus berjalan dalam dua jalur: menjaga ruh surau sebagai jati diri pendidikan Minangkabau, dan pada saat yang sama membuka diri terhadap modernitas. Transformasi metodologis melalui riset, literasi digital, dan manajemen modern harus menjadi agenda baru pesantren.

Ia juga menegaskan pentingnya kerja sama kampus–pesantren. UIN Imam Bonjol, katanya, siap menjadi mitra strategis untuk meningkatkan standar tata kelola dan kapasitas pengajar, sehingga lulusan pesantren memiliki civil effect dan daya saing yang setara dengan lulusan lembaga pendidikan umum.

Rektor UIN Imam Bonjol Padang, Martin Kustati, menyatakan bahwa pesantren merupakan lumbung peradaban Minangkabau yang bertumbuh dari tradisi surau. UIN IB, katanya, siap menjadi “rumah gadang akademik” bagi seluruh pesantren Sumbar dalam memperkuat kolaborasi keilmuan dan pengembangan SDM.

Mewakili Direktorat Pesantren dan Ditjen Pendidikan Islam, Yusi Damayanti menegaskan bahwa pembentukan Ditjen Pesantren menjadi kebutuhan mendesak guna mengintegrasikan trifungsi pesantren: pendidikan, dakwah, dan pemberdayaan masyarakat. Ia menyampaikan bahwa pemerintah telah menunjukkan komitmen kuat melalui Hari Santri, Undang-Undang Pesantren, Keppres Pendanaan Pesantren, serta pelibatan pesantren dalam program nasional seperti Makan Bergizi Gratis dan Cek Kesehatan Gratis.

Halaqah yang berlangsung di 14 PTKIN ini menjadi ruang konsolidasi penting untuk menyatukan visi pengembangan pesantren nasional. Dengan harmonisasi tradisi dan modernitas, pesantren diharapkan mampu melompat ke era baru tanpa kehilangan identitasnya sebagai pilar peradaban Nusantara.', 'Padang – Upaya pemerintah memperkuat ekosistem pendidikan Islam melalui pembentukan Direktorat Jenderal Pesantren mendapat respons kuat dari para tokoh pesantren dan akademisi Sumatera Barat. Dalam...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-25-at-13.08.21.jpeg', admin_user_id, 'PUBLISHED', 5431, '2025-11-25T06:09:31.000Z', '2025-11-25T06:09:31.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'harmonisasi-tradisi-dan-modernitas-warnai-gagasan-penguatan-pesantren-di-sumatera-barat');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tl7r3qxat', 'Kemenag Dorong Asosiasi Prodi Manajemen Pendidikan Islam se-Indonesia Manfaatkan Layanan Beasiswa dan Riset Kolaboratif', 'kemenag-dorong-asosiasi-prodi-manajemen-pendidikan-islam-se-indonesia-manfaatkan-layanan-beasiswa-dan-riset-kolaboratif', 'Tangerang Selatan — Kementerian Agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA), Sekretariat Jenderal mendorong agar para civitas akademika Prodi Manajemen Pendidikan Islam se-Indonesia memanfaatkan Layanan Beasiswa dan Riset Kolaboratif.

“Layanan beasiswa menjadi piranti penting untuk meningkatkan kualitas dosen, tenaga kependidikan sekaligus para kader yang notabenenya mahasiswa program studi Manajemen Pendidikan Islam serta alumninya”, kata Kepala PUSPENMA saat menjadi Keynote Spaker, “Pengembangan SDM MPI Melalui Layanan Beasiswa dan MoRA The Air Funds”, pada Temu Tahunan Perkumpulan Program Studi Manajemen Pendidikan Islam (PPMPI) Indonesia, Kamis (19/11/2025) di Tangerang Selatan.

Kementerian Agama bekerjasama dengan Lembaga Pengelola Dana Pendidikan (LPDP) melayani beasiswa S1, S2 dan S3 di Dalam dan Luar Negeri. “Para lulusan MA/SMA/SMK/Diniyyah Ulya dapat dijaring masuk Prodi MPI untuk studi dengan beasiswa full scholarship, sebagai wahana kaderisasi para cendekiawan bidang manajemen Pendidikan Islam”, kata Ruchman.

Dihadapan kurang lebih 100 peserta Temu Tahunan Alumni IAIN Walisongo juga menerangkan bahwa Prodi MPI yang sudah akreditasi Unggul/A maka bisa menjadi destinasi bagi Awardee yang memilih MPI.

Sebagaimana diketahui sejak tahun 2022 sampai 2025 PUSPENMA Kemenag telah menyalurkan Beasiswa Indonesia Bangkit (BIB) kepada kurang lebih 7.800 Awardee yang tersebar di sejumlah negara dan PT Terbaik di Dalam Negeri, beberapa diantaranya juga yang mengmabil program S1, S2 dan S3 Manajemen Pendidikan Islam.

PPMPI, menggelar Temu Tahunan sebagai forum untuk merumuskan arah, kebijakan dan program-program perkumpulan. Pada Temu Tahunan PPMPI untuk kali ke 12 ini, dijadikan sebagai ajang suksesi kepemimpinan PPMPI periode ke-3. Tiga periode kepengurusan sebelumnya, Periode Pertama 2017 – 2021, suksesi di gelar di Banda Aceh, Periode Kedua 2021 -2025 di Surabaya, dan Periode Ketiga tahun 2025 - 2029 di gelar di Jakarta.

Hal lain yang dikatakan Ruchman adalah perlunya para dosen MPI se-Indonesia memanfaatkan dana penelitian kolaboratif, MoRA The Air Funds untuk melakukan riset-riset yang bermutu termasuk riset kebijakan mengenai mpengembangan keilmuan MPI dan kebijakan terkait.

Dihadapan para peserta temu tahunan yang juga para Guru Besar, Kaprodi, Sekprodi, dan Dosen MPI se-Indonesia Ruchman Basori meminta agar Perkumpulan MPI menjadi katalisator antara Kemenag dengan para Dosen MPI se-Indnesia dalam memanfaatkan MoRA The Air Funds dan Beasiswa BIB.

Saat ini Kemenag menerima amanah dari LPDP untuk mengelola anggaran riset MoRA The Air Funds tiap tahun dalam tiga tahun terakhir (2024-2026) ini, masing-masing 50 milyard. “Dosen MPI harus berada di garda terdepan melakukan riset yang berdampak bagi pembangunan Indonesia”, kata Mantan Aktivis Mahasiswa 1998 ini.

UIN Syarif Hidayatullah Jakarta didapuk sebagai tuan rumah Temu Nasional PPMPI ke 12. Dekan FITK UIN Jakarta Prof. Dr. Siti Nurul Azkiya, M.Pd menyambut baik gelaran tahunan ini dan akan mensupport pengembangan prodi MPI.

“UIN Jakarta bangga mendapat kehormatan menjadi tuan rumah temu tahunan PPMPI, semoga menghasilkan pemikiran-pemikiran produktif dan strtegis untuk pengembangan MPI di masa depan”, kata Azky.

Sementara Ketua Umum PPMPI Dr. Sri Rahmi, M.A mengatakan MPI secara nasional semakin lama semakin eksis, menjadi tempat terbaik bagi para dosen MPI untuk berkumpul dan berkolaborasi. “Kita harus optimis, beberapa anggota Perkumpulan sudah banyaj kiprahnya di sektor public dan menjadi pejabat-pejabat di kampus, bahkan ada yang menjadi Rektor UIN”, kata Sri Rahmi.

Sampai berita ini diturunkan, Dr. Sri Rahmi, M.A juga terpilih kembali sebagai Ketua Umum PPMPI Periode 2025-2029, Dr. Zainal Arifin, M.Si sebagai Sekretaris Jenderal dan Dr. Febi Ismail, M.Pd sebagai Bendahara Umum. (Humas Puspenma/Ulfah)', 'Tangerang Selatan — Kementerian Agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA), Sekretariat Jenderal mendorong agar para civitas akademika Prodi Manajemen...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-23-at-13.55.17.jpeg', admin_user_id, 'PUBLISHED', 2892, '2025-11-23T07:01:23.000Z', '2025-11-23T07:01:23.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-dorong-asosiasi-prodi-manajemen-pendidikan-islam-se-indonesia-manfaatkan-layanan-beasiswa-dan-riset-kolaboratif');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t3t5nyn28', 'Menag Dapat Anugerah Penggerak Nusantara 2025 Bidang Harmoni dan Ekoteologi', 'menag-dapat-anugerah-penggerak-nusantara-2025-bidang-harmoni-dan-ekoteologi', 'Menteri Agama Nasaruddin Umar mendapat Anugerah Penggerak Nusantara 2025 di bidang Harmoni dan Ekoteologi. Penghargaan ini diberikan pada Malam Anugerah Penggerak Nusantara yang digelar iNewsTV.

Penghargaan diterima langsung oleh Menteri Agama Nasaruddin Umar. Hadir mendampingi, Staf Khusus Menag bidang Pengambangan SDM dan Media Ismail Cawidu, Staff Khusus Menag bidang Kerukunan dn Layanan Keagamaan, Pengawasan dan Kerjasama Luar Negeri Gugun Gumilar, serta Kepala Biro Humas dan Komunikasi Publik Thobib Al Asyhar.

Menag menyampaikan ucapan terima kasih kepada CEO MNC Corp, khususnya kepada iNewsTv atas penghargaan ini. “Anugerah ini menunjukkan tingginya perhatian iNewsTV terhadap program-program Kementerian Agama," terang Menag di Jakarta, Kamis (20/11/2025).

Menurut Menag, Kementerian Agama dalam satu tahun terakhir menggulirkan trilogi kerukunan jilid II. Kalau jilid I mencakup kerukunan intra umat, antar umat, dan antar umat dengan pemerintah, trilogi kerukunan jilid II diperluas hingga mencakup aspek kerukunan antar manusia, harmoni alam, dan hubungan spiritual dengan Tuhan.

“Trilogi Kerukunan Jilid II, menjadi ikhtiar Kementerian Agama menyukseskan asta cita presiden yang terkait dengan harmoni lingkungan dan toleransi antar umat,” sebut Menag.

“Untuk itu pula kami menggulirkan program penguatan ekoteologi yang menitikberatkan pada aksi iklim untuk mencegah kerusakan alam yang berangkat dari pemahaman keagamaan,” sambungnya.

Menurut Menag, kerukunan adalah pra syarat pembangunan. Kondisi bangsa Indonesia yang rukun dalam keragaman patut disyukuri di tengah konflik yang terus melanda sebagian negara. Dalam kondisi rukun, pembangunan yang dicanangkan Presiden berjalan lancar.

“Kita bersyukur, keberhasilan dalam merawat kerukunan menjadi capaian tertinggi kinerja satu tahun Presiden Prabowo berdasarkan survey poltracking yang dirilis Oktober 2025,” sebutnya.

Terkait ekoteologi, Menag mengatakan bahwa menjaga kelestarian alam adalah ajaran agama. Dalam Islam, umat muslim bahkan diajarkan untuk terus menanam pohon, meski esok hari kiamat tiba. Ajaran ini menunjukkan pentingnya merawat semesta.

“Kemenag telah menerbitkan buku Ekoteologi: Mengamalkan Iman, Melestarikan Lingkungan. Buku ini akan menjadi panduan dalam perumusan program, kegiatan dan strategi pelestarian lingkungan berbasiskan iman,” tegasnya.

“Penghargaan ini saya dedikasikan kepada seluruh keluarga besar Kementerian Agama. Semoga ini menjadi motivasi bersama untuk terus merawat kerukunan umat dan harmoni semesta,” tandasnya.

Humas dan Komunikasi Publik', 'Menteri Agama Nasaruddin Umar mendapat Anugerah Penggerak Nusantara 2025 di bidang Harmoni dan Ekoteologi. Penghargaan ini diberikan pada Malam Anugerah Penggerak Nusantara yang digelar iNewsTV....', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-23-at-13.44.07.jpeg', admin_user_id, 'PUBLISHED', 4228, '2025-11-23T06:48:29.000Z', '2025-11-23T06:48:29.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'menag-dapat-anugerah-penggerak-nusantara-2025-bidang-harmoni-dan-ekoteologi');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t8owt4n41', 'Gagas Intelektualisasi Santri, Pesantren Didorong Lahirkan Generasi Berwawasan Luas dan Adaptif', 'gagas-intelektualisasi-santri-pesantren-didorong-lahirkan-generasi-berwawasan-luas-dan-adaptif', 'Palembang – Gagasan besar tentang Intelektualisasi Santri mengemuka kuat dalam Halaqoh Penguatan Kelembagaan Pendirian Direktorat Jenderal Pesantren Kementerian Agama RI yang digelar di Auditorium Lantai 4 Gedung Perpustakaan UIN Raden Fatah Palembang, Kampus Jakabaring, Jum’at (21/11/2025). UIN Raden Fatah menjadi tuan rumah bagi forum strategis yang mempertemukan pemangku kebijakan nasional dan para pimpinan pesantren dari berbagai daerah.

Wakil Menteri Agama RI, Dr. KH. Romo R. Muhammad Syafi’i, S.H., M.Hum, menegaskan bahwa pesantren sejak lama menjadi pusat gerakan moral bangsa. Namun di tengah perubahan zaman, pesantren kini memikul mandat ganda: menjaga tradisi keilmuan Islam sekaligus melahirkan generasi yang unggul dalam sains, teknologi, ekonomi, kedokteran, serta disiplin ilmu kontemporer lainnya.

“Memandang pesantren berarti memandang Indonesia. Pesantren bukan hanya akar sejarah, tetapi juga pintu masa depan. Santri tidak boleh berhenti pada fiqh saja; mereka harus merambah teknologi, ilmu kedokteran, ekonomi, dan seluruh cabang pengetahuan modern,” tegas Romo.

Rektor UIN Raden Fatah Palembang, Prof. Dr. Muhammad Adil, MA, turut memperkuat visi tersebut. Ia menekankan bahwa pesantren merupakan lembaga yang paling konsisten menjalankan tiga amanah besar dalam Undang-Undang Pesantren. Tradisi penguasaan kitab kuning menjadi fondasi epistemologis yang memungkinkan pesantren melakukan sintesis kreatif antara nilai klasik dengan dinamika pengetahuan modern.

“Pesantren bukan sekadar lembaga pendidikan, tetapi sebuah tradisi intelektual yang panjang. Konsistensi dalam mengaji kitab kuning justru menjadi modal besar untuk mengembangkan gagasan Intelektualisasi Santri,” ungkapnya.

Direktur Pesantren, Dr. Basnang Said, memaparkan perjalanan panjang perjuangan menghadirkan struktur kelembagaan khusus bagi pesantren. Sejak era Presiden Abdurrahman Wahid (Gus Dur), santri mulai mendapatkan rekognisi melalui program kesetaraan Paket A, B, dan C. Kebijakan ini memperluas akses mobilitas sosial santri.

“Program kesetaraan membuka jalan bagi santri untuk berkiprah di lembaga negara, jabatan publik, hingga ruang politik. Ini bagian penting dari upaya membangun generasi santri berpengetahuan luas dan adaptif pada skala nasional maupun global,” jelasnya.

Forum halaqoh ini menghadirkan tiga tokoh pesantren yang menyampaikan gagasan strategis tentang arah pengembangan pesantren masa depan.

<strong>Manajemen Pesantren Modern &amp; Pendidikan Islam Terapan</strong>

Pimpinan Pondok Pesantren Muhajirin, Prof. Dr. Muhajirin, M.Ag, menegaskan bahwa pesantren adalah lembaga pendidikan tertua di Nusantara yang telah melahirkan ulama, intelektual, dan pejuang bangsa. Namun secara regulatif, pesantren baru memperoleh pengakuan terbatas.

Ia menyoroti perlunya regulasi yang setara dengan pendidikan negeri, status dan sertifikasi guru pesantren, arah kelembagaan yang jelas dan tidak “liar”, serta manajemen pendidikan terapan yang modern.

Menurutnya, pesantren modern harus berbasis iman, kuat dalam disiplin ilmu, relevan dengan perkembangan zaman, tidak tabu pada teknologi, dan memiliki pembinaan reflektif bagi santri.

<strong>Penguatan Kitab Kuning sebagai Kurikulum Inti Pesantren</strong>

Pengasuh Ponpes Sabilul Hasanah, Dr. Ubaidillah Luai, M.Pd.I, menekankan bahwa kitab kuning tidak hanya warisan intelektual, tetapi juga “tulang punggung” kurikulum pesantren. Ia menggarisbawahi dua agenda besar yaitu Revitalisasi tradisi klasik yang relevan, dan pembaharuan untuk menjawab isu kontemporer seperti ekonomi, pendidikan, dan teknologi.

Ia memetakan tantangan nyata pesantren, mulai dari kompetensi bahasa Arab, metode pembelajaran yang konvensional, keterbatasan guru ahli, hingga minimnya integrasi teknologi.

Solusi yang ia tawarkan antara lain perlunya penguatan metode sorogan-bandongan modern, pelatihan guru, digitalisasi kitab, kurikulum integratif, dan pembentukan kultur akademik santri.

<strong>Transformasi Pesantren Salafiyah dan Model Pesantren Kurikulum</strong>

Pendiri &amp; Pengasuh Ponpes Nurul Huda Sukaraja, KH. Affandi, BA, memaparkan pengalaman Pesantren Nurul Huda Sukaraja dalam membangun Pesantren Kurikulum, yaitu integrasi antara pengajian kitab kuning dan pendidikan formal sejak 1980. Model ini berhasil menjadi ekosistem pendidikan yang melahirkan lembaga-lembaga dari jenjang dasar hingga universitas.

Ia menekankan tiga prinsip besar yaitu Allah sebagai sumber ilmu, keistimewaan pengajian kitab kuning, dan fungsi sosial pesantren dalam membina masyarakat transmigran Jawa.

Menurutnya, pesantren harus mampu menjadi ruang pendidikan transformatif yang meningkatkan solidaritas sekaligus mobilitas sosial masyarakat.

Dari keseluruhan diskursus, menguat sebuah kesadaran kolektif bahwa pesantren tidak hanya benteng moral bangsa, tetapi juga pusat lahirnya generasi pemikir, inovator, dan ilmuwan masa depan. Intelektualisasi Santri menjadi agenda strategis yang menuntut kolaborasi serius antara pemerintah, pesantren, perguruan tinggi, dan masyarakat.

Pesantren kini diposisikan bukan hanya sebagai penjaga tradisi, tetapi juga sebagai laboratorium peradaban—tempat lahirnya generasi yang memadukan kedalaman spiritual dengan keluasan pengetahuan modern, siap berkontribusi dalam lanskap global yang terus berubah.', 'Palembang – Gagasan besar tentang Intelektualisasi Santri mengemuka kuat dalam Halaqoh Penguatan Kelembagaan Pendirian Direktorat Jenderal Pesantren Kementerian Agama RI yang digelar di Auditorium...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-23-at-13.28.44.jpeg', admin_user_id, 'PUBLISHED', 3508, '2025-11-23T06:36:44.000Z', '2025-11-23T06:36:44.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'gagas-intelektualisasi-santri-pesantren-didorong-lahirkan-generasi-berwawasan-luas-dan-adaptif');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2txv1cval9', 'British Council dan Kementerian Agama Perkuat Hubungan Melalui Kolaborasi di Bidang Pendidikan dan Kerukunan Antarumat Beragama', 'british-council-dan-kementerian-agama-perkuat-hubungan-melalui-kolaborasi-di-bidang-pendidikan-dan-kerukunan-antarumat-beragama', 'Jakarta (Pendis) – British Council dan Kementerian Agama Republik Indonesia (Kemenag) memperkuat kolaborasi mereka melalui penandatanganan Nota Kesepahaman (MoU) untuk meningkatkan pengajaran Bahasa Inggris dan memperluas akses terhadap peluang pendidikan internasional. Penandatanganan ini dilakukan dalam acara Forum Pendidikan UK–Kemenag: Connecting Opportunities, Creating Impact, yang diselenggarakan di Jakarta, Senin (20/11/2025).

“MoU yang kita tanda tangani hari ini bukan sekadar perjanjian formal. Dokumen ini mencerminkan keyakinan kolektif bahwa peningkatan kualitas guru, peningkatan peluang global, dan penguatan lembaga pendidikan merupakan hal yang esensial untuk mewujudkan visi Kementerian, yaitu Maju, Bermutu, Mendunia. Ini adalah tujuan yang ambisius, dan pencapaiannya membutuhkan kemitraan internasional yang kuat. Karena itu, kami berterima kasih kepada Pemerintah Britania Raya, melalui British Council, yang terus mendampingi kami dalam perjalanan ini,” Sekretaris Jenderal Kementerian Agama Republik Indonesia, Kamaruddin Amin dalam sambutannya.

Lebih lanjut Sekjen mengatakan bahwa Kemenag mengapresiasi kontribusi nyata dari British Council, termasuk program Pengembangan Keprofesian Berkelanjutan secara daring bagi 720 guru bahasa Inggris di Madrasah Tsanawiyah dan Madrasah Aliyah, sekaligus dukungan Pemerintah Britania Raya dalam mempromosikan peluang beasiswa internasional seperti Chevening Scholarship, yang terus membuka jalan bagi para pelajar dan calon pemimpin Indonesia untuk berkiprah di dunia global.”ucapnya.

Menurutnya, MoU ini memformalkan kerja sama yang telah dijalankan antara British Council dan Kemenag selama beberapa tahun terakhir, serta mencerminkan komitmen bersama antara Inggris Raya dan Indonesia dalam memajukan pengembangan sumber daya manusia melalui pendidikan, peningkatan kapasitas, dan kolaborasi lintas budaya sebagai bagian dari inisiatif ini, sebanyak 720 guru Bahasa Inggris dari Madrasah Tsanawiyah dan Madrasah Aliyah di seluruh Indonesia akan mengikuti pelatihan pengembangan profesional di bawah program “Continuing Professional Development (CPD) for Madrasah English Teachers” (Pengembangan Keprofesian Berkelanjutan (PKB) Guru Bahasa Inggris Madrasah).

Disampaikan Summer Xia, Direktur British Council Indonesia dan Direktur British Council untuk Asia Tenggara, mengatakan “Guru yang hebat lebih dari sekadar mengajar, mereka membuka pintu menuju dunia. Dan bahasa sering kali menjadi kunci yang membuka pintu tersebut. Melalui kemitraan dengan Kementerian Agama, kami bertujuan membekali para guru madrasah dengan keterampilan dan kepercayaan diri untuk menginspirasi siswa mereka agar berani bermimpi tanpa batas. Sebagai organisasi Inggris untuk hubungan kebudayaan dan pendidikan, British Council bangga mendukung Indonesia dalam membentuk generasi yang terhubung secara global, berpikiran terbuka, dan siap menjadi pemimpin masa depan.”ungkapnya.

Melalui kemitraan ini, British Council dan Kemenag berupaya meningkatkan kualitas pengajaran Bahasa Inggris di jaringan madrasah di seluruh Indonesia, menciptakan jalur bagi guru dan siswa untuk berinteraksi di tingkat internasional dan membangun kompetensi global. Kolaborasi ini sejalan dengan agenda reformasi pendidikan Indonesia dan komitmen Inggris untuk mendukung pengembangan sumber daya manusia yang inklusif dan berkelanjutan, tambahnya.

Duta Besar Inggris untuk Indonesia, Dominic Jermey, menambahkan:
“Saya sangat senang menyaksikan penandatanganan Nota Kesepahaman antara British Council dan Kementerian Agama Republik Indonesia. Kemitraan ini merupakan langkah penting dalam memperkuat hubungan pendidikan, kolaborasi antaragama dan mendorong pemahaman bersama antara kedua negara kita. Dengan meningkatkan pengajaran bahasa Inggris dan memperluas akses terhadap kesempatan pendidikan internasional, kita memberdayakan para pendidik dan siswa untuk berkembang dalam dunia yang semakin global.

Pendidikan adalah salah satu pilar utama di dalam Kemitraan Strategis Inggris–Indonesia yang akan ditandatangani oleh Presiden Prabowo dan Perdana Menteri Sir Keir Starmer awal tahun depan, dan perjanjian hari ini mencerminkan komitmen bersama kita untuk membangun lingkungan belajar yang inklusif dan berkualitas tinggi, yang membuka pintu bagi generasi mendatang. Inggris bangga mendukung visi Indonesia dalam memajukan pendidikan dan mempromosikan dialog lintas budaya. Bersama, kita akan terus menciptakan peluang yang memperkaya kehidupan dan mempererat hubungan antara masyarakat kedua negara. Diplomasi, Kolaborasi, Prestasi!”

Turut hadir Sekretaris Jenderal Kemenag RI, Kamaruddin Amin, Dominic Jermey, Duta Besar Inggris untuk Indonesia; Summer Xia, Direktur British Council untuk Indonesia dan Asia Tenggara, Sekretaris Ditjen Pendidikan Islams, M. Arskal Salim GP, Direktur Perguruan Tinggi Keagamaan Islam, Sahiron beserta jajaran terkait.', 'Jakarta (Pendis) – British Council dan Kementerian Agama Republik Indonesia (Kemenag) memperkuat kolaborasi mereka melalui penandatanganan Nota Kesepahaman (MoU) untuk meningkatkan pengajaran Bahasa...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-23-at-13.20.23.jpeg', admin_user_id, 'PUBLISHED', 1698, '2025-11-23T06:22:29.000Z', '2025-11-23T06:22:29.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'british-council-dan-kementerian-agama-perkuat-hubungan-melalui-kolaborasi-di-bidang-pendidikan-dan-kerukunan-antarumat-beragama');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tpjmpqth0', 'Majelis Taklim Datokarama Menggelar Haul Ke-21 KH. Mansyur Muchtar Perintis FDKI UIN Palu', 'majelis-taklim-datokarama-menggelar-haul-ke-21-kh-mansyur-muchtar-perintis-fdki-uin-palu', 'Palu — Haul ke-21 dan doa untuk perintis Fakultas Dakwah UIN Datokarama Palu, almarhum Drs. KH. Mansyur Muchtar, digelar khidmat dalam Rutinan Majelis Taklim Datokarama pada Minggu (16/11/2025). Kegiatan tersebut berlangsung di Kedai Taman Ria, Jalan Diponegoro, Kecamatan Palu Barat, mulai pukul 19.00 Wita hingga selesai.

Acara diawali dengan pembacaan tahlil dan doa untuk almarhum, dilanjutkan dengan Maulid, ceramah agama oleh Da’i Cilik An Naqib dan Wakil Dekan I FDKI, Mokh Ulil Hidayat S.Ag., M.Fil.I, serta pembacaan manaqib atau riwayat singkat KH. Mansyur Muchtar.

Dalam ceramahnya, Ulil menceritakan bagaimana almarhum dikenal sebagai sosok yang memiliki semangat dakwah yang tinggi, termasuk dalam hal menanam pohon. Ia menuturkan bahwa almarhum pernah mengajarkan pada mereka terkait pentingnya menanam pohon yang manfaatnya dapat dirasakan tidak hanya oleh manusia, tetapi juga oleh makhluk lain.

“Beliau mengajarkan untuk menanam pohon yang tidak hanya berguna untuk manusia, tetapi juga bermanfaat untuk makhluk lainnya, seperti menjadi tempat tinggal burung,” ujar Ulil. Dari kisah tersebut, ia menyimpulkan bahwa almarhum memiliki nilai-nilai kepahlawanan dalam diri beliau yang tercermin melalui dedikasinya dalam berdakwah dan memberi manfaat seluas-luasnya.

Nilai-nilai tersebut juga ditegaskan dalam pembacaan manaqib yang dibawakan oleh Defan Muhammad. Dalam riwayat singkat tersebut, almarhum digambarkan sebagai sosok disiplin, religius, sederhana, serta memiliki kontribusi besar dalam dunia dakwah dan pendidikan Islam. Ketegasan dan dedikasinya dalam membangun jurusan Dakwah menjadikan KH. Mansyur Muchtar dihormati baik oleh masyarakat, keluarga, maupun lingkungan akademik.

Kegiatan ini turut dihadiri Dekan FDKI Dr. Adam M.Pd., M.Si, jajaran pimpinan fakultas, Wakil Ketua KPID Sulteng Muhammad Ramadhan Taher S.Pd., M.Sos, serta keluarga almarhum. Salah satu putri KH. Mansyur Muchtar, Dr. Sri Dewi Lisnawaty S.Ag., M.Si, yang juga dosen FTIK UIN Datokarama Palu, menyampaikan sekapur sirih atau sambutan dalam kesempatan tersebut.

“Dalam profesi apa pun, kita jangan pernah lupa menjadi pendakwah. Dakwah bukan hanya tugas ustaz atau ustazah, tetapi kewajiban semua umat. Rasulullah bersabda, ''sampaikanlah dariku walau satu ayat.'' Itu yang harus menjadi motivasi kita,” ujarnya dalam sambutan.

Sambutan penutup disampaikan oleh Dekan FDKI, Dr. Adam, yang menegaskan komitmennya terhadap penguatan fakultas. “Saya ingin fakultas ini menjadi fakultas yang kuat. Tidak pernah saya tinggalkan,” katanya.

Ia juga menegaskan pentingnya kesungguhan seluruh civitas akademika dalam membangun Fakultas Dakwah. Adam meminta mahasiswa untuk menjaga jati diri sebagai bagian dari FDKI dan tampil sebagai contoh bagi yang lain.

“Mahasiswa Dakwah memiliki identitas dan harus menjadi teladan. Dari sisi penampilan, mahasiswi harus memakai rok dan pakaian yang menutupi lekuk tubuh. Tidak boleh ada mahasiswi FDKI yang mengenakan celana, karena kita adalah Fakultas Dakwah,” dikutip dari Adam dalam sambutannya

Kegiatan rutinan tersebut ditutup dengan perayaan hari lahir AKBP Muhammad Ilham SH., S.IK., MH, salah satu putra almarhum KH. Mansyur Muchtar.', 'Palu — Haul ke-21 dan doa untuk perintis Fakultas Dakwah UIN Datokarama Palu, almarhum Drs. KH. Mansyur Muchtar, digelar khidmat dalam Rutinan Majelis Taklim Datokarama pada Minggu (16/11/2025)....', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-21-at-19.32.16.jpeg', admin_user_id, 'PUBLISHED', 5206, '2025-11-21T14:51:16.000Z', '2025-11-21T14:51:16.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'majelis-taklim-datokarama-menggelar-haul-ke-21-kh-mansyur-muchtar-perintis-fdki-uin-palu');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t0e9fawlf', 'Menag Dorong Kajian Ontologi Pendidikan sebagai Rumusan Arah Baru Pesantren', 'menag-dorong-kajian-ontologi-pendidikan-sebagai-rumusan-arah-baru-pesantren', 'andung — Menteri Agama Nasaruddin Umar menegaskan perlunya perumusan yang komprehensif sebelum Direktorat Jenderal Pesantren resmi berjalan sebagai satuan kerja Eselon I di Kementerian Agama. Ia menekankan bahwa fondasi konseptual lembaga baru ini harus dibangun melalui kajian ontologis tiga arus besar pendidikan: sekuler, pendidikan Islam, dan pendidikan pesantren.

Dalam pidato kuncinya pada Halaqah Penguatan Kelembagaan Ditjen Pesantren di Kampus II UIN Sunan Gunung Djati Bandung, Jumat (21/11/2025), Menag menyebut Ditjen Pesantren sebagai “cek kosong” yang memerlukan pengisian matang agar tidak melahirkan kebijakan prematur. “Road map pesantren dan pendidikan Islam harus jelas. Jangan sampai jalannya sama, tetapi memakai nama berbeda,” tegasnya.

Ia berharap forum halaqah ini melahirkan gagasan yang solid untuk menentukan arah masa depan pesantren, sekaligus mengintegrasikan keragaman pandangan yang saat ini berkembang dalam dunia pendidikan.

Rektor UIN Sunan Gunung Djati Bandung, Rosihon Anwar, menambahkan bahwa kampus terus menguatkan ekosistem pesantren melalui berbagai program, termasuk Ma’had Al-Jamiah. Ia berharap halaqah menjadi ruang konsolidasi nasional untuk menenun masa depan pesantren sekaligus menjaga ketahanan tradisi keilmuan di tengah dinamika zaman.

Selain membuka halaqah, Menag juga meluncurkan SANTRI—Sentra Analisis dan Riset Pesantren Indonesia—sebagai pusat kajian strategis untuk memperkuat riset dan pemikiran seputar pendidikan pesantren.

Sekretaris Ditjen Pendidikan Islam, Arskal Salim, menambahkan bahwa halaqah ini menjadi ruang terbuka bagi para kyai, ajengan, pengelola pesantren, alumni pesantren, akademisi, dan pemerintah untuk menyampaikan pandangan dan masukan berharga.

“Halaqah ini memberikan ruang bagi kita semua untuk memberikan masukan-masukan yang berharga bagi kemajuan pesantren. Sehingga menghadirkan gagasan yang lebih konkret dan inovatif tentang bagaimana membentuk arah penguatan pesantren,” ujarnya

<strong>Fondasi Keilmuan Pesantren Masa Depan</strong>

Halaqah menghadirkan tokoh-tokoh nasional, salah satunya mantan Ketua PBNU, Prof. Dr. K.H. Said Aqil Siradj, M.A., yang menegaskan bahwa penguatan pesantren tidak boleh hanya berhenti pada aspek administratif, tetapi harus berdiri di atas bangunan epistemologi yang kokoh.

Menurutnya, pemahaman agama perlu berlandaskan tiga pendekatan klasik yang telah menjadi tradisi besar dalam keilmuan Islam yaitu *Bayan* (pendekatan tekstual berbasis wahyu dan hadis); *Burhan* (pendekatan rasional yang menguatkan teks melalui logika dan penalaran) dan *Irfan* (pendekatan spiritual yang memberikan kedalaman makna melalui pengalaman batin).

“Tiga epistemologi ini tidak boleh berjalan sendiri. Teks tanpa nalar tidak cukup, dan nalar tanpa kedalaman spiritual juga tidak memadai,” ujar Said Aqil.

Integrasi ketiganya dipandang sangat relevan untuk membentuk santri yang kuat secara intelektual, matang secara spiritual, dan terampil membaca realitas.

Halaqah ini menjadi bagian dari langkah Kementerian Agama menyiapkan kerangka besar Ditjen Pesantren sebagai institusi yang akan menangani pembinaan pesantren secara nasional. Melalui kajian ontologi pendidikan, pemerintah berharap penyusunan kebijakan tidak hanya responsif terhadap kebutuhan masyarakat, tetapi juga berakar pada tradisi keilmuan yang telah menghidupi pesantren berabad-abad lamanya.

Turut hadir sebagai narasumber Prof. Dr. K.H. Said Aqil Siradj, M.A., Hj. Alissa Qutrotunnada Wahid, M.Psi (Direktur Nasional Gusdurian Indonesia), Dr. K.H. Aziz Afandi (Pimpinan Ponpes Miftahul Huda Tasikmalaya) serta Dr. K.H. Abun Bunyamin, M.A. (Pimpinan Ponpes Al-Muhajirin Purwakarta).', 'andung — Menteri Agama Nasaruddin Umar menegaskan perlunya perumusan yang komprehensif sebelum Direktorat Jenderal Pesantren resmi berjalan sebagai satuan kerja Eselon I di Kementerian Agama. Ia...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-05-at-01.17.37.jpeg', admin_user_id, 'PUBLISHED', 893, '2025-11-21T12:57:52.000Z', '2025-11-21T12:57:52.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'menag-dorong-kajian-ontologi-pendidikan-sebagai-rumusan-arah-baru-pesantren');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t0flj52vu', 'Kemenag Matangkan Pembentukan Ditjen Pesantren sebagai Penguat Moderasi, Inklusivitas, dan Mutu Pendidikan Pesantren', 'kemenag-matangkan-pembentukan-ditjen-pesantren', 'Tulungagung — Upaya Kementerian Agama dalam memperkuat tata kelola pendidikan pesantren memasuki tahap strategis dengan dimatangkannya rencana pembentukan Direktorat Jenderal Pesantren. Langkah ini dinilai sebagai momentum penting bagi peningkatan mutu pendidikan pesantren yang selama berabad-abad menjadi pilar peradaban Islam di Indonesia.

Dalam Halaqah Penguatan Pendirian Pesantren di UIN Tulungagung, Direktur Pesantren Kementerian Agama, Basnang Said, menegaskan bahwa kehadiran Direktorat Jenderal Pesantren merupakan kebutuhan mendesak agar pesantren memiliki ruang kelembagaan yang sebanding dengan peran historis dan kontribusi besarnya terhadap bangsa.

“Pesantren telah berabad-abad menjadi pusat pendidikan, dakwah, dan pemberdayaan masyarakat. Karena itu, sudah saatnya pesantren memiliki struktur kelembagaan yang lebih kuat agar kebijakannya tidak hanya bersifat administratif, tetapi berdampak luas bagi masyarakat,” ujarnya (19/11/2025).

Basnang menilai penguatan kelembagaan ini sebagai bentuk pengakuan negara sekaligus kesiapsiagaan pesantren menghadapi tantangan zaman, mulai dari digitalisasi, kebutuhan data nasional, hingga peningkatan kualitas SDM. Ia menegaskan bahwa Direktorat Jenderal Pesantren kelak akan menjadi motor penggerak program pendidikan, dakwah, dan pemberdayaan agar tersusun lebih terarah, profesional, dan berkelanjutan.

Kementerian Agama selama ini terus memperjuangkan agar pesantren masuk secara eksplisit dalam sistem pendidikan nasional. Setelah lahirnya Undang-Undang Pesantren dan berbagai regulasi turunannya, pembentukan unit eselon I yang fokus pada pesantren diharapkan menjadi puncak transformasi kelembagaan.

“Dengan Direktorat Jenderal, setiap kebijakan akan lebih terkoordinasi, setiap program lebih terukur, dan setiap kebutuhan pesantren dapat direspons lebih cepat. Kita ingin memastikan pesantren mendapatkan tempat yang layak sebagai kekuatan pendidikan Islam yang autentik dan mandiri,” tambah Basnang.

Penguatan ini juga mendapat dukungan para ulama. KH. Abdullah Kafabihi Mahrus dalam forum yang sama menegaskan kembali pentingnya moderasi beragama sebagai pilar menjaga persatuan bangsa. Menurutnya, moderasi adalah watak asli Islam yang sejak lama mengajarkan keseimbangan, keadilan, serta penghargaan terhadap perbedaan.

“Moderasi beragama itu adalah jalan tengah yang diajarkan Islam. Bukan mengurangi agama, bukan pula berlebihan. Prinsipnya adalah mengambil yang paling maslahat untuk diri sendiri, masyarakat, dan bangsa,” ungkapnya.

Ia mengingatkan bahwa ekstremisme, baik yang terlalu keras maupun terlalu longgar, berpotensi menimbulkan gesekan sosial. Karena itu, penguatan moderasi beragama di pesantren, sekolah, kampus, dan ruang-ruang dakwah menjadi keharusan agar harmoni nasional tetap terjaga.

“Pesantren sejak dulu menjadi pelopor moderasi. Di sana ada ilmu agama, ada tradisi, ada cinta tanah air. Ini harus kita perkuat agar umat tidak mudah dipecah oleh paham-paham sempit,” tegasnya.

Nilai inklusivitas juga mengemuka sebagai fondasi penting dalam membangun peradaban Islam yang ramah keberagaman. KH. Athoillah S. Anwar menekankan bahwa inklusivitas bukan sekadar konsep, melainkan ajaran dasar yang diwariskan ulama sejak berabad-abad lalu.

“Inklusif itu bukan pilihan, melainkan ajaran dasar dalam tradisi keilmuan Islam. Ruang pendidikan harus menjadi ruang yang memuliakan manusia, apa pun latar belakangnya,” ujarnya.

Ia menilai pesantren memiliki peran krusial dalam membumikan nilai keterbukaan tersebut. Dengan tradisi pendidikan yang humanis, pesantren telah lama menjadi ruang belajar yang merangkul berbagai kalangan dan menguatkan jati diri kebangsaan.

“Pesantren harus menjadi rumah bagi siapa saja yang ingin belajar. Semangat keterbukaan itu yang membuat pesantren bertahan selama ratusan tahun dan terus relevan,” tambahnya.

Menurutnya, bangsa Indonesia tidak boleh membiarkan pendidikan berjalan dalam ruang eksklusif yang menciptakan sekat antarkelompok. Pendidikan Islam, katanya, harus menjadi instrumen pemersatu yang menegaskan nilai kemanusiaan dan memperkuat persaudaraan.

Kementerian Agama memastikan proses finalisasi pembentukan Direktorat Jenderal Pesantren akan dilakukan secara bertahap dengan melibatkan para kiai, pimpinan pesantren, akademisi, dan pemerintah daerah. Sinergi antar pemangku kepentingan diharapkan mampu menghasilkan struktur kelembagaan yang menjawab kebutuhan riil di lapangan.

Dengan langkah ini, pemerintah berharap pesantren semakin siap menghadapi tantangan global, memperkuat tradisi keilmuan, dan melahirkan generasi yang berkarakter moderat, inklusif, serta berkontribusi bagi Indonesia Emas 2045.

“Pesantren masa depan harus berakar pada tradisi, tetapi juga mampu bergerak maju mengikuti perkembangan zaman. Itulah misi besar yang ingin kita wujudkan bersama,” tutup Basnang.', 'Tulungagung — Upaya Kementerian Agama dalam memperkuat tata kelola pendidikan pesantren memasuki tahap strategis dengan dimatangkannya rencana pembentukan Direktorat Jenderal Pesantren. Langkah ini...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-20-at-21.04.54.jpeg', admin_user_id, 'PUBLISHED', 1051, '2025-11-20T14:54:32.000Z', '2025-11-20T14:54:32.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-matangkan-pembentukan-ditjen-pesantren');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tyvgkj8gu', 'Kemenag Kolaborasi dengan LPDP Gelar Penguatan Moderasi Beragama di 4 Perguruan Tinggi Keagamaan', 'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama', 'Jakarta—Kementerian agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA) Sekretariat Jenderal berkolaborasi dengan Lembaga Pengelola Dana Pendidikan (LPDP), menggelar Penguatan Moderasi Beragama di empat Perguruan Tinggi Keagamaan (PTK).

Empat perguruan tinggi penyelenggara (PTP) sebagai Mitra Kementerian Agama tersebut adalah UIN Syarif Hidayatullah Jakarta, UIN Sunan Gunungdjati Bandung, UIN Sunan Kudus dan UIN Sayyid Ali Rahmatullah (UIN SATU) Tulungagung.

Kepala Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan, Ruchman Basori mengatakan, Penguatan Moderasi Beragama yang dirangkai dengan pengenalan ekoteologi dimaksudkan untuk mencetak para penggerak moderasi beragama dan ekoteologi di Indonesia.

“Lahirnya para penggerak moderasi beragama yang akan terus-menerus mengkampanyekan model keberagamaan yang inklusif, toleran dan damai, ditengah pluralitas sangat penting”, ujar Ruchman, dihadapan para peserta Penguatan Moderasi Beragama UIN Jakarta, pada Senin (17/11/2025).

Aktivis Mahasiswa 1998 ini meneggaskan lembaga pendidikan dari mulai Raudlatul Athfal, MI, MTs, MA hingga Perguruan Tinggi Keagamaan harus mempunyai komitmen kuat, agar kelompok intoleran dan radikal tidak berkecambah di bumi Nusantara ini.

Ruchman berharap para peserta mampu menindaklanjuti penguatan moderasi beragama dengan aksi nyata di lingkungan masyarakatnya masing-masing dan juga di media sosial. “Media sosial menjadi piranti yang strategis melakukan desiminasi moderasi beragama dan ekoteologi terutama untuk generasi millenial dan Gen-Z”, kata Ruchman.

Peserta Penguatan Moderasi Beragama dan Ekoteologi berjumlah 240 orang terbagi dalam empat klaster; Pertama, Klaster Dosen Perguruan Tinggi Keagamaan, dibawah binaan Ditjen Pendidikan Islam, Ditjen Bimas Kristen, Katolik, Hindu, Buddha dan Pusat Konghucu; Kedua, klaster Guru dan Tendik pada Madrasah dan Pendidikan Dasar dan Mennegah Kegamaan; Ketiga, Klaster Pondok Pesantren yang terdiri dari kyai muda, ustadz, dan dosen Ma’had Aly; Keempat kaster ASN Kementerian Agama RI dari Pusat hingga Daerah.

Masing-masing Perguruan Tinggi Penyelenggara (PTP) diikuti oleh 60 orang dengan menggandeng nara sumber, instruktur dan fasilitator dari Pusbangkom Kementerian Agama juga para dosen serta tokoh agama dan Masyarakat yang kompeten. Penyelenggaraan kegiatan pada UIN Jakarta dilaksanakan pada tanggal 12 sd 18 November 2025, UIN Bandung pada 13 sd 19 November 2025, UIN Sunan Kudus pada 24 sd 30 November 2025 dan UIN SATU Tulungagung pada 19 sd 25 November 2025.

Rektor UIN Sunan Gunungdjati Bandung Prof. Dr. Rosikhon Anwar, M.A mengatakan Islam mengajarkan nilai-nilai yang terbuka, tolaran dan damai, yang perlu dimoderasikan adalah orangnya, agar menerima pelbagai perbedaan paham.

Rosikhon menegaskan apa yang dilakukan oleh Kemenag melalui Puspenma adalah bentuk komitmen riil, mencetak para kader-kader moderasi beragama dan ekoteologi dari pesantren, perguruan tinggi dan madrasah. “Kami bangga diberikan amanah melatih dan menguatkan orang-orang terpilih dari segenap penjuru nusantara dan dikumpulakan di Bandung ini”, kata Rosikhon.

Kepala Pusat Rumah Moderasi Beragama UIN Jakarta Prof. Dr. Arif Zamhari, M.A memberikan apresiasi atas penyelenggaraan penguatan moderasi beragama yang merupakan kolaborasi Kemenag dengan LPDP. “Kami berterimakasih komitmen Kemenag dan LPDP mencetak para aktivis penggerak moderasi beragama, yang akan berada di garda terdepan pengarusutamaan nilai-nilai agama yang moderat”, katanya.

“Para peserta sangat antusias dan siap mengawal Islam yang rahmatan lil ‘alamin di tengah Indon esia yang multikultural”, tegas Arif. (Maria Ulfah)', 'Jakarta—Kementerian agama melalui Pusat Pembiayaan Pendidikan Agama dan Pendidikan Keagamaan (PUSPENMA) Sekretariat Jenderal berkolaborasi dengan Lembaga Pengelola Dana Pendidikan (LPDP), menggelar...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-19-at-15.00.14.jpeg', admin_user_id, 'PUBLISHED', 4680, '2025-11-19T11:07:35.000Z', '2025-11-19T11:07:35.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2ttr2ygmsj', 'Kongres Rohis Nasional I 2025 Ditutup, Terpilih Presiden Rohis Indonesia Pertama dan Arah Baru Pembinaan Pelajar Muslim', 'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim', '<p style="text-align: left;">KILAS INDONESIA — Untuk pertama kalinya dalam sejarah, Indonesia resmi memiliki Presiden Rohis Indonesia. Muhamad Ridanara Adiyatma, delegasi dari Jawa Tengah, terpilih melalui mekanisme e-voting dalam Kongres Rohis Nasional I 2025 yang diselenggarakan di Jakarta, 12-15 November 2025. Kongres perdana ini menjadi momentum strategis yang memayungi arah pembinaan Rohani Islam di sekolah umum seluruh Indonesia.</p>
Kongres yang mempertemukan ratusan peserta muslim yang tergabung dalam organisasi Rohis dari seluruh provinsi ini menandai keseriusan pemerintah dalam membangun ekosistem kepemimpinan pelajar yang modern, inklusif, dan berintegritas. Dari total 306 peserta, 34 ketua Rohis provinsi tercatat sebagai pemilik suara sah, sekaligus menentukan masa depan kepemimpinan Rohis nasional.

Menteri Agama Nasaruddin Umar menegaskan bahwa kepemimpinan sejati tidak hanya dibangun dari kecerdasan, tetapi juga keluhuran akhlak dan kerendahan hati.

“Banyak yang pintar, tetapi tidak semua bisa memimpin dengan hati. Ilmu adalah bekal, tetapi akhlak adalah kompas,” ujarnya.

Menag menekankan bahwa pemimpin muda harus menguasai ilmu, menjaga integritas, dan senantiasa memelihara kerendahan hati sebagai pondasi kepemimpinan yang amanah. Ia mengajak pelajar membiasakan disiplin, refleksi diri, dan keteladanan sebagai karakter pemimpin masa depan.

"Kemenag juga memastikan kemudahan akses pendidikan bagi semua peserta kongres. "Saya mengapresiasi kalian semua, semua yang hadir di sini, kami akan memberikan kesempatan untuk masuk ke UIN tanpa tes, bahkan Insya Allah juga kita usahakan beasiswa", jelasnya."

Jalur beasiswa luar negeri dibuka untuk negara-negara seperti Mesir, Maroko, Arab Saudi, hingga sejumlah universitas di Eropa. Serta peserta dengan hafalan Al-Qur’an dan rekam jejak pembinaan Rohis mendapat prioritas khusus.

“Tidak boleh ada anak Rohis yang tertinggal karena soal biaya. Negara hadir,” tegas Menag.

Dalam kesempatan yang sama, Dirjen Pendidikan Islam, Amien Suyitno mengukuhkan Pengurus Rohis Nasional periode 2025–2027 melalui pembacaan naskah resmi dan penyerahan simbol organisasi.

Ia menyampaikan pesan yang menjadi sorotan kongres: pelajar tidak perlu menunggu untuk menjadi pemimpin.

“Subbanul yaum rijalul al-an. Anda bukan pemimpin masa depan—Anda pemimpin hari ini,” tegasnya.

Dirjen menilai bahwa dinamika sosial menuntut pelajar untuk berani mengambil peran strategis sejak dini, baik di sekolah, komunitas Rohis, maupun ruang digital. Proses pemilihan Presiden Rohis dianggap sebagai miniatur pelatihan kepemimpinan nyata yang melatih komunikasi, jejaring, pengambilan keputusan, serta kemampuan merumuskan visi.

Kongres ini memadukan pembinaan karakter, kompetisi inovasi, hingga pelatihan jejaring kepemimpinan. Peserta mengikuti beragam agenda, termasuk pemilihan presiden, diskusi kebangsaan, hingga branding competition untuk mengasah kreativitas generasi muda.

Kemenag menegaskan bahwa Kongres Rohis Nasional I adalah investasi jangka panjang untuk menyiapkan pemimpin menuju Indonesia Emas 2045. Pembinaan pelajar kini diarahkan agar tidak terjebak dalam dikotomi antara sekolah umum dan madrasah, melainkan berdiri sebagai satu ekosistem pembentukan karakter bangsa.

Dirjen Pendis menyimpulkan, “Kongres ini bukan sekadar pertemuan. Ini adalah pijakan penting lahirnya generasi muslim yang cerdas, moderat, adaptif, dan siap memimpin perubahan.”

Dengan terpilihnya Presiden Rohis Indonesia pertama, babak baru pembinaan pelajar muslim resmi dimulai. Sebuah langkah bersejarah yang tidak hanya memperkuat organisasi Rohis di sekolah, tetapi juga mengokohkan komitmen negara dalam menyiapkan pemimpin masa depan yang berilmu, berakhlak, dan berwawasan luas.', 'KILAS INDONESIA — Untuk pertama kalinya dalam sejarah, Indonesia resmi memiliki Presiden Rohis Indonesia. Muhamad Ridanara Adiyatma, delegasi dari Jawa Tengah, terpilih melalui mekanisme e-voting...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/IMG-20251117-WA0003.jpg', admin_user_id, 'PUBLISHED', 946, '2025-11-16T23:08:08.000Z', '2025-11-16T23:08:08.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2txylww05e', 'UIN Mataram Tegaskan Peran Strategis dalam Penguatan Ekosistem Pesantren dan Riset Manuskrip Nusantara', 'uin-mataram-tegaskan-peran-strategis-dalam-penguatan-ekosistem-pesantren-dan-riset-manuskrip-nusantara', 'Mataram — Serangkaian kegiatan halaqah tingkat nasional yang digelar di Universitas Islam Negeri (UIN) Mataram, Sabtu (15/11/2025), menegaskan arah baru pembangunan ekosistem pesantren di Indonesia. Forum yang menghadirkan tokoh nasional, akademisi, hingga pimpinan pesantren dari berbagai daerah ini merumuskan pentingnya sinergi antara pesantren dan perguruan tinggi untuk memperkuat mutu pendidikan Islam sekaligus merawat kekayaan intelektual Nusantara.

Halaqah yang dibuka oleh Kasubdit Pendidikan Ma’had Aly, Dr. Mahrus, mewakili Dirjen Pendidikan Islam, menjadi panggung bagi UIN Mataram dalam menunjukkan komitmen jangka panjangnya untuk menjadi pusat studi pesantren dan manuskrip Nusantara.

Dalam sambutannya, Rektor UIN Mataram, Prof. Dr. H. Masnun Tahir, M.Ag., menekankan bahwa Lombok dan NTB memiliki kekayaan tradisi manuskrip yang luar biasa, mencakup naskah beraksara Arab, Jawi–Pegon, hingga Jejawen Sasak. Menurutnya, pusat studi naskah dan pesantren tidak hanya menjadi wadah akademik, tetapi juga penjaga identitas keilmuan Nusantara yang kini semakin membutuhkan dukungan kelembagaan.

“Ini momentum penting bagi UIN Mataram. Kampus harus hadir sebagai penjaga warisan ilmiah dan sekaligus penggerak inovasi pendidikan pesantren,” ujarnya.

Komitmen itu diwujudkan melalui peresmian Pusat Studi Naskah dan Pesantren (Pustunastren), lembaga baru yang diproyeksikan menjadi pusat unggulan dalam riset manuskrip dan turats pesantren. Pustunastren bertugas melakukan inventarisasi, digitalisasi, hingga penelitian lanjutan terhadap naskah-naskah klasik Lombok yang dinilai para filolog sebagai salah satu khazanah terkaya di Indonesia. Dengan lahirnya lembaga ini, UIN Mataram menargetkan diri sebagai knowledge hub baru yang menghubungkan tradisi pesantren dengan kebutuhan transformasi pendidikan modern.

Para narasumber turut menegaskan pentingnya integrasi kekuatan pesantren dan perguruan tinggi untuk menjawab tuntutan zaman.

Prof. Dr. TGH. Zainal Arifin, Lc., MA. menyoroti bahwa percepatan perubahan sosial dan teknologi telah membuka jurang kompetensi yang harus dijembatani melalui kerja sama lintas lembaga. Pesantren memiliki modal sosial dan spiritual yang kuat, sementara kampus menawarkan kapasitas metodologis dan jejaring akademik global. Sinergi keduanya diyakini akan melahirkan sumber daya manusia yang kokoh secara karakter, matang secara moral, sekaligus cerdas menghadapi dinamika era digital.

Komitmen penguatan ekosistem pesantren tak hanya datang dari kampus, tetapi juga dari pemerintah pusat. Menteri Koordinator Bidang Pembangunan Manusia dan Kebudayaan, Dr. Pratikno, M.Soc.Sc., dalam keterangannya menyampaikan bahwa pemerintah sedang memfinalisasi pembentukan Direktorat Jenderal Pesantren, struktur baru yang telah disetujui Presiden Prabowo Subianto.

Pratikno menyebut lahirnya Ditjen Pesantren sebagai “babak baru” yang menunjukkan penghargaan negara atas peran historis pesantren sebagai pusat pembinaan moral, keilmuan, dan kebangsaan. Dengan lebih dari 42 ribu pesantren dan 12,5 juta santri, kekuatan sosial ini dinilai strategis bagi masa depan Indonesia.

Dalam arah kebijakannya, Pratikno menyoroti berbagai tantangan, termasuk keamanan infrastruktur, literasi digital, hingga kesiapan vokasional santri. Untuk itu, empat program strategis dirancang sebagai prioritas awal Ditjen Pesantren, diantaranya program Pesantren Sehat dan Aman, peningkatan kompetensi vokasional santri, pemberdayaan kiai dan nyai, serta akselerasi digitalisasi pesantren. Ia menegaskan bahwa pimpinan Ditjen Pesantren harus memiliki “jiwa santri dan otak teknokrat,” yakni mampu menjaga tradisi sambil memimpin inovasi.

Halaqah nasional di UIN Mataram ini pada akhirnya menjadi ruang afirmasi bahwa masa depan pendidikan Islam membutuhkan kolaborasi menyeluruh lintas lembaga. Para peserta sepakat bahwa pesantren dan kampus merupakan dua pilar yang saling melengkapi, yaitu pesantren menjaga moralitas dan adab, sementara perguruan tinggi menguatkan metodologi ilmiah dan riset multidisipliner.

Dalam konteks inilah, keberadaan Pustunastren dipandang sebagai tonggak penting. Lembaga ini diharapkan mampu merawat manuskrip klasik sebagai sumber pengetahuan primer, memperkaya basis riset kebijakan pesantren, dan mendorong terciptanya kurikulum pendidikan Islam yang lebih adaptif terhadap tantangan global.

Kegiatan halaqah ditutup dengan penegasan kolaborasi antara Kementerian Agama dan UIN Mataram untuk memperkuat mutu pendidikan, riset, serta pengabdian masyarakat berbasis pesantren. UIN Mataram disebut siap menjadi salah satu kampus PTKIN paling aktif dalam mengembangkan inovasi akademik yang berakar pada khazanah intelektual Nusantara.

Dengan langkah ini, UIN Mataram menempatkan diri di garis depan upaya nasional membangun pendidikan Islam yang inklusif, riset-driven, dan berdaya saing global—seraya tetap menjejak kuat pada tradisi dan identitas pesantren yang selama ratusan tahun menjadi penyangga peradaban Islam Indonesia.', 'Mataram — Serangkaian kegiatan halaqah tingkat nasional yang digelar di Universitas Islam Negeri (UIN) Mataram, Sabtu (15/11/2025), menegaskan arah baru pembangunan ekosistem pesantren di Indonesia....', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-05-at-01.11.51.jpeg', admin_user_id, 'PUBLISHED', 4270, '2025-11-16T07:52:11.000Z', '2025-11-16T07:52:11.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'uin-mataram-tegaskan-peran-strategis-dalam-penguatan-ekosistem-pesantren-dan-riset-manuskrip-nusantara');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t33guryvo', 'Halaqah UIN Raden Intan Lampung Dorong Pembentukan Ditjen Pesantren sebagai Penguat Ekosistem Pesantren', 'halaqah-uin-raden-intan-lampung-dorong-pembentukan-ditjen-pesantren-sebagai-penguat-ekosistem-pesantren', 'Lampung — Halaqah Penguatan Kelembagaan yang digelar di UIN Raden Intan Lampung, Sabtu (15/11/2025), melahirkan satu benang merah yaitu pembentukan Direktorat Jenderal Pesantren merupakan kebutuhan mendesak bagi masa depan ekosistem pesantren di Indonesia. Inilah inti utama yang mengikat seluruh pandangan para ulama, akademisi, dan pimpinan pesantren dalam forum tersebut.

Acara yang menghadirkan para pimpinan pesantren, ulama, akademisi, serta pejabat Kementerian Agama ini memantik diskusi mendalam mengenai urgensi pembentukan Direktorat Jenderal Pesantren sebagai institusi yang fokus, komprehensif, dan berdaya dorong kuat dalam mengelola tata kelola pesantren di era transformasi digital.

Kasubdit Salafiyah dan Kajian Kitab Kuning Direktorat Pesantren, Yusi Damayanti, menyampaikan bahwa kebutuhan terhadap Ditjen Pesantren sesungguhnya telah lama bergulir dalam diskursus kebijakan pendidikan Islam. Menurutnya, posisi pesantren sebagai pilar pendidikan nasional menuntut tata kelola yang lebih terintegrasi.

“Selama ini pengelolaan pesantren masih tersebar di berbagai direktorat sehingga koordinasinya belum optimal. Dengan adanya Ditjen Pesantren, afirmasi kebijakan, mutu pendidikan salafiyah, hingga layanan terhadap pesantren dapat berjalan lebih cepat dan terarah,” ujarnya.

Yusi menegaskan bahwa pesantren merupakan ekosistem peradaban yang menjalankan fungsi pendidikan, dakwah, pemberdayaan masyarakat, hingga penguatan karakter kebangsaan. Transformasi kebijakan harus mengimbangi dinamika pesantren yang kini bersinggungan dengan isu ekonomi, digitalisasi, dan perluasan jejaring global.

Rektor UIN Raden Intan Lampung, Prof. Wan Jamaludin, menambahkan perspektif akademis mengenai tantangan besar yang kini dihadapi pesantren: arus digitalisasi, perubahan ekonomi global, dan pergeseran sosial-kultural masyarakat modern. Ia menilai tradisi keilmuan yang kuat di pesantren harus berjalan seiring dengan adaptasi teknologi dan inovasi kurikulum.

“Pesantren perlu menjadi pusat inovasi pendidikan Islam. Pembentukan Ditjen Pesantren akan mempercepat integrasi itu melalui penguatan riset, digitalisasi, ekonomi pesantren, dan kemitraan strategis,” tegasnya. Ia memastikan UIN Raden Intan siap menjadi mitra akademik bagi transformasi kelembagaan pesantren.

Dari perspektif praktisi, Pimpinan Ponpes Darul Ishlah Simpang 5 Lampung, KH. Sodiqul Amin, menyoroti pentingnya menjaga tradisi keilmuan kitab kuning sembari membuka ruang bagi pembaruan metodologis. Ia mengingatkan prinsip klasik pesantren al-muhāfazhah ‘ala qodimis sholih wal akhdzu bil jadidil ashlah sebagai pijakan transformasi.

Menurutnya, kompleksitas tantangan keilmuan menuntut kehadiran Ditjen Pesantren untuk menopang lima arah strategis: modernisasi pembelajaran kitab kuning, penguatan kompetensi masyayikh dan asatidz, peningkatan mutu Ma’had Aly, digitalisasi khazanah kitab kuning nasional, serta integrasi ilmu keislaman dengan sains terapan.

“Jika lima fokus ini dijalankan, pesantren akan siap menjawab tantangan digital, sosial, hingga intelektual di masa depan,” jelasnya.

Hal senada disampaikan Pimpinan Ponpes Madarirujull Ulum Lampung, KH. Ihya Ulumudin, yang mengulas perjalanan historis pesantren dari tradisi Ahlus Shuffah, Baitul Hikmah pada masa Abbasiyah, hingga madrasah Nizhamiyah. Menurutnya, pesantren di Nusantara memiliki akar historis yang kuat sebagai pusat pendidikan, dakwah, dan pemberdayaan masyarakat sejak berabad-abad lalu.

Ia menegaskan bahwa penguatan kelembagaan pesantren harus bertumpu pada tiga fungsi utama: pendidikan (ta’līm), dakwah (da’wah), dan pemberdayaan masyarakat (i‘māratul ummah). Ketiganya memerlukan dukungan institusi yang mampu menjamin kesinambungan tradisi sekaligus mendorong inovasi berkelanjutan.

“Karena itu, Ditjen Pesantren bukan sekadar kebutuhan, tetapi keniscayaan bagi masa depan pendidikan Islam di Indonesia,” tandasnya.

Halaqah di UIN Raden Intan Lampung ini akhirnya meneguhkan satu pesan kuat yaitu ekosistem pesantren membutuhkan ruang kebijakan yang lebih kokoh agar mampu menjaga tradisi sekaligus memimpin transformasi. Pendirian Ditjen Pesantren dipandang sebagai tonggak penting menuju tata kelola pesantren yang modern, berdaya saing, namun tetap berakar pada turats keilmuan yang telah membentuk peradaban Islam di Nusantara.', 'Lampung — Halaqah Penguatan Kelembagaan yang digelar di UIN Raden Intan Lampung, Sabtu (15/11/2025), melahirkan satu benang merah yaitu pembentukan Direktorat Jenderal Pesantren merupakan kebutuhan...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-04-at-23.23.35.jpeg', admin_user_id, 'PUBLISHED', 1658, '2025-11-16T05:48:57.000Z', '2025-11-16T05:48:57.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'halaqah-uin-raden-intan-lampung-dorong-pembentukan-ditjen-pesantren-sebagai-penguat-ekosistem-pesantren');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tbu35kbxe', 'Ulama Kalimantan Menekankan Standarisasi Kitab Kuning, Sertifikasi Guru, dan Arah Kebijakan Direktorat Jenderal Pesantren', 'ulama-kalimantan-menekankan-standarisasi-kitab-kuning-sertifikasi-guru-dan-arah-kebijakan-direktorat-jenderal-pesantren', 'Banjarmasin (Kemenag) - Agenda penguatan mutu pesantren memasuki fase penting setelah pemerintah menyiapkan pembentukan Direktorat Jenderal Pesantren. Isu ini menjadi titik bahasan utama dalam Halaqah Pesantren Penguatan Kelembagaan Pendirian Direktorat Jenderal Pesantren yang digelar di UIN Antasari Banjarmasin, Jumat (14/11/2025). Dua narasumber, KH Wildan Salman dan Prof Dr Mujiburrahman, menekankan perlunya standardisasi keilmuan tanpa menghilangkan kemandirian pesantren sebagai lembaga pendidikan tertua di Indonesia.

Dalam forum yang dihadiri ulama, pimpinan pesantren, pengajar, dan perwakilan Kementerian Agama itu, kedua narasumber mengingatkan bahwa tantangan pesantren kini bukan lagi semata soal sarana, melainkan penguatan otoritas ilmu dan tata kelola kelembagaan.

KH Wildan Salman, pimpinan Madrasah Darussalam Tahfidz dan Ilmu Al-Qur’an Martapura, menegaskan bahwa keberadaan pesantren tidak dapat dilepaskan dari tradisi kitab kuning. Menurutnya, tradisi tersebut adalah pondasi yang menjaga kesinambungan ilmu Islam dari generasi ke generasi.

“Tanpa kitab kuning, pesantren kehilangan identitas dan sumber legitimasi keilmuannya. Seluruh pemahaman fiqih, ibadah, dan hukum Islam bertumpu pada kitab-kitab tersebut,” ujarnya.

Ia menambahkan, keempat mazhab besar—Hanafi, Maliki, Syafi’i, dan Hanbali—bertahan hingga kini bukan semata karena pemikiran mereka, melainkan karena karya-karya ulama mereka terdokumentasi lengkap.

Kiai Wildan juga menyoroti pentingnya ijazah sanad, yaitu legitimasi guru kepada murid untuk meriwayatkan atau mengajar kitab tertentu. Konsep ini, menurutnya, identik dengan gagasan “sertifikasi keilmuan”. Karena itu, wacana sertifikasi guru pesantren tidak harus dianggap sebagai ancaman.

“Ulama sejak dulu memberi sertifikasi melalui ijazah. Jika standar disusun pesantren sendiri, sertifikasi justru akan menjaga kualitas, bukan menyingkirkan guru-guru pesantren,” tegasnya.

“Standar kurikulum harus jelas, agar pesantren tidak kehilangan arah,” katanya.

Ia menilai kehadiran Dirjen Pesantren diperlukan untuk menertibkan wilayah ini, namun tetap menempatkan pesantren sebagai subjek utama penyusun standar.

Berbeda dengan Wildan yang menyoroti struktur ilmu, Prof Mujiburrahman—alumnus Pesantren Al-Falah yang pernah menempuh studi di Kanada dan Belanda—menekankan sisi karakter.

“Krisis bangsa kita adalah krisis akhlak. Pesantren, dengan tradisi hidup sederhana dan hubungan guru–santri yang dekat, memiliki modal besar untuk memperbaikinya,” katanya.

Ia mengakui bahwa disiplin akademik Barat sangat ketat, tetapi pesantren memiliki sesuatu yang tidak dapat ditemukan di banyak institusi modern: hubungan keilmuan berlapis generasi melalui sanad dan akhlak berguru yang kuat.

Dalam paparannya, Mujiburrahman menggarisbawahi perlunya sinergi pesantren dan perguruan tinggi. Menurutnya, kampus memiliki peran dalam riset dan metodologi, sementara pesantren menjaga kedalaman tradisi.

Para narasumber sepakat bahwa kemandirian pesantren harus tetap menjadi prinsip utama. Dirjen Pesantren nantinya diharapkan tidak menjadi instrumen kontrol, tetapi wadah pembinaan dan fasilitasi.
“Pesantren telah mandiri jauh sebelum negara berdiri. Penguatan kelembagaan tidak boleh menggerus tradisi itu,” ujar Mujiburrahman.

Harapan baru bagi dunia pesantren disampaikan oleh H. Aziz Syafiuddin, Kepala Subdirektorat Pendidikan Al-Qur’an Ditjen Pendis Kemenag. Ia mengungkapkan bahwa Presiden telah menyetujui pembentukan Direktorat Jenderal Pesantren, dan saat ini regulasinya sedang berada pada tahap finalisasi di tingkat pemerintah pusat.

“InsyaAllah tidak lama lagi akan ditandatangani. Tahun depan Kementerian Agama diharapkan memiliki direktorat jenderal khusus untuk mengurus pesantren,” ungkapnya.

Aziz menegaskan bahwa halaqah di Banjarmasin merupakan satu dari 14 titik penjaringan pendapat nasional, yang dirancang untuk memastikan arsitektur kebijakan Dirjen Pesantren benar-benar bersumber dari aspirasi para kiai, pengasuh, dan praktisi pendidikan pesantren di seluruh Indonesia.

Ia turut mengingatkan bahwa jumlah pesantren kini telah menembus 42.400 lembaga, meningkat hampir dua kali lipat dalam lima tahun terakhir. Lonjakan ini, katanya, perlu diimbangi dengan penguatan tata kelola, kapasitas sumber daya manusia, dan penjagaan tradisi ilmu yang menjadi fondasi pesantren sejak era ulama klasik.

Selain itu, pemberdayaan ekonomi melalui wakaf produktif juga diusulkan agar pesantren tidak sepenuhnya bergantung pada iuran santri.

Halaqah ditutup dengan kesimpulan bahwa penguatan pesantren harus mencakup tiga pilar:
1. Peneguhan otoritas ilmu melalui standarisasi kitab kuning dan sanad;
2. ⁠Peningkatan mutu SDM melalui sertifikasi yang berbasis tradisi pesantren;
3. ⁠Kebijakan negara yang memfasilitasi, bukan mendikte.

Pembentukan Direktorat Jenderal Pesantren dinilai peluang besar untuk mendorong transformasi pesantren, tanpa menghilangkan watak khasnya sebagai pusat keilmuan Islam yang lahir dari tradisi Nusantara.', 'Banjarmasin (Kemenag) - Agenda penguatan mutu pesantren memasuki fase penting setelah pemerintah menyiapkan pembentukan Direktorat Jenderal Pesantren. Isu ini menjadi titik bahasan utama dalam...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-12-05-at-01.14.52.jpeg', admin_user_id, 'PUBLISHED', 1241, '2025-11-15T05:45:17.000Z', '2025-11-15T05:45:17.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'ulama-kalimantan-menekankan-standarisasi-kitab-kuning-sertifikasi-guru-dan-arah-kebijakan-direktorat-jenderal-pesantren');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tqk1xaffo', 'UIN Ar-Raniry Aceh Dorong Penguatan Peran Pesantren dalam Sistem Pendidikan Nasional', 'uin-ar-raniry-aceh-dorong-penguatan-peran-pesantren-dalam-sistem-pendidikan-nasional', 'Banda Aceh — Universitas Islam Negeri (UIN) Ar-Raniry Banda Aceh menegaskan komitmennya memperkuat eksistensi dan kontribusi pesantren dalam sistem pendidikan nasional. Komitmen itu diwujudkan melalui penyelenggaraan Halaqah Penguatan Kelembagaan menuju pembentukan Direktorat Jenderal (Ditjen) Pesantren Kementerian Agama RI, yang digelar di Auditorium Ali Hasjmy Aceh, Kamis (13/11/2025).

Kegiatan berskala nasional ini menghadirkan pimpinan dayah (pesantren khas Aceh), akademisi, dan pejabat Kementerian Agama. Forum tersebut menjadi ruang strategis untuk menyatukan visi dalam memperkuat posisi pesantren sebagai pilar penting pendidikan keagamaan di Indonesia.

Kepala Subdirektorat Pendidikan Muadalah dan Pendidikan Diniyah Formal Direktorat Pesantren, Endi Suhendi, menegaskan bahwa rencana pembentukan Ditjen Pesantren merupakan tindak lanjut dari amanat Presiden pada peringatan Hari Santri Nasional.

“Hari ini kita melanjutkan proses dari pengakuan de facto menuju penguatan de jure. Negara hadir untuk memberi landasan hukum dan kelembagaan yang kokoh bagi pesantren,” ujar Endi.

Ia menjelaskan, penguatan pesantren akan diarahkan pada tiga pilar utama: kelembagaan, keilmuan, dan kemandirian. Ketiga aspek ini diharapkan menjadi fondasi agar pesantren mampu beradaptasi dengan perkembangan zaman tanpa kehilangan nilai-nilai keislaman dan tradisinya.

Wakil Rektor II UIN Ar-Raniry, Khairuddin, menilai penguatan sistem pendidikan dayah di Aceh merupakan bagian penting dalam membangun generasi berkarakter dan berakhlak.

“Dayah bukan hanya lembaga keagamaan, tetapi juga fondasi peradaban dan karakter masyarakat Aceh. Tradisinya sudah mengakar jauh sebelum sistem pendidikan modern diperkenalkan,” ujarnya.

Khairuddin mengingatkan, dalam sejarah panjang Aceh, dayah merupakan lembaga pendidikan resmi kerajaan yang berperan melahirkan ulama dan cendekiawan. “Kalau bicara pendidikan karakter, dayah sudah memiliki sistem yang mapan sejak masa Kesultanan,” tambahnya.

Sementara itu, Ketua MPU Aceh, Tgk Faisal Ali, menyebut pembentukan Ditjen Pesantren sebagai langkah strategis pemerintah untuk memastikan mutu pendidikan Islam berjalan dalam ekosistem yang sehat.

“Negara tidak hadir untuk mengintervensi, melainkan untuk menjamin mutu dan keberlanjutan ekosistem pendidikan Islam di pesantren,” katanya.

<strong>Sinergi Kampus dan Pesantren Menuju Indonesia Emas 2045</strong>

Rektor UIN Ar-Raniry, Mujiburrahman, menegaskan kesiapan kampusnya menjadi mitra strategis pemerintah dalam memperkuat kelembagaan pesantren. UIN Ar-Raniry, katanya, tengah menyiapkan Program dan Pusat Studi Pesantren sebagai wadah akademik untuk riset, pengembangan kurikulum, dan inovasi pendidikan pesantren.

“Pesantren adalah pusat nilai, ilmu, dan karakter bangsa. Ia tumbuh dari tradisi, bergerak mandiri, dan berkontribusi nyata bagi masyarakat. Karena itu, kolaborasi perguruan tinggi dan pesantren akan memperkuat pendidikan Islam yang moderat dan berdaya saing,” tegas Mujiburrahman.

Menurutnya, sinergi tersebut menjadi bagian dari upaya besar menuju Indonesia Emas 2045, di mana pendidikan Islam tidak hanya berorientasi spiritual, tetapi juga produktif dan inovatif.

Sebagai penutup, halaqah tersebut menghadirkan diskusi panel bertajuk “Penguatan Kelembagaan Pesantren untuk Pembangunan Berkelanjutan dan Kemandirian Umat.” Hadir sebagai narasumber di antaranya Tgk H. Nuruzzahri Yahya (Waled NU), Tgk H. Faisal Ali dan Irwan, S.Hi., M.Si. Diskusi dipandu oleh Dr. Abd Razak, Lc., M.A., Pimpinan Dayah Daruzzahidin.

Dari forum tersebut, para peserta sepakat bahwa masa depan pendidikan Islam Indonesia harus berakar pada nilai-nilai pesantren yang adaptif terhadap kemajuan zaman, sehingga pesantren bukan hanya penjaga tradisi, tetapi juga penggerak kemajuan bangsa.', 'Banda Aceh — Universitas Islam Negeri (UIN) Ar-Raniry Banda Aceh menegaskan komitmennya memperkuat eksistensi dan kontribusi pesantren dalam sistem pendidikan nasional. Komitmen itu diwujudkan...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-04-at-22.39.25.jpeg', admin_user_id, 'PUBLISHED', 1521, '2025-11-14T07:40:33.000Z', '2025-11-14T07:40:33.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'uin-ar-raniry-aceh-dorong-penguatan-peran-pesantren-dalam-sistem-pendidikan-nasional');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tkprilno6', 'Lahirkan Santri Berilmu dan Berakhlak, Pesantren jadi Pilar Ketahanan dan Kebangkitan Bangsa', 'lahirkan-santri-berilmu-dan-berakhlak-pesantren-jadi-pilar-ketahanan-dan-kebangkitan-bangsa', 'Surabaya — Pesantren bukan sekadar lembaga pendidikan tradisional, melainkan institusi peradaban yang terus menyalakan cahaya ilmu dan moral di tengah dinamika zaman. Pesantren juga bukan lagi dipandang sebagai lembaga pendidikan alternatif, tetapi mitra strategis negara dalam membangun peradaban.

Pandangan itu mengemuka dalam Halaqah Penguatan Kelembagaan Pendirian Direktorat Jenderal Pesantren yang digelar di UIN Sunan Ampel Surabaya, Kamis (13/11/2025). Forum tersebut menjadi momentum penting lahirnya kesadaran kolektif bahwa pesantren bukan hanya bagian dari sistem pendidikan nasional, melainkan penopang utama ketahanan sosial dan spiritual bangsa.

Rais ‘Aam PBNU KH. Miftachul Akhyar menegaskan, kekuatan pesantren terletak pada kemampuannya menyeimbangkan ilmu dan iman, akal dan adab. “Kalau ingin pesantren terus melahirkan santri yang berkarakter untuk memperkuat bangsa ini, ya dengan ilmu. Dan itu ada di pesantren,” ujarnya.

Menurutnya, ilmu yang sejati tidak pernah berjalan sendiri tanpa kesadaran ilahiah. “Ilmu harus bergandengan dengan bismillah dan khasyatullah. Jangan biarkan ilmu telanjang jalan sendiri,” tegasnya. Pesan ini menjadi penegasan bahwa pesantren bukan sekadar penghasil pengetahuan, tetapi juga penjaga moralitas ilmu agar tak kehilangan arah kemanusiaan.

Kyai Miftachul menilai, dalam sejarahnya pesantren telah memainkan peran strategis menjaga keseimbangan sosial. “Kalau satu kabinet diisi santri, insyaallah aman. Karena mereka tumbuh dengan ketaatan dan kesadaran bahwa setiap amalnya diawasi Allah,” ujarnya. Santri, katanya, adalah penjaga nurani bangsa — taat kepada pemerintah selama tidak diperintahkan kepada kemaksiatan, sekaligus kritis dalam kebenaran.

Pengasuh Pesantren Tebuireng, KH. Abdul Hakim Mahfudz, mengaitkan eksistensi pesantren dengan tradisi keilmuan Islam sejak masa Rasulullah SAW. Ia menyebut model Ashabus Suffah — para sahabat yang tinggal di serambi masjid untuk belajar dan berkhidmah — sebagai cikal bakal pendidikan pesantren.

“Tradisi itu bertransformasi menjadi sistem pendidikan khas Nusantara yang menumbuhkan santri berilmu, beretika, dan beramal saleh,” ujarnya. Ia menambahkan, nilai-nilai itu kini dirumuskan dalam semangat BERKAH (Berilmu, Etika, Religius, Kreatif, Amal Saleh, dan Hikmah) sebagai paradigma pendidikan pesantren masa kini yang tidak hanya berorientasi pada keilmuan, tapi juga pada keutuhan manusia dan kemaslahatan bangsa.

<strong>Dari Pengakuan hingga Pemberdayaan</strong>

Menteri Koordinator Bidang Pembangunan Manusia dan Kebudayaan (Menko PMK) Pratikno menegaskan bahwa pembentukan Direktorat Jenderal Pesantren merupakan wujud konkret kehadiran negara dalam memperkuat lembaga yang menjadi “detak jantung bangsa” itu.

“Para kiai, ibu nyai, dan jutaan santri yang memilih jalan ilmu serta pengabdian adalah energi moral bangsa ini. Dari pesantren lahir semangat hubbul wathon minal iman (cinta tanah air bagian dari iman) yang menjaga Indonesia tetap damai dan toleran,” ujar Pratikno.

Ia memaparkan, data Kementerian Agama menunjukkan terdapat lebih dari 42 ribu pesantren dengan 12,5 juta santri di seluruh Indonesia. Angka itu bukan sekadar statistik, tetapi potensi sosial luar biasa untuk memperkokoh persatuan nasional. Namun, Pratikno juga mengingatkan bahwa masih banyak pesantren berjuang dengan keterbatasan infrastruktur, sanitasi, dan gizi santri. “Tragedi ambruknya bangunan pesantren adalah alarm keras bagi kita semua. Menjaga jiwa adalah maqashid syariah yang utama,” tegasnya.

Pratikno menyoroti pentingnya pembaruan kurikulum pesantren agar mampu menjawab tantangan zaman. Santri, katanya, harus dibekali kemampuan vokasional, literasi digital, dan jiwa kewirausahaan. “Santri harus punya kail, bukan hanya ikan,” ujarnya, menggambarkan visi pesantren sebagai institusi yang menumbuhkan kemandirian, bukan ketergantungan.

Direktur Pesantren, Basnang Said, menambahkan bahwa kehadiran negara bagi pesantren kini semakin nyata. Ia mengumumkan rencana pembangunan Pondok Pesantren Al-Khoziny dengan pendanaan dari APBN sebagai simbol kuat dukungan negara. “Insyaallah, dalam waktu dekat akan dilakukan groundbreaking Pondok Pesantren Al-Khoziny yang pendanaannya bersumber dari APBN,” ujarnya.

Menurut Basnang, dukungan negara terhadap pesantren bukan sekadar bantuan, tetapi tanggung jawab konstitusional. “Kiai dan Nyai datang bukan untuk meminta, tapi untuk mengambil haknya pesantren. Negara wajib hadir untuk itu,” tegasnya mengutip pesan KH. Ma’ruf Amin.

Ia mengingatkan, fondasi pengakuan negara terhadap pesantren telah diletakkan oleh Presiden ke-4 RI KH. Abdurrahman Wahid (Gus Dur), yang membuka jalan kesetaraan pendidikan melalui program Paket A, B, dan C di bawah Menteri Agama KH. Tholhah Hasan. “Dari sana, santri memperoleh pengakuan formal yang membuka ruang pengabdian lebih luas,” tuturnya.

Basnang menegaskan, berbagai kebijakan seperti penetapan Hari Santri, Undang-Undang Nomor 18 Tahun 2019 tentang Pesantren, hingga Peraturan Menteri Agama tentang Rekognisi Pembelajaran Lampau (RPL) menjadi tonggak kuat pengakuan negara. “Negara tidak mengintervensi, tapi merekognisi. Segala praktik pendidikan di pesantren adalah kekayaan bangsa yang harus dijaga,” ujarnya.

Melalui lahirnya Direktorat Jenderal Pesantren, negara ingin memastikan bahwa pesantren tidak sekadar bertahan, tetapi juga memimpin transformasi pendidikan berbasis nilai. Dari pesantren, lahir generasi yang berakar pada tradisi keilmuan Islam sekaligus terbuka terhadap inovasi.', 'Surabaya — Pesantren bukan sekadar lembaga pendidikan tradisional, melainkan institusi peradaban yang terus menyalakan cahaya ilmu dan moral di tengah dinamika zaman. Pesantren juga bukan lagi...', 'https://kilasindonesia.com/wp-content/uploads/2025/12/WhatsApp-Image-2025-12-05-at-12.26.03.jpeg', admin_user_id, 'PUBLISHED', 5120, '2025-11-14T05:34:44.000Z', '2025-11-14T05:34:44.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'lahirkan-santri-berilmu-dan-berakhlak-pesantren-jadi-pilar-ketahanan-dan-kebangkitan-bangsa');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tuzo5zypt', 'Buka Kick Off HGN 2025, Menag Nasaruddin Tekankan Pentingnya Integrasi Ilmu dan Iman bagi Para Guru', 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru', '<strong>KILAS INDONESIA</strong> —Menteri Agama Nasaruddin Umar, membuka secara resmi kegiatan Kick Off Hari Guru Nasional (HGN) Tahun 2025 di Universitas Islam Negeri (UIN) Syber Syekh Nurjati Cirebon, Rabu (12/11/2025). Kegiatan ini menjadi pembuka rangkaian peringatan Hari Guru Nasional yang akan digelar secara serentak di berbagai daerah di Indonesia.

Dalam sambutannya, Menag Nasaruddin menyampaikan pandangan filosofis tentang makna dan keteladanan seorang guru. Menurutnya, guru bukan sekadar pengajar ilmu, tetapi juga penyalur cahaya bagi jiwa manusia.

“Guru bukan hanya mengisi pikiran, tetapi menumbuhkan kesadaran dan meluruskan jalan berpikir. Dalam pandangan Islam, guru adalah warasatul anbiya (pewaris para nabi) yang meneruskan cahaya ilmu dan nilai kehidupan,” ungkap Menag.

Menag juga menekankan pentingnya mengintegrasikan antara ilmu dan iman dalam dunia pendidikan. Ia menilai bahwa pendidikan yang hanya menekankan aspek kognitif tanpa spiritualitas akan kehilangan arah moral.

“Madrasah harus menjadi pusat pencerahan baru. Tempat lahirnya generasi berilmu, beriman, dan berakhlak. Sekolah dan madrasah sejatinya memiliki tujuan yang sama, tetapi madrasah menambahkan dimensi hikmah dan spiritual,” tegasnya.

Dalam kesempatan tersebut, Menag turut mengenang sosok ayahnya yang merupakan seorang guru di sekolah rakyat. Dengan penuh haru, ia menuturkan bagaimana sang ayah tetap mengajar meskipun dalam keterbatasan.

“Guru sejati bukan hanya mentransfer pengetahuan, tetapi mentransformasi kesadaran dan keikhlasan. Itulah keteladanan yang harus kita hidupkan,” ujarnya.

<strong>Hari Guru untuk Semua</strong>

Sementara itu, Dirjen Pendidikan Islam Amien Suyitno melaporkan bahwa peringatan Hari Guru Nasional tahun ini merupakan Teachers Day for All atau Hari Guru untuk Semua. Menurutnya, ini pencerminan semangat inklusif dan lintas iman sesuai arahan Menteri Agama.

“Hari Guru tahun ini tidak hanya milik guru madrasah, tetapi juga milik semua guru di Indonesia, lintas iman dan lintas lembaga. Semua guru berperan penting dalam menanamkan nilai-nilai kemanusiaan dan kebangsaan,” jelas Dirjen.

Suyitno juga menyampaikan capaian penting tahun ini, yakni peningkatan signifikan dalam program Pendidikan Profesi Guru (PPG). Tahun 2025, Kementerian Agama memperoleh tambahan kuota untuk 95.000 guru, meningkat lebih dari 1.000% dibanding tahun-tahun sebelumnya.

“Ini bukti nyata perhatian pemerintah dan dukungan Komisi VIII DPR RI terhadap profesionalisme dan kesejahteraan guru. Setelah lulus PPG, para guru berhak mendapatkan tunjangan profesi sebagai bentuk penghargaan atas pengabdian mereka,” ungkapnya.

Selain itu, Ditjen Pendis juga memperkuat transformasi digital pendidikan Islam melalui dua aplikasi unggulan yaitu MAGIS dan MAGITA yang kini menjadi model nasional dalam pengelolaan kompetensi dan kinerja guru.

“Mengajar dengan cinta adalah kunci membangun peradaban. Itulah makna dari tema kita tahun ini, Merawat Semesta dengan Cinta,” tutur Suyitno.

<strong>Sinergi Pusat dan Daerah</strong>

Dalam sambutannya, Wali Kota Cirebon yang diwakili PA Asisten Kepemerintahan dan Kesejahteraan Rakyat, Sutikno, menyampaikan apresiasi atas terpilihnya Kota Cirebon sebagai tuan rumah kegiatan pembuka HGN 2025. Ia menilai kehadiran Menteri Agama menjadi kebanggaan bagi masyarakat Kota Wali.

“Kami merasa terhormat karena Bapak Menteri kembali hadir di Kota Cirebon. Pemerintah daerah berkomitmen untuk terus bersinergi dengan Kementerian Agama dan UIN Syekh Nurjati dalam meningkatkan mutu pendidikan dan spiritualitas masyarakat,” ujarnya.

Ia juga menegaskan pentingnya peran guru dalam membentuk karakter dan menjaga moralitas bangsa di tengah perkembangan teknologi.

“Teknologi bisa membantu proses belajar, tetapi keteladanan guru tidak bisa digantikan oleh mesin atau algoritma,” tegasnya.

Kegiatan Hari Guru Nasional 2025 diisi dengan berbagai agenda menarik, di antaranya:

1. Senam dan Gowes Lintas Iman bersama Menteri Agama;
2. Talk Show Inspiratif menghadirkan Najelaa Shihab dan tokoh pendidikan nasional;
3. Annual Conference of MORA Teachers;
4. Upacara Puncak Hari Guru Nasional dan
5. Awarding Night bagi guru-guru inspiratif, inovatif, dan berdedikasi dari daerah 3T.

Seluruh kegiatan ini menjadi simbol penghargaan pemerintah terhadap dedikasi guru di seluruh Indonesia, sekaligus memperkuat nilai persaudaraan lintas agama dan budaya.

Melalui peringatan Hari Guru Nasional 2025, Kementerian Agama menegaskan kembali komitmen untuk menjadikan pendidikan sebagai sarana mencerdaskan dan memanusiakan manusia.

“Bangsa yang besar lahir dari guru-guru yang mencintai muridnya dengan tulus. Mari terus menyalakan obor ilmu dan iman, menjadikan madrasah dan sekolah sebagai rumah peradaban,” pesan Menag Nasaruddin Umar menutup sambutannya.

Hadir dalam kegiatan tersebut, Menteri Agama, Penasihat DWP Kementerian Agama, Direktur Jenderal Pendidikan Islam, Wali Kota Cirebon, anggota Komisi VIII DPR RI, para pejabat eselon I Kementerian Agama, Pejabat eselon II dan III serta ratusan guru madrasah dan tenaga pendidik dari berbagai daerah.***', 'KILAS INDONESIA —Menteri Agama Nasaruddin Umar, membuka secara resmi kegiatan Kick Off Hari Guru Nasional (HGN) Tahun 2025 di Universitas Islam Negeri (UIN) Syber Syekh Nurjati Cirebon, Rabu...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-12-at-21.28.58.jpeg', admin_user_id, 'PUBLISHED', 2357, '2025-11-13T03:04:08.000Z', '2025-11-13T03:04:08.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2txqtpo4tt', 'Olimpiade Madrasah Dorong SDM Unggul dan Berdaya Saing Global', 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global', '<strong>KILAS INDONESIA </strong>- Kementerian Agama (Kemenag) menggelar Welcoming Dinner dalam rangka Grand Final Olimpiade Madrasah Indonesia (OMI) 2025 di Kantor Wali Kota Tangerang, Jalan Satria-Sudirman, Kota Tangerang, Banten, Senin (10/11/2025) malam. Acara tersebut menjadi penanda rangkaian ajang kompetisi sains dan teknologi tingkat nasional bagi siswa madrasah di bawah naungan Kemenag.

Direktur Jenderal Pendidikan Islam (Pendis) Kemenag, Prof. Amien Suyitno, menjelaskan bahwa OMI bertujuan untuk mendukung program Asta Cita Presiden Prabowo Subianto.

“Tahun ini kami gabungkan menjadi Olimpiade Madrasah Indonesia. Tujuannya untuk mendukung program Asta Cita Presiden, khususnya cita keempat, yaitu menciptakan SDM unggul yang terintegrasi,” ujar Amin.

Menurut Amien, lebih dari 204.000 siswa madrasah dari seluruh Indonesia mengikuti seleksi OMI tahun ini. Dari jumlah tersebut, hanya 484 peserta terbaik yang berhasil lolos ke babak final.

“Ini menunjukkan bahwa madrasah memiliki potensi besar. Anak-anak madrasah kini tidak hanya belajar kajian keislaman, tapi juga melakukan riset empiris, bahkan sampai menemukan inovasi untuk kesehatan dan teknologi,” ujarnya.

OMI 2025 menjadi ajang perdana yang digelar di Kota Tangerang, Banten. Kompetisi ini mengusung tema “Islam dan Teknologi Digital: Inovasi Sains untuk Generasi Indonesia Maju yang Berdaya Saing Global”.

Kegiatan yang berlangsung hingga 14 November 2025 ini diikuti peserta dari seluruh provinsi di Indonesia, mulai dari tingkat madrasah ibtidaiyah, tsanawiyah, hingga aliyah.

OMI diharapkan menjadi wadah bagi siswa madrasah untuk menampilkan riset dan inovasi mereka di bidang sains dan teknologi, sekaligus memperkuat semangat kolaborasi lintas disiplin ilmu.

Dalam kesempatan yang sama, Wakil Menteri Agama (Wamenag) Romo Muhammad Syafi’i menegaskan bahwa pendidikan di madrasah kini tidak hanya berfokus pada ilmu keagamaan seperti fikih, tauhid, tarikh Islam, dan adab. Madrasah telah berkembang menjadi lembaga pendidikan yang juga menekankan penguasaan ilmu pengetahuan dan teknologi, termasuk astronomi.

“Madrasah hari ini tidak melulu hanya mempelajari pelajaran fikih, tarikh Islam, tauhid, adab, dan sebagainya. Tapi juga sudah mempelajari teknologi,” ujar Romo Syafi’i.

Ia mengungkapkan, teknologi merupakan bagian dari ajaran Islam yang mencakup bidang kedokteran, pertanian, kelautan, hingga astronomi.

“Kita ingin meredefinisi kembali pengajaran Islam agar tidak sebatas pengetahuan untuk ibadah mahdah, tapi juga untuk menjalani kehidupan di semua lini, termasuk bidang teknologi,” tambahnya.

Romo Syafi’i juga menyampaikan bahwa perkembangan madrasah kini sudah menunjukkan hasil yang membanggakan. Salah satunya terlihat dari capaian Madrasah Aliyah Negeri (MAN) Insan Cendekia Serpong, Banten, yang dinobatkan sebagai sekolah lanjutan tingkat atas terbaik di Indonesia.

“Yang terbaik atau peringkat tertinggi di republik ini adalah madrasah, yaitu MAN Insan Cendekia Serpong. Di bawahnya baru sekolah-sekolah lain,” tuturnya.

Sementara itu, Ketua Komisi VIII DPR RI, Marwan Dasopang, yang turut hadir dalam acara tersebut, mengaku bangga atas kemajuan pendidikan madrasah di Indonesia. Ia menilai, pengakuan terhadap pendidikan keagamaan kini semakin luas di tengah masyarakat.

“Sebagai Ketua Komisi VIII DPR RI, saya bahagia karena diskusi panjang kami di DPR mulai menunjukkan hasil. Pengakuan terhadap pendidikan agama kini datang dari berbagai pihak,” ujar Marwan.

Ia mengungkapkan, pendidikan madrasah memiliki peran penting dalam sejarah perjuangan bangsa, terutama dalam menanamkan semangat cinta tanah air dan nilai-nilai keagamaan.

“Pelaku perjuangan kemerdekaan banyak berasal dari kalangan santri dan siswa pendidikan agama. Itu bukti bahwa madrasah dan pesantren berperan besar dalam sejarah bangsa,” katanya.

Turut hadir dalam acara tersebut Gubernur Banten Andra Soni, Ketua DPRD Banten Fahmi Hakim, Wali Kota Tangerang Sachrudin beserta Wakil Wali Kota Maryono Hasan, para pejabat eselon I dan II Kemenag, serta pendamping peserta OMI dari berbagai Kemenag kabupaten/kota se-Indonesia.***', 'KILAS INDONESIA - Kementerian Agama (Kemenag) menggelar Welcoming Dinner dalam rangka Grand Final Olimpiade Madrasah Indonesia (OMI) 2025 di Kantor Wali Kota Tangerang, Jalan Satria-Sudirman, Kota...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-11-at-08.31.46.jpeg', admin_user_id, 'PUBLISHED', 1122, '2025-11-13T02:43:56.000Z', '2025-11-13T02:43:56.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2ti2gdj1ht', 'Kemenag Umumkan Juara Madrasah Robotics Competition 2025, Berikut Daftarnya!', 'kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya', 'KILAS INDONESIA — Kementerian Agama Republik Indonesia resmi mengumumkan para pemenang Madrasah Robotics Competition (MRC) 2025) pada malam puncak yang digelar di Atrium Utama Living World, Kota Wisata Cibubur, Sabtu (1/11/2025) malam.

Mengusung tema “Robotic Technology for a Green Future”, ajang bergengsi ini menjadi wadah bagi pelajar madrasah dari seluruh Indonesia untuk menunjukkan kreativitas dan inovasi teknologi yang mendukung masa depan hijau dan berkelanjutan.

Wakil Menteri Agama H. Romo Syafii yang hadir dan menutup secara resmi MRC 2025, menegaskan bahwa penguasaan teknologi merupakan bagian dari pengamalan ajaran Islam.

“Teknologi tidak bisa dipisahkan dari nilai-nilai keislaman. Dalam Islam, segala bentuk inovasi yang membawa kemaslahatan bagi manusia adalah ibadah,” ungkap Romo Syafi’i dalam sambutannya.

Ia juga berpesan agar para pelajar madrasah terus berkarya dan menciptakan teknologi yang berlandaskan etika serta nilai spiritual.

“Robot dan kecerdasan buatan harus tetap dalam kendali manusia yang beriman. Madrasah harus menjadi pelopor teknologi yang berkeadaban,” tegasnya.

Dalam kesempatan yang sama, Direktur Jenderal Pendidikan Islam Kemenag, Amien Suyitno, menegaskan bahwa MRC 2025 merupakan momentum kebangkitan madrasah dalam penguasaan sains dan teknologi.

“Kompetisi tahun ini diikuti lebih dari 600 peserta dari berbagai madrasah di seluruh Indonesia. Ini menjadi rekor tersendiri dan bukti bahwa madrasah penuh dengan talenta muda yang inovatif dan siap bersaing di era digital,” ungkap Amien Suyitno.

Menurutnya, madrasah kini tidak lagi identik hanya dengan pendidikan agama, tetapi juga menjadi motor penggerak dalam bidang teknologi terapan, kecerdasan buatan, hingga inovasi robotik ramah lingkungan.

Daftar Juara Madrasah Robotics Competition 2025

Kategori Mobile Robot MI

Juara 1: Batu Bara Robotik (BBR) – MIN 2 Kota Sawahlunto

Juara 2: MIKUGreen – MI Khoiru Ummah
<p class="class-paragraph">Juara 3: Anak Krakatau – MI Diniyah Putri Lampung</p>
Juara 4: Gemintang – MIN 1 Kota Malang

Juara 5: Robot OneSix – MIN 16 Jakarta

Juara 6: Robozhaluvi – MI Assulthoniyah Bogor

Juara 7: SundraBot – MI Ma’arif NU Sunan Draja

Juara 8: Robotik MINS AJA – MIN 1 Jembrana

Juara 9: Robin – MI An-Noor Karangsari

Juara 10: The MicroMice – MI Manbaul Huda Purwodadi

Kategori Mobile Robot MTs

Juara 1: SCR Team Alpha – MTs Negeri 1 Lombok Timur

Juara 2: M3AI Robotic – MTsN 3 Malang

Juara 3: MINO1 – MTsN 1 Kota Bima

Juara 4: M4RC Buzzy – MTs Negeri 4 Jakarta

Juara 5: AIROS – MTs Al Hikam Jombang

Juara 6: Sleko Robotik – MTs Negeri 4 Sleman
<p class="class-paragraph">Juara 7: Firdaus – MTs Negeri 2 Sukoharjo</p>
Juara 8: Dar El Hikmah Robotic Club – MTs Darul Hikmah Pekanbaru

Juara 9: Marsada Robo – MTsN 1 Padangsidimpuan

Juara 10: Matsaci Robot Team – MTs Negeri 1 Cirebon

Kategori Mobile Robot MA

Juara 1: MDR Bismillah – MAN 2 Tulungagung

Juara 2: M2 R-Solver – MA Negeri 2 Kota Bima

Juara 3: ManSuko Mobile – MAN 1 Metro

Juara 4: Nassy – MA Negeri 1 Bogor

Juara 5: Robocom – MAN Pinrang

Juara 6: Robot Bima – MA Bilingual Al Amanah Sidoarjo

Juara 7: Lembu Sikat Abis – MA Negeri 1 Pekanbaru

Juara 8: Manduwo Highland – MAN 2 Wonosobo

Juara 9: Rapidclaw – MAS Husnul Khotimah Kuningan

Juara 10: Madina – MAN 1 Mandailing Natal
<p class="class-paragraph">Kategori Karya Inovasi MTs</p>
Juara 1: Matsal RC – MTs Al Hamid Jakarta

Juara 2: Matansa 1 – MTs Negeri 1 Kebumen, Jawa Tengah

Juara 3: Matsanewa Go – MTsN 1 Kota Malang, Jawa Timur

Juara 4: Robotic MTs Al-Ma’Tuq Nusa Farm – MTs Al-Ma’Tuq Sukabumi, Jawa Barat

Juara 5: Robomint – MTs Minhajut Tholabah

Juara 6: Auto Tsanda – MTsN 2 Jeneponto, Sulawesi Selatan

Juara 7: Madsanepat – MTsN 4 Kota Surabaya, Jawa Timur

Juara 8: TechFarmer – MTs Sekolah International Technonapura

Juara 9: Matsantura – MTs Negeri 1 Jepara, Jawa Tengah

Juara 10: Green Robotik 31 – MTs Negeri 31 Jakarta

Kategori Karya Inovasi MA

Juara 1: Romap – MA Negeri 4 Tasikmalaya, Jawa Barat

Juara 2: Romancis Inovasi – MAN 1 Cirebon, Jawa Barat

Juara 3: Ninestars – MAN 13 Jakarta
<p class="class-paragraph">Juara 4: Troptech – MAN 1 Gunung Kidul, DI Yogyakarta</p>
Juara 5: Paradox – MAN Insan Cendekia Tanah Laut, Kalimantan Selatan

Juara 6: Tricky Boy – MAN Insan Cendekia Kota Kendari, Sulawesi Tenggara

Juara 7: BlueGreen – MA Negeri 3 Tangerang, Banten

Juara 8: Mangestic Aquatech – MAN 2 Gresik

Juara 9: EcoSigmaStrive – MAN 2 Kudus, Jawa Tengah

Juara 10: Romantsa – MA Negeri 2 Kota Malang, Jawa Timur

Melalui ajang ini, Kementerian Agama menegaskan komitmennya untuk mendorong transformasi pendidikan Islam berbasis teknologi dan mengukuhkan posisi madrasah sebagai pusat inovasi yang melahirkan generasi kreatif, adaptif, dan berdaya saing global.

“Tema ‘Robotic Technology for a Green Future’ merefleksikan semangat generasi madrasah dalam menciptakan solusi teknologi yang ramah lingkungan dan membawa maslahat bagi umat,” tutup Romo Syafi’i.', 'KILAS INDONESIA — Kementerian Agama Republik Indonesia resmi mengumumkan para pemenang Madrasah Robotics Competition (MRC) 2025) pada malam puncak yang digelar di Atrium Utama Living World, Kota...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-02-at-11.50.49.jpeg', admin_user_id, 'PUBLISHED', 4083, '2025-11-02T11:51:14.000Z', '2025-11-02T11:51:14.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t57a4evh3', 'Curi Perhatian, Mahasiswa UIN Jakarta Pamerkan Robot Pengumpul Sampah Berbasis AI di AICIS+ 2025', '351-2', 'KILAS INDONESIA - Ada pemandangan menarik dalam perhelatan Annual International Conference on Islamic Studies (AICIS+) 2025 yang digelar di Kampus UIII Depok 29-31 Oktober 2025. Adalah Mahasiswa Program Studi Teknik Informatika, Fakultas Sains dan Teknologi (FST) UIN Syarif Hidayatullah Jakarta, Muhamad Daffa Muis yang berhasil menarik perhatian pengunjung dalam ajang melalui karyanya berjudul “Robot Pengumpul Sampah Menggunakan MobileNet-SSD Berbasis Raspberry Pi.”

Karya robotik ini menjadi salah satu inovasi mahasiswa UIN Jakarta yang dipamerkan pada kegiatan bergengsi tersebut. Daffa menjelaskan, robot ciptaannya dirancang untuk membantu mengumpulkan sampah secara otomatis menggunakan teknologi Artificial Intelligence (AI).

“Robot ini diperuntukkan untuk mengumpulkan sampah secara otomatis,” ujarnya saat ditemui di stan pameran UIN Jakarta di Kampus UIII Depok, Kamis (30/10/2025).

Robot ini mengandalkan sistem MobileNet-SSD, model AI yang digunakan untuk mendeteksi objek berupa botol plastik. Setelah mendeteksi, robot akan menggerakkan alat capit untuk mengambil sampah dan mengumpulkannya ke dalam wadah yang disediakan. Menariknya, Daffa juga merancang bagian mekanik robot agar mampu mengangkat beban 300 gram dan disiapkan hingga 1 kilogram.

"Pengembangan selanjutnya baru diharapkan bisa sampai 1 kilogram," tuturnya.

Ke depan, ia berencana mengembangkan sistem kecerdasan buatan agar robot dapat mengenali berbagai jenis sampah, tidak hanya botol plastik. “Saya ingin AI-nya bisa dikembangkan agar lebih cerdas dalam mendeteksi jenis sampah lain,” ungkapnya.

Robot pengumpul sampah karya Daffa menjadi salah satu inovasi yang ditampilkan UIN Jakarta di Pameran AICIS+ 2025 yang digelar oleh Kementerian Agama RI di kampus Universitas Islam Internasional Indonesia (UIII), Depok, Jawa Barat, pada 29–30 Oktober 2025.

Dalam pameran tersebut, UIN Jakarta menampilkan beragam karya inovatif hasil riset dosen dan mahasiswa dari berbagai fakultas dan pusat penelitian. Selain dari FST, inovasi juga ditampilkan oleh Fakultas Kedokteran (FK) dan Fakultas Ilmu Kesehatan (Fikes). Dari Fikes, pengunjung dapat melihat aplikasi bidang Industrial Hygiene karya Dr. Iting Shofwati, ST., MKK., HIU., serta karya mahasiswa seperti Siti Meluria dan Safna Praweswari tentang edukasi penggunaan inhaler dan antibiotik. Dari FK, ada aplikasi SihatTB karya Yogiek Febrilianto dkk., serta riset unggulan Azkiya Alika Putri Ahmudi berjudul Propolisul: Immunostimulant Evidence-Based Medicine.

Sementara dari FST, selain robot karya Daffa, turut dipamerkan riset Mitigasi Risiko Agribisnis karya Dr. Ahmad Mahbubi, Manajemen Pemasaran Kayu Jati karya Iwan Aminudin dan Dinda Rama Haribowo, serta riset Eco-Enzyme oleh Prof. La Ode Sumarlin. Beberapa teknologi lain yang juga mencuri perhatian ialah Teknologi EcoCluster karya Dr. Taufik Sutanto dan Paten Helm yang Disempurnakan karya Dr. Neny Anggraini dkk.

Selain dari fakultas, Pusat Penelitian, Pusat Rumah Jurnal, Pusat Halal, dan Pusat Pengembangan Green Campus UIN Jakarta juga turut menampilkan hasil riset dan program unggulan mereka. Pusat Rumah Jurnal, misalnya, memperkenalkan pengelolaan jurnal ilmiah UIN Jakarta yang telah banyak terindeks Scopus dan SINTA, sedangkan Pusat Halal menampilkan riset dan layanan sertifikasi halal berbasis sains.

Rektor UIN Jakarta Prof. Asep Saepudin Jahar, M.A., Ph.D. menyampaikan apresiasinya atas semangat sivitas akademika yang aktif berinovasi. “Partisipasi UIN Jakarta dalam AICIS+ menunjukkan bahwa semangat riset dan inovasi di kampus kita terus tumbuh dan memberikan dampak nyata bagi masyarakat. Ini juga mencerminkan semangat integrasi ilmu dan iman yang menjadi karakter UIN Jakarta,” ujarnya.

Partisipasi Daffa dan para dosen serta mahasiswa UIN Jakarta di AICIS+ 2025 lanjut Rektor menjadi bukti nyata bahwa kampus ini terus mengembangkan potensi riset dan inovasi teknologi sejalan dengan visinya sebagai Green, Smart, and Humanistic University — universitas yang mengintegrasikan ilmu pengetahuan, teknologi, dan nilai kemanusiaan untuk kemaslahatan masyarakat.', 'KILAS INDONESIA - Ada pemandangan menarik dalam perhelatan Annual International Conference on Islamic Studies (AICIS+) 2025 yang digelar di Kampus UIII Depok 29-31 Oktober 2025. Adalah Mahasiswa...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-10-31-at-07.00.02.jpeg', admin_user_id, 'PUBLISHED', 3465, '2025-11-01T13:18:50.000Z', '2025-11-01T13:18:50.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = '351-2');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t9dzktrr5', 'MAN 3 Bantul Sabet Medali Emas FIKSI 2025', 'man-3-bantul-sabet-medali-emas-fiksi-2025', 'KILAS INDONESIA - Prestasi luar biasa ditorehkan siswa MAN 3 Bantul (Mantaba) dalam ajang Festival Inovasi dan Kewirausahaan Siswa Indonesia (FIKSI) Tingkat Nasional Tahun 2025. Dua siswa yang tergabung dalam Excellent Entrepreneurs Club (EEC) MAN 3 Bantul, Muhammad Fauzan (XI-E) dan Muhammad Iqwan (XI-D) berhasil melaju final hingga sukses meraih medali emas bidang pariwisata FIKSI 2025. Ajang bergengsi diselenggarakan atas kolaborasi Balai Pengembangan Talenta Indonesia (BPTI), Kementerian Pendidikan Dasar dan Menengah (Kemendikdasmen), serta Pusat Prestasi Nasional (Puspresnas) . Pengumuman pemenang digelar dalam final FIKSI 2025 di Smesco Exhibition Hall, Jakarta, Jumat (30/10/2025).
Kemenangan tersebut diraih setelah kedua inovator muda ini mempresentasikan Wukirtech hasil karya aplikasi untuk mengembangkan pariwisata daerah. Proses penyusunan karya, penampilan dan penguasaan materi, serta kecakapan dalam presentasi telah membuahkan hasil membanggakan dengan meraih juara 1 di tingkat nasional.
Suasana haru terasa saat Fauzan dan Iqwan terpanggil untuk maju ke panggung untuk menerima medali. "Alhamdulillah, puji syukur tak henti-hentinya kami panjatkan atas kesuksesan dalam FIKSI ini. Terima kasih atas doa restu, bimbingan bapak ibu guru dan orang tua, dukungan bapak ibu pegawai, keluarga, dan seluruh keluarga besar MAN 3 Bantul,” ungkap Iqwan.
“Kami sangat terharu sampai di titik ini. Doa dan dukungan bapak ibu guru, keluarga, dan seluruh keluarga besar MAN 3 Bantul menguatkan kami hingga dapat meraih medali emas FIKSI 2025. Semoga karya yang tercipta melalui FIKSI ini dapat bermanfaat untuk masyarakat luas," imbuh Fauzan.
Kepala MAN 3 Bantul, Suyanto mengungkapkan apresiasi atas raihan prestasi FIKSI 2025, “MasyaAllah haru dan bangga dengan anak-anak yang meraih prestasi dalam FIKSI. Saya menyaksikan anak-anak sangat telaten mempersiapkan semuanya, turut mendampingi proses latihan hingga acara puncak. Anak-anak sangat menguasai konten yang telah disiapkan. Karya tersebut sangat bermanfaat untuk pengempangan pariwisata Wukirsari. Prestasi ini menjadi inspirasi bagi siswa-siswi di MAN 3 Bantul untuk semangat meraih prestasi. Selamat untuk Ananda Fauzan, Ananda Iqwan,” tutur Suyanto.
Guru pembimbing EEC MAN 3 Bantul, Ismariyati bangga atas raihan anak-anak didiknya. "Kami senang dan bangga dengan anak-anak kami. Mereka belajar begitu semangat. Anak-anak totalitas dalam menyusun karyanya. Lomba demi lomba mereka ikuti hingga kali ini menuai buah keberhasilan," ungkap Isma.
Kabar prestasi ini menjadi kebahagiaan seluruh civitas MAN 3 Bantul. Wakil kepala madrasah bidang kesiswaan, M. Munawar Yasin menjelaskan prestasi ini diraih melalui sinergi yang dibangun MAN 3 Bantul. “Bersyukur atas prestasi yang diraih siswa MAN 3 Bantul. Prestasi yang diraih ini adalah buah kerja keras, semangat, dan kerja sama yang baik antara anak-anak dengan pembimbing. Selain itu, dukungan dan doa segenap civitas MAN 3 Bantul serta Panti Asuhan Al Dzikro, tempat tinggal salah satu murid kami yang mengikuti FIKSI mendorong anak-anak semakin semangat hingga sukses berprestasi,” terang Yasin.
Lebih lanjut, wakil kepala madrasah bidang kurikulum, Wahyudi mengungkapkan bahwa MAN 3 Bantul senantiasa memberikan bimbingan kepada siswa untuk menumbuhkan potensi, minat dan bakat di berbagai bidang, salah satunya kewirausahaan, . “Dalam pengembangan potensi siswa, MAN 3 Bantul membentuk Excellent Entrepreneurs Club (ERC). Siswa mendapatkan bimbingan untuk menumbuhkan dan mengembangkan potensi kewirausahaan mereka mulalui EEC hingga meraih berbagai prestasi, salah satunya dalam ajang bergengsi FIKSI. Selamat atas prestasi yang diraih anak-anak,” ungkap Wahyudi.', 'KILAS INDONESIA - Prestasi luar biasa ditorehkan siswa MAN 3 Bantul (Mantaba) dalam ajang Festival Inovasi dan Kewirausahaan Siswa Indonesia (FIKSI) Tingkat Nasional Tahun 2025. Dua siswa yang...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-10-31-at-13.17.35.jpeg', admin_user_id, 'PUBLISHED', 5324, '2025-11-01T13:16:33.000Z', '2025-11-01T13:16:33.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'man-3-bantul-sabet-medali-emas-fiksi-2025');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tx4wjt92d', 'Menag Nasaruddin Dorong Siswa Madrasah Bukan Hanya Unggul dalam Agama tapi juga Teknologi', 'menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi', 'KILASINDONESIA.COM – Menteri Agama Nasaruddin Umar membuka ajang Madrasah Robotics Competition (MRC) 2025 yang digelar di Atrium Utama Living World Kota Wisata Cibubur, Sabtu (1/11/2025). Dalam arahannya, Menag menegaskan bahwa madrasah hari ini harus menjadi simbol kemajuan — tidak hanya dalam ilmu agama, tetapi juga sains dan teknologi.

“Anak-anak madrasah jangan hanya bisa mengaji dan berdoa, tapi juga harus mampu menciptakan robot, meneliti, dan berinovasi. Itu baru madrasah masa depan,” ujar Nasaruddin.

Menurut Menag, perintah Allah dalam Al-Qur’an yang berbunyi ‘I’malū’ (berkaryalah) harus dimaknai secara luas. “Kata ‘amal’ dalam Islam bukan sekadar melakukan sesuatu, tapi melakukan dengan perencanaan, perhitungan, dan kecermatan. Sama seperti robot, yang tak bisa bergerak tanpa sensor dan logika,” tegasnya.

Nasaruddin juga menyinggung kisah Nabi Sulaiman yang mampu mengalahkan jin dengan kecerdasan. “Kecerdasan manusia bisa menembus batas. Kalau anak-anak madrasah memadukan konsentrasi dan kontemplasi, mereka bisa melahirkan keajaiban-keajaiban baru,” katanya.

Menag pun mengapresiasi semangat para peserta MRC 2025. Tahun ini tercatat 616 tim dari berbagai jenjang madrasah di seluruh Indonesia ikut berkompetisi, jumlah terbanyak sepanjang penyelenggaraan MRC sejak pertama kali digelar pada 2015.

Dalam kesempatan itu, Menag juga mengumumkan kabar menggembirakan: Pemerintah Emirat Arab siap memberikan dukungan besar bagi pengembangan madrasah di Indonesia.

“Emirat Arab akan membantu peningkatan keterampilan guru dan siswa madrasah. Insyaallah, MoU akan segera ditandatangani dalam waktu dekat,” tutur Nasaruddin.

Ia berharap, kolaborasi tersebut dapat memperkuat posisi madrasah sebagai pusat keunggulan ilmu dan karakter. “Kita ingin madrasah bukan sekadar pilihan alternatif, tapi menjadi kebanggaan nasional,” katanya menutup sambutannya.

Sementara itu, Direktur Jenderal Pendidikan Islam, Amien Suyitno, menyampaikan bahwa MRC 2025 menjadi momentum kebangkitan inovasi madrasah setelah sempat vakum dua tahun.

“Tahun ini kami hadir dengan semangat baru. Tema ‘Robotic Technology for a Green Future’ kami pilih untuk menegaskan bahwa teknologi juga harus berpihak pada keberlanjutan lingkungan,” ujar Dirjen.

Ia menambahkan, ajang ini menjadi wadah untuk menampilkan bakat dan kreativitas siswa madrasah dalam bidang sains, teknologi, dan lingkungan. “Madrasah bukan hanya mencetak ulama, tapi juga calon ilmuwan dan insinyur yang berakhlak mulia,” katanya.

Menurut Amien, MRC 2025 juga menjadi bagian dari strategi Kemenag menyongsong era baru pendidikan madrasah. Tahun ini, madrasah akan menerapkan Tes Kemampuan Akademik (TKA) sebagai pengganti Ujian Nasional (UN) yang menjadi salah satu indikator penerimaan di perguruan tinggi negeri.

“Kita ingin memastikan bahwa anak-anak madrasah siap bersaing, baik secara akademik maupun dalam kompetensi teknologi,” ungkapnya.

Tahun ini, kompetisi terbagi menjadi dua kategori utama yaitu Robot Karya Inovasi dan Mobile Robot Labirin, keduanya menekankan kreativitas, penerapan teknologi, serta kepedulian terhadap kelestarian lingkungan.

Tahun ini merupakan kompetisi robot dengan jumlah peserta terbesar sepanjang sejarah MRC. Tema yang diusung, “Robotic Technology for a Green Future”, sejalan dengan visi Kementerian Agama dalam membangun madrasah hijau, pondok pesantren hijau, dan kampus hijau.

Pembukaan MRC 2025 dihadiri para pejabat eselon I dan II Kementerian Agama, khususnya di lingkungan Direktorat Jenderal Pendidikan Islam, Dirjen Bimas Islam, para staf ahli dan staf khusus Menteri, para juri, guru, kepala madrasah, dan peserta MRC 2025.***', 'KILASINDONESIA.COM – Menteri Agama Nasaruddin Umar membuka ajang Madrasah Robotics Competition (MRC) 2025 yang digelar di Atrium Utama Living World Kota Wisata Cibubur, Sabtu (1/11/2025). Dalam...', 'https://kilasindonesia.com/wp-content/uploads/2025/11/WhatsApp-Image-2025-11-01-at-15.31.05.jpeg', admin_user_id, 'PUBLISHED', 595, '2025-11-01T13:13:51.000Z', '2025-11-01T13:13:51.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t8e5jzcyo', 'Malam Bakti Santri, Menag Sampaikan Terima Kasih atas Perhatian Presiden ke Pesantren', 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren', '<strong>KILASINDONESIA.COM</strong> --- Menteri Agama Nasaruddin Umar menyampakan terima kasih kepada Presiden Prabowo atas perhatiannya ke dunia pesantren. Hal ini disampaikan Menag Nasaruddin Umar saat memberikan sambutan pada malam Bakti Santri untuk Negeri di TMII, Jakarta.

Giat ini menjadi rangkaian dari peringata Hari Santri 2025. Hadir, keluarga besar Kementerian Agama, serta ratusan santri dan pengasuh pondok pesantren. Hadir juga sejumlah santri penerima manfaat beasiswa sehingga bisa melanjutkan kuliah pada beragam program studi dan perguruan tinggi ternama di Indonesia.

"Izinkan saya menyampaikan terima kasih dan apresiasi yang setinggi-tingginya kepada Presiden Republik Indonesia, Bapak Prabowo Subianto, atas keberpihakan nyata beliau kepada dunia pesantren. Di bawah kepemimpinan beliau, berbagai program yang menyentuh kepentingan pesantren terus mendapatkan penguatan, termasuk persetujuan pembentukan Ditjen Pesantren di Kemenag,” ucap Menag di Jakarta, Jumat (24/10/2025).

Menag menegaskan bahwa pembentukan Ditjen Pesantren merupakan amanah besar. Amanag ini diharapkan akan semakin memperkuat tata kelola dan pelayanan pemerintah terhadap pesantren di seluruh Indonesia.

"Kami berkomitmen, dengan terbentuknya Direktorat Jenderal Pesantren, layanan negara bagi pesantren akan semakin cepat, tepat, dan berdampak," ujarnya.

Langkah strategis ini diharapkan mampu mendorong pesantren bertransformasi menjadi pusat inovasi, pusat pemberdayaan ekonomi, dan pusat peradaban. Hingga 2025, Kemenag mencatat terdapat 42.369 pesantren yang tersebar di seluruh Nusantara, dengan jutaan santri yang belajar.

"Ini bukan sekadar angka, melainkan bukti betapa pesantren telah menjadi ekosistem besar pembangunan manusia Indonesia seutuhnya,” jelas Menag.

"Inilah wajah baru pesantren Indonesia. Bukan hanya pusat ilmu dan dakwah, tetapi juga pusat inovasi dan pemberdayaan ekonomi masyarakat," lanjutnya.

Menag juga menerangkan peran Kemenag dalam mendukung kesejahteraan santri melalui program-program sosial dari Pemerintah. Program Cek Kesehatan Gratis (CKG) dan Makan Bergizi Gratis (MBG) juga telah dirasakan manfaatnya oleh jutaan santri. "Program-program ini menunjukkan bagaimana negara hadir untuk memastikan santri tumbuh sehat, kuat, dan bersemangat dalam menuntut ilmu serta berkontribusi bagi bangsa," jelas Menag.

Berikut sejumlah program unggulan Kemenag yang berdampak signifikan terhadap pesantren:

1. Beasiswa Santri Berprestasi (PBSB)
Sebanyak 7.973 santri telah menerima beasiswa penuh dari negara melalui Program Beasiswa Santri Berprestasi (PBSB) dalam 20 tahun terakhir (2005 – 2025). Saat ini, lebih dari 5.000 alumni program ini mengabdi sebagai dokter, dosen, peneliti, teknolog, dan penggerak sosial di berbagai daerah.

2. Kemandirian Ekonomi Pesantren
Kemenag telah menyalurkan bantuan inkubasi bisnis mencapai Rp499,55 miliar untuk 4.186 pesantren (2021 – 2024). Program ini berhasil melahirkan 1.052 Badan Usaha Milik Pesantren (BUMP).

3. Koperasi Pesantren
Hingga saat ini, ada 2.347 koperasi pesantren telah berdiri dan beroperasi. Koperasi pesantren menjadi penggerak ekonomi umat di berbagai daerah.', 'KILASINDONESIA.COM --- Menteri Agama Nasaruddin Umar menyampakan terima kasih kepada Presiden Prabowo atas perhatiannya ke dunia pesantren. Hal ini disampaikan Menag Nasaruddin Umar saat memberikan...', 'https://kilasindonesia.com/wp-content/uploads/2025/10/WhatsApp-Image-2025-10-25-at-07.33.38-1.jpeg', admin_user_id, 'PUBLISHED', 1418, '2025-10-25T03:38:10.000Z', '2025-10-25T03:38:10.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2ty868bvrk', 'Gelar Peringatan HSN 2025, Rektor UIN Jakarta Harap Para Santri Terus Tingkatkan Ilmu dan Akhlak', 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak', '<strong>KILASINDONESIA.COM</strong>  - Rektor UIN Syarif Hidayatullah Jakarta, Prof Asep Saepudin Jahar, memimpin Upacara Peringatan Hari Santri Nasional (HSN) 2025 di Lapangan Student Center Kampus 1, Ciputat, Tangerang Selatan, Banten, Rabu 22 Oktober 2025.

Mengenakan sarung, jas dan kopiah hitam, Prof Asep pun menyampaikan amanat dari Menteri Agama (Menag) Prof Nasaruddin Umar. Dalam amanatnya yang dibacakan Prof Asep, Menag menyampaikan belasungkawa terhadap insiden di Pondok Pesantren Al-Khoziny, Sidoarjo, Jawa Timur.

“Izinkan saya menyampaikan rasa duka cita yang mendalam atas wafatnya 67 santri dalam musibah yang menimpa Pesantren Al-Khoziny,” ungkap Prof Asep mengutip amanat Menag.

Sebagai wujud kepedulian negara, Menag menyampaikan, pihaknya telah hadir langsung di lokasi kejadian guna meninjau kondisi, menyampaikan bantuan serta memastikan agar proses pemulihan berjalan dengan baik.

“Langkah ini adalah bukti nyata bahwa negara hadir dan peduli terhadap pesantren dan para santri,” ujarnya.

Sementara itu, Prof Asep berharap, agar ke depannya para santri terus berkembang, tidak hanya dari segi keilmuan saja, tapi juga dari segi karakter yang berintegritas.

“Saya berharap kepada para santri untuk terus meningkatkan ilmu, meningkatkan akhlak dan juga memperkuat komitmen kepada bangsa. Semoga mereka terus berjuang menjadi generasi masa depan yang membanggakan,” katanya.

Prof Asep pun menilai, tema Hari Santri Nasional 2025 ‘Mengawal Indonesia Merdeka Menuju Peradaban Dunia’ sangatlah tepat. Karena, menurut Prof Asep, hal ini sejalan dengan cita-cita Presiden Prabowo Subianto yang ingin mencapai Indonesia Emas 2045.

“Di hari santri ini saya harapkan menjadi penggugah kembali bagaimana peran santri dan peran Indonesia di dunia internasional. Ini juga adalah komitmen Presiden Prabowo untuk ikut mencerdaskan bangsa dan menjaga ketertiban dunia,” ungkapnya.***(Sut)', 'KILASINDONESIA.COM - Rektor UIN Syarif Hidayatullah Jakarta, Prof Asep Saepudin Jahar, memimpin Upacara Peringatan Hari Santri Nasional (HSN) 2025 di Lapangan Student Center Kampus 1, Ciputat,...', 'https://kilasindonesia.com/wp-content/uploads/2025/10/WhatsApp-Image-2025-10-22-at-11.31.45.jpeg', admin_user_id, 'PUBLISHED', 2874, '2025-10-23T04:50:06.000Z', '2025-10-23T04:50:06.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t2pplzys4', 'Langkah Kemenag Wujudkan Asta Cita: dari Jaga Kerukunan untuk Pembangunan hingga Sejahterakan Guru', 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru', '<strong>KILASINDONESIA.COM</strong> - Setahun pemerintahan Presiden Prabowo Subianto–Gibran Rakabuming Raka menjadi momentum penting bagi Kementerian Agama (Kemenag) untuk menghadirkan wajah kehidupan beragama yang lebih inklusif, produktif, dan menyejahterakan.

Di bawah kepemimpinan Menteri Agama Nasaruddin Umar, Kemenag meneguhkan komitmennya untuk menerjemahkan Asta Cita ke dalam langkah nyata: menjaga kerukunan yang menjasi prasyarat pembangunan, memperkuat pendidikan keagamaan, serta meningkatkan kesejahteraan guru pendidikan agama dan keagamaan.

“Asta Cita bukan sekadar rencana politik, tapi arah moral bangsa. Di Kementerian Agama, kami terus berupaya agar nilai agama tidak berhenti di mimbar, tetapi hidup dalam kebijakan yang memuliakan manusia,” ujar Menag Nasaruddin Umar, dalam refleksi satu tahun perjalanan Kemenag mengawal Asta Cita, di Jakarta, Selasa (21/10/2025).

<strong>Merawat Kerukunan untuk Pembangunan</strong>

Menjaga dan merawat kerukunan menjadi fondasi utama kerja Kemenag dalam mengawal Asta Cita Presiden — terutama cita ke-8 yang menekankan pentingnya harmoni sosial, toleransi, dan kehidupan beragama yang damai. Bagi Kemenag, kerukunan bukan hanya soal toleransi, tetapi juga syarat utama pembangunan. Karena tanpa kedamaian sosial, pembangunan tidak akan berjalan d kokoh.

Dalam setahun terakhir, Kemenag mengembangkan sistem dan program yang konkret untuk memperkuat harmoni bangsa. Melalui aplikasi Si-Rukun (Early Warning System), potensi konflik keagamaan bisa dideteksi sejak dini di berbagai daerah. Penyuluh agama menjadi garda terdepan dalam mengoperasikan aplikasi ini.

Pengembangan Si-Rukun merupakan ikhtiar bersama seluruh unit eselon I Kemenag, mulai dari Ditjen Bimas Islam, Ditjen Bimas Kristen, Katolik, Hindu, Buddha, hingga Pusat Kerukunan Umat Beragama (PKUB). Sistem ini dibangun berdasarkan penelitian terkait peta potensi konflik keagamaan di berbagai daerah, termasuk pemetaan zona merah, kuning, dan hijau.

Untuk memperkuat kesiapan di lapangan, Kemenag telah melatih 500 penyuluh agama di KUA sebagai aktor resolusi konflik. Mereka dibekali pengetahuan dan keterampilan agar mampu melakukan deteksi dini serta penanganan cepat di wilayah dengan potensi konflik tinggi.

Selain itu, Kemenag juga membina 300 penyuluh agama dalam pemetaan masalah sosial-keagamaan, memperkuat kapasitas 600 penceramah agar berdakwah dengan pendekatan moderat dan literasi digital, serta membina 200 dai muda untuk melahirkan generasi dai yang berwawasan moderat, adaptif, dan mandiri (dakwah kontekstual dan keterampilan entrepreneurship).

Kemenag juga menggelar Program Akademi Kepemimpinan Mahasiswa Nasional (Akminas) juga melahirkan 1.192 kader lintas agama yang dibekali semangat kepemimpinan plural dan damai. Kemenag bahkan melakukan rekonstruksi terhadap 25 pesantren eks-Jamaah Islamiyah dengan total 5.077 santri, sebagai langkah deradikalisasi berbasis pendidikan .

“Kerukunan adalah prasyarat pembangunan. Indonesia hanya bisa maju bila umatnya damai, saling menghormati, dan memiliki kesadaran kebangsaan yang kuat,” tegas Menag.

Capaian ini juga tercermin dalam hasil survei Poltracking Indonesia, yang menempatkan “menjaga kerukunan antarumat beragama” sebagai keberhasilan tertinggi pemerintahan Prabowo–Gibran dengan tingkat kepuasan publik mencapai 86,7%, disusul menjaga kehidupan keagamaan (80,2%) dan menjaga persatuan bangsa (77,1%).

<strong>Menyukseskan MBG dan CKG</strong>

Dalam semangat Asta Cita yang menekankan pemerataan ekonomi dan peningkatan kualitas hidup masyarakat, Kemenag juga ikut menyukseskan pelaksanaan dua program prioritas nasional: Makan Bergizi Gratis (MBG) dan Cek Kesehatan Gratis (CKG). Langkah ini menjadi bagian dari ikhtiar Kemenag dalam mendukung upaya Presiden meningkatkan kesejahteraan sosial.

Hingga hari ini, tercatat sebanyak 1.373.761 siswa madrasah dan 337.442 santri pesantren telah menikmati manfaat MBG. Sementara itu, lebih dari 12,5 juta siswa dari madrasah, pesantren, dan lembaga pendidikan Kristen, Katolik, Hindu, dan Buddha juga menerima layanan CKG.

Upaya lain dalam meningkatkan kesejahteraan sosial yang dilakukan Kemenag adalah membantu 4.450 UMKM melalui pinjaman tanpa bunga (qardul hasan) melalui program Masjid Berdaya dan Berdampak (MADADA). Sebanyak 1.350 takmir masjid bahkan diberikan bimtek secara khusus untuk meningkatkan kompetensi mereka dalam pengelolaan dan pemberdayaan ekonomi berbasis masjid.

Untuk menekan angka perceraian dan membangun keluarga, lebih dari 17.266 pasangan nikah diberi pembinaan keluarg, baik dalam bentuk Bimbingan Perkawinan Islam, bimbingan keluarga sukinah bagi pasangan Hindu, maupun Hittasukhaya untuk umat Buddha. “Inilah makna dakwah sosial. Kemenag berupaya agar ajaran agama hadir bukan hanya di rumah ibadah, tapi di ruang publik: berbagi makanan, menjaga kesehatan, dan memperkuat keluarga,” kata Menag.

<strong>Menyejahterakan Pendidik</strong>

Peningkatan kesejahteraan pendidik, menjadi perhatian Presiden Prabowo, termasuk bagi guru dan dosen lembaga pendidikan agama dan keagamaan. Untuk kali pertama dalam sejarah, tunjangan profesi guru non-PNS dinaikkan secara signifikan, dari Rp1,5 juta menjadi Rp2 juta per bulan.

Tahun ini, sebanyak 206.325 guru telah mengikuti Pendidikan Profesi Guru (PPG), meningkat hingga 700% dibanding tahun sebelumnya. Selain itu ada lebih 5.000 dosen Perguruan Tinggi Keagamaan yang juga mengikuti PPG di 2025. Langkah ini menjadi bagian dari akselerasi peningkatan kesejahteraan karena guru dan dosen yang lulus PPG maka dapat menerima tunjangan profesi di tahun mendatang.

“Guru dan dosen adalah ruh pendidikan. Ketika mereka sejahtera dan dihargai, maka pendidikan agama akan bermartabat, dan bangsa akan berkarakter,” ujar Menag.

Kemenag juga memperluas akses pendidikan tinggi dengan memberikan 156.581 beasiswa KIP Kuliah, 6.453 Beasiswa Indonesia Bangkit, serta 2.270 Beasiswa Santri Berprestasi (PBSB). Tak hanya bagi umat Islam, beasiswa juga diberikan untuk 329 mahasiswa Orang Asli Papua (OAP), dan 153 penerima beasiswa zakat di 21 kampus negeri maupun swasta.

Dalam setahun terakhir, bantuan Program Indonesia Pintar (PIP) disalurkan kepada 19.264 siswa Pada Satuan Pendidikan Keagamaan Kristen, 161.591 Santri, serta 1.469 Siswa pada Satuan Pendidikan Keagamaan Hindu. “Lebih dari 9 triliun rupiah, anggaran Bantuan Operasional Pendidikan (BOP) Raudlatul Athfal dan Bantuan Operasional Sekolah (BOS) Madrasah disalurkan untuk mendukung peningkatan mutu pembelajaran,” sebut Menag.

Langkah besar lainnya adalah pendirian Sekolah Tinggi Agama Khonghucu Indonesia Negeri (SETIAKIN) di Bangka Belitung. Ini adalah sekolah tinggi Khonghucu negeri pertama di Indonesia. Selain perluasan akses, kehadiran SETIAKIN menjadi simbol kehadiran negara atas kebutuhan pendidikan tinggi keagamaan Khonghucu.

Kemenag juga hadir dalam menyukseskan program Sekolah Rakyat, Sekolah Garuda, dan Program Hasil Terbaik Cepat (PHTC) dalam revitalisasi madrasah. Untuk Sekolah Rakyat, Kemenag siapkan kurikulum pendidikan agama, serta 152 guru dan tenaga pendidik. Ada dua madrasah unggulan yang terpilih sebagai Sekolah Garuda Transformasi, yaitu: Madrasah Aliyah Negeri Insan Cendekia (MAN IC) Gorontalo dan Ogan Komering Ilir (Sumsel). Selain itu, ada 1.414 madrasah yang direvitalisasi dalam PHTC Presiden Prabowo.

“Buah dari upaya Kemenag memajukan pendidikan agama dan keagamaan menampakkan hasil. MAN IC Serpong menjadi Sekolah Terbaik berdasarkan nilai UTBK 2025, sedang MAN 2 Kota Malang menjadi Sekolah Terbaik dalam Olimpiade Sains Nasional (OSN) 2025,” papar Menag.

<strong>Memberdayakan Ekonomi Umat dan Ekoteologi</strong>

Dalam mendukung Asta Cita poin kedua tentang kemandirian ekonomi hijau, Kemenag terus memperluas pemberdayaan ekonomi umat berbasis zakat dan wakaf. Hingga Oktober 2025, Kemenag telah mengembangkan 37 Kampung Zakat, 29 inkubasi wakaf produktif, dan 10 Kota Wakaf di berbagai provinsi. Lebih dari 105.000 sertifikat tanah wakaf diterbitkan, dan ini sangat penting dalam upaya menekan potensi sengketa lahan. Selain itu, 40 hektare Hutan Wakaf digulirkan sebagai bentuk integrasi antara ekonomi dan ekoteologi.

Untuk memperkuat tata kelola dana keagamaan, Kemenag juga menggagas pembentukan Lembaga Pengelola Dana Umat (LPDU) — sebuah institusi modern untuk mengelola zakat, wakaf, infak, fidyah, dan sedekah secara profesional, transparan, dan berdaya guna tinggi bagi ekonomi rakyat.

Selain itu, Kemenag mendorong gerakan ekoteologi — kesadaran spiritual dalam menjaga bumi. Melalui aksi nyata, Kemenag menanam lebih dari satu juta pohon di seluruh Indonesia, membangun 13 KUA berbasis green building, dan menerbitkan buku “Tafsir Ayat-Ayat Ekologi” yang memperkuat gerakan hijau berbasis nilai keagamaan.

Membumikan Nilai Keagamaan

Menutup refleksi setahun perjalanan, Menag Nasaruddin Umar menegaskan bahwa keberhasilan Kemenag bukan hanya diukur dari program yang selesai, tetapi dari nilai-nilai agama yang benar-benar menjadi napas kebijakan publik. Karenanya, upaya membumikan nilai keagamaan perlu terus dilakukan.

“Agama tidak boleh berhenti di mimbar. Agama harus mewujud dalam kebijakan yang menyejahterakan, mendidik, dan memuliakan manusia. Inilah semangat Asta Cita yang kami kawal dengan sepenuh hati,” tegasnya.

Menag menyampaikan apresiasi kepada seluruh jajarannya yang terus bekerja keras dalam ikut mewujudkan Asta Protas Presiden Prabowo dan Wakil Presiden Gibran Rakabuming Raka. Menag juga menyampaikan apresiasi kepada media dan masyarakat yang terus mengawal perjalanan Kemenag dengan kritis dan konstruktif.

“Terima kasih kepada insan pers yang telah menjaga ruang publik tetap sehat. Kritik dan dukungan Anda adalah bagian dari ibadah kami dalam melayani umat,” pungkas Menag.***(sut)', 'KILASINDONESIA.COM - Setahun pemerintahan Presiden Prabowo Subianto–Gibran Rakabuming Raka menjadi momentum penting bagi Kementerian Agama (Kemenag) untuk menghadirkan wajah kehidupan beragama yang...', 'https://kilasindonesia.com/wp-content/uploads/2025/10/WhatsApp-Image-2025-10-21-at-20.58.00.jpeg', admin_user_id, 'PUBLISHED', 3511, '2025-10-23T04:46:36.000Z', '2025-10-23T04:46:36.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tnbizm64c', 'Kado Hari Santri, Presiden Setujui Pembentukan Ditjen Pesantren', 'kado-hari-santri-presiden-setujui-pembentukan-ditjen-pesantren', 'KILASINDONESIA.COM-Kabar gembira datang bertepatan dengan peringatan Hari Santri 2025. Presiden Prabowo Subianto menyetujui pembentukan Direktorat Jenderal (Ditjen) Pesantren di lingkungan Kementerian Agama.

Menteri Agama Nasaruddin Umar bersyukur atas kabar ini. Ia mengapresiasi para pihak yang telah mengawal terbitnya izin prakarsa pembentukan Ditjen Pesantren, khususnya Wakil Menteri Agama Romo Muhammad Syafi’i.

"Wabil khusus Wamenag telah memerjuangkannya sesegera mungkin," sebut Menag di Jakarta usai memimpin Apel Hari Santri 2025 di halaman Kantor Kementerian Agama, Rabu (22/10/2025).

Usul pembentukan Ditjen Pesantren sudah berlangsung sejak 2019, era Menag Lukman Hakim Saifuddin. Usulan Kemenag ke Kemenpan dan RB kembali diajukan pada 2021 dan 2023 pada era Menag Yaqut Cholil Qoumas. Terakhir, usulan itu kembali diajukan ke Kemenpan dan RB pada 2024, di era Menag Nasaruddin Umar.

Dalam kesempatan tersebut, Wakil Menteri Agama Romo Muhammad Syafi’i menyampaikan lebih detil terkait terbitnya izin prakarsa pembentukan Ditjen Pesantren.

“Alhamdulillah, saya baru saja menerima kabar dari Kementerian Sekretariat Negara tentang terbitnya Persetujuan Izin Prakarsa Penyusunan Rancangan Peraturan Presiden Tentang Perubahan atas Perpres Nomor 152 Tahun 2024 tentang Kementerian Agama,” ujar Wamenag.

Melalui surat nomor B-617/M/D-1/HK.03.00/10/2025 tertanggal 21 Oktober 2025, Presiden melalui Menteri Sekretaris Negara Prasetyo Hadi memerintahkan agar segera dibentuk Ditjen Pesantren di lingkungan Kementerian Agama.

“Dengan surat ini, saya ingin menyampaikan bahwa Presiden telah menyetujui pembentukan Ditjen Pesantren. Pembentukan ini bertujuan agar perhatian terhadap pesantren semakin besar—baik dari sisi personalia, pendanaan, maupun program—sehingga pemerintah semakin hadir dalam mendukung perkembangan pesantren di seluruh Indonesia,” lanjutnya.

Romo Syafi’i menambahkan, kehadiran Ditjen Pesantren akan memperkuat fungsi pesantren dalam tiga ranah utama: pendidikan, dakwah, dan pemberdayaan masyarakat.

“Semoga dengan adanya Ditjen ini, pesantren ke depan dapat semakin berdaya dan berkontribusi besar bagi bangsa,” harapnya.

Ia juga menyampaikan terima kasih kepada Presiden Prabowo, jajaran Kabinet Merah Putih, serta seluruh insan Kemenag yang sejak 2019 konsisten memperjuangkan lahirnya Ditjen Pesantren.

<strong>Menag Tegaskan Komitmen</strong>

Menag Nasaruddin umar mengungkapkan, Ditjen Pesantren ini nantinya akan melakukan konsolidasi pondok pesantren secara nasional. Selama ini, mungkin ada pesantren yang belum terdata atau belum terjangkau bantuan pemerintah. “Dengan adanya Ditjen, hal-hal tersebut bisa tertangani dengan lebih baik karena ada perangkat kerja yang lebih luas dan sistem yang lebih terkoordinasi,” jelas Menag.

Menag menegaskan bahwa keberadaan Ditjen Pesantren akan membantu pemerintah memastikan seluruh pesantren dapat menjalankan peran strategisnya dengan baik.

“Dengan Ditjen ini, kita bisa memantau seluruh pesantren dalam arti positif. Pemerintah ingin memastikan semua pesantren benar-benar menjalankan fungsi pendidikan, dakwah, dan pemberdayaan masyarakat secara optimal,” tegasnya.

Menurutnya, kehadiran Ditjen Pesantren juga akan memperkuat kontribusi Kemenag dalam menciptakan kerukunan umat, sekaligus membangun generasi santri yang kuat, cerdas, dan berakhlak mulia.

“Harapan kita, Hari Santri menjadi momentum kebangkitan semangat santri untuk menjawab tantangan zaman,” ujar Menag.

Ke depan, lanjut Menag, sistem pendataan dan sertifikasi pesantren akan diintensifkan agar data menjadi lebih valid dan pelaksanaan program semakin tertib.

“Selama ini sertifikasi sudah berjalan, tapi ke depan akan lebih diperkuat agar data pesantren semakin valid dan program-program pembinaannya lebih tepat sasaran,” tutup Menag.

<strong>Apel Hari Santri Bernuansa Kebersamaan</strong>

Apel Hari Santri tahun ini berlangsung penuh kekhidmatan. Petugas apel adalah para pejabat eselon I Kemenag lintas agama—simbol kuatnya semangat kebersamaan dan moderasi beragama.

Dirjen Bimas Katolik Suparman bertindak sebagai Komandan Apel. Pembacaan Pancasila dilakukan oleh Dirjen Bimas Hindu I Nengah Duija, sementara Dirjen Bimas Buddha Supriyadi membacakan Naskah Pembukaan UUD 1945.

Dirjen Pendidikan Islam Amien Suyitno dan Kepala Badan Moderasi Beragama dan Pengembangan SDM M. Ali Ramdhani masing-masing membacakan Resolusi Jihad dan Ikrar Santri. Doa penutup dipimpin Dirjen Bimas Islam Abu Rokhmad.

Dirjen Bimas Kristen Jeane Marie Tulung bertugas sebagai pembawa acara, diiringi paduan suara dari Ditjen Bimas Kristen.

Apel ini dihadiri para pejabat eselon II, ASN Kemenag, dan ratusan santri dari berbagai lembaga pendidikan keagamaan.***', 'KILASINDONESIA.COM-Kabar gembira datang bertepatan dengan peringatan Hari Santri 2025. Presiden Prabowo Subianto menyetujui pembentukan Direktorat Jenderal (Ditjen) Pesantren di lingkungan...', 'https://kilasindonesia.com/wp-content/uploads/2025/10/IMG-20251022-WA0002.jpg', admin_user_id, 'PUBLISHED', 1633, '2025-10-22T14:29:27.000Z', '2025-10-22T14:29:27.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'kado-hari-santri-presiden-setujui-pembentukan-ditjen-pesantren');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t35hhm02w', 'Tunggal Putra Paceklik Gelar All England 25 Tahun, Ini Saran Untuk Jonatan dkk', 'tunggal-putra-paceklik-gelar-all-england-25-tahun-ini-saran-untuk-jonatan-dkk', 'Sudah 25 tahun tunggal putra puasa gelar juara All England 2019. Legenda bulutangkis, Haryanto Arbi, meminta agar Jonatan Christie dkk berlatih lebih keras lagi.

Indonesia hanya merebut satu gelar juara dari All England 2019, yakni dari pasangan nonpelatnas, Hendra Setiawan/Mohammad Ahsan.

Dengan kekuatan tiga pemain di sektor tunggal, tak satupun yang lolos ke semifinal.

Anthony Sinisuka Ginting tersingkir di babak pertama, Jonatan Christie menyudahi penampilan di babak kedua, sedangkan Tommy harus pulang setelah kalah di perempatfinal.', 'Sudah 25 tahun tunggal putra puasa gelar juara All England 2019. Legenda bulutangkis, Haryanto Arbi, meminta agar Jonatan Christie dkk berlatih lebih keras lagi. Indonesia hanya merebut satu gelar...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/jonatan-christie-min.jpg', admin_user_id, 'PUBLISHED', 5299, '2019-03-17T08:48:07.000Z', '2019-03-17T08:48:07.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'tunggal-putra-paceklik-gelar-all-england-25-tahun-ini-saran-untuk-jonatan-dkk');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tcpp0t3wg', 'Klasemen F1 2019 Usai Bottas Menangi GP Australia', 'klasemen-f1-2019-usai-bottas-menangi-gp-australia', 'Driver Mercedes Valtteri Bottas memenangi seri pembuka Formula 1 2019 dalam Grand Prix Australia. Berikut klasemen pebalap usai race tersebut.

Di Sirkuit Melbourne Park, Australia, Minggu (17/3/2019), Bottas menjadi yang tercepat dengan waktu 1 jam 25 menit 27.325 detik, unggul 20,8 detik dari rekan setimnya di Mercedes Lewis Hamilton.

Hamilton sendiri finis kedua, meski memulai balapan dari posisi terdepan.

Di tempat ketiga ada driver Red Bull Max Verstapen, disusul duo Ferrari Sebastian Vettel dan Charles Leclerc yang mengunci posisi lima besar.

Sementara Bottas pun memimpin klasemen pebalap dengan 26 poin. Driver asal Finlandia itu mendapat tambahan satu poin usai juga berhasil menorehkan waktu lap tercepat dalam balapan kali ini.

Aturan baru F1 sendiri akan memberi peraih waktu lap tercepat dalam posisi 10 besar tambahan satu angka.', 'Driver Mercedes Valtteri Bottas memenangi seri pembuka Formula 1 2019 dalam Grand Prix Australia. Berikut klasemen pebalap usai race tersebut. Di Sirkuit Melbourne Park, Australia, Minggu...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/olahraga-f1-min.jpg', admin_user_id, 'PUBLISHED', 903, '2019-03-17T08:43:26.000Z', '2019-03-17T08:43:26.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'klasemen-f1-2019-usai-bottas-menangi-gp-australia');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t112816u9', 'Tontowi Ahmad/Liliyana Natsir Sabet Gelar Juara Dunia Kedua', 'tontowi-ahmad-liliyana-natsir-sabet-gelar-juara-dunia-kedua', 'Ganda campuran Indonesia, Tontowi Ahmad/Liliyana Natsir menjadi juara pada Kejuaraan Dunia Bulu Tangkis 2017 di Glasgow, Skotlandia, Senin (28/8/2017) WIB.

Owi/Butet mengalahkan pasangan asal China, Zheng Siwei/Chen Qingchen, dengan skor 15-21, 21-16, 21-15.

Ini menjadi gelar juara dunia bulu tangkis kedua bagi Tontowi/Liliyana.

Penempatan bola yang mereka lakukan beberapa kali sukses mengelabui Tontowi/Liliyana.

Owi/Butet bangkit pada gim kedua berkat sejumlah kesalahan yang dilakukan Zheng/Chen.

Gim kedua akhirnya dimenangi oleh Tontowi/Liliyana dan pertandingan harus ditentukan melalui rubber game.', 'Ganda campuran Indonesia, Tontowi Ahmad/Liliyana Natsir menjadi juara pada Kejuaraan Dunia Bulu Tangkis 2017 di Glasgow, Skotlandia, Senin (28/8/2017) WIB. Owi/Butet mengalahkan pasangan asal China,...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/tontowi-ahmadliliyana-natsir-min.jpg', admin_user_id, 'PUBLISHED', 1857, '2019-03-17T08:32:45.000Z', '2019-03-17T08:32:45.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'tontowi-ahmad-liliyana-natsir-sabet-gelar-juara-dunia-kedua');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t981os92y', 'Pergantian Jitu Luis Milla yang Mengantar Indonesia ke Semifinal', 'pergantian-jitu-luis-milla-yang-mengantar-indonesia-ke-semifinal', 'Jakarta - Indonesia berhasil mengalahkan Kamboja 2-0. Sempat buntu di babak pertama, Luis Milla mengubah taktik dan berbuah hasil.

Bermain di Stadion Shah Alam, Malaysia, Kamis (24/8/2017) sore WIB, Luis Milla kembali menurunkan formasi andalal 4-2-3-1. Dengan target meraih kemenangan 3-0 atas Kamboja demi mengamankan tike ke semifinal. Marinus Maryanto Wanewar dimainkan sejak menit pertama.

Marinus disokong oleh Septian David Maulan yang tepat ada di belakang. Sementara itu, Osvaldo Haay dan Saddil Ramdani bertugas sebagai penyisir sisi kanan dan kiri.

<!--nextpage-->

Di posisi poros tengah, Muhammad Hargianto berduet dengan Evan Dimas. Sementara itu, Ricky Fajrin kembali ke posisi semula sebagai bek kiri untuk menggantikan peran Rezaldi Hehanusa.

Seperti yang sudah-sudah, Indonesia kembali menyerang dengan mengandalkan kecepatan di sisi lapangan. Umpan-umpan silang pun jadi opsi untuk masuk ke area kotak penalti.

Namun, upaya tersebut kerap gagal. Osvaldo, yang ada di sisi kiri tampil kurang oke dalam memberi tusukan ke kotak penalti. Tak hanya itu, umpan silang yang dikirim dari kedua sisi Indonesia juga kerap mudah dipatahkan.', 'Jakarta - Indonesia berhasil mengalahkan Kamboja 2-0. Sempat buntu di babak pertama, Luis Milla mengubah taktik dan berbuah hasil. Bermain di Stadion Shah Alam, Malaysia, Kamis (24/8/2017) sore WIB,...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/Luis-Milla-nuevo-entrenador-del-Zaragoza-min.jpg', admin_user_id, 'PUBLISHED', 5388, '2019-03-17T08:28:54.000Z', '2019-03-17T08:28:54.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'pergantian-jitu-luis-milla-yang-mengantar-indonesia-ke-semifinal');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tb5x7b45x', 'Jokowi Minta ASEAN Tangani Masalah Muslim Rohingya di Rakhine State', 'jokowi-minta-asean-tangani-masalah-muslim-rohingya-di-rakhine-state', 'Presiden Jokowi menerima Menteri Luar Negeri Thailand Don Pramudwinai di Istana Merdeka, Jakarta Pusat, Rabu (13/3/2019).

Dalam pertemuan, Jokowi menyampaikan pentingnya konsep kerja sama Indo-Pasifik terkait nasib muslim Rohingya di Kota Rakhine, Myanmar.

"Mengenai masalah Rakhine State, Presiden menyampaikan pentingnya keterlibatan ASEAN dalam membantu Myanmar di dalam mempersiapkan repatriasi yang sukarela, damai, dan bermartabat," kata Menteri Luar Negeri Retno Marsudi usai melakukan pertemuan di Istana Merdeka, Jakara Pusat, Rabu (13/3/2019).

Retno mengatakan, Thailand, yang saat ini menjadi Ketua Negara-Negara ASEAN, perlu membahas lebih jauh mengenai rencana itu.', 'Presiden Jokowi menerima Menteri Luar Negeri Thailand Don Pramudwinai di Istana Merdeka, Jakarta Pusat, Rabu (13/3/2019). Dalam pertemuan, Jokowi menyampaikan pentingnya konsep kerja sama...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/rohingyabangladeshafplima-min.jpg', admin_user_id, 'PUBLISHED', 4507, '2019-03-16T17:57:26.000Z', '2019-03-16T17:57:26.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'jokowi-minta-asean-tangani-masalah-muslim-rohingya-di-rakhine-state');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tamtnfs71', 'Demi Xpander, Mitsubishi Bakal Mengimpor Kembali Pajero Sport', 'demi-xpander-mitsubishi-bakal-mengimpor-kembali-pajero-sport', 'Peningkatan penjualan yang sangat signifikan untuk small MPV PT Mitsubishi Motors Krama Yudha Sales Indonesia (MMKSI), Xpander sepertinya bakal berpengaruh terhadap model lain pabrikan berlambang tiga berlian ini.

Pasalnya, beredar rencana untuk mengejar produksi pesaing Toyota Avanza ini, Pajero Sport bakal kembali berstatus impor alias CBU.

Menurut Direktur of Sales &amp; Marketing Division PT MMKSI, Irwan Kuncoro, hingga saat ini Pajero Sport masih diproduksi di Indonesia.

Jadi, kalaupun dikaitkan dengan rencana ada impor itu, sebetulnya itu rencana untuk sementara, karena itu bagian dari peningkatan kapasitas untuk Xpander," jelas Irwan di sela-sela media gathering, di bilangan Jakarta Pusat, belum lama ini.

Lanjut Irwan, rencana status Pajero Sport yang kembali impor memang belum terealisasi. Dan berbicara sampai kapan, memang harus dilihat dahulu, kapan waktu mulainya, karena hingga saat ini memang belum dilaksanakan (impor Pajero Sport).', 'Peningkatan penjualan yang sangat signifikan untuk small MPV PT Mitsubishi Motors Krama Yudha Sales Indonesia (MMKSI), Xpander sepertinya bakal berpengaruh terhadap model lain pabrikan berlambang...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/pajero-sport-dakar-min.jpg', admin_user_id, 'PUBLISHED', 1217, '2019-03-16T10:53:59.000Z', '2019-03-16T10:53:59.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'demi-xpander-mitsubishi-bakal-mengimpor-kembali-pajero-sport');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tu4zbb8f1', 'Sosok New Nissan Livina Terungkap, Apa Kata NMI?', 'sosok-new-nissan-livina-terungkap-apa-kata-nmi', 'Setelah pecinta otomotif dihebohkan dengan bocoran Toyota Avanza baru, kini muncul gambar yang disinyalir sebagai Nissan Livina anyar.

Gambar tersebut, beredar luas di media sosial dan juga grup aplikasi percakapan elektronik.

Dilihat dari gambar yang beredar, Nissan Livina baru ini memperlihatkan wajah depan yang cukup jelas.

Jika diperhatikan, muka low multi purpose vehicle (LMVP) andalan PT Nissan Motor Indonesia (NMI) ini mirip dengan salah satu sport utility vehicle (SUV) yang cukup populer, X-Trail.

"New Livina pesan sekarang, hanya di Nissan Datsun Sunter," tulis keterangan sebagai caption dalam foto yang beredar terebut.

Mencoba mengkonfirmasi kepada pihak NMI, melalui Head of Communicationnya, Hana Maharani enggan berkomentar terkait foto yang beredar tersebut.', 'Setelah pecinta otomotif dihebohkan dengan bocoran Toyota Avanza baru, kini muncul gambar yang disinyalir sebagai Nissan Livina anyar. Gambar tersebut, beredar luas di media sosial dan juga grup...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/new-nissan-grand-livina-min.jpg', admin_user_id, 'PUBLISHED', 1785, '2019-03-16T09:43:44.000Z', '2019-03-16T09:43:44.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'sosok-new-nissan-livina-terungkap-apa-kata-nmi');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2ts5yzm9es', 'Aliansi Nissan-Mitsubishi Luncurkan Livina Versi Mungil', 'aliansi-nissan-mitsubishi-luncurkan-livina-versi-mungil', 'Nissan meluncurkan Nissan Livina berbasis Xpander beberapa waktu lalu di Indonesia. Di Jepang, aliansi Nissan-Mitsubishi meluncurkan empat mobil jenis Kei car baru.

Beberapa kendaraan di antaranya: Nissan Dayz, Nissan Dayz Highway Star, Mitsubishi eK Wagon dan Mitsubishi eK X. Bentuknya sangat mirip dengan Livina dan Xpander.

Nah, produksi mobil mini ini, ditangani oleh perusahaan patungan, NMKV. Dan mereka siap melakukan produksi di Pabrik Mizushima Mitsubishi di Kurashiki, Jepang.

Sebetulnya, kerja bareng antara Nissan dengan Mitsubishi meluncurkan Kei car terjalin pada 2013. Lalu terjadi peningkatan kolaborasi bisnis, sejak keduanya menjadi mitra aliansi pada 2016.

Untuk pertama kalinya, Kei car Nissan dan Mitsubishi siap menawarkan teknologi mengemudi semi-otonom. Kemampuan yang dirancang untuk penggunaan jalur tunggal di jalan raya.', 'Nissan meluncurkan Nissan Livina berbasis Xpander beberapa waktu lalu di Indonesia. Di Jepang, aliansi Nissan-Mitsubishi meluncurkan empat mobil jenis Kei car baru. Beberapa kendaraan di antaranya:...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/Nissan-Mitsubishi-keicar-min.jpg', admin_user_id, 'PUBLISHED', 5283, '2019-03-16T09:37:12.000Z', '2019-03-16T09:37:12.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'aliansi-nissan-mitsubishi-luncurkan-livina-versi-mungil');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2ttj73v5gc', 'Video: Kelemahan dan Kelebihan All New Terios', 'video-kelemahan-dan-kelebihan-all-new-terios', 'Daihatsu Terios pertama kali terjun ke pasar Tanah Air 2006 silam. Setelah berumur 10 tahun lebih, PT Astra Daihatsu Motor (ADM) sadar kalau persaingan mulai ketat, maka PT ADM meluncurkan model terbarunya pada November 2017 lalu dengan ubahan yang signifikan.

Menariknya meskipun eksterior, interior berubah total dan berbagai fitur canggih sudah tertanam pada All New Terios harga jualnya masih sama dengan versi sebelumnya.

Seperti diketahui, Terios baru ini sudah dibekali fitur smart keyless, vehicle stability control, around view monitor, dan Hill Start Assist.

Sementara untuk dapur pacunya, Terios baru ini juga memiliki mesin baru yang sama dengan mesin Toyota Avanza yakni, 2NR-VE berkapasitas 1.500 cc yang dapat menyemburkan tenaga 104 daya kuda dan torsi 135 newton meter, dengan pilihan transmisi matik konvensional 4-percepatan dan manual 5-percepatan.', 'Daihatsu Terios pertama kali terjun ke pasar Tanah Air 2006 silam. Setelah berumur 10 tahun lebih, PT Astra Daihatsu Motor (ADM) sadar kalau persaingan mulai ketat, maka PT ADM meluncurkan model...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/all-new-terios-min.jpg', admin_user_id, 'PUBLISHED', 971, '2019-03-16T09:03:53.000Z', '2019-03-16T09:03:53.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'video-kelemahan-dan-kelebihan-all-new-terios');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tiuxmxtyb', 'Prabowo Resmikan Kantor DPD Gerindra di Banten', 'prabowo-resmikan-kantor-dpd-gerindra-di-banten', 'Serang - Capres Prabowo Subianto meresmikan kantor baru DPD Gerindra Banten di Jalan Serang-Pandeglang. Selain meresmikan, kedatangannya ke Banten akan bertemu dengan pendukung di rumah aspirasi.

Ketua DPD Banten Desmon J Mahesa mengatakan, Prabowo secara khusus meresmikan rumah partai Gerindra Banten yang baru.

Prabowo juga dijadwalkan menyapa partai koalisi, relawan dan masyarakat Banten.

"Hari ini Pak Prabowo datang dalam rangka meresmikan DPD partai, kedua akan ke rumah aspirasi saya di Ciwaru dalam rangka menyapa masyarakat," kata Desmon singkat di Jalan Serang-Pandeglang, Banten, Sabtu (16/3/2019).

Prabowo langsung memberikan tumpeng ke salah satu tokoh Banten Buya Humaid Tanara sebagai prosesi peresmian. Ia juga menandatangani prasasti gedung DPD Gerindra.', 'Serang - Capres Prabowo Subianto meresmikan kantor baru DPD Gerindra Banten di Jalan Serang-Pandeglang. Selain meresmikan, kedatangannya ke Banten akan bertemu dengan pendukung di rumah aspirasi....', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/thumbnail-berita-6-min.jpg', admin_user_id, 'PUBLISHED', 2947, '2019-03-16T08:55:46.000Z', '2019-03-16T08:55:46.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'prabowo-resmikan-kantor-dpd-gerindra-di-banten');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2t0z24pmin', '14 Tahun Terbunuhnya Munir, Polri Didesak Bentuk Tim Khusus', '14-tahun-terbunuhnya-munir-polri-didesak-bentuk-tim-khusus', 'Jakarta - Hari yang sama 14 tahun lalu, Munir Said Thalib meninggal di dalam pesawat yang mengantarnya ke Amsterdam, Belanda. Munir diracun di udara.

Pollycarpus Budihari Priyanto, seorang pilot senior Garuda Indonesia saat itu, ditangkap dan diadili. Dia divonis 14 tahun penjara, tetapi majelis hakim yang mengadilinya yakin ada dalang di balik pembunuhan Munir. Siapa?

Pertanyaan itu hingga Pollycarpus akhirnya bebas tahun ini pun belum terjawab. Presiden Joko Widodo (Jokowi) didesak mengambil tindakan.

"Kembali kami menegaskan negara belum mampu membongkar konspirasi dalam kejahatan ini.

Pernyataan Presiden Joko Widodo bahwa kasus pembunuhan Munir adalah pekerjaan rumah yang harus diselesaikan masih sebatas janji tanpa bukti," ujar salah satu aktivis HAM dari Kontras, Yati Andriani, di Jalan Kramat II, Senen, Jakarta Pusat, Jumat (7/9/2018).', 'Jakarta - Hari yang sama 14 tahun lalu, Munir Said Thalib meninggal di dalam pesawat yang mengantarnya ke Amsterdam, Belanda. Munir diracun di udara. Pollycarpus Budihari Priyanto, seorang pilot...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/thumbnail-berita-5-min.jpg', admin_user_id, 'PUBLISHED', 4975, '2019-03-16T08:28:00.000Z', '2019-03-16T08:28:00.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = '14-tahun-terbunuhnya-munir-polri-didesak-bentuk-tim-khusus');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tkozhzdra', '2 Hari Hilang, Nelayan Tewas Mengambang di Pantai Cipalawah Garut', '2-hari-hilang-nelayan-tewas-mengambang-di-pantai-cipalawah-garut', 'Garut - Setelah melakukan pencarian selama dua hari, petugas Basarnas dan Polairud menemukan jasad Maulana di Pantai Cipalawah, Kabupaten Garut, Jawa Barat. Jenazah pria tersebut langsung dievakuasi petugas.

"Setelah melakukan pencarian selama 2 hari, Tim SAR Bandung akhirnya dapat menemukan korban.

Ditemukan dalam keadaan meninggal dunia," kata Humas Kantor SAR Bandung Joshua Banjarnahor via pesan singkat, Sabtu (16/3/2019).

Nelayan berusia 45 tahun asal Garut ini dilaporkan hilang di pesisir Pantai Cipalawah, Desa Sancang, Kecamatan Cibalong, Garut, Kamis (14/3).

Kapolsek Cibalong AKP Ridwan Tampubolon menyebutkan Maulana menghilang saat hendak mencari ikan dengan cara menyelam di pantai menggunakan busur panah.', 'Garut - Setelah melakukan pencarian selama dua hari, petugas Basarnas dan Polairud menemukan jasad Maulana di Pantai Cipalawah, Kabupaten Garut, Jawa Barat. Jenazah pria tersebut langsung dievakuasi...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/thumbnail-berita-4-min.jpg', admin_user_id, 'PUBLISHED', 1662, '2019-03-16T08:22:08.000Z', '2019-03-16T08:22:08.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = '2-hari-hilang-nelayan-tewas-mengambang-di-pantai-cipalawah-garut');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2toceg9qv6', 'Bersih-bersih, 60 Warga Tanjung Priok Ikuti Program Padat Karya', 'bersih-bersih-60-warga-tanjung-priok-ikuti-program-padat-karya', 'Jakarta - Kementerian Perhubungan (Kemenhub) melalui Distrik Navigasi (Disnav) Kelas I Tanjung Priok Jakarta menggelar program padat karya.

Sedikitnya 60 orang warga dari Kelurahan Tanjung Priok, Pademangan Barat, Sungai Bambu, dan Warakas Jakarta Utara turut terlibat dalam kegiatan ini.

"Program padat karya yang dilaksanakan di berbagai kantor Distrik Navigasi yang tersebar di seluruh Indonesia, termasuk di Distrik Navigasi Kelas I Tanjung Priok ini dilaksanakan secara berkesinambungan dari tahun ke tahun secara swakelola," kata Direktur Kenavigasian, Basar Antonius dalam keterangan tertulis, Sabtu (16/3/2019).

Hal tersebut diungkapkannya saat membuka kegiatan padat karya tersebut di halaman Kantor Disnav Kelas I Tanjung Priok, Jakarta.

Menurut Basar, kegiatan padat karya seperti ini dapat membuat lingkungan kerja yang bersih dan nyaman bagi para pegawai Disnav Tanjung Priok.', 'Jakarta - Kementerian Perhubungan (Kemenhub) melalui Distrik Navigasi (Disnav) Kelas I Tanjung Priok Jakarta menggelar program padat karya. Sedikitnya 60 orang warga dari Kelurahan Tanjung Priok,...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/thumbnail-berita-3-min.jpg', admin_user_id, 'PUBLISHED', 4337, '2019-03-16T08:10:58.000Z', '2019-03-16T08:10:58.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'bersih-bersih-60-warga-tanjung-priok-ikuti-program-padat-karya');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2tts9tjear', 'Menag Kecam Penembakan di New Zealand: Tak Berperikemanusiaan!', 'menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan', 'Jakarta - Menteri Agaman Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand. Dia mengatakan aksi terorisme itu bertentangan dengan nilai-nilai agama.

"Itu tindakan tidak berperikemanusiaan dan sangat bertentangan dengan nilai-nilai agama," kata Lukman dalam keterangan tertulis, Sabtu (16/3/2019).

Lukman mengatakan aksi terorisme tidak dibenarkan dalam ajaran agama apa pun. Jadi, menurutnya, penembakan terhadap jemaah di dua Masjid di Selandia Baru adalah aksi pengecut dan tak bertanggung jawab.

Dia mengajak seluruh umat beragam untuk menahan diri dan meningkatkan kewaspadaan. Pemerintah melalui Kementerian Luar Negeri juga bekerja keras mencari kabar perkembangan kondisi di Selandia Baru, termasuk memastikan kondisi keamanan warga negara Indonesia.

Dia juga meminta seluruh warga tidak menyebarkan video aksi penembakan yang dilakukan pelaku.', 'Jakarta - Menteri Agaman Lukman Hakim Saifuddin mengecam aksi penembakan di dua masjid di Christchurch, New Zealand. Dia mengatakan aksi terorisme itu bertentangan dengan nilai-nilai agama. "Itu...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/Thumbnail-berita-2-min.jpg', admin_user_id, 'PUBLISHED', 681, '2019-03-16T07:56:50.000Z', '2019-03-16T07:56:50.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan');
  INSERT INTO posts (id, title, slug, content, excerpt, "featuredImage", "authorId", status, "viewCount", "publishedAt", "createdAt", "updatedAt")
  SELECT 'cml2zvw2trubm2i83', 'Solidaritas Korban Penembakan, DKI Beri Warna Bendera New Zealand di JPO GBK', 'solidaritas-korban-penembakan-dki-beri-warna-bendera-new-zealand-di-jpo-gbk', 'Pemprov DKI turut berbelasungkawa atas penembakan di dua masjid di Christchurch, New Zealand, yang menewaskan 49 orang.

Warna-warna bendera Selandia Baru akan dimunculkan selama seminggu di jembatan penyeberangan orang (JPO) Gelora Bung Karno.

Kepala Dinas Bina Marga Hari Nugroho mengatakan kombinasi warna itu dimunculkan di JPO GBK sebagai bentuk solidaritas dan dukungan Jakarta kepada Selandia Baru. Terutama keluarga korban penembakan massal di dua masjid tersebut.

"Ini sesuai dengan arahan Pak Gubernur," ujar Hari lewat keterangannya, Sabtu (16/3/2019).

Pemunculan warna-warna bendera Selandia Baru ini sudah dilakukan sejak Jumat (15/3) malam. Kombinasi warna yang ada di bendera tersebut adalah merah, biru, dan putih.', 'Pemprov DKI turut berbelasungkawa atas penembakan di dua masjid di Christchurch, New Zealand, yang menewaskan 49 orang. Warna-warna bendera Selandia Baru akan dimunculkan selama seminggu di jembatan...', 'http://demo.idtheme.com/bloggingpro/wp-content/uploads/2019/03/thumbnail-1.jpg', admin_user_id, 'PUBLISHED', 729, '2019-03-16T07:48:14.000Z', '2019-03-16T07:48:14.000Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM posts WHERE slug = 'solidaritas-korban-penembakan-dki-beri-warna-bendera-new-zealand-di-jpo-gbk');

  -- Post-Category relationships
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-pastikan-kbm-madrasah-di-sumatera-barat-berjalan-pascabanjir'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kajari-depok-kunjungi-mui-jalin-sinergitas-perkuat-kerjasama'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-rayakan-hab-ke-80-dengan-sederhana-dana-difokuskan-untuk-korban-bencana'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'pengisian-pdss-span-ptkin-2026-resmi-dibuka-sekolah-diminta-pastikan-keakuratan-data-siswa'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-tegaskan-pendidikan-islam-harus-jawab-krisis-global'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kinerja-komunikasi-direktorat-pai-menguat-publik-apresiasi-program-pendidikan-agama-islam'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'direktorat-pai-teguhkan-pendidikan-agama-islam-sebagai-investasi-peradaban-bangsa-sepanjang-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-perkuat-literasi-al-quran-di-sekolah-asesmen-nasional-jadi-fondasi-kebijakan-pendidikan-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'program-tbq-guru-madrasah-resmi-dibuka-kemenag-catat-403-ribu-guru-masuk-basis-data'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = '75-peserta-lapp-siap-berangkat-studi-s2-dan-s3-ke-luar-negeri'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-lakukan-penguatan-mutu-pendidikan-mi-di-kota-surakarta-melalui-pelatihan-literasi-untuk-pengawas-dan-kepala-madrasah'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-di-wisuda-stit-muhammadiyah-ngawi-manfaatkan-beasiswa-untuk-lanjut-studi-magister'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-di-fisip-uin-surabaya-budaya-mutu-bekal-terbaik-menyambut-indonesia-emas-2045'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-raih-dua-penghargaan-dari-kpk-di-hari-antikorupsi-sedunia-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'sekjen-kemenag-harap-luaran-penelitian-harus-berdampak'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'sukses-optimalkan-unit-bisnis-kemenag-dorong-kampus-blu-contoh-kemandirian-finansial-uin-jakarta'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'stadium-general-stai-pati-kemenag-buka-pendidikan-untuk-semua'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-umumkan-peraih-anugerah-gtk-pada-puncak-hgn-2025-berikut-daftarnya'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'puncak-hgn-2025-doa-guru-ekoteologi-kedermawanan-dan-kolaborasi-nasional-menguatkan-ekosistem-pendidikan-islam'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'delegasi-fakultas-syariah-uin-khas-jember-raih-juara-favorit-lomba-peradilan-semu-tingkat-nasional-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'lagi-fakultas-syariah-uin-khas-jember-luncurkan-15-buku-dan-hki-karya-dosen-dan-mahasiswa'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-buka-pengajuan-kenaikan-jabatan-akademik-dosen-lektor-kepala-dan-guru-besar-rumpun-ilmu-agama-periode-iii-tahun-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-lakukan-percepatan-penyaluran-beasiswa-jelang-lpdp-tutup-buku-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-teguhkan-ekoteologi-sebagai-gerakan-nasional-pendidikan-ramah-iklim'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'fsh-ptkin-unggul-dalam-lomba-debat-hukum-bawaslu-ri'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'penguatan-pembentukan-direktorat-jenderal-pesantren-didorong-jadi-pelopor-ekoteologi-nasional'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'pendirian-ditjen-pesantren-dimantapkan-para-kiai-di-yogyakarta-soroti-transformasi-digital-penguatan-karakter-dan-kepemimpinan-santri'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'negara-dorong-era-baru-transformasi-pesantren-santri-ditarget-lebih-mandiri-dan-kompetitif'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'transformasi-pesantren-ulama-jawa-tengah-tekankan-rekognisi-alumni-etika-teknologi-dan-penguatan-ruang-publik-santri'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'halaqah-pesantren-di-uin-malang-momentum-penguatan-mutu-dan-kemandirian-ditjen-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'harmonisasi-tradisi-dan-modernitas-warnai-gagasan-penguatan-pesantren-di-sumatera-barat'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-dorong-asosiasi-prodi-manajemen-pendidikan-islam-se-indonesia-manfaatkan-layanan-beasiswa-dan-riset-kolaboratif'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'menag-dapat-anugerah-penggerak-nusantara-2025-bidang-harmoni-dan-ekoteologi'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'gagas-intelektualisasi-santri-pesantren-didorong-lahirkan-generasi-berwawasan-luas-dan-adaptif'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'british-council-dan-kementerian-agama-perkuat-hubungan-melalui-kolaborasi-di-bidang-pendidikan-dan-kerukunan-antarumat-beragama'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'majelis-taklim-datokarama-menggelar-haul-ke-21-kh-mansyur-muchtar-perintis-fdki-uin-palu'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'menag-dorong-kajian-ontologi-pendidikan-sebagai-rumusan-arah-baru-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'kemenag-matangkan-pembentukan-ditjen-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'uin-mataram-tegaskan-peran-strategis-dalam-penguatan-ekosistem-pesantren-dan-riset-manuskrip-nusantara'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'halaqah-uin-raden-intan-lampung-dorong-pembentukan-ditjen-pesantren-sebagai-penguat-ekosistem-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'ulama-kalimantan-menekankan-standarisasi-kitab-kuning-sertifikasi-guru-dan-arah-kebijakan-direktorat-jenderal-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'uin-ar-raniry-aceh-dorong-penguatan-peran-pesantren-dalam-sistem-pendidikan-nasional'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'lahirkan-santri-berilmu-dan-berakhlak-pesantren-jadi-pilar-ketahanan-dan-kebangkitan-bangsa'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = '351-2'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'man-3-bantul-sabet-medali-emas-fiksi-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'edukasi' AND p.slug = 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'kado-hari-santri-presiden-setujui-pembentukan-ditjen-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'tunggal-putra-paceklik-gelar-all-england-25-tahun-ini-saran-untuk-jonatan-dkk'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'klasemen-f1-2019-usai-bottas-menangi-gp-australia'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'tontowi-ahmad-liliyana-natsir-sabet-gelar-juara-dunia-kedua'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'pergantian-jitu-luis-milla-yang-mengantar-indonesia-ke-semifinal'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'jokowi-minta-asean-tangani-masalah-muslim-rohingya-di-rakhine-state'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'demi-xpander-mitsubishi-bakal-mengimpor-kembali-pajero-sport'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'sosok-new-nissan-livina-terungkap-apa-kata-nmi'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'aliansi-nissan-mitsubishi-luncurkan-livina-versi-mungil'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'video-kelemahan-dan-kelebihan-all-new-terios'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'prabowo-resmikan-kantor-dpd-gerindra-di-banten'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = '14-tahun-terbunuhnya-munir-polri-didesak-bentuk-tim-khusus'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = '2-hari-hilang-nelayan-tewas-mengambang-di-pantai-cipalawah-garut'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'bersih-bersih-60-warga-tanjung-priok-ikuti-program-padat-karya'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);
  INSERT INTO "_PostCategories" ("A", "B")
  SELECT c.id, p.id FROM categories c, posts p
  WHERE c.slug = 'nasional' AND p.slug = 'solidaritas-korban-penembakan-dki-beri-warna-bendera-new-zealand-di-jpo-gbk'
  AND NOT EXISTS (SELECT 1 FROM "_PostCategories" pc WHERE pc."B" = p.id);

  -- Post-Tag relationships
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-pastikan-kbm-madrasah-di-sumatera-barat-berjalan-pascabanjir' AND t.slug = 'aceh'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-pastikan-kbm-madrasah-di-sumatera-barat-berjalan-pascabanjir' AND t.slug = 'belajar-mengajar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-pastikan-kbm-madrasah-di-sumatera-barat-berjalan-pascabanjir' AND t.slug = 'kbm'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kajari-depok-kunjungi-mui-jalin-sinergitas-perkuat-kerjasama' AND t.slug = 'depok'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kajari-depok-kunjungi-mui-jalin-sinergitas-perkuat-kerjasama' AND t.slug = 'mui'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kajari-depok-kunjungi-mui-jalin-sinergitas-perkuat-kerjasama' AND t.slug = 'kejari-depok'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-rayakan-hab-ke-80-dengan-sederhana-dana-difokuskan-untuk-korban-bencana' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-rayakan-hab-ke-80-dengan-sederhana-dana-difokuskan-untuk-korban-bencana' AND t.slug = '2026'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'pengisian-pdss-span-ptkin-2026-resmi-dibuka-sekolah-diminta-pastikan-keakuratan-data-siswa' AND t.slug = 'ptkin'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'pengisian-pdss-span-ptkin-2026-resmi-dibuka-sekolah-diminta-pastikan-keakuratan-data-siswa' AND t.slug = '2026'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-tegaskan-pendidikan-islam-harus-jawab-krisis-global' AND t.slug = 'pendidikan-islam'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kinerja-komunikasi-direktorat-pai-menguat-publik-apresiasi-program-pendidikan-agama-islam' AND t.slug = '2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kinerja-komunikasi-direktorat-pai-menguat-publik-apresiasi-program-pendidikan-agama-islam' AND t.slug = 'kinerja'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kinerja-komunikasi-direktorat-pai-menguat-publik-apresiasi-program-pendidikan-agama-islam' AND t.slug = 'direktorat-pendidikan-agama-islam-pai'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'direktorat-pai-teguhkan-pendidikan-agama-islam-sebagai-investasi-peradaban-bangsa-sepanjang-2025' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'direktorat-pai-teguhkan-pendidikan-agama-islam-sebagai-investasi-peradaban-bangsa-sepanjang-2025' AND t.slug = 'literasi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-perkuat-literasi-al-quran-di-sekolah-asesmen-nasional-jadi-fondasi-kebijakan-pendidikan-agama' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'program-tbq-guru-madrasah-resmi-dibuka-kemenag-catat-403-ribu-guru-masuk-basis-data' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'program-tbq-guru-madrasah-resmi-dibuka-kemenag-catat-403-ribu-guru-masuk-basis-data' AND t.slug = 'tbq'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'program-tbq-guru-madrasah-resmi-dibuka-kemenag-catat-403-ribu-guru-masuk-basis-data' AND t.slug = 'guru-madrasah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '75-peserta-lapp-siap-berangkat-studi-s2-dan-s3-ke-luar-negeri' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-lakukan-penguatan-mutu-pendidikan-mi-di-kota-surakarta-melalui-pelatihan-literasi-untuk-pengawas-dan-kepala-madrasah' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-lakukan-penguatan-mutu-pendidikan-mi-di-kota-surakarta-melalui-pelatihan-literasi-untuk-pengawas-dan-kepala-madrasah' AND t.slug = 'surakarta'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-di-wisuda-stit-muhammadiyah-ngawi-manfaatkan-beasiswa-untuk-lanjut-studi-magister' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-di-wisuda-stit-muhammadiyah-ngawi-manfaatkan-beasiswa-untuk-lanjut-studi-magister' AND t.slug = 'beasiswa'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-di-fisip-uin-surabaya-budaya-mutu-bekal-terbaik-menyambut-indonesia-emas-2045' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-di-fisip-uin-surabaya-budaya-mutu-bekal-terbaik-menyambut-indonesia-emas-2045' AND t.slug = 'diskusi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-di-fisip-uin-surabaya-budaya-mutu-bekal-terbaik-menyambut-indonesia-emas-2045' AND t.slug = 'uin-surabaya'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-raih-dua-penghargaan-dari-kpk-di-hari-antikorupsi-sedunia-2025' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-raih-dua-penghargaan-dari-kpk-di-hari-antikorupsi-sedunia-2025' AND t.slug = 'anti-korupsi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-raih-dua-penghargaan-dari-kpk-di-hari-antikorupsi-sedunia-2025' AND t.slug = 'penghargaan'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-raih-dua-penghargaan-dari-kpk-di-hari-antikorupsi-sedunia-2025' AND t.slug = 'diy'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-raih-dua-penghargaan-dari-kpk-di-hari-antikorupsi-sedunia-2025' AND t.slug = 'kpk'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'sekjen-kemenag-harap-luaran-penelitian-harus-berdampak' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'sekjen-kemenag-harap-luaran-penelitian-harus-berdampak' AND t.slug = 'sekjen-kemenag'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'sekjen-kemenag-harap-luaran-penelitian-harus-berdampak' AND t.slug = 'penelitian'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'sukses-optimalkan-unit-bisnis-kemenag-dorong-kampus-blu-contoh-kemandirian-finansial-uin-jakarta' AND t.slug = 'uin-jakarta'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'sukses-optimalkan-unit-bisnis-kemenag-dorong-kampus-blu-contoh-kemandirian-finansial-uin-jakarta' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'stadium-general-stai-pati-kemenag-buka-pendidikan-untuk-semua' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'stadium-general-stai-pati-kemenag-buka-pendidikan-untuk-semua' AND t.slug = 'stai'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'stadium-general-stai-pati-kemenag-buka-pendidikan-untuk-semua' AND t.slug = 'pati'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-umumkan-peraih-anugerah-gtk-pada-puncak-hgn-2025-berikut-daftarnya' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-umumkan-peraih-anugerah-gtk-pada-puncak-hgn-2025-berikut-daftarnya' AND t.slug = 'hari-guru-nasional'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-umumkan-peraih-anugerah-gtk-pada-puncak-hgn-2025-berikut-daftarnya' AND t.slug = 'anugerah-hari-guru-nasional'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-umumkan-peraih-anugerah-gtk-pada-puncak-hgn-2025-berikut-daftarnya' AND t.slug = '2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'delegasi-fakultas-syariah-uin-khas-jember-raih-juara-favorit-lomba-peradilan-semu-tingkat-nasional-2025' AND t.slug = 'mcc'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'delegasi-fakultas-syariah-uin-khas-jember-raih-juara-favorit-lomba-peradilan-semu-tingkat-nasional-2025' AND t.slug = 'uin-jember'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'lagi-fakultas-syariah-uin-khas-jember-luncurkan-15-buku-dan-hki-karya-dosen-dan-mahasiswa' AND t.slug = 'uin-jember'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'lagi-fakultas-syariah-uin-khas-jember-luncurkan-15-buku-dan-hki-karya-dosen-dan-mahasiswa' AND t.slug = 'buku'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-buka-pengajuan-kenaikan-jabatan-akademik-dosen-lektor-kepala-dan-guru-besar-rumpun-ilmu-agama-periode-iii-tahun-2025' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-lakukan-percepatan-penyaluran-beasiswa-jelang-lpdp-tutup-buku-2025' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-lakukan-percepatan-penyaluran-beasiswa-jelang-lpdp-tutup-buku-2025' AND t.slug = 'lpdp'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-teguhkan-ekoteologi-sebagai-gerakan-nasional-pendidikan-ramah-iklim' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-teguhkan-ekoteologi-sebagai-gerakan-nasional-pendidikan-ramah-iklim' AND t.slug = 'implementasi-ekoteologi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-teguhkan-ekoteologi-sebagai-gerakan-nasional-pendidikan-ramah-iklim' AND t.slug = 'hari-gunu-nasional'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent' AND t.slug = 'beasiswa-indonesia-bangkit'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent' AND t.slug = 'puspenma'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent' AND t.slug = 'monitoring'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent' AND t.slug = 'evaluasi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'bib-kemenag-di-university-of-groningen-awardee-studi-theologi-hingga-artivicial-intelligent' AND t.slug = 'money'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'fsh-ptkin-unggul-dalam-lomba-debat-hukum-bawaslu-ri' AND t.slug = 'mcc'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'fsh-ptkin-unggul-dalam-lomba-debat-hukum-bawaslu-ri' AND t.slug = 'fsh-uin-jakarta'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'fsh-ptkin-unggul-dalam-lomba-debat-hukum-bawaslu-ri' AND t.slug = 'lomba-debat'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'fsh-ptkin-unggul-dalam-lomba-debat-hukum-bawaslu-ri' AND t.slug = 'debat-hukum'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'penguatan-pembentukan-direktorat-jenderal-pesantren-didorong-jadi-pelopor-ekoteologi-nasional' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'penguatan-pembentukan-direktorat-jenderal-pesantren-didorong-jadi-pelopor-ekoteologi-nasional' AND t.slug = 'pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'penguatan-pembentukan-direktorat-jenderal-pesantren-didorong-jadi-pelopor-ekoteologi-nasional' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'penguatan-pembentukan-direktorat-jenderal-pesantren-didorong-jadi-pelopor-ekoteologi-nasional' AND t.slug = 'modernisasi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'pendirian-ditjen-pesantren-dimantapkan-para-kiai-di-yogyakarta-soroti-transformasi-digital-penguatan-karakter-dan-kepemimpinan-santri' AND t.slug = 'direktorat-jenderal-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'pendirian-ditjen-pesantren-dimantapkan-para-kiai-di-yogyakarta-soroti-transformasi-digital-penguatan-karakter-dan-kepemimpinan-santri' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'pendirian-ditjen-pesantren-dimantapkan-para-kiai-di-yogyakarta-soroti-transformasi-digital-penguatan-karakter-dan-kepemimpinan-santri' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'pendirian-ditjen-pesantren-dimantapkan-para-kiai-di-yogyakarta-soroti-transformasi-digital-penguatan-karakter-dan-kepemimpinan-santri' AND t.slug = 'uin-sunan-kalijaga-yogyakarta'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'negara-dorong-era-baru-transformasi-pesantren-santri-ditarget-lebih-mandiri-dan-kompetitif' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'negara-dorong-era-baru-transformasi-pesantren-santri-ditarget-lebih-mandiri-dan-kompetitif' AND t.slug = 'transformasi-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'negara-dorong-era-baru-transformasi-pesantren-santri-ditarget-lebih-mandiri-dan-kompetitif' AND t.slug = 'mandiri'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'negara-dorong-era-baru-transformasi-pesantren-santri-ditarget-lebih-mandiri-dan-kompetitif' AND t.slug = 'kompetitif'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'transformasi-pesantren-ulama-jawa-tengah-tekankan-rekognisi-alumni-etika-teknologi-dan-penguatan-ruang-publik-santri' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'transformasi-pesantren-ulama-jawa-tengah-tekankan-rekognisi-alumni-etika-teknologi-dan-penguatan-ruang-publik-santri' AND t.slug = 'wakil-menteri-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'transformasi-pesantren-ulama-jawa-tengah-tekankan-rekognisi-alumni-etika-teknologi-dan-penguatan-ruang-publik-santri' AND t.slug = 'ulama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'transformasi-pesantren-ulama-jawa-tengah-tekankan-rekognisi-alumni-etika-teknologi-dan-penguatan-ruang-publik-santri' AND t.slug = 'transformasi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'transformasi-pesantren-ulama-jawa-tengah-tekankan-rekognisi-alumni-etika-teknologi-dan-penguatan-ruang-publik-santri' AND t.slug = 'transformasi-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'halaqah-pesantren-di-uin-malang-momentum-penguatan-mutu-dan-kemandirian-ditjen-pesantren' AND t.slug = 'pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'halaqah-pesantren-di-uin-malang-momentum-penguatan-mutu-dan-kemandirian-ditjen-pesantren' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'halaqah-pesantren-di-uin-malang-momentum-penguatan-mutu-dan-kemandirian-ditjen-pesantren' AND t.slug = 'uin-maulana-malik-ibrahim-malang'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'harmonisasi-tradisi-dan-modernitas-warnai-gagasan-penguatan-pesantren-di-sumatera-barat' AND t.slug = 'uin-imam-bonjol-padang'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'harmonisasi-tradisi-dan-modernitas-warnai-gagasan-penguatan-pesantren-di-sumatera-barat' AND t.slug = 'pendidikan-islam'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'harmonisasi-tradisi-dan-modernitas-warnai-gagasan-penguatan-pesantren-di-sumatera-barat' AND t.slug = 'ekosistem-pendidikan'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-dorong-asosiasi-prodi-manajemen-pendidikan-islam-se-indonesia-manfaatkan-layanan-beasiswa-dan-riset-kolaboratif' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-dorong-asosiasi-prodi-manajemen-pendidikan-islam-se-indonesia-manfaatkan-layanan-beasiswa-dan-riset-kolaboratif' AND t.slug = 'prodi-manajemen-pendidikan'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-dorong-asosiasi-prodi-manajemen-pendidikan-islam-se-indonesia-manfaatkan-layanan-beasiswa-dan-riset-kolaboratif' AND t.slug = 'uin-syarif-hidayatullah-jakarta'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-dorong-asosiasi-prodi-manajemen-pendidikan-islam-se-indonesia-manfaatkan-layanan-beasiswa-dan-riset-kolaboratif' AND t.slug = 'beasiswa'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-dorong-asosiasi-prodi-manajemen-pendidikan-islam-se-indonesia-manfaatkan-layanan-beasiswa-dan-riset-kolaboratif' AND t.slug = 'temu-tahunan-ppmpi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'menag-dapat-anugerah-penggerak-nusantara-2025-bidang-harmoni-dan-ekoteologi' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'menag-dapat-anugerah-penggerak-nusantara-2025-bidang-harmoni-dan-ekoteologi' AND t.slug = 'menteri-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'menag-dapat-anugerah-penggerak-nusantara-2025-bidang-harmoni-dan-ekoteologi' AND t.slug = 'anugerah-penggerak-nusantara-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gagas-intelektualisasi-santri-pesantren-didorong-lahirkan-generasi-berwawasan-luas-dan-adaptif' AND t.slug = 'direktorat-jenderal-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gagas-intelektualisasi-santri-pesantren-didorong-lahirkan-generasi-berwawasan-luas-dan-adaptif' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gagas-intelektualisasi-santri-pesantren-didorong-lahirkan-generasi-berwawasan-luas-dan-adaptif' AND t.slug = 'pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gagas-intelektualisasi-santri-pesantren-didorong-lahirkan-generasi-berwawasan-luas-dan-adaptif' AND t.slug = 'intelektualisasi-santri'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gagas-intelektualisasi-santri-pesantren-didorong-lahirkan-generasi-berwawasan-luas-dan-adaptif' AND t.slug = 'uin-raden-fatah-palembang'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'british-council-dan-kementerian-agama-perkuat-hubungan-melalui-kolaborasi-di-bidang-pendidikan-dan-kerukunan-antarumat-beragama' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'british-council-dan-kementerian-agama-perkuat-hubungan-melalui-kolaborasi-di-bidang-pendidikan-dan-kerukunan-antarumat-beragama' AND t.slug = 'kolaborasi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'british-council-dan-kementerian-agama-perkuat-hubungan-melalui-kolaborasi-di-bidang-pendidikan-dan-kerukunan-antarumat-beragama' AND t.slug = 'british-council'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'british-council-dan-kementerian-agama-perkuat-hubungan-melalui-kolaborasi-di-bidang-pendidikan-dan-kerukunan-antarumat-beragama' AND t.slug = 'bahasa-inggris'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'majelis-taklim-datokarama-menggelar-haul-ke-21-kh-mansyur-muchtar-perintis-fdki-uin-palu' AND t.slug = 'majelis'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'majelis-taklim-datokarama-menggelar-haul-ke-21-kh-mansyur-muchtar-perintis-fdki-uin-palu' AND t.slug = 'dakwah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'majelis-taklim-datokarama-menggelar-haul-ke-21-kh-mansyur-muchtar-perintis-fdki-uin-palu' AND t.slug = 'fakultas-dakwah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'majelis-taklim-datokarama-menggelar-haul-ke-21-kh-mansyur-muchtar-perintis-fdki-uin-palu' AND t.slug = 'uin-datokarama-palu'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'majelis-taklim-datokarama-menggelar-haul-ke-21-kh-mansyur-muchtar-perintis-fdki-uin-palu' AND t.slug = 'haul'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'menag-dorong-kajian-ontologi-pendidikan-sebagai-rumusan-arah-baru-pesantren' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-matangkan-pembentukan-ditjen-pesantren' AND t.slug = 'direktorat-jenderal-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-matangkan-pembentukan-ditjen-pesantren' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-matangkan-pembentukan-ditjen-pesantren' AND t.slug = 'moderasi-beragama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-matangkan-pembentukan-ditjen-pesantren' AND t.slug = 'pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama' AND t.slug = 'moderasi-beragama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama' AND t.slug = 'lpdp'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama' AND t.slug = 'perguruan-tinggi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-kolaborasi-lpdp-penguatan-moderasi-beragama' AND t.slug = 'kolaborasi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim' AND t.slug = 'nasaruddin-umar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim' AND t.slug = 'amien-suyitno'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim' AND t.slug = 'rohis'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kongres-rohis-nasional-i-2025-ditutup-terpilih-presiden-rohis-indonesia-pertama-dan-arah-baru-pembinaan-pelajar-muslim' AND t.slug = 'kemenag'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'uin-mataram-tegaskan-peran-strategis-dalam-penguatan-ekosistem-pesantren-dan-riset-manuskrip-nusantara' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'halaqah-uin-raden-intan-lampung-dorong-pembentukan-ditjen-pesantren-sebagai-penguat-ekosistem-pesantren' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'ulama-kalimantan-menekankan-standarisasi-kitab-kuning-sertifikasi-guru-dan-arah-kebijakan-direktorat-jenderal-pesantren' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'uin-ar-raniry-aceh-dorong-penguatan-peran-pesantren-dalam-sistem-pendidikan-nasional' AND t.slug = 'pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'uin-ar-raniry-aceh-dorong-penguatan-peran-pesantren-dalam-sistem-pendidikan-nasional' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'lahirkan-santri-berilmu-dan-berakhlak-pesantren-jadi-pilar-ketahanan-dan-kebangkitan-bangsa' AND t.slug = 'pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'lahirkan-santri-berilmu-dan-berakhlak-pesantren-jadi-pilar-ketahanan-dan-kebangkitan-bangsa' AND t.slug = 'halaqah'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru' AND t.slug = 'pendidikan-profesi-guru'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru' AND t.slug = 'nasaruddin-umar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru' AND t.slug = 'amien-suyitno'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru' AND t.slug = 'menteri-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru' AND t.slug = 'cirebon'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'buka-kick-off-hgn-2025-menag-nasaruddin-tekankan-pentingnya-integrasi-ilmu-dan-iman-bagi-para-guru' AND t.slug = 'hari-guru-nasional'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global' AND t.slug = 'prabowo-subianto'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global' AND t.slug = 'man-insan-cendekia-serpong'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global' AND t.slug = 'komisi-viii-dpr-ri'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global' AND t.slug = 'wakil-menteri-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global' AND t.slug = 'omi-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'olimpiade-madrasah-dorong-sdm-unggul-dan-berdaya-saing-global' AND t.slug = 'amien-suyitno'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya' AND t.slug = 'mrc-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya' AND t.slug = 'madrasah-robotics-competition'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'kemenag-umumkan-juara-madrasah-robotics-competition-2025-berikut-daftarnya' AND t.slug = 'kementerian-agama'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '351-2' AND t.slug = 'uin-jakarta'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '351-2' AND t.slug = 'universitas-islam-internasional-indonesia'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '351-2' AND t.slug = 'program-studi-teknik-informatika'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '351-2' AND t.slug = 'fakultas-sains-dan-teknologi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'man-3-bantul-sabet-medali-emas-fiksi-2025' AND t.slug = 'man-3-bantul'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'man-3-bantul-sabet-medali-emas-fiksi-2025' AND t.slug = 'puspresnas'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'man-3-bantul-sabet-medali-emas-fiksi-2025' AND t.slug = 'smesco-exhibition-hall'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi' AND t.slug = 'nasaruddin-umar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'menag-nasaruddin-dorong-siswa-madrasah-bukan-hanya-unggul-dalam-agama-tapi-juga-teknologi' AND t.slug = 'mrc-2025'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren' AND t.slug = 'nasaruddin-umar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren' AND t.slug = 'hari-santri-nasional'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren' AND t.slug = 'beasiswa-santri-berprestasi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'malam-bakti-santri-menag-sampaikan-terima-kasih-atas-perhatian-presiden-ke-pesantren' AND t.slug = 'direktorat-jenderal-pesantren'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak' AND t.slug = 'nasaruddin-umar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak' AND t.slug = 'indonesia-emas-2045'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak' AND t.slug = 'asep-saepudin-jahar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak' AND t.slug = 'pondok-pesantren-al-khoziny'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'gelar-peringatan-hsn-2025-rektor-uin-jakarta-harap-para-santri-terus-tingkatkan-ilmu-dan-akhlak' AND t.slug = 'hari-santri-nasional'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru' AND t.slug = 'pendidikan-profesi-guru'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru' AND t.slug = 'program-indonesia-pintar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru' AND t.slug = 'madada'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru' AND t.slug = 'akminas'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru' AND t.slug = 'prabowo-subianto'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'langkah-kemenag-wujudkan-asta-cita-dari-jaga-kerukunan-untuk-pembangunan-hingga-sejahterakan-guru' AND t.slug = 'nasaruddin-umar'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'tunggal-putra-paceklik-gelar-all-england-25-tahun-ini-saran-untuk-jonatan-dkk' AND t.slug = 'berita-olahraga'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'tunggal-putra-paceklik-gelar-all-england-25-tahun-ini-saran-untuk-jonatan-dkk' AND t.slug = 'bulutangkis'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'klasemen-f1-2019-usai-bottas-menangi-gp-australia' AND t.slug = 'balapan'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'klasemen-f1-2019-usai-bottas-menangi-gp-australia' AND t.slug = 'berita-olahraga'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'tontowi-ahmad-liliyana-natsir-sabet-gelar-juara-dunia-kedua' AND t.slug = 'berita-olahraga'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'tontowi-ahmad-liliyana-natsir-sabet-gelar-juara-dunia-kedua' AND t.slug = 'bulutangkis'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'pergantian-jitu-luis-milla-yang-mengantar-indonesia-ke-semifinal' AND t.slug = 'berita-olahraga'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'pergantian-jitu-luis-milla-yang-mengantar-indonesia-ke-semifinal' AND t.slug = 'sepakbola'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'jokowi-minta-asean-tangani-masalah-muslim-rohingya-di-rakhine-state' AND t.slug = 'rohinya'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'jokowi-minta-asean-tangani-masalah-muslim-rohingya-di-rakhine-state' AND t.slug = 'tag-berita'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'demi-xpander-mitsubishi-bakal-mengimpor-kembali-pajero-sport' AND t.slug = 'berita-otomotif'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'demi-xpander-mitsubishi-bakal-mengimpor-kembali-pajero-sport' AND t.slug = 'mitsubishi'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'sosok-new-nissan-livina-terungkap-apa-kata-nmi' AND t.slug = 'berita-otomotif'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'sosok-new-nissan-livina-terungkap-apa-kata-nmi' AND t.slug = 'nissan'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'aliansi-nissan-mitsubishi-luncurkan-livina-versi-mungil' AND t.slug = 'berita-otomotif'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'aliansi-nissan-mitsubishi-luncurkan-livina-versi-mungil' AND t.slug = 'nissan'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'video-kelemahan-dan-kelebihan-all-new-terios' AND t.slug = 'berita-otomotif'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'video-kelemahan-dan-kelebihan-all-new-terios' AND t.slug = 'daihatsu'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'prabowo-resmikan-kantor-dpd-gerindra-di-banten' AND t.slug = 'gerindra'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'prabowo-resmikan-kantor-dpd-gerindra-di-banten' AND t.slug = 'tag-berita'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '14-tahun-terbunuhnya-munir-polri-didesak-bentuk-tim-khusus' AND t.slug = 'kejahatan'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '14-tahun-terbunuhnya-munir-polri-didesak-bentuk-tim-khusus' AND t.slug = 'tag-berita'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '2-hari-hilang-nelayan-tewas-mengambang-di-pantai-cipalawah-garut' AND t.slug = 'kejahatan'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = '2-hari-hilang-nelayan-tewas-mengambang-di-pantai-cipalawah-garut' AND t.slug = 'tag-berita'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'bersih-bersih-60-warga-tanjung-priok-ikuti-program-padat-karya' AND t.slug = 'dki-jakarta'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'bersih-bersih-60-warga-tanjung-priok-ikuti-program-padat-karya' AND t.slug = 'tag-berita'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan' AND t.slug = 'new-zealand'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'menag-kecam-penembakan-di-new-zealand-tak-berperikemanusiaan' AND t.slug = 'tag-berita'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'solidaritas-korban-penembakan-dki-beri-warna-bendera-new-zealand-di-jpo-gbk' AND t.slug = 'new-zealand'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);
  INSERT INTO "_PostTags" ("A", "B")
  SELECT p.id, t.id FROM posts p, tags t
  WHERE p.slug = 'solidaritas-korban-penembakan-dki-beri-warna-bendera-new-zealand-di-jpo-gbk' AND t.slug = 'tag-berita'
  AND NOT EXISTS (SELECT 1 FROM "_PostTags" pt WHERE pt."A" = p.id AND pt."B" = t.id);

  -- Settings
  INSERT INTO settings (id, key, value, "createdAt", "updatedAt")
  SELECT 'cml2zvw2tz3rj9nj3', 'site_name', 'Kilas Indonesia', '2026-02-01T00:20:45.988Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM settings WHERE key = 'site_name');
  INSERT INTO settings (id, key, value, "createdAt", "updatedAt")
  SELECT 'cml2zvw2tf8wj7l6l', 'site_description', 'Portal Berita Pendidikan Islam Terpercaya', '2026-02-01T00:20:45.988Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM settings WHERE key = 'site_description');
  INSERT INTO settings (id, key, value, "createdAt", "updatedAt")
  SELECT 'cml2zvw2tlxm9f2my', 'site_logo', 'https://res.cloudinary.com/dicwfbdgz/image/upload/v1769873625/logo_kilasindonesia_ww6s9k.png', '2026-02-01T00:20:45.988Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM settings WHERE key = 'site_logo');
  INSERT INTO settings (id, key, value, "createdAt", "updatedAt")
  SELECT 'cml2zvw2t4hksd3pi', 'contact_email', 'redaksi@kilasindonesia.com', '2026-02-01T00:20:45.988Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM settings WHERE key = 'contact_email');
  INSERT INTO settings (id, key, value, "createdAt", "updatedAt")
  SELECT 'cml2zvw2tmokg12ik', 'social_facebook', 'https://facebook.com/kilasindonesia', '2026-02-01T00:20:45.988Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM settings WHERE key = 'social_facebook');
  INSERT INTO settings (id, key, value, "createdAt", "updatedAt")
  SELECT 'cml2zvw2tdpar1ke5', 'social_twitter', 'https://twitter.com/kilasindonesia', '2026-02-01T00:20:45.988Z', '2026-02-01T00:20:45.988Z'
  WHERE NOT EXISTS (SELECT 1 FROM settings WHERE key = 'social_twitter');

END $$;

COMMIT;

-- Summary
-- Categories: 7
-- Tags: 116
-- Posts: 71