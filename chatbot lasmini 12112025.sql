-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk chatbot-lasmini
CREATE DATABASE IF NOT EXISTS `chatbot-lasmini` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `chatbot-lasmini`;

-- membuang struktur untuk table chatbot-lasmini.broadcast
CREATE TABLE IF NOT EXISTS `broadcast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel chatbot-lasmini.broadcast: ~0 rows (lebih kurang)

-- membuang struktur untuk table chatbot-lasmini.broadcast_tujuan
CREATE TABLE IF NOT EXISTS `broadcast_tujuan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `broadcast_id` int NOT NULL,
  `pelapor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `broadcast_id` (`broadcast_id`),
  KEY `pelapor_id` (`pelapor_id`),
  CONSTRAINT `broadcast_tujuan_ibfk_1` FOREIGN KEY (`broadcast_id`) REFERENCES `broadcast` (`id`) ON DELETE CASCADE,
  CONSTRAINT `broadcast_tujuan_ibfk_2` FOREIGN KEY (`pelapor_id`) REFERENCES `pelapor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel chatbot-lasmini.broadcast_tujuan: ~0 rows (lebih kurang)

-- membuang struktur untuk table chatbot-lasmini.log_user_chat
CREATE TABLE IF NOT EXISTS `log_user_chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pelapor_id` int NOT NULL,
  `pesan` text COLLATE utf8mb4_unicode_ci,
  `tanggal` datetime DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'User',
  PRIMARY KEY (`id`),
  KEY `pelapor_id` (`pelapor_id`),
  CONSTRAINT `log_user_chat_ibfk_1` FOREIGN KEY (`pelapor_id`) REFERENCES `pelapor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel chatbot-lasmini.log_user_chat: ~0 rows (lebih kurang)
INSERT INTO `log_user_chat` (`id`, `pelapor_id`, `pesan`, `tanggal`, `code`) VALUES
	(1, 1, 'p', '2025-11-12 15:28:04', 'User'),
	(2, 1, '1', '2025-11-12 15:28:08', 'User'),
	(3, 1, 'Ketik nomor/kode/nama layanan informasi ADMINDUK :\n\n1.1. KTP \n1.2. KK', '2025-11-12 15:28:10', 'Sys'),
	(4, 1, '1.1.', '2025-11-12 15:28:57', 'User'),
	(5, 1, '2', '2025-11-12 15:29:02', 'User'),
	(6, 1, 'Ketik nomor/kode/nama layanan informasi ADMINDUK :\n\n2.1. Akta Lahir', '2025-11-12 15:29:03', 'Sys'),
	(7, 1, '3', '2025-11-12 15:29:06', 'User'),
	(8, 1, 'Ketik nomor/kode/nama layanan informasi ADMINDUK :\n\n1. Informasi Layanan \n2. Syarat Dokumen \n3. Kontak Operator', '2025-11-12 15:29:07', 'Sys'),
	(9, 1, 'OPERATOR', '2025-11-12 15:29:14', 'User'),
	(10, 1, 'p', '2025-11-12 16:52:48', 'User'),
	(11, 1, 'p', '2025-11-12 16:53:18', 'User'),
	(12, 1, '1', '2025-11-12 16:53:23', 'User'),
	(13, 2, 'halo', '2025-11-12 16:54:03', 'User'),
	(14, 2, '10', '2025-11-12 16:54:16', 'User'),
	(15, 3, 'Nxn', '2025-11-12 16:55:59', 'User'),
	(16, 1, 'p', '2025-11-12 17:00:35', 'User'),
	(17, 4, '', '2025-11-12 17:00:55', 'User'),
	(18, 4, '', '2025-11-12 17:01:05', 'User'),
	(19, 4, '', '2025-11-12 17:01:18', 'User'),
	(20, 1, 'p', '2025-11-12 17:01:30', 'User'),
	(21, 4, '', '2025-11-12 17:01:38', 'User'),
	(22, 4, '', '2025-11-12 17:01:52', 'User'),
	(23, 4, '', '2025-11-12 17:01:58', 'User'),
	(24, 1, '8', '2025-11-12 17:02:05', 'User'),
	(25, 4, '', '2025-11-12 17:02:34', 'User'),
	(26, 4, '', '2025-11-12 17:02:41', 'User'),
	(27, 4, '', '2025-11-12 17:03:16', 'User'),
	(28, 4, '', '2025-11-12 17:03:25', 'User'),
	(29, 3, '', '2025-11-12 17:03:50', 'User'),
	(30, 1, 'p', '2025-11-12 17:05:15', 'User'),
	(31, 1, '1', '2025-11-12 17:05:18', 'User'),
	(32, 1, '2', '2025-11-12 17:05:21', 'User'),
	(33, 5, '', '2025-11-12 17:06:10', 'User'),
	(34, 5, '', '2025-11-12 17:06:52', 'User'),
	(35, 4, '', '2025-11-12 17:07:01', 'User'),
	(36, 4, '', '2025-11-12 17:07:13', 'User'),
	(37, 4, '', '2025-11-12 17:07:18', 'User'),
	(38, 6, 'tes', '2025-11-12 17:10:18', 'User');

-- membuang struktur untuk table chatbot-lasmini.masking_data
CREATE TABLE IF NOT EXISTS `masking_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wa_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_text` text COLLATE utf8mb4_unicode_ci,
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_unicode_ci DEFAULT 'nonaktif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel chatbot-lasmini.masking_data: ~0 rows (lebih kurang)

-- membuang struktur untuk table chatbot-lasmini.pelapor
CREATE TABLE IF NOT EXISTS `pelapor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('bot','operator') COLLATE utf8mb4_unicode_ci DEFAULT 'bot',
  `handle_status` enum('belum','sudah') COLLATE utf8mb4_unicode_ci DEFAULT 'belum',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel chatbot-lasmini.pelapor: ~4 rows (lebih kurang)
