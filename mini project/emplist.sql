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
-- Table structure for table `emplist`
--

CREATE TABLE `emplist` (
  `eid` int(11) NOT NULL,
  `aid` int(200) NOT NULL,
  `shopname` varchar(255) NOT NULL,
  `shopcon` varchar(200) NOT NULL,
  `shopaddress` varchar(255) NOT NULL,
  `empname` varchar(255) NOT NULL,
  `empemail` varchar(255) NOT NULL,
  `empcon` varchar(200) NOT NULL,
  `emppass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emplist`
--

INSERT INTO `emplist` (`eid`, `aid`, `shopname`, `shopcon`, `shopaddress`, `empname`, `empemail`, `empcon`, `emppass`) VALUES
(1, 1, 'ABC accessoris', '2147483647', 'rajkot', 'emp1', 'emp@gmail.com', '2147483647', '123456789'),
(2, 1, 'ABC accessoris', '8401666995', 'rajkot', 'emp2', 'emp2@gmail.com', '8401666996', '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emplist`
--
ALTER TABLE `emplist`
  ADD PRIMARY KEY (`eid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emplist`
--
ALTER TABLE `emplist`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
