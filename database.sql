CREATE DATABASE IF NOT EXISTS shop_kampus CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE shop_kampus;

-- Tabel pesanan lama dipertahankan agar kompatibel dengan data yang sudah ada.
CREATE TABLE IF NOT EXISTS pesanan (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(120) NOT NULL,
  email VARCHAR(190) NOT NULL,
  produk TEXT NOT NULL,
  jumlah INT UNSIGNED NOT NULL,
  penerimaan VARCHAR(40) NOT NULL,
  catatan TEXT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Setiap produk dalam satu keranjang disimpan sebagai detail terpisah.
CREATE TABLE IF NOT EXISTS detail_pesanan (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  pesanan_id INT UNSIGNED NOT NULL,
  produk VARCHAR(100) NOT NULL,
  harga INT UNSIGNED NOT NULL,
  jumlah INT UNSIGNED NOT NULL,
  subtotal BIGINT UNSIGNED NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_detail_pesanan (pesanan_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