INSERT INTO `pelapor` (`id`, `phone`, `nama`, `nik`, `status`, `handle_status`, `created_at`) VALUES
	(1, '6285790284011', NULL, NULL, 'bot', 'belum', '2025-11-12 08:28:04'),
	(2, '6287853022964', NULL, NULL, 'bot', 'belum', '2025-11-12 09:54:03'),
	(3, '165403972124920', NULL, NULL, 'bot', 'belum', '2025-11-12 09:55:59'),
	(4, '97517316366521', NULL, NULL, 'bot', 'belum', '2025-11-12 10:00:55'),
	(5, '57737379631125', NULL, NULL, 'bot', 'belum', '2025-11-12 10:06:10'),
	(6, '6289676520872', NULL, NULL, 'bot', 'belum', '2025-11-12 10:10:18');

-- membuang struktur untuk table chatbot-lasmini.pertanyaan
CREATE TABLE IF NOT EXISTS `pertanyaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel chatbot-lasmini.pertanyaan: ~0 rows (lebih kurang)
INSERT INTO `pertanyaan` (`id`, `pid`, `code`, `nama`, `jawaban`, `file`, `created_at`) VALUES
	(2, 2, '2.1', 'Kartu Keluarga (KK) Baru Karena Membentuk Rumah Tangga Baru', 'Persyaratan :\n1. Mengisi F-1.02\n2. Fotocopy Buku Nikah/ Kutipan Akta Perkawinan atau Kutipan Akta Perceraian\n3. Fotocopy KK lama / melampirkan KK lama\n\nhttps://drive.google.com/file/d/1JItjYRgL1s1N7qEW_e7uH5AbIMLi-O_n/view?usp=share_link', '01 Layanan KK RT baru 02 Prosedur KK.png', '2025-11-12 09:53:03'),
	(4, 2, '2.2', 'Penerbitan Kartu Keluarga Baru Karena Penggantian Kepala Keluarga (Karena Kematian Kepala Keluarga)', 'Persyaratan: 1. Mengisi F.1.02\n2. Melampirkan fotokopi Akta Kematian jika Kepala Keluarga meninggal\n3. Melampirkan KK lama\n\nhttps://drive.google.com/file/d/1PSt-OqnNxsHPOABPTy2grKAIS50LHr8U/view?usp=share_link', '02 Layanan KK ganti Kepala 02 Prosedur KK.png', '2025-11-12 09:53:03'),
	(5, 2, '1.3', 'Penerbitan Kartu Keluarga Karena Hilang/Rusak', 'Persyaratan: 1. Surat keterangan hilang dari kepolisian\n2. Mengisi F-1.02\n3. Menyerahkan dokumen KK yang rusak\n4. Fotokopi KTP-el\n5. Fotokopi surat nikah/akta nikah bagi yang sudah menikah.\n\nhttps://drive.google.com/file/d/1SjjY_jGxvIDVEkIe8npy7Pj3-UX1oVpj/view?usp=share_link', '03 Layanan KK baru02 Prosedur KK  hilang_rusak.png', '2025-11-12 09:53:03'),
	(6, 2, '2.4', 'Penerbitan Kartu Keluarga Karena Perubahan Data', 'Persyaratan: 1. KK lama\n2. Mengisi F-1.02\n3. Fotokopi surat keterangna/bukti perubahan Peristiwa Kependudukan (contoh: Akta Kelahiran, Ijazah, Surat Keputusan Pengadilan) dan Perubahan Data\n\nCatatan:\nPerubahan Data yang dimaksud adalah perubahan nama dan tempat/tanggal lahir\n\nhttps://drive.google.com/file/d/1PgZncISsdbyeXKjwmLSkff_AkC9Fm05G/view?usp=share_link', '04 Layanan KK  02 Prosedur KK Perubahan Data.png', '2025-11-12 09:53:03'),
	(7, 2, '2.5', 'Penerbitan Kartu Tanda Penduduk Elektronik (KTP-el) Baru', 'Persyaratan: 1. Telah berusia 17 tahun, sudah kawin ,atau pernah kawin dan \n2. Fotokopi KK\n3. Penduduk melakukan rekam foto wajah , sidik jari, iris mata, tanda tangan (di Kecamatan atau Dinas Dukcapil)\n\nhttps://drive.google.com/file/d/1khbK78jpUgH7QzRI7wBvr6fviiO8AL-a/view?usp=share_link', '05 Layanan KTP el baru 02 Prosedur KTP el baru.png', '2025-11-12 09:53:03'),
	(8, 2, '2.6', 'Penerbitan Kartu Tanda Penduduk Elektronik Rusak/Hilang/Perubahan Elemen Data', 'Persyaratan: 1. Fotokopi KK\n2. Menyerahkan KTP-el (jika KTP-el Rusak)\n3. Melampirkan Surat Kehilangan dari Kepolisian (Jika KTP-el Hilang)\n(Cetak perubahan KTP-el mengikuti KK yang sudah dilakukan cetak prubahan sebelumnya)\n\nhttps://drive.google.com/file/d/1N125DC0-k-aDaz5Zc71X4SRx1N2Ke2Mb/view?usp=share_link', '06 Layanan KTP Prosedur KTP el baru hilang.png', '2025-11-12 09:53:03'),
	(9, 2, '2.7', 'Penerbitan Kartu Identitas Anak (KIA)', 'Persyaratan: 1. Mengisi Form-KIA\n2. Fotokopi Akta Kelahiran \n3. Fotokopi KK\n4. Fotokopi KTP-el orang tua\n5.Pas photo berwarna 2 lembar (untuk anak yang berumur 5 tahun)\n\nhttps://drive.google.com/file/d/1FkmkO6mcf4qRd-BB-uful3sa1eRqUcXk/view?usp=sharing', '07 Layanan KIA Prosedur Identitas Anak baru.png', '2025-11-12 09:53:03'),
	(10, 2, '2.8', 'Pindah Penduduk di Dalam Negara Kesatuan Republik Indonesia (SKPWNI) Antar Desa/Kelurahan/Kecamatan/Kabupaten/Propinsi', 'Persyaratan: 1. Fotokopi KK\n2. Fotokopi KTP-el\n3. Pengantar Desa/Kel\n\nhttps://drive.google.com/file/d/1FkmkO6mcf4qRd-BB-uful3sa1eRqUcXk/view?usp=sharing', '08 Layanan  Prosedur Pindah WNI antar Wilayah.png', '2025-11-12 09:53:03'),
	(11, 2, '2.9', 'Akta Kelahiran', 'Persyaratan: 1. Surat Keterangan Kelahiran dari Dokter/Bidan/Penolong Kelahiran\n2. Surat Nikah/Akta Perkawinan Orang Tua yang telah dilegalisir\n3. Kartu Keluarga\n4. Ktp Orang tua\n5.Surat Kuasa Jika yang mendaftar bukan Orang tua\n\nhttps://drive.google.com/file/d/1_cyejApsPblV0YJe0s8iqRljrc0mh4SO/view?usp=share_link', '09 Layanan Akta 02 Prosedur Akta Kelahiran.png', '2025-11-12 09:53:03'),
	(12, 2, '2.10', 'Akta Perkawinan', 'Persyaratan: 1.Surat Keterangan Perkawinan dari Pemuka Agama\n2. KK dan KTP Suami dan Istri\n3. Pas Foto Suami dan Istri\n4. Kutipan Akta Kelahiran Suami dan Istri\n\nhttps://drive.google.com/file/d/1T1Fon5MiCJfQ06WuiReS09Ve-XG1M9HI/view?usp=share_link\n5. Surat Keterangan dari Desa/Kelurahan\n6. 2 (Dua) Orang saksi', '10 Layanan Akta Perkawinan 02 Persyaratan.png', '2025-11-12 09:53:03'),
	(13, 2, '2.11', 'Akta Perceraian', 'Persyaratan: 1. Kutipan Akta Perkawinan Asli\n2. Putusan Pengadilan Dilegalisir\n3. Kartu Keluarga\n4. KTP Pemohon\n\nhttps://drive.google.com/file/d/1XbuuG-Z1A-vQqDpuzxgnN5qMxtZwXtSe/view?usp=share_link', '11 Layanan Akta Perceraian 02 Persyaratan.png', '2025-11-12 09:53:03'),
	(14, 2, '2.12', 'Akta Kematian', 'Persyaratan: 1. Kartu Keluarga Almarhum\n2. Ktp Almarhum dan Pelopor \n3. Surat Keterangan Kematian dan Tenaga Medis/Kelurahan\n4. Formulir Permohonan\n\nhttps://drive.google.com/file/d/1WqVmYMPQofYhkqOQQE_U8d-QubnNYglP/view?usp=share_link', '12 Layanan Akta Kematian 02 Persyaratan.png', '2025-11-12 09:53:03'),
	(15, 2, '2.13', 'Akta Pengangkatan Anak', 'Persyaratan: 1. Putusan Pengadilan Pengangkatan Anak Legalisir \n2. Surat Nikah Orang Tua Angkat \n3. Kartu Keluarga Angkat dan Kandung\n4. Akta Kelahiran \n5. Formulir Permohonan\n\nhttps://drive.google.com/file/d/1t4j9wSJGyQL6BQ_3Yva7rBRiv5mUZvlt/view?usp=share_link', '13 Layanan Akta Pengakatan Anak 02 Persyaratan.png', '2025-11-12 09:53:03'),
	(16, 2, '2.14', 'Akta Pengesahan Anak', 'Persyaratan: 1. Putusan Pengadilan Pengesahan Anak Legalisir\n2. Surat Nikah Orang Tua\n3. Kartu Keluarga\n4. Akta Kelahiran\n5. Formulir Permohonan\n\nhttps://drive.google.com/file/d/1gqfW9gMUs2mXgar2kKxBqthFsLbLCkaE/view?usp=share_link', '14 Layanan Akta Pengesahan Anak 02 Persyaratan.png', '2025-11-12 09:53:03'),
	(17, 2, '2.15', 'Akta Pengakuan Anak', 'Persyaratan: 1. Putusan Pengadilan Pengakuan Anak Legalisir\n2. Surat Pernyataan Pengakuan Anak \n3. Kartu Keluarga \n4. Akta Kelahiran\n5. Formulir Permohonan\n\nhttps://drive.google.com/file/d/1TjLgJjhxdMB3uGuDPNnaxkufQu9KW9-V/view?usp=share_link', '15 Layanan Akta Pengakuan Anak 02 Persyaratan.png', '2025-11-12 09:53:03'),
	(18, 2, '2.16', 'Perbaikan Jaringan Pelayanan SIAK da Perekaman KTP', 'Persyaratan: 1. Merupakan instansi pelayanan SIAK dan KTP-EL\n2. Melaporkan terjadinya kerusakan\n\nhttps://drive.google.com/file/d/1NDB5zDYJSaod-pev-CzSVVB67CW7wrLB/view?usp=share_link', '16 Layanan Akta Perbaikan Jaringan Pelayanan.png', '2025-11-12 09:53:03'),
	(19, 2, '2.17', 'Administrasi Kependudukan Daring', 'Persyaratan: 1. Smartphone / Laptop untuk pemohon yang tidak memiliki Smartphone / Laptop dapat menuju tempat pelayanan di Desa / Kelurahan dan Kecamatan\n2. Foto / Scan dokumen persyaratan\n3. Memiliki koneksi internet\n4. Petugas Pelayanan pada Desa / Kelurahan / Kecamatan\n\nhttps://drive.google.com/file/d/14GuQ75hZxolFQ-dVK3aBVr49EZtrRcDL/view?usp=share_link', '17 Layanan ADMINISTRASI KEPENDUDUKAN DARING 02.png', '2025-11-12 09:53:03'),
	(20, 2, '2.18', 'Permintaan dan Pemadanan Data Kependudukan', 'Persyaratan: 1. Instansi pemerintah / Organisasi resmi\n2. Peruntukan permintaan data jelas\n3. Mengajukan surat permohonan permintaan data\n\nhttps://drive.google.com/file/d/1DNdoLoUlhhZvneEqmezO8eoELAfxP5kF/view?usp=share_link', '18 Layanan PERMINTAAN DAN PEMADANAN DATA.png', '2025-11-12 09:53:03'),
	(21, 2, '2.19', 'Pemberian Akses Dan Pemanfaatan Data Kependudukan', 'Persyaratan: 1. OPD yang bergerak di bidang pelayanan publik \n2. Membuat dan mengajukan permohonan\n\n\nhttps://drive.google.com/file/d/1DNdoLoUlhhZvneEqmezO8eoELAfxP5kF/view?usp=share_link', '19 Layanan PEMBERIAN HAK AKSES DAN PEMANFAATAN.png', '2025-11-12 09:53:03'),
	(33, 10, '1111', 'Reservasi Sistem Antrian Elektronik di Kec. Gondang', 'Klik untuk mendaftar antrian di Kec. Gondang [linkPendaftaranGondang]', NULL, '2025-11-12 09:53:03'),
	(50, NULL, '0', 'Macam List Pertanyaan Informasi Layanan', '1.1. Kartu Keluarga (KK) Baru Karena Membentuk Rumah Tangga Baru \n1.2. Penerbitan Kartu Keluarga Baru Karena Penggantian Kepala Keluarga (Karena Kematian Kepala Keluarga) \n1.3. Penerbitan Kartu Keluarga Karena Hilang/Rusak \n1.4. Penerbitan Kartu Keluarga Karena Perubahan Data \n1.5. Penerbitan Kartu Tanda Penduduk Elektronik (KTP-el) Baru \n1.6. Penerbitan Kartu Tanda Penduduk Elektronik Rusak/Hilang/Perubahan Elemen Data \n1.7. Penerbitan Kartu Identitas Anak (KIA) \n1.8. Pindah Penduduk di Dalam Negara Kesatuan Republik Indonesia (SKPWNI) Antar Desa/Kelurahan/Kecamatan/Kabupaten/Propinsi \n1.9. Akta Kelahiran \n1.10. Akta Perkawinan \n1.11. Akta Perceraian \n1.12. Akta Kematian \n1.13. Akta Pengangkatan Anak \n1.14. Akta Pengesahan Anak \n1.15. Akta Pengakuan Anak \n1.16. Perbaikan Jaringan Pelayanan SIAK da Perekaman KTP \n1.17. Administrasi Kependudukan Daring \n1.18. Permintaan dan Pemadanan Data Kependudukan \n1.19. Pemberian Akses Dan Pemanfaatan Data Kependudukan', NULL, '2025-11-12 09:53:03'),
	(51, NULL, '1', 'Pengajuan Pelayanan Online', 'Klik untuk mengajukan pelayanan online => [linkPendaftaran]', NULL, '2025-11-12 09:53:03'),
	(52, NULL, '2', 'Reservasi Sistem Antrian Elektronik di Kecamatan Gondang', 'Klik untuk mendaftar antrian [linkPendaftaranGondang]', NULL, '2025-11-12 09:53:03'),
	(53, NULL, '3', 'Reservasi Sistem Antrian Elektronik di Kecamatan Pace', 'Klik untuk mendaftar antrian [linkPendaftaranNganjuk]', NULL, '2025-11-12 09:53:03'),
	(1002, NULL, '4', 'Reservasi Sistem Antrian Elektronik di Kecamatan Lengkong', 'Klik untuk mendaftar antrian [linkPendaftaranLengkong]', NULL, '2025-11-12 09:53:03'),
	(1003, NULL, '5', 'Reservasi Sistem Antrian Elektronik di Kecamatan Bagor', 'Klik untuk mendaftar antrian [linkPendaftaranBagor]', NULL, '2025-11-12 09:53:03'),
	(1004, NULL, '6', 'Reservasi Sistem Antrian Elektronik di Kecamatan Kertosono', 'Klik untuk mendaftar antrian [linkPendaftaranKertosono]', NULL, '2025-11-12 09:53:03'),
	(1005, NULL, '7', 'Reservasi Sistem Antrian Elektronik di Kecamatan Prambon', 'Klik untuk mendaftar antrian [linkPendaftaranPrambon]', NULL, '2025-11-12 09:53:03'),
	(1006, NULL, '8', 'Reservasi Sistem Antrian Elektronik di Kecamatan Tanjunganom', 'Klik untuk mendaftar antrian [linkPendaftaranTanjungAnom]', NULL, '2025-11-12 09:53:03'),
	(1007, NULL, '9', 'Reservasi Sistem Antrian Elektronik di Kecamatan Berbek', 'Klik untuk mendaftar antrian [linkPendaftaranBerbek]', NULL, '2025-11-12 09:53:03'),
	(1008, NULL, '10', 'Reservasi Sistem Antrian Elektronik di Mall Pelayanan Publik', 'Klik untuk mendaftar antrian [linkPendaftaranMpp]', NULL, '2025-11-12 09:53:03');

-- membuang struktur untuk table chatbot-lasmini.setting
CREATE TABLE IF NOT EXISTS `setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel chatbot-lasmini.setting: ~7 rows (lebih kurang)
INSERT INTO `setting` (`id`, `key`, `value`) VALUES
	(1, 'qr_code', '2@xPE1gLj7xOqTX2DA6k/0l4mlb3SPWJ+/A1rXc6ZCqteMKS5QPMmpumW6S7Vj/Z0qdR0TF/EvtuCAGiOhMjCHyK0THpvzoxyUzaE=,bT52SnQPtdTm2W9IiBBRty9/Uzi/o0U1Sx/onRvU50E=,ItYUn9lx6s1YSMNdMYorfWJkW0ES2KZdhAdKrA0goSw=,IyL3Tmz2A9QgWz5LDPDpPndJCYjMedHv+XjH3DopM4Q='),
	(2, 'status_connection_app', 'true'),
	(3, 'status_connection_lustchatbot_app', 'false'),
	(4, 'status_app', 'disconnect'),
	(5, 'phone_number', '6288991479942'),
	(6, 'default_message', '*Selamat Datang di Pelayanan Administrasi Kependudukan (Dispendukcapil) Kabupaten Nganjuk.*\r\n\r\nJam Operasional Layanan Dispendukcapil Kabupaten Nganjuk:\r\n*hari Senin - Kamis (08.00-12.00)* \r\n*hari Jumat (08.00-11.30)*\r\n\r\nNote: Hari Libur Nasional/tanggal merah _*Libur*_'),
	(7, 'operator_key', 'OPERATOR');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
