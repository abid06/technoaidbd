-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2016 at 06:53 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ci_suman`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dyn_groups`
--

CREATE TABLE IF NOT EXISTS `dyn_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Navigation groupings. Eg, header, sidebar, footer, etc' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dyn_groups`
--

INSERT INTO `dyn_groups` (`id`, `title`, `abbrev`) VALUES
(1, 'Header', 'header'),
(2, 'Sidebar', 'sidebar'),
(3, 'Footer', 'footer'),
(4, 'Topbar', 'topbar'),
(5, 'Sidebar1', 'sidebar1'),
(6, 'Sidebar2', 'sidebar2');

-- --------------------------------------------------------

--
-- Table structure for table `dyn_menu`
--

CREATE TABLE IF NOT EXISTS `dyn_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dyn_group_id` int(11) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `is_parent` tinyint(1) NOT NULL DEFAULT '0',
  `show_menu` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `dyn_group_id - normal` (`dyn_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `dyn_menu`
--

INSERT INTO `dyn_menu` (`id`, `title`, `link_type`, `page_id`, `module_name`, `url`, `uri`, `dyn_group_id`, `position`, `target`, `parent_id`, `is_parent`, `show_menu`) VALUES
(1, 'Home', 'page', 1, '', 'http://www.category1.com', '', 1, 0, '', 0, 0, '1'),
(2, 'About Us', 'page', 2, '', 'http://www.category2.com', '', 1, 0, '', 0, 0, '1'),
(3, 'Networking ', 'page', 3, '', 'http://www.category3.com', '', 1, 0, '', 0, 1, '1'),
(4, 'Security System', 'page', 4, '', 'http://www.category4.com', '', 1, 0, '', 0, 0, '1'),
(5, 'Web Developments', 'page', 5, '', 'http://www.category11.com', '', 1, 0, '', 0, 0, '1'),
(6, 'Corporate Sales', 'page', 6, '', 'http://www.category12.com', '', 1, 0, '', 0, 1, '1'),
(7, 'Product Gallery', 'page', 7, '', 'http://www.category121.com', '', 1, 0, '', 0, 0, '1'),
(8, 'Contact Us', 'page', 8, '', 'http://www.category122.com', '', 1, 0, '', 0, 1, '1'),
(9, 'Structure Networking', 'page', 9, '', 'http://www.category1221.com', '', 1, 0, '', 3, 0, '1'),
(10, 'Wireless Networking', 'page', 10, '', 'http://www.category1222.com', '', 1, 0, '', 3, 0, '1'),
(11, 'Server Solutions', 'page', 11, '', 'http://www.category31.com', '', 1, 0, '', 3, 1, '1'),
(12, 'Category 3 - 2', 'page', 12, '', 'http://www.category32.com', '', 1, 0, '', 3, 0, '1'),
(13, 'Category 3 - 3', 'page', 13, '', 'http://www.category33.com', '', 1, 0, '', 3, 0, '1'),
(14, 'Category 3 - 4', 'page', 14, '', 'http://www.category34.com', '', 1, 0, '', 3, 0, '1'),
(15, 'Category 3 - 5', 'page', 15, '', 'http://www.category35.com', '', 1, 0, '', 3, 0, '1'),
(16, 'Category 3 - 6', 'page', 16, '', 'http://www.category36.com', '', 1, 0, '', 3, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `text`) VALUES
(1, 'Yahoo Search - Web Search', 'Yahoo---Search---Web---Search', 'The search engine that helps you find exactly what you''re looking for. Find the most relevant information, video, images, and answers from all across the Web.'),
(2, 'FreeFind.com: Site Search Engine, Free and Pro Versions', 'FreeFind.com', 'Free site search engine. Add a site search engine to your website today, for free, in less than ten minutes. Choose from Free and Pro site search engines.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE IF NOT EXISTS `tbl_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strmenu` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `valid` int(11) NOT NULL COMMENT 'if 0 then inactive else if 1 then active',
  `entrydate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strmenu` (`strmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id`, `strmenu`, `valid`, `entrydate`) VALUES
(1, 'Home', 1, '2015-11-30 18:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE IF NOT EXISTS `tbl_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caption_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `caption_subtitle` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `valid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`id`, `caption_title`, `caption_subtitle`, `image`, `image_path`, `valid`) VALUES
(2, 'by one, get one <span class="primary">50% <strong>off</strong></span>', 'school supplies & backpacks.*', 'h4-slide2.png', 'assets/img/h4-slide2.png', 1),
(6, 'Notun File', 'Tule dekhi', 'a7075da0c9b0527c4d61d6db2dcbdc51.png', 'assets/files/a7075da0c9b0527c4d61d6db2dcbdc51.png', 1),
(7, 'Test Data <strong>Entry</strong>', 'Nothing to Say', '5d2f1446e618e07f6a04a47ae8b02c48.png', 'assets/files/5d2f1446e618e07f6a04a47ae8b02c48.png', 1),
(8, 'Apex', 'Test title', '2649c962421f904c936b95ef2484f516.jpg', 'assets/files/2649c962421f904c936b95ef2484f516.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `tagline` varchar(255) DEFAULT NULL,
  `teamId` int(11) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `firstName`, `lastName`, `avatar`, `tagline`, `teamId`, `isAdmin`) VALUES
(1, 'admin@example.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Admin', 'Schmadmin', 'assassin_avatar', 'Good Style', 1, 1),
(11, 'abid@apexfootwearltd.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Abid', 'Hasan', 'engineer_avatar', 'ke ki bole', 1, 0),
(12, 'habib@apexfootearltd.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Habibur', 'Rahman', 'nurse_avatar', 'Click here to edit tagline.', 1, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
