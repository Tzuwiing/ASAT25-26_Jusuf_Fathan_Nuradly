# Garasi Premium

Aplikasi katalog armada mobil premium yang dirancang untuk menampilkan koleksi kendaraan mewah secara *real-time*. Aplikasi ini berfokus pada integrasi data berbasis API secara asinkronus serta penyajian antarmuka (UI) yang modern, bersih, dan elegan.

Projek ini dibuat oleh **Jusuf Fathan Nuraly (Kelas XI)** untuk memenuhi tugas **Ujian Praktek Asesmen Akhir Tahun (AAT) Tahun Ajaran 2025/2026**.

## ✨ Fitur Utama

* **Elegant Animated Splash Screen**: Tampilan pembuka aplikasi dengan efek transisi memudar (*fade transition*) yang halus, menggunakan ikon mobil minimalis serta tipografi eksklusif yang selaras dengan tema utama.
* **Live API Integration & State Handling**: Mengambil data katalog mobil secara langsung dari server internet menggunakan `FutureBuilder`, lengkap dengan penanganan kondisi *loading* (saat memuat), *error* (gagal koneksi), dan *empty* (data kosong).
* **Dynamic Color Helper & Premium UI**: Fitur utilitas pintar yang membaca teks warna dari API dan mengubahnya secara otomatis menjadi komponen visual berupa lingkaran warna yang presisi pada kartu informasi (`CarCard`).

## 📸 Tangkapan Layar (Screenshot)

<p align="center">
  <img src="Screenshot 2026-06-10 113518" alt="Tampilan Garasi Premium" width="320" />
</p>

## 🛠️ Teknologi yang Digunakan

* **[Flutter](https://flutter.dev/)**: Framework UI utama untuk membangun aplikasi Android/iOS.
* **[animated_splash_screen](https://pub.dev/packages/animated_splash_screen)**: Untuk membuat animasi halaman pembuka yang elegan.
* **[google_fonts](https://pub.dev/packages/google_fonts)**: Menyediakan berbagai variasi font premium seperti Inter, Playfair Display, Space Grotesk, dan JetBrains Mono.
* **REST API**: Digunakan untuk mengambil data spesifikasi kendaraan, nomor rangka, hingga harga pasar secara *real-time*.

## 🚀 Cara Menjalankan Proyek

Ikuti langkah-langkah di bawah ini untuk menjalankan aplikasi di lingkungan pengembangan Anda.

### Prasyarat

Pastikan Anda telah menginstal Flutter SDK di komputer Anda. Jika belum, silakan baca [Panduan Instalasi Flutter](https://docs.flutter.dev/get-started/install).

### Langkah-langkah

1.  **Clone repositori proyek:**
    ```bash
    git clone [https://github.com/username-anda/garasi-premium.git](https://github.com/username-anda/garasi-premium.git)
    ```

2.  **Masuk ke folder proyek:**
    ```bash
    cd garasi-premium
    ```

3.  **Unduh semua *dependencies* / package:**
    ```bash
    flutter pub get
    ```

4.  **Jalankan aplikasi** di emulator atau perangkat fisik:
    ```bash
    flutter run
    ```

## 📂 Pemetaan Data API (JSON Mapping)

Data yang diterima dari REST API dipetakan langsung ke dalam komponen UI dengan struktur properti sebagai berikut:

| Key JSON | Tipe Data | Keterangan |
| :--- | :--- | :--- |
| `car` | TEXT / String | Merek atau *brand* pabrikan mobil |
| `car_model` | TEXT / String | Model atau tipe spesifik mobil |
| `car_color` | TEXT / String | Warna mobil (dikonversi otomatis menjadi kode warna) |
| `car_model_year`| INT / Dynamic | Tahun rilis/pembuatan model mobil |
| `car_vin` | TEXT / String | Nomor rangka kendaraan (*Vehicle Identification Number*) |
| `price` | TEXT / String | Estimasi nilai pasar mobil beserta mata uangnya |
| `availability` | BOOLEAN | Status ketersediaan unit mobil (*Tersedia* atau *Terjual*) |

---

**Kelola dan pantau koleksi armada premium dengan eksklusif setiap hari.**
