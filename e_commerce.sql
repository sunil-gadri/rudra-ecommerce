-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2026 at 06:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_tbl`
--

CREATE TABLE `address_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address_type` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address_tbl`
--

INSERT INTO `address_tbl` (`id`, `customer_id`, `full_name`, `phone`, `email`, `building`, `street_address`, `city`, `state`, `postal_code`, `country`, `address_type`, `is_default`, `created_at`, `updated_at`) VALUES
(6, 1, 'Sunil Gadri', '07737033516', 'sunilgadri4747@gmail.com', 'new', 'Jal Path Mansarovar Sector 8 Mansarovar', 'Jaipur', 'Rajasthan', '302020', 'India', 'Home', 1, '2026-02-02 07:06:18', '2026-02-02 07:06:30');

-- --------------------------------------------------------

--
-- Table structure for table `brand_tbl`
--

CREATE TABLE `brand_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manufacturer_name` varchar(255) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand_tbl`
--

INSERT INTO `brand_tbl` (`id`, `manufacturer_name`, `brand_name`, `created_at`) VALUES
(1, 'Test pvt. ltd.', 'Hello', '2026-01-29 01:20:28'),
(2, 'Donear pvt. ltd', 'Hii', '2026-01-29 01:20:53'),
(3, 'Test pvt. ltd.', 'Lime', '2026-01-29 01:21:30'),
(4, 'Demo. pvt', 'Sample', '2026-01-29 01:21:54'),
(5, 'Test pvt. ltd.', 'Test', '2026-01-29 01:22:22'),
(6, 'Test pvt. ltd.', 'Test2', '2026-01-29 01:22:32'),
(9, 'Infomagine', 'Infomagine', '2026-01-31 00:49:35');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_tbl`
--

CREATE TABLE `cart_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `coupon_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_tbl`
--

INSERT INTO `cart_tbl` (`id`, `customer_id`, `product_id`, `quantity`, `coupon_code`, `created_at`) VALUES
(23, 1, 191, 1, NULL, '2026-02-04 04:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `category_tbl`
--

CREATE TABLE `category_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_category` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_tbl`
--

