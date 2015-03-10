-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2014 at 05:10 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pro_absensiwebdev`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_absensi`
--

CREATE TABLE IF NOT EXISTS `tbl_absensi` (
  `id_pertemuan` int(11) NOT NULL,
  `id_anggota` varchar(30) NOT NULL,
  KEY `id_pertemuan` (`id_pertemuan`),
  KEY `id_anggota` (`id_anggota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_absensi`
--

INSERT INTO `tbl_absensi` (`id_pertemuan`, `id_anggota`) VALUES
(24, '089631880165'),
(25, '089631880165');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anggota` (`id_anggota`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `nama`, `password`, `id_anggota`) VALUES
(1, 'Rahmat Heru Kurniawan', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggota`
--

CREATE TABLE IF NOT EXISTS `tbl_anggota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NRP` varchar(15) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(75) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `tahun_angkatan` int(5) NOT NULL,
  `alamat_asal` text NOT NULL,
  `alamat_sby` text NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `gender` int(11) NOT NULL,
  `no_telp` varchar(30) NOT NULL,
  `tanggal_join` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_departemen` (`id_departemen`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_anggota`
--

INSERT INTO `tbl_anggota` (`id`, `NRP`, `nama`, `password`, `email`, `id_departemen`, `tahun_angkatan`, `alamat_asal`, `alamat_sby`, `tanggal_lahir`, `gender`, `no_telp`, `tanggal_join`) VALUES
(1, '2110131041', 'Rahmat Heru Kurniawan', 'abcde', 'rahmatheruka@gmail.com', 1, 2013, 'Sidoarjo', 'Gebang Wetan', '1995-04-09', 1, '089631880165', '09-09-2014');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departemen`
--

CREATE TABLE IF NOT EXISTS `tbl_departemen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_departemen`
--

INSERT INTO `tbl_departemen` (`id`, `nama`) VALUES
(1, 'D4 Informatika'),
(2, 'D3 Informatika'),
(3, 'D4 Teknik Komputer'),
(4, 'D3 Multimedia Broadcasting');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelompok`
--

CREATE TABLE IF NOT EXISTS `tbl_kelompok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_kelompok`
--

INSERT INTO `tbl_kelompok` (`id`, `nama`) VALUES
(1, 'Web Programmer'),
(2, 'Web Designer');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pertemuan`
--

CREATE TABLE IF NOT EXISTS `tbl_pertemuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelompok` int(11) NOT NULL,
  `waktu` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kelompok` (`id_kelompok`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `tbl_pertemuan`
--

INSERT INTO `tbl_pertemuan` (`id`, `id_kelompok`, `waktu`) VALUES
(7, 1, '1410066266'),
(8, 2, '1410070253'),
(9, 1, '1410072827'),
(10, 1, '1410073644'),
(11, 1, '1410076114'),
(12, 2, '1410076400'),
(13, 1, '1410076529'),
(14, 2, '1410085857'),
(15, 1, '1410090936'),
(16, 2, '1410091127'),
(17, 1, '1410103459'),
(18, 1, '1410104724'),
(19, 2, '1410104806'),
(20, 1, '1410105080'),
(21, 1, '1410191722'),
(22, 2, '1410194321'),
(23, 2, '1410195367'),
(24, 2, '1410195501'),
(25, 1, '1410254580');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_absensi`
--
ALTER TABLE `tbl_absensi`
  ADD CONSTRAINT `tbl_absensi_ibfk_2` FOREIGN KEY (`id_pertemuan`) REFERENCES `tbl_pertemuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD CONSTRAINT `tbl_admin_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `tbl_anggota` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  ADD CONSTRAINT `tbl_anggota_ibfk_1` FOREIGN KEY (`id_departemen`) REFERENCES `tbl_departemen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pertemuan`
--
ALTER TABLE `tbl_pertemuan`
  ADD CONSTRAINT `tbl_pertemuan_ibfk_1` FOREIGN KEY (`id_kelompok`) REFERENCES `tbl_kelompok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
