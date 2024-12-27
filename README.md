# Cara Menjalankan Project Laravel dari Repositori

Repositori ini berisi project Laravel yang berada di dalam folder `Program`. Ikuti langkah-langkah di bawah ini untuk menjalankan project Laravel ini di lingkungan lokal Anda.

## Prasyarat
Sebelum memulai, pastikan Anda telah menginstal perangkat lunak berikut di komputer Anda:

1. **PHP** (versi 8.3.15) - [Download PHP](https://www.php.net/downloads)
2. **Composer** - [Download Composer](https://getcomposer.org/download/)
3. **Git** - [Download Git](https://git-scm.com/)
4. **Database** (MySQL) - Pastikan Anda memiliki server database yang berjalan.

## Langkah-Langkah

### 1. Clone Repositori
Clone repositori ini ke komputer lokal Anda menggunakan perintah berikut:
```bash
git clone https://github.com/rafinaufal04/Slipku.git
```

Masuk ke folder project:
```bash
cd Slipku/Program
```

### 2. Instal Dependensi

Jalankan perintah berikut untuk menginstal semua dependensi PHP:
```bash
composer install
```

### 3. Konfigurasi File `.env`

1. Salin file `.env.example` menjadi `.env`:
   ```bash
   cp .env.example .env
   ```

2. Buka file `.env` dan sesuaikan pengaturan database:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=nama_database
   DB_USERNAME=username_database
   DB_PASSWORD=password_database
   ```

### 4. Generate Application Key
Generate application key dengan perintah:
```bash
php artisan key:generate
```

### 5. Export Database
Buat database, lalu export file `slipku.sql` yang merupakan isi database project ini.

### 6. Jalankan Server Lokal
Jalankan server Laravel dengan perintah:
```bash
php artisan serve
```

Server akan berjalan di `http://127.0.0.1:8000`. Anda dapat membuka URL tersebut di browser.

---

Jika Anda mengalami kendala, jangan ragu untuk membuka issue di repositori ini atau hubungi pengelola project.
