-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Sep 20, 2017 at 01:40 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `groomingapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `be_modules`
--

CREATE TABLE `be_modules` (
  `module_id` int(11) NOT NULL,
  `module_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `module_desc` text CHARACTER SET utf8 NOT NULL,
  `module_icon` varchar(100) CHARACTER SET utf8 NOT NULL,
  `ordering` int(3) NOT NULL,
  `is_show_on_menu` tinyint(1) NOT NULL,
  `group_id` int(5) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `group_icon` varchar(50) NOT NULL,
  `group_has_child` tinyint(1) NOT NULL COMMENT '1=has child; 0=no child '
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_modules`
--

INSERT INTO `be_modules` (`module_id`, `module_name`, `module_desc`, `module_icon`, `ordering`, `is_show_on_menu`, `group_id`, `group_name`, `group_icon`, `group_has_child`) VALUES
(3, 'users', 'System Users', '', 18, 1, 3, 'Management', 'fa-eye', 1),
(4, 'appusers', 'Registered Users', '', 13, 1, 3, 'Management', 'fa-eye', 0),
(11, 'feeds', 'Promos List', '', 6, 1, 1, 'Entry', 'fa-pencil-square-o', 1),
(20, 'reservations', 'Appointments', '', 16, 1, 1, 'Entry', 'fa-eye', 1),
(22, 'configs', 'For branding', '', 20, 1, 3, 'Management', 'fa-eye', 1),
(23, 'dogs', 'Dog Images ', '', 7, 1, 1, 'Entry', 'fa-pencil-square-o', 0);

-- --------------------------------------------------------

--
-- Table structure for table `be_permissions`
--

CREATE TABLE `be_permissions` (
  `user_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_permissions`
--

INSERT INTO `be_permissions` (`user_id`, `module_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(3, 19),
(7, 1),
(7, 2),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 9),
(7, 10),
(7, 11),
(7, 12),
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(5, 1),
(5, 2),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 19),
(4, 1),
(4, 2),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(2, 12),
(3, 21),
(4, 21),
(1, 3),
(1, 4),
(1, 11),
(1, 20),
(1, 22),
(1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `be_roles`
--

CREATE TABLE `be_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `role_desc` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_roles`
--

INSERT INTO `be_roles` (`role_id`, `role_name`, `role_desc`) VALUES
(1, 'admin', 'Administrator'),
(2, 'manager', 'Manager'),
(3, 'user', 'User'),
(4, 'shopadmin', 'Restaurant Admin');

-- --------------------------------------------------------

--
-- Table structure for table `be_role_access`
--

CREATE TABLE `be_role_access` (
  `role_id` int(11) NOT NULL,
  `action_id` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_role_access`
--

INSERT INTO `be_role_access` (`role_id`, `action_id`) VALUES
(1, 'add'),
(1, 'edit'),
(1, 'delete'),
(1, 'publish'),
(2, 'add'),
(2, 'edit'),
(2, 'publish'),
(3, 'add'),
(1, 'module'),
(1, 'ban'),
(2, 'delete'),
(3, 'edit');

-- --------------------------------------------------------

--
-- Table structure for table `be_users`
--

CREATE TABLE `be_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `user_email` text CHARACTER SET utf8 NOT NULL,
  `user_pass` text CHARACTER SET utf8 NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT '0',
  `is_shop_admin` tinyint(1) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_users`
--

INSERT INTO `be_users` (`user_id`, `user_name`, `user_email`, `user_pass`, `role_id`, `is_owner`, `is_shop_admin`, `shop_id`, `added`, `status`) VALUES
(1, 'admin', 'admin@restaurateur.com', '21232f297a57a5a743894a0e4a801fc3', 1, 1, 0, 0, '0000-00-00 00:00:00', 1),
(2, 'manager', 'manager@mokets.com', '1d0258c2440a8d19e716292b231e3190', 2, 0, 0, 0, '0000-00-00 00:00:00', 1),
(3, 'shop1_admin', 'shop1_admin@gmail.com', '12186fe8a7b1dd053d95e8d3379c7271', 4, 0, 1, 1, '2015-01-23 20:41:01', 1),
(4, 'shop2_admin', 'shop2_admin@gmail.com', '5370c7bc26a91164afc88362b70fce08', 4, 0, 1, 2, '2015-01-24 14:46:34', 1),
(5, 'shop3_admin', 'shop3_admin@gmail.com', '3382caaae3b952c6e7819a2bfafc0c2b', 4, 0, 1, 3, '2015-01-24 14:47:28', 1),
(7, 'shop4_admin', 'shop4_admin@gmail.com', 'da2a15f92f90c97dc51a8369bc58d528', 4, 0, 1, 4, '2015-01-24 14:54:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rt_appusers`
--

CREATE TABLE `rt_appusers` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` text,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT NULL,
  `about_me` text NOT NULL,
  `delivery_address` text NOT NULL,
  `billing_address` text NOT NULL,
  `profile_photo` text NOT NULL,
  `background_photo` text NOT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_appusers`
--

INSERT INTO `rt_appusers` (`id`, `username`, `password`, `email`, `phone`, `dob`, `gender`, `address`, `city`, `state`, `subscribe`, `about_me`, `delivery_address`, `billing_address`, `profile_photo`, `background_photo`, `is_banned`, `status`, `added`, `updated`) VALUES
(1, 'Han', '202cb962ac59075b964b07152d234b70', 'csemrm@gmail.com', 'qwewq', '2017-09-11', 'm', 'wqew', 'wqe', NULL, 0, 'Lorem ipsum dolor sit amet,consectetuer adipiscing elit. Aenean commodo ligula eget dolor.', 'No-1, School Road, Yangon Myanmar', 'No-2, River Road, Yangon Myanmar', '1-profile5.jpg', '1-background2.jpg', 0, 1, '2014-12-16 20:28:12', NULL),
(6, 'Milon', '827ccb0eea8a706c4c34a16891f84e7b', 'Csemrm@yahoo.com', '01712121212', '0000-00-00', 'M', 'Your Address', 'She', 'Dhaka', 1, '', '', '', '', '', 0, 1, '2017-09-11 15:53:45', NULL),
(7, 'milo 2', '827ccb0eea8a706c4c34a16891f84e7b', 'csemrm@hotmail.com', '0171414141', '0000-00-00', 'M', 'Your Address', 'dhaka', 'and ', 0, '', '', '', '', '', 0, 1, '2017-09-11 16:59:47', NULL),
(8, 'Name', '827ccb0eea8a706c4c34a16891f84e7b', 'Csemmem@sss.cm', '01777', '0000-00-00', 'M', 'Your Address', 'Df she', 'Df', 1, '', '', '', '', '', 0, 1, '2017-09-15 09:54:27', NULL),
(9, 'Milontest', 'e10adc3949ba59abbe56e057f20f883e', 'Csemrm@yhaa.com', '017123', '0000-00-00', 'M', 'Your Address', 'Dhaka', 'Ff', 1, '', '', '', '', '', 0, 1, '2017-09-16 08:41:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_branding`
--

CREATE TABLE `rt_branding` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `slugon` varchar(255) NOT NULL,
  `compnay_logo` text NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `about_us` text NOT NULL,
  `contact_address` text NOT NULL,
  `services` text,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_branding`
--

INSERT INTO `rt_branding` (`id`, `company_name`, `slugon`, `compnay_logo`, `contact_email`, `about_us`, `contact_address`, `services`, `added`, `updated`) VALUES
(1, 'Han', '827ccb0eea8a706c4 c34a16891f84e7b', '1-profile5.jpg', 'pphmit@gmail.com', 'Lorem ipsum dolor sit amet,consectetuer adipiscing elit. Aenean commodo ligula eget dolor.\n', 'No-1, School Road, \nYangon Myanmar', NULL, '2014-12-16 20:28:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_categories`
--

CREATE TABLE `rt_categories` (
  `id` int(11) NOT NULL,
  `appuser_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `bread` varchar(10) DEFAULT NULL,
  `is_published` int(11) NOT NULL DEFAULT '1',
  `status` varchar(15) DEFAULT NULL,
  `ordering` int(5) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_categories`
--

INSERT INTO `rt_categories` (`id`, `appuser_id`, `name`, `type`, `gender`, `weight`, `bread`, `is_published`, `status`, `ordering`, `added`, `updated`) VALUES
(1, 1, 'Sushi', NULL, NULL, NULL, NULL, 1, NULL, 1, '2015-04-25 17:54:47', NULL),
(2, 1, 'Noddles', NULL, NULL, NULL, NULL, 1, NULL, 2, '2015-04-25 18:21:55', NULL),
(4, 1, 'Grilled Dishes', NULL, NULL, NULL, NULL, 1, NULL, 3, '2015-04-25 18:52:10', NULL),
(5, 1, 'Simmered Dishes', NULL, NULL, NULL, NULL, 1, NULL, 4, '2015-04-25 19:06:56', NULL),
(6, 1, 'Desert', NULL, NULL, NULL, NULL, 1, NULL, 5, '2015-04-25 19:21:30', NULL),
(30, 1, 'Milon', 'Dog', 'Male', 60, 'Bread', 1, NULL, 0, '2017-09-11 07:14:38', NULL),
(31, 1, 'Test 2', 'Dog', 'Male', 12, 'Bread', 1, NULL, 0, '2017-09-11 07:22:15', NULL),
(32, 6, 'My Pet', 'Dog', 'Male', 40, 'Cv ss', 1, NULL, 0, '2017-09-11 15:54:30', NULL),
(33, 6, 'My Pet2', 'Dog', 'Male', 500, 'Be t', 1, NULL, 0, '2017-09-11 15:55:16', NULL),
(34, 7, 'my pet 1', 'Dog', 'Male', 23, '45', 1, NULL, 0, '2017-09-11 17:00:24', NULL),
(35, 1, 'poop', 'Dog', 'Male', 500, 'corndog', 1, NULL, 0, '2017-09-11 18:37:17', NULL),
(36, 1, 'farteen', 'Cat', 'Male', 5, 'huskie', 1, NULL, 0, '2017-09-15 09:01:04', NULL),
(37, 8, 'Test 2', 'Cat', 'Male', 22, 'B', 1, NULL, 0, '2017-09-15 09:54:46', NULL),
(38, 9, 'M Pets 2', 'Cat', 'Female', 10, 'B', 1, NULL, 0, '2017-09-16 08:41:38', NULL),
(39, 1, 'frankie', 'Dog', 'Male', 118, 'fluffydog', 1, NULL, 0, '2017-09-16 19:53:31', NULL),
(40, 2147483647, 'griffin', 'Dog', 'Male', 20, 'vizla', 1, NULL, 0, '2017-09-16 22:51:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_codes`
--

CREATE TABLE `rt_codes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` text NOT NULL,
  `is_systemuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_contactus`
--

CREATE TABLE `rt_contactus` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_coupons`
--

CREATE TABLE `rt_coupons` (
  `id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_code` varchar(10) NOT NULL,
  `coupon_amount` float NOT NULL,
  `shop_id` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_coupons`
--

INSERT INTO `rt_coupons` (`id`, `coupon_name`, `coupon_code`, `coupon_amount`, `shop_id`, `is_published`, `added`) VALUES
(1, 'Student Coupon', 'happy', 3, 1, 1, '2015-05-08 18:47:56'),
(2, 'Summer Coupon', 'ZXCV', 5, 2, 1, '2015-05-14 17:26:22'),
(3, 'Shop Coupon', 'ASDF', 2, 9, 1, '2015-05-14 19:29:12'),
(4, 'Shop Coupon', 'abcd', 3, 3, 1, '2015-05-14 19:33:12'),
(5, 'Shop Coupon', 'QWER', 1, 4, 1, '2015-05-14 19:33:47'),
(6, 'Shop Coupon', '1234', 1, 5, 1, '2015-05-14 19:34:52'),
(7, 'Shop Coupon', 'ZXCV', 1, 6, 1, '2015-05-14 19:35:18'),
(8, 'Shop Coupon', 'Q123', 1, 7, 1, '2015-05-14 19:36:01'),
(9, 'Shop Coupon', 'Z123', 1, 8, 1, '2015-05-14 19:36:29');

-- --------------------------------------------------------

--
-- Table structure for table `rt_discount_type`
--

CREATE TABLE `rt_discount_type` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `percent` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_discount_type`
--

INSERT INTO `rt_discount_type` (`id`, `shop_id`, `name`, `percent`) VALUES
(1, 1, 'Shop Opening Discount 10%', 0.1),
(2, 1, 'Summer Promotion 10%', 0.1),
(3, 1, 'Winter Promotion 20%', 0.2),
(4, 2, 'Summer Promotion 10%', 0.1),
(5, 2, 'Winter Promotion 20%', 0.2),
(6, 2, 'Holiday Discount 10%', 0.1),
(7, 3, 'Summer Promotion 10%', 0.1),
(8, 3, 'Winter Promotion 20%', 0.2),
(9, 4, 'Summer Promotion 10%', 0.1),
(10, 4, 'Winter Promotion 20%', 0.2),
(11, 5, 'Summer Promotion 10%', 0.1),
(12, 5, 'Winter Promotion 20%', 0.2),
(13, 6, 'Summer Promotion 10%', 0.1),
(14, 6, 'Winter Promotion 20%', 0.2),
(15, 7, 'Summer Promotion 10%', 0.1),
(16, 7, 'Holiday Discount 10%', 0.1),
(17, 8, 'Summer Promotion 10%', 0.1),
(18, 8, 'Holiday Discount 10%', 0.1),
(19, 9, 'Summer Promotion 10%', 0.1),
(20, 9, 'Holiday Discount 10%', 0.1);

-- --------------------------------------------------------

--
-- Table structure for table `rt_favourites`
--

CREATE TABLE `rt_favourites` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `appuser_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_favourites`
--

INSERT INTO `rt_favourites` (`id`, `item_id`, `appuser_id`, `shop_id`, `added`) VALUES
(1, 120, 1, 3, '2015-05-09 15:39:56'),
(2, 42, 1, 1, '2015-05-09 15:41:04'),
(3, 55, 1, 1, '2015-05-09 15:41:14'),
(4, 23, 1, 1, '2015-05-15 15:41:26'),
(5, 63, 1, 1, '2015-05-15 16:25:47'),
(6, 33, 1, 1, '2015-05-15 16:36:31'),
(7, 54, 1, 1, '2015-05-15 16:51:52'),
(8, 167, 1, 4, '2015-05-15 18:03:27'),
(9, 281, 1, 7, '2015-05-15 18:16:55');

-- --------------------------------------------------------

--
-- Table structure for table `rt_feeds`
--

CREATE TABLE `rt_feeds` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_feeds`
--

INSERT INTO `rt_feeds` (`id`, `shop_id`, `title`, `description`, `is_published`, `added`) VALUES
(1, 1, 'Sushi Promotion', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo', 1, '2015-05-08 19:43:25');

-- --------------------------------------------------------

--
-- Table structure for table `rt_follows`
--

CREATE TABLE `rt_follows` (
  `id` int(11) NOT NULL,
  `appuser_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_follows`
--

INSERT INTO `rt_follows` (`id`, `appuser_id`, `shop_id`, `added`) VALUES
(1, 1, 1, '2015-05-08 19:59:05'),
(2, 1, 2, '2015-05-15 16:36:56'),
(3, 1, 3, '2015-05-15 16:52:23');

-- --------------------------------------------------------

--
-- Table structure for table `rt_images`
--

CREATE TABLE `rt_images` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `path` text NOT NULL,
  `width` text NOT NULL,
  `height` text NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=938 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_images`
--

INSERT INTO `rt_images` (`id`, `parent_id`, `shop_id`, `type`, `path`, `width`, `height`, `description`) VALUES
(3, 1, 0, 'sub_category', '1.jpeg', '275', '183', ''),
(4, 2, 0, 'sub_category', '2.jpeg', '251', '201', ''),
(5, 3, 0, 'sub_category', '5.jpeg', '290', '174', ''),
(6, 4, 0, 'sub_category', '8.jpeg', '290', '174', ''),
(7, 1, 0, 'item', '1(1).jpeg', '275', '183', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(8, 1, 0, 'item', '2(1).jpeg', '192', '128', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(9, 1, 0, 'item', '3.jpeg', '228', '128', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(10, 2, 0, 'item', '2(2).jpeg', '192', '128', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(11, 2, 0, 'item', '3(1).jpeg', '228', '128', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(12, 2, 0, 'item', '4.jpeg', '275', '183', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(13, 3, 0, 'item', '3(2).jpeg', '228', '128', 'Aenean commodo ligula eget dolor. Aenean massa.'),
(14, 3, 0, 'item', '5(1).jpeg', '238', '128', 'Aenean commodo ligula eget dolor. Aenean massa.'),
(15, 4, 0, 'item', '5(2).jpeg', '238', '128', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(16, 4, 0, 'item', '6.jpeg', '192', '128', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(17, 5, 0, 'item', '6(1).jpeg', '192', '128', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(18, 5, 0, 'item', '7.jpeg', '214', '235', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(19, 6, 0, 'item', '7(1).jpeg', '214', '235', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(20, 6, 0, 'item', '8(1).jpeg', '183', '275', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(21, 7, 0, 'item', '8(2).jpeg', '183', '275', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(22, 7, 0, 'item', '9.jpeg', '301', '167', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(23, 8, 0, 'item', '1(2).jpeg', '225', '225', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(24, 8, 0, 'item', '2(3).jpeg', '251', '201', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(25, 9, 0, 'item', '2(4).jpeg', '251', '201', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(26, 9, 0, 'item', '3(3).jpeg', '264', '171', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(27, 10, 0, 'item', '4(1).jpeg', '217', '232', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(28, 10, 0, 'item', '6(2).jpeg', '184', '274', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(29, 11, 0, 'item', '6(3).jpeg', '184', '274', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(30, 11, 0, 'item', '7(2).jpeg', '315', '160', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(31, 12, 0, 'item', '7(3).jpeg', '315', '160', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(32, 12, 0, 'item', '9(1).jpeg', '225', '225', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(33, 13, 0, 'item', '8(3).jpeg', '290', '174', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(34, 13, 0, 'item', '4(2).jpeg', '217', '232', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(35, 14, 0, 'item', '25.jpeg', '259', '194', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(36, 14, 0, 'item', '24.jpeg', '274', '184', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(37, 15, 0, 'item', '22.jpeg', '225', '225', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(38, 15, 0, 'item', '21(1).jpeg', '300', '168', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(39, 16, 0, 'item', '20.jpeg', '274', '184', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(40, 16, 0, 'item', '19.jpeg', '245', '205', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(41, 17, 0, 'item', '21(2).jpeg', '300', '168', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(42, 17, 0, 'item', '17.jpeg', '271', '186', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(43, 18, 0, 'item', '17(1).jpeg', '271', '186', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(44, 18, 0, 'item', '25(1).jpeg', '259', '194', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(45, 19, 0, 'item', '15.jpeg', '275', '183', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(46, 19, 0, 'item', '13.jpeg', '275', '183', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(47, 20, 0, 'item', '14.jpeg', '275', '183', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(48, 20, 0, 'item', '19(1).jpeg', '245', '205', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(49, 21, 0, 'item', '11.jpeg', '225', '225', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(50, 21, 0, 'item', '21(3).jpeg', '300', '168', 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'),
(53, 5, 0, 'sub_category', '12.jpeg', '260', '194', ''),
(54, 6, 0, 'sub_category', '23.jpeg', '259', '195', ''),
(55, 7, 0, 'sub_category', '31.jpeg', '275', '183', ''),
(56, 8, 0, 'sub_category', '41.jpeg', '273', '185', ''),
(57, 22, 0, 'item', '1(3).jpeg', '260', '194', 'Nam eget dui.'),
(58, 22, 0, 'item', '2(5).jpeg', '259', '195', 'Nam eget dui.'),
(59, 23, 0, 'item', '2(6).jpeg', '259', '195', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(60, 23, 0, 'item', '3(4).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(61, 24, 0, 'item', '4(3).jpeg', '273', '185', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(62, 24, 0, 'item', '5(3).jpeg', '263', '191', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(63, 25, 0, 'item', '6(4).jpeg', '204', '200', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(64, 25, 0, 'item', '10.jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(65, 26, 0, 'item', '9(2).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(66, 26, 0, 'item', '11(1).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(67, 27, 0, 'item', '25(2).jpeg', '276', '183', ' Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(68, 27, 0, 'item', '24(1).jpeg', '202', '249', ' Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(69, 28, 0, 'item', '24(2).jpeg', '202', '249', 'Quisque rutrum. '),
(70, 28, 0, 'item', '22(1).jpeg', '295', '171', 'Quisque rutrum. '),
(71, 29, 0, 'item', '21(4).jpeg', '225', '225', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(72, 29, 0, 'item', '24(3).jpeg', '202', '249', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(73, 30, 0, 'item', '15(1).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(74, 30, 0, 'item', '22(2).jpeg', '295', '171', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(75, 31, 0, 'item', '13(1).jpeg', '203', '248', 'Quisque rutrum. '),
(76, 31, 0, 'item', '16.jpeg', '225', '225', 'Quisque rutrum. '),
(77, 32, 0, 'item', '8(4).jpeg', '252', '200', 'Quisque rutrum. '),
(78, 32, 0, 'item', '17(2).jpeg', '225', '225', 'Quisque rutrum. '),
(79, 33, 0, 'item', '12(1).jpeg', '209', '241', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(80, 33, 0, 'item', '23(1).jpeg', '281', '180', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(81, 34, 0, 'item', '20(1).jpeg', '160', '213', ' Nam eget dui.'),
(82, 34, 0, 'item', '5(4).jpeg', '263', '191', ' Nam eget dui.'),
(83, 35, 0, 'item', '16(1).jpeg', '225', '225', 'Aenean vulputate eleifend tellus.'),
(84, 35, 0, 'item', '23(2).jpeg', '281', '180', 'Aenean vulputate eleifend tellus.'),
(85, 36, 0, 'item', '12(2).jpeg', '209', '241', 'Vivamus elementum semper nisi.'),
(86, 36, 0, 'item', '15(2).jpeg', '275', '183', 'Vivamus elementum semper nisi.'),
(87, 37, 0, 'item', '4(4).jpeg', '273', '185', 'Vivamus elementum semper nisi.'),
(88, 37, 0, 'item', '13(2).jpeg', '203', '248', 'Vivamus elementum semper nisi.'),
(89, 38, 0, 'item', '13(3).jpeg', '203', '248', 'Vivamus elementum semper nisi.'),
(90, 38, 0, 'item', '12(3).jpeg', '209', '241', 'Vivamus elementum semper nisi.'),
(91, 39, 0, 'item', '18.jpeg', '187', '269', 'Vivamus elementum semper nisi.'),
(92, 39, 0, 'item', '17(3).jpeg', '225', '225', 'Vivamus elementum semper nisi.'),
(93, 40, 0, 'item', '12(4).jpeg', '209', '241', 'Vivamus elementum semper nisi.'),
(94, 40, 0, 'item', '16(2).jpeg', '225', '225', 'Vivamus elementum semper nisi.'),
(96, 9, 0, 'sub_category', '110.jpeg', '259', '194', ''),
(97, 10, 0, 'sub_category', '27.jpeg', '259', '194', ''),
(98, 11, 0, 'sub_category', '32.jpeg', '259', '195', ''),
(99, 12, 0, 'sub_category', '42.jpeg', '259', '194', ''),
(100, 41, 0, 'item', '2(7).jpeg', '259', '194', 'Vivamus elementum semper nisi.'),
(101, 41, 0, 'item', '4(5).jpeg', '259', '194', 'Vivamus elementum semper nisi.'),
(102, 42, 0, 'item', '5(5).jpeg', '183', '275', 'Vivamus elementum semper nisi.'),
(103, 42, 0, 'item', '3(5).jpeg', '259', '195', 'Vivamus elementum semper nisi.'),
(104, 43, 0, 'item', '6(5).jpeg', '192', '192', 'Vivamus elementum semper nisi.'),
(105, 43, 0, 'item', '7(4).jpeg', '274', '184', 'Vivamus elementum semper nisi.'),
(106, 44, 0, 'item', '2(8).jpeg', '259', '194', 'Vivamus elementum semper nisi.'),
(107, 44, 0, 'item', '1(4).jpeg', '259', '194', 'Vivamus elementum semper nisi.'),
(108, 45, 0, 'item', '22(3).jpeg', '300', '168', 'Vivamus elementum semper nisi.'),
(109, 45, 0, 'item', '4(6).jpeg', '259', '194', 'Vivamus elementum semper nisi.'),
(110, 46, 0, 'item', '15(3).jpeg', '246', '205', 'Vivamus elementum semper nisi.'),
(111, 46, 0, 'item', '3(6).jpeg', '259', '195', 'Vivamus elementum semper nisi.'),
(112, 47, 0, 'item', '24(4).jpeg', '192', '192', 'Vivamus elementum semper nisi.'),
(113, 47, 0, 'item', '1(5).jpeg', '259', '194', 'Vivamus elementum semper nisi.'),
(114, 48, 0, 'item', '13(4).jpeg', '183', '275', 'Vivamus elementum semper nisi.'),
(115, 48, 0, 'item', '1(6).jpeg', '259', '194', 'Vivamus elementum semper nisi.'),
(116, 49, 0, 'item', '10(1).jpeg', '275', '183', 'Vivamus elementum semper nisi.'),
(117, 49, 0, 'item', '3(7).jpeg', '259', '195', 'Vivamus elementum semper nisi.'),
(118, 50, 0, 'item', '25(3).jpeg', '183', '275', ' Nam eget dui.'),
(119, 50, 0, 'item', '24(5).jpeg', '192', '192', ' Nam eget dui.'),
(120, 51, 0, 'item', '23(3).jpeg', '172', '172', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(121, 51, 0, 'item', '22(4).jpeg', '300', '168', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(122, 52, 0, 'item', '16(3).jpeg', '192', '144', 'Nam eget dui.'),
(123, 52, 0, 'item', '24(6).jpeg', '192', '192', 'Nam eget dui.'),
(124, 53, 0, 'item', '9(3).jpeg', '195', '259', 'Nam eget dui.'),
(125, 53, 0, 'item', '22(5).jpeg', '300', '168', 'Nam eget dui.'),
(127, 13, 0, 'sub_category', '121.jpeg', '259', '194', ''),
(128, 14, 0, 'sub_category', '112.jpeg', '251', '201', ''),
(129, 15, 0, 'sub_category', '141.jpeg', '259', '194', ''),
(130, 54, 0, 'item', '18(1).jpeg', '275', '183', 'Nam eget dui.'),
(131, 54, 0, 'item', '6(6).jpeg', '277', '182', 'Nam eget dui.'),
(132, 55, 0, 'item', '17(4).jpeg', '274', '184', 'Nam eget dui.'),
(133, 55, 0, 'item', '10(2).jpeg', '184', '274', 'Nam eget dui.'),
(134, 56, 0, 'item', '8(5).jpeg', '229', '139', 'Nam eget dui.'),
(135, 56, 0, 'item', '4(7).jpeg', '188', '268', 'Nam eget dui.'),
(136, 57, 0, 'item', '13(5).jpeg', '183', '276', 'Nam eget dui.'),
(137, 57, 0, 'item', '12(5).jpeg', '259', '194', 'Nam eget dui.'),
(138, 58, 0, 'item', '9(4).jpeg', '183', '276', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(139, 58, 0, 'item', '14(1).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(140, 59, 0, 'item', '6(7).jpeg', '277', '182', 'Nam eget dui.'),
(141, 59, 0, 'item', '18(2).jpeg', '275', '183', 'Nam eget dui.'),
(142, 60, 0, 'item', '19(2).jpeg', '184', '274', 'Nam eget dui.'),
(143, 60, 0, 'item', '15(4).jpeg', '275', '183', 'Nam eget dui.'),
(144, 61, 0, 'item', '7(5).jpeg', '185', '273', 'Nam eget dui.'),
(145, 61, 0, 'item', '17(5).jpeg', '274', '184', 'Nam eget dui.'),
(146, 62, 0, 'item', '11(2).jpeg', '259', '194', ' Nam eget dui.'),
(147, 62, 0, 'item', '12(6).jpeg', '259', '194', ' Nam eget dui.'),
(148, 63, 0, 'item', '21(5).jpeg', '194', '259', 'Nam eget dui.'),
(149, 63, 0, 'item', '11(3).jpeg', '259', '194', 'Nam eget dui.'),
(150, 64, 0, 'item', '22(6).jpeg', '183', '275', 'Nam eget dui.'),
(151, 64, 0, 'item', '12(7).jpeg', '259', '194', 'Nam eget dui.'),
(153, 16, 0, 'sub_category', '114.jpeg', '275', '183', ''),
(154, 17, 0, 'sub_category', '28.jpeg', '256', '169', ''),
(155, 18, 0, 'sub_category', '101.jpeg', '160', '160', ''),
(156, 65, 0, 'item', '11(4).jpeg', '275', '183', 'pretium quis, sem.'),
(157, 65, 0, 'item', '20(2).jpeg', '194', '259', 'pretium quis, sem.'),
(158, 66, 0, 'item', '15(5).jpeg', '275', '183', 'vulputate eget, arcu'),
(159, 66, 0, 'item', '21(6).jpeg', '194', '259', 'vulputate eget, arcu'),
(160, 67, 0, 'item', '8(6).jpeg', '282', '160', 'vulputate eget, arcu'),
(161, 67, 0, 'item', '20(3).jpeg', '194', '259', 'vulputate eget, arcu'),
(162, 68, 0, 'item', '9(5).jpeg', '260', '194', ' vulputate eget, arcu'),
(163, 68, 0, 'item', '7(6).jpeg', '248', '203', ' vulputate eget, arcu'),
(164, 69, 0, 'item', '13(6).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu'),
(165, 69, 0, 'item', '14(2).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu'),
(166, 70, 0, 'item', '19(3).jpeg', '265', '190', 'ulputate eget, arcu'),
(167, 70, 0, 'item', '25(4).jpeg', '194', '259', 'ulputate eget, arcu'),
(168, 71, 0, 'item', '10(3).jpeg', '160', '160', 'vulputate eget, arcu'),
(169, 71, 0, 'item', '19(4).jpeg', '265', '190', 'vulputate eget, arcu'),
(170, 72, 0, 'item', '21(7).jpeg', '194', '259', 'aliquet nec, vulputate eget, arcu'),
(171, 72, 0, 'item', '16(4).jpeg', '241', '209', 'aliquet nec, vulputate eget, arcu'),
(172, 73, 0, 'item', '16(5).jpeg', '241', '209', 'aliquet nec, vulputate eget, arcu'),
(173, 73, 0, 'item', '6(8).jpeg', '251', '201', 'aliquet nec, vulputate eget, arcu'),
(174, 74, 0, 'item', '18(3).jpeg', '225', '225', 'vulputate eget, arcu'),
(175, 74, 0, 'item', '12(8).jpeg', '252', '200', 'vulputate eget, arcu'),
(178, 7, 0, 'category', '115.jpeg', '225', '225', ''),
(179, 19, 0, 'sub_category', '116.jpeg', '225', '225', ''),
(180, 20, 0, 'sub_category', '29.jpeg', '299', '168', ''),
(181, 21, 0, 'sub_category', '102.jpeg', '259', '194', ''),
(182, 75, 0, 'item', '2(9).jpeg', '299', '168', 'vulputate eget, arcu.'),
(183, 75, 0, 'item', '4(8).jpeg', '240', '180', 'vulputate eget, arcu.'),
(184, 76, 0, 'item', '4(9).jpeg', '240', '180', 'vulputate eget, arcu.'),
(185, 76, 0, 'item', '8(7).jpeg', '335', '150', 'vulputate eget, arcu.'),
(186, 77, 0, 'item', '11(5).jpeg', '250', '201', 'vulputate eget, arcu.'),
(187, 77, 0, 'item', '5(6).jpeg', '260', '194', 'vulputate eget, arcu.'),
(188, 78, 0, 'item', '13(7).jpeg', '200', '200', 'vulputate eget, arcu.'),
(189, 78, 0, 'item', '9(6).jpeg', '241', '209', 'vulputate eget, arcu.'),
(190, 79, 0, 'item', '10(4).jpeg', '275', '183', 'vulputate eget, arcu.'),
(191, 79, 0, 'item', '19(5).jpeg', '259', '194', 'vulputate eget, arcu.'),
(192, 80, 0, 'item', '1(7).jpeg', '277', '182', 'vulputate eget, arcu.'),
(193, 80, 0, 'item', '2(10).jpeg', '259', '194', 'vulputate eget, arcu.'),
(194, 81, 0, 'item', '3(8).jpeg', '272', '185', 'vulputate eget, arcu.'),
(195, 81, 0, 'item', '1(8).jpeg', '277', '182', 'vulputate eget, arcu.'),
(196, 82, 0, 'item', '11(6).jpeg', '194', '260', 'vulputate eget, arcu.'),
(197, 82, 0, 'item', '5(7).jpeg', '259', '194', 'vulputate eget, arcu.'),
(198, 83, 0, 'item', '1(9).jpeg', '274', '184', 'vulputate eget, arcu.'),
(199, 83, 0, 'item', '2(11).jpeg', '275', '183', 'vulputate eget, arcu.'),
(200, 84, 0, 'item', '4(10).jpeg', '259', '194', 'vulputate eget, arcu.'),
(201, 84, 0, 'item', '7(7).jpeg', '275', '183', 'vulputate eget, arcu.'),
(202, 85, 0, 'item', '8(8).jpeg', '275', '183', 'aliquet nec, vulputate eget, arcu.'),
(203, 85, 0, 'item', '9(7).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(204, 86, 0, 'item', '15(6).jpeg', '195', '258', 'vulputate eget, arcu.'),
(205, 86, 0, 'item', '19(6).jpeg', '200', '200', 'vulputate eget, arcu.'),
(206, 8, 0, 'category', '117.jpeg', '275', '183', ''),
(210, 25, 0, 'sub_category', '103.jpeg', '275', '183', ''),
(211, 22, 0, 'sub_category', '61.jpeg', '263', '192', ''),
(212, 23, 0, 'sub_category', '122.jpeg', '276', '182', ''),
(213, 24, 0, 'sub_category', '131.jpeg', '291', '173', ''),
(214, 87, 0, 'item', '1(10).jpeg', '275', '183', 'Nam eget dui.'),
(215, 87, 0, 'item', '2(12).jpeg', '259', '194', 'Nam eget dui.'),
(216, 88, 0, 'item', '2(13).jpeg', '259', '194', ' vulputate eget, arcu. '),
(217, 88, 0, 'item', '3(9).jpeg', '275', '183', ' vulputate eget, arcu. '),
(218, 89, 0, 'item', '3(10).jpeg', '275', '183', ' vulputate eget, arcu. '),
(219, 89, 0, 'item', '5(8).jpeg', '259', '194', ' vulputate eget, arcu. '),
(220, 90, 0, 'item', '6(9).jpeg', '263', '192', 'vulputate eget, arcu. '),
(221, 90, 0, 'item', '13(8).jpeg', '275', '183', 'vulputate eget, arcu. '),
(222, 91, 0, 'item', '1(11).jpeg', '275', '183', 'vulputate eget, arcu. '),
(223, 91, 0, 'item', '2(14).jpeg', '259', '194', 'vulputate eget, arcu. '),
(224, 92, 0, 'item', '2(15).jpeg', '259', '194', 'vulputate eget, arcu. '),
(225, 92, 0, 'item', '4(11).jpeg', '259', '194', 'vulputate eget, arcu. '),
(226, 93, 0, 'item', '4(12).jpeg', '259', '194', 'vulputate eget, arcu. '),
(227, 93, 0, 'item', '6(10).jpeg', '275', '183', 'vulputate eget, arcu. '),
(228, 94, 0, 'item', '7(8).jpeg', '259', '194', 'vulputate eget, arcu. '),
(229, 94, 0, 'item', '6(11).jpeg', '275', '183', 'vulputate eget, arcu. '),
(230, 95, 0, 'item', '1(12).jpeg', '275', '183', 'vulputate eget, arcu. '),
(231, 95, 0, 'item', '2(16).jpeg', '275', '183', 'vulputate eget, arcu. '),
(232, 96, 0, 'item', '2(17).jpeg', '275', '183', 'vulputate eget, arcu. '),
(233, 96, 0, 'item', '3(11).jpeg', '290', '174', 'vulputate eget, arcu. '),
(234, 97, 0, 'item', '4(13).jpeg', '172', '172', 'vulputate eget, arcu. '),
(235, 97, 0, 'item', '7(9).jpeg', '275', '183', 'vulputate eget, arcu. '),
(236, 98, 0, 'item', '1(13).jpeg', '275', '183', 'vulputate eget, arcu. '),
(237, 98, 0, 'item', '3(12).jpeg', '275', '183', 'vulputate eget, arcu. '),
(238, 99, 0, 'item', '5(9).jpeg', '275', '183', 'vulputate eget, arcu. '),
(239, 99, 0, 'item', '9(8).jpeg', '259', '195', 'vulputate eget, arcu. '),
(240, 100, 0, 'item', '15(7).jpeg', '183', '275', 'vulputate eget, arcu. '),
(241, 100, 0, 'item', '10(5).jpeg', '275', '183', 'vulputate eget, arcu. '),
(242, 9, 0, 'category', '252.jpeg', '295', '171', ''),
(243, 26, 0, 'sub_category', '118.jpeg', '259', '194', ''),
(244, 27, 0, 'sub_category', '33.jpeg', '240', '210', ''),
(245, 28, 0, 'sub_category', '62.jpeg', '259', '195', ''),
(246, 101, 0, 'item', '3(13).jpeg', '259', '194', 'vulputate eget, arcu. '),
(247, 101, 0, 'item', '2(18).jpeg', '275', '183', 'vulputate eget, arcu. '),
(248, 102, 0, 'item', '4(14).jpeg', '225', '225', ' vulputate eget, arcu. '),
(249, 102, 0, 'item', '2(19).jpeg', '275', '183', ' vulputate eget, arcu. '),
(250, 103, 0, 'item', '15(8).jpeg', '256', '197', 'vulputate eget, arcu. '),
(251, 103, 0, 'item', '3(14).jpeg', '259', '194', 'vulputate eget, arcu. '),
(252, 104, 0, 'item', '12(9).jpeg', '268', '188', 'vulputate eget, arcu. '),
(253, 104, 0, 'item', '4(15).jpeg', '225', '225', 'vulputate eget, arcu. '),
(254, 105, 0, 'item', '5(10).jpeg', '259', '194', 'vulputate eget, arcu. '),
(255, 105, 0, 'item', '1(14).jpeg', '259', '194', 'vulputate eget, arcu. '),
(256, 106, 0, 'item', '3(15).jpeg', '240', '210', 'vulputate eget, arcu. '),
(257, 106, 0, 'item', '4(16).jpeg', '259', '194', 'vulputate eget, arcu. '),
(258, 107, 0, 'item', '16(6).jpeg', '259', '194', 'vulputate eget, arcu. '),
(259, 107, 0, 'item', '6(12).jpeg', '259', '195', 'vulputate eget, arcu. '),
(260, 108, 0, 'item', '8(9).jpeg', '267', '189', 'vulputate eget, arcu. '),
(261, 108, 0, 'item', '17(6).jpeg', '259', '194', 'vulputate eget, arcu. '),
(262, 109, 0, 'item', '19(7).jpeg', '259', '194', ' vulputate eget, arcu. '),
(263, 109, 0, 'item', '11(7).jpeg', '275', '184', ' vulputate eget, arcu. '),
(264, 110, 0, 'item', '9(9).jpeg', '262', '193', 'vulputate eget, arcu. '),
(265, 110, 0, 'item', '5(11).jpeg', '259', '194', 'vulputate eget, arcu. '),
(266, 10, 0, 'category', '119.jpeg', '259', '194', ''),
(267, 29, 0, 'sub_category', '210.jpeg', '275', '183', ''),
(268, 30, 0, 'sub_category', '123.jpeg', '277', '182', ''),
(269, 31, 0, 'sub_category', '71.jpeg', '259', '194', ''),
(270, 111, 0, 'item', '2(20).jpeg', '275', '183', 'vulputate eget, arcu. '),
(271, 111, 0, 'item', '1(15).jpeg', '259', '194', 'vulputate eget, arcu. '),
(272, 112, 0, 'item', '3(16).jpeg', '259', '194', ' vulputate eget, arcu. '),
(273, 112, 0, 'item', '2(21).jpeg', '275', '183', ' vulputate eget, arcu. '),
(274, 113, 0, 'item', '16(7).jpeg', '259', '194', 'vulputate eget, arcu. '),
(275, 113, 0, 'item', '6(13).jpeg', '259', '194', 'vulputate eget, arcu. '),
(276, 114, 0, 'item', '1(16).jpeg', '259', '194', 'vulputate eget, arcu. '),
(277, 114, 0, 'item', '2(22).jpeg', '300', '168', 'vulputate eget, arcu. '),
(278, 115, 0, 'item', '19(8).jpeg', '278', '181', 'vulputate eget, arcu. '),
(279, 115, 0, 'item', '8(10).jpeg', '284', '177', 'vulputate eget, arcu. '),
(280, 116, 0, 'item', '11(8).jpeg', '277', '182', 'vulputate eget, arcu. '),
(281, 116, 0, 'item', '14(3).jpeg', '266', '189', 'vulputate eget, arcu. '),
(282, 117, 0, 'item', '12(10).jpeg', '277', '182', 'vulputate eget, arcu. '),
(283, 117, 0, 'item', '11(9).jpeg', '277', '182', 'vulputate eget, arcu. '),
(284, 118, 0, 'item', '8(11).jpeg', '284', '177', ' vulputate eget, arcu. '),
(285, 118, 0, 'item', '7(10).jpeg', '259', '194', ' vulputate eget, arcu. '),
(286, 119, 0, 'item', '9(10).jpeg', '277', '182', ' vulputate eget, arcu. '),
(287, 119, 0, 'item', '13(9).jpeg', '259', '194', ' vulputate eget, arcu. '),
(288, 3, 0, 'shop', 'shop5.png', '600', '400', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(289, 11, 0, 'category', '120.jpeg', '275', '183', ''),
(290, 32, 0, 'sub_category', '124.jpeg', '275', '183', ''),
(291, 33, 0, 'sub_category', '72.jpeg', '251', '201', ''),
(292, 34, 0, 'sub_category', '211.jpeg', '285', '177', ''),
(293, 120, 0, 'item', '1(17).jpeg', '275', '183', ' venenatis vitae, justo.'),
(294, 120, 0, 'item', '2(23).jpeg', '285', '177', ' venenatis vitae, justo.'),
(295, 121, 0, 'item', '14(4).jpeg', '276', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(296, 121, 0, 'item', '15(9).jpeg', '222', '172', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(297, 122, 0, 'item', '18(4).jpeg', '276', '183', 'venenatis vitae, justo.'),
(298, 122, 0, 'item', '9(11).jpeg', '259', '194', 'venenatis vitae, justo.'),
(299, 123, 0, 'item', '3(17).jpeg', '256', '192', 'venenatis vitae, justo.'),
(300, 123, 0, 'item', '5(12).jpeg', '271', '186', 'venenatis vitae, justo.'),
(301, 12, 0, 'category', '212.jpeg', '275', '183', ''),
(302, 35, 0, 'sub_category', '213.jpeg', '275', '183', ''),
(303, 36, 0, 'sub_category', '4.jpg', '200', '150', ''),
(304, 37, 0, 'sub_category', '1110.jpeg', '258', '195', ''),
(305, 124, 0, 'item', '4(1).jpg', '200', '150', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(306, 124, 0, 'item', '5(13).jpeg', '184', '274', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(307, 125, 0, 'item', '5(14).jpeg', '184', '274', 'n enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(308, 125, 0, 'item', '8(12).jpeg', '204', '247', 'n enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(309, 126, 0, 'item', '8(13).jpeg', '204', '247', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(310, 126, 0, 'item', '4(2).jpg', '200', '150', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(311, 127, 0, 'item', '3(18).jpeg', '160', '120', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(312, 127, 0, 'item', '11(10).jpeg', '258', '195', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(313, 128, 0, 'item', '13(10).jpeg', '256', '192', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(314, 128, 0, 'item', '3(19).jpeg', '160', '120', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(315, 129, 0, 'item', '1(18).jpeg', '292', '171', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(316, 129, 0, 'item', '10(6).jpeg', '155', '192', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(317, 130, 0, 'item', '17(7).jpeg', '259', '194', ' In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(318, 130, 0, 'item', '12(11).jpeg', '184', '201', ' In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(319, 131, 0, 'item', '15(10).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(320, 131, 0, 'item', '9(12).jpeg', '218', '231', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(321, 132, 0, 'item', '19(9).jpeg', '190', '266', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(322, 132, 0, 'item', '12(12).jpeg', '184', '201', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(323, 133, 0, 'item', '14(5).jpeg', '184', '160', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(324, 133, 0, 'item', '11(11).jpeg', '258', '195', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(325, 134, 0, 'item', '6(14).jpeg', '172', '274', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(326, 134, 0, 'item', '17(8).jpeg', '259', '194', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(327, 135, 0, 'item', '12(13).jpeg', '184', '201', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(328, 135, 0, 'item', '17(9).jpeg', '259', '194', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(329, 136, 0, 'item', '5(15).jpeg', '183', '275', 'venenatis vitae, justo.'),
(330, 136, 0, 'item', '7(11).jpeg', '183', '275', 'venenatis vitae, justo.'),
(331, 1, 0, 'shop', 'shop7.png', '600', '400', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(332, 2, 0, 'shop', 'shop6.png', '600', '400', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(333, 13, 0, 'category', '1111.jpeg', '275', '183', ''),
(334, 38, 0, 'sub_category', '63.jpeg', '228', '221', ''),
(335, 39, 0, 'sub_category', '125.jpeg', '276', '183', ''),
(336, 40, 0, 'sub_category', '132.jpeg', '275', '183', ''),
(337, 137, 0, 'item', '2(24).jpeg', '225', '225', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(338, 137, 0, 'item', '1(19).jpeg', '276', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(339, 138, 0, 'item', '3(20).jpeg', '200', '252', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(340, 138, 0, 'item', '2(25).jpeg', '225', '225', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(341, 139, 0, 'item', '5(16).jpeg', '225', '225', 'venenatis vitae, justo. '),
(342, 139, 0, 'item', '3(21).jpeg', '200', '252', 'venenatis vitae, justo. '),
(343, 140, 0, 'item', '5(17).jpeg', '225', '225', 'venenatis vitae, justo. '),
(344, 140, 0, 'item', '13(11).jpeg', '275', '183', 'venenatis vitae, justo. '),
(345, 141, 0, 'item', '16(8).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(346, 141, 0, 'item', '9(13).jpeg', '193', '261', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(347, 142, 0, 'item', '3(22).jpeg', '200', '252', 'venenatis vitae, justo. '),
(348, 142, 0, 'item', '12(14).jpeg', '183', '275', 'venenatis vitae, justo. '),
(349, 143, 0, 'item', '9(14).jpeg', '193', '261', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(350, 143, 0, 'item', '5(18).jpeg', '225', '225', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(351, 144, 0, 'item', '12(15).jpeg', '183', '275', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(352, 144, 0, 'item', '5(19).jpeg', '225', '225', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(353, 145, 0, 'item', '6(15).jpeg', '228', '221', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(354, 145, 0, 'item', '16(9).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(355, 146, 0, 'item', '13(12).jpeg', '275', '183', 'venenatis vitae, justo. '),
(356, 146, 0, 'item', '6(16).jpeg', '228', '221', 'venenatis vitae, justo. '),
(357, 147, 0, 'item', '15(11).jpeg', '250', '201', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(358, 147, 0, 'item', '9(15).jpeg', '193', '261', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(359, 148, 0, 'item', '7(12).jpeg', '194', '260', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(360, 148, 0, 'item', '5(20).jpeg', '225', '225', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(361, 149, 0, 'item', '12(16).jpeg', '183', '275', ' In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(362, 149, 0, 'item', '5(21).jpeg', '225', '225', ' In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(363, 14, 0, 'category', '214.jpeg', '275', '183', ''),
(364, 41, 0, 'sub_category', '126.jpeg', '275', '183', ''),
(365, 42, 0, 'sub_category', '215.jpeg', '275', '183', ''),
(366, 43, 0, 'sub_category', '51.jpeg', '275', '183', ''),
(367, 150, 0, 'item', '13(13).jpeg', '284', '177', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(368, 150, 0, 'item', '12(17).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(369, 151, 0, 'item', '10(7).jpeg', '225', '225', 'venenatis vitae, justo. '),
(370, 151, 0, 'item', '12(18).jpeg', '275', '183', 'venenatis vitae, justo. '),
(371, 152, 0, 'item', '11(12).jpeg', '214', '236', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(372, 152, 0, 'item', '10(8).jpeg', '225', '225', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(373, 153, 0, 'item', '8(14).jpeg', '227', '222', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(374, 153, 0, 'item', '5(22).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(375, 154, 0, 'item', '9(16).jpeg', '240', '200', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(376, 154, 0, 'item', '12(19).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(377, 155, 0, 'item', '6(17).jpeg', '290', '174', 'imperdiet a, venenatis vitae, justo. '),
(378, 155, 0, 'item', '11(13).jpeg', '214', '236', 'n enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(379, 156, 0, 'item', '10(9).jpeg', '225', '225', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(380, 156, 0, 'item', '9(17).jpeg', '240', '200', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(381, 157, 0, 'item', '8(15).jpeg', '227', '222', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(382, 157, 0, 'item', '12(20).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(383, 158, 0, 'item', '11(14).jpeg', '214', '236', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(384, 158, 0, 'item', '9(18).jpeg', '240', '200', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(385, 159, 0, 'item', '6(18).jpeg', '290', '174', ' venenatis vitae, justo. '),
(386, 159, 0, 'item', '4(17).jpeg', '263', '191', ' venenatis vitae, justo. '),
(387, 160, 0, 'item', '10(10).jpeg', '225', '225', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(388, 160, 0, 'item', '2(26).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. '),
(389, 161, 0, 'item', '1(20).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(390, 161, 0, 'item', '12(21).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(391, 162, 0, 'item', '5(23).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(392, 162, 0, 'item', '8(16).jpeg', '227', '222', 'Nullam dictum felis eu pede mollis pretium.'),
(393, 4, 0, 'shop', '9.jpg', '656', '448', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(394, 15, 0, 'category', '216.jpeg', '276', '183', ''),
(395, 44, 0, 'sub_category', '104.jpeg', '200', '134', ''),
(396, 45, 0, 'sub_category', '91.jpeg', '172', '172', ''),
(397, 46, 0, 'sub_category', '64.jpeg', '275', '183', ''),
(398, 163, 0, 'item', '1(21).jpeg', '200', '200', 'Nullam dictum felis eu pede mollis pretium.'),
(399, 163, 0, 'item', '2(27).jpeg', '276', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(400, 164, 0, 'item', '3(23).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(401, 164, 0, 'item', '1(22).jpeg', '200', '200', 'Nullam dictum felis eu pede mollis pretium.'),
(402, 165, 0, 'item', '7(13).jpeg', '188', '268', 'Nullam dictum felis eu pede mollis pretium.'),
(403, 165, 0, 'item', '6(19).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(404, 166, 0, 'item', '13(14).jpeg', '200', '200', 'Nullam dictum felis eu pede mollis pretium.'),
(405, 166, 0, 'item', '9(19).jpeg', '172', '172', 'Nullam dictum felis eu pede mollis pretium.'),
(406, 167, 0, 'item', '12(22).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(407, 167, 0, 'item', '2(28).jpeg', '276', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(408, 168, 0, 'item', '4(18).jpeg', '276', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(409, 168, 0, 'item', '3(24).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(410, 169, 0, 'item', '11(15).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(411, 169, 0, 'item', '7(14).jpeg', '188', '268', 'Nullam dictum felis eu pede mollis pretium.'),
(412, 170, 0, 'item', '14(6).jpeg', '244', '206', 'Nullam dictum felis eu pede mollis pretium.'),
(413, 170, 0, 'item', '9(20).jpeg', '172', '172', 'Nullam dictum felis eu pede mollis pretium.'),
(414, 171, 0, 'item', '15(12).jpeg', '246', '205', 'Nullam dictum felis eu pede mollis pretium.'),
(415, 171, 0, 'item', '6(20).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(416, 172, 0, 'item', '12(23).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(417, 172, 0, 'item', '6(21).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(418, 173, 0, 'item', '7(15).jpeg', '188', '268', 'Nullam dictum felis eu pede mollis pretium.'),
(419, 173, 0, 'item', '5(24).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(420, 174, 0, 'item', '5(25).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(421, 174, 0, 'item', '15(13).jpeg', '246', '205', 'Nullam dictum felis eu pede mollis pretium.'),
(422, 175, 0, 'item', '11(16).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(423, 175, 0, 'item', '6(22).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(424, 16, 0, 'category', '127.jpeg', '299', '169', ''),
(425, 47, 0, 'sub_category', '128.jpeg', '299', '169', ''),
(426, 48, 0, 'sub_category', '217.jpeg', '237', '212', ''),
(427, 49, 0, 'sub_category', '34.jpeg', '275', '183', ''),
(428, 176, 0, 'item', '2(29).jpeg', '237', '212', 'Nullam dictum felis eu pede mollis pretium.'),
(429, 176, 0, 'item', '1(23).jpeg', '299', '169', 'Nullam dictum felis eu pede mollis pretium.'),
(430, 177, 0, 'item', '4(19).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(431, 177, 0, 'item', '3(25).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(432, 178, 0, 'item', '12(24).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(433, 178, 0, 'item', '7(16).jpeg', '260', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(434, 179, 0, 'item', '14(7).jpeg', '276', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(435, 179, 0, 'item', '8(17).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(436, 180, 0, 'item', '5(26).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(437, 180, 0, 'item', '4(20).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(438, 181, 0, 'item', '5(27).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(439, 181, 0, 'item', '10(11).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(440, 182, 0, 'item', '12(25).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(441, 182, 0, 'item', '4(21).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(442, 183, 0, 'item', '15(14).jpeg', '272', '185', 'Nullam dictum felis eu pede mollis pretium.'),
(443, 183, 0, 'item', '8(18).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(444, 184, 0, 'item', '9(21).jpeg', '259', '194', 'vulputate eget, arcu.'),
(445, 184, 0, 'item', '3(26).jpeg', '275', '183', 'vulputate eget, arcu.'),
(446, 185, 0, 'item', '5(28).jpeg', '275', '183', 'vulputate eget, arcu.'),
(447, 185, 0, 'item', '14(8).jpeg', '276', '183', 'vulputate eget, arcu.'),
(448, 186, 0, 'item', '13(15).jpeg', '260', '194', 'vulputate eget, arcu.'),
(449, 186, 0, 'item', '4(22).jpeg', '259', '194', 'vulputate eget, arcu.'),
(450, 187, 0, 'item', '11(17).jpeg', '274', '184', 'vulputate eget, arcu.'),
(451, 187, 0, 'item', '4(23).jpeg', '259', '194', 'vulputate eget, arcu.'),
(452, 188, 0, 'item', '10(12).jpeg', '259', '194', 'ultricies nisi. Nam eget dui.'),
(453, 188, 0, 'item', '6(23).jpeg', '274', '184', 'ultricies nisi. Nam eget dui.'),
(454, 189, 0, 'item', '13(16).jpeg', '260', '194', 'vulputate eget, arcu.'),
(455, 189, 0, 'item', '5(29).jpeg', '275', '183', 'vulputate eget, arcu.'),
(456, 17, 0, 'category', '218.jpeg', '255', '197', ''),
(457, 50, 0, 'sub_category', '129.jpeg', '225', '225', ''),
(458, 51, 0, 'sub_category', '65.jpeg', '260', '194', ''),
(459, 52, 0, 'sub_category', '130.jpeg', '225', '225', ''),
(460, 190, 0, 'item', '7(17).jpeg', '194', '260', 'Nullam dictum felis eu pede mollis pretium.'),
(461, 190, 0, 'item', '1(24).jpeg', '225', '225', 'Nullam dictum felis eu pede mollis pretium.'),
(462, 191, 0, 'item', '9(22).jpeg', '183', '275', 'Nullam dictum felis eu pede mollis pretium.'),
(463, 191, 0, 'item', '3(27).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(464, 192, 0, 'item', '14(9).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(465, 192, 0, 'item', '8(19).jpeg', '225', '225', 'Nullam dictum felis eu pede mollis pretium.'),
(466, 193, 0, 'item', '16(10).jpeg', '200', '200', 'Nullam dictum felis eu pede mollis pretium.'),
(467, 193, 0, 'item', '11(18).jpeg', '274', '184', 'Nullam dictum felis eu pede mollis pretium.'),
(468, 194, 0, 'item', '18(5).jpeg', '275', '184', 'Nullam dictum felis eu pede mollis pretium.'),
(469, 194, 0, 'item', '20(4).jpeg', '266', '189', 'Nullam dictum felis eu pede mollis pretium.'),
(470, 195, 0, 'item', '8(20).jpeg', '225', '225', 'Nullam dictum felis eu pede mollis pretium.'),
(471, 195, 0, 'item', '4(24).jpeg', '275', '184', 'Nullam dictum felis eu pede mollis pretium.'),
(472, 196, 0, 'item', '25(5).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(473, 196, 0, 'item', '13(17).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(474, 197, 0, 'item', '23(4).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(475, 197, 0, 'item', '6(24).jpeg', '260', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(476, 198, 0, 'item', '19(10).jpeg', '274', '184', 'Nullam dictum felis eu pede mollis pretium.'),
(477, 198, 0, 'item', '5(30).jpeg', '276', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(478, 199, 0, 'item', '15(15).jpeg', '235', '215', 'Nullam dictum felis eu pede mollis pretium.'),
(479, 199, 0, 'item', '4(25).jpeg', '275', '184', 'Nullam dictum felis eu pede mollis pretium.'),
(480, 200, 0, 'item', '3(28).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(481, 200, 0, 'item', '7(18).jpeg', '194', '260', 'Nullam dictum felis eu pede mollis pretium.'),
(482, 201, 0, 'item', '19(11).jpeg', '274', '184', 'Nullam dictum felis eu pede mollis pretium.'),
(483, 201, 0, 'item', '8(21).jpeg', '225', '225', 'Nullam dictum felis eu pede mollis pretium.'),
(484, 202, 0, 'item', '13(18).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(485, 202, 0, 'item', '9(23).jpeg', '183', '275', 'Nullam dictum felis eu pede mollis pretium.'),
(486, 203, 0, 'item', '8(22).jpeg', '225', '225', 'Nullam dictum felis eu pede mollis pretium.'),
(487, 203, 0, 'item', '9(24).jpeg', '183', '275', 'Nullam dictum felis eu pede mollis pretium.'),
(488, 204, 0, 'item', '17(10).jpeg', '251', '167', 'Nullam dictum felis eu pede mollis pretium.'),
(489, 204, 0, 'item', '21(8).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(490, 18, 0, 'category', '219.jpeg', '256', '169', ''),
(491, 53, 0, 'sub_category', '220.jpeg', '256', '169', ''),
(492, 54, 0, 'sub_category', '133.jpeg', '263', '192', ''),
(493, 55, 0, 'sub_category', '73.jpeg', '248', '203', ''),
(494, 205, 0, 'item', '2(30).jpeg', '256', '169', 'Nullam dictum felis eu pede mollis pretium.'),
(495, 205, 0, 'item', '20(5).jpeg', '194', '259', 'Nullam dictum felis eu pede mollis pretium.'),
(496, 206, 0, 'item', '19(12).jpeg', '265', '190', 'Nullam dictum felis eu pede mollis pretium.'),
(497, 206, 0, 'item', '25(6).jpeg', '194', '259', 'Nullam dictum felis eu pede mollis pretium.'),
(498, 207, 0, 'item', '22(7).jpeg', '195', '259', 'Nullam dictum felis eu pede mollis pretium.'),
(499, 207, 0, 'item', '11(19).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium.'),
(500, 208, 0, 'item', '17(11).jpeg', '268', '188', 'Nullam dictum felis eu pede mollis pretium.'),
(501, 208, 0, 'item', '6(25).jpeg', '251', '201', 'Nullam dictum felis eu pede mollis pretium.'),
(502, 209, 0, 'item', '11(20).jpeg', '196', '257', 'Nullam dictum felis eu pede mollis pretium.'),
(503, 210, 0, 'item', '13(19).jpeg', '266', '190', 'Nullam dictum felis eu pede mollis pretium.'),
(504, 210, 0, 'item', '19.jpg', '370', '253', 'Nullam dictum felis eu pede mollis pretium.'),
(505, 211, 0, 'item', '17(12).jpeg', '225', '225', 'Nullam dictum felis eu pede mollis pretium.'),
(506, 211, 0, 'item', '21(9).jpeg', '225', '225', 'Nullam dictum felis eu pede mollis pretium.'),
(507, 212, 0, 'item', '19(1).jpg', '370', '253', 'Nullam dictum felis eu pede mollis pretium.'),
(508, 212, 0, 'item', '20(6).jpeg', '183', '275', 'Nullam dictum felis eu pede mollis pretium.'),
(509, 213, 0, 'item', '20(7).jpeg', '183', '275', 'Nullam dictum felis eu pede mollis pretium.'),
(510, 213, 0, 'item', '10(13).jpeg', '202', '249', 'Nullam dictum felis eu pede mollis pretium.'),
(511, 214, 0, 'item', '7(19).jpeg', '248', '203', 'Nullam dictum felis eu pede mollis pretium.'),
(512, 214, 0, 'item', '13(20).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium.'),
(513, 215, 0, 'item', '21(10).jpeg', '194', '259', 'Nullam dictum felis eu pede mollis pretium.'),
(514, 215, 0, 'item', '26(1).jpeg', '240', '163', 'Nullam dictum felis eu pede mollis pretium.'),
(515, 216, 0, 'item', '12(26).jpeg', '252', '200', 'Nullam dictum felis eu pede mollis pretium.'),
(516, 216, 0, 'item', '7(20).jpeg', '248', '203', 'Nullam dictum felis eu pede mollis pretium.'),
(517, 217, 0, 'item', '16(11).jpeg', '241', '209', 'Nullam dictum felis eu pede mollis pretium.'),
(518, 217, 0, 'item', '25(7).jpeg', '194', '259', 'Nullam dictum felis eu pede mollis pretium.'),
(519, 5, 0, 'shop', 'shop9.jpg', '600', '400', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(520, 19, 0, 'category', '134.jpeg', '258', '195', ''),
(521, 56, 0, 'sub_category', '135.jpeg', '258', '195', ''),
(522, 57, 0, 'sub_category', '221.jpeg', '204', '132', ''),
(523, 58, 0, 'sub_category', '35.jpeg', '277', '182', ''),
(524, 218, 0, 'item', '1(25).jpeg', '258', '195', 'aliquet nec, vulputate eget, arcu.'),
(525, 218, 0, 'item', '2(31).jpeg', '204', '132', 'aliquet nec, vulputate eget, arcu.'),
(526, 219, 0, 'item', '2(32).jpeg', '204', '132', 'aliquet nec, vulputate eget, arcu.'),
(527, 219, 0, 'item', '3(29).jpeg', '277', '182', 'aliquet nec, vulputate eget, arcu.'),
(528, 220, 0, 'item', '4(26).jpeg', '262', '193', ' aliquet nec, vulputate eget, arcu.'),
(529, 220, 0, 'item', '3(30).jpeg', '277', '182', ' aliquet nec, vulputate eget, arcu.'),
(530, 221, 0, 'item', '6(26).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(531, 221, 0, 'item', '5(31).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(532, 222, 0, 'item', '10(14).jpeg', '194', '260', ' aliquet nec, vulputate eget, arcu.'),
(533, 222, 0, 'item', '15(16).jpeg', '183', '275', ' aliquet nec, vulputate eget, arcu.'),
(534, 223, 0, 'item', '15(17).jpeg', '183', '275', 'aliquet nec, vulputate eget, arcu.'),
(535, 223, 0, 'item', '7(21).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(536, 224, 0, 'item', '11(21).jpeg', '183', '275', 'aliquet nec, vulputate eget, arcu.'),
(537, 224, 0, 'item', '6(27).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(538, 225, 0, 'item', '12(27).jpeg', '176', '286', 'aliquet nec, vulputate eget, arcu.'),
(539, 225, 0, 'item', '6(28).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(540, 226, 0, 'item', '9(25).jpeg', '298', '169', 'aliquet nec, vulputate eget, arcu.'),
(541, 226, 0, 'item', '16(12).jpeg', '296', '170', 'aliquet nec, vulputate eget, arcu.'),
(542, 227, 0, 'item', '10(15).jpeg', '194', '260', 'aliquet nec, vulputate eget, arcu.'),
(543, 227, 0, 'item', '4(27).jpeg', '262', '193', 'aliquet nec, vulputate eget, arcu.'),
(544, 228, 0, 'item', '13(21).jpeg', '191', '264', 'aliquet nec, vulputate eget, arcu.'),
(545, 228, 0, 'item', '6(29).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(546, 229, 0, 'item', '11(22).jpeg', '183', '275', ' vulputate eget, arcu.'),
(547, 229, 0, 'item', '13(22).jpeg', '191', '264', ' vulputate eget, arcu.'),
(548, 230, 0, 'item', '9(26).jpeg', '298', '169', 'vulputate eget, arcu.'),
(549, 230, 0, 'item', '5(32).jpeg', '259', '194', 'vulputate eget, arcu.'),
(550, 231, 0, 'item', '7(22).jpeg', '259', '194', 'vulputate eget, arcu.'),
(551, 231, 0, 'item', '14(10).jpeg', '179', '282', 'vulputate eget, arcu.'),
(552, 232, 0, 'item', '15(18).jpeg', '183', '275', 'vulputate eget, arcu.'),
(553, 232, 0, 'item', '6(30).jpeg', '259', '194', 'vulputate eget, arcu.'),
(554, 20, 0, 'category', '136.jpeg', '302', '167', ''),
(555, 59, 0, 'sub_category', '137.jpeg', '302', '167', ''),
(556, 60, 0, 'sub_category', '36.jpeg', '259', '194', ''),
(557, 61, 0, 'sub_category', '43.jpeg', '275', '183', ''),
(558, 233, 0, 'item', '1(26).jpeg', '302', '167', 'aliquet nec, vulputate eget, arcu.'),
(559, 233, 0, 'item', '2(33).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(560, 234, 0, 'item', '11(23).jpeg', '183', '275', 'vulputate eget, arcu.'),
(561, 234, 0, 'item', '5(33).jpeg', '259', '194', 'vulputate eget, arcu.'),
(562, 235, 0, 'item', '12(28).jpeg', '194', '259', 'aliquet nec, vulputate eget, arcu.'),
(563, 235, 0, 'item', '4(28).jpeg', '275', '183', 'aliquet nec, vulputate eget, arcu.'),
(564, 236, 0, 'item', '13(23).jpeg', '183', '275', 'aliquet nec, vulputate eget, arcu.'),
(565, 236, 0, 'item', '5(34).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(566, 237, 0, 'item', '7(23).jpeg', '190', '265', 'aliquet nec, vulputate eget, arcu.'),
(567, 237, 0, 'item', '4(29).jpeg', '275', '183', 'aliquet nec, vulputate eget, arcu.'),
(568, 238, 0, 'item', '9(27).jpeg', '262', '193', 'aliquet nec, vulputate eget, arcu.'),
(569, 238, 0, 'item', '5(35).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(570, 239, 0, 'item', '12(29).jpeg', '194', '259', 'aliquet nec, vulputate eget, arcu.'),
(571, 239, 0, 'item', '5(36).jpeg', '259', '194', 'aliquet nec, vulputate eget, arcu.'),
(572, 240, 0, 'item', '14(11).jpeg', '194', '259', 'vulputate eget, arcu.'),
(573, 240, 0, 'item', '15(19).jpeg', '194', '259', 'vulputate eget, arcu.'),
(574, 241, 0, 'item', '15(20).jpeg', '194', '259', ' vulputate eget, arcu.'),
(575, 241, 0, 'item', '4(30).jpeg', '275', '183', ' vulputate eget, arcu.'),
(576, 242, 0, 'item', '8(23).jpeg', '262', '193', 'vulputate eget, arcu.'),
(577, 242, 0, 'item', '6(31).jpeg', '208', '243', 'vulputate eget, arcu.'),
(578, 243, 0, 'item', '5(37).jpeg', '259', '194', 'vulputate eget, arcu.'),
(579, 243, 0, 'item', '10(16).jpeg', '272', '185', 'vulputate eget, arcu.'),
(580, 244, 0, 'item', '10(17).jpeg', '272', '185', 'vulputate eget, arcu.'),
(581, 244, 0, 'item', '5(38).jpeg', '259', '194', 'vulputate eget, arcu.'),
(582, 245, 0, 'item', '11(24).jpeg', '183', '275', 'vulputate eget, arcu.'),
(583, 245, 0, 'item', '9(28).jpeg', '262', '193', 'vulputate eget, arcu.'),
(584, 246, 0, 'item', '13(24).jpeg', '183', '275', 'vulputate eget, arcu.'),
(585, 246, 0, 'item', '8(24).jpeg', '262', '193', 'vulputate eget, arcu.'),
(586, 247, 0, 'item', '12(30).jpeg', '194', '259', 'vulputate eget, arcu.'),
(587, 247, 0, 'item', '4(31).jpeg', '275', '183', 'vulputate eget, arcu.'),
(588, 6, 0, 'shop', 'shop10.jpg', '600', '400', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(589, 21, 0, 'category', '222.jpeg', '268', '188', ''),
(590, 62, 0, 'sub_category', '138.jpeg', '225', '225', ''),
(591, 63, 0, 'sub_category', '223.jpeg', '268', '188', ''),
(592, 64, 0, 'sub_category', '37.jpeg', '225', '225', ''),
(593, 248, 0, 'item', '9(29).jpeg', '268', '188', 'venenatis vitae, justo.'),
(594, 248, 0, 'item', '13(25).jpeg', '192', '221', 'venenatis vitae, justo.'),
(595, 249, 0, 'item', '11(25).jpeg', '200', '200', 'venenatis vitae, justo.'),
(596, 249, 0, 'item', '16(13).jpeg', '188', '229', 'venenatis vitae, justo.'),
(597, 250, 0, 'item', '14(12).jpeg', '183', '275', ' venenatis vitae, justo.'),
(598, 250, 0, 'item', '12(31).jpeg', '202', '249', ' venenatis vitae, justo.');
INSERT INTO `rt_images` (`id`, `parent_id`, `shop_id`, `type`, `path`, `width`, `height`, `description`) VALUES
(599, 251, 0, 'item', '17(13).jpeg', '183', '275', 'venenatis vitae, justo.'),
(600, 251, 0, 'item', '4(32).jpeg', '250', '201', 'venenatis vitae, justo.'),
(601, 252, 0, 'item', '20(8).jpeg', '274', '184', 'venenatis vitae, justo.'),
(602, 252, 0, 'item', '5(39).jpeg', '275', '183', 'venenatis vitae, justo.'),
(603, 253, 0, 'item', '18(6).jpeg', '225', '225', ' venenatis vitae, justo.'),
(604, 253, 0, 'item', '19(13).jpeg', '265', '190', ' venenatis vitae, justo.'),
(605, 254, 0, 'item', '12(32).jpeg', '252', '200', 'venenatis vitae, justo.'),
(606, 254, 0, 'item', '8(25).jpeg', '282', '160', 'venenatis vitae, justo.'),
(607, 255, 0, 'item', '16(14).jpeg', '241', '209', 'venenatis vitae, justo.'),
(608, 255, 0, 'item', '7(24).jpeg', '248', '203', 'venenatis vitae, justo.'),
(609, 256, 0, 'item', '10(18).jpeg', '160', '160', 'venenatis vitae, justo.'),
(610, 256, 0, 'item', '8(26).jpeg', '282', '160', 'venenatis vitae, justo.'),
(611, 257, 0, 'item', '9(30).jpeg', '260', '194', ' venenatis vitae, justo.'),
(612, 257, 0, 'item', '7(25).jpeg', '248', '203', ' venenatis vitae, justo.'),
(613, 258, 0, 'item', '5(40).jpeg', '225', '225', 'venenatis vitae, justo.'),
(614, 258, 0, 'item', '3(31).jpeg', '200', '252', 'venenatis vitae, justo.'),
(615, 259, 0, 'item', '9(31).jpeg', '193', '261', 'venenatis vitae, justo.'),
(616, 259, 0, 'item', '5(41).jpeg', '225', '225', 'venenatis vitae, justo.'),
(617, 260, 0, 'item', '7(26).jpeg', '194', '260', 'venenatis vitae, justo.'),
(618, 260, 0, 'item', '8(27).jpeg', '183', '275', 'venenatis vitae, justo.'),
(619, 261, 0, 'item', '11(26).jpeg', '275', '183', 'venenatis vitae, justo.'),
(620, 261, 0, 'item', '4(33).jpeg', '275', '183', 'venenatis vitae, justo.'),
(621, 262, 0, 'item', '10(19).jpeg', '199', '253', 'venenatis vitae, justo.'),
(622, 262, 0, 'item', '14(13).jpeg', '293', '172', 'venenatis vitae, justo.'),
(624, 23, 0, 'category', '224.jpeg', '275', '183', ''),
(625, 65, 0, 'sub_category', '38.jpeg', '260', '194', ''),
(626, 66, 0, 'sub_category', '41.jpg', '615', '450', ''),
(627, 67, 0, 'sub_category', '42.jpg', '200', '150', ''),
(628, 263, 0, 'item', '14(14).jpeg', '271', '186', 'venenatis vitae, justo.'),
(629, 263, 0, 'item', '11(27).jpeg', '196', '257', 'venenatis vitae, justo.'),
(630, 264, 0, 'item', '10(20).jpeg', '202', '249', 'venenatis vitae, justo.'),
(631, 264, 0, 'item', '4(3).jpg', '615', '450', 'venenatis vitae, justo.'),
(632, 265, 0, 'item', '16(15).jpeg', '232', '168', 'venenatis vitae, justo.'),
(633, 265, 0, 'item', '12(33).jpeg', '155', '207', 'venenatis vitae, justo.'),
(634, 266, 0, 'item', '15(21).jpeg', '337', '149', 'venenatis vitae, justo.'),
(635, 266, 0, 'item', '8(28).jpeg', '197', '256', 'venenatis vitae, justo.'),
(636, 267, 0, 'item', '17(14).jpeg', '225', '225', 'venenatis vitae, justo.'),
(637, 267, 0, 'item', '7(27).jpeg', '275', '183', 'venenatis vitae, justo.'),
(638, 268, 0, 'item', '8(29).jpeg', '197', '256', 'venenatis vitae, justo.'),
(639, 268, 0, 'item', '7(28).jpeg', '275', '183', 'venenatis vitae, justo.'),
(640, 269, 0, 'item', '18(7).jpeg', '228', '221', 'venenatis vitae, justo.'),
(641, 269, 0, 'item', '8(30).jpeg', '197', '256', 'venenatis vitae, justo.'),
(642, 270, 0, 'item', '12(34).jpeg', '155', '207', 'venenatis vitae, justo.'),
(643, 270, 0, 'item', '5(42).jpeg', '183', '275', 'venenatis vitae, justo.'),
(644, 271, 0, 'item', '9(32).jpeg', '201', '251', 'venenatis vitae, justo.'),
(645, 271, 0, 'item', '18(8).jpeg', '228', '221', 'venenatis vitae, justo.'),
(646, 272, 0, 'item', '12(35).jpeg', '155', '207', 'venenatis vitae, justo.'),
(647, 272, 0, 'item', '11(28).jpeg', '196', '257', 'venenatis vitae, justo.'),
(648, 273, 0, 'item', '5(43).jpeg', '184', '274', 'venenatis vitae, justo.'),
(649, 273, 0, 'item', '3(32).jpeg', '160', '120', 'venenatis vitae, justo.'),
(650, 274, 0, 'item', '8(31).jpeg', '204', '247', 'venenatis vitae, justo.'),
(651, 274, 0, 'item', '6(32).jpeg', '172', '274', 'venenatis vitae, justo.'),
(652, 275, 0, 'item', '6(33).jpeg', '172', '274', 'venenatis vitae, justo.'),
(653, 275, 0, 'item', '7(29).jpeg', '183', '275', 'venenatis vitae, justo.'),
(654, 276, 0, 'item', '13(26).jpeg', '256', '192', 'venenatis vitae, justo.'),
(655, 276, 0, 'item', '5(44).jpeg', '184', '274', 'venenatis vitae, justo.'),
(656, 277, 0, 'item', '19(14).jpeg', '190', '266', 'venenatis vitae, justo.'),
(657, 277, 0, 'item', '8(32).jpeg', '204', '247', 'venenatis vitae, justo.'),
(658, 7, 0, 'shop', 'shop11.jpg', '600', '400', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(659, 24, 0, 'category', '139.jpeg', '259', '194', ''),
(660, 68, 0, 'sub_category', '140.jpeg', '259', '194', ''),
(661, 69, 0, 'sub_category', '225.jpeg', '275', '183', ''),
(662, 70, 0, 'sub_category', '44.jpeg', '247', '204', ''),
(663, 71, 0, 'sub_category', '74.jpeg', '259', '194', ''),
(664, 25, 0, 'category', '226.jpeg', '284', '177', ''),
(665, 72, 0, 'sub_category', '227.jpeg', '284', '177', ''),
(666, 73, 0, 'sub_category', '39.jpeg', '296', '170', ''),
(667, 74, 0, 'sub_category', '66.jpeg', '194', '259', ''),
(668, 278, 0, 'item', '3(33).jpeg', '259', '194', 'venenatis vitae, justo. '),
(669, 278, 0, 'item', '6(34).jpeg', '284', '178', 'venenatis vitae, justo. '),
(670, 279, 0, 'item', '7(30).jpeg', '259', '194', 'venenatis vitae, justo. '),
(671, 279, 0, 'item', '6(35).jpeg', '284', '178', 'venenatis vitae, justo. '),
(674, 281, 0, 'item', '4(34).jpeg', '247', '204', 'venenatis vitae, justo. '),
(675, 281, 0, 'item', '12(36).jpeg', '237', '213', 'venenatis vitae, justo. '),
(676, 282, 0, 'item', '16(16).jpeg', '276', '183', 'venenatis vitae, justo. '),
(677, 282, 0, 'item', '14(15).jpeg', '189', '266', 'venenatis vitae, justo. '),
(678, 283, 0, 'item', '15(22).jpeg', '184', '273', 'venenatis vitae, justo. '),
(679, 283, 0, 'item', '9(33).jpeg', '243', '208', 'venenatis vitae, justo. '),
(680, 284, 0, 'item', '12(37).jpeg', '237', '213', 'venenatis vitae, justo. '),
(681, 284, 0, 'item', '5(45).jpeg', '259', '194', 'venenatis vitae, justo. '),
(682, 285, 0, 'item', '10(21).jpeg', '300', '168', ' venenatis vitae, justo. '),
(683, 285, 0, 'item', '3(34).jpeg', '259', '194', ' venenatis vitae, justo. '),
(684, 286, 0, 'item', '13(27).jpeg', '259', '194', 'venenatis vitae, justo. '),
(685, 286, 0, 'item', '16(17).jpeg', '276', '183', 'venenatis vitae, justo. '),
(686, 287, 0, 'item', '17(15).jpeg', '259', '194', 'venenatis vitae, justo. '),
(687, 287, 0, 'item', '6(36).jpeg', '284', '178', 'venenatis vitae, justo. '),
(688, 288, 0, 'item', '14(16).jpeg', '189', '266', 'venenatis vitae, justo. '),
(689, 288, 0, 'item', '9(34).jpeg', '243', '208', 'venenatis vitae, justo. '),
(690, 289, 0, 'item', '15(23).jpeg', '184', '273', 'venenatis vitae, justo. '),
(691, 289, 0, 'item', '7(31).jpeg', '259', '194', 'venenatis vitae, justo. '),
(692, 290, 0, 'item', '8(33).jpeg', '259', '194', 'venenatis vitae, justo. '),
(693, 290, 0, 'item', '13(28).jpeg', '259', '194', 'venenatis vitae, justo. '),
(694, 291, 0, 'item', '10(22).jpeg', '300', '168', 'venenatis vitae, justo. '),
(695, 291, 0, 'item', '7(32).jpeg', '259', '194', 'venenatis vitae, justo. '),
(696, 292, 0, 'item', '16(18).jpeg', '276', '183', 'venenatis vitae, justo. '),
(697, 292, 0, 'item', '11(29).jpeg', '321', '157', 'venenatis vitae, justo. '),
(698, 293, 0, 'item', '17(16).jpeg', '259', '194', 'venenatis vitae, justo. '),
(699, 293, 0, 'item', '18(9).jpeg', '259', '194', 'venenatis vitae, justo. '),
(700, 294, 0, 'item', '17(17).jpeg', '259', '194', 'venenatis vitae, justo. '),
(701, 294, 0, 'item', '7(33).jpeg', '259', '194', 'venenatis vitae, justo. '),
(702, 295, 0, 'item', '12(38).jpeg', '237', '213', 'venenatis vitae, justo. '),
(703, 295, 0, 'item', '6(37).jpeg', '284', '178', 'venenatis vitae, justo. '),
(704, 296, 0, 'item', '6(38).jpeg', '284', '178', 'enenatis vitae, justo. '),
(705, 296, 0, 'item', '2(34).jpeg', '275', '183', 'enenatis vitae, justo. '),
(706, 297, 0, 'item', '2(35).jpeg', '284', '177', ' venenatis vitae, justo. '),
(707, 297, 0, 'item', '1(27).jpeg', '273', '185', ' venenatis vitae, justo. '),
(708, 298, 0, 'item', '12(39).jpeg', '259', '194', 'venenatis vitae, justo. '),
(709, 298, 0, 'item', '6(39).jpeg', '194', '259', 'venenatis vitae, justo. '),
(710, 299, 0, 'item', '7(34).jpeg', '185', '273', 'venenatis vitae, justo. '),
(711, 299, 0, 'item', '4(35).jpeg', '247', '204', 'venenatis vitae, justo. '),
(712, 300, 0, 'item', '15(24).jpeg', '259', '194', 'venenatis vitae, justo. '),
(713, 300, 0, 'item', '2(36).jpeg', '284', '177', 'venenatis vitae, justo. '),
(714, 301, 0, 'item', '9(35).jpeg', '221', '228', 'venenatis vitae, justo. '),
(715, 301, 0, 'item', '3(35).jpeg', '296', '170', 'venenatis vitae, justo. '),
(716, 302, 0, 'item', '7(35).jpeg', '185', '273', 'venenatis vitae, justo. '),
(717, 302, 0, 'item', '4(36).jpeg', '247', '204', 'venenatis vitae, justo. '),
(718, 303, 0, 'item', '12(40).jpeg', '259', '194', ' venenatis vitae, justo. '),
(719, 303, 0, 'item', '2(37).jpeg', '284', '177', ' venenatis vitae, justo. '),
(720, 304, 0, 'item', '16(19).jpeg', '259', '194', ' venenatis vitae, justo. '),
(721, 304, 0, 'item', '9(36).jpeg', '221', '228', ' venenatis vitae, justo. '),
(722, 305, 0, 'item', '10(23).jpeg', '259', '194', 'venenatis vitae, justo. '),
(723, 305, 0, 'item', '4(37).jpeg', '247', '204', 'venenatis vitae, justo. '),
(724, 306, 0, 'item', '12(41).jpeg', '259', '194', 'venenatis vitae, justo. '),
(725, 306, 0, 'item', '5(46).jpeg', '225', '225', 'venenatis vitae, justo. '),
(726, 307, 0, 'item', '14(17).jpeg', '297', '170', 'venenatis vitae, justo. '),
(727, 307, 0, 'item', '4(38).jpeg', '247', '204', 'venenatis vitae, justo. '),
(728, 308, 0, 'item', '8(34).jpeg', '275', '183', 'venenatis vitae, justo. '),
(729, 308, 0, 'item', '2(38).jpeg', '284', '177', 'venenatis vitae, justo. '),
(730, 309, 0, 'item', '11(30).jpeg', '300', '168', 'venenatis vitae, justo. '),
(731, 309, 0, 'item', '5(47).jpeg', '225', '225', 'venenatis vitae, justo. '),
(732, 8, 0, 'shop', 'shop16.jpg', '600', '400', 'imperdiet a, venenatis vitae, justo.'),
(733, 26, 0, 'category', '142.jpeg', '278', '181', ''),
(734, 27, 0, 'category', '43.jpg', '615', '450', ''),
(735, 75, 0, 'sub_category', '143.jpeg', '278', '181', ''),
(736, 76, 0, 'sub_category', '228.jpeg', '272', '185', ''),
(737, 77, 0, 'sub_category', '310.jpeg', '263', '191', ''),
(738, 310, 0, 'item', '1(28).jpeg', '278', '181', 'venenatis vitae, justo.'),
(739, 310, 0, 'item', '2(39).jpeg', '272', '185', 'venenatis vitae, justo.'),
(740, 311, 0, 'item', '2(40).jpeg', '272', '185', 'venenatis vitae, justo.'),
(741, 311, 0, 'item', '1(29).jpeg', '278', '181', 'venenatis vitae, justo.'),
(742, 312, 0, 'item', '3(36).jpeg', '263', '191', 'venenatis vitae, justo.'),
(743, 312, 0, 'item', '9(37).jpeg', '274', '184', 'venenatis vitae, justo.'),
(744, 313, 0, 'item', '13(29).jpeg', '222', '227', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(745, 313, 0, 'item', '15(25).jpeg', '301', '167', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(746, 314, 0, 'item', '16(20).jpeg', '187', '269', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(747, 314, 0, 'item', '12(42).jpeg', '284', '177', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(748, 315, 0, 'item', '11(31).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(749, 315, 0, 'item', '7(36).jpeg', '312', '162', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(750, 316, 0, 'item', '12(43).jpeg', '284', '177', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(751, 316, 0, 'item', '5(48).jpeg', '247', '204', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(752, 317, 0, 'item', '10(24).jpeg', '284', '177', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(753, 317, 0, 'item', '6(40).jpeg', '258', '196', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(754, 318, 0, 'item', '7(37).jpeg', '312', '162', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(755, 318, 0, 'item', '12(44).jpeg', '284', '177', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(756, 319, 0, 'item', '10(25).jpeg', '284', '177', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(757, 319, 0, 'item', '14(18).jpeg', '264', '191', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(758, 320, 0, 'item', '16(21).jpeg', '187', '269', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(759, 320, 0, 'item', '10(26).jpeg', '284', '177', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(760, 321, 0, 'item', '8(35).jpeg', '259', '194', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(761, 321, 0, 'item', '5(49).jpeg', '247', '204', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(764, 323, 0, 'item', '14(19).jpeg', '264', '191', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(765, 323, 0, 'item', '9(38).jpeg', '274', '184', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(766, 324, 0, 'item', '7(38).jpeg', '312', '162', 'n enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(767, 324, 0, 'item', '14(20).jpeg', '264', '191', 'n enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(768, 78, 0, 'sub_category', '1210.jpeg', '155', '207', ''),
(769, 79, 0, 'sub_category', '161.jpeg', '232', '168', ''),
(770, 80, 0, 'sub_category', '311.jpeg', '260', '194', ''),
(771, 325, 0, 'item', '16(22).jpeg', '232', '168', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(772, 325, 0, 'item', '7(39).jpeg', '275', '183', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(773, 326, 0, 'item', '17(18).jpeg', '225', '225', ' In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(774, 326, 0, 'item', '8(36).jpeg', '197', '256', ' In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(777, 328, 0, 'item', '10(27).jpeg', '202', '249', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(778, 328, 0, 'item', '19(2).jpg', '370', '253', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(779, 329, 0, 'item', '22(8).jpeg', '195', '258', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(780, 329, 0, 'item', '14(21).jpeg', '271', '186', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(781, 330, 0, 'item', '18(10).jpeg', '228', '221', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(782, 330, 0, 'item', '4(4).jpg', '615', '450', 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(783, 331, 0, 'item', '11(32).jpeg', '196', '257', 'rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(784, 331, 0, 'item', '15(26).jpeg', '337', '149', 'rhoncus ut, imperdiet a, venenatis vitae, justo.'),
(785, 332, 0, 'item', '14(22).jpeg', '271', '186', 'vulputate eget, arcu.'),
(786, 332, 0, 'item', '10(28).jpeg', '202', '249', 'vulputate eget, arcu.'),
(787, 333, 0, 'item', '20(9).jpeg', '183', '275', 'aliquet nec, vulputate eget, arcu.'),
(788, 333, 0, 'item', '8(37).jpeg', '197', '256', 'aliquet nec, vulputate eget, arcu.'),
(789, 334, 0, 'item', '10(29).jpeg', '202', '249', 'aliquet nec, vulputate eget, arcu.'),
(790, 334, 0, 'item', '19(3).jpg', '370', '253', 'aliquet nec, vulputate eget, arcu.'),
(791, 335, 0, 'item', '9(39).jpeg', '201', '251', 'vulputate eget, arcu.'),
(792, 335, 0, 'item', '19(4).jpg', '370', '253', 'vulputate eget, arcu.'),
(793, 336, 0, 'item', '5(50).jpeg', '183', '275', 'aliquet nec, vulputate eget, arcu.'),
(794, 336, 0, 'item', '3(37).jpeg', '260', '194', 'aliquet nec, vulputate eget, arcu.'),
(795, 337, 0, 'item', '20(10).jpeg', '183', '275', 'vulputate eget, arcu.'),
(796, 337, 0, 'item', '21(11).jpeg', '225', '225', 'vulputate eget, arcu.'),
(797, 338, 0, 'item', '16(23).jpeg', '232', '168', 'vulputate eget, arcu.'),
(798, 338, 0, 'item', '8(38).jpeg', '197', '256', 'vulputate eget, arcu.'),
(799, 339, 0, 'item', '7(40).jpeg', '275', '183', ' vulputate eget, arcu.'),
(800, 339, 0, 'item', '14(23).jpeg', '271', '186', ' vulputate eget, arcu.'),
(801, 340, 0, 'item', '13(30).jpeg', '266', '190', 'vulputate eget, arcu.'),
(802, 340, 0, 'item', '4(5).jpg', '615', '450', 'vulputate eget, arcu.'),
(803, 9, 0, 'shop', 'shop3.png', '600', '400', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(804, 28, 0, 'category', '1a-tn.jpg', '300', '277', ''),
(805, 81, 0, 'sub_category', '1a-tn1.jpg', '300', '277', ''),
(806, 82, 0, 'sub_category', '1a-tn2.jpg', '300', '277', ''),
(807, 83, 0, 'sub_category', '1a-tn3.jpg', '300', '277', ''),
(808, 341, 0, 'item', '1a-tn(1).jpg', '300', '277', '  Cras dapibus. Vivamus elementum semper nisi.'),
(809, 341, 0, 'item', '3a-tn.jpg', '300', '284', '  Cras dapibus. Vivamus elementum semper nisi.'),
(810, 342, 0, 'item', '4a-tn.jpg', '300', '279', 'Cras dapibus. Vivamus elementum semper nisi.'),
(811, 342, 0, 'item', '3a-tn(4).jpg', '300', '284', 'Cras dapibus. Vivamus elementum semper nisi.'),
(812, 343, 0, 'item', '75.jpg', '300', '237', 'Cras dapibus. Vivamus elementum semper nisi.'),
(813, 343, 0, 'item', '4a-tn(1).jpg', '300', '279', 'Cras dapibus. Vivamus elementum semper nisi.'),
(814, 344, 0, 'item', '5a-tn.jpg', '300', '270', 'Cras dapibus. Vivamus elementum semper nisi.'),
(815, 344, 0, 'item', '1a-tn(2).jpg', '300', '277', 'Cras dapibus. Vivamus elementum semper nisi.'),
(816, 345, 0, 'item', '1a-tn(3).jpg', '300', '277', 'Cras dapibus. Vivamus elementum semper nisi.'),
(817, 346, 0, 'item', '3a-tn(5).jpg', '300', '284', 'Cras dapibus. Vivamus elementum semper nisi.'),
(818, 347, 0, 'item', '4a-tn(2).jpg', '300', '279', 'Cras dapibus. Vivamus elementum semper nisi.'),
(819, 348, 0, 'item', '75(1).jpg', '300', '237', 'Cras dapibus. Vivamus elementum semper nisi.'),
(820, 349, 0, 'item', '75(2).jpg', '300', '237', 'Cras dapibus. Vivamus elementum semper nisi.'),
(821, 350, 0, 'item', '5a-tn(1).jpg', '300', '270', 'Cras dapibus. Vivamus elementum semper nisi.'),
(822, 351, 0, 'item', '3a-tn(6).jpg', '300', '284', 'Cras dapibus. Vivamus elementum semper nisi.'),
(823, 352, 0, 'item', '75(3).jpg', '300', '237', 'Cras dapibus. Vivamus elementum semper nisi.'),
(824, 29, 0, 'category', '60a-f.jpg', '300', '237', ''),
(825, 84, 0, 'sub_category', '60a-f1.jpg', '300', '237', ''),
(826, 85, 0, 'sub_category', '57a-tn.jpg', '300', '224', ''),
(827, 86, 0, 'sub_category', 'Dong_Po_Pork.jpg', '213', '159', ''),
(828, 353, 0, 'item', 'DSC_8285-f.jpg', '301', '173', 'Cras dapibus. Vivamus elementum semper nisi.'),
(829, 354, 0, 'item', 'P1150152-f.jpg', '300', '203', 'Cras dapibus. Vivamus elementum semper nisi.'),
(830, 355, 0, 'item', 'P1150060-f.jpg', '300', '214', 'Cras dapibus. Vivamus elementum semper nisi.'),
(831, 356, 0, 'item', '59a-f.jpg', '300', '250', 'Nullam dictum felis eu pede mollis pretium. '),
(832, 357, 0, 'item', '90a-tn.jpg', '300', '205', 'Nullam dictum felis eu pede mollis pretium. '),
(833, 358, 0, 'item', 'c.jpg', '300', '230', 'Nullam dictum felis eu pede mollis pretium. '),
(834, 359, 0, 'item', 'P1150064-f.jpg', '300', '212', 'Nullam dictum felis eu pede mollis pretium. '),
(835, 360, 0, 'item', '60a-f(1).jpg', '300', '237', 'Nullam dictum felis eu pede mollis pretium. '),
(836, 361, 0, 'item', 'P1150638-f.jpg', '300', '229', 'Nullam dictum felis eu pede mollis pretium. '),
(837, 362, 0, 'item', 'c(1).jpg', '300', '230', 'Nullam dictum felis eu pede mollis pretium. '),
(838, 363, 0, 'item', '91a-tn.jpg', '300', '208', 'Nullam dictum felis eu pede mollis pretium. '),
(839, 364, 0, 'item', 'DongPoPork.jpg', '213', '159', 'Nullam dictum felis eu pede mollis pretium. '),
(840, 365, 0, 'item', '60a-f(2).jpg', '300', '237', 'Nullam dictum felis eu pede mollis pretium. '),
(841, 366, 0, 'item', 'P1150638-f(1).jpg', '300', '229', 'Nullam dictum felis eu pede mollis pretium. '),
(844, 2, 0, 'feed', '3(39).jpeg', '275', '183', 'Lorem ipsum dolor sit amet'),
(845, 2, 0, 'feed', '4(39).jpeg', '273', '185', 'Lorem ipsum dolor sit amet'),
(846, 3, 0, 'feed', '5(51).jpeg', '259', '194', 'Lorem ipsum dolor sit amet'),
(847, 3, 0, 'feed', '15(27).jpeg', '275', '183', 'Lorem ipsum dolor sit amet'),
(848, 4, 0, 'feed', '1(30).jpeg', '225', '225', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(849, 4, 0, 'feed', '3(40).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(850, 5, 0, 'feed', '1(31).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium. Integer tincidunt. '),
(851, 5, 0, 'feed', '3(41).jpeg', '259', '194', 'Nullam dictum felis eu pede mollis pretium. Integer tincidunt. '),
(852, 5, 0, 'feed', '2(42).jpeg', '275', '183', 'Nullam dictum felis eu pede mollis pretium. Integer tincidunt. '),
(853, 6, 0, 'feed', '2(43).jpeg', '275', '183', 'Nam eget dui.'),
(854, 6, 0, 'feed', '5(52).jpeg', '259', '194', 'Nam eget dui.'),
(855, 7, 0, 'feed', '17(19).jpeg', '259', '194', 'Nam eget dui.'),
(856, 7, 0, 'feed', '18(11).jpeg', '275', '183', 'Nam eget dui.'),
(857, 8, 0, 'feed', '12(45).jpeg', '275', '183', ' Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(858, 8, 0, 'feed', '13(31).jpeg', '269', '188', ' Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(859, 9, 0, 'feed', '15(28).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(860, 9, 0, 'feed', '23(5).jpeg', '240', '160', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(861, 10, 0, 'feed', '6(41).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(862, 10, 0, 'feed', '12(46).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(863, 11, 0, 'feed', '17(20).jpeg', '183', '275', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(864, 11, 0, 'feed', '9(40).jpeg', '259', '195', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(865, 12, 0, 'feed', '1(32).jpeg', '278', '181', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(866, 12, 0, 'feed', '2(44).jpeg', '272', '185', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(867, 13, 0, 'feed', '12(47).jpeg', '284', '177', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(868, 13, 0, 'feed', '15(29).jpeg', '301', '167', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(869, 14, 0, 'feed', '4(40).jpeg', '246', '205', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(870, 14, 0, 'feed', '9(41).jpeg', '284', '177', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(871, 15, 0, 'feed', '5(53).jpeg', '183', '275', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(872, 15, 0, 'feed', '2(45).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(873, 16, 0, 'feed', '10(30).jpeg', '265', '190', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(874, 16, 0, 'feed', '15(30).jpeg', '225', '225', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(875, 17, 0, 'feed', '16(24).jpeg', '213', '236', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(876, 17, 0, 'feed', '6(42).jpeg', '267', '189', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(877, 18, 0, 'feed', '18(12).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(878, 18, 0, 'feed', '17(21).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(879, 19, 0, 'feed', '12(48).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(880, 19, 0, 'feed', '11(33).jpeg', '275', '184', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(881, 20, 0, 'feed', '8(39).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(882, 20, 0, 'feed', '19(15).jpeg', '200', '200', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(883, 21, 0, 'feed', '6(43).jpeg', '263', '192', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(884, 21, 0, 'feed', '11(34).jpeg', '272', '186', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(885, 22, 0, 'feed', '4(41).jpeg', '275', '183', ' Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(886, 22, 0, 'feed', '10(31).jpeg', '284', '177', ' Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(887, 23, 0, 'feed', '8(40).jpeg', '225', '225', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(888, 23, 0, 'feed', '2(46).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(889, 24, 0, 'feed', '22(9).jpeg', '276', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(890, 24, 0, 'feed', '15(31).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(891, 25, 0, 'feed', '5(54).jpeg', '247', '204', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(892, 25, 0, 'feed', '3(42).jpeg', '263', '191', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(893, 26, 0, 'feed', '10(32).jpeg', '225', '225', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(894, 26, 0, 'feed', '3(43).jpeg', '260', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(895, 27, 0, 'feed', '6(44).jpeg', '160', '239', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(896, 27, 0, 'feed', '11(35).jpeg', '160', '200', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(897, 28, 0, 'feed', '5(55).jpeg', '275', '183', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(898, 28, 0, 'feed', '15(32).jpeg', '272', '185', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(899, 29, 0, 'feed', '6(45).jpeg', '259', '195', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(900, 29, 0, 'feed', '7(41).jpeg', '300', '168', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(901, 30, 0, 'feed', '12(49).jpeg', '209', '241', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(902, 30, 0, 'feed', '22(10).jpeg', '295', '171', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(903, 31, 0, 'feed', '9(42).jpeg', '259', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(904, 31, 0, 'feed', '16(25).jpeg', '260', '194', 'Curabitur ullamcorper ultricies nisi. Nam eget dui.'),
(905, 10, 0, 'shop', 'cat_img2.png', '600', '400', 'No-1, Town Hall Road, Singapore'),
(906, 367, 0, 'item', '1(33).jpeg', '275', '183', 'condimentum lobortis.'),
(907, 367, 0, 'item', '2(47).jpeg', '192', '128', 'condimentum lobortis.'),
(908, 368, 0, 'item', '4(42).jpeg', '275', '183', 'condimentum lobortis.'),
(909, 368, 0, 'item', '6(46).jpeg', '192', '128', 'condimentum lobortis.'),
(910, 369, 0, 'item', '12(50).jpeg', '188', '152', 'condimentum lobortis.'),
(911, 369, 0, 'item', '19(16).jpeg', '194', '260', 'condimentum lobortis.'),
(912, 370, 0, 'item', '17(22).jpeg', '277', '182', 'condimentum lobortis.'),
(913, 370, 0, 'item', '19(17).jpeg', '194', '260', 'condimentum lobortis.'),
(923, 1, 0, 'branding', 'DefaultIcon-ios.png', '1024', '1024', ''),
(924, 1, 0, 'category', '1.png', '607', '606', ''),
(925, 2, 0, 'category', '2.png', '160', '160', ''),
(926, 4, 0, 'category', '3.png', '607', '606', ''),
(927, 5, 0, 'category', '4.png', '607', '606', ''),
(928, 6, 0, 'category', '6.png', '607', '540', ''),
(929, 1, 0, 'feed', 'coupon.png', '568', '485', ''),
(930, 30, 0, 'category', '01505114062.png', '100', '80', ''),
(931, 31, 0, 'category', '01505114534.png', '100', '80', ''),
(932, 32, 0, 'category', '01505145268.png', '100', '80', ''),
(933, 33, 0, 'category', '01505145313.png', '100', '80', ''),
(934, 34, 0, 'category', 'tixhr1057974102.png', '100', '80', ''),
(937, 35, 0, 'category', 'IMG_00081.JPG', '4272', '2848', '');

-- --------------------------------------------------------

--
-- Table structure for table `rt_inquiries`
--

CREATE TABLE `rt_inquiries` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_inquiries`
--

INSERT INTO `rt_inquiries` (`id`, `item_id`, `shop_id`, `name`, `email`, `message`, `status`, `added`, `updated`) VALUES
(1, 2, 1, 'Jack', 'jack@hotmail.com', 'I want to order this sushi as 1000. It is ok?', 1, '2015-05-09 18:04:07', NULL),
(2, 9, 1, 'Mike', 'mike@yahoo.com', 'Can delivery to my city?', 1, '2015-05-09 18:04:42', NULL),
(3, 65, 1, 'Hellen', 'hellen@gmail.com', 'Can I get discount because I am student?', 1, '2015-05-09 18:05:27', NULL),
(4, 54, 1, 'John', 'john@gmail.com', 'Is it too sweet or not?', 1, '2015-05-09 18:13:07', NULL),
(5, 58, 1, 'Bery', 'bery@gmail.com', 'How is shipping cost?', 1, '2015-05-09 18:14:04', NULL),
(6, 75, 2, 'Joe', 'joe@gmail.com', 'got any discount?', 1, '2015-05-14 17:51:27', NULL),
(7, 76, 2, 'Jack', 'jack@gmail.com', 'got promotion for this BBQ?', 1, '2015-05-14 17:51:52', NULL),
(8, 77, 2, 'Rob', 'rob@gmail.com', 'Look nice how about delivery?', 1, '2015-05-14 17:52:25', NULL),
(9, 81, 2, 'Nick', 'nicky@gmail.com', 'How about shipping?', 1, '2015-05-14 17:53:00', NULL),
(10, 124, 3, 'jade', 'jade@gmail.com', 'can i get discount?', 1, '2015-05-14 18:47:56', NULL),
(11, 125, 3, 'Jack', 'jack@gmail.com', 'how is delivery?', 1, '2015-05-14 18:48:23', NULL),
(12, 138, 3, 'pack', 'pack@gmail.com', 'look nice! how is discount if order many?', 1, '2015-05-14 18:49:02', NULL),
(13, 137, 3, 'Robbe', 'rob@gmail.com', 'is it spicy?', 1, '2015-05-14 18:49:47', NULL),
(14, 163, 4, 'yigh', 'utik@gmail.com', 'how is shipping?', 1, '2015-05-14 18:54:51', NULL),
(15, 164, 4, 'marry', 'marry@gmail.com', 'how about delivery?', 1, '2015-05-14 18:55:19', NULL),
(16, 168, 4, 'gomez', 'gomez@gmail.com', 'Can I order 100 dish?', 1, '2015-05-14 18:55:54', NULL),
(17, 196, 4, 'Mike', 'mike@gmail.com', 'able to delivery my town?', 1, '2015-05-14 18:56:37', NULL),
(18, 218, 5, 'mike', 'mike@gmail.com', 'how about shipping to my office?', 1, '2015-05-14 19:01:00', NULL),
(19, 219, 5, 'roger', 'roger@gmail.com', 'is it too hot?', 1, '2015-05-14 19:01:32', NULL),
(20, 234, 5, 'nicky', 'nicky@gmail.com', 'how is shipping cost?', 1, '2015-05-14 19:02:06', NULL),
(21, 233, 5, 'green', 'green@gmail.com', 'how about delivery?', 1, '2015-05-14 19:02:32', NULL),
(22, 264, 6, 'jade', 'jade@gmail.com', 'is it too sweet?', 1, '2015-05-14 19:06:10', NULL),
(23, 263, 6, 'robert', 'rob@gmail.com', 'can i order as 100?', 1, '2015-05-14 19:06:38', NULL),
(24, 249, 6, 'jole', 'jole@gmail.com', 'look nice. able to delivery?', 1, '2015-05-14 19:07:12', NULL),
(25, 250, 6, 'han', 'han@gmail.com', 'how about shipping?', 1, '2015-05-14 19:07:37', NULL),
(26, 248, 6, 'john', 'john@gmail.com', 'how about shipping?', 1, '2015-05-14 19:12:18', NULL),
(27, 281, 7, 'john', 'john@gmail.com', 'how about shipping?', 1, '2015-05-14 19:13:10', NULL),
(28, 281, 7, 'green', 'green@gmail.com', 'how is your delivery service?', 1, '2015-05-14 19:13:51', NULL),
(29, 297, 7, 'marry', 'marry@gmail.com', 'is it spicy?', 1, '2015-05-14 19:14:24', NULL),
(30, 297, 7, 'mike', 'mike@gmail.com', 'got discount if order as 100 dish', 1, '2015-05-14 19:14:57', NULL),
(31, 310, 8, 'jac', 'kac@gmail.com', 'how about shipping?', 1, '2015-05-14 19:22:08', NULL),
(32, 310, 8, 'robert', 'robert@gmail.com', 'how about delivery service?', 1, '2015-05-14 19:22:41', NULL),
(33, 325, 8, 'yamato', 'yamato@gmail.com', 'is it too sweet?', 1, '2015-05-14 19:23:26', NULL),
(34, 326, 8, 'sky', 'sky@gmail.com', 'how many percent for sugar?', 1, '2015-05-14 19:24:09', NULL),
(35, 341, 9, 'june', 'june@gmail.com', 'what is inside?', 1, '2015-05-14 19:30:50', NULL),
(36, 341, 9, 'moze', 'moze@gmail.com', 'it is spicy?', 1, '2015-05-14 19:31:21', NULL),
(37, 354, 9, 'ronal', 'ronal@gmail.com', 'how is shipping cost?', 1, '2015-05-14 19:32:02', NULL),
(38, 353, 9, 'rofol', 'rofol@gmail.com', 'can delivery to my town', 1, '2015-05-14 19:32:38', NULL),
(39, 1, 1, 'dgjjh', 'wetu', 'sfhgrrghv', 1, '2015-07-22 07:39:29', NULL),
(40, 1, 1, 'sfhj', 'wryh', 'dhkk', 1, '2015-07-22 07:44:25', NULL),
(41, 1, 1, 'sgjkk', 'qeryufhh', 'sfhjdhjijhhgcvv', 1, '2015-07-22 07:47:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_items`
--

CREATE TABLE `rt_items` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `discount_type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `unit_price` float NOT NULL,
  `search_tag` text NOT NULL,
  `is_published` int(11) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_items`
--

INSERT INTO `rt_items` (`id`, `cat_id`, `sub_cat_id`, `shop_id`, `discount_type_id`, `name`, `description`, `unit_price`, `search_tag`, `is_published`, `added`, `updated`) VALUES
(1, 1, 1, 1, 0, 'Sushi Rolls 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus.', 10, 'sushi, roll', 1, '2015-04-25 17:58:44', NULL),
(2, 1, 1, 1, 0, 'Sushi Rolls 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus.', 13, 'sushi, roll', 1, '2015-04-25 18:00:18', NULL),
(3, 1, 1, 1, 0, 'Sushi Rolls 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 12, 'sushi, roll', 1, '2015-04-25 18:01:58', NULL),
(4, 1, 1, 1, 0, 'Sushi Rolls 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 15, 'sushi, roll', 1, '2015-04-25 18:03:01', NULL),
(5, 1, 1, 1, 0, 'Sushi Rolls 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 14, 'sushi, roll', 1, '2015-04-25 18:04:02', NULL),
(6, 1, 1, 1, 0, 'Sushi Rolls 6  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 16, 'sushi, roll', 1, '2015-04-25 18:04:52', NULL),
(7, 1, 1, 1, 0, 'Sushi Rolls 7  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 17, 'sushi, roll', 1, '2015-04-25 18:06:03', NULL),
(8, 1, 2, 1, 0, 'Sushi  Nigiri 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 5, 'sushi, nigiri', 1, '2015-04-25 18:08:23', NULL),
(9, 1, 2, 1, 0, 'Sushi  Nigiri 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 6, 'sushi, nigiri', 1, '2015-04-25 18:09:15', NULL),
(10, 1, 2, 1, 0, 'Sushi  Nigiri 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 6, 'sushi, nigiri', 1, '2015-04-25 18:10:16', NULL),
(11, 1, 2, 1, 0, 'Sushi  Nigiri 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 7, 'sushi, nigiri', 1, '2015-04-25 18:10:55', NULL),
(12, 1, 2, 1, 0, 'Sushi  Nigiri 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 8, 'sushi, nigiri', 1, '2015-04-25 18:11:49', NULL),
(13, 1, 2, 1, 0, 'Sushi  Nigiri 6  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 8, 'sushi, nigiri', 1, '2015-04-25 18:12:39', NULL),
(14, 1, 3, 1, 0, 'Sushi Home 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 7, 'sushi, home, special1', 1, '2015-04-25 18:14:10', NULL),
(15, 1, 3, 1, 0, 'Sushi Home 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 8, 'sushi, home, special1', 1, '2015-04-25 18:15:44', NULL),
(16, 1, 3, 1, 0, 'Sushi Home 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 9, 'sushi, home, special1', 1, '2015-04-25 18:16:36', NULL),
(17, 1, 4, 1, 0, 'Sushi Special 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 21, 'sushi, home, special2', 1, '2015-04-25 18:17:37', NULL),
(18, 1, 4, 1, 0, 'Sushi Special 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 22, 'sushi, home, special2', 1, '2015-04-25 18:18:19', NULL),
(19, 1, 4, 1, 0, 'Sushi Special 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 23, 'sushi, home, special2', 1, '2015-04-25 18:18:55', NULL),
(20, 1, 4, 1, 0, 'Sushi Special 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 24, 'sushi, home, special2', 1, '2015-04-25 18:19:43', NULL),
(21, 1, 4, 1, 0, 'Sushi Special 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 25, 'sushi, home, special2', 1, '2015-04-25 18:20:26', NULL),
(22, 2, 5, 1, 0, 'Chicken Noddle 1  ', 'Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 5, 'chicken, noddle', 1, '2015-04-25 18:25:28', NULL),
(23, 2, 5, 1, 0, 'Chicken Noddle 2  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 5, 'chicken, noddle', 1, '2015-04-25 18:26:34', NULL),
(24, 2, 5, 1, 0, 'Chicken Noddle 3  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 5, 'chicken, noddle', 1, '2015-04-25 18:27:21', NULL),
(25, 2, 5, 1, 0, 'Chicken Noddle 4  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 5, 'chicken, noddle', 1, '2015-04-25 18:28:06', NULL),
(26, 2, 5, 1, 0, 'Chicken Noddle 5  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 5, 'chicken, noddle', 1, '2015-04-25 18:28:49', NULL),
(27, 2, 6, 1, 0, 'Pork Noddle 1  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 6, 'pork, noddle', 1, '2015-04-25 18:30:14', NULL),
(28, 2, 6, 1, 0, 'Pork Noddle 2  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 6, 'pork, noddle', 1, '2015-04-25 18:31:08', NULL),
(29, 2, 6, 1, 0, 'Pork Noddle 3  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 6, 'pork, noddle', 1, '2015-04-25 18:32:05', NULL),
(30, 2, 6, 1, 0, 'Pork Noddle 4  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 6, 'pork, noddle', 1, '2015-04-25 18:32:47', NULL),
(31, 2, 7, 1, 0, 'Fish Noddle 1', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'fish, noddle', 1, '2015-04-25 18:33:41', NULL),
(32, 2, 7, 1, 0, 'Fish Noddle 2  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'fish, noddle', 1, '2015-04-25 18:34:25', NULL),
(33, 2, 7, 1, 0, 'Fish Noddle 3  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'fish, noddle', 1, '2015-04-25 18:35:04', NULL),
(34, 2, 7, 1, 0, 'Fish Noddle 4  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'fish, noddle', 1, '2015-04-25 18:35:43', NULL),
(35, 2, 7, 1, 0, 'Fish Noddle 5  ', 'Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'fish, noddle', 1, '2015-04-25 18:36:24', NULL),
(36, 2, 8, 1, 2, 'Vege Noddle 1 ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 4, 'vege, noddle', 1, '2015-04-25 18:37:46', NULL),
(37, 2, 8, 1, 2, 'Vege Noddle 2 ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 4, 'vege, noddle', 1, '2015-04-25 18:49:04', NULL),
(38, 2, 8, 1, 2, 'Vege Noddle 3 ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 4, 'vege, noddle', 1, '2015-04-25 18:49:42', NULL),
(39, 2, 8, 1, 2, 'Vege Noddle 4 ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 4, 'vege', 1, '2015-04-25 18:50:24', NULL),
(40, 2, 8, 1, 2, 'Vege Noddle 5 ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 4, 'vege, noddle', 1, '2015-04-25 18:50:59', NULL),
(41, 4, 9, 1, 0, 'Chicken Grilled 1  ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 5, 'chicken, grilled', 1, '2015-04-25 18:56:15', NULL),
(42, 4, 9, 1, 0, 'Chicken Grilled 2 ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 5, 'chicken, grilled', 1, '2015-04-25 18:57:22', NULL),
(43, 4, 9, 1, 0, 'Chicken Grilled 3  ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 5, 'chicken, grilled', 1, '2015-04-25 18:58:09', NULL),
(44, 4, 10, 1, 0, 'Pork Grilled 1  ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 6, 'pork, grilled', 1, '2015-04-25 18:59:00', NULL),
(45, 4, 10, 1, 0, 'Pork Grilled 2   ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 6, 'pork, grilled', 1, '2015-04-25 18:59:49', NULL),
(46, 4, 10, 1, 0, 'Pork Grilled 3  ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 6, 'pork, grilled', 1, '2015-04-25 19:00:25', NULL),
(47, 4, 11, 1, 0, '  Beef Grilled 1', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 7, 'beef, grilled', 1, '2015-04-25 19:01:28', NULL),
(48, 4, 11, 1, 0, 'Beef Grilled 2', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 7, 'beef, grilled', 1, '2015-04-25 19:02:15', NULL),
(49, 4, 11, 1, 0, 'Beef Grilled 3  ', 'Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 7, 'beef, grilled', 1, '2015-04-25 19:02:54', NULL),
(50, 4, 12, 1, 0, ' Fish Grilled 1', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 9, 'fish, grilled', 1, '2015-04-25 19:03:51', NULL),
(51, 4, 12, 1, 0, 'Fish Grilled 2 ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 9, 'fish, grilled', 1, '2015-04-25 19:04:29', NULL),
(52, 4, 12, 1, 0, 'Fish Grilled 3 ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 9, 'fish, grilled', 1, '2015-04-25 19:05:16', NULL),
(53, 4, 12, 1, 0, 'Fish Grilled 4 ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 9, 'fish, grilled', 1, '2015-04-25 19:05:53', NULL),
(54, 5, 13, 1, 1, 'Crab Simmered 1  ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 10, 'crab, simmered', 1, '2015-04-25 19:12:19', NULL),
(55, 5, 13, 1, 0, 'Crab Simmered 2  ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 10, 'crab, simmered', 1, '2015-04-25 19:13:09', NULL),
(56, 5, 13, 1, 1, 'Crab Simmered 3  ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 10, 'crab, simmered', 1, '2015-04-25 19:13:50', NULL),
(57, 5, 14, 1, 0, 'Vege Simmered 1  ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'vege, simmered', 1, '2015-04-25 19:14:44', NULL),
(58, 5, 14, 1, 0, 'Vege Simmered 2  ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'vege, simmered', 1, '2015-04-25 19:16:02', NULL),
(59, 5, 14, 1, 0, 'Vege Simmered 3  ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'vege, simmered', 1, '2015-04-25 19:16:41', NULL),
(60, 5, 14, 1, 0, 'Vege Simmered 4  ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'vege, simmered', 1, '2015-04-25 19:17:17', NULL),
(61, 5, 14, 1, 0, 'Vege Simmered 5  ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 7, 'vege, simmered', 1, '2015-04-25 19:17:50', NULL),
(62, 5, 15, 1, 1, 'Fish Simmered 1 ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 10, 'fish, simmered', 1, '2015-04-25 19:18:41', NULL),
(63, 5, 15, 1, 0, 'Fish Simmered 2 ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 10, 'fish, simmered', 1, '2015-04-25 19:19:55', NULL),
(64, 5, 15, 1, 1, 'Fish Simmered 3 ', 'Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam  ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 10, 'fish, simmered', 1, '2015-04-25 19:20:33', NULL),
(65, 6, 16, 1, 0, 'Hot 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.', 9, 'hot, desert', 1, '2015-04-25 19:23:43', NULL),
(66, 6, 16, 1, 0, 'Hot 2   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 9, 'hot, desert', 1, '2015-04-25 19:24:37', NULL),
(67, 6, 16, 1, 0, 'Hot 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 10, 'hot, desert', 1, '2015-04-25 19:25:17', NULL),
(68, 6, 17, 1, 3, 'Cold Desert 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 11, 'cold, desert', 1, '2015-04-25 19:26:00', NULL),
(69, 6, 17, 1, 3, 'Cold Desert 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 11, 'cold, desert', 1, '2015-04-25 19:26:38', NULL),
(70, 6, 17, 1, 3, 'Cold Desert 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 11, 'cold, desert', 1, '2015-04-25 19:27:11', NULL),
(71, 6, 18, 1, 0, 'Cake 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 12, 'cake, desert', 1, '2015-04-25 19:27:49', NULL),
(72, 6, 18, 1, 0, 'Cake 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 12, 'cake, desert', 1, '2015-04-25 19:28:27', NULL),
(73, 6, 18, 1, 0, 'Cake 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 12, 'cake, desert', 1, '2015-04-25 19:29:04', NULL),
(74, 6, 18, 1, 0, 'Cake 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', 21, 'cake, desert', 1, '2015-04-25 19:29:38', NULL),
(75, 7, 19, 2, 5, 'Brisket 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 14, 'brisket, bbq', 1, '2015-04-25 19:46:25', NULL),
(76, 7, 19, 2, 5, 'Brisket 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 14, 'brisket, bbq', 1, '2015-04-25 19:47:37', NULL),
(77, 7, 19, 2, 5, 'Brisket 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 14, 'brisket, bbq', 1, '2015-04-25 19:48:21', NULL),
(78, 7, 19, 2, 5, 'Brisket 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 17, 'brisket, bbq', 1, '2015-04-25 19:48:56', NULL),
(79, 7, 19, 2, 5, 'Brisket 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 15, 'brisket, bbq', 1, '2015-04-25 19:49:29', NULL),
(80, 7, 20, 2, 0, 'Meat 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'meat, bbq', 1, '2015-04-25 19:50:20', NULL),
(81, 7, 20, 2, 0, 'Meat 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'meat, bbq', 1, '2015-04-25 19:51:31', NULL),
(82, 7, 20, 2, 0, 'Meat 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'meat, bbq', 1, '2015-04-25 19:52:03', NULL),
(83, 7, 21, 2, 0, 'Ribs 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 20, 'ribs, bbq', 1, '2015-04-25 19:52:41', NULL),
(84, 7, 21, 2, 0, 'Ribs 2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 20, 'ribs, bbq', 1, '2015-04-25 19:53:25', NULL),
(85, 7, 21, 2, 0, 'Ribs 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 20, 'ribs, bbq', 1, '2015-04-25 19:54:00', NULL),
(86, 7, 21, 2, 0, 'Ribs 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 20, 'ribs, bbq', 1, '2015-04-25 19:54:35', NULL),
(87, 8, 22, 2, 0, 'Spring Roll 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 5, 'spring roll, entree', 1, '2015-04-25 20:01:24', NULL),
(88, 8, 22, 2, 0, 'Spring Roll 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 7, 'spring roll, entree', 1, '2015-04-25 20:18:34', NULL),
(89, 8, 22, 2, 0, 'Spring Roll 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 7, 'spring roll, entree', 1, '2015-04-25 20:19:13', NULL),
(90, 8, 22, 2, 0, 'Spring Roll 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 7, 'spring roll, entree', 1, '2015-04-25 20:19:51', NULL),
(91, 8, 23, 2, 0, '  Curry Puff 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 8, 'curry puff, entree', 1, '2015-04-25 20:21:03', NULL),
(92, 8, 23, 2, 0, 'Curry Puff 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 8, 'curry puff, entree', 1, '2015-04-25 20:21:52', NULL),
(93, 8, 23, 2, 0, 'Curry Puff 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 7, 'curry puff, entree', 1, '2015-04-25 20:22:32', NULL),
(94, 8, 23, 2, 0, 'Curry Puff 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 6, 'curry puff, entree', 1, '2015-04-25 20:23:08', NULL),
(95, 8, 24, 2, 0, 'Prawn Cocktail 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 20, 'prawn cocktail, entree', 1, '2015-04-25 20:24:16', NULL),
(96, 8, 24, 2, 0, 'Prawn Cocktail 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 20, 'prawn cocktail, entree', 1, '2015-04-25 20:25:03', NULL),
(97, 8, 24, 2, 0, 'Prawn Cocktail 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 20, 'prawn cocktail, entree', 1, '2015-04-25 20:25:43', NULL),
(98, 8, 25, 2, 0, ' Oyster 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 22, 'oyster, entree', 1, '2015-04-25 20:26:33', NULL),
(99, 8, 25, 2, 0, 'Oyster 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 22, 'oyster, entree', 1, '2015-04-25 20:27:10', NULL),
(100, 8, 25, 2, 0, 'Oyster 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 22, 'oyster, entree', 1, '2015-04-25 20:27:53', NULL),
(101, 9, 26, 2, 4, 'Kim Chi 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 13, 'kimchi, noddle', 1, '2015-04-25 20:43:38', NULL),
(102, 9, 26, 2, 4, 'Kim Chi 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 14, 'kimchi, noddle', 1, '2015-04-25 20:44:22', NULL),
(103, 9, 26, 2, 4, 'Kim Chi 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 14, 'kimchi, noddle', 1, '2015-04-25 20:45:04', NULL),
(104, 9, 26, 2, 4, 'Kim Chi 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 14, 'kimchi, noddle', 1, '2015-04-25 20:45:44', NULL),
(105, 9, 27, 2, 6, 'Seafood Noodle 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 15, 'seafood, noodle', 1, '2015-04-25 20:46:48', NULL),
(106, 9, 27, 2, 6, 'Seafood Noodle 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 15, 'seafood, noodle', 1, '2015-04-25 20:47:35', NULL),
(107, 9, 27, 2, 6, 'Seafood Noodle 3   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 15, 'seafood, noodle', 1, '2015-04-25 20:48:16', NULL),
(108, 9, 28, 2, 0, 'Beef Noodle 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 13, 'beef, noodle', 1, '2015-04-25 20:49:09', NULL),
(109, 9, 28, 2, 0, 'Beef Noodle 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 16, 'beef, noodle', 1, '2015-04-25 20:49:49', NULL),
(110, 9, 28, 2, 0, 'Beef Noodle 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 18, 'beef, noodle', 1, '2015-04-25 20:50:44', NULL),
(111, 10, 29, 2, 0, 'KimChee 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 5, 'kimchee, vege', 1, '2015-04-25 20:56:45', NULL),
(112, 10, 29, 2, 0, 'KimChee 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 5, 'kimchee, vege', 1, '2015-04-25 20:57:42', NULL),
(113, 10, 29, 2, 0, 'KimChee 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 7, 'kimchee, vege', 1, '2015-04-25 20:58:24', NULL),
(114, 10, 30, 2, 0, 'Bean Sprout 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 6, 'bean sprout, vege', 1, '2015-04-25 20:59:22', NULL),
(115, 10, 30, 2, 0, 'Bean Sprout 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 10, 'bean sprout, vege', 1, '2015-04-25 21:00:19', NULL),
(116, 10, 30, 2, 0, 'Bean Sprout 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 5, 'bean sprout, vege', 1, '2015-04-25 21:01:02', NULL),
(117, 10, 31, 2, 0, 'Cauliflower 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 7, 'cauliflower, vege', 1, '2015-04-25 21:02:27', NULL),
(118, 10, 31, 2, 0, 'Cauliflower 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 6, 'cauliflower, vege', 1, '2015-04-25 21:03:20', NULL),
(119, 10, 31, 2, 0, 'Cauliflower 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. ', 8, 'cauliflower, vege', 1, '2015-04-25 21:04:03', NULL),
(120, 11, 32, 3, 0, 'Chicken Appetizer 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'chicken, appetizer', 1, '2015-04-25 21:19:52', NULL);
INSERT INTO `rt_items` (`id`, `cat_id`, `sub_cat_id`, `shop_id`, `discount_type_id`, `name`, `description`, `unit_price`, `search_tag`, `is_published`, `added`, `updated`) VALUES
(121, 11, 32, 3, 0, 'Chicken Appetizer 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'chicken, appetizer', 1, '2015-04-25 21:20:37', NULL),
(122, 11, 32, 3, 0, 'Chicken Appetizer 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'chicken, appetizer', 1, '2015-04-25 21:21:10', NULL),
(123, 11, 32, 3, 0, 'Chicken Appetizer 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'chicken, appetizer', 1, '2015-04-26 07:15:23', NULL),
(124, 12, 35, 3, 0, 'Beer Chang 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'beer chang', 1, '2015-04-26 07:18:56', NULL),
(125, 12, 35, 3, 0, 'Beer Chang 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'beer chang', 1, '2015-04-26 07:19:49', NULL),
(126, 12, 35, 3, 0, 'Beer Chang 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'beer chang', 1, '2015-04-26 07:20:35', NULL),
(127, 12, 35, 3, 0, 'Beer Chang 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 4, 'beer chang', 1, '2015-04-26 07:21:15', NULL),
(128, 12, 36, 3, 0, 'Thai Beer 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 4, 'thai beer', 1, '2015-04-26 07:22:13', NULL),
(129, 12, 36, 3, 0, 'Thai Beer 2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'thai beer', 1, '2015-04-26 07:23:35', NULL),
(130, 12, 36, 3, 0, 'Thai Beer 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'thai beer', 1, '2015-04-26 07:24:14', NULL),
(131, 12, 36, 3, 0, 'Thai Beer 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'thai beer', 1, '2015-04-26 07:24:51', NULL),
(132, 12, 37, 3, 0, 'Apple Wine 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'apple wine', 1, '2015-04-26 07:25:41', NULL),
(133, 12, 37, 3, 0, 'Apple Wine 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 3, 'apple wine', 1, '2015-04-26 07:26:19', NULL),
(134, 12, 37, 3, 0, 'Apple Wine 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'apple wine', 1, '2015-04-26 07:27:50', NULL),
(135, 12, 37, 3, 0, 'Apple Wine 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'apple wine', 1, '2015-04-26 07:28:40', NULL),
(136, 12, 37, 3, 0, 'Apple Wine 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'apple wine', 1, '2015-04-26 07:29:26', NULL),
(137, 13, 38, 3, 0, 'Vege Salad 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 8, 'vege salad', 1, '2015-04-26 10:12:18', NULL),
(138, 13, 38, 3, 0, 'Vege Salad 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 8, 'vege salad', 1, '2015-04-26 10:13:21', NULL),
(139, 13, 38, 3, 0, 'Vege Salad 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 8, 'vege salad', 1, '2015-04-26 10:14:06', NULL),
(140, 13, 39, 3, 0, '  Pork Salad 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 9, 'pork salad', 1, '2015-04-26 18:36:10', NULL),
(141, 13, 39, 3, 0, 'Pork Salad 2   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 10, 'pork salad', 1, '2015-04-26 18:37:04', NULL),
(142, 13, 39, 3, 0, 'Pork Salad 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 10, 'pork salad', 1, '2015-04-26 18:40:20', NULL),
(143, 13, 39, 3, 0, 'Pork Salad 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 10, 'pork salad', 1, '2015-04-26 18:41:25', NULL),
(144, 13, 39, 3, 0, 'Pork Salad 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 10, 'pork salad', 1, '2015-04-26 18:42:11', NULL),
(145, 13, 40, 3, 8, 'Fish Salad 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 15, 'fish salad', 1, '2015-04-26 18:44:13', NULL),
(146, 13, 40, 3, 8, 'Fish Salad 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 15, 'fish salad', 1, '2015-04-26 18:44:52', NULL),
(147, 13, 40, 3, 0, 'Fish Salad 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 15, 'fish salad', 1, '2015-04-26 18:47:06', NULL),
(148, 13, 40, 3, 0, 'Fish Salad 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 16, 'fish salad', 1, '2015-04-26 18:47:50', NULL),
(149, 13, 40, 3, 0, 'Fish Salad 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 16, 'fish salad', 1, '2015-04-26 18:49:54', NULL),
(150, 14, 41, 3, 8, 'Chicken Soup 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 13, 'chicken soup', 1, '2015-04-26 18:54:56', NULL),
(151, 14, 41, 3, 8, 'Chicken Soup 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 14, 'chicken soup', 1, '2015-04-26 18:55:58', NULL),
(152, 14, 41, 3, 8, 'Chicken Soup 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 14, 'chicken soup', 1, '2015-04-26 18:56:45', NULL),
(153, 14, 41, 3, 0, 'Chicken Soup 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 15, 'chicken soup', 1, '2015-04-26 18:57:25', NULL),
(154, 14, 41, 3, 0, 'Chicken Soup 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 16, 'chicken soup', 1, '2015-04-26 18:58:42', NULL),
(155, 14, 42, 3, 7, '  Pork Soup 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 17, 'pork soup', 1, '2015-04-26 18:59:23', NULL),
(156, 14, 42, 3, 7, 'Pork Soup 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 15, 'pork soup', 1, '2015-04-26 19:00:44', NULL),
(157, 14, 42, 3, 7, 'Pork Soup 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 15, 'pork soup', 1, '2015-04-26 19:01:25', NULL),
(158, 14, 42, 3, 7, 'Pork Soup 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 17, 'pork soup', 1, '2015-04-26 19:03:43', NULL),
(159, 14, 43, 3, 0, 'Duck Soup 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 14, 'duck soup', 1, '2015-04-26 19:05:18', NULL),
(160, 14, 43, 3, 0, 'Duck Soup 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 14, 'duck soup', 1, '2015-04-26 19:11:35', NULL),
(161, 14, 43, 3, 0, 'Duck Soup 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 10, 'duck soup', 1, '2015-04-26 19:12:29', NULL),
(162, 14, 43, 3, 0, 'Duck Soup 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 14, 'duck soup', 1, '2015-04-26 19:13:18', NULL),
(163, 15, 44, 4, 0, 'Chicken Appetizer 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 10, 'chicken, appetizer', 1, '2015-04-27 20:02:33', NULL),
(164, 15, 44, 4, 0, 'Chicken Appetizer 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 10, 'chicken, appetizer', 1, '2015-04-27 20:03:14', NULL),
(165, 15, 44, 4, 0, 'Chicken Appetizer 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 10, 'chicken, appetizer', 1, '2015-04-27 20:03:54', NULL),
(166, 15, 44, 4, 0, 'Chicken Appetizer 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 10, 'chicken, appetizer', 1, '2015-04-27 20:04:32', NULL),
(167, 15, 45, 4, 0, 'Fish Appetizer 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 15, 'fish appetizers', 1, '2015-04-27 20:05:30', NULL),
(168, 15, 45, 4, 0, 'Fish Appetizer 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 15, 'fish appetizers', 1, '2015-04-27 20:06:20', NULL),
(169, 15, 45, 4, 0, 'Fish Appetizer 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 15, 'fish appetizers', 1, '2015-04-27 20:06:56', NULL),
(170, 15, 45, 4, 0, 'Fish Appetizer 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 15, 'fish appetizers', 1, '2015-04-27 20:07:32', NULL),
(171, 15, 46, 4, 0, 'Prawn Appetizer 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 21, 'prawn appetizers', 1, '2015-04-27 20:08:38', NULL),
(172, 15, 46, 4, 0, 'Prawn Appetizer 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 21, 'prawn appetizers', 1, '2015-04-27 20:09:16', NULL),
(173, 15, 46, 4, 0, 'Prawn Appetizer 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 21, 'prawn appetizers', 1, '2015-04-27 20:09:51', NULL),
(174, 15, 46, 4, 0, 'Prawn Appetizer 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 21, 'prawn appetizers', 1, '2015-04-27 20:10:40', NULL),
(175, 15, 46, 4, 0, 'Prawn Appetizer 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 21, 'prawn appetizers', 1, '2015-04-27 20:11:28', NULL),
(176, 16, 47, 4, 0, 'Fish Sashimi 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 22, 'fish sashimi', 1, '2015-04-27 20:15:53', NULL),
(177, 16, 47, 4, 0, 'Fish Sashimi 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 22, 'fish sashimi', 1, '2015-04-27 20:16:37', NULL),
(178, 16, 47, 4, 0, 'Fish Sashimi 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 22, 'fish sashimi', 1, '2015-04-27 20:17:15', NULL),
(179, 16, 47, 4, 0, 'Fish Sashimi 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 22, 'fish sashimi', 1, '2015-04-27 20:17:51', NULL),
(180, 16, 47, 4, 0, 'Fish Sashimi 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 22, 'fish sashimi', 1, '2015-04-27 20:18:30', NULL),
(181, 16, 48, 4, 0, 'Mixed Sashimi 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 23, 'mixed sashimi', 1, '2015-04-27 20:19:29', NULL),
(182, 16, 48, 4, 0, 'Mixed Sashimi 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 23, 'mixed sashimi', 1, '2015-04-27 20:20:08', NULL),
(183, 16, 48, 4, 0, 'Mixed Sashimi 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 23, 'mixed sashimi', 1, '2015-04-27 20:20:49', NULL),
(184, 16, 48, 4, 0, 'Mixed Sashimi 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 23, 'mixed sashimi', 1, '2015-04-27 20:21:34', NULL),
(185, 16, 48, 4, 0, 'Mixed Sashimi 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 23, 'mixed sashimi', 1, '2015-04-27 20:22:11', NULL),
(186, 16, 49, 4, 10, 'Prawn Sashimi 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 35, 'prawn sashimi', 1, '2015-04-27 20:23:08', NULL),
(187, 16, 49, 4, 10, 'Prawn Sashimi 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 23, 'prawn sashimi', 1, '2015-04-27 20:32:32', NULL),
(188, 16, 49, 4, 10, 'Prawn Sashimi 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 23, 'prawn sashimi', 1, '2015-04-27 20:35:16', NULL),
(189, 16, 49, 4, 10, 'Prawn Sashimi 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 23, 'prawn sashimi', 1, '2015-04-27 20:36:11', NULL),
(190, 17, 50, 4, 0, '  Egg Gohan 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 8, 'egg gohan', 1, '2015-04-28 17:09:31', NULL),
(191, 17, 50, 4, 0, 'Egg Gohan 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 8, 'egg gohan', 1, '2015-04-28 17:10:23', NULL),
(192, 17, 50, 4, 0, 'Egg Gohan 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 9, 'egg gohan', 1, '2015-04-28 17:11:02', NULL),
(193, 17, 50, 4, 0, 'Egg Gohan 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 9, 'egg gohan', 1, '2015-04-28 17:11:50', NULL),
(194, 17, 50, 4, 0, 'Egg Gohan 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 9, 'egg gohan', 1, '2015-04-28 17:12:26', NULL),
(195, 17, 51, 4, 0, 'Vege Gohan 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 5, 'plain gohan', 1, '2015-04-28 17:13:13', NULL),
(196, 17, 51, 4, 0, 'Vege Gohan 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 6, 'vege gohan', 1, '2015-04-28 17:14:05', NULL),
(197, 17, 51, 4, 0, 'Vege Gohan 3   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 7, 'vege gohan', 1, '2015-04-28 17:14:45', NULL),
(198, 17, 51, 4, 0, 'Vege Gohan 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 8, 'vege gohan', 1, '2015-04-28 17:15:35', NULL),
(199, 17, 51, 4, 0, 'Vege Gohan 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 6, 'vege gohan', 1, '2015-04-28 17:16:29', NULL),
(200, 17, 52, 4, 0, 'Plain Gohan 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 4, 'plain gohan', 1, '2015-04-28 17:17:06', NULL),
(201, 17, 52, 4, 0, 'Plain Gohan 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 5, 'plain gohan', 1, '2015-04-28 17:18:12', NULL),
(202, 17, 52, 4, 0, 'Plain Gohan 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 5, 'plain gohan', 1, '2015-04-28 17:18:58', NULL),
(203, 17, 52, 4, 0, 'Plain Gohan 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 5, 'plain gohan', 1, '2015-04-28 17:19:34', NULL),
(204, 17, 52, 4, 0, 'Plain Gohan 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 5, 'plain gohan', 1, '2015-04-28 17:20:13', NULL),
(205, 18, 53, 4, 9, 'Iced Desert 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 15, 'iced desert', 1, '2015-04-28 17:23:56', NULL),
(206, 18, 53, 4, 9, 'Iced Desert 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 7, 'iced desert', 1, '2015-04-28 17:27:02', NULL),
(207, 18, 53, 4, 9, 'Iced Desert 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 6, 'iced desert', 1, '2015-04-28 17:27:41', NULL),
(208, 18, 53, 4, 9, 'Iced Desert 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 8, 'iced desert', 1, '2015-04-28 17:28:24', NULL),
(209, 18, 54, 4, 0, 'Drink 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 7, 'drink desert', 1, '2015-04-28 17:29:21', NULL),
(210, 18, 54, 4, 0, 'Drink 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 4, 'drink desert', 1, '2015-04-28 17:30:14', NULL),
(211, 18, 54, 4, 0, 'Drink 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 8, 'drink desert', 1, '2015-04-28 17:30:50', NULL),
(212, 18, 54, 4, 0, 'Drink 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 8, 'drink desert', 1, '2015-04-28 17:31:29', NULL);
INSERT INTO `rt_items` (`id`, `cat_id`, `sub_cat_id`, `shop_id`, `discount_type_id`, `name`, `description`, `unit_price`, `search_tag`, `is_published`, `added`, `updated`) VALUES
(213, 18, 54, 4, 0, 'Drink 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 4, 'drink desert', 1, '2015-04-28 17:32:04', NULL),
(214, 18, 55, 4, 0, 'Cake 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 8, 'cake, desert', 1, '2015-04-28 17:32:39', NULL),
(215, 18, 55, 4, 0, 'Cake 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 7, 'cake, desert', 1, '2015-04-28 17:33:43', NULL),
(216, 18, 55, 4, 0, 'Cake 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 5, 'cake, desert', 1, '2015-04-28 17:34:14', NULL),
(217, 18, 55, 4, 0, 'Cake 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', 5, 'cake, desert', 1, '2015-04-28 17:34:45', NULL),
(218, 19, 56, 5, 0, 'Chicken Biryani 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'briyani, indian', 1, '2015-04-29 05:26:44', NULL),
(219, 19, 56, 5, 0, 'Chicken Briyani 2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'chicken briyani', 1, '2015-04-29 05:28:26', NULL),
(220, 19, 56, 5, 0, 'Chicken Briyani 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'chicken briyani', 1, '2015-04-29 05:29:48', NULL),
(221, 19, 56, 5, 0, 'Chicken Briyani 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'chicken briyani', 1, '2015-04-29 05:30:31', NULL),
(222, 19, 56, 5, 0, 'Chicken Briyani 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'chicken briyani', 1, '2015-04-29 05:31:32', NULL),
(223, 19, 57, 5, 0, 'Mutton Briyani 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 15, 'mutton briyani', 1, '2015-04-29 05:32:32', NULL),
(224, 19, 57, 5, 0, 'Mutton Briyani 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 15, 'mutton briyani', 1, '2015-04-29 05:33:08', NULL),
(225, 19, 57, 5, 0, 'Mutton Briyani 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 15, 'mutton briyani', 1, '2015-04-29 05:33:50', NULL),
(226, 19, 57, 5, 0, 'Mutton Briyani 4   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 15, 'mutton briyani', 1, '2015-04-29 05:34:31', NULL),
(227, 19, 57, 5, 0, 'Mutton Briyani 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 15, 'mutton briyani', 1, '2015-04-29 05:36:04', NULL),
(228, 19, 58, 5, 0, 'Vege Briyani 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 8, 'vege briyani', 1, '2015-04-29 05:36:55', NULL),
(229, 19, 58, 5, 0, 'Vege Briyani 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 8, 'vege briyani', 1, '2015-04-29 05:37:48', NULL),
(230, 19, 58, 5, 0, 'Vege Briyani 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 8, 'vege briyani', 1, '2015-04-29 05:38:54', NULL),
(231, 19, 58, 5, 0, 'Vege Briyani 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 8, 'vege briyani', 1, '2015-04-29 05:40:11', NULL),
(232, 19, 58, 5, 0, 'Vege Briyani 5', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 8, 'vege briyani', 1, '2015-04-29 05:40:57', NULL),
(233, 20, 59, 5, 0, 'Plain Paratha 1   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 5, 'plain paratha', 1, '2015-04-29 05:46:13', NULL),
(234, 20, 59, 5, 0, 'Plain Paratha 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 5, 'plain paratha', 1, '2015-04-29 05:47:00', NULL),
(235, 20, 59, 5, 0, 'Plain Paratha 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 5, 'plain paratha', 1, '2015-04-29 05:47:46', NULL),
(236, 20, 59, 5, 0, 'Plain Paratha 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 5, 'plain paratha', 1, '2015-04-29 05:48:29', NULL),
(237, 20, 59, 5, 0, 'Plain Paratha 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 5, 'plain paratha', 1, '2015-04-29 05:49:09', NULL),
(238, 20, 60, 5, 12, 'Chicken Paratha 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 7, 'chicken paratha', 1, '2015-04-29 05:50:17', NULL),
(239, 20, 60, 5, 12, 'Chicken Paratha 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 8, 'chicken paratha', 1, '2015-04-29 05:51:23', NULL),
(240, 20, 60, 5, 0, 'Chicken Paratha 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 7, 'chicken paratha', 1, '2015-04-29 05:52:09', NULL),
(241, 20, 60, 5, 0, 'Chicken Paratha 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 9, 'chicken paratha', 1, '2015-04-29 05:53:11', NULL),
(242, 20, 60, 5, 0, 'Chicken Paratha 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 9, 'chicken paratha', 1, '2015-04-29 05:55:47', NULL),
(243, 20, 61, 5, 11, ' Egg Paratha 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 5, 'egg paratha', 1, '2015-04-29 05:56:43', NULL),
(244, 20, 61, 5, 11, 'Egg Paratha 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 6, 'egg paratha', 1, '2015-04-29 07:02:20', NULL),
(245, 20, 61, 5, 0, 'Egg Paratha 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 6, 'egg paratha', 1, '2015-04-29 07:04:10', NULL),
(246, 20, 61, 5, 0, 'Egg Paratha 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 6, 'egg paratha', 1, '2015-04-29 07:04:51', NULL),
(247, 20, 61, 5, 0, 'Egg Paratha 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 8, 'egg paratha', 1, '2015-04-29 07:06:43', NULL),
(248, 21, 62, 6, 14, 'Cheese Ball 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 10, 'cheese ball', 1, '2015-04-29 07:32:38', NULL),
(249, 21, 62, 6, 14, 'Cheese Ball 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 11, 'cheese ball', 1, '2015-04-29 07:33:16', NULL),
(250, 21, 62, 6, 0, 'Cheese Ball 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'cheese ball', 1, '2015-04-29 07:33:55', NULL),
(251, 21, 62, 6, 0, 'Cheese Ball 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'cheese ball', 1, '2015-04-29 07:34:31', NULL),
(252, 21, 62, 6, 0, 'Cheese Ball 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'cheese ball', 1, '2015-04-29 07:35:07', NULL),
(253, 21, 63, 6, 13, '  Cheese Cake 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'cheese cake', 1, '2015-04-29 07:36:00', NULL),
(254, 21, 63, 6, 0, 'Cheese Cake 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'cheese cake', 1, '2015-04-29 07:37:05', NULL),
(255, 21, 63, 6, 0, 'Cheese Cake 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'cheese cake', 1, '2015-04-29 07:37:44', NULL),
(256, 21, 63, 6, 0, 'Cheese Cake 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'cheese cake', 1, '2015-04-29 07:38:49', NULL),
(257, 21, 62, 6, 0, 'Cheese Cake 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'cheese cake', 1, '2015-04-29 07:39:43', NULL),
(258, 21, 64, 6, 0, ' Vege Salad 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'vege salad', 1, '2015-04-29 07:40:28', NULL),
(259, 21, 64, 6, 0, 'Vege Salad 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'vege salad', 1, '2015-04-29 07:41:35', NULL),
(260, 21, 64, 6, 0, 'Vege Salad 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'vege salad', 1, '2015-04-29 07:42:16', NULL),
(261, 21, 64, 6, 0, 'Vege Salad 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'vege salad', 1, '2015-04-29 07:42:51', NULL),
(262, 21, 64, 6, 0, 'Vege Salad 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 10, 'vege salad', 1, '2015-04-29 07:43:32', NULL),
(263, 23, 65, 6, 0, 'Orange Juice 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'orange juice', 1, '2015-04-29 07:50:24', NULL),
(264, 23, 65, 6, 0, 'Orange Juice 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'orange juice', 1, '2015-04-29 07:51:11', NULL),
(265, 23, 65, 6, 0, 'Orange Juice 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'orange juice', 1, '2015-04-29 07:52:35', NULL),
(266, 23, 65, 6, 0, 'Orange Juice 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'orange juice', 1, '2015-04-29 07:53:57', NULL),
(267, 23, 65, 6, 0, 'Orange Juice 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'orange juice', 1, '2015-04-29 07:54:58', NULL),
(268, 23, 66, 6, 0, '  Apple Juice 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'apple juice', 1, '2015-04-29 07:55:40', NULL),
(269, 23, 66, 6, 0, 'Apple Juice 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 4, 'apple juice', 1, '2015-04-29 07:56:15', NULL),
(270, 23, 66, 6, 0, 'Apple Juice 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'apple juice', 1, '2015-04-29 07:56:53', NULL),
(271, 23, 66, 6, 0, 'Apple Juice 4   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'apple juice', 1, '2015-04-29 07:58:35', NULL),
(272, 23, 66, 6, 0, 'Apple Juice 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'apple juice', 1, '2015-04-29 07:59:34', NULL),
(273, 23, 67, 6, 13, ' Beer 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'beer', 1, '2015-04-29 08:02:40', NULL),
(274, 23, 67, 6, 13, 'Beer 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'beer', 1, '2015-04-29 08:03:23', NULL),
(275, 23, 67, 6, 0, 'Beer 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'beer', 1, '2015-04-29 08:03:59', NULL),
(276, 23, 67, 6, 0, 'Beer 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'beer', 1, '2015-04-29 08:04:42', NULL),
(277, 23, 67, 6, 0, 'Beer 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'beer', 1, '2015-04-29 08:05:43', NULL),
(278, 24, 68, 7, 0, 'Chicken Curry 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'chicken curry', 1, '2015-04-29 08:16:05', NULL),
(279, 24, 68, 7, 0, '  Chicken Curry 2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'chicken curry', 1, '2015-04-29 08:18:43', NULL),
(281, 24, 68, 7, 0, 'Chicken Curry 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'chicken curry', 1, '2015-04-29 08:21:47', NULL),
(282, 24, 68, 7, 0, 'Chicken Curry 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'chicken curry', 1, '2015-04-29 08:24:25', NULL),
(283, 24, 68, 7, 0, 'Chicken Curry 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 10, 'chicken curry', 1, '2015-04-29 08:25:21', NULL),
(284, 24, 69, 7, 0, 'Pork Curry 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'pork curry', 1, '2015-04-29 08:27:31', NULL),
(285, 24, 69, 7, 0, 'Pork Curry 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'pork curry', 1, '2015-04-29 08:28:21', NULL),
(286, 24, 69, 7, 0, 'Pork Curry 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'pork curry', 1, '2015-04-29 08:28:57', NULL),
(287, 24, 69, 7, 0, 'Pork Curry 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 5, 'pork curry', 1, '2015-04-29 08:29:56', NULL),
(288, 24, 69, 7, 0, 'Pork Curry 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 5, 'pork curry', 1, '2015-04-29 08:30:33', NULL),
(289, 24, 70, 7, 0, 'Fish Curry 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'fish curry', 1, '2015-04-29 08:31:12', NULL),
(290, 24, 70, 7, 0, 'Fish Curry 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'fish curry', 1, '2015-04-29 08:32:01', NULL),
(291, 24, 70, 7, 0, 'Fish Curry 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'fish curry', 1, '2015-04-29 08:32:42', NULL),
(292, 24, 70, 7, 0, 'Fish Curry 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 5, 'fish curry', 1, '2015-04-29 08:33:23', NULL),
(293, 24, 71, 7, 16, ' Mutton Curry 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 5, 'mutton curry', 1, '2015-04-29 08:34:21', NULL),
(294, 24, 71, 7, 16, 'Mutton Curry 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'mutton curry', 1, '2015-04-29 08:34:57', NULL),
(295, 24, 71, 7, 16, 'Mutton Curry 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'mutton curry', 1, '2015-04-29 08:35:32', NULL),
(296, 24, 71, 7, 16, 'Mutton Curry 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'mutton curry', 1, '2015-04-29 08:36:05', NULL),
(297, 25, 72, 7, 0, '  Mote Hin Gar 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'mote hin gar', 1, '2015-04-29 08:36:55', NULL),
(298, 25, 72, 7, 0, 'Mote Hin Gar 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 5, 'mote hin gar', 1, '2015-04-29 08:37:35', NULL),
(299, 25, 72, 7, 0, 'Mote Hin Gar 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'mote hin gar', 1, '2015-04-29 08:38:14', NULL),
(300, 25, 72, 7, 0, 'Mote Hin Gar 4   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'mote hin gar', 1, '2015-04-29 08:38:55', NULL),
(301, 25, 72, 7, 0, 'Mote Hin Gar 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'mote hin gar', 1, '2015-04-29 08:39:32', NULL),
(302, 25, 73, 7, 15, '  Ar Thote 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 7, 'ar thote', 1, '2015-04-29 08:40:19', NULL),
(303, 25, 73, 7, 15, 'Ar Thote 2   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'ar thote', 1, '2015-04-29 08:41:10', NULL),
(304, 25, 73, 7, 15, 'Ar Thote 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'ar thote', 1, '2015-04-29 08:42:08', NULL),
(305, 25, 74, 7, 0, 'Nan Gyi Thote 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 8, 'nan gyi thote', 1, '2015-04-29 08:42:44', NULL),
(306, 25, 74, 7, 0, 'Nan Gyi Thote 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 6, 'nan gyi thote', 1, '2015-04-29 08:43:28', NULL),
(307, 25, 74, 7, 0, 'Nan Gyi Thote 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 8, 'nan gyi thote', 1, '2015-04-29 08:44:05', NULL),
(308, 25, 74, 7, 0, 'Nan Gyi Thote 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 8, 'nan gyi thote', 1, '2015-04-29 08:44:46', NULL),
(309, 25, 74, 7, 0, 'Nan Gyi Thote 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', 8, 'nan gyi thote', 1, '2015-04-29 08:45:23', NULL),
(310, 26, 75, 8, 0, '  Cappuccino 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenea commodo ligula eget dolor. Aenean massa. Cum sociis natoquepenatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 10, 'cappuccino', 1, '2015-04-29 14:39:36', NULL),
(311, 26, 75, 8, 0, 'Cappuccino 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 10, 'cappuccino', 1, '2015-04-29 14:40:15', NULL),
(312, 26, 75, 8, 0, 'Cappuccino 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'cappuccino', 1, '2015-04-29 15:22:25', NULL);
INSERT INTO `rt_items` (`id`, `cat_id`, `sub_cat_id`, `shop_id`, `discount_type_id`, `name`, `description`, `unit_price`, `search_tag`, `is_published`, `added`, `updated`) VALUES
(313, 26, 75, 8, 0, 'Cappuccino 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'cappuccino', 1, '2015-04-29 15:42:00', NULL),
(314, 26, 75, 8, 0, 'Cappuccino 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'cappuccino', 1, '2015-04-29 15:42:49', NULL),
(315, 26, 76, 8, 0, '  Latte 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'latte', 1, '2015-04-29 15:43:29', NULL),
(316, 26, 76, 8, 0, ' Latte 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 9, 'latte', 1, '2015-04-29 15:44:09', NULL),
(317, 26, 76, 8, 0, 'Latte 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'latte', 1, '2015-04-29 15:44:58', NULL),
(318, 26, 76, 8, 0, 'Latte 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'latte', 1, '2015-04-29 15:45:31', NULL),
(319, 26, 77, 8, 0, 'Espresso 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 12, 'espresso', 1, '2015-04-29 15:46:35', NULL),
(320, 26, 77, 8, 0, 'Espresso 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 23, 'espresso', 1, '2015-04-29 15:48:05', NULL),
(321, 26, 77, 8, 0, 'Espresso 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 12, 'espresso', 1, '2015-04-29 15:48:59', NULL),
(323, 26, 77, 8, 0, 'Espresso 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 4, 'espresso', 1, '2015-04-29 16:10:42', NULL),
(324, 26, 77, 8, 0, 'Espresso 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 4, 'espresso', 1, '2015-04-29 16:11:16', NULL),
(325, 27, 78, 8, 17, '  Papara Juice 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'papara juice', 1, '2015-04-29 16:15:22', NULL),
(326, 27, 78, 8, 17, 'Papara Juice 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'papara juice', 1, '2015-04-29 16:16:01', NULL),
(328, 27, 78, 8, 0, 'Papara Juice 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 7, 'papara juice', 1, '2015-04-29 16:18:19', NULL),
(329, 27, 78, 8, 0, 'Papara Juice 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 6, 'papara juice', 1, '2015-04-29 16:19:18', NULL),
(330, 27, 78, 8, 0, 'Papara Juice 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 8, 'papara juice', 1, '2015-04-29 16:20:03', NULL),
(331, 27, 79, 8, 0, '  Apple Juice 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', 5, 'apple juice', 1, '2015-04-29 16:20:41', NULL),
(332, 27, 79, 8, 0, 'Apple Juice 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 5, 'apple juice', 1, '2015-04-29 16:21:28', NULL),
(333, 27, 79, 8, 0, 'Apple Juice 3   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 6, 'apple juice', 1, '2015-04-29 16:22:18', NULL),
(334, 27, 79, 8, 0, 'Apple Juice 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 6, 'apple juice', 1, '2015-04-29 16:22:59', NULL),
(335, 27, 79, 8, 0, 'Apple Juice 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 6, 'apple juice', 1, '2015-04-29 16:23:34', NULL),
(336, 27, 80, 8, 0, 'Grape Juice 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'grape juice', 1, '2015-04-29 16:24:14', NULL),
(337, 27, 80, 8, 0, 'Grape Juice 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'grape juice', 1, '2015-04-29 16:24:54', NULL),
(338, 27, 80, 8, 18, 'Grape Juice 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'grape juice', 1, '2015-04-29 16:25:32', NULL),
(339, 27, 80, 8, 18, 'Grape Juice 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'grape juice', 1, '2015-04-29 16:26:12', NULL),
(340, 27, 80, 8, 0, 'Grape Juice 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 10, 'grape juice', 1, '2015-04-29 16:26:55', NULL),
(341, 28, 81, 9, 20, 'Chicken Dim Sum 1  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', 10, 'chicken dim sum', 1, '2015-04-29 16:36:53', NULL),
(342, 28, 81, 9, 20, 'Chicken Dim Sum 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'chicken dim sum', 1, '2015-04-29 16:37:52', NULL),
(343, 28, 81, 9, 0, 'Chicken Dim Sum 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'chicken dim sum', 1, '2015-04-29 16:39:06', NULL),
(344, 28, 81, 9, 0, 'Chicken Dim Sum 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'chicken dim sum', 1, '2015-04-29 16:39:59', NULL),
(345, 28, 82, 9, 0, '  Pork Dim Sum 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 14, 'pork dim sum', 1, '2015-04-29 16:41:07', NULL),
(346, 28, 82, 9, 0, 'Pork Dim Sum 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'pork dim sum', 1, '2015-04-29 16:41:48', NULL),
(347, 28, 82, 9, 0, 'Pork Dim Sum 3   ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 14, 'pork dim sum', 1, '2015-04-29 16:42:40', NULL),
(348, 28, 82, 9, 0, 'Pork Dim Sum 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 4, 'pork dim sum', 1, '2015-04-29 16:43:20', NULL),
(349, 28, 83, 9, 0, 'Fish Dim Sum 1 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 17, 'fish dim sum', 1, '2015-04-29 16:43:57', NULL),
(350, 28, 83, 9, 0, 'Fish Dim Sum 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'fish dim sum', 1, '2015-04-29 16:44:34', NULL),
(351, 28, 83, 9, 0, 'Fish Dim Sum 3 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'fish dim sum', 1, '2015-04-29 16:45:08', NULL),
(352, 28, 83, 9, 0, 'Fish Dim Sum 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'fish dim sum', 1, '2015-04-29 16:45:38', NULL),
(353, 29, 84, 9, 0, '  Snake Soup 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'snake soup', 1, '2015-04-29 16:50:51', NULL),
(354, 29, 84, 9, 0, 'Snake Soup 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'snake soup', 1, '2015-04-29 16:51:28', NULL),
(355, 29, 84, 9, 0, 'Snake Soup 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. \n', 10, 'snake soup', 1, '2015-04-29 16:51:59', NULL),
(356, 29, 84, 9, 0, 'Snake Soup 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 10, 'snake soup', 1, '2015-04-29 16:52:38', NULL),
(357, 29, 85, 9, 0, '  BakuTae 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 10, 'bakutae', 1, '2015-04-29 16:53:20', NULL),
(358, 29, 85, 9, 0, 'BakuTae 2  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 10, 'bakutae', 1, '2015-04-29 16:54:05', NULL),
(359, 29, 85, 9, 19, 'BakuTae 3  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 10, 'bakutae', 1, '2015-04-29 16:54:38', NULL),
(360, 29, 85, 9, 19, 'BakuTae 4  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 10, 'bakutae', 1, '2015-04-29 16:55:19', NULL),
(361, 29, 85, 9, 0, 'BakuTae 5  ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 10, 'bakutae', 1, '2015-04-29 16:55:52', NULL),
(362, 29, 86, 9, 0, ' Pork Ribs Soup 1', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 7, 'pork ribs soup', 1, '2015-04-29 16:56:36', NULL),
(363, 29, 86, 9, 0, 'Pork Ribs Soup 2 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 10, 'pork ribs soup', 1, '2015-04-29 16:57:16', NULL),
(364, 29, 86, 9, 0, 'Pork Ribs Soup 3', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 10, 'pork ribs soup', 1, '2015-04-29 16:58:05', NULL),
(365, 29, 86, 9, 0, 'Pork Ribs Soup 4 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 20, 'pork ribs soup', 1, '2015-04-29 16:58:46', NULL),
(366, 29, 86, 9, 0, 'Pork Ribs Soup 5 ', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. ', 17, 'pork ribs soup', 1, '2015-04-29 16:59:32', NULL),
(367, 1, 1, 1, 0, 'Sushi Roll 101    ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae venenatis tortor. Mauris hendrerit odio sit amet facilisis convallis. Vivamus facilisis dapibus metus, non varius nisl hendrerit at. Praesent nec orci leo. Cras velit mi, ultricies in nibh et, interdum tincidunt sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur venenatis commodo pellentesque. Aliquam elementum tempus diam, quis malesuada enim fringilla sed. Sed rhoncus condimentum lobortis.', 10, 'sushi', 1, '2015-08-20 20:09:08', NULL),
(368, 1, 1, 1, 0, 'Sushi Roll 102    ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae venenatis tortor. Mauris hendrerit odio sit amet facilisis convallis. Vivamus facilisis dapibus metus, non varius nisl hendrerit at. Praesent nec orci leo. Cras velit mi, ultricies in nibh et, interdum tincidunt sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur venenatis commodo pellentesque. Aliquam elementum tempus diam, quis malesuada enim fringilla sed. Sed rhoncus condimentum lobortis.', 10, 'sushi', 1, '2015-08-20 20:10:24', NULL),
(369, 1, 1, 1, 0, 'Sushi Roll 103  ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae venenatis tortor. Mauris hendrerit odio sit amet facilisis convallis. Vivamus facilisis dapibus metus, non varius nisl hendrerit at. Praesent nec orci leo. Cras velit mi, ultricies in nibh et, interdum tincidunt sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur venenatis commodo pellentesque. Aliquam elementum tempus diam, quis malesuada enim fringilla sed. Sed rhoncus condimentum lobortis.', 29, 'sushi', 1, '2015-08-20 20:11:01', NULL),
(370, 1, 1, 1, 0, 'Sushi Roll 104  ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae venenatis tortor. Mauris hendrerit odio sit amet facilisis convallis. Vivamus facilisis dapibus metus, non varius nisl hendrerit at. Praesent nec orci leo. Cras velit mi, ultricies in nibh et, interdum tincidunt sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur venenatis commodo pellentesque. Aliquam elementum tempus diam, quis malesuada enim fringilla sed. Sed rhoncus condimentum lobortis.', 15, 'sushi', 1, '2015-08-20 20:11:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_items_attributes_detail`
--

CREATE TABLE `rt_items_attributes_detail` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `header_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `additional_price` float NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_items_attributes_detail`
--

INSERT INTO `rt_items_attributes_detail` (`id`, `shop_id`, `header_id`, `item_id`, `name`, `additional_price`, `added`) VALUES
(1, 1, 4, 1, 'Small', 0, '2015-05-05 15:45:51'),
(2, 1, 4, 1, 'Medium', 3, '2015-05-05 15:46:09'),
(3, 1, 4, 1, 'Large', 6, '2015-05-05 15:46:19'),
(4, 2, 5, 75, 'Medium', 5, '2015-05-15 20:40:30'),
(5, 2, 5, 75, 'Large', 10, '2015-05-15 20:40:45'),
(6, 2, 6, 80, 'Medium', 5, '2015-05-15 20:49:05'),
(7, 2, 6, 80, 'Large', 10, '2015-05-15 20:49:23'),
(8, 2, 6, 80, 'X Large', 15, '2015-05-15 20:49:33');

-- --------------------------------------------------------

--
-- Table structure for table `rt_items_attributes_header`
--

CREATE TABLE `rt_items_attributes_header` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_items_attributes_header`
--

INSERT INTO `rt_items_attributes_header` (`id`, `item_id`, `shop_id`, `name`, `added`) VALUES
(4, 1, 1, 'Sizes', '2015-05-05 15:45:39'),
(5, 75, 2, 'Sizes', '2015-05-15 20:40:17'),
(6, 80, 2, 'Sizes', '2015-05-15 20:48:49');

-- --------------------------------------------------------

--
-- Table structure for table `rt_likes`
--

CREATE TABLE `rt_likes` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `appuser_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_likes`
--

INSERT INTO `rt_likes` (`id`, `item_id`, `appuser_id`, `shop_id`, `added`) VALUES
(1, 2, 1, 1, '2015-05-09 16:01:55'),
(2, 23, 1, 1, '2015-05-15 15:40:04'),
(3, 63, 1, 1, '2015-05-15 16:25:23'),
(4, 33, 1, 1, '2015-05-15 16:35:52'),
(5, 9, 1, 1, '2015-05-15 16:51:13'),
(6, 167, 1, 4, '2015-05-15 18:02:56'),
(7, 281, 1, 7, '2015-05-15 18:16:19');

-- --------------------------------------------------------

--
-- Table structure for table `rt_ratings`
--

CREATE TABLE `rt_ratings` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `appuser_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_ratings`
--

INSERT INTO `rt_ratings` (`id`, `shop_id`, `appuser_id`, `item_id`, `rating`, `added`) VALUES
(1, 1, 1, 2, 4, '2015-05-09 16:01:51'),
(2, 1, 1, 23, 5, '2015-05-15 15:40:08'),
(3, 1, 1, 63, 5, '2015-05-15 16:25:25'),
(4, 1, 1, 33, 5, '2015-05-15 16:35:54'),
(5, 1, 1, 9, 5, '2015-05-15 16:51:15'),
(6, 4, 1, 167, 5, '2015-05-15 18:02:58'),
(7, 7, 1, 281, 5, '2015-05-15 18:16:21');

-- --------------------------------------------------------

--
-- Table structure for table `rt_reservation`
--

CREATE TABLE `rt_reservation` (
  `id` int(11) NOT NULL,
  `resv_date` varchar(50) NOT NULL,
  `resv_time` varchar(50) NOT NULL,
  `note` text,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone_no` varchar(50) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `status_id` int(11) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `promo_id` int(11) NOT NULL,
  `dog_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_reservation`
--

INSERT INTO `rt_reservation` (`id`, `resv_date`, `resv_time`, `note`, `shop_id`, `user_id`, `user_email`, `user_phone_no`, `user_name`, `status_id`, `added`, `promo_id`, `dog_id`) VALUES
(1, '10/5/2015', '13:48', 'for 5 person as one table', 1, 1, 'pphmit@gmail.com', '53535', 'Han', 3, '2015-05-08 19:19:13', 0, 0),
(2, '14/5/2015', '22:29', 'For 10 people ', 3, 0, 'pphmit@gmail.com', '24324', 'yukio', 1, '2015-05-13 16:00:32', 0, 0),
(3, '19/5/2015', '0:37', 'for 5 people', 6, 0, 'rody@gmail.com', '123313', 'rody', 1, '2015-05-13 18:07:49', 0, 0),
(4, '16/5/2015', '12:23', 'i want book one table for 5 people', 2, 1, 'pphmit@gmail.com', '6858568', 'Han', 3, '2015-05-14 17:54:12', 0, 0),
(5, '16/4/2015', '15:24', 'for 10 persons ', 5, 1, 'pphmit@gmail.com', '424244', 'Han', 1, '2015-05-16 05:55:11', 0, 0),
(6, '02/10/2017', '12:00', 'Dog Walk,Wash,Hair Cut,Nail Trimming,Flea Treatment,Over night vacation', 1, 4, 'csemrm@rrrrryy.hhry', '', 'Milton', 1, '2017-09-11 08:47:29', 1, 30),
(7, '09/11/2017', '05:00 PM', 'Dog Walk,Hair Cut', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 09:29:11', 0, 30),
(8, '09/11/2017', '05:00 PM', 'Dog Walk,Hair Cut', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 09:32:24', 0, 30),
(9, '11/09/2017', '04:50 PM', 'Flea Treatment,Bail Trimming,Dog Walk', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 09:42:38', 0, 30),
(10, '11/09/2017', '04:50 PM', 'Flea Treatment,Bail Trimming,Dog Walk', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 09:46:38', 0, 30),
(11, '11/09/2017', '04:50 PM', 'Flea Treatment,Bail Trimming,Dog Walk', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 10:00:48', 0, 30),
(12, '11/09/2017', '05:00 PM', 'Bail Trimming,Bail Trimming', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 11:29:50', 1, 30),
(13, '11/09/2017', '05:30 PM', 'Dog Walk', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 11:30:55', 0, 6),
(14, '11/09/2017', '011:59 PM', 'Dog Walk,Wash', 1, 6, 'Csemrm@yahoo.com', '01712121212', 'Milon', 1, '2017-09-11 15:55:49', 0, 33),
(15, '11/09/2017', '010:56 PM', 'Dog Walk,Hair Cut', 1, 6, 'Csemrm@yahoo.com', '01712121212', 'Milon', 1, '2017-09-11 15:56:23', 1, 32),
(16, '28/09/2017', '06:30 AM', 'Dog Walk', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 18:03:21', 0, 30),
(17, '12/09/2017', '06:03 AM', 'Hair Cut', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-11 18:03:56', 1, 30),
(18, '15/09/2017', '05:46 PM', 'Bail Trimming,Flea Treatment', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-15 11:14:39', 0, 0),
(19, '17/09/2017', '01:52 AM', 'Wash', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-16 18:52:50', 0, 0),
(20, '17/09/2017', '01:52 AM', 'Wash,Bail Trimming', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-16 18:56:07', 0, 0),
(21, '16/09/2017', '03:01 PM', 'Bail Trimming', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-16 19:02:07', 0, 0),
(22, '17/09/2017', '02:03 AM', 'Over night vacation,Bail Trimming', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-16 19:03:40', 0, 0),
(23, '17/09/2017', '02:04 AM', 'Hair Cut', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-16 19:04:22', 0, 0),
(24, '16/09/2017', '01:19 PM', 'Over night vacation', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-16 19:24:42', 0, 0),
(25, '17/09/2017', '03:42 PM', 'Bail Trimming', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-17 21:42:27', 0, 0),
(26, '17/09/2017', '06:24 PM', 'Wash,Bail Trimming', 1, 1, 'csemrm@gmail.com', 'qwewq', 'Han', 1, '2017-09-18 00:25:07', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rt_reservation_status`
--

CREATE TABLE `rt_reservation_status` (
  `id` int(5) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_reservation_status`
--

INSERT INTO `rt_reservation_status` (`id`, `title`) VALUES
(1, 'Pending'),
(2, 'Cancel'),
(3, 'Confirm'),
(4, 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `rt_reviews`
--

CREATE TABLE `rt_reviews` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `appuser_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `review` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_reviews`
--

INSERT INTO `rt_reviews` (`id`, `item_id`, `appuser_id`, `shop_id`, `review`, `status`, `added`) VALUES
(1, 2, 1, 1, 'I like too much this sushi. :)', 1, '2015-05-09 16:01:37'),
(2, 23, 1, 1, 'this noodle is look nice', 1, '2015-05-15 15:40:39'),
(3, 63, 1, 1, 'look nice :)', 1, '2015-05-15 16:25:37'),
(4, 33, 1, 1, 'look very nice', 1, '2015-05-15 16:36:21'),
(5, 9, 1, 1, 'look nice', 1, '2015-05-15 16:51:27'),
(6, 167, 1, 4, 'look very nice', 1, '2015-05-15 18:03:08'),
(7, 281, 1, 7, 'look very nice curry', 1, '2015-05-15 18:16:45'),
(8, 23, 1, 1, 'this is very good', 1, '2015-07-29 14:32:36'),
(9, 23, 1, 1, 'very good must eat', 1, '2015-07-31 19:13:39');

-- --------------------------------------------------------

--
-- Table structure for table `rt_shops`
--

CREATE TABLE `rt_shops` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `phone` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `paypal_email` varchar(255) NOT NULL,
  `paypal_payment_type` varchar(255) NOT NULL,
  `paypal_environment` varchar(255) NOT NULL,
  `paypal_appid_live` varchar(255) NOT NULL,
  `paypal_merchantname` varchar(255) NOT NULL,
  `paypal_customerid` varchar(255) NOT NULL,
  `paypal_ipnurl` varchar(255) NOT NULL,
  `paypal_memo` varchar(255) NOT NULL,
  `bank_account` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_code` varchar(50) NOT NULL,
  `branch_code` varchar(50) NOT NULL,
  `swift_code` varchar(50) NOT NULL,
  `cod_email` varchar(50) NOT NULL,
  `currency_symbol` varchar(255) NOT NULL,
  `currency_short_form` varchar(255) NOT NULL,
  `sender_email` varchar(50) NOT NULL,
  `flat_rate_shipping` float NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_shops`
--

INSERT INTO `rt_shops` (`id`, `name`, `description`, `phone`, `email`, `address`, `lat`, `lng`, `paypal_email`, `paypal_payment_type`, `paypal_environment`, `paypal_appid_live`, `paypal_merchantname`, `paypal_customerid`, `paypal_ipnurl`, `paypal_memo`, `bank_account`, `bank_name`, `bank_code`, `branch_code`, `swift_code`, `cod_email`, `currency_symbol`, `currency_short_form`, `sender_email`, `flat_rate_shipping`, `keyword`, `added`, `status`) VALUES
(1, 'Sushi Lover', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.', '+959 12345678', 'teamps.is.cool@gmail.com', 'No-1, River Road, Singapore', 1.316370, 103.882698, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '901239818908', 'ZSXD', '002', '006', '004', 'teamps.is.cool@gmail.com', '£', 'GBP', 'no_reply@panacea-soft.com', 30, 'sushi, noddle, grilled', '2015-04-25 06:41:05', 1),
(2, 'Korean Kitchen', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu', '+959 12345678', 'teamps.is.cool@gmail.com', 'No-564, School Road, Singapore', 1.370000, 103.882698, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '7248429898', 'XZY', '001', '002', '', 'teamps.is.cool@gmail.com', 'S$', 'SGD', 'no_reply@panacea-soft.com', 25, 'korean, bbq, noddle', '2015-04-25 19:42:04', 1),
(3, 'Thai Kitchen', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. ', '+959 12345678', 'teamps.is.cool@gmail.com', 'No-34, Pagoda Road, Singapore', 1.276290, 103.854202, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '0123456', 'BOB', '005', '003', '003', 'teamps.is.cool@gmail.com', 'S$', 'SGD', 'no_reply@panacea-soft.com', 30, 'thai, salad, soups', '2015-04-25 21:10:14', 1),
(4, 'Japanese Kitchen', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', '8193892', 'teamps.is.cool@gmail.com', 'No-12, Square Street, Singapore ', 1.324050, 103.930199, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '36247864892', 'ZSXD', '005', '006', '007', 'teamps.is.cool@gmail.com', '$', 'USD', 'no_reply@panacea-soft.com', 0, 'japanese, sushi', '2015-04-27 19:49:08', 1),
(5, 'Indian Kitchen', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.', '252345', 'teamps.is.cool@gmail.com', 'No-12, Square Street, Singapore ', 0.000000, 0.000000, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '36247864892', 'ZSXD', '002', '006', '765', 'teamps.is.cool@gmail.com', '$', 'USD', 'no_reply@panacea-soft.com', 0, 'indian, briyani, paratar', '2015-04-29 04:53:28', 1),
(6, 'Western Bar & Kitchen', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. ', '4245252355', 'teamps.is.cool@gmail.com', 'No-564, Junction Road, Singapore', 1.300060, 103.855904, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '7248429898', 'SDER', '', '003', '004', 'teamps.is.cool@gmail.com', 'S$', 'SGD', 'no_reply@panacea-soft.com', 0, 'western, bar, drink', '2015-04-29 07:25:20', 1),
(7, 'Burmese Kitchen', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus \nmus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi. ', '4245252355', 'teamps.is.cool@gmail.com', 'No-12, City Street, Singapore ', 1.339480, 103.705803, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '36247864892', 'ZSXD', '002', '003', '765', 'teamps.is.cool@gmail.com', 'S$', 'SGD', 'no_reply@panacea-soft.com', 0, 'burmese, curry, rice', '2015-04-29 08:09:25', 1),
(8, 'Cafeteria', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. ', '124442344', 'teamps.is.cool@gmail.com', 'No-12, Town Road, Singapore ', 1.307260, 103.790298, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '36247864892', 'ZSXD', '005', '003', '007', 'teamps.is.cool@gmail.com', 'S$', 'SGD', 'no_reply@panacea-soft.com', 15, 'coffee, cafe, drink', '2015-04-29 14:30:08', 1),
(9, 'Chinese Taste', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus  mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt.  Cras dapibus. Vivamus elementum semper nisi.', '1221782187', 'teamps.is.cool@gmail.com', 'No-34, Old Road, Singapore', 1.314930, 103.765297, 'teamps.is.cool@gmail.com', 'Paypal.PAYMENT_TYPE_SERVICE', 'Paypal.PAYPAL_ENV_NONE', 'APP-9WE41553SD3116512', 'Restautateur', 'RestautateurCustomer', 'http://www.panacea-soft.com', 'Payment for items order from Restautateur Shop', '36247864892', 'ZSXD', '005', '003', '765', 'teamps.is.cool@gmail.com', 'S$', 'SGD', 'no_reply@panacea-soft.com', 15, 'chinese, dim sum', '2015-04-29 16:34:23', 1),
(10, 'Barker Star', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vitae venenatis tortor. Mauris hendrerit odio sit amet facilisis convallis. Vivamus facilisis dapibus metus, non varius nisl hendrerit at. Praesent nec orci leo. Cras velit mi, ultricies in nibh et, interdum tincidunt sapien. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur venenatis commodo pellentesque. Aliquam elementum tempus diam, quis malesuada enim fringilla sed. Sed rhoncus condimentum lobortis.', '24242423', 'contact@gmail.com', 'No-1, Town Hall Road, Singapore', 1.330830, 103.761200, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 'barker', '2015-08-13 05:46:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rt_sub_categories`
--

CREATE TABLE `rt_sub_categories` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_published` int(11) NOT NULL DEFAULT '0',
  `ordering` int(5) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_sub_categories`
--

INSERT INTO `rt_sub_categories` (`id`, `cat_id`, `shop_id`, `name`, `is_published`, `ordering`, `added`, `updated`) VALUES
(1, 1, 1, 'Sushi(Rolls)', 1, 1, '2015-04-25 17:55:14', NULL),
(2, 1, 1, 'Sushi(Nigiri)', 1, 2, '2015-04-25 17:55:49', NULL),
(3, 1, 1, 'Home Special 1', 1, 3, '2015-04-25 17:56:25', NULL),
(4, 1, 1, 'Home Special 2', 1, 4, '2015-04-25 17:56:43', NULL),
(5, 2, 1, 'Chicken Noddles', 1, 1, '2015-04-25 18:23:02', NULL),
(6, 2, 1, 'Pork Noddles', 1, 2, '2015-04-25 18:23:21', NULL),
(7, 2, 1, 'Fish Noddles', 1, 3, '2015-04-25 18:23:39', NULL),
(8, 2, 1, 'Vege Noddles', 1, 4, '2015-04-25 18:24:00', NULL),
(9, 4, 1, 'Chicken Grilled', 1, 9, '2015-04-25 18:52:59', NULL),
(10, 4, 1, 'Pork Grilled', 1, 10, '2015-04-25 18:53:24', NULL),
(11, 4, 1, 'Beef Grilled', 1, 11, '2015-04-25 18:53:44', NULL),
(12, 4, 1, 'Fish Grilled', 1, 12, '2015-04-25 18:54:05', NULL),
(13, 5, 1, 'Crab Simmered', 1, 13, '2015-04-25 19:09:46', NULL),
(14, 5, 1, 'Vege Simmered', 1, 14, '2015-04-25 19:10:17', NULL),
(15, 5, 1, 'Fish Simmered', 1, 15, '2015-04-25 19:10:56', NULL),
(16, 6, 1, 'Hot', 1, 16, '2015-04-25 19:22:18', NULL),
(17, 6, 1, 'Cold', 1, 17, '2015-04-25 19:22:39', NULL),
(18, 6, 1, 'Cake', 1, 18, '2015-04-25 19:22:56', NULL),
(19, 7, 2, 'Brisket', 1, 1, '2015-04-25 19:44:54', NULL),
(20, 7, 2, 'Meat', 1, 2, '2015-04-25 19:45:15', NULL),
(21, 7, 2, 'Ribs', 1, 3, '2015-04-25 19:45:31', NULL),
(22, 8, 2, 'Spring Roll', 1, 4, '2015-04-25 19:56:03', NULL),
(23, 8, 2, 'Curry Puff', 1, 2, '2015-04-25 19:56:21', NULL),
(24, 8, 2, 'Prawn Cocktail', 1, 6, '2015-04-25 19:57:00', NULL),
(25, 8, 2, 'Oysters Natural', 1, 4, '2015-04-25 19:57:47', NULL),
(26, 9, 2, 'Kim Chi', 1, 8, '2015-04-25 20:41:38', NULL),
(27, 9, 2, 'Seafood Noddles', 1, 9, '2015-04-25 20:42:19', NULL),
(28, 9, 2, 'Beef Noodles', 1, 10, '2015-04-25 20:42:56', NULL),
(29, 10, 2, 'KimChee', 1, 11, '2015-04-25 20:53:30', NULL),
(30, 10, 2, 'Bean Sprout', 1, 12, '2015-04-25 20:54:27', NULL),
(31, 10, 2, 'Cauliflower', 1, 13, '2015-04-25 20:55:36', NULL),
(32, 11, 3, 'Chicken', 1, 1, '2015-04-25 21:17:49', NULL),
(33, 11, 3, 'Pork', 1, 2, '2015-04-25 21:18:07', NULL),
(34, 11, 3, 'Vege', 1, 3, '2015-04-25 21:18:24', NULL),
(35, 12, 3, 'Beer Chang', 1, 1, '2015-04-26 07:16:57', NULL),
(36, 12, 3, 'Thai Beer', 1, 2, '2015-04-26 07:17:17', NULL),
(37, 12, 3, 'Apple Wine', 1, 3, '2015-04-26 07:17:50', NULL),
(38, 13, 3, 'Vege Salad', 1, 8, '2015-04-26 10:10:30', NULL),
(39, 13, 3, 'Pork Salad', 1, 9, '2015-04-26 10:11:09', NULL),
(40, 13, 3, 'Fish Salad', 1, 10, '2015-04-26 10:11:36', NULL),
(41, 14, 3, 'Chicken Soup', 1, 10, '2015-04-26 18:51:49', NULL),
(42, 14, 3, 'Pork Soup', 1, 11, '2015-04-26 18:52:12', NULL),
(43, 14, 3, 'Duck Soup', 1, 12, '2015-04-26 18:52:40', NULL),
(44, 15, 4, 'Chicken', 1, 1, '2015-04-27 20:00:58', NULL),
(45, 15, 4, 'Fish', 1, 2, '2015-04-27 20:01:11', NULL),
(46, 15, 4, 'Prawn', 1, 3, '2015-04-27 20:01:38', NULL),
(47, 16, 4, 'Fish Sashimi', 1, 4, '2015-04-27 20:13:09', NULL),
(48, 16, 4, 'Mixed Sashimi', 1, 5, '2015-04-27 20:13:49', NULL),
(49, 16, 4, 'Prawn Sashimi', 1, 6, '2015-04-27 20:14:15', NULL),
(50, 17, 4, 'Egg Gohan', 1, 7, '2015-04-28 17:07:26', NULL),
(51, 17, 4, 'Vege Gohan', 1, 8, '2015-04-28 17:07:53', NULL),
(52, 17, 4, 'Plain Gohan', 1, 9, '2015-04-28 17:08:09', NULL),
(53, 18, 4, 'Iced', 1, 10, '2015-04-28 17:21:34', NULL),
(54, 18, 4, 'Drinks', 1, 11, '2015-04-28 17:22:38', NULL),
(55, 18, 4, 'Cakes', 1, 12, '2015-04-28 17:23:12', NULL),
(56, 19, 5, 'Chicken', 1, 1, '2015-04-29 05:23:58', NULL),
(57, 19, 5, 'Mutton', 1, 2, '2015-04-29 05:24:54', NULL),
(58, 19, 5, 'Vege', 1, 3, '2015-04-29 05:25:08', NULL),
(59, 20, 5, 'Plain Paratha', 1, 1, '2015-04-29 05:43:40', NULL),
(60, 20, 5, 'Chicken Paratha', 1, 2, '2015-04-29 05:44:13', NULL),
(61, 20, 5, 'Egg Paratha', 1, 3, '2015-04-29 05:45:06', NULL),
(62, 21, 6, 'Cheese Balls', 1, 1, '2015-04-29 07:30:37', NULL),
(63, 21, 6, 'Cheese Cakes', 1, 2, '2015-04-29 07:30:57', NULL),
(64, 21, 6, 'Vege Salads', 1, 3, '2015-04-29 07:31:40', NULL),
(65, 23, 6, 'Orange Juice', 1, 1, '2015-04-29 07:48:35', NULL),
(66, 23, 6, 'Apple Juice', 1, 2, '2015-04-29 07:49:09', NULL),
(67, 23, 6, 'Beer', 1, 3, '2015-04-29 07:49:30', NULL),
(68, 24, 7, 'Chicken Curry', 1, 1, '2015-04-29 08:10:50', NULL),
(69, 24, 7, 'Pork Curry', 1, 2, '2015-04-29 08:11:05', NULL),
(70, 24, 7, 'Fish Curry', 1, 3, '2015-04-29 08:11:21', NULL),
(71, 24, 7, 'Mutton Curry', 1, 4, '2015-04-29 08:11:53', NULL),
(72, 25, 7, 'Mote Hin Gar', 1, 4, '2015-04-29 08:13:26', NULL),
(73, 25, 7, 'Ar Thote', 1, 2, '2015-04-29 08:14:11', NULL),
(74, 25, 7, 'Nan Gyi Thote', 1, 7, '2015-04-29 08:15:01', NULL),
(75, 26, 8, 'Cappuccino', 1, 1, '2015-04-29 14:35:03', NULL),
(76, 26, 8, 'Latte', 1, 2, '2015-04-29 14:35:19', NULL),
(77, 26, 8, 'Espresso', 1, 3, '2015-04-29 14:35:44', NULL),
(78, 27, 8, 'Papara Juice', 1, 4, '2015-04-29 16:12:33', NULL),
(79, 27, 8, 'Apple Juice', 1, 5, '2015-04-29 16:13:42', NULL),
(80, 27, 8, 'Grape Juice', 1, 6, '2015-04-29 16:14:44', NULL),
(81, 28, 9, 'Chicken Dim Sum', 1, 1, '2015-04-29 16:35:32', NULL),
(82, 28, 9, 'Pork Dim Sum', 1, 2, '2015-04-29 16:35:52', NULL),
(83, 28, 9, 'Fish Dim Sum', 1, 3, '2015-04-29 16:36:08', NULL),
(84, 29, 9, 'Snake Soups', 1, 4, '2015-04-29 16:48:35', NULL),
(85, 29, 9, 'BakuTae', 1, 5, '2015-04-29 16:49:19', NULL),
(86, 29, 9, 'Pork Ribs Soups', 1, 6, '2015-04-29 16:49:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_touches`
--

CREATE TABLE `rt_touches` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `appuser_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_touches`
--

INSERT INTO `rt_touches` (`id`, `item_id`, `appuser_id`, `shop_id`, `added`) VALUES
(1, 72, 0, 1, '2015-04-25 19:30:20'),
(2, 1, 0, 1, '2015-05-04 06:32:50'),
(3, 1, 0, 1, '2015-05-05 15:49:56'),
(4, 9, 1, 1, '2015-05-05 15:50:43'),
(5, 1, 1, 1, '2015-05-05 15:50:50'),
(6, 1, 1, 1, '2015-05-05 15:56:22'),
(7, 1, 1, 1, '2015-05-05 15:57:38'),
(8, 1, 1, 1, '2015-05-05 16:14:04'),
(9, 1, 1, 1, '2015-05-05 16:21:51'),
(10, 1, 1, 1, '2015-05-05 16:28:32'),
(11, 1, 1, 1, '2015-05-05 16:30:10'),
(12, 1, 0, 1, '2015-05-05 16:32:50'),
(13, 1, 0, 1, '2015-05-05 16:41:53'),
(14, 1, 0, 1, '2015-05-05 16:45:55'),
(15, 1, 1, 1, '2015-05-05 16:56:12'),
(16, 1, 0, 1, '2015-05-05 17:47:15'),
(17, 1, 0, 1, '2015-05-05 18:03:57'),
(18, 1, 0, 1, '2015-05-08 16:23:23'),
(19, 54, 1, 1, '2015-05-08 18:12:28'),
(20, 75, 1, 2, '2015-05-09 14:05:07'),
(21, 76, 1, 2, '2015-05-09 14:05:14'),
(22, 81, 1, 2, '2015-05-09 14:05:21'),
(23, 120, 1, 3, '2015-05-09 15:39:52'),
(24, 42, 1, 1, '2015-05-09 15:41:00'),
(25, 55, 1, 1, '2015-05-09 15:41:12'),
(26, 55, 1, 1, '2015-05-09 15:41:37'),
(27, 2, 1, 1, '2015-05-09 16:00:55'),
(28, 2, 1, 1, '2015-05-09 18:03:27'),
(29, 9, 1, 1, '2015-05-09 18:04:15'),
(30, 65, 1, 1, '2015-05-09 18:04:51'),
(31, 54, 1, 1, '2015-05-09 18:12:36'),
(32, 58, 1, 1, '2015-05-09 18:13:24'),
(33, 1, 0, 1, '2015-05-10 18:09:33'),
(34, 1, 1, 1, '2015-05-12 15:40:40'),
(35, 1, 1, 1, '2015-05-12 15:55:20'),
(36, 1, 0, 1, '2015-05-12 15:57:16'),
(37, 1, 0, 1, '2015-05-12 16:00:02'),
(38, 1, 0, 1, '2015-05-12 16:01:18'),
(39, 1, 0, 1, '2015-05-12 16:18:42'),
(40, 1, 0, 1, '2015-05-12 16:54:57'),
(41, 1, 1, 1, '2015-05-12 17:03:07'),
(42, 1, 0, 1, '2015-05-12 17:09:06'),
(43, 1, 0, 1, '2015-05-12 17:11:51'),
(44, 1, 0, 1, '2015-05-12 17:29:21'),
(45, 1, 0, 1, '2015-05-12 17:33:27'),
(46, 22, 0, 1, '2015-05-12 17:34:27'),
(47, 22, 0, 1, '2015-05-12 17:36:08'),
(48, 22, 0, 1, '2015-05-12 17:40:04'),
(49, 1, 0, 1, '2015-05-12 18:00:03'),
(50, 1, 0, 1, '2015-05-12 18:19:59'),
(51, 1, 0, 1, '2015-05-12 18:28:57'),
(52, 1, 0, 1, '2015-05-12 18:31:25'),
(53, 1, 0, 1, '2015-05-12 18:36:09'),
(54, 1, 1, 1, '2015-05-13 16:51:02'),
(55, 233, 1, 5, '2015-05-13 16:51:19'),
(56, 75, 1, 2, '2015-05-14 17:36:28'),
(57, 75, 1, 2, '2015-05-14 17:50:34'),
(58, 76, 1, 2, '2015-05-14 17:51:30'),
(59, 77, 1, 2, '2015-05-14 17:51:56'),
(60, 81, 1, 2, '2015-05-14 17:52:31'),
(61, 124, 1, 3, '2015-05-14 18:47:28'),
(62, 125, 1, 3, '2015-05-14 18:48:00'),
(63, 138, 1, 3, '2015-05-14 18:48:30'),
(64, 137, 1, 3, '2015-05-14 18:49:22'),
(65, 163, 1, 4, '2015-05-14 18:54:11'),
(66, 164, 1, 4, '2015-05-14 18:54:56'),
(67, 168, 1, 4, '2015-05-14 18:55:23'),
(68, 190, 1, 4, '2015-05-14 18:56:02'),
(69, 196, 1, 4, '2015-05-14 18:56:07'),
(70, 218, 1, 5, '2015-05-14 19:00:37'),
(71, 219, 1, 5, '2015-05-14 19:01:04'),
(72, 234, 1, 5, '2015-05-14 19:01:38'),
(73, 233, 1, 5, '2015-05-14 19:02:09'),
(74, 264, 1, 6, '2015-05-14 19:05:47'),
(75, 263, 1, 6, '2015-05-14 19:06:15'),
(76, 249, 1, 6, '2015-05-14 19:06:45'),
(77, 250, 1, 6, '2015-05-14 19:07:18'),
(78, 248, 1, 6, '2015-05-14 19:11:54'),
(79, 281, 1, 7, '2015-05-14 19:12:40'),
(80, 297, 1, 7, '2015-05-14 19:14:02'),
(81, 310, 1, 8, '2015-05-14 19:21:43'),
(82, 325, 1, 8, '2015-05-14 19:22:57'),
(83, 326, 1, 8, '2015-05-14 19:23:39'),
(84, 341, 1, 9, '2015-05-14 19:30:25'),
(85, 354, 1, 9, '2015-05-14 19:31:29'),
(86, 353, 1, 9, '2015-05-14 19:32:07'),
(87, 1, 1, 1, '2015-05-15 14:34:14'),
(88, 1, 1, 1, '2015-05-15 14:39:42'),
(89, 1, 1, 1, '2015-05-15 14:40:36'),
(90, 1, 1, 1, '2015-05-15 14:40:39'),
(91, 1, 1, 1, '2015-05-15 14:42:01'),
(92, 23, 1, 1, '2015-05-15 15:39:53'),
(93, 23, 1, 1, '2015-05-15 15:41:23'),
(94, 2, 1, 1, '2015-05-15 15:42:23'),
(95, 3, 1, 1, '2015-05-15 15:42:30'),
(96, 1, 1, 1, '2015-05-15 16:24:26'),
(97, 63, 1, 1, '2015-05-15 16:25:19'),
(98, 75, 1, 2, '2015-05-15 16:26:06'),
(99, 76, 1, 2, '2015-05-15 16:26:16'),
(100, 78, 1, 2, '2015-05-15 16:26:21'),
(101, 7, 1, 1, '2015-05-15 16:28:12'),
(102, 33, 1, 1, '2015-05-15 16:35:40'),
(103, 125, 1, 3, '2015-05-15 16:37:55'),
(104, 126, 1, 3, '2015-05-15 16:38:06'),
(105, 2, 1, 1, '2015-05-15 16:50:51'),
(106, 9, 1, 1, '2015-05-15 16:50:55'),
(107, 55, 1, 1, '2015-05-15 16:51:44'),
(108, 54, 1, 1, '2015-05-15 16:51:49'),
(109, 167, 1, 4, '2015-05-15 18:02:47'),
(110, 22, 1, 1, '2015-05-15 18:05:00'),
(111, 23, 1, 1, '2015-05-15 18:05:06'),
(112, 281, 1, 7, '2015-05-15 18:16:11'),
(113, 218, 1, 5, '2015-05-15 18:18:18'),
(114, 224, 1, 5, '2015-05-15 18:18:27'),
(115, 75, 1, 2, '2015-05-15 20:41:16'),
(116, 80, 1, 2, '2015-05-15 20:50:01'),
(117, 253, 1, 6, '2015-05-15 20:54:07'),
(118, 253, 1, 6, '2015-05-15 20:54:58'),
(119, 14, 0, 1, '2015-05-16 07:02:32'),
(120, 17, 0, 1, '2015-05-18 15:00:00'),
(121, 1, 1, 1, '2015-05-18 15:00:44'),
(122, 54, 1, 1, '2015-05-18 15:00:56'),
(123, 1, 0, 1, '2015-05-18 16:15:26'),
(124, 1, 0, 1, '2015-06-14 15:33:36'),
(125, 1, 0, 1, '2015-07-07 07:44:57'),
(126, 2, 0, 1, '2015-07-19 12:49:11'),
(127, 1, 0, 1, '2015-07-20 19:13:22'),
(128, 2, 0, 1, '2015-07-29 14:31:34'),
(129, 23, 1, 1, '2015-07-29 14:32:24'),
(130, 23, 1, 1, '2015-07-29 14:35:09'),
(131, 23, 1, 1, '2015-07-29 14:36:57'),
(132, 1, 0, 1, '2015-08-07 15:01:47'),
(133, 8, 0, 1, '2016-05-18 16:25:39'),
(134, 1, 0, 1, '2017-09-03 08:11:44'),
(135, 278, 0, 7, '2017-09-03 09:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `rt_transaction_detail`
--

CREATE TABLE `rt_transaction_detail` (
  `id` int(11) NOT NULL,
  `transaction_header_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_attribute` varchar(255) NOT NULL,
  `unit_price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `discount_percent` float NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_transaction_detail`
--

INSERT INTO `rt_transaction_detail` (`id`, `transaction_header_id`, `shop_id`, `item_id`, `item_name`, `item_attribute`, `unit_price`, `qty`, `discount_percent`, `added`) VALUES
(1, 1, 1, 1, 'Sushi Rolls 1  ', 'Sizes : Small', 10, 1, 0, '2015-05-09 14:04:06'),
(2, 2, 2, 75, 'Brisket 1  ', '', 14, 1, 0, '2015-05-09 14:06:19'),
(3, 2, 2, 76, 'Brisket 2  ', '', 14, 1, 0, '2015-05-09 14:06:19'),
(4, 2, 2, 81, 'Meat 2  ', '', 10, 1, 0, '2015-05-09 14:06:19'),
(5, 3, 1, 1, 'Sushi Rolls 1  ', 'Sizes : Small', 16, 1, 0, '2015-05-09 18:06:08'),
(6, 3, 1, 65, 'Hot 1  ', '', 9, 1, 0, '2015-05-09 18:06:08'),
(7, 4, 1, 22, 'Chicken Noddle 1  ', '', 5, 1, 0, '2015-05-15 18:46:16'),
(8, 4, 1, 23, 'Chicken Noddle 2  ', '', 5, 1, 0, '2015-05-15 18:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `rt_transaction_header`
--

CREATE TABLE `rt_transaction_header` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `paypal_trans_id` varchar(255) NOT NULL,
  `total_amount` float NOT NULL,
  `delivery_address` text NOT NULL,
  `billing_address` text NOT NULL,
  `transaction_status` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `coupon_discount_amount` float NOT NULL,
  `flat_rate_shipping` float NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_transaction_header`
--

INSERT INTO `rt_transaction_header` (`id`, `shop_id`, `user_id`, `paypal_trans_id`, `total_amount`, `delivery_address`, `billing_address`, `transaction_status`, `email`, `phone`, `payment_method`, `coupon_discount_amount`, `flat_rate_shipping`, `added`) VALUES
(1, 1, 1, '', 40, 'No-1, School Road, Yangon Myanmar', 'No-2, River Road, Yangon Myanmar', 1, 'pphmit@gmail.com', '34535', 'cod', 0, 30, '2015-05-09 14:04:06'),
(2, 2, 1, '', 63, 'No-1, School Road, Yangon Myanmar', 'No-2, River Road, Yangon Myanmar', 1, 'pphmit@gmail.com', '838345', 'cod', 0, 25, '2015-05-09 14:06:19'),
(3, 1, 1, '', 55, 'No-1, School Road, Yangon Myanmar', 'No-2, River Road, Yangon Myanmar', 1, 'pphmit@gmail.com', '214214', 'bank', 0, 30, '2015-05-09 18:06:08'),
(4, 1, 1, '27892', 10, 'No-1, School Road, Yangon Myanmar', 'No-2, River Road, Yangon Myanmar', 2, 'pphmit@gmail.com', '23424', 'paypal', 0, 30, '2015-05-15 18:46:16');

-- --------------------------------------------------------

--
-- Table structure for table `rt_transaction_status`
--

CREATE TABLE `rt_transaction_status` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_transaction_status`
--

INSERT INTO `rt_transaction_status` (`id`, `title`) VALUES
(1, 'Pending'),
(2, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `user_devices`
--

CREATE TABLE `user_devices` (
  `id` int(11) NOT NULL,
  `DeviceTypeId` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `UserId` int(11) NOT NULL,
  `DeviceToken` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `be_modules`
--
ALTER TABLE `be_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `be_roles`
--
ALTER TABLE `be_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `be_users`
--
ALTER TABLE `be_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `rt_appusers`
--
ALTER TABLE `rt_appusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_branding`
--
ALTER TABLE `rt_branding`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_categories`
--
ALTER TABLE `rt_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_codes`
--
ALTER TABLE `rt_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_contactus`
--
ALTER TABLE `rt_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_coupons`
--
ALTER TABLE `rt_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_discount_type`
--
ALTER TABLE `rt_discount_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_favourites`
--
ALTER TABLE `rt_favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_feeds`
--
ALTER TABLE `rt_feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_follows`
--
ALTER TABLE `rt_follows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_images`
--
ALTER TABLE `rt_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_inquiries`
--
ALTER TABLE `rt_inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_items`
--
ALTER TABLE `rt_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_items_attributes_detail`
--
ALTER TABLE `rt_items_attributes_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_items_attributes_header`
--
ALTER TABLE `rt_items_attributes_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_likes`
--
ALTER TABLE `rt_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_ratings`
--
ALTER TABLE `rt_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_reservation`
--
ALTER TABLE `rt_reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_reservation_status`
--
ALTER TABLE `rt_reservation_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_reviews`
--
ALTER TABLE `rt_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_shops`
--
ALTER TABLE `rt_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_sub_categories`
--
ALTER TABLE `rt_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_touches`
--
ALTER TABLE `rt_touches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_transaction_detail`
--
ALTER TABLE `rt_transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_transaction_header`
--
ALTER TABLE `rt_transaction_header`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rt_transaction_status`
--
ALTER TABLE `rt_transaction_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `be_modules`
--
ALTER TABLE `be_modules`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `be_roles`
--
ALTER TABLE `be_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `be_users`
--
ALTER TABLE `be_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rt_appusers`
--
ALTER TABLE `rt_appusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `rt_branding`
--
ALTER TABLE `rt_branding`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rt_categories`
--
ALTER TABLE `rt_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `rt_codes`
--
ALTER TABLE `rt_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_contactus`
--
ALTER TABLE `rt_contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rt_coupons`
--
ALTER TABLE `rt_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `rt_discount_type`
--
ALTER TABLE `rt_discount_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `rt_favourites`
--
ALTER TABLE `rt_favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `rt_feeds`
--
ALTER TABLE `rt_feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rt_follows`
--
ALTER TABLE `rt_follows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `rt_images`
--
ALTER TABLE `rt_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=938;
--
-- AUTO_INCREMENT for table `rt_inquiries`
--
ALTER TABLE `rt_inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `rt_items`
--
ALTER TABLE `rt_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=371;
--
-- AUTO_INCREMENT for table `rt_items_attributes_detail`
--
ALTER TABLE `rt_items_attributes_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `rt_items_attributes_header`
--
ALTER TABLE `rt_items_attributes_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rt_likes`
--
ALTER TABLE `rt_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rt_ratings`
--
ALTER TABLE `rt_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rt_reservation`
--
ALTER TABLE `rt_reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `rt_reservation_status`
--
ALTER TABLE `rt_reservation_status`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rt_reviews`
--
ALTER TABLE `rt_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `rt_shops`
--
ALTER TABLE `rt_shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `rt_sub_categories`
--
ALTER TABLE `rt_sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `rt_touches`
--
ALTER TABLE `rt_touches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT for table `rt_transaction_detail`
--
ALTER TABLE `rt_transaction_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `rt_transaction_header`
--
ALTER TABLE `rt_transaction_header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `rt_transaction_status`
--
ALTER TABLE `rt_transaction_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
