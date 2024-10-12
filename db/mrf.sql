-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 31, 2024 at 06:52 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mrf`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products1`
--

DROP TABLE IF EXISTS `products1`;
CREATE TABLE IF NOT EXISTS `products1` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `batchNo` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `minimum_qty` int DEFAULT NULL,
  `available_qty` int DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products1`
--

INSERT INTO `products1` (`pid`, `batchNo`, `name`, `price`, `brand`, `image`, `minimum_qty`, `available_qty`) VALUES
(1, 'SA0069', 'Saron', 1500.00, 'nando', '../uploads/6658ad522311c.jpg', 5, 2),
(6, 'SA0067', 'Saron', 1565.00, 'Coil', '../uploads/6658ad7b29676.jpg', 8, 119),
(8, 'SA0070', 'Saron', 157.00, 'Ahnas', '../uploads/6658ada620e5d.jpg', 5, -3),
(10, 'BE0078', 'Bed-cover', 2520.00, 'Nando', '../uploads/6656a7f39ad7c.jpg', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_title` varchar(255) NOT NULL,
  `report_content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `quantity_sold` int NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `sale_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `pid` (`pid`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `pid`, `quantity_sold`, `sale_price`, `sale_date`, `customer_id`) VALUES
(1, 1, 2, 3000.00, '2024-05-30 22:23:42', 1),
(2, 6, 3, 4695.00, '2024-05-30 22:23:42', 1),
(3, 8, 5, 785.00, '2024-05-30 22:23:42', 1),
(4, 10, 2, 5040.00, '2024-05-30 22:24:32', 1),
(5, 6, 1, 1565.00, '2024-05-30 22:24:32', 1),
(6, 1, 1, 1500.00, '2024-05-30 22:24:32', 1),
(7, 8, 3, 471.00, '2024-05-30 22:24:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_alerts`
--

DROP TABLE IF EXISTS `stock_alerts`;
CREATE TABLE IF NOT EXISTS `stock_alerts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `current_stock` int NOT NULL,
  `alert_threshold` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_images`
--

DROP TABLE IF EXISTS `tbl_images`;
CREATE TABLE IF NOT EXISTS `tbl_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_images`
--

INSERT INTO `tbl_images` (`id`, `img`) VALUES
(1, '1714741356.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$dN3HCZq8lwuluH1G5M8gHOfc7RQzYCr6Fcou4qFNlp/JRPv4FDjIC'),
(2, 'test', '123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
