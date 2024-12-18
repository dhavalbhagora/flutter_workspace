-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 10:19 AM
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
-- Database: `accessories`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlist`
--

CREATE TABLE `adminlist` (
  `aid` int(11) NOT NULL,
  `adminname` varchar(255) NOT NULL,
  `shopname` varchar(255) NOT NULL,
  `shopcon` varchar(265) NOT NULL,
  `address` varchar(265) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlist`
--

INSERT INTO `adminlist` (`aid`, `adminname`, `shopname`, `shopcon`, `address`, `email`, `pass`) VALUES
(1, 'dhaval', 'ABC accessoris', '8401666995', 'rajkot', 'dhaval@gmail.com', '11223344'),
(2, 'sujal', 'XYZ accessoris', '', 'rajkot', 'sujal@gmail.com', '12345678'),
(3, '', '', '', '', '', ''),
(4, 'sujal', 'XYZ accessoris', '9985647568', 'rajkot', 'sujal@gmail.com', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlist`
--
ALTER TABLE `adminlist`
  ADD PRIMARY KEY (`aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlist`
--
ALTER TABLE `adminlist`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