INSERT INTO `category_tbl` (`id`, `name`, `description`, `parent_category`, `status`, `image`, `created_at`) VALUES
(1, 'Quilt', 'Quilt', 10, 'Active', 'b16f8000-e017-42d0-a92c-86b1377efa0b.png', '2025-08-28 00:14:13'),
(3, 'Stoles', 'Stoles', 6, 'Active', '1d3ab14dbae74809a3de273909090b5e.jpg', '2025-08-28 00:15:25'),
(7, 'Shawls', 'Shawls', 6, 'Active', '90a1e2e8459445fdb03b4233c499bb23.jpg', '2025-08-31 22:41:49'),
(8, 'Pillows', 'Pillows', 7, 'Active', '6e93ed7501df424f9ab7d7c854e04561.jpg', '2025-08-31 22:43:14'),
(10, 'Blanket', 'Blanket', 7, 'Active', '1a31df1633ac4322bdd424e5b413acc8.jpg', '2025-09-04 04:33:15'),
(20, 'Bed Sheets', 'Bed Sheets', 7, 'Active', 'bfe2edede9894f77b5e58f9436972e12.jpg', '2025-09-09 06:58:55'),
(21, 'Table', 'Table', 7, 'Active', '48c6ad038fde4a46867f8464cd5209e2.jpg', '2025-09-09 07:13:09'),
(30, 'Dohars', 'Dohars', 6, 'Active', 'e3a8cb4caeb949d689e9967f34b1a506.png', '2025-11-17 02:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_tbl`
--

CREATE TABLE `coupon_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `coupon_type` varchar(255) NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `coupon_title` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_tbl`
--

CREATE TABLE `customer_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_tbl`
--

INSERT INTO `customer_tbl` (`id`, `first_name`, `last_name`, `phone`, `email`, `password`, `gender`, `status`, `profile_image`, `created_at`, `updated_at`) VALUES
(1, 'Sunil', 'Purbiya gadri', '7737033516', 'sunilgadri4747@gmail.com', '$2y$12$2IaElDB8Ak6uWNPGcXdPp.X1KHC8GAWco924brT//U.f/rUQGgDba', 'male', 'active', '1770121002_6981e72a43d6e.png', '2026-01-29 02:55:01', '2026-02-03 12:16:42'),
(13, 'Sunil', 'Gadri', '7737033599', 'sunilgadri@gmail.com', '$2y$12$PgOALXsp2T0Pj1H66NZZAO9UBDS4Y1B/q8U6NeRIJekhLynZgoNHS', 'male', 'active', '1770119829_6981e295e287f.jpg', '2026-02-03 11:55:19', '2026-02-03 11:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gst_tbl`
--

CREATE TABLE `gst_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gst` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gst_tbl`
--

INSERT INTO `gst_tbl` (`id`, `gst`, `created_at`) VALUES
(4, '5', '2025-11-07 06:46:07'),
(5, '22', '2025-11-07 06:46:11');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_tbl`
--

CREATE TABLE `invoice_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_tbl`
--

INSERT INTO `invoice_tbl` (`id`, `order_id`, `invoice_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'RUDRA-00001', '2026-01-29 03:26:26', '2026-01-29 03:26:26'),
(2, 2, 'RUDRA-00002', '2026-01-29 03:46:41', '2026-01-29 03:46:41'),
(8, 8, 'RUDRA-00008', '2026-02-01 22:51:59', '2026-02-01 22:51:59'),
(9, 9, 'RUDRA-00009', '2026-02-01 22:53:41', '2026-02-01 22:53:41'),
(10, 10, 'RUDRA-00010', '2026-02-02 03:49:43', '2026-02-02 03:49:43'),
(11, 11, 'RUDRA-00011', '2026-02-02 03:52:02', '2026-02-02 03:52:02'),
(12, 12, 'RUDRA-00012', '2026-02-02 07:06:49', '2026-02-02 07:06:49');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer_tbl`
--

CREATE TABLE `manufacturer_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manufacturer_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturer_tbl`
--

INSERT INTO `manufacturer_tbl` (`id`, `manufacturer_name`, `image`, `created_at`) VALUES
(1, 'Donear pvt. ltd', 'donear-pvt-ltd_1769669232.jpg', '2026-01-29 01:17:12'),
(2, 'Traders pvt', 'traders-pvt_1769669294.jpg', '2026-01-29 01:18:14'),
(3, 'Test pvt. ltd.', 'test-pvt-ltd_1769669309.png', '2026-01-29 01:18:29'),
(4, 'Hi', 'hi_1769669355.jpg', '2026-01-29 01:19:15'),
(5, 'Demo. pvt', 'demo-pvt_1769669385.png', '2026-01-29 01:19:45');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2026_01_09_042816_create_product_size_tbl', 1),
(4, '2026_01_09_043950_create_product_pattern_tbl', 1),
(5, '2026_01_09_044151_create_product_color_tbl', 1),
(6, '2026_01_09_063937_create_gst_tbl', 1),
(7, '2026_01_09_070625_create_specification_heading_tbl', 1),
(8, '2026_01_09_071657_create_specification_tbl', 1),
(9, '2026_01_09_080000_create_parent_category_tbl', 1),
(10, '2026_01_09_084039_create_manufacturer_tbl', 1),
(11, '2026_01_09_084811_create_brand_tbl', 1),
(12, '2026_01_09_090955_create_category_tbl', 1),
(13, '2026_01_09_105341_create_product_tbl', 1),
(14, '2026_01_09_105342_create_product_attributes_tbl', 1),
(15, '2026_01_09_105343_create_product_general_info_tbl', 1),
(16, '2026_01_09_105344_create_product_meta_tbl', 1),
(17, '2026_01_09_105345_create_product_images_tbl', 1),
(18, '2026_01_12_052216_create_product_tbl', 1),
(19, '2026_01_12_101923_create_slider_tbl', 1),
(20, '2026_01_13_050506_create_user_tbl', 1),
(21, '2026_01_13_051639_create_customer_tbl', 1),
(22, '2026_01_28_104905_create_wishlists_table', 1),
(23, '2026_01_28_123638_create_cart_tbl_table', 1),
(24, '2026_01_28_124226_create_address_tbl_table', 1),
(25, '2026_01_29_044512_create_order_tbl_table', 1),
(26, '2026_01_29_044513_create_order_item_tbl_table', 1),
(27, '2026_01_29_044514_create_invoice_tbl_table', 1),
(28, '2026_01_29_115726_create_offers_tbl_table', 2),
(29, '2026_01_29_115728_create_offer_detail_tbl_table', 2),
(30, '2026_01_29_121927_create_coupon_tbl_table', 3),
(31, '2026_01_30_103550_create_coupon_tbl_table', 4),
(32, '2026_01_30_111133_create_coupon_tbl_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `offers_tbl`
--

CREATE TABLE `offers_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers_tbl`
--

INSERT INTO `offers_tbl` (`id`, `heading`, `key`, `price`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'test', 'new', 1998.00, 39.00, '2026-01-29 06:32:18', '2026-01-29 06:32:18'),
(3, 'news', 'news', 3396.00, 33.00, '2026-01-30 01:12:58', '2026-01-30 01:12:58');

-- --------------------------------------------------------

--
-- Table structure for table `offer_detail_tbl`
--

CREATE TABLE `offer_detail_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED NOT NULL,
  `text1` varchar(255) DEFAULT NULL,
  `text2` varchar(255) DEFAULT NULL,
  `product_category_ids` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `details_heading` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer_detail_tbl`
--

INSERT INTO `offer_detail_tbl` (`id`, `offer_id`, `text1`, `text2`, `product_category_ids`, `image`, `details_heading`, `created_at`, `updated_at`) VALUES
(1, 1, '30', 'djsdsss', '10', '2f5154fb-4f3b-4ca3-990c-69db60e2d2c1_1769688141.jpg', 'dfasd', NULL, NULL),
(2, 3, '50', 'fashon', '8', 'b977e25f-7a81-4e27-baed-d6753687f862_1769755380.jpg', 'mega sell', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_item_tbl`
--

CREATE TABLE `order_item_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `base_price` decimal(15,2) NOT NULL,
  `discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discounted_price` decimal(15,2) NOT NULL,
  `tax` decimal(15,2) NOT NULL DEFAULT 0.00,
  `quantity` int(10) UNSIGNED NOT NULL,
  `product_size` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `product_color` varchar(255) DEFAULT NULL,
  `product_pattern` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_item_tbl`
--

INSERT INTO `order_item_tbl` (`id`, `order_id`, `product_id`, `product_name`, `product_description`, `price`, `base_price`, `discount`, `discounted_price`, `tax`, `quantity`, `product_size`, `category`, `product_color`, `product_pattern`, `created_at`, `updated_at`) VALUES
(8, 8, 184, 'PASHAM Solid Taupe Shawl with Woven Border Detail', 'The ultimate in understated elegance by PASHAM. This soft, substantial shawl comes in a versatile, solid taupe or khaki color, perfect for layering. It is subtly accented with a narrow, intricately woven geometric border near the edges and finished with soft fringe. A timeless piece providing sophisticated warmth and effortless style.\r\n', 1800.00, 1714.29, 40.00, 1080.00, 5.00, 1, NULL, '', 'Gray', '', '2026-02-01 22:52:00', '2026-02-01 22:52:00'),
(9, 9, 184, 'PASHAM Solid Taupe Shawl with Woven Border Detail', 'The ultimate in understated elegance by PASHAM. This soft, substantial shawl comes in a versatile, solid taupe or khaki color, perfect for layering. It is subtly accented with a narrow, intricately woven geometric border near the edges and finished with soft fringe. A timeless piece providing sophisticated warmth and effortless style.\r\n', 1800.00, 1714.29, 40.00, 1080.00, 5.00, 1, NULL, '', 'Gray', '', '2026-02-01 22:53:41', '2026-02-01 22:53:41'),
(10, 10, 180, 'Wool Shawl with Intricate Border Weave', 'Wrap yourself in the timeless elegance of this soft, luxurious shawl. The neutral Camel Tan body is beautifully contrasted with wide, intricate borders featuring traditional Paisley (or Kani/Jamawar) patterns in rich, muted tones of red, blue, and cream. Perfect for formal occasions or adding sophisticated warmth to your winter wardrobe.\r\n', 10000.00, 9523.81, 40.00, 6000.00, 5.00, 1, '10 x 12 x 12 m', '', 'Gray', '', '2026-02-02 03:49:43', '2026-02-02 03:49:43'),
(11, 11, 177, 'Charcoal Geometric Print Scarf', 'Elevate your everyday look with this sophisticated scarf featuring a muted taupe-gray body. The ends are beautifully accented with a handcrafted pattern of earthy brown, cream, and charcoal stripes and bold geometric triangles. Its natural color palette and soft texture make it a versatile, year-round accessory perfect for complementing both casual and formal attire.\r\n', 4000.00, 3809.52, 50.00, 2000.00, 5.00, 1, '20 x 20 x 10 cm', '', 'Gray', 'Sample', '2026-02-02 03:52:02', '2026-02-02 03:52:02'),
(12, 12, 184, 'PASHAM Solid Taupe Shawl with Woven Border Detail', 'The ultimate in understated elegance by PASHAM. This soft, substantial shawl comes in a versatile, solid taupe or khaki color, perfect for layering. It is subtly accented with a narrow, intricately woven geometric border near the edges and finished with soft fringe. A timeless piece providing sophisticated warmth and effortless style.\r\n', 1800.00, 1714.29, 40.00, 1080.00, 5.00, 1, NULL, '', 'Gray', '', '2026-02-02 07:06:49', '2026-02-02 07:06:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `total_discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `order_amount` decimal(15,2) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_discount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `razorpay_order_id` varchar(255) DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_signature` text DEFAULT NULL,
  `order_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `shipping_name` varchar(255) DEFAULT NULL,
  `shipping_phone` varchar(255) DEFAULT NULL,
  `shipping_email` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`id`, `customer_id`, `total_amount`, `total_discount`, `order_amount`, `coupon_code`, `coupon_discount`, `status`, `payment_status`, `razorpay_order_id`, `razorpay_payment_id`, `razorpay_signature`, `order_at`, `updated_at`, `shipping_name`, `shipping_phone`, `shipping_email`, `building`, `street_address`, `city`, `state`, `postal_code`, `country`, `address_type`, `shipping_cost`) VALUES
(1, 1, 15000.00, 10000.00, 25000.00, NULL, 0.00, 'confirmed', 'paid', 'order_S9dUzB9VX3yfs4', 'pay_S9dVFnEhdBBhiu', '4b298a0fa95da2c574fa84ee1e66019de1924f4b28651772b137ebf3196b7eea', '2026-01-29 03:26:26', '2026-01-29 03:26:59', 'Sunil Gadri', '07737033516', 'sunilgadri4747@gmail.com', 'new', 'Jal Path Mansarovar Sector 8 Mansarovar', 'Jaipur', 'Rajasthan', '302020', 'India', 'Home', 0.00),
(2, 1, 15000.00, 10000.00, 25000.00, NULL, 0.00, 'confirmed', 'paid', 'order_S9dqNs0WLwpvO0', 'pay_S9dqZXSaZpssqq', '3d0ee2b9b7bb25303b30d54a4aa68cb43c34a32331a099d5de0c7db6bb22730b', '2026-01-29 03:46:41', '2026-01-29 03:47:09', 'Sunil Gadri', '07737033516', 'sunilgadri4747@gmail.com', 'new', 'Jal Path Mansarovar Sector 8 Mansarovar', 'Jaipur', 'Rajasthan', '302020', 'India', 'Home', 0.00),
(8, 1, 1080.00, 720.00, 1800.00, NULL, 0.00, 'shipped', 'paid', 'order_SB8xZmGj2Ej5jz', 'pay_SB8yPXCGEKrGjG', 'e655217c67c5509e1f16bfb44956b08185fba4dd760e9e07c56ec88997de1c27', '2026-02-01 22:51:59', '2026-02-03 01:50:40', 'Sunil Gadri', '07737033516', 'sunilgadri4747@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00),
(9, 1, 1080.00, 720.00, 1800.00, NULL, 0.00, 'pending', 'unpaid', 'order_SB8zKNDEi7fifJ', NULL, NULL, '2026-02-01 22:53:41', '2026-02-02 04:23:42', 'Sunil Gadri', '07737033516', 'sunilgadri4747@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00),
(10, 1, 6000.00, 4000.00, 10000.00, NULL, 0.00, 'shipped', 'paid', 'order_SBE240oeSgqa1D', 'pay_SBE2GLmoYUiitm', 'cdd239548bb6617d2bd0e963b3e6f9857c0432d221643e088b998715585de97d', '2026-02-02 03:49:43', '2026-02-03 01:50:33', 'Sunil Gadri', '07737033516', 'sunilgadri4747@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00),
(11, 1, 2000.00, 2000.00, 4000.00, NULL, 0.00, 'cancelled', 'paid', 'order_SBE4U1vQ7cqfg0', 'pay_SBE4gIVHdQxPPV', 'ca54129e5eb1646f3d25d4b7f2e19e651e7c45b80ddf58f2e03880054b5a075b', '2026-02-02 03:52:02', '2026-02-03 01:50:30', 'Sunil Gadri', '07737033516', 'sunilgadri4747@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00),
(12, 1, 1080.00, 720.00, 1800.00, NULL, 0.00, 'cancelled', 'paid', 'order_SBHOG2v3zG0WG3', 'pay_SBHOl0PSU7gkG8', 'd06bcc27bf17fc34add52286dca2c01513200facfb9bae9fdf3a9dd6a681bcda', '2026-02-02 07:06:49', '2026-02-03 01:50:26', 'Sunil Gadri', '07737033516', 'sunilgadri4747@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `parent_category_tbl`
--

CREATE TABLE `parent_category_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parent_category_tbl`
--

INSERT INTO `parent_category_tbl` (`id`, `name`, `created_at`) VALUES
(1, 'Textile', '2025-08-25 01:50:01'),
(6, 'Clothing', '2025-09-08 00:41:43'),
(7, 'Home Furnishing', '2025-09-08 00:42:32'),
(9, 'Decorations', '2025-09-16 05:39:28'),
(10, 'Test', '2025-09-18 22:53:56'),
(11, 'Demo', '2025-09-25 00:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes_tbl`
--

CREATE TABLE `product_attributes_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `product_color` varchar(255) DEFAULT NULL,
  `product_pattern` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `width` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes_tbl`
--

INSERT INTO `product_attributes_tbl` (`id`, `product_id`, `unit`, `category`, `product_color`, `product_pattern`, `length`, `width`, `height`) VALUES
(146, 146, '', '', 'Blue', 'Floral', '0', '0', '0'),
(147, 147, '', '', 'Blue', 'Floral', '0', '0', '0'),
(148, 148, '', '', 'Yellow', 'Floral', '0', '0', '0'),
(149, 149, '', '', 'Gray', 'Floral', '0', '0', '0'),
(150, 150, '', '', 'Gray', 'Floral', '0', '0', '0'),
(151, 151, '', '', 'Gray', 'Test', '0', '0', '0'),
(152, 152, '', '', 'Red', '', '0', '0', '0'),
(153, 153, '', '', 'Red', 'Test', '0', '0', '0'),
(158, 158, '', '', 'Purple', 'Test', '0', '0', '0'),
(160, 160, '', 'xl', 'Yellow', 'Test', '0', '0', '0'),
(161, 161, '', 'XXL', 'Gray', 'Sample', '0', '0', '0'),
(162, 162, '', 'm', 'Blue', 'Sample', '0', '0', '0'),
(163, 163, '', 'XXL', 'Gray', 'Sample', '0', '0', '0'),
(164, 164, '', 'l', 'Gray', 'Sample', '0', '0', '0'),
(165, 165, '', 'XXL', 'Blue', 'Sample', '0', '0', '0'),
(174, 174, 'cm', '', 'Purple', 'Test', '12', '25', '5'),
(175, 175, 'cm', '', 'Gray', 'Sample', '15', '10', '5'),
(176, 176, 'mm', '', 'Gray', 'Sample', '13', '5', '8'),
(177, 177, 'cm', '', 'Gray', 'Sample', '20', '20', '10'),
(178, 178, 'm', '', 'Red', 'Sample', '12', '12', '12'),
(179, 179, 'm', '', 'Red', 'Sample', '1.5', '1.5', '1.5'),
(180, 180, 'm', '', 'Gray', '', '10', '12', '12'),
(181, 181, 'cm', '', 'Red', '', '12', '12', '12'),
(182, 182, '', '', 'Gray', 'Sample', '0', '0', '0'),
(183, 183, '', '', 'Purple', 'Sample', '0', '0', '0'),
(184, 184, NULL, NULL, 'Gray', NULL, '0', '0', '0'),
(191, 191, 'cm', 'm', 'Gray', 'Geometric', '33', '33', '22');

-- --------------------------------------------------------

--
-- Table structure for table `product_color_tbl`
--

CREATE TABLE `product_color_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_name` varchar(50) DEFAULT NULL,
  `hex_value` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_color_tbl`
--

INSERT INTO `product_color_tbl` (`id`, `color_name`, `hex_value`, `created_at`) VALUES
(4, 'Purple', '#ae01fe', '2025-09-01 00:08:05'),
(5, 'Gray', '#999999', '2025-09-01 00:08:37'),
(6, 'Red', '#ff0000', '2025-09-01 00:12:12'),
(8, 'Yellow', '#ffdd00', '2025-09-01 00:15:45'),
(9, 'Blue', '#0b53f9', '2025-09-04 03:12:40'),
(10, 'Green', '#00ff59', '2025-09-04 03:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_description_tbl`
--

CREATE TABLE `product_description_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `overview` text DEFAULT NULL,
  `disclaimer` text DEFAULT NULL,
  `specifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`specifications`)),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_description_tbl`
--

INSERT INTO `product_description_tbl` (`id`, `product_id`, `overview`, `disclaimer`, `specifications`, `created_at`) VALUES
(16, 148, 'Handcrafted Jaipuri Block Print Cotton King Size Bedsheet Set brings authentic Rajasthani artistry to your home. Made from premium 100% cotton fabric and decorated with traditional hand block prints, this bedsheet set offers superior comfort, vibrant patterns, and long-lasting quality. Ideal for king-size beds, it enhances your bedroom with a touch of ethnic elegance and craftsmanship.', 'Experience the charm of Jaipur’s timeless textile heritage with this Handcrafted Jaipuri Block Print Cotton King Size Bedsheet Set. Every bedsheet is uniquely crafted using age-old wooden hand blocks by skilled artisans of Rajasthan. The soft, breathable cotton ensures a cool and comfortable sleep, while the handcrafted patterns add a rich cultural appeal to your space.  The set includes a king-size bedsheet and matching pillow covers, designed with fine detailing and fast colors that stay vibrant even after multiple washes. Perfect for everyday use, gifting, or festive décor.', '{\"Care Instructions\": {\"DryClean\": \"Not required\", \"Wash Care\": \"Machine wash separately\"}, \"Dimensions\": {\"Bedsheet Length\": \"108 inches\", \"Bedsheet Size\": \"King\", \"Bedsheet Width\": \"108 inches\"}, \"Features\": {\"Eco Friendly\": \"Yes\", \"Machine Washable\": \"Yes\", \"Type\": \"Flat Bedsheet\"}, \"General\": {\"Brand\": \"Home Classic\", \"Collection\": \"Premium Cotton\", \"Country Of Origin\": \"India\", \"Material\": \"100% Cotton\"}, \"Packaging\": {\"Package Dimensions\": \"35 x 30 x 5 cm\", \"Package Weight\": \"950 grams\"}}', '2025-11-21 00:48:36'),
(18, 185, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Dimensions\": \"30 x 25 x 5 cm\", \"Package Weight\": \"300 grams\"}}', '2025-11-21 01:21:06'),
(19, 149, 'The Royal Blue Embroidered Silk Bedspread Set is a luxurious blend of elegance, craftsmanship, and premium comfort. Crafted from rich silk fabric and adorned with intricate embroidery, this bedspread brings a royal touch to any bedroom. Its vibrant royal-blue shade adds sophistication, while the detailed handcrafted work elevates your décor instantly.', 'Transform your bedroom into a space of timeless luxury with the Royal Blue Embroidered Silk Bedspread Set. Made from high-quality silk, this bedspread features beautifully detailed embroidery crafted by skilled artisans. The smooth, glossy texture of the silk fabric enhances the richness of the royal-blue color, making it a perfect centerpiece for your bed.', '{\"Care Instructions\": {\"DryClean\": \"Not required\", \"Wash Care\": \"Machine wash separately\"}, \"Dimensions\": {\"Bedsheet Length\": \"108 inches\", \"Bedsheet Size\": \"King\", \"Bedsheet Width\": \"108 inches\"}, \"Features\": {\"Eco Friendly\": \"Yes\", \"Machine Washable\": \"Yes\", \"Type\": \"Flat Bedsheet\"}, \"General\": {\"Brand\": \"Home Classic\", \"Collection\": \"Premium Cotton\", \"Country Of Origin\": \"India\", \"Material\": \"100% Cotton\"}, \"Packaging\": {\"Package Dimensions\": \"35 x 30 x 5 cm\", \"Package Weight\": \"950 grams\"}}', '2025-11-21 00:48:36'),
(20, 150, 'The Royal Blue Embroidered Silk Bedspread Set is a luxurious blend of elegance, craftsmanship, and premium comfort. Crafted from rich silk fabric and adorned with intricate embroidery, this bedspread brings a royal touch to any bedroom. Its vibrant royal-blue shade adds sophistication, while the detailed handcrafted work elevates your décor instantly.', 'Transform your bedroom into a space of timeless luxury with the Royal Blue Embroidered Silk Bedspread Set. Made from high-quality silk, this bedspread features beautifully detailed embroidery crafted by skilled artisans. The smooth, glossy texture of the silk fabric enhances the richness of the royal-blue color, making it a perfect centerpiece for your bed.', '{\"Care Instructions\": {\"DryClean\": \"Not required\", \"Wash Care\": \"Machine wash separately\"}, \"Dimensions\": {\"Bedsheet Length\": \"108 inches\", \"Bedsheet Size\": \"King\", \"Bedsheet Width\": \"108 inches\"}, \"Features\": {\"Eco Friendly\": \"Yes\", \"Machine Washable\": \"Yes\", \"Type\": \"Flat Bedsheet\"}, \"General\": {\"Brand\": \"Home Classic\", \"Collection\": \"Premium Cotton\", \"Country Of Origin\": \"India\", \"Material\": \"100% Cotton\"}, \"Packaging\": {\"Package Dimensions\": \"35 x 30 x 5 cm\", \"Package Weight\": \"950 grams\"}}', '2025-11-21 00:48:36'),
(21, 160, 'The Royal Blue Embroidered Silk Bedspread Set is a luxurious blend of elegance, craftsmanship, and premium comfort. Crafted from rich silk fabric and adorned with intricate embroidery, this bedspread brings a royal touch to any bedroom. Its vibrant royal-blue shade adds sophistication, while the detailed handcrafted work elevates your décor instantly.', 'Transform your bedroom into a space of timeless luxury with the Royal Blue Embroidered Silk Bedspread Set. Made from high-quality silk, this bedspread features beautifully detailed embroidery crafted by skilled artisans. The smooth, glossy texture of the silk fabric enhances the richness of the royal-blue color, making it a perfect centerpiece for your bed.', '{\"Care Instructions\": {\"DryClean\": \"Not required\", \"Wash Care\": \"Machine wash separately\"}, \"Dimensions\": {\"Bedsheet Length\": \"108 inches\", \"Bedsheet Size\": \"King\", \"Bedsheet Width\": \"108 inches\"}, \"Features\": {\"Eco Friendly\": \"Yes\", \"Machine Washable\": \"Yes\", \"Type\": \"Flat Bedsheet\"}, \"General\": {\"Brand\": \"Home Classic\", \"Collection\": \"Premium Cotton\", \"Country Of Origin\": \"India\", \"Material\": \"100% Cotton\"}, \"Packaging\": {\"Package Dimensions\": \"35 x 30 x 5 cm\", \"Package Weight\": \"950 grams\"}}', '2025-11-21 00:48:36'),
(22, 146, 'The Royal Blue Embroidered Silk Bedspread Set is a luxurious blend of elegance, craftsmanship, and premium comfort. Crafted from rich silk fabric and adorned with intricate embroidery, this bedspread brings a royal touch to any bedroom. Its vibrant royal-blue shade adds sophistication, while the detailed handcrafted work elevates your décor instantly.', 'Transform your bedroom into a space of timeless luxury with the Royal Blue Embroidered Silk Bedspread Set. Made from high-quality silk, this bedspread features beautifully detailed embroidery crafted by skilled artisans. The smooth, glossy texture of the silk fabric enhances the richness of the royal-blue color, making it a perfect centerpiece for your bed.', '{\"Care Instructions\": {\"DryClean\": \"Not required\", \"Wash Care\": \"Machine wash separately\"}, \"Dimensions\": {\"Bedsheet Length\": \"108 inches\", \"Bedsheet Size\": \"King\", \"Bedsheet Width\": \"108 inches\"}, \"Features\": {\"Eco Friendly\": \"Yes\", \"Machine Washable\": \"Yes\", \"Type\": \"Flat Bedsheet\"}, \"General\": {\"Brand\": \"Home Classic\", \"Collection\": \"Premium Cotton\", \"Country Of Origin\": \"India\", \"Material\": \"100% Cotton\"}, \"Packaging\": {\"Package Dimensions\": \"35 x 30 x 5 cm\", \"Package Weight\": \"950 grams\"}}', '2025-11-21 00:48:36'),
(23, 184, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\":{\"Wash Care\":\"Dry clean only\"},\"Dimensions\":{\"Length\":\"200 cm\",\"Size\":\"Free Size\",\"Width\":\"70 cm\"},\"Features\":{\"Occasion\":\"Casual & Festive\",\"Style\":\"Traditional\"},\"General\":{\"Brand\":\"Kashmir Heritage\",\"Collection\":\"Winter Royale\",\"Country Of Origin\":\"India\",\"Material\":\"Pashmina Wool\"},\"Packaging\":{\"Package Weight\":\"300 grams\",\"Package Dimensions\":\"3 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(24, 183, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Weight\": \"300 grams\", \"Package Dimensions\": \"30 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(25, 182, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Weight\": \"300 grams\", \"Package Dimensions\": \"30 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(26, 181, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Weight\": \"300 grams\", \"Package Dimensions\": \"30 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(27, 180, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Weight\": \"300 grams\", \"Package Dimensions\": \"30 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(28, 179, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Dimensions\": \"30 x 25 x 5 cm\", \"Package Weight\": \"300 grams\"}}', '2025-11-21 01:21:06'),
(29, 178, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Weight\": \"300 grams\", \"Package Dimensions\": \"30 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(30, 165, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Weight\": \"300 grams\", \"Package Dimensions\": \"30 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(31, 152, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Weight\": \"300 grams\", \"Package Dimensions\": \"30 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(32, 151, 'Our premium shawls combine comfort, elegance, and everyday versatility. Designed with fine craftsmanship and soft, high-quality fabric, these shawls add a stylish layer to any outfit—perfect for both casual wear and special occasions.', 'Crafted with attention to detail, each shawl offers a smooth drape, gentle warmth, and a refined finish. Whether woven, embroidered, printed, or textured, these shawls enhance your look with effortless grace. Lightweight yet cozy, they pair beautifully with ethnic, Indo-western, and western outfits. Ideal for personal use, travel, or gifting, these shawls bring together timeless design and everyday comfort.', '{\"Care Instructions\": {\"Wash Care\": \"Dry clean only\"}, \"Dimensions\": {\"Length\": \"200 cm\", \"Size\": \"Free Size\", \"Width\": \"70 cm\"}, \"Features\": {\"Occasion\": \"Casual & Festive\", \"Style\": \"Traditional\"}, \"General\": {\"Brand\": \"Kashmir Heritage\", \"Collection\": \"Winter Royale\", \"Country Of Origin\": \"India\", \"Material\": \"Pashmina Wool\"}, \"Packaging\": {\"Package Weight\": \"300 grams\", \"Package Dimensions\": \"30 x 25 x 5 cm\"}}', '2025-11-21 01:21:06'),
(33, 153, 'Our premium blankets are designed to provide superior comfort, warmth, and durability. Crafted from high-quality materials, they offer a cozy feel and stylish look, making them perfect for everyday use in any season.', 'Soft, breathable, and long-lasting, these blankets are made to elevate your sleeping experience. Whether lightweight or plush, each blanket ensures gentle warmth and a smooth, comfortable touch. Ideal for beds, sofas, travel, or gifting, they blend functionality with elegant design. Easy to maintain and crafted for daily use, these blankets keep you snug while adding a refined touch to your home décor.', '{\"Dimensions\": {\"Length\": \"220 cm\", \"Size\": \"King\", \"Width\": \"240 cm\"}, \"Features\": {\"Machine Washable\": \"Yes\", \"Type\": \"Single Layer\"}, \"General\": {\"Brand\": \"CozyHome\", \"Collection\": \"Winter Comfort\", \"Country Of Origin\": \"India\", \"Material\": \"Microfiber Fleece\"}, \"Care Instructions\": {\"Wash Care\": \"Machine wash cold\"}, \"Packaging\": {\"Package Weight\": \"1.4 kg\", \"Package Dimensions\": \"45 x 35 x 20 cm\"}}', '2025-11-21 01:53:15'),
(34, 186, 'test', 'test', '{\"General\":{\"Brand\":\"test\"}}', '2026-01-30 01:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `product_general_info_tbl`
--

CREATE TABLE `product_general_info_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `manufacturer_name` varchar(255) DEFAULT NULL,
  `manufacturer_brand` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL,
  `gst` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(5,2) NOT NULL DEFAULT 0.00,
  `base_price` decimal(10,2) NOT NULL,
  `discounted_price` decimal(10,2) NOT NULL,
  `gst_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_general_info_tbl`
--

INSERT INTO `product_general_info_tbl` (`id`, `product_id`, `manufacturer_name`, `manufacturer_brand`, `stock`, `price`, `gst`, `discount`, `base_price`, `discounted_price`, `gst_amount`) VALUES
(146, 146, 'test pvt. ltd.', 'Sample', 98, 999.00, 5.00, 10.00, 951.43, 899.10, 47.57),
(147, 147, 'Demo. pvt', 'Test', 98, 1499.00, 5.00, 20.00, 1427.62, 1199.20, 71.38),
(148, 148, 'Demo. pvt', 'Test2', 200, 699.00, 5.00, 5.00, 665.71, 664.05, 33.29),
(149, 149, 'Demo. pvt', 'Test', 500, 499.00, 5.00, 30.00, 475.24, 349.30, 23.76),
(150, 150, 'Demo. pvt', 'Test', 96, 299.00, 5.00, 2.00, 284.76, 293.02, 14.24),
(151, 151, 'Demo. pvt', 'Test', 98, 1500.00, 5.00, 50.00, 1428.57, 750.00, 71.43),
(152, 152, 'Demo. pvt', 'Test', 91, 1400.00, 5.00, 60.00, 1333.33, 560.00, 66.67),
(153, 153, 'Demo. pvt', 'Test', 77, 2500.00, 5.00, 30.00, 2380.95, 1750.00, 119.05),
(158, 158, 'Demo. pvt', 'Test', 99, 5999.00, 5.00, 54.00, 5713.33, 2759.54, 285.67),
(160, 160, 'Demo. pvt', 'Test', 100, 5999.00, 5.00, 30.00, 5713.33, 4199.30, 285.67),
(161, 161, 'Demo. pvt', 'Test2', 98, 9999.00, 5.00, 40.00, 9522.86, 5999.40, 476.14),
(162, 162, 'Demo. pvt', 'Test2', 1000, 2000.00, 5.00, 50.00, 1904.76, 1000.00, 95.24),
(163, 163, 'Demo. pvt', 'Test2', 999, 5000.00, 22.00, 25.00, 4098.36, 3750.00, 901.64),
(164, 164, 'Demo. pvt', 'Sample', 99, 10000.00, 5.00, 50.00, 9523.81, 5000.00, 476.19),
(165, 165, 'Demo. pvt', 'Test', 98, 6000.00, 5.00, 40.00, 5714.29, 3600.00, 285.71),
(174, 174, 'Demo. pvt', 'Hello', 100, 499.00, 5.00, 5.00, 475.24, 474.05, 23.76),
(175, 175, 'Demo. pvt', 'Test', 99, 999.00, 5.00, 50.00, 951.43, 499.50, 47.57),
(176, 176, 'Demo. pvt', 'Hello', 98, 4000.00, 5.00, 50.00, 3809.52, 2000.00, 190.48),
(177, 177, 'Demo. pvt', 'Test2', 99, 4000.00, 5.00, 50.00, 3809.52, 2000.00, 190.48),
(178, 178, 'Demo. pvt', 'Test', 100, 2999.00, 5.00, 60.00, 2856.19, 1199.60, 142.81),
(179, 179, 'Demo. pvt', 'Test', 100, 5000.00, 5.00, 40.00, 4761.90, 3000.00, 238.10),
(180, 180, 'Demo. pvt', 'Test', 96, 10000.00, 5.00, 40.00, 9523.81, 6000.00, 476.19),
(181, 181, 'Demo. pvt', 'Test', 100, 5000.00, 5.00, 40.00, 4761.90, 3000.00, 238.10),
(182, 182, 'Demo. pvt', 'Test', 90, 7000.00, 5.00, 40.00, 6666.67, 4200.00, 333.33),
(183, 183, 'Demo. pvt', 'Test', 95, 3499.00, 5.00, 40.00, 3332.38, 2099.40, 166.62),
(184, 184, 'Demo. pvt', 'Test', 89, 1800.00, 5.00, 40.00, 1714.29, 1080.00, 85.71),
(191, 191, 'Donear pvt. ltd', 'Infomagine', 100, 22.00, 5.00, 17.00, 20.95, 18.26, 1.05);

-- --------------------------------------------------------

--
-- Table structure for table `product_images_tbl`
--

CREATE TABLE `product_images_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images_tbl`
--

INSERT INTO `product_images_tbl` (`id`, `product_id`, `image`) VALUES
(685, 150, '5857db3d-a42d-4107-8cb6-d7578af3e004_9ab8afec-4669-4fa5-8a9c-d4123a41b684_IMG_9483.JPG'),
(686, 146, '9d0d5534-497b-470f-a6b2-7ecc16ff097c_4633ef55-3c28-4de1-a884-a4a8c9592a73_IMG_9484.JPG'),
(687, 146, 'f65b5cb7-7c25-4bde-8f1c-f81871d5a217_da6e828d-473d-4d94-a968-45da3a50bf0b_IMG_9489.JPG'),
(691, 162, 'da6396d3-8280-44c6-a6cb-cc07751680bd_b0dffb99-9051-4dd9-a080-5814e02545e7_download_2.jpeg'),
(692, 164, '4886d491-1233-4266-a58d-ef5bc8e6656d_ebe57461-899c-46de-8688-8beedc976503_download_3.jpeg'),
(693, 165, '2bd64028-6517-4de1-902a-9444445a793a_aacd7066-4657-484b-862d-a15a0b014311_fea807d7-3ad0-4672-892a-de3d02d4d20b_download_4.jpeg'),
(694, 161, '07f9e1bb-e346-48a0-8bf4-4787446d3080_bc159b96-1e8e-4d0d-befa-f433dd331745_download_1.jpeg'),
(695, 163, 'f539aace-8dce-4e44-8b8d-55bdcb1df440_fce2a9e4-9628-473b-ab86-1520d0143d8e_a19d0391-f3aa-4891-936c-ea712292bc4c_7a0f08f1-2ced-4abd-b337-07cb5c51fbb0_images_1.jpeg'),
(696, 160, '80237655-cb9c-4c99-9160-6c709949c428_5a2ce75f-b258-41be-b4e8-bbb6e4eef22d_images.jpeg'),
(697, 158, 'f76ab940-601a-42f9-a845-65ee79d74fba_657c3f73-950c-4b40-b8aa-c4b03a7fe16c_multicoloured-pillow-on-yellow-sofa-260nw-2088002416.png'),
(698, 153, '9fe019b4-4081-42d0-8b0f-4b64b4c9908d_87a0d610-5d48-4c03-b3f2-2d49a22eb3de_download.jpeg'),
(699, 152, 'd07744d0-b2cf-43c2-9f77-6f4608bfe2b9_986907fb-19a0-4188-b406-ed39c9580a84_IMG_9633.JPG'),
(700, 151, '3552e66c-9d19-4a4c-a304-867492575d36_b3b9254f-a863-42cd-8a1c-f91deb6d4799_IMG_9600.JPG'),
(701, 149, '5fbd5f2a-5fae-48be-ab6c-947ca768aea9_f5b5aba3-2776-464f-9966-eb3cdb39a1ba_IMG_9466.JPG'),
(702, 149, 'e7a524f1-2337-4d2a-9062-59437193dab0_2bba79e4-d8aa-4885-ad3f-97d82cc6e686_IMG_9468.JPG'),
(703, 148, '4f797374-972a-46ea-84bd-ec3343882bc3_23d1481e-571d-4f46-95ac-fa078920173f_9e753d7c-eff8-4a78-8755-550c2f5a1fe9_IMG_9348.JPG'),
(704, 148, '6c7599fa-1da6-4ef0-96cd-b73df360f364_33350012-f2be-4ac1-90fc-83c5f45fd327_fba92096-e8dc-4b05-a0ac-d1391e9934a7_IMG_9350.JPG'),
(705, 148, '614f0318-a63b-4f2e-b46d-c4d64ace3df8_9bbfc2c5-b151-4277-8414-95c8444690e4_f85b3e04-59aa-46c6-ad1d-40e85c6e5e5d_IMG_9360.JPG'),
(706, 147, 'e6175424-1c4d-4815-bde6-3dab3016cb9d_7bab5e42-a6b6-4990-ad77-14833807f1ff_IMG_9651.JPG'),
(707, 147, 'c1ca77db-6a86-4888-974c-7f370f63965e_a20408e8-f3e1-41db-9a51-ab81f5ead0cf_IMG_9605.JPG'),
(708, 174, '706bd93b-f859-4e86-a1ea-5c2ef869bbd4_images_2.jpeg'),
(710, 175, '80f16063-f179-4137-ae96-4aeb45525384_1b7d2177-e241-463a-a19e-7bc288a8adcc_download_5.jpeg'),
(711, 176, '17d2f7cc-1627-4a72-8cd4-7d5b447af413_download_6.jpeg'),
(712, 177, '4b866c08-5bfc-4f66-8a91-58c2babb7777_download_7.jpeg'),
(713, 178, 'f1709d96-f873-412d-a270-30164b29ec72_images_3.jpeg'),
(714, 179, '3d743def-1082-4234-818f-9e4559e48bfe_images_4.jpeg'),
(715, 180, '97d03b95-f385-402c-80fc-bc7ba8d1e2ac_download_9.jpeg'),
(716, 181, '8b9ee652-2063-480e-bb22-7b30d8b3f377_download_10.jpeg'),
(719, 182, '19ddbad8-3ad1-47cd-b682-e757a878c6b3_183d4d6b-45b2-4963-a2cc-9527377587e4_ecf81254-db9d-4159-9488-2135efb1d04a_download_11.jpeg'),
(720, 183, '13bb83ba-3398-45e5-9587-f543b9be61cc_images_5.jpeg'),
(733, 184, '3c7a1f85-7c0e-4056-a712-13d31004206e.jpeg'),
(734, 191, '5e1c13d7-d5f8-42ef-b41e-327288b3ffef.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_meta_tbl`
--

CREATE TABLE `product_meta_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_meta_tbl`
--

INSERT INTO `product_meta_tbl` (`id`, `product_id`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(3, 184, 'Test', 'test', 'test'),
(8, 191, 'infomagine', 'infomagine', 'infomagein');

-- --------------------------------------------------------

--
-- Table structure for table `product_pattern_tbl`
--

CREATE TABLE `product_pattern_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_pattern_tbl`
--

INSERT INTO `product_pattern_tbl` (`id`, `pattern`, `created_at`) VALUES
(3, 'Stripes', '2025-09-01 23:51:13'),
(5, 'Geometric', '2025-09-01 23:59:59'),
(6, 'Abstract', '2025-09-02 00:00:10'),
(7, 'Floral', '2025-09-02 00:00:16'),
(9, 'Test', '2025-09-25 00:18:16'),
(10, 'Sample', '2025-09-25 00:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_size_tbl`
--

CREATE TABLE `product_size_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_size_tbl`
--

INSERT INTO `product_size_tbl` (`id`, `type`, `unit`, `category`, `created_at`) VALUES
(1, 'metric units', 'm', NULL, '2025-09-04 01:14:23'),
(2, 'size category', NULL, 'm', '2025-09-04 01:16:06'),
(3, 'size category', NULL, 'l', '2025-09-04 01:16:11'),
(4, 'size category', NULL, 'xl', '2025-09-04 01:16:16'),
(5, 'metric units', 'cm', NULL, '2025-09-04 01:38:04'),
(6, 'metric units', 'mm', NULL, '2025-09-04 02:01:02'),
(7, 'metric units', 'kg', NULL, '2025-09-04 02:45:18'),
(9, 'size category', NULL, 'XXL', '2025-09-17 03:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_parent_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_tags` text DEFAULT NULL,
  `product_status` varchar(255) NOT NULL DEFAULT 'active',
  `product_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`id`, `product_title`, `product_parent_category_id`, `product_category_id`, `product_tags`, `product_status`, `product_description`, `created_at`) VALUES
(146, 'Royal Blue Embroidered Silk Bedspread Set', 1, 20, 'New Bed Sheet', 'Active', 'Elegant royal blue silk bedspread set with intricate tree embroidery, adding a touch of luxury and charm to your bedroom décor.\r\n', '2025-11-05 00:02:11'),
(147, 'Elegant Floral Printed Cotton Dupatta', 1, 3, 'cotton stole, floral print stole, blue and white stole, lightweight dupatta, ethnic stole, summer accessory, soft cotton wrap, casual stole, handmade stole, traditional stole, Indian fashion, women’s accessory', 'Active', 'Soft cotton dupatta featuring delicate blue floral prints on a white base, offering a fresh, graceful look perfect for casual and festive wear.\r\n', '2025-11-05 00:18:17'),
(148, 'Handcrafted Jaipuri Block Print Cotton King Size Bedsheet Set', 1, 20, 'New BedSheet', 'Active', 'Drape your bed in the artistry of India with this authentic hand-block printed cotton bedsheet set. Featuring rich, floral medallion motifs and a complementary border design, this breathable cotton set includes the bedsheet and two matching pillow covers for a globally inspired look.\r\n', '2025-11-05 00:30:59'),
(149, 'Hand-Stitched Elephant Kantha Work Cotton Quilt / Bedspread', 1, 1, 'New', 'Active', 'A vibrant, handmade bedspread featuring the traditional Kantha running stitch across the entire piece. Large, cheerful elephant appliqués are framed by a colorful, patterned border. Made from soft cotton, this quilt adds a rich, artisanal texture and a burst of ethnic charm to any bedroom.\r\n', '2025-11-05 00:38:39'),
(150, 'Artisanal Kantha Stitch Patchwork Cotton Bed Cover', 1, 1, 'New', 'Active', 'Transform your bed with this durable and detailed patchwork bed cover. The squares of richly patterned cotton fabric are joined and layered with beautiful, subtle Kantha hand-stitching. It\'s a high-quality textile that offers both warmth and eye-catching visual depth.\r\n', '2025-11-05 00:44:24'),
(151, 'Luxurious Black Embellished Rose Motif Shawl', 6, 7, 'New', 'Active', 'An instantly elegant accessory, this shawl features a stunning large rose motif crafted from shimmering stones or crystals. Made from a soft, warm wool or pashmina blend, this rich black stole drapes beautifully and is finished with subtle fringe detailing, perfect for evening wear or special occasions.\r\n', '2025-11-05 00:52:57'),
(152, 'Bold Color Block Reversible Wool Shawl with Contrast Motif', 10, 7, 'Test', 'Active', 'Make a statement with this vibrant, reversible shawl. One side features a rich red, while the other showcases a deep navy blue with a contrasting red graphic silhouette (perhaps a horse or geometric shape). Made from a warm, soft wool blend, this shawl is perfect for adding a structured, modern pop of color to any outfit.\r\n', '2025-11-05 00:56:13'),
(153, 'Ultra-Soft Printed Plush Fleece', 7, 10, 'New', 'Active', 'Snuggle up in luxurious comfort with this ultra-soft, lightweight blanket. Made from high-quality plush fleece or mink material, it features a warm, comforting texture and a sweet floral and heart print. Perfect for use on the couch, in the bedroom, or as an extra layer of warmth.\r\n', '2025-11-05 02:51:31'),
(158, 'Textured Fabric Sofa with Cozy Square Cushions', 1, 8, 'New Pillow', 'Active', 'Experience ultimate comfort with this deep-seated sofa, accented by two soft, inviting square throw pillows. The subtly textured fabric adds depth and warmth to any home décor scheme.\r\n', '2025-11-06 05:35:34'),
(160, 'Patchwork Feline Fun Quilt & Sham Set', 1, 1, 'New', 'Active', 'Cuddle up with this delightful quilt set featuring a classic patchwork design with playful squares, each showcasing a different cat silhouette. The scalloped edges and coordinating shams add a touch of cozy, country charm to any bedroom. Perfect for cat lovers!\r\n', '2025-11-06 06:18:16'),
(161, 'Tan Flannel Fleece Blanket', 1, 10, 'New', 'Active', 'The ultimate comfort blanket for movie nights and lazy mornings. This generously sized throw is made from premium flannel fleece for maximum softness. Its versatile camel/tan shade easily complements any existing décor in your living room or bedroom.\r\n', '2025-11-06 06:28:02'),
(162, 'Deep Blue Velvet Whale Accent Pillow', 1, 8, 'New Pillow', 'Active', 'Dive into comfort with this plush, rectangular velvet pillow. Featuring a marbled deep blue texture accented by white, light blue, and brown stripes, it\'s the perfect nautical touch for a whale or ocean-themed bedroom. Coordinates perfectly with white and blue bedding.\r\n', '2025-11-06 06:32:59'),
(163, 'Velvet-Touch Raschel Floral Winter Bedspread', 1, 10, 'New', 'Active', 'Add a touch of vintage opulence to your bedroom with this thick, high-density Raschel-style blanket. The vibrant, ornate floral pattern and velvet-like feel make it a stunning, comfortable bed covering that offers superior insulation and classic style.\r\n', '2025-11-06 06:46:48'),
(164, 'Handwoven Tussar Silk Scarf with Tribal Motifs', 1, 3, 'New', 'Active', 'Drape yourself in the rich texture of this handcrafted silk/khadi scarf in a sophisticated dark brown. Featuring bold, colorful ethnic or tribal embroidery/weaving at the ends and delicate fringe detail. This lightweight accessory adds an artistic, artisanal touch to any outfit.\r\n', '2025-11-06 06:54:04'),
(165, 'Kashmiri-Style Weave Winter Wrap with Tasseled Edge', 1, 7, 'New', 'Active', 'A sophisticated winter accessory that showcases exquisite artistry. This wrap features a dense, all-over traditional pattern accented by a striking deep blue border. The fabric offers exceptional warmth and a smooth, rich hand-feel, finished with delicate tasseled fringe. Perfect for adding a touch of heritage elegance to evening wear.\r\n', '2025-11-06 07:01:49'),
(174, 'Modern Rattan Chaise with Vivid Amethyst Cushions', 1, 8, 'New', 'Active', 'Elevate your patio or sunroom with this striking woven white chaise lounge. It features durable, fade-resistant cushions in a brilliant Amethyst purple, complemented by bold Magenta and Deep Purple throw pillows. The perfect piece for a pop of modern color against a neutral backdrop.\r\n', '2025-11-11 03:46:27'),
(175, 'The Midnight Sparkle Stole', 1, 3, 'New', 'Active', 'A timeless accessory for every season. This versatile black shawl/stole features a subtle yet captivating pattern of tiny golden studs along the body and a dramatic, detailed border. Wear it draped over a formal dress or loosely wrapped with a coat—it\'s the perfect way to infuse instant style and a delicate sparkle into any outfit.\r\n', '2025-11-11 03:59:35'),
(176, 'Geometric Print Lightweight Scarf', 1, 3, 'New', 'Active', 'A versatile accessory in rich maroon and neutral cream. This flowing scarf features a dynamic mix of zigzag and stylized border prints. Drape it, knot it, or wear it as a shawl—it\'s the perfect way to finish an outfit with color and visual interest.\r\n', '2025-11-11 04:09:17'),
(177, 'Charcoal Geometric Print Scarf', 1, 3, 'New', 'Active', 'Elevate your everyday look with this sophisticated scarf featuring a muted taupe-gray body. The ends are beautifully accented with a handcrafted pattern of earthy brown, cream, and charcoal stripes and bold geometric triangles. Its natural color palette and soft texture make it a versatile, year-round accessory perfect for complementing both casual and formal attire.\r\n', '2025-11-11 04:34:54'),
(178, 'Earthy Terracotta Print Shawl', 1, 7, 'New', 'Active', 'Wrap yourself in the warm, rich tones of this exquisite piece. Featuring an intricate, all-over traditional print in varying shades of terracotta, rust, and burnt orange, finished with a subtle contrasting border (light taupe/cream). The fabric drapes beautifully, making it an ideal statement wrap for evening events or a luxurious addition to your everyday wardrobe.\r\n', '2025-11-11 04:44:22'),
(179, 'Paisley Woven Fringed Shawl', 1, 7, 'New', 'Active', 'Indulge in the luxurious texture and intricate weaving of this elegant shawl. Featuring a rich, all-over traditional pattern (such as paisley or brocade) in deep terracotta and brown tones, complemented by soft, fringe detailing. Perfect for adding a layer of warmth and sophisticated heritage style to any formal or festive occasion.\r\n', '2025-11-11 04:48:56'),
(180, 'Wool Shawl with Intricate Border Weave', 1, 7, 'New', 'Active', 'Wrap yourself in the timeless elegance of this soft, luxurious shawl. The neutral Camel Tan body is beautifully contrasted with wide, intricate borders featuring traditional Paisley (or Kani/Jamawar) patterns in rich, muted tones of red, blue, and cream. Perfect for formal occasions or adding sophisticated warmth to your winter wardrobe.\r\n', '2025-11-11 04:57:53'),
(181, 'The Signature Scarlet Solid Color Scarf', 11, 7, 'New', 'Active', 'Make a bold statement with this essential Scarlet Red scarf. Designed for maximum style and versatility, the clean, solid color and soft, substantial fabric (mention material if known) make it the perfect layering piece for both casual looks and formal outerwear. An instant classic you\'ll reach for season after season.\r\n', '2025-11-11 05:00:27'),
(182, 'Ornate Maroon & Cream Geometric Patterned Shawl', 1, 7, 'New', 'Active', 'Wrap yourself in the rich complexity of this beautiful shawl. Featuring a dense, all-over traditional design in deep maroon/burgundy and cream tones, accented by sophisticated geometric motifs and detailed borders. The generous size and soft drape make it a stunning and elegant statement piece for special occasions or daily luxury.\r\n', '2025-11-11 05:05:08'),
(183, 'Authentic GI Tag Certified Kashmiri Pashmina Shawl', 1, 7, 'New', 'Active', 'Experience true luxury with this exquisite, finely woven Pashmina shawl. Featuring a soft ivory body and stunning, multicolored Paisley and floral patterns along the borders. This piece carries the Geographical Indication (GI) Tag, ensuring its quality, traditional origin, and authentic craftsmanship from Kashmir. A timeless investment in elegance and heritage.\r\n', '2025-11-11 05:12:14'),
(184, 'PASHAM Solid Taupe Shawl with Woven Border Detail', 1, 7, 'New', 'Active', 'The ultimate in understated elegance by PASHAM. This soft, substantial shawl comes in a versatile, solid taupe or khaki color, perfect for layering. It is subtly accented with a narrow, intricately woven geometric border near the edges and finished with soft fringe. A timeless piece providing sophisticated warmth and effortless style.', '2025-11-11 05:16:16'),
(191, 'Test', 9, 20, 'infomagein', 'Active', 'infomagin', '2026-02-03 13:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `slider_tbl`
--

CREATE TABLE `slider_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_tbl`
--

INSERT INTO `slider_tbl` (`id`, `key`, `category_id`, `image`, `created_at`) VALUES
(5, 'new', 30, '8cd14f21-34aa-4cab-9038-f538f625f77a.webp', '2026-02-03 12:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `specification_heading_tbl`
--

CREATE TABLE `specification_heading_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `specification_heading` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specification_heading_tbl`
--

INSERT INTO `specification_heading_tbl` (`id`, `specification_heading`, `created_at`) VALUES
(3, 'Fabric Details', '2025-11-10 01:25:37'),
(4, 'General', '2025-11-12 06:34:48'),
(6, 'Material', '2025-11-12 06:35:53'),
(7, 'Dimensions', '2025-11-12 06:36:13'),
(8, 'Features', '2025-11-21 00:28:26'),
(9, 'Care Instructions', '2025-11-21 00:28:58'),
(10, 'Packaging', '2025-11-21 00:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `specification_tbl`
--

CREATE TABLE `specification_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `specification_heading_id` bigint(20) UNSIGNED NOT NULL,
  `specification` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specification_tbl`
--

INSERT INTO `specification_tbl` (`id`, `specification_heading_id`, `specification`, `created_at`) VALUES
(6, 4, 'Brand', '2025-11-21 00:30:20'),
(7, 4, 'Collection', '2025-11-21 00:30:43'),
(8, 4, 'Country Of Origin', '2025-11-21 00:31:27'),
(9, 4, 'Material', '2025-11-21 00:32:10'),
(10, 7, 'Size', '2025-11-21 00:33:12'),
(11, 7, 'Length', '2025-11-21 00:33:45'),
(12, 7, 'Width', '2025-11-21 00:34:03'),
(13, 8, 'Type', '2025-11-21 00:35:21'),
(14, 8, 'Eco Friendly', '2025-11-21 00:35:38'),
(15, 8, 'Wrinkle Free', '2025-11-21 00:35:53'),
(16, 8, 'Machine Washable', '2025-11-21 00:36:20'),
(17, 9, 'Wash Care', '2025-11-21 00:36:40'),
(18, 9, 'DryClean', '2025-11-21 00:37:00'),
(19, 10, 'Package Weight', '2025-11-21 00:37:33'),
(21, 10, 'Package Dimensions', '2025-11-21 00:38:13'),
(22, 8, 'Style', '2025-11-21 01:24:55'),
(23, 8, 'Occasion', '2025-11-21 01:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin@gmail.com', '$2y$12$ePUKPgzyvf07dXQCsLAjwOo4QB4yt3Q2D1bFEq8a5XTEYXP5FpGy6', '2026-01-29 00:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_tbl`
--

CREATE TABLE `wishlist_tbl` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist_tbl`
--

INSERT INTO `wishlist_tbl` (`id`, `customer_id`, `product_id`, `created_at`) VALUES
(7, 1, 191, '2026-02-04 04:07:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address_tbl`
--
ALTER TABLE `address_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_tbl_customer_id_index` (`customer_id`);

--
-- Indexes for table `brand_tbl`
--
ALTER TABLE `brand_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand_tbl_brand_name_unique` (`brand_name`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_tbl_customer_id_product_id_unique` (`customer_id`,`product_id`),
  ADD KEY `cart_tbl_product_id_foreign` (`product_id`);

--
-- Indexes for table `category_tbl`
--
ALTER TABLE `category_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_tbl_name_unique` (`name`),
  ADD KEY `category_tbl_parent_category_foreign` (`parent_category`);

--
-- Indexes for table `coupon_tbl`
--
ALTER TABLE `coupon_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_tbl_coupon_code_unique` (`coupon_code`);

--
-- Indexes for table `customer_tbl`
--
ALTER TABLE `customer_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_tbl_phone_unique` (`phone`),
  ADD UNIQUE KEY `customer_tbl_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gst_tbl`
--
ALTER TABLE `gst_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gst_tbl_gst_unique` (`gst`);

--
-- Indexes for table `invoice_tbl`
--
ALTER TABLE `invoice_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_tbl_invoice_number_unique` (`invoice_number`),
  ADD KEY `invoice_tbl_order_id_foreign` (`order_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturer_tbl`
--
ALTER TABLE `manufacturer_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manufacturer_tbl_manufacturer_name_unique` (`manufacturer_name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers_tbl`
--
ALTER TABLE `offers_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `offers_tbl_key_unique` (`key`);

--
-- Indexes for table `offer_detail_tbl`
--
ALTER TABLE `offer_detail_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offer_detail_tbl_offer_id_foreign` (`offer_id`);

--
-- Indexes for table `order_item_tbl`
--
ALTER TABLE `order_item_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_item_tbl_order_id_foreign` (`order_id`),
  ADD KEY `order_item_tbl_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_tbl_customer_id_foreign` (`customer_id`),
  ADD KEY `order_tbl_razorpay_order_id_index` (`razorpay_order_id`);

--
-- Indexes for table `parent_category_tbl`
--
ALTER TABLE `parent_category_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parent_category_tbl_name_unique` (`name`);

--
-- Indexes for table `product_attributes_tbl`
--
ALTER TABLE `product_attributes_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_tbl_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_color_tbl`
--
ALTER TABLE `product_color_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_description_tbl`
--
ALTER TABLE `product_description_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_description_tbl_product_id_unique` (`product_id`);

--
-- Indexes for table `product_general_info_tbl`
--
ALTER TABLE `product_general_info_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_general_info_tbl_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_images_tbl`
--
ALTER TABLE `product_images_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_tbl_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_meta_tbl`
--
ALTER TABLE `product_meta_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_meta_tbl_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_pattern_tbl`
--
ALTER TABLE `product_pattern_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_size_tbl`
--
ALTER TABLE `product_size_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tbl_product_parent_category_id_foreign` (`product_parent_category_id`),
  ADD KEY `product_tbl_product_category_id_foreign` (`product_category_id`);

--
-- Indexes for table `slider_tbl`
--
ALTER TABLE `slider_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specification_heading_tbl`
--
ALTER TABLE `specification_heading_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `specification_heading_tbl_specification_heading_unique` (`specification_heading`);

--
-- Indexes for table `specification_tbl`
--
ALTER TABLE `specification_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specification_tbl_specification_heading_id_foreign` (`specification_heading_id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_tbl_username_unique` (`username`);

--
-- Indexes for table `wishlist_tbl`
--
ALTER TABLE `wishlist_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_tbl_customer_id_index` (`customer_id`),
  ADD KEY `wishlist_tbl_product_id_index` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address_tbl`
--
ALTER TABLE `address_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brand_tbl`
--
ALTER TABLE `brand_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `category_tbl`
--
ALTER TABLE `category_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `coupon_tbl`
--
ALTER TABLE `coupon_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_tbl`
--
ALTER TABLE `customer_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gst_tbl`
--
ALTER TABLE `gst_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `invoice_tbl`
--
ALTER TABLE `invoice_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturer_tbl`
--
ALTER TABLE `manufacturer_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `offers_tbl`
--
ALTER TABLE `offers_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `offer_detail_tbl`
--
ALTER TABLE `offer_detail_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_item_tbl`
--
ALTER TABLE `order_item_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `parent_category_tbl`
--
ALTER TABLE `parent_category_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_attributes_tbl`
--
ALTER TABLE `product_attributes_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `product_color_tbl`
--
ALTER TABLE `product_color_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_description_tbl`
--
ALTER TABLE `product_description_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `product_general_info_tbl`
--
ALTER TABLE `product_general_info_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `product_images_tbl`
--
ALTER TABLE `product_images_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=735;

--
-- AUTO_INCREMENT for table `product_meta_tbl`
--
ALTER TABLE `product_meta_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_pattern_tbl`
--
ALTER TABLE `product_pattern_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_size_tbl`
--
ALTER TABLE `product_size_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `slider_tbl`
--
ALTER TABLE `slider_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `specification_heading_tbl`
--
ALTER TABLE `specification_heading_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `specification_tbl`
--
ALTER TABLE `specification_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist_tbl`
--
ALTER TABLE `wishlist_tbl`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address_tbl`
--
ALTER TABLE `address_tbl`
  ADD CONSTRAINT `address_tbl_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_tbl`
--
ALTER TABLE `cart_tbl`
  ADD CONSTRAINT `cart_tbl_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_tbl_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_tbl`
--
ALTER TABLE `category_tbl`
  ADD CONSTRAINT `category_tbl_parent_category_foreign` FOREIGN KEY (`parent_category`) REFERENCES `parent_category_tbl` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoice_tbl`
--
ALTER TABLE `invoice_tbl`
  ADD CONSTRAINT `invoice_tbl_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offer_detail_tbl`
--
ALTER TABLE `offer_detail_tbl`
  ADD CONSTRAINT `offer_detail_tbl_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_item_tbl`
--
ALTER TABLE `order_item_tbl`
  ADD CONSTRAINT `order_item_tbl_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order_tbl` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_tbl_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD CONSTRAINT `order_tbl_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customer_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes_tbl`
--
ALTER TABLE `product_attributes_tbl`
  ADD CONSTRAINT `product_attributes_tbl_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_general_info_tbl`
--
ALTER TABLE `product_general_info_tbl`
  ADD CONSTRAINT `product_general_info_tbl_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images_tbl`
--
ALTER TABLE `product_images_tbl`
  ADD CONSTRAINT `product_images_tbl_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_meta_tbl`
--
ALTER TABLE `product_meta_tbl`
  ADD CONSTRAINT `product_meta_tbl_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD CONSTRAINT `product_tbl_product_category_id_foreign` FOREIGN KEY (`product_category_id`) REFERENCES `category_tbl` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_tbl_product_parent_category_id_foreign` FOREIGN KEY (`product_parent_category_id`) REFERENCES `parent_category_tbl` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `specification_tbl`
--
ALTER TABLE `specification_tbl`
  ADD CONSTRAINT `specification_tbl_specification_heading_id_foreign` FOREIGN KEY (`specification_heading_id`) REFERENCES `specification_heading_tbl` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
