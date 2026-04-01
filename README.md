# Aplikasi Note Sederhana - Tema Persona 5 🎩🎭

Halo! Ini adalah proyek aplikasi catatan (*note*) sederhana yang saya bangun menggunakan **Flutter**. Proyek ini merupakan bagian dari tugas pembuatan program dengan fokus pada implementasi antarmuka yang dinamis dan bertema unik, yaitu **Persona 5**.

## 🚀 Fitur Utama

- **Penyimpanan Sementara**: Catatan yang saya buat di sini bersifat sementara (*in-memory*). Jadi, setiap kali aplikasi di-refresh atau dijalankan ulang, daftar catatan akan otomatis terhapus. Sangat cocok untuk sekadar mencatat ide-ide lewat yang tidak perlu disimpan permanen.
- **Manajemen Catatan**: 
  - Saya bisa menambahkan judul dan isi catatan.
  - Daftar catatan tampil dengan gaya visual yang miring (*skewed*) dan tebal.
  - Ada fitur untuk melihat detail lengkap catatan dalam bentuk dialog "Data Report" yang keren.
- **UI Bertema Persona 5**: Seluruh tampilan aplikasi ini saya desain agar memiliki kontras tinggi dengan warna Merah (`#D80000`), Hitam, dan Putih, lengkap dengan bentuk-bentuk asimetris yang ikonik.

## 🎨 Konsep Desain

Dalam proyek ini, saya mengeksplorasi kemampuan *styling* di Flutter:
- **Geometri Miring**: Saya banyak menggunakan `Transform.rotate` untuk mendapatkan tampilan menu yang miring dan tidak kaku seperti menu aplikasi pada umumnya.
- **Tipografi Bold**: Menggunakan ketebalan teks maksimal (`w900`) dan gaya miring (*italic*) untuk memberikan kesan kuat dan penuh gaya.
- **Visual Shadow**: Efek bayangan yang saya gunakan adalah bayangan blok (bukan halus), untuk meniru gaya *street-art* dari game Persona 5.

## 📁 Struktur File

Hanya ada satu file utama yang saya modifikasi sesuai kebutuhan tugas:
```text
lib/
└── main.dart  <-- Semua logika dan tampilan ada di sini
```

## 🛠️ Cara Menjalankan

1. Pastikan Flutter sudah terinstal di perangkatmu.
2. Buka terminal di direktori proyek ini.
3. Jalankan perintah di bawah ini:
   ```bash
   flutter run
   ```

## 📝 Catatan Penting

> [!IMPORTANT]
> Aplikasi ini **tidak menggunakan database**. Semua data catatan saya simpan di dalam RAM, jadi data akan hilang jika aplikasi ditutup atau di-reset.

---

### *Dibuat oleh: Naufal Kalam Marudi *
*Implementasi desain tematik dan manajemen state sederhana di Flutter.*
