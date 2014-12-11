-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2014 at 01:15 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `decorbox`
--

-- --------------------------------------------------------

--
-- Table structure for table `store_categories`
--

CREATE TABLE IF NOT EXISTS `store_categories` (
`id` int(11) NOT NULL,
  `cat_title` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `store_categories`
--

INSERT INTO `store_categories` (`id`, `cat_title`) VALUES
(5, 'Bernvakario atributika'),
(6, 'Dekoracijos namams'),
(1, 'Gimtadienio atributika'),
(3, 'Krikštynų atributika'),
(4, 'Mergvakario atributika'),
(2, 'Vestuvių atributika');

-- --------------------------------------------------------

--
-- Table structure for table `store_items`
--

CREATE TABLE IF NOT EXISTS `store_items` (
`id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `item_title` varchar(75) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `item_price` float(8,2) DEFAULT NULL,
  `item_desc` text COLLATE utf8_lithuanian_ci,
  `item_image` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `store_items`
--

INSERT INTO `store_items` (`id`, `cat_id`, `item_title`, `item_price`, `item_desc`, `item_image`) VALUES
(1, 1, 'Gimtadienio atributikoje Koala', 12.00, 'Graži koala', 'images/Koala.jpg'),
(2, 2, 'Vestuvių atributikoj Tulpės', 3.00, 'Gražios Tulpės', 'images/Tulips.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `store_orders`
--

CREATE TABLE IF NOT EXISTS `store_orders` (
`id` int(11) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_name` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `order_address` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `order_city` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `order_zip` varchar(10) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `order_tel` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `order_email` varchar(100) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `item_total` float(6,2) DEFAULT NULL,
  `shipping_total` float(6,2) DEFAULT NULL,
  `authorization` varchar(50) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `status` enum('processed','pending') COLLATE utf8_lithuanian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `store_orders_items`
--

CREATE TABLE IF NOT EXISTS `store_orders_items` (
`id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `sel_item_id` int(11) DEFAULT NULL,
  `sel_item_qty` smallint(6) DEFAULT NULL,
  `sel_item_size` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `sel_item_color` varchar(25) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `sel_item_price` float(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `store_shoppertrack`
--

CREATE TABLE IF NOT EXISTS `store_shoppertrack` (
`id` int(11) NOT NULL,
  `session_id` varchar(32) COLLATE utf8_lithuanian_ci DEFAULT NULL,
  `sel_item_id` int(11) DEFAULT NULL,
  `sel_item_qty` smallint(6) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `store_shoppertrack`
--

INSERT INTO `store_shoppertrack` (`id`, `session_id`, `sel_item_id`, `sel_item_qty`, `date_added`) VALUES
(2, 'eph481ighplk8fptk5gd0r8jj0', 1, 2, '2014-12-07 01:25:35'),
(29, 'eph481ighplk8fptk5gd0r8jj0', 1, 1, '2014-12-10 23:44:49'),
(30, 'eph481ighplk8fptk5gd0r8jj0', 1, 5, '2014-12-10 23:46:55'),
(32, 'eph481ighplk8fptk5gd0r8jj0', 1, 1, '2014-12-10 23:48:46'),
(33, 'eph481ighplk8fptk5gd0r8jj0', 1, 1, '2014-12-10 23:50:12'),
(35, 'eph481ighplk8fptk5gd0r8jj0', 2, 3, '2014-12-11 00:00:30'),
(37, 'eph481ighplk8fptk5gd0r8jj0', 2, 8, '2014-12-11 00:38:37'),
(38, 'eph481ighplk8fptk5gd0r8jj0', 1, 6, '2014-12-11 00:40:11'),
(39, 'eph481ighplk8fptk5gd0r8jj0', 1, 8, '2014-12-11 14:15:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `store_categories`
--
ALTER TABLE `store_categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `cat_title` (`cat_title`);

--
-- Indexes for table `store_items`
--
ALTER TABLE `store_items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_orders`
--
ALTER TABLE `store_orders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_orders_items`
--
ALTER TABLE `store_orders_items`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_shoppertrack`
--
ALTER TABLE `store_shoppertrack`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `store_categories`
--
ALTER TABLE `store_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `store_items`
--
ALTER TABLE `store_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `store_orders`
--
ALTER TABLE `store_orders`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store_orders_items`
--
ALTER TABLE `store_orders_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store_shoppertrack`
--
ALTER TABLE `store_shoppertrack`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
