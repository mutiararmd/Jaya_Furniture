-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2021 at 07:34 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(18, 'Sepatu Sepak Bola 1', 'Sepatu yang membuat anda dapat berlari dengan seimbang dan mengontrol bola dengan baik', 'Sepak Bola', 800000, 39, 'adidass.jpg'),
(19, 'Rompi', 'Jersey latihan', 'Sepak Bola', 10000, 98, 'rompibola01.jpg'),
(20, 'Sepatu Bola Basket 01', 'Sepatu yang bisa membuat anda setara dengan Michael Jordan', 'Bola Basket', 800000, 10, 'sepatubasket01.png'),
(22, 'Wrist Hand', 'Membuat sendi otot anda aman', 'Sepak Bola', 10000, 100, 'wirsthand01.jpg'),
(23, 'Raket 01', 'Merk Wilson', 'Bulu Tangkis', 300000, 10, 'raket01.jpg'),
(25, 'Raket 02', 'Merk Yonex', 'Bulu Tangkis', 350000, 10, 'raket021.jpg'),
(26, 'Bola Basket 01', 'Merek Molten', 'Bola Basket', 200000, 49, 'BolaBasket01.jpg'),
(27, 'Sepatu Sepak Bola 2', 'Merek Nike ', 'Sepak Bola', 800000, 10, 'sepatubola03.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `no_telp` int(13) NOT NULL,
  `jasa_pengiriman` varchar(10) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `no_telp`, `jasa_pengiriman`, `tgl_pesan`, `batas_bayar`) VALUES
(20, 'Cecep', 'Bekasi', 2147483647, 'J&T', '2021-05-25 23:23:22', '2021-05-26 23:23:22'),
(21, 'cecep', 'Jakarta', 2147483647, 'J&E', '2021-05-26 09:55:19', '2021-05-27 09:55:19'),
(22, 'Yanto', 'Bandung Barat No 21', 2147483647, 'J&T', '2021-05-26 12:00:58', '2021-05-27 12:00:58');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(24, 20, 27, 'Sepatu Sepak Bola 2', 1, 800000, ''),
(25, 20, 26, 'Bola Basket 01', 1, 200000, ''),
(26, 20, 25, 'Raket 02', 1, 350000, ''),
(27, 20, 23, 'Raket 01', 1, 300000, ''),
(28, 21, 26, 'Bola Basket 01', 1, 200000, ''),
(29, 22, 18, 'Sepatu Sepak Bola 1', 1, 800000, ''),
(30, 22, 19, 'Rompi', 2, 10000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', 'nimda', 1),
(5, 'cecep', 'cecep12', '123456', 2),
(6, 'test', 'test', '12345', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
