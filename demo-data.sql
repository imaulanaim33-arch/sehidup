-- Insert demo invitations for template preview
-- Jalankan di Supabase SQL Editor

-- Pastikan ada user demo dulu, atau ganti user_id dengan UUID user yang sudah ada
-- Cara mudah: gunakan user ID kamu sendiri dari tabel auth.users

-- Cek user ID kamu:
-- SELECT id FROM auth.users LIMIT 1;

-- Lalu replace 'YOUR_USER_ID' di bawah dengan UUID yang muncul

INSERT INTO public.invitations (user_id, slug, status, template, data)
VALUES
(
  (SELECT id FROM auth.users LIMIT 1),
  'demo-modern',
  'active',
  'modern',
  '{
    "pria": {"nama": "Muhammad Rizky", "panggilan": "Rizky", "ayah": "Bpk. Ahmad Fauzi", "ibu": "Ibu Sari Dewi"},
    "wanita": {"nama": "Aulia Rahma", "panggilan": "Aulia", "ayah": "Bpk. Hendra Kusuma", "ibu": "Ibu Ratna Wulan"},
    "akad": {"tanggal": "2025-07-12", "mulai": "08:00", "selesai": "10:00", "lokasi": "Masjid Al-Ikhlas", "alamat": "Jl. Sudirman No. 45, Jakarta Pusat"},
    "resepsi": {"tanggal": "2025-07-12", "mulai": "11:00", "selesai": "15:00", "lokasi": "Ballroom Shangri-La", "alamat": "Jl. Karet Semanggi, Jakarta Selatan"},
    "amplop": {"bank1": "BCA", "rek1": "1234567890", "nama1": "Muhammad Rizky", "bank2": "Mandiri", "rek2": "0987654321", "nama2": "Aulia Rahma"},
    "photos": {"pria": null, "wanita": null, "gallery": []},
    "bgm": "Canon in D — Pachelbel",
    "loveStory": [
      {"tahun": "2020", "judul": "Pertama Bertemu", "cerita": "Kami pertama bertemu di sebuah acara kampus yang tidak terduga."},
      {"tahun": "2022", "judul": "Mulai Dekat", "cerita": "Perlahan kami semakin dekat dan saling memahami satu sama lain."},
      {"tahun": "2024", "judul": "Lamaran", "cerita": "Dengan penuh keberanian, ia melamar di tepi pantai saat matahari terbenam."}
    ]
  }'::jsonb
),
(
  (SELECT id FROM auth.users LIMIT 1),
  'demo-botanical',
  'active',
  'botanical',
  '{
    "pria": {"nama": "Dimas Saputra", "panggilan": "Dimas", "ayah": "Bpk. Agus Saputra", "ibu": "Ibu Wati"},
    "wanita": {"nama": "Nisa Aulia", "panggilan": "Nisa", "ayah": "Bpk. Bambang", "ibu": "Ibu Rina"},
    "akad": {"tanggal": "2025-09-05", "mulai": "08:00", "selesai": "10:00", "lokasi": "Masjid Agung", "alamat": "Jl. Merdeka No. 1, Bandung"},
    "resepsi": {"tanggal": "2025-09-05", "mulai": "11:00", "selesai": "15:00", "lokasi": "The Garden Venue", "alamat": "Jl. Dago Atas, Bandung"},
    "amplop": {"bank1": "BNI", "rek1": "1122334455", "nama1": "Dimas Saputra"},
    "photos": {"pria": null, "wanita": null, "gallery": []},
    "loveStory": [
      {"tahun": "2021", "judul": "Pertemuan Pertama", "cerita": "Kami bertemu dalam sebuah hiking trip yang mengubah segalanya."},
      {"tahun": "2023", "judul": "Bersama", "cerita": "Dua tahun penuh kenangan indah yang selalu kami syukuri."}
    ]
  }'::jsonb
),
(
  (SELECT id FROM auth.users LIMIT 1),
  'demo-islami',
  'active',
  'islami',
  '{
    "pria": {"nama": "Fajar Ramadhan", "panggilan": "Fajar", "ayah": "Bpk. H. Mahmud", "ibu": "Ibu Hj. Fatimah"},
    "wanita": {"nama": "Hana Salsabila", "panggilan": "Hana", "ayah": "Bpk. H. Zainal", "ibu": "Ibu Hj. Maryam"},
    "akad": {"tanggal": "2025-10-20", "mulai": "08:00", "selesai": "10:00", "lokasi": "Masjid Istiqlal", "alamat": "Jl. Taman Wijaya Kusuma, Jakarta Pusat"},
    "resepsi": {"tanggal": "2025-10-20", "mulai": "11:00", "selesai": "15:00", "lokasi": "Grand Ballroom Hotel Mulia", "alamat": "Jl. Asia Afrika, Jakarta Selatan"},
    "amplop": {"bank1": "BSI", "rek1": "7788990011", "nama1": "Fajar Ramadhan"},
    "photos": {"pria": null, "wanita": null, "gallery": []},
    "bgm": "A Thousand Years — Christina Perri",
    "loveStory": [
      {"tahun": "2019", "judul": "Taaruf", "cerita": "Perkenalan yang diawali dengan niat yang baik dan penuh keberkahan."},
      {"tahun": "2024", "judul": "Khitbah", "cerita": "Dengan ridho Allah dan restu kedua keluarga, langkah menuju pernikahan dimulai."}
    ]
  }'::jsonb
),
(
  (SELECT id FROM auth.users LIMIT 1),
  'demo-pastel',
  'active',
  'pastel',
  '{
    "pria": {"nama": "Andi Pratama", "panggilan": "Andi", "ayah": "Bpk. Budi Santoso", "ibu": "Ibu Dewi Lestari"},
    "wanita": {"nama": "Maya Cantika", "panggilan": "Maya", "ayah": "Bpk. Candra", "ibu": "Ibu Elisa"},
    "akad": {"tanggal": "2026-02-14", "mulai": "09:00", "selesai": "11:00", "lokasi": "The Chapel Garden", "alamat": "Jl. Kemang Raya No. 10, Jakarta Selatan"},
    "resepsi": {"tanggal": "2026-02-14", "mulai": "12:00", "selesai": "16:00", "lokasi": "Le Meridien Jakarta", "alamat": "Jl. Jend. Sudirman, Jakarta Pusat"},
    "amplop": {"bank1": "BCA", "rek1": "5544332211", "nama1": "Andi Pratama"},
    "photos": {"pria": null, "wanita": null, "gallery": []},
    "bgm": "Perfect — Ed Sheeran",
    "loveStory": [
      {"tahun": "2022", "judul": "Cinta Pertama", "cerita": "Saat melihatnya pertama kali, hatiku langsung tahu dialah orangnya."},
      {"tahun": "2025", "judul": "Lamaran", "cerita": "Di hari ulang tahunnya, aku memberanikan diri untuk melamar dengan bunga-bunga favoritnya."}
    ]
  }'::jsonb
),
(
  (SELECT id FROM auth.users LIMIT 1),
  'demo-jawa',
  'active',
  'jawa',
  '{
    "pria": {"nama": "Budi Santoso", "panggilan": "Budi", "ayah": "Bpk. Slamet", "ibu": "Ibu Tuminah"},
    "wanita": {"nama": "Sari Rahayu", "panggilan": "Sari", "ayah": "Bpk. Wahyu", "ibu": "Ibu Sumiati"},
    "akad": {"tanggal": "2026-04-12", "mulai": "08:00", "selesai": "10:00", "lokasi": "Pendopo Agung", "alamat": "Jl. Keraton No. 1, Yogyakarta"},
    "resepsi": {"tanggal": "2026-04-12", "mulai": "11:00", "selesai": "15:00", "lokasi": "Royal Ambarrukmo", "alamat": "Jl. Laksda Adisucipto, Yogyakarta"},
    "amplop": {"bank1": "BRI", "rek1": "9988776655", "nama1": "Budi Santoso"},
    "photos": {"pria": null, "wanita": null, "gallery": []},
    "bgm": "Thinking Out Loud — Ed Sheeran",
    "loveStory": [
      {"tahun": "2020", "judul": "Wiwit Kenal", "cerita": "Perkenalan sederhana di sebuah acara budaya yang meninggalkan kesan mendalam."},
      {"tahun": "2025", "judul": "Lamaran", "cerita": "Dengan prosesi adat Jawa yang sakral, kami resmi mengikat janji untuk bersatu."}
    ]
  }'::jsonb
)
ON CONFLICT (slug) DO UPDATE SET
  data = EXCLUDED.data,
  status = 'active',
  template = EXCLUDED.template;
