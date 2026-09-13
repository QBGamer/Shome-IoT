-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 10:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ptudiot`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `temp` float NOT NULL,
  `humi` float NOT NULL,
  `light` float NOT NULL,
  `move` varchar(10) NOT NULL,
  `gas` varchar(10) NOT NULL,
  `secur` varchar(10) NOT NULL,
  `water` int(10) NOT NULL,
  `air` varchar(10) NOT NULL,
  `airat` varchar(10) NOT NULL,
  `mois` varchar(10) NOT NULL,
  `moisat` varchar(10) NOT NULL,
  `lightout` varchar(10) NOT NULL,
  `lightat` varchar(10) NOT NULL,
  `door` varchar(10) NOT NULL,
  `led` varchar(10) NOT NULL,
  `sensor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`time`, `temp`, `humi`, `light`, `move`, `gas`, `secur`, `water`, `air`, `airat`, `mois`, `moisat`, `lightout`, `lightat`, `door`, `led`, `sensor`) VALUES
('2023-12-11 15:46:09', -16.71, 32.85, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:46:15', -16.8, 33, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:46:21', -16.86, 33.1, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:46:27', -16.95, 33.25, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:46:32', -17.01, 33.35, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:46:38', -17.1, 33.5, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:46:44', -17.16, 33.6, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:46:50', -17.25, 33.75, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no'),
('2023-12-11 15:46:56', -17.31, 33.85, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:47:01', -17.4, 34, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:47:07', -17.46, 34.1, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'no', 'no'),
('2023-12-11 15:47:13', -17.55, 34.25, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:47:19', -17.61, 34.35, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:47:24', -17.7, 34.5, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:47:30', -17.76, 34.6, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:47:36', -17.85, 34.75, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:47:42', -17.91, 34.85, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:47:48', -18, 35, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:47:53', -18.06, 35.1, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:47:59', -18.15, 35.25, 0, 'no', 'no', 'no', 28, 'no', 'no', 'no', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:05', -18.21, 35.35, 0, 'no', 'no', 'no', 28, 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:11', -18.3, 35.5, 0, 'no', 'no', 'no', 28, 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:16', -18.36, 35.6, 0, 'no', 'no', 'no', 28, 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:22', -18.45, 35.75, 0, 'no', 'no', 'no', 173, 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:28', -18.51, 35.85, 0, 'no', 'no', 'no', 173, 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:34', -18.6, 36, 0, 'no', 'no', 'no', 173, 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:40', -18.66, 36.1, 0, 'no', 'no', 'no', 173, 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:45', -18.72, 36.2, 0, 'no', 'no', 'no', 173, 'no', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:51', 0.09, 32, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:48:57', 18.93, 23.4, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:03', 28.37, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:09', 28.37, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:14', 28.47, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:20', 28.47, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:26', 28.47, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:32', 28.55, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:38', 28.65, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:43', 28.71, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:49', 28.77, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:49:55', 28.81, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:50:01', 28.83, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:50:06', 28.91, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:50:12', 28.95, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no'),
('2023-12-11 15:50:18', 28.95, 14.8, 0, 'no', 'no', 'no', 173, 'yes', 'no', 'yes', 'no', 'yes', 'no', 'no', 'yes', 'no');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
