-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Des 2024 pada 13.39
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `phone`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'putri', '12344321', 'kayu putih', '2024-12-02 03:17:43', '2024-12-02 03:17:43', '2024-12-02 03:17:43'),
(2, 'girl', '98766789', 'jakarta', '2024-12-02 03:17:56', '2024-12-02 03:18:33', '2024-12-02 03:17:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_service`
--

CREATE TABLE `jenis_service` (
  `id` int(11) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_service`
--

INSERT INTO `jenis_service` (`id`, `service_name`, `price`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cuci dan Gosok', '5000', 'Melayani cuci dan gosok pakaian ', '2024-12-02 03:01:12', '2024-12-02 03:04:55', '2024-12-02 03:01:12'),
(2, 'Hanya Cuci', '4500', 'Hanya melayani cuci pakaian', '2024-12-02 03:05:35', '2024-12-02 03:06:07', '2024-12-02 03:05:35'),
(3, 'Hanya Gosok', '5000', 'Melayani gosok pakaian', '2024-12-02 03:06:44', '2024-12-02 03:06:44', '2024-12-02 03:06:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `level_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`id`, `level_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrator', '2024-12-02 01:58:53', '2024-12-02 01:58:53', '2024-12-02 01:58:53'),
(2, 'Operator', '2024-12-02 02:28:05', '2024-12-02 02:32:56', '2024-12-02 02:28:05'),
(3, 'Pimpinan', '2024-12-02 02:30:04', '2024-12-02 02:45:17', '2024-12-02 02:30:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_laundry_pickup`
--

CREATE TABLE `trans_laundry_pickup` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_laundry_pickup`
--

INSERT INTO `trans_laundry_pickup` (`id`, `id_order`, `id_customer`, `pickup_date`, `notes`, `created_at`, `updated_at`) VALUES
(7, 30, 1, '2024-12-11', '', '2024-12-02 11:05:33', '2024-12-02 11:05:33'),
(8, 31, 2, '2024-12-10', '', '2024-12-02 11:22:08', '2024-12-02 11:22:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_order`
--

CREATE TABLE `trans_order` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_end_date` datetime NOT NULL,
  `order_status` tinyint(4) NOT NULL,
  `total_price` int(11) NOT NULL,
  `order_pay` double(10,2) NOT NULL,
  `order_change` double(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_order`
--

INSERT INTO `trans_order` (`id`, `id_customer`, `order_code`, `order_date`, `order_end_date`, `order_status`, `total_price`, `order_pay`, `order_change`, `created_at`, `updated_at`, `deleted_at`) VALUES
(30, 1, '#INV0212202400030', '2024-12-09 00:00:00', '2024-12-03 00:00:00', 1, 18000, 20000.00, 2000.00, '2024-12-02 11:05:21', '2024-12-02 11:05:33', '2024-12-02 11:05:21'),
(31, 2, '#INV0212202400031', '2024-12-04 00:00:00', '2024-12-09 00:00:00', 1, 18000, 20000.00, 2000.00, '2024-12-02 11:22:01', '2024-12-02 11:22:08', '2024-12-02 11:22:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_order_detail`
--

CREATE TABLE `trans_order_detail` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_order_detail`
--

INSERT INTO `trans_order_detail` (`id`, `id_order`, `id_service`, `qty`, `subtotal`, `notes`, `created_at`, `updated_at`) VALUES
(12, 29, 0, 4, 0, '', '2024-12-02 11:04:37', '2024-12-02 11:04:37'),
(13, 30, 0, 4, 0, '', '2024-12-02 11:05:21', '2024-12-02 11:05:21'),
(14, 31, 2, 4, 18000, '', '2024-12-02 11:22:01', '2024-12-02 11:22:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `id_level`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@gmail.com', '12345678', '2024-12-02 01:59:34', '2024-12-02 01:59:34'),
(2, 2, 'finkaa', 'finkaa@gmail.com', '12345678', '2024-12-02 02:41:30', '2024-12-02 02:44:09');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_service`
--
ALTER TABLE `jenis_service`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_order`
--
ALTER TABLE `trans_order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jenis_service`
--
ALTER TABLE `jenis_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `trans_order`
--
ALTER TABLE `trans_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
