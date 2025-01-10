-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2025 at 08:44 AM
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
-- Database: `evault`
--

-- --------------------------------------------------------

--
-- Table structure for table `socialmediaaccounts`
--

CREATE TABLE `socialmediaaccounts` (
  `AccountID` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `PlatformName` varchar(100) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varbinary(255) NOT NULL,
  `Notes` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `SecurityPin` varchar(265) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `socialmediaaccounts`
--

INSERT INTO `socialmediaaccounts` (`AccountID`, `id`, `PlatformName`, `Username`, `Password`, `Notes`, `CreatedAt`, `SecurityPin`) VALUES
(1, 13, 'facebook Meta', 'dhaval__bhagora', 0x41626340313233, 'Primmary Instagram Account', '2025-01-06 17:22:58', '1234'),
(2, 13, 'facebook', 'dhaval123', 0x41626340313233, '', '2025-01-06 17:38:58', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `socialmediaaccounts`
--
ALTER TABLE `socialmediaaccounts`
  ADD PRIMARY KEY (`AccountID`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `socialmediaaccounts`
--
ALTER TABLE `socialmediaaccounts`
  MODIFY `AccountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `socialmediaaccounts`
--
ALTER TABLE `socialmediaaccounts`
  ADD CONSTRAINT `socialmediaaccounts_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
