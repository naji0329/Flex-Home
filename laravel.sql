-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2022 at 03:34 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'JVEVccHIalHLwIL41uMnOJDfC0p59ohS', 1, '2019-11-15 04:53:30', '2019-11-15 04:53:30', '2019-11-15 04:53:30'),
(2, 2, 'bUiPYBbscR6j5dhSlWSesCy0LEXp7LDG', 1, '2021-01-03 17:23:28', '2021-01-03 17:23:28', '2021-01-03 17:23:28'),
(3, 1, 'dtG3n9fA2nz5TPWNuYP1nCFwtfgtVY3Q', 1, '2021-01-12 20:51:55', '2021-01-12 20:51:55', '2021-01-12 20:51:55'),
(4, 1, 'j34UyDusAYW6Qv7W8R9Phy1eS7J6x7VH', 1, '2021-01-12 20:57:53', '2021-01-12 20:57:53', '2021-01-12 20:57:53'),
(5, 1, 'zybfCxjzArgxYwys3SFXJFr5GtrR4fVh', 1, '2021-04-15 01:12:40', '2021-04-15 01:12:40', '2021-04-15 01:12:40'),
(6, 1, 'CdxxFEhkLAEjMbXfwV0sGfYouD04RXxR', 1, '2021-04-18 09:20:14', '2021-04-18 09:20:14', '2021-04-18 09:20:14'),
(7, 1, '5QGfTcVcYiXHzILQHh84iziigUT1Asfo', 1, '2021-04-29 20:46:36', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(8, 1, 'b6OPzC5TBqVWQUjUE6MwNt1xW50BQCiq', 1, '2021-06-11 20:56:49', '2021-06-11 20:56:49', '2021-06-11 20:56:49'),
(9, 1, 'aErtd3iYdCfFQHt9JGTC6CK2sDEipDfJ', 1, '2021-12-04 05:15:56', '2021-12-04 05:15:56', '2021-12-04 05:15:56'),
(10, 1, 'E2pnOQvxfnxT3FhzIVG3y64EmlSJquav', 1, '2021-12-04 05:17:41', '2021-12-04 05:17:41', '2021-12-04 05:17:41'),
(11, 1, 'aw6YZVSneTmkzQYSO1uZ5sza3JyZYFkk', 1, '2021-12-04 05:21:13', '2021-12-04 05:21:13', '2021-12-04 05:21:13'),
(12, 1, 'NmUPB12SAMkdIku581sX5QpARXMxqJjg', 1, '2021-12-09 21:24:36', '2021-12-09 21:24:36', '2021-12-09 21:24:36'),
(13, 1, 'brlhvZ2kzt9LlSMb4zvTFoibinKxnEQg', 1, '2021-12-09 21:25:34', '2021-12-09 21:25:34', '2021-12-09 21:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2022-01-08 00:00:19', '2022-01-08 00:00:19'),
(2, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2022-01-08 05:53:00', '2022-01-08 05:53:00'),
(3, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2022-01-08 17:23:31', '2022-01-08 17:23:31'),
(4, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2022-01-09 19:06:01', '2022-01-09 19:06:01'),
(5, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2022-01-10 07:43:11', '2022-01-10 07:43:11'),
(6, 1, 'of the system', '[]', 'logged out', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', 1, 1, 'System Admin', 'info', '2022-01-10 07:52:56', '2022-01-10 07:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `bb_comments`
--

CREATE TABLE `bb_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `like_count` int(11) NOT NULL DEFAULT 0,
  `reply_count` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bb_comments`
--

INSERT INTO `bb_comments` (`id`, `comment`, `reference_id`, `reference_type`, `ip_address`, `user_id`, `status`, `like_count`, `reply_count`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'okk goole', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 00:13:55', '2022-01-08 00:13:55'),
(2, 'hello', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 02:43:46', '2022-01-08 02:43:46'),
(3, 'ok google', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 02:53:45', '2022-01-08 02:53:45'),
(4, '123123', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:06:28', '2022-01-08 03:06:28'),
(5, '111212', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:06:34', '2022-01-08 03:06:34'),
(6, 'dsfdsf', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:07:08', '2022-01-08 03:07:08'),
(7, 'google', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:08:03', '2022-01-08 03:08:03'),
(8, 'zxcv7777', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:08:50', '2022-01-08 03:08:50'),
(9, '899888', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:08:55', '2022-01-08 03:08:55'),
(10, '78987979', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:08:58', '2022-01-08 03:08:58'),
(11, '7777hh', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:09:38', '2022-01-08 03:09:38'),
(12, 'xxxxxx', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:10:02', '2022-01-08 03:10:02'),
(13, '23213xx', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:11:01', '2022-01-08 03:11:01'),
(14, '12321xxxx', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:17:41', '2022-01-08 03:17:41'),
(15, '567xxxx', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:18:38', '2022-01-08 03:18:38'),
(16, '123213xxx', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:19:33', '2022-01-08 03:19:33'),
(17, 'zxczxcxxxx', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:22:51', '2022-01-08 03:22:51'),
(18, '123213', 3, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 03:22:56', '2022-01-08 03:22:56'),
(19, 'nices', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:02:16', '2022-01-08 06:02:16'),
(20, '234234', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:04:06', '2022-01-08 06:04:06'),
(21, 'ggggggg', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:13:58', '2022-01-08 06:13:58'),
(22, 'zxcvcxvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:15:39', '2022-01-08 06:15:39'),
(23, 'zxcvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:17:09', '2022-01-08 06:17:09'),
(24, 'zxcvcvzxv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:23:49', '2022-01-08 06:23:49'),
(25, '34324234234234234', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:23:58', '2022-01-08 06:23:58'),
(26, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:24:27', '2022-01-08 06:24:27'),
(27, 'cafebiz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:25:28', '2022-01-08 06:25:28'),
(28, '346464563456', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:25:39', '2022-01-08 06:25:39'),
(29, 'hi google', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:27:01', '2022-01-08 06:27:01'),
(30, '88879', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 06:28:11', '2022-01-08 06:28:11'),
(31, 'xcxzc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 07:15:27', '2022-01-08 07:15:27'),
(32, '3423423ddvvvvxxxzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 07:17:58', '2022-01-08 07:17:58'),
(33, '435345', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 07:23:04', '2022-01-08 07:23:04'),
(34, 'ccccccxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 19:53:50', '2022-01-08 19:53:50'),
(35, 'dddxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 20:02:42', '2022-01-08 20:02:42'),
(36, 'zcvxzcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 20:06:34', '2022-01-08 20:06:34'),
(37, 'xzcxzc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-08 20:12:44', '2022-01-08 20:12:44'),
(38, 'zxcvxcvzx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:08:35', '2022-01-09 19:08:35'),
(39, 'zxczxczxczxc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:10:04', '2022-01-09 19:10:04'),
(40, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:12:51', '2022-01-09 19:12:51'),
(41, 'hope you ok', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:20:33', '2022-01-09 19:20:33'),
(42, 'zzxzxzxzx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:22:08', '2022-01-09 19:22:08'),
(43, '77777777', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:24:00', '2022-01-09 19:24:00'),
(44, 'zzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:32:46', '2022-01-09 19:32:46'),
(45, 'vvvvvv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:44:25', '2022-01-09 19:44:25'),
(46, 'xvxcvxcvxcvxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:44:32', '2022-01-09 19:44:32'),
(47, 'bbbbb', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:44:41', '2022-01-09 19:44:41'),
(48, 'ok good', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:52:02', '2022-01-09 19:52:02'),
(49, 'hiiixcvxcvxcvxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:52:39', '2022-01-09 19:52:39'),
(50, 'how are you?', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 19:54:40', '2022-01-09 19:54:40'),
(51, 'ok google', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:07:03', '2022-01-09 20:07:03'),
(52, '345435', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:13:34', '2022-01-09 20:13:34'),
(53, '6789999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:15:46', '2022-01-09 20:15:46'),
(54, 'ddddddd', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:21:13', '2022-01-09 20:21:13'),
(55, '77778989', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:23:31', '2022-01-09 20:23:31'),
(56, '123123213123', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:24:40', '2022-01-09 20:24:40'),
(57, '2222222', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:25:29', '2022-01-09 20:25:29'),
(58, '33333', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:29:34', '2022-01-09 20:29:34'),
(59, '444443345345', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:29:50', '2022-01-09 20:29:50'),
(60, 'good game', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:31:04', '2022-01-09 20:31:04'),
(61, '123123213123', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:32:49', '2022-01-09 20:32:49'),
(62, '88888989', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:33:49', '2022-01-09 20:33:49'),
(63, '99999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:34:03', '2022-01-09 20:34:03'),
(64, 'xcvxcvxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:47:05', '2022-01-09 20:47:05'),
(65, 'zzzzzzzzzzzzzzzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:47:12', '2022-01-09 20:47:12'),
(66, 'hiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:47:48', '2022-01-09 20:47:48'),
(67, 'hiiiiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:48:08', '2022-01-09 20:48:08'),
(68, 'how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 20:48:25', '2022-01-09 20:48:25'),
(69, 'im not ok', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:12:07', '2022-01-09 21:12:07'),
(70, 'haizzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:13:57', '2022-01-09 21:13:57'),
(71, 'good gamee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:21:07', '2022-01-09 21:21:07'),
(72, '797979', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:22:58', '2022-01-09 21:22:58'),
(73, '123123123', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:23:37', '2022-01-09 21:23:37'),
(74, '9999789789789', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:37:09', '2022-01-09 21:37:09'),
(75, '345345345', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:38:43', '2022-01-09 21:38:43'),
(76, 'okkk good gameeeee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:39:36', '2022-01-09 21:39:36'),
(77, 'okk googless', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:40:13', '2022-01-09 21:40:13'),
(78, '5677567567567', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:41:46', '2022-01-09 21:41:46'),
(79, 'zxcvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:42:48', '2022-01-09 21:42:48'),
(80, 'hey!! guys!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:45:46', '2022-01-09 21:45:46'),
(81, 'how are you to day', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:46:06', '2022-01-09 21:46:06'),
(82, 'ok pro', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:46:20', '2022-01-09 21:46:20'),
(83, 'how are you today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:49:09', '2022-01-09 21:49:09'),
(84, 'how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:50:19', '2022-01-09 21:50:19'),
(85, 'good morning', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:50:44', '2022-01-09 21:50:44'),
(86, 'good morning tech', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:51:16', '2022-01-09 21:51:16'),
(87, 'ok how rage', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:51:53', '2022-01-09 21:51:53'),
(88, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:56:12', '2022-01-09 21:56:12'),
(89, 'thong tin cong nghezzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:56:25', '2022-01-09 21:56:25'),
(90, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:56:41', '2022-01-09 21:56:41'),
(91, 'cafebiz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:56:53', '2022-01-09 21:56:53'),
(92, 'zxcvzxvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:57:19', '2022-01-09 21:57:19'),
(93, 'zxcvzxvzxvzxcvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:57:44', '2022-01-09 21:57:44'),
(94, 'ddddsdzxccxzc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:57:55', '2022-01-09 21:57:55'),
(95, 'hungzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:59:10', '2022-01-09 21:59:10'),
(96, 'hungzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:59:38', '2022-01-09 21:59:38'),
(97, '789789789789', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 21:59:50', '2022-01-09 21:59:50'),
(98, '890890890890980', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:00:02', '2022-01-09 22:00:02'),
(99, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:00:28', '2022-01-09 22:00:28'),
(100, '7878678', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:00:39', '2022-01-09 22:00:39'),
(101, '12312312321312', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:02:12', '2022-01-09 22:02:12'),
(102, '123123213123123', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:02:18', '2022-01-09 22:02:18'),
(103, 'haizzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:03:26', '2022-01-09 22:03:26'),
(104, 'good game', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:04:03', '2022-01-09 22:04:03'),
(105, '2222zxcvxzvxzcvx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:06:26', '2022-01-09 22:06:26'),
(106, '2134566', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:06:32', '2022-01-09 22:06:32'),
(107, 'zinggggg', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:06:40', '2022-01-09 22:06:40'),
(108, '24h.com.vn', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:06:59', '2022-01-09 22:06:59'),
(109, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:07:27', '2022-01-09 22:07:27'),
(110, 'zinggggg', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:07:38', '2022-01-09 22:07:38'),
(111, 'nanooo', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:07:45', '2022-01-09 22:07:45'),
(112, 'hiiiiiiiiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:08:18', '2022-01-09 22:08:18'),
(113, 'hiiiiiiiiiiiiiiiiiiiiiiiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:08:26', '2022-01-09 22:08:26'),
(114, 'how are you to day', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:08:36', '2022-01-09 22:08:36'),
(115, 'how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:09:01', '2022-01-09 22:09:01'),
(116, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:15:14', '2022-01-09 22:15:14'),
(117, 'zxcvzxcvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:15:18', '2022-01-09 22:15:18'),
(118, 'zxcvxczvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:15:21', '2022-01-09 22:15:21'),
(119, 'good name', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:21:52', '2022-01-09 22:21:52'),
(120, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:22:40', '2022-01-09 22:22:40'),
(121, 'zzzxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:23:45', '2022-01-09 22:23:45'),
(122, 'hiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:25:58', '2022-01-09 22:25:58'),
(123, 'hihihi', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:26:06', '2022-01-09 22:26:06'),
(124, 'ok google', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:26:23', '2022-01-09 22:26:23'),
(125, 'niece', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:26:54', '2022-01-09 22:26:54'),
(126, 'nicee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:28:25', '2022-01-09 22:28:25'),
(127, 'hiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:30:42', '2022-01-09 22:30:42'),
(128, 'hiiiiiiiiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:31:00', '2022-01-09 22:31:00'),
(129, 'zcvxzv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:36:59', '2022-01-09 22:36:59'),
(130, '123213', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:55:42', '2022-01-09 22:55:42'),
(131, 'hi google', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:56:34', '2022-01-09 22:56:34'),
(132, 'ok pro', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:58:52', '2022-01-09 22:58:52'),
(133, 'nice s', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:59:03', '2022-01-09 22:59:03'),
(134, 'how are you today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:59:15', '2022-01-09 22:59:15'),
(135, 'im good', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:59:21', '2022-01-09 22:59:21'),
(136, 'ok nice', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:59:36', '2022-01-09 22:59:36'),
(137, 'great', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:59:46', '2022-01-09 22:59:46'),
(138, 'goods', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 22:59:58', '2022-01-09 22:59:58'),
(139, 'oksadfsa', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:01:21', '2022-01-09 23:01:21'),
(140, 'how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:01:33', '2022-01-09 23:01:33'),
(141, 'finee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:02:58', '2022-01-09 23:02:58'),
(142, 'hiiix', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:05:45', '2022-01-09 23:05:45'),
(143, 'hixhix', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:05:53', '2022-01-09 23:05:53'),
(144, 'casdfsdaf', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:09:44', '2022-01-09 23:09:44'),
(145, 'qweqwewqe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:10:30', '2022-01-09 23:10:30'),
(146, 'qweqwewqe xxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:11:09', '2022-01-09 23:11:09'),
(147, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:13:23', '2022-01-09 23:13:23'),
(148, 'nicesss', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:13:31', '2022-01-09 23:13:31'),
(149, 'ok googllee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:16:23', '2022-01-09 23:16:23'),
(150, '77788', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:23:45', '2022-01-09 23:23:45'),
(151, '789789789789', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:24:32', '2022-01-09 23:24:32'),
(152, 'config', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:28:16', '2022-01-09 23:28:16'),
(153, 'google page', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:28:24', '2022-01-09 23:28:24'),
(154, 'nicerr', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:28:43', '2022-01-09 23:28:43'),
(155, 'thong tin cong ngheeee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:28:50', '2022-01-09 23:28:50'),
(156, 'cong hoa xa hoi', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:29:01', '2022-01-09 23:29:01'),
(157, 'chug ng', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:29:14', '2022-01-09 23:29:14'),
(158, 'zzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-09 23:29:47', '2022-01-09 23:29:47'),
(159, 'zxcxzczxc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:03:06', '2022-01-10 00:03:06'),
(160, 'xzxczxczxczxczxc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:15:04', '2022-01-10 00:15:04'),
(161, '21312312', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:32:31', '2022-01-10 00:32:31'),
(162, '80800', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:32:42', '2022-01-10 00:32:42'),
(163, '9789789789789', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:32:46', '2022-01-10 00:32:46'),
(164, 'xzcvxzcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:41:17', '2022-01-10 00:41:17'),
(165, 'sdfsfsdf', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:41:21', '2022-01-10 00:41:21'),
(166, '23123123', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:42:24', '2022-01-10 00:42:24'),
(167, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 00:42:47', '2022-01-10 00:42:47'),
(168, 'zxczxczxc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:00:40', '2022-01-10 01:00:40'),
(169, '45435435', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:00:45', '2022-01-10 01:00:45'),
(170, 'xcvbxcbxcb', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:00:48', '2022-01-10 01:00:48'),
(171, 'xcvbxcvbxcvb', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:00:52', '2022-01-10 01:00:52'),
(172, '3345345435435', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:00:59', '2022-01-10 01:00:59'),
(173, 'xczvff', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:02:15', '2022-01-10 01:02:15'),
(174, 'zxcvxzcvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:02:53', '2022-01-10 01:02:53'),
(175, '324234234', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:02:59', '2022-01-10 01:02:59'),
(176, 'xxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:03:26', '2022-01-10 01:03:26'),
(177, '13123213', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:03:33', '2022-01-10 01:03:33'),
(178, 'cccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:05:22', '2022-01-10 01:05:22'),
(179, '3453454353455', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:08:04', '2022-01-10 01:08:04'),
(180, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:08:51', '2022-01-10 01:08:51'),
(181, 'zxcvzxcvxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:11:25', '2022-01-10 01:11:25'),
(182, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:40:04', '2022-01-10 01:40:04'),
(183, 'xxzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:41:06', '2022-01-10 01:41:06'),
(184, 'fdsgsd', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:42:01', '2022-01-10 01:42:01'),
(185, 'werewrewr', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:47:33', '2022-01-10 01:47:33'),
(186, 'ccccxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:49:15', '2022-01-10 01:49:15'),
(187, '22222', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 01:49:33', '2022-01-10 01:49:33'),
(188, 'zzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:03:28', '2022-01-10 02:03:28'),
(189, 'zzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:03:39', '2022-01-10 02:03:39'),
(190, 'xcxxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:03:45', '2022-01-10 02:03:45'),
(191, 'xxxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:03:53', '2022-01-10 02:03:53'),
(192, 'zxcvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:04:47', '2022-01-10 02:05:43'),
(193, 'xzcvxczv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:07:06', '2022-01-10 02:07:06'),
(194, 'googleee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:07:15', '2022-01-10 02:07:15'),
(195, '234234', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:15:57', '2022-01-10 02:15:57'),
(196, '345345', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:16:27', '2022-01-10 02:16:27'),
(197, '3243243', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:18:16', '2022-01-10 02:18:16'),
(198, 'thooooo', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:20:22', '2022-01-10 02:20:22'),
(199, 'thooooosss', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:20:55', '2022-01-10 02:20:55'),
(200, '22222', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:32:25', '2022-01-10 02:32:25'),
(201, '44455', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:35:25', '2022-01-10 02:35:25'),
(202, '564564565', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:35:36', '2022-01-10 02:35:36'),
(203, 'ccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:39:04', '2022-01-10 02:39:04'),
(204, '333322323', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:39:45', '2022-01-10 02:39:45'),
(205, 'zxvzxcvxczv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:49:37', '2022-01-10 02:49:37'),
(206, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:49:57', '2022-01-10 02:49:57'),
(207, '12321321', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 02:54:40', '2022-01-10 02:54:40'),
(208, 'mmmmmm', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 03:48:12', '2022-01-10 03:48:12'),
(209, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 03:48:24', '2022-01-10 03:48:24'),
(210, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 03:48:46', '2022-01-10 03:48:46'),
(211, 'niceee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 03:49:02', '2022-01-10 03:49:02'),
(212, 'zxcvxzcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:21:59', '2022-01-10 07:21:59'),
(213, 'zingggg', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:25:41', '2022-01-10 07:25:41'),
(214, 'zzxcxzc', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:30:44', '2022-01-10 07:30:44'),
(215, 'buon lam chi em oi', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:31:07', '2022-01-10 07:31:07'),
(216, 'ca nay cang nhi', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:33:22', '2022-01-10 07:33:22'),
(217, 'cang day', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:34:42', '2022-01-10 07:34:42'),
(218, 'ddddd', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:38:32', '2022-01-10 07:38:32'),
(219, 'vvvvv', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:38:59', '2022-01-10 07:38:59'),
(220, '33333333333333333', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:39:08', '2022-01-10 07:39:08'),
(221, '234234324', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:41:01', '2022-01-10 07:41:01'),
(222, 'ddsdds', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:44:13', '2022-01-10 07:44:13'),
(223, 'ok google', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 07:59:57', '2022-01-10 07:59:57'),
(224, 'hope you ok', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:00:51', '2022-01-10 08:00:51'),
(225, 'niece', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:01:08', '2022-01-10 08:01:08'),
(226, '88888', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:01:41', '2022-01-10 08:01:41'),
(227, '9999999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:04:53', '2022-01-10 08:04:53'),
(228, '66666666', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:05:01', '2022-01-10 08:05:01'),
(229, '666666', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:05:06', '2022-01-10 08:05:06'),
(230, '999999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:09:46', '2022-01-10 08:09:46'),
(231, '23213213', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:11:41', '2022-01-10 08:11:41'),
(232, '456689', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:15:04', '2022-01-10 08:15:04'),
(233, '879789789', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:15:43', '2022-01-10 08:15:43'),
(234, 'aaaaaaaaaaaaaaaaaaaaa', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:27:23', '2022-01-10 08:27:23'),
(235, 'ccccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:30:40', '2022-01-10 08:30:40'),
(236, 'xxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:30:56', '2022-01-10 08:30:56'),
(237, 'zzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:37:39', '2022-01-10 08:37:39'),
(238, 'vvvvvvv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:38:27', '2022-01-10 08:38:27'),
(239, 'cxvxcvxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 08:50:05', '2022-01-10 08:50:05'),
(240, 'zzzzzzzzz', 0, 'Zz', '0', 1, 'published', 0, 0, 0, '2022-01-10 17:56:38', '2022-01-10 17:56:38'),
(241, 'zzzzzzzzz', 0, 'Zz', '0', 1, 'published', 0, 0, 0, '2022-01-10 17:56:54', '2022-01-10 17:56:54'),
(242, 'this is comment', 0, 'Zz', '0', 1, 'published', 0, 0, 0, '2022-01-10 17:59:37', '2022-01-10 17:59:37'),
(243, 'this is comment', 0, 'Zz', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:00:42', '2022-01-10 18:00:42'),
(244, 'this is comment', 1, 'Botble\\Blog\\Models\\Post', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:02:30', '2022-01-10 18:02:30'),
(245, 'this is comment', 1, 'Botble\\Blog\\Models\\Post', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:02:55', '2022-01-10 18:02:55'),
(246, 'this is comment', 1, 'Botble\\Blog\\Models\\Post', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:03:20', '2022-01-10 18:03:20'),
(247, 'this is comment', 1, 'Botble\\Blog\\Models\\Post', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:03:24', '2022-01-10 18:03:24'),
(248, 'this is comment', 1, 'Botble\\Blog\\Models\\Post', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:03:29', '2022-01-10 18:03:29'),
(249, 'this is comment', 1, 'Botble\\Blog\\Models\\Post', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:03:34', '2022-01-10 18:03:34'),
(250, 'this is comment', 1, 'Botble\\Blog\\Models\\Post', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:04:08', '2022-01-10 18:04:08'),
(251, 'this is comment', 1, 'Botble\\Blog\\Models\\Post', '0', 1, 'published', 0, 0, 0, '2022-01-10 18:04:56', '2022-01-10 18:04:56'),
(252, '999999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:06:05', '2022-01-10 18:06:05'),
(253, '879879', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:07:09', '2022-01-10 18:07:09'),
(254, '67766767', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:08:04', '2022-01-10 18:08:04'),
(255, '797979', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:08:59', '2022-01-10 18:08:59'),
(256, '797979', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:10:01', '2022-01-10 18:10:01'),
(257, '797979', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:11:23', '2022-01-10 18:11:23'),
(258, '1234567', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:11:30', '2022-01-10 18:11:30'),
(259, '1234567999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:11:40', '2022-01-10 18:11:40'),
(260, 'hahaha', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:12:32', '2022-01-10 18:12:32'),
(261, 'hahahaha', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:12:37', '2022-01-10 18:12:37'),
(262, 'hahahahaha', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:12:44', '2022-01-10 18:12:44'),
(263, 'okkkk', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:13:49', '2022-01-10 18:13:49'),
(264, '222222', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:16:23', '2022-01-10 18:16:23'),
(265, '33333333', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:16:33', '2022-01-10 18:16:33'),
(266, '666666666', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:16:38', '2022-01-10 18:16:38'),
(267, '8888888', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:19:12', '2022-01-10 18:19:12'),
(268, '9999999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:19:17', '2022-01-10 18:19:17'),
(269, '99999999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:19:22', '2022-01-10 18:19:22'),
(270, 'hey how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:19:38', '2022-01-10 18:19:38'),
(271, 'hyyyyyyyyyy', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:20:36', '2022-01-10 18:20:36'),
(272, 'dddxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:22:24', '2022-01-10 18:22:24'),
(273, 'nieccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:22:50', '2022-01-10 18:22:50'),
(274, 'ok google', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:23:00', '2022-01-10 18:23:00'),
(275, '999999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:23:59', '2022-01-10 18:23:59'),
(276, '9988888', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:24:21', '2022-01-10 18:24:21'),
(277, 'heyyy', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:24:58', '2022-01-10 18:24:58'),
(278, '55555', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:27:09', '2022-01-10 18:27:09'),
(279, '777777777', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:27:15', '2022-01-10 18:27:15'),
(280, '88888888', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:27:20', '2022-01-10 18:27:20'),
(281, '797979', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:28:24', '2022-01-10 18:28:24'),
(282, '787878', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:30:13', '2022-01-10 18:30:13'),
(283, 'ok zzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:30:22', '2022-01-10 18:30:22'),
(284, 'niece', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:30:35', '2022-01-10 18:30:35'),
(285, 'cafefff', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:35:20', '2022-01-10 18:35:20'),
(286, 'zxcvzxcvcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:37:47', '2022-01-10 18:37:47'),
(287, '234234234', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:38:02', '2022-01-10 18:38:02'),
(288, 'zxcvzxvxvzxcvvxzcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:38:08', '2022-01-10 18:38:08'),
(289, '1246790 0', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:38:21', '2022-01-10 18:38:21'),
(290, '99999999999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:38:30', '2022-01-10 18:38:30'),
(291, '797979', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:41:33', '2022-01-10 18:41:33'),
(292, '888888', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:41:38', '2022-01-10 18:41:38'),
(293, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:41:48', '2022-01-10 18:41:48'),
(294, 'zing.vn', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:42:02', '2022-01-10 18:42:02'),
(295, 'how are you today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:43:21', '2022-01-10 18:43:21'),
(296, 'great!!!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:43:35', '2022-01-10 18:43:35'),
(297, 'ok pro', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:43:46', '2022-01-10 18:43:46'),
(298, 'good morning!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:45:08', '2022-01-10 18:45:08'),
(299, 'hey!!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:45:48', '2022-01-10 18:45:48'),
(300, 'hey guys!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:47:33', '2022-01-10 18:47:33'),
(301, 'hello', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:47:52', '2022-01-10 18:47:52'),
(302, 'how are you today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:49:45', '2022-01-10 18:49:45'),
(303, 'good morning', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:49:52', '2022-01-10 18:49:52'),
(304, 'are you ok', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:50:00', '2022-01-10 18:50:00'),
(305, 'hey guys', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:50:11', '2022-01-10 18:50:11'),
(306, 'hello google', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:50:25', '2022-01-10 18:50:25'),
(307, 'zxcvvv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:53:19', '2022-01-10 18:53:19'),
(308, '12313213123', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:53:27', '2022-01-10 18:53:27'),
(309, '123213123123', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:53:43', '2022-01-10 18:53:43'),
(310, 'ccccccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 18:53:49', '2022-01-10 18:53:49'),
(311, 'hey!!!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:13:58', '2022-01-10 19:13:58'),
(312, 'okies', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:14:54', '2022-01-10 19:14:54'),
(313, 'hey sir', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:20:34', '2022-01-10 19:20:34'),
(314, 'how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:21:06', '2022-01-10 19:21:06'),
(315, 'are you ok', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:21:14', '2022-01-10 19:21:14'),
(316, 'great', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:21:23', '2022-01-10 19:21:23'),
(317, 'hello', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:21:37', '2022-01-10 19:21:37'),
(318, 'how are you to day', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:22:29', '2022-01-10 19:22:29'),
(319, 'im good and you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:22:38', '2022-01-10 19:22:38'),
(320, 'nice to meet you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:23:12', '2022-01-10 19:23:12'),
(321, 'how are you today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:23:19', '2022-01-10 19:23:19'),
(322, 'hello', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:23:26', '2022-01-10 19:23:26'),
(323, 'hiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:24:52', '2022-01-10 19:24:52'),
(324, 'testss', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:26:54', '2022-01-10 19:26:54'),
(325, 'niccccccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:27:57', '2022-01-10 19:27:57'),
(326, 'lucky boy', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:28:35', '2022-01-10 19:28:35'),
(327, 'lucky money', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-10 19:28:43', '2022-01-10 19:32:50'),
(328, '666666', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:32:15', '2022-01-10 19:32:15'),
(329, 'cxvbcxvb', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 327, '2022-01-10 19:32:50', '2022-01-10 19:33:32'),
(330, 'xcvxcvxc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 329, '2022-01-10 19:33:32', '2022-01-10 19:33:32'),
(331, 'niecee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:33:53', '2022-01-10 19:33:53'),
(332, 'hiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:35:55', '2022-01-10 19:35:55'),
(333, '123123123123123', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-10 19:36:16', '2022-01-10 19:42:40'),
(334, 'qqqqqqqq', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-10 19:37:04', '2022-01-10 19:37:10'),
(335, 'wwqqqwe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 334, '2022-01-10 19:37:10', '2022-01-10 19:37:20'),
(336, '88888888', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 335, '2022-01-10 19:37:20', '2022-01-10 19:37:20'),
(337, '67677', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-10 19:37:57', '2022-01-10 19:38:03'),
(338, '797979', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 337, '2022-01-10 19:38:03', '2022-01-10 19:39:48'),
(339, '789789', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 338, '2022-01-10 19:39:48', '2022-01-10 19:39:48'),
(340, '99999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 333, '2022-01-10 19:42:40', '2022-01-10 19:42:40'),
(341, 'parent', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-10 19:44:22', '2022-01-10 19:44:29'),
(342, 'child', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 341, '2022-01-10 19:44:29', '2022-01-10 19:44:29'),
(343, '1111111', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:48:31', '2022-01-10 19:48:31'),
(344, '4444444', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:48:45', '2022-01-10 19:48:45'),
(345, '666666', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:48:56', '2022-01-10 19:48:56'),
(346, '99999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:50:32', '2022-01-10 19:50:32'),
(347, '12321', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:54:57', '2022-01-10 19:54:57'),
(348, '111111', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-10 19:56:22', '2022-01-10 19:56:22'),
(349, '123123213', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-10 20:01:13', '2022-01-10 20:01:52'),
(350, 'child', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 349, '2022-01-10 20:01:52', '2022-01-10 20:01:52'),
(351, 'parent', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 0, '2022-01-10 20:03:39', '2022-01-10 20:04:14'),
(352, 'child', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 351, '2022-01-10 20:03:47', '2022-01-10 20:10:20'),
(353, 'sencond', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 351, '2022-01-10 20:04:14', '2022-01-11 05:01:28'),
(354, '333333', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 353, '2022-01-10 20:04:21', '2022-01-10 20:05:47'),
(355, '44444444', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 354, '2022-01-10 20:05:47', '2022-01-10 20:05:47'),
(356, 'xxxxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 352, '2022-01-10 20:07:16', '2022-01-10 20:07:16'),
(357, '345345', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 352, '2022-01-10 20:10:20', '2022-01-10 20:10:58'),
(358, '4443333', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 357, '2022-01-10 20:10:58', '2022-01-10 20:10:58'),
(359, 'hiiyyy', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 0, '2022-01-11 02:39:01', '2022-01-11 04:48:56'),
(360, 'nooeee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 359, '2022-01-11 02:50:15', '2022-01-11 04:48:01'),
(361, '333333333333', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 360, '2022-01-11 02:52:42', '2022-01-11 02:52:42'),
(362, 'how are you today', 109, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 02:56:04', '2022-01-11 02:56:04'),
(364, 'ok greatted', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-11 03:03:17', '2022-01-11 03:03:26'),
(365, 'realease', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 364, '2022-01-11 03:03:26', '2022-01-11 03:03:26'),
(366, 'hiiiiii', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 4, 0, '2022-01-11 03:06:37', '2022-01-11 03:13:48'),
(367, 'how are you??', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 366, '2022-01-11 03:07:23', '2022-01-11 03:11:20'),
(368, 'bcc learning', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 366, '2022-01-11 03:10:19', '2022-01-11 03:10:19'),
(369, ':vvvvvvvs', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 367, '2022-01-11 03:11:20', '2022-01-11 03:11:20'),
(370, 'rrrrrrrrrrrrrrrrrrrr', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 366, '2022-01-11 03:13:26', '2022-01-11 03:13:33'),
(371, 'eeeeeeeeeeeeeeeeeeeee', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 370, '2022-01-11 03:13:33', '2022-01-11 03:13:33');
INSERT INTO `bb_comments` (`id`, `comment`, `reference_id`, `reference_type`, `ip_address`, `user_id`, `status`, `like_count`, `reply_count`, `parent_id`, `created_at`, `updated_at`) VALUES
(372, 'zzzzzzzzzzzzzzzzzzzx', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 366, '2022-01-11 03:13:48', '2022-01-11 03:13:48'),
(373, 'cafefff', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 360, '2022-01-11 04:48:01', '2022-01-11 04:48:01'),
(374, 'zzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 359, '2022-01-11 04:48:56', '2022-01-11 04:50:22'),
(375, 'how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 374, '2022-01-11 04:50:22', '2022-01-11 04:50:22'),
(376, 'alooooo', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-11 04:52:38', '2022-01-11 04:53:14'),
(377, 'how are you today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 376, '2022-01-11 04:53:14', '2022-01-11 04:53:14'),
(378, 'thong tin cong ngheee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 3, 0, '2022-01-11 04:55:32', '2022-01-11 05:56:35'),
(379, 'zxcvxzcvzxvczxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 378, '2022-01-11 04:55:42', '2022-01-11 04:55:42'),
(380, 'xxxxxxxxxxxxxxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 353, '2022-01-11 05:01:28', '2022-01-11 05:01:28'),
(381, 'iiiiiiiiiiiiiiiiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 4, 0, '2022-01-11 05:14:51', '2022-01-11 06:34:07'),
(382, 'iiiiiiiiiiiiiiiiiiiiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 11, 381, '2022-01-11 05:15:10', '2022-01-11 06:30:56'),
(383, 'cccccccccccccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:30:51', '2022-01-11 05:30:51'),
(384, 'eeeeeeeeeeeeeeeee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:31:44', '2022-01-11 05:31:44'),
(385, 'qqqqqq', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:38:23', '2022-01-11 05:38:23'),
(386, 'wwwwwwwwww', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:39:16', '2022-01-11 05:39:16'),
(387, 'rrrrrrrrrrrrrr', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:40:59', '2022-01-11 05:40:59'),
(388, 'fffffffffffffffffff', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:43:40', '2022-01-11 05:43:40'),
(389, 'tttttttt', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:48:43', '2022-01-11 05:48:43'),
(390, 'bbbbbbbbbbbb', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:50:13', '2022-01-11 05:50:13'),
(391, '5555555', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 05:54:03', '2022-01-11 05:54:03'),
(392, 'yyyyyyyyyyyyyyyyy', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 378, '2022-01-11 05:55:25', '2022-01-11 05:55:25'),
(393, 'vvvvvvvvvvvvvv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 378, '2022-01-11 05:56:35', '2022-01-11 05:56:35'),
(394, 'zxcvxzcvzxcv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 06:14:16', '2022-01-11 06:14:16'),
(395, 'zzzzzzzzzzzzzzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 381, '2022-01-11 06:14:40', '2022-01-11 06:28:03'),
(396, 'zxcxzcxzc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 395, '2022-01-11 06:28:03', '2022-01-11 06:28:03'),
(397, 'zxcxzcxzc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 382, '2022-01-11 06:30:55', '2022-01-11 06:30:55'),
(398, 'tttttttttttt', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 381, '2022-01-11 06:32:01', '2022-01-11 06:32:01'),
(399, 'bbbbbbbbb', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 381, '2022-01-11 06:34:07', '2022-01-11 06:34:07'),
(400, 'vvvvvvvvvvvvvv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 5, 0, '2022-01-11 06:34:43', '2022-01-11 06:56:01'),
(401, 'cccccccccccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 400, '2022-01-11 06:35:06', '2022-01-11 06:35:06'),
(402, 'how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 400, '2022-01-11 06:36:09', '2022-01-11 06:36:09'),
(403, 'zxczxczxczxc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 400, '2022-01-11 06:47:03', '2022-01-11 06:47:03'),
(404, 'no need zzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 400, '2022-01-11 06:53:19', '2022-01-11 06:53:19'),
(405, 'how are z', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 400, '2022-01-11 06:56:01', '2022-01-11 06:56:01'),
(406, 'parent task', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 4, 0, '2022-01-11 06:57:07', '2022-01-11 07:00:14'),
(407, 'child', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 406, '2022-01-11 06:57:13', '2022-01-11 06:57:13'),
(408, 'iiiiiiiiiiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 406, '2022-01-11 06:58:14', '2022-01-11 06:58:14'),
(409, 'ppppppppppppp', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 406, '2022-01-11 06:59:21', '2022-01-11 06:59:21'),
(410, 'sssssssssssss', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 406, '2022-01-11 07:00:14', '2022-01-11 07:00:14'),
(411, 'thanks bao boi', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 5, 0, '2022-01-11 07:00:29', '2022-01-11 07:04:09'),
(412, 'tks so much', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 411, '2022-01-11 07:00:43', '2022-01-11 07:00:43'),
(413, 'xxxxxxxxxxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 411, '2022-01-11 07:02:17', '2022-01-11 07:02:17'),
(414, '22222222222222222', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 411, '2022-01-11 07:03:02', '2022-01-11 07:03:02'),
(415, 'ccccccccccccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 411, '2022-01-11 07:03:47', '2022-01-11 07:03:47'),
(416, 'qqqqqqqqqqq', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 411, '2022-01-11 07:04:09', '2022-01-11 07:04:09'),
(417, 'thong tin', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 0, '2022-01-11 07:07:32', '2022-01-11 07:08:12'),
(418, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 417, '2022-01-11 07:07:42', '2022-01-11 07:07:42'),
(419, 'thong tin den ban', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 417, '2022-01-11 07:08:12', '2022-01-11 07:08:12'),
(420, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-11 07:08:34', '2022-01-11 07:08:44'),
(421, 'cuoc song bon chen', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 420, '2022-01-11 07:08:44', '2022-01-11 07:08:44'),
(422, 'nice to meet you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 4, 0, '2022-01-11 18:15:50', '2022-01-11 18:19:02'),
(423, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 422, '2022-01-11 18:16:26', '2022-01-11 18:16:26'),
(424, 'cong hoa', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 422, '2022-01-11 18:18:06', '2022-01-11 18:18:06'),
(425, 'xa hoi', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 422, '2022-01-11 18:18:40', '2022-01-11 18:18:40'),
(426, '1234567', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 422, '2022-01-11 18:19:02', '2022-01-11 18:19:02'),
(427, 'zzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 3, 0, '2022-01-11 18:19:12', '2022-01-11 18:20:02'),
(428, '6666777', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 427, '2022-01-11 18:19:19', '2022-01-11 18:19:19'),
(429, '1234567', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 427, '2022-01-11 18:19:46', '2022-01-11 18:19:46'),
(430, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 427, '2022-01-11 18:20:02', '2022-01-11 18:20:02'),
(431, 'nice to meet you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-11 18:21:02', '2022-01-11 18:21:21'),
(432, 'how are you today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 431, '2022-01-11 18:21:21', '2022-01-11 18:21:21'),
(433, 'nice to meet y', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 0, '2022-01-11 18:22:20', '2022-01-11 18:29:04'),
(434, 'eeeeeeeeee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 433, '2022-01-11 18:22:36', '2022-01-11 18:23:37'),
(435, 'zzzzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 434, '2022-01-11 18:23:29', '2022-01-11 18:23:29'),
(436, '444444444444', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 434, '2022-01-11 18:23:37', '2022-01-11 18:23:37'),
(437, 'hiiiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 433, '2022-01-11 18:29:04', '2022-01-11 18:29:04'),
(438, 'ccccccccccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 0, '2022-01-11 18:32:10', '2022-01-11 18:39:31'),
(439, 'zzzzzzzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 438, '2022-01-11 18:32:23', '2022-01-11 18:32:23'),
(440, 'sssssssssssssss', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 438, '2022-01-11 18:39:31', '2022-01-11 18:39:31'),
(441, 'xcccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 18:52:31', '2022-01-11 18:52:31'),
(442, 'zxczxc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:20:27', '2022-01-11 19:20:27'),
(443, 'good morning today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:27:43', '2022-01-11 19:27:43'),
(444, 'hi, how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:28:46', '2022-01-11 19:28:46'),
(445, 'hello', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:29:39', '2022-01-11 19:29:39'),
(446, 'zzzzzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:29:44', '2022-01-11 19:29:44'),
(447, 'xxxxxxxxxxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:29:47', '2022-01-11 19:29:47'),
(448, 'ccccccccccccccccccccc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:29:51', '2022-01-11 19:29:51'),
(449, '111111111111111111111', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:29:56', '2022-01-11 19:29:56'),
(450, '4444444444444444444444', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:30:00', '2022-01-11 19:30:00'),
(451, '555555555555555555555', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:30:09', '2022-01-11 19:30:09'),
(452, '7777777777777', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:44:43', '2022-01-11 19:44:43'),
(453, '88888888888888888888', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:44:47', '2022-01-11 19:44:47'),
(454, '9999999999999999999999', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-11 19:44:51', '2022-01-11 19:44:51'),
(455, 'how are you today', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-11 19:50:26', '2022-01-11 20:30:45'),
(456, 'zzzzzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 4, 0, '2022-01-11 20:22:44', '2022-01-11 20:31:21'),
(457, 'thong tin cong nghe', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 456, '2022-01-11 20:24:18', '2022-01-11 20:24:18'),
(458, 'cafef', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 456, '2022-01-11 20:24:31', '2022-01-11 20:24:31'),
(460, 'zzzzzzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 455, '2022-01-11 20:30:45', '2022-01-11 20:30:45'),
(461, 'xxxxxxxxxxxxxx', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 456, '2022-01-11 20:31:21', '2022-01-11 20:31:21'),
(462, 'ppppppppppp', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 2, 0, '2022-01-11 20:31:38', '2022-01-15 02:41:20'),
(463, 'eeeeeeeeeeeee', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 462, '2022-01-11 20:31:45', '2022-01-15 02:37:47'),
(464, 'rrrrrrrrrr', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 462, '2022-01-11 20:33:38', '2022-01-11 20:33:38'),
(465, 'zzzzzzzzzzzz', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 2, 0, '2022-01-11 20:35:02', '2022-01-15 02:28:16'),
(467, 'vvvvvvvv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 463, '2022-01-11 20:37:22', '2022-01-15 02:43:55'),
(469, 'rrrrrrrrr', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 465, '2022-01-11 20:43:14', '2022-01-15 02:41:13'),
(473, '2222222222222222', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 472, '2022-01-11 20:44:33', '2022-01-11 20:44:45'),
(474, '3333333333333', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 473, '2022-01-11 20:44:45', '2022-01-11 20:45:01'),
(475, '44444444444', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 474, '2022-01-11 20:45:01', '2022-01-11 20:45:01'),
(480, 'baaaaaa', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 479, '2022-01-11 20:48:40', '2022-01-11 20:48:40'),
(484, '55555', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 483, '2022-01-11 20:57:01', '2022-01-11 20:57:01'),
(494, '3333333333', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 493, '2022-01-12 18:38:53', '2022-01-12 18:38:53'),
(499, 'vvvvvvvvvvvvvvvv', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 498, '2022-01-12 18:57:16', '2022-01-12 18:57:16'),
(504, 'reply 502', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 502, '2022-01-12 23:47:59', '2022-01-12 23:47:59'),
(514, '1111111111111111111', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 3, 0, '2022-01-13 00:36:30', '2022-01-13 00:49:18'),
(515, '514\'s', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 514, '2022-01-13 00:36:44', '2022-01-13 00:36:44'),
(516, 'xzcvxzcv', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 514, '2022-01-13 00:39:54', '2022-01-13 00:39:54'),
(517, 'hiiiiiiiiii', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 514, '2022-01-13 00:49:18', '2022-01-13 00:49:18'),
(518, 'parentt', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 5, 0, '2022-01-13 00:56:53', '2022-01-13 05:12:07'),
(519, 'childt', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 518, '2022-01-13 00:57:00', '2022-01-13 00:57:00'),
(520, '518\'ss', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 518, '2022-01-13 01:00:44', '2022-01-13 01:00:44'),
(521, '1231231', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 518, '2022-01-13 05:04:31', '2022-01-13 05:04:31'),
(522, 'zxxxxxx', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 518, '2022-01-13 05:10:41', '2022-01-13 05:10:41'),
(523, '518\'s', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 518, '2022-01-13 05:12:07', '2022-01-13 05:12:07'),
(524, 'hiiiiiiiiiiiiiiiii', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 3, 0, '2022-01-13 05:12:31', '2022-01-13 06:22:14'),
(525, 'hooooooooooo', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 524, '2022-01-13 05:12:53', '2022-01-13 05:12:53'),
(526, '111111111111111111', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 524, '2022-01-13 05:51:07', '2022-01-13 05:51:07'),
(527, '222222222222', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 524, '2022-01-13 06:22:14', '2022-01-13 06:22:14'),
(528, 'how are you today?', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 5, 0, '2022-01-13 06:24:02', '2022-01-13 06:37:16'),
(529, 'child of how', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 528, '2022-01-13 06:24:14', '2022-01-13 06:24:14'),
(530, 'xxxxxx', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 528, '2022-01-13 06:25:49', '2022-01-13 06:25:49'),
(531, '111111111111', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 528, '2022-01-13 06:28:29', '2022-01-13 06:28:29'),
(532, '797979', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 528, '2022-01-13 06:32:34', '2022-01-13 06:32:34'),
(533, '456789', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 528, '2022-01-13 06:37:15', '2022-01-13 06:37:15'),
(534, 'non quas a', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 7, 0, '2022-01-13 06:39:28', '2022-01-13 06:45:39'),
(535, '1111111111111', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 534, '2022-01-13 06:39:43', '2022-01-13 06:39:43'),
(536, '22222222222', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 534, '2022-01-13 06:40:33', '2022-01-13 06:40:33'),
(537, '3333333333', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 534, '2022-01-13 06:41:30', '2022-01-13 06:41:30'),
(538, '444444444', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 534, '2022-01-13 06:42:22', '2022-01-13 06:42:22'),
(539, '555555555555', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 534, '2022-01-13 06:43:41', '2022-01-13 06:43:41'),
(540, '666666666666', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 534, '2022-01-13 06:44:53', '2022-01-13 06:44:53'),
(541, '6666666677777', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 534, '2022-01-13 06:45:39', '2022-01-13 06:45:39'),
(542, 'how are you', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 4, 0, '2022-01-13 06:46:33', '2022-01-13 06:54:59'),
(543, 'am ok', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 542, '2022-01-13 06:46:46', '2022-01-13 06:46:46'),
(544, '1234545', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 542, '2022-01-13 06:47:25', '2022-01-13 06:47:25'),
(545, 'if ok and ok', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 3, 0, '2022-01-13 06:50:09', '2022-01-15 04:44:40'),
(546, 'if not ok olaso ok', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 542, '2022-01-13 06:50:27', '2022-01-13 06:50:27'),
(547, 'con cai nit', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 545, '2022-01-13 06:50:40', '2022-01-13 06:50:40'),
(548, 'zxcvzxcv', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 542, '2022-01-13 06:54:59', '2022-01-13 06:54:59'),
(549, '123456', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 3, 545, '2022-01-13 06:57:56', '2022-01-15 04:44:42'),
(550, '123213123', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 549, '2022-01-13 06:58:15', '2022-01-13 06:58:15'),
(551, '233323', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 549, '2022-01-13 06:58:32', '2022-01-13 06:58:32'),
(552, 'eeeeeeeee', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 549, '2022-01-13 06:58:42', '2022-01-13 06:58:42'),
(553, '11111', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 545, '2022-01-13 06:59:08', '2022-01-13 06:59:08'),
(554, 'how are you', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-13 19:48:41', '2022-01-13 19:48:41'),
(555, 'how are you today', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-13 19:49:10', '2022-01-13 19:49:10'),
(556, 'how are you today', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 0, '2022-01-13 19:50:16', '2022-01-14 03:30:03'),
(557, 'helloxxx', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 7, 0, '2022-01-14 02:51:01', '2022-01-14 03:28:45'),
(558, '1111111111', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 557, '2022-01-14 02:51:13', '2022-01-14 03:03:50'),
(559, '123123', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 2, 558, '2022-01-14 03:03:50', '2022-01-14 03:04:23'),
(560, '123123', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 559, '2022-01-14 03:04:03', '2022-01-14 03:04:03'),
(561, '22222', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 559, '2022-01-14 03:04:23', '2022-01-14 03:04:23'),
(562, 'hiiiiiiiiiiii', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 557, '2022-01-14 03:10:53', '2022-01-14 03:10:53'),
(563, 'helo\'s', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 557, '2022-01-14 03:14:24', '2022-01-14 03:14:24'),
(564, '111111111111111111111', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 557, '2022-01-14 03:18:28', '2022-01-14 03:18:28'),
(565, 'ssssssssss', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 557, '2022-01-14 03:22:40', '2022-01-14 03:22:40'),
(566, '22222222222222222', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 557, '2022-01-14 03:27:36', '2022-01-14 03:27:36'),
(567, '333333333333', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 557, '2022-01-14 03:28:45', '2022-01-14 03:28:45'),
(568, 'how are youuuuuuuuuu', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 556, '2022-01-14 03:29:32', '2022-01-14 03:29:32'),
(569, 'ok fine', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 556, '2022-01-14 03:30:03', '2022-01-14 03:30:03'),
(570, 'babby', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-14 05:51:36', '2022-01-14 05:51:36'),
(571, 'iokkk', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-14 05:51:43', '2022-01-14 05:51:50'),
(572, 'zzzzzzzzzzzzzzzz', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 571, '2022-01-14 05:51:50', '2022-01-14 05:51:57'),
(573, 'tttttttttttttt', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 572, '2022-01-14 05:51:57', '2022-01-14 05:52:01'),
(574, '55555555555555', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 573, '2022-01-14 05:52:01', '2022-01-14 05:52:06'),
(575, '111111111111111', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 574, '2022-01-14 05:52:06', '2022-01-14 05:52:10'),
(576, '333333333333', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 575, '2022-01-14 05:52:10', '2022-01-14 05:52:10'),
(577, '222222222222', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 0, '2022-01-14 05:54:11', '2022-01-14 06:37:43'),
(578, '333333333333', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 577, '2022-01-14 05:54:20', '2022-01-14 06:25:43'),
(579, 'zzzzzzzzzzzzzzzzc', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-14 05:55:33', '2022-01-14 05:55:37'),
(580, '4444444444444444', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 579, '2022-01-14 05:55:37', '2022-01-14 06:58:57'),
(581, '44545', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-14 06:00:37', '2022-01-14 06:00:37'),
(584, '454545', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 0, '2022-01-14 06:06:14', '2022-01-14 06:22:27'),
(585, '345345345', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 584, '2022-01-14 06:22:27', '2022-01-14 06:22:31'),
(586, '345345', 106, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 0, '2022-01-14 06:22:53', '2022-01-14 06:22:56'),
(587, 'how are you', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-14 17:52:52', '2022-01-14 17:52:52'),
(588, 'ok fine', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 0, '2022-01-14 18:37:00', '2022-01-14 19:32:27'),
(589, 'how are yourr', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 5, 0, '2022-01-14 18:37:18', '2022-01-14 18:54:44'),
(590, 'nices', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 589, '2022-01-14 18:37:26', '2022-01-14 18:37:26'),
(591, '111111111111111', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 589, '2022-01-14 18:38:06', '2022-01-14 19:30:57'),
(592, '11111111', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 589, '2022-01-14 18:39:30', '2022-01-14 19:50:35'),
(593, '11111111111', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 589, '2022-01-14 18:41:20', '2022-01-14 19:25:15'),
(594, 'eeeeeee', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 589, '2022-01-14 18:41:24', '2022-01-14 19:03:25'),
(595, '123213123', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 0, '2022-01-14 18:42:30', '2022-01-14 20:44:59'),
(596, 'xxxxxxxxxxxx', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 595, '2022-01-14 18:42:46', '2022-01-14 20:44:52'),
(597, '`12`12`1', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 0, '2022-01-14 18:43:32', '2022-01-14 18:46:44'),
(598, 'ok google', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 0, '2022-01-14 18:48:19', '2022-01-14 20:44:44'),
(599, 'ffffffffff', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 588, '2022-01-14 18:56:48', '2022-01-14 19:32:23'),
(600, 'zzzzzzzzzzzzz', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 2, 0, '2022-01-14 19:32:04', '2022-01-14 20:39:30'),
(601, 'zzzzzzzzzzz', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 600, '2022-01-14 19:37:19', '2022-01-14 20:45:38'),
(602, 'heyyyyyyyy', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 3, 0, '2022-01-14 20:07:36', '2022-01-14 21:27:59'),
(603, 'xxxxxxxxx', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 600, '2022-01-14 20:39:30', '2022-01-14 20:45:41'),
(604, '111111111111111111111', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 602, '2022-01-14 20:47:24', '2022-01-14 20:49:52'),
(605, '2222222222222222', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 604, '2022-01-14 20:49:52', '2022-01-14 20:49:52'),
(606, 'zzzzzzzzzz', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 602, '2022-01-14 21:27:48', '2022-01-14 21:27:48'),
(607, 'vvvvvvvvvvvv', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 602, '2022-01-14 21:27:59', '2022-01-14 21:27:59'),
(610, '2222222', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 609, '2022-01-14 21:31:20', '2022-01-14 21:31:20'),
(611, 'xxxxxxxxx', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 2, 0, '2022-01-14 21:32:06', '2022-01-14 22:09:18'),
(612, '111111', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 611, '2022-01-14 21:32:14', '2022-01-14 22:09:38'),
(613, '22222', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 612, '2022-01-14 22:05:24', '2022-01-14 22:05:24'),
(614, '123456', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 611, '2022-01-14 22:09:18', '2022-01-14 22:09:35'),
(615, '123213213', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 2, 0, '2022-01-14 22:10:08', '2022-01-14 22:14:31'),
(616, '55555555', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 615, '2022-01-14 22:10:21', '2022-01-14 22:10:51'),
(617, '123213213', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 615, '2022-01-14 22:14:31', '2022-01-14 22:16:28'),
(618, '2222222', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 617, '2022-01-14 22:14:41', '2022-01-14 22:16:33'),
(619, '11111111111', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 618, '2022-01-14 22:15:21', '2022-01-14 22:16:51'),
(620, 'zxczxc', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 0, '2022-01-14 22:17:27', '2022-01-14 22:18:27'),
(630, 'noooo', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 628, '2022-01-14 22:33:21', '2022-01-14 22:33:21'),
(631, '12331212', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 628, '2022-01-14 22:34:45', '2022-01-14 22:34:45'),
(635, '123123123123', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 634, '2022-01-14 22:37:17', '2022-01-14 22:37:17'),
(667, '12345', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:14:29', '2022-01-15 00:14:29'),
(668, '123456', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:15:20', '2022-01-15 00:15:20'),
(674, '5345345345', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:24:16', '2022-01-15 00:24:16'),
(675, '3323555', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:25:08', '2022-01-15 00:25:08'),
(676, 'xcvbxcvb', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:26:54', '2022-01-15 00:26:54'),
(677, 'hiiiiiiiiii', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-15 00:33:47', '2022-01-15 00:35:47'),
(678, 'hiiiiiiiiiiiiiiiii', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 677, '2022-01-15 00:35:47', '2022-01-15 00:35:47'),
(679, 'how are you', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:36:34', '2022-01-15 00:36:34'),
(680, 'how are you!!!', 120, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:36:59', '2022-01-15 00:36:59'),
(681, '234234324213213', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:38:56', '2022-01-15 00:38:56'),
(682, '22222', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:42:07', '2022-01-15 00:42:07'),
(683, 'ok google', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:42:52', '2022-01-15 00:42:52'),
(684, 'nices', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:43:06', '2022-01-15 00:43:06'),
(685, '11111111111', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:48:30', '2022-01-15 00:48:30'),
(686, 'asdasdsad', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:48:37', '2022-01-15 00:48:37'),
(687, 'nices2222222', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:48:45', '2022-01-15 00:48:45'),
(688, '99999999999999999', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:48:59', '2022-01-15 00:48:59'),
(689, '787878', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 1, 0, '2022-01-15 00:51:05', '2022-01-15 00:51:50'),
(690, '12356777', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 689, '2022-01-15 00:51:50', '2022-01-15 00:51:50'),
(691, '78787879', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:51:59', '2022-01-15 00:51:59'),
(692, '1234567', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:53:06', '2022-01-15 00:53:06'),
(693, '1234567890', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:53:15', '2022-01-15 00:53:15'),
(694, '123456', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:58:03', '2022-01-15 00:58:03'),
(695, '123456890333', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 00:59:13', '2022-01-15 00:59:13'),
(696, '1234568', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:10:40', '2022-01-15 01:10:40'),
(697, '123456789', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:10:50', '2022-01-15 01:10:50'),
(698, '12345678989', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:31:31', '2022-01-15 01:31:31'),
(699, '12345678999', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:34:09', '2022-01-15 01:34:09'),
(700, '12345678988', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:35:18', '2022-01-15 01:35:18'),
(701, 'so sad', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:36:26', '2022-01-15 01:36:26'),
(702, 'how are you today', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:37:23', '2022-01-15 01:37:23'),
(703, 'zzzzzzzzzzzz', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:37:33', '2022-01-15 01:37:33'),
(704, 'rrrrrrrrrrrrr', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:37:40', '2022-01-15 01:37:40'),
(705, 'ok fine', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:38:52', '2022-01-15 01:38:52'),
(706, 'hjjjjj', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:39:07', '2022-01-15 01:39:07'),
(707, 'how are you', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:39:41', '2022-01-15 01:39:41'),
(708, 'hjjjjjwwww', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:39:50', '2022-01-15 01:39:50'),
(713, 'hjjjjjw', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:41:19', '2022-01-15 01:41:19'),
(714, 'nano s', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:41:57', '2022-01-15 01:41:57'),
(715, 'nano t', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:42:04', '2022-01-15 01:42:04'),
(716, '696969', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:43:00', '2022-01-15 01:43:00'),
(717, '696969', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:43:02', '2022-01-15 01:43:02'),
(718, 'zzzzzzzzzzzzzzzzz', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:43:22', '2022-01-15 01:43:22'),
(719, 'how are you', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:43:42', '2022-01-15 01:43:42'),
(720, 'how are you9', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 0, '2022-01-15 01:45:59', '2022-01-15 01:51:43'),
(721, 'okkkk', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 720, '2022-01-15 01:51:43', '2022-01-15 01:51:48'),
(722, '9999999', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:51:54', '2022-01-15 01:51:54'),
(723, '909090', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:52:43', '2022-01-15 01:52:43'),
(724, 'NOT GOOD TODAY', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:55:15', '2022-01-15 01:55:15'),
(725, 'SOME GOOD TODAY', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:55:32', '2022-01-15 01:55:32'),
(726, '90909', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 01:58:27', '2022-01-15 01:58:27'),
(727, '90909789', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 02:01:45', '2022-01-15 02:01:45'),
(728, '67899', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 02:11:52', '2022-01-15 02:11:52'),
(729, '56789', 2, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 02:12:00', '2022-01-15 02:12:00'),
(735, 'nice to meet you', 105, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 02:21:13', '2022-01-15 02:21:13'),
(736, 'xzcxzczxc', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 469, '2022-01-15 02:37:56', '2022-01-15 02:41:16'),
(737, '1234456456', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 0, '2022-01-15 02:40:53', '2022-01-15 02:41:09'),
(738, 'fffffffffffffffff', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 737, '2022-01-15 02:41:02', '2022-01-15 02:41:06'),
(739, '213123213', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 0, '2022-01-15 02:41:28', '2022-01-15 02:44:11'),
(740, '5555555555555', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 0, '2022-01-15 02:41:34', '2022-01-15 02:41:52'),
(741, '79799', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 02:45:45', '2022-01-15 02:45:45'),
(742, 'how are you', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 0, '2022-01-15 02:46:05', '2022-01-15 02:49:04'),
(744, 'how are you', 4, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 0, '2022-01-15 04:44:50', '2022-01-15 04:44:54'),
(745, 'helloo!!!!!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 0, '2022-01-15 06:22:01', '2022-01-15 06:22:22'),
(746, 'how are you to day ???', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 3, 0, '2022-01-15 06:22:32', '2022-01-15 06:23:12'),
(747, 'Im ok', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 746, '2022-01-15 06:22:45', '2022-01-15 06:22:45'),
(748, 'nice to meet you!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 746, '2022-01-15 06:22:58', '2022-01-15 06:23:19'),
(749, 'do you have any question?', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 746, '2022-01-15 06:23:12', '2022-01-15 06:23:17'),
(750, 'hello, good morning!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 0, 0, 0, '2022-01-15 06:29:56', '2022-01-15 06:29:56'),
(751, 'thank you so much!!! &lt;3', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 0, '2022-01-15 06:30:29', '2022-01-15 06:30:45'),
(752, 'nice!!!!', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 1, 751, '2022-01-15 06:30:45', '2022-01-15 06:30:57'),
(753, 'hiiiii', 1, 'Botble\\Blog\\Models\\Post', '127.0.0.1', 1, 'published', 1, 0, 752, '2022-01-15 06:30:52', '2022-01-15 06:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `bb_comment_likes`
--

CREATE TABLE `bb_comment_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bb_comment_likes`
--

INSERT INTO `bb_comment_likes` (`id`, `comment_id`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 584, 1, '2022-01-14 06:22:24', '2022-01-14 06:22:24'),
(7, 585, 1, '2022-01-14 06:22:31', '2022-01-14 06:22:31'),
(8, 586, 1, '2022-01-14 06:22:56', '2022-01-14 06:22:56'),
(11, 578, 1, '2022-01-14 06:25:43', '2022-01-14 06:25:43'),
(12, 577, 1, '2022-01-14 06:37:43', '2022-01-14 06:37:43'),
(13, 580, 1, '2022-01-14 06:58:57', '2022-01-14 06:58:57'),
(17, 597, 1, '2022-01-14 18:46:44', '2022-01-14 18:46:44'),
(20, 589, 1, '2022-01-14 18:54:44', '2022-01-14 18:54:44'),
(23, 594, 1, '2022-01-14 19:03:25', '2022-01-14 19:03:25'),
(36, 593, 1, '2022-01-14 19:25:15', '2022-01-14 19:25:15'),
(37, 591, 1, '2022-01-14 19:30:57', '2022-01-14 19:30:57'),
(38, 599, 1, '2022-01-14 19:32:23', '2022-01-14 19:32:23'),
(39, 588, 1, '2022-01-14 19:32:27', '2022-01-14 19:32:27'),
(48, 592, 1, '2022-01-14 19:50:35', '2022-01-14 19:50:35'),
(74, 600, 1, '2022-01-14 20:38:27', '2022-01-14 20:38:27'),
(78, 598, 1, '2022-01-14 20:44:44', '2022-01-14 20:44:44'),
(79, 596, 1, '2022-01-14 20:44:52', '2022-01-14 20:44:52'),
(80, 595, 1, '2022-01-14 20:44:59', '2022-01-14 20:44:59'),
(81, 602, 1, '2022-01-14 20:45:25', '2022-01-14 20:45:25'),
(82, 601, 1, '2022-01-14 20:45:38', '2022-01-14 20:45:38'),
(83, 603, 1, '2022-01-14 20:45:41', '2022-01-14 20:45:41'),
(84, 611, 1, '2022-01-14 22:09:10', '2022-01-14 22:09:10'),
(85, 614, 1, '2022-01-14 22:09:35', '2022-01-14 22:09:35'),
(86, 612, 1, '2022-01-14 22:09:38', '2022-01-14 22:09:38'),
(87, 615, 1, '2022-01-14 22:10:11', '2022-01-14 22:10:11'),
(89, 616, 1, '2022-01-14 22:10:51', '2022-01-14 22:10:51'),
(92, 617, 1, '2022-01-14 22:16:28', '2022-01-14 22:16:28'),
(93, 618, 1, '2022-01-14 22:16:33', '2022-01-14 22:16:33'),
(94, 619, 1, '2022-01-14 22:16:51', '2022-01-14 22:16:51'),
(96, 620, 1, '2022-01-14 22:18:27', '2022-01-14 22:18:27'),
(97, 657, 1, '2022-01-14 23:14:54', '2022-01-14 23:14:54'),
(100, 652, 1, '2022-01-14 23:15:24', '2022-01-14 23:15:24'),
(101, 653, 1, '2022-01-14 23:15:31', '2022-01-14 23:15:31'),
(102, 656, 1, '2022-01-14 23:15:39', '2022-01-14 23:15:39'),
(103, 660, 1, '2022-01-14 23:15:56', '2022-01-14 23:15:56'),
(105, 661, 1, '2022-01-14 23:17:03', '2022-01-14 23:17:03'),
(106, 658, 1, '2022-01-14 23:17:07', '2022-01-14 23:17:07'),
(107, 659, 1, '2022-01-14 23:17:09', '2022-01-14 23:17:09'),
(108, 662, 1, '2022-01-14 23:22:03', '2022-01-14 23:22:03'),
(112, 663, 1, '2022-01-14 23:24:24', '2022-01-14 23:24:24'),
(115, 655, 1, '2022-01-14 23:30:02', '2022-01-14 23:30:02'),
(118, 664, 1, '2022-01-14 23:32:20', '2022-01-14 23:32:20'),
(119, 665, 1, '2022-01-14 23:32:32', '2022-01-14 23:32:32'),
(120, 666, 1, '2022-01-14 23:32:43', '2022-01-14 23:32:43'),
(121, 654, 1, '2022-01-14 23:33:00', '2022-01-14 23:33:00'),
(122, 671, 1, '2022-01-15 00:20:33', '2022-01-15 00:20:33'),
(123, 670, 1, '2022-01-15 00:20:45', '2022-01-15 00:20:45'),
(124, 672, 1, '2022-01-15 00:20:56', '2022-01-15 00:20:56'),
(125, 720, 1, '2022-01-15 01:51:35', '2022-01-15 01:51:35'),
(126, 721, 1, '2022-01-15 01:51:48', '2022-01-15 01:51:48'),
(127, 732, 1, '2022-01-15 02:20:45', '2022-01-15 02:20:45'),
(128, 363, 1, '2022-01-15 02:20:48', '2022-01-15 02:20:48'),
(129, 465, 1, '2022-01-15 02:28:16', '2022-01-15 02:28:16'),
(130, 466, 1, '2022-01-15 02:28:20', '2022-01-15 02:28:20'),
(131, 463, 1, '2022-01-15 02:37:47', '2022-01-15 02:37:47'),
(132, 738, 1, '2022-01-15 02:41:06', '2022-01-15 02:41:06'),
(133, 737, 1, '2022-01-15 02:41:09', '2022-01-15 02:41:09'),
(134, 469, 1, '2022-01-15 02:41:13', '2022-01-15 02:41:13'),
(135, 736, 1, '2022-01-15 02:41:16', '2022-01-15 02:41:16'),
(136, 462, 1, '2022-01-15 02:41:20', '2022-01-15 02:41:20'),
(137, 740, 1, '2022-01-15 02:41:52', '2022-01-15 02:41:52'),
(138, 467, 1, '2022-01-15 02:43:55', '2022-01-15 02:43:55'),
(139, 739, 1, '2022-01-15 02:44:11', '2022-01-15 02:44:11'),
(140, 742, 1, '2022-01-15 02:49:04', '2022-01-15 02:49:04'),
(141, 545, 1, '2022-01-15 04:44:40', '2022-01-15 04:44:40'),
(142, 549, 1, '2022-01-15 04:44:42', '2022-01-15 04:44:42'),
(143, 744, 1, '2022-01-15 04:44:54', '2022-01-15 04:44:54'),
(144, 745, 1, '2022-01-15 06:22:22', '2022-01-15 06:22:22'),
(145, 746, 1, '2022-01-15 06:22:36', '2022-01-15 06:22:36'),
(146, 749, 1, '2022-01-15 06:23:17', '2022-01-15 06:23:17'),
(147, 748, 1, '2022-01-15 06:23:19', '2022-01-15 06:23:19'),
(148, 751, 1, '2022-01-15 06:30:33', '2022-01-15 06:30:33'),
(149, 752, 1, '2022-01-15 06:30:57', '2022-01-15 06:30:57'),
(150, 753, 1, '2022-01-15 06:31:01', '2022-01-15 06:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `bb_comment_ratings`
--

CREATE TABLE `bb_comment_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bb_comment_ratings`
--

INSERT INTO `bb_comment_ratings` (`id`, `rating`, `reference_id`, `reference_type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 120, 'Botble\\Blog\\Models\\Post', 1, '2022-01-15 00:24:16', '2022-01-15 00:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `bb_comment_recommends`
--

CREATE TABLE `bb_comment_recommends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bb_comment_recommends`
--

INSERT INTO `bb_comment_recommends` (`id`, `reference_id`, `reference_type`, `user_id`, `created_at`, `updated_at`) VALUES
(7, 120, 'Botble\\Blog\\Models\\Post', 1, '2022-01-15 00:28:23', '2022-01-15 00:28:23');

-- --------------------------------------------------------

--
-- Table structure for table `bb_comment_users`
--

CREATE TABLE `bb_comment_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\Comment\\Models\\CommentUser',
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bb_comment_users`
--

INSERT INTO `bb_comment_users` (`id`, `name`, `email`, `password`, `user_type`, `avatar_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nvhug002', 'nvhug002@gmail.com', '$2y$10$LjVIX85L9txErjbKkoAMruXw9TYAxd/JvMjbaHtN1HliH3qgXbHUG', 'Botble\\Comment\\Models\\CommentUser', 1655, 'Alz0Si8Nx2hTa520ZoHHSnTzIyJvekyQY3Kgxonay5OgD5ECVJgeLLv1aWiZ', '2022-01-08 00:13:44', '2022-01-09 23:01:04'),
(2, 'nvhug001', 'nvhug001@gmail.com', '$2y$10$yLGh0a3NQyu2gp04HF0z3.w2oz1hnbjhjZleIkYrfw9OOUcvChCZK', 'Botble\\Comment\\Models\\CommentUser', NULL, 'GlCx5WXdD7ha4UT3I1BkYyXZU0XhvzEc4nPFUOK1jgOzOG941xrXSKsHRNDd', '2022-01-15 06:29:17', '2022-01-15 06:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `careers`
--

INSERT INTO `careers` (`id`, `name`, `location`, `salary`, `content`, `status`, `created_at`, `updated_at`, `description`) VALUES
(1, 'Sales Manager (Up to 2600$)', 'Ho Chi Minh, Viet Nam', '1300$ - 2600$', '<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>BENEFITS FOR YOU</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Applicants receive a salary from 1300 USD to 2600 USD<br />\r\n- Fully enjoy the regimes according to Vietnam&#39;s Labor Law: Social insurance, health insurance, unemployment insurance<br />\r\n- Trained to improve expertise and capacity in suitable positions.</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>JOB DESCRIPTION</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Coordinate with the Investment Department in organizing the collection, analysis, evaluation of market information and submitting proposals for planning the project&#39;s products and investment cooperation plans (if any);<br />\r\n- Acting as a focal point of exploitation and trading with customers, managing trading floors and distributors;<br />\r\n- Checking and approving the selection of sales units, management units for exploitation, operation and investment cooperation;<br />\r\n- Leading the negotiation and management of contracts with customers, sales units, management of exploitation, operation and investment cooperation;<br />\r\n- Prepare and submit a price approval for the sale, lease, and cooperation prices of all real estate projects;<br />\r\n- Develop sales plans, sales policies, support and promotions;<br />\r\n- Coordinate with member companies (Project Management Board) to collect and hand over product records (technical documents, red books, sales contracts ...) to hand over customers;<br />\r\n- Deploy customer support activities;</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>JOB REQUIREMENTS</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Preferred age: 30-35<br />\r\n- University degree in Business Administration, Economics, or related industries.<br />\r\n- Over 03 years of experience in assuming the position of Real Estate Business City<br />\r\n- Priority with a certificate of real estate broker, certificate of real estate trading floor management<br />\r\n- Good planning, operating, and control skills<br />\r\n- Good communication, negotiation and problem-solving skills</span></span></p>', 'published', '2019-11-30 19:43:10', '2019-11-30 19:46:53', NULL),
(3, 'Senior Real Estate Consultant Demo', 'Ho Chi Minh, Viet Nam', 'From 1500$', '<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>BENEFITS FOR YOU</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Basic salary 500$&nbsp;/ month.<br />\r\n- Access to diverse sources of goods and opportunities from reputable investors.<br />\r\n- Retrospective salary policy up to 2400$-7000$&nbsp;/ year.<br />\r\n- Commission of 22-50% and a commission 1000$ / successful transaction in the month.<br />\r\n- Effective bonus 0.6-3% of annual revenue.<br />\r\n- A place to build your personal brand in a standard and different way.<br />\r\n- Attend seminars on real estate every 6 months.<br />\r\n- Participate in the course on negotiation skills (Win - Win), language of sales (Language of Sales), customer mind marketing (SOI), customer conversion from social networks (Go Social)<br />\r\n- Unlimited promotion opportunities.<br />\r\n- Working with professional space and modern open office design.<br />\r\n- Welfare policy, domestic and foreign tourism ...<br />\r\n- Decentralized, democratic, financial transparency, considering brokerage is a business partner.<br />\r\n- Environmentally friendly, is the place where brokers are connected with regular activities</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>JOB DESCRIPTION</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Quantity: 30 employees<br />\r\n- Find and exploit potential customers for real estate products valued from 2000 USD / m2 in the high-end and luxury segment;<br />\r\n- Deploying activities to find customers, coordinate with teams to realize sales targets<br />\r\n- Advise customers on information related to products and projects of the Company;</span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>JOB REQUIREMENTS</strong></span></span></p>\r\n\r\n<p><span style=\"font-size:14px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Graduating from college or higher<br />\r\n- Good appearance, male height from 1.68m, female from 1.58m. Age from 22-35 years old<br />\r\n- Priority to candidates who know foreign languages ​​and have 1 year or more experience in the field of real estate, banking and finance.<br />\r\n- Have financial goals, work and life.<br />\r\n- Desire to achieve big goals.<br />\r\n- Diligent, persistent, honest.</span></span></p>', 'published', '2019-11-30 19:52:42', '2021-01-03 17:26:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `careers_translations`
--

CREATE TABLE `careers_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `careers_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `careers_translations`
--

INSERT INTO `careers_translations` (`lang_code`, `careers_id`, `name`, `location`, `salary`, `description`) VALUES
('vi', 1, 'Trưởng Phòng Kinh Doanh ( Lương lên tới 60tr)', 'Ho Chi Minh, Viet Nam', '30,000,000 VND-60,000,000 VND', NULL),
('vi', 3, 'Chuyên Viên Tư Vấn Bất Động Sản Cao Cấp', 'Ho Chi Minh, Viet Nam', 'Từ 30,000,000 VND', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'News', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2019-11-18 02:33:35', '2019-11-18 02:33:35'),
(2, 'House architecture', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2019-11-21 07:49:25', '2019-11-21 07:49:25'),
(3, 'Kiến trúc nhà', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2019-11-21 07:49:35', '2019-11-21 07:49:35'),
(4, 'House design', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2019-11-21 07:50:02', '2019-11-21 07:50:02'),
(5, 'Thiết kế nhà', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2019-11-21 07:50:17', '2019-11-21 07:50:17'),
(6, 'Building materials', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2019-11-21 07:50:36', '2019-11-21 07:50:36'),
(7, 'Vật liệu xây dựng', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2019-11-21 07:50:58', '2019-11-21 07:50:58'),
(8, 'Tin tức', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2019-11-22 01:26:08', '2019-11-22 01:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `categories_translations`
--

CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `state_id`, `country_id`, `order`, `is_default`, `is_featured`, `image`, `status`, `created_at`, `updated_at`, `slug`, `record_id`) VALUES
(1, 'Alhambra', 1, 1, 0, 0, 1, 'cities/los-angeles-winter-2016.jpg', 'published', '2019-11-18 08:18:42', '2019-12-03 05:55:52', 'alhambra', NULL),
(2, 'Oakland', 1, 1, 0, 0, 1, 'cities/oaklandnightskylineandlakemerritt.jpg', 'published', '2019-11-18 08:23:14', '2019-12-03 05:55:52', 'oakland', NULL),
(3, 'Bakersfield', 1, 1, 0, 0, 1, 'cities/2009-0726-ca-bakersfield-truxtontower.jpg', 'published', '2019-11-18 08:26:54', '2019-12-03 05:55:52', 'bakersfield', NULL),
(4, 'Anaheim', 1, 1, 0, 0, 1, 'cities/castillo-de-disneyland.jpg', 'published', '2019-11-18 08:27:57', '2019-12-03 05:55:52', 'anaheim', NULL),
(5, 'San Francisco', 1, 1, 0, 0, 1, 'cities/goldengatebridge-001.jpg', 'published', '2019-11-18 08:29:18', '2019-12-03 05:55:52', 'san-francisco', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities_translations`
--

CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `nationality`, `order`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(1, 'United States', 'United States of America', 0, 0, 'published', '2019-11-18 08:17:29', '2019-11-18 08:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `countries_translations`
--

CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_pages', '2019-11-15 04:57:40', '2019-11-15 04:57:40'),
(2, 'widget_total_users', '2019-11-15 04:57:40', '2019-11-15 04:57:40'),
(3, 'widget_total_plugins', '2019-11-15 04:57:40', '2019-11-15 04:57:40'),
(4, 'widget_total_themes', '2019-11-15 04:57:40', '2019-11-15 04:57:40'),
(5, 'widget_audit_logs', '2019-11-15 18:54:50', '2019-11-15 18:54:50'),
(6, 'widget_posts_recent', '2019-11-15 18:54:50', '2019-11-15 18:54:50'),
(7, 'widget_analytics_general', '2019-11-15 18:54:50', '2019-11-15 18:54:50'),
(8, 'widget_analytics_page', '2019-11-15 18:54:50', '2019-11-15 18:54:50'),
(9, 'widget_analytics_browser', '2019-11-15 18:54:50', '2019-11-15 18:54:50'),
(10, 'widget_analytics_referrer', '2019-11-15 18:54:50', '2019-11-15 18:54:50'),
(11, 'widget_total_1', '2022-01-08 00:00:20', '2022-01-08 00:00:20'),
(12, 'widget_total_2', '2022-01-08 00:00:20', '2022-01-08 00:00:20'),
(13, 'widget_total_3', '2022-01-08 00:00:20', '2022-01-08 00:00:20'),
(14, 'widget_total_4', '2022-01-08 00:00:20', '2022-01-08 00:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widget_settings`
--

INSERT INTO `dashboard_widget_settings` (`id`, `settings`, `user_id`, `widget_id`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 7, 0, 1, '2019-11-26 02:40:58', '2019-11-26 02:40:58'),
(2, NULL, 1, 5, 1, 1, '2019-11-26 02:40:58', '2019-11-26 02:40:58'),
(3, NULL, 1, 6, 2, 1, '2019-11-26 02:40:58', '2019-11-26 02:40:58'),
(4, NULL, 1, 8, 3, 1, '2019-11-26 02:40:58', '2019-11-26 02:40:58'),
(5, NULL, 1, 9, 4, 1, '2019-11-26 02:40:58', '2019-11-26 02:40:58'),
(6, NULL, 1, 10, 5, 1, '2019-11-26 02:40:58', '2019-11-26 02:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `lang_id` int(10) UNSIGNED NOT NULL,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `lang_order` int(11) NOT NULL DEFAULT 0,
  `lang_is_rtl` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`lang_id`, `lang_name`, `lang_locale`, `lang_code`, `lang_flag`, `lang_is_default`, `lang_order`, `lang_is_rtl`) VALUES
(1, 'English', 'en', 'en_US', 'us', 1, 0, 0),
(2, 'Tiếng Việt', 'vi', 'vi', 'vn', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `language_meta`
--

CREATE TABLE `language_meta` (
  `lang_meta_id` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_meta`
--

INSERT INTO `language_meta` (`lang_meta_id`, `reference_id`, `lang_meta_code`, `reference_type`, `lang_meta_origin`) VALUES
(3, 1, 'en_US', 'Botble\\RealEstate\\Models\\Property', '404601a719bd38c609172d77df408ba1'),
(4, 2, 'en_US', 'Botble\\RealEstate\\Models\\Property', '9fd22570b6527cea3f74256bc5beeade'),
(5, 3, 'en_US', 'Botble\\RealEstate\\Models\\Property', '657ce80dc667a53aed03ea05f3977ff0'),
(6, 4, 'en_US', 'Botble\\RealEstate\\Models\\Property', '6be7679ead5366a6369167210fd247a0'),
(7, 1, 'en_US', 'Botble\\RealEstate\\Models\\PropertyFeature', '13cf1f003e0c62806dd7ad26f048b91d'),
(8, 2, 'en_US', 'Botble\\RealEstate\\Models\\PropertyFeature', 'f2356c699c6653bffaff97dd9387717d'),
(12, 3, 'en_US', 'Botble\\RealEstate\\Models\\PropertyFeature', 'e8c67bae0a5f47fa54a4a76a875daf3f'),
(13, 4, 'en_US', 'Botble\\RealEstate\\Models\\PropertyFeature', 'd57fa54aad5abc3f0caec4fb0e4e0907'),
(14, 5, 'en_US', 'Botble\\RealEstate\\Models\\PropertyFeature', '2d253e85c0394609682b9dbe77705bdb'),
(15, 1, 'en_US', 'Botble\\RealEstate\\Models\\Project', '56e4bdd055bc0b01d9fdc5efdbee6166'),
(16, 5, 'en_US', 'Botble\\RealEstate\\Models\\Property', 'ac45379b9b6134531a834400a7d9175c'),
(17, 6, 'en_US', 'Botble\\RealEstate\\Models\\PropertyFeature', '150d1429049e27e62396ed759719ada4'),
(18, 7, 'en_US', 'Botble\\RealEstate\\Models\\PropertyFeature', 'a7dd32dd31e9b85768892b17c4b6283b'),
(19, 8, 'en_US', 'Botble\\RealEstate\\Models\\PropertyFeature', 'bc3b21d633995dfaaa528eeb34b804ca'),
(20, 6, 'en_US', 'Botble\\RealEstate\\Models\\Property', '976a11dca6f828f42ef579a8b3671b56'),
(21, 7, 'en_US', 'Botble\\RealEstate\\Models\\Property', '141e080b1eff418e2977b5efdbfe799a'),
(22, 1, 'en_US', 'Botble\\RealEstate\\Models\\Investor', 'b55b725e9ba113942275849272e2969b'),
(23, 2, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '8b391f8d425ee376f0378860cbc205ae'),
(24, 3, 'en_US', 'Botble\\RealEstate\\Models\\Investor', 'c9199634afef0d21b9ed76f0438c1d92'),
(25, 4, 'en_US', 'Botble\\RealEstate\\Models\\Investor', 'ae7c96e8601ae6be06b85cb1b035498d'),
(26, 5, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '12f47dc443a0c4c9ed8dd3f48e43ef24'),
(27, 6, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '35466099783edd979365b6d42380217a'),
(28, 7, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '0f2d227a5e8b165455e69574d168d628'),
(29, 8, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '9c7f8c61383d7ea76f817fcd2224363f'),
(30, 9, 'en_US', 'Botble\\RealEstate\\Models\\Investor', 'a714f38063f2a21302b72ca0c9ebf69d'),
(31, 10, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '3752c23672cc11767202d85776490354'),
(32, 11, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '33ba5096310a9bb0d2cbed1ebab2f00e'),
(33, 12, 'en_US', 'Botble\\RealEstate\\Models\\Investor', 'b9df16fdbc60e5d1d446560fa55780ad'),
(34, 13, 'en_US', 'Botble\\RealEstate\\Models\\Investor', 'aa340b8dd1304e49d7b6e3be7bb939cb'),
(35, 14, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '0dc7c295282a2e338f97f9ac56d3e707'),
(36, 15, 'en_US', 'Botble\\RealEstate\\Models\\Investor', '7e37f52d065e2ac7f71cec27528ff1a7'),
(37, 2, 'en_US', 'Botble\\RealEstate\\Models\\Project', 'b8c605675ac073dd9d5b3572087a2445'),
(38, 8, 'en_US', 'Botble\\RealEstate\\Models\\Property', 'ccf2b58508febe22dae3fe588d1f7f36'),
(39, 9, 'en_US', 'Botble\\RealEstate\\Models\\Property', '18e0c764a6457fa1677a1710cc219337'),
(40, 10, 'en_US', 'Botble\\RealEstate\\Models\\Property', '2c9217b2ce21882234bfaf9222893fc9'),
(41, 11, 'en_US', 'Botble\\RealEstate\\Models\\Property', 'dad4f25ae76974a87d59084f82dae01b'),
(42, 1, 'en_US', 'Botble\\Blog\\Models\\Category', '8804d947c9dfc67caa38c6d758c533fb'),
(43, 12, 'en_US', 'Botble\\RealEstate\\Models\\Property', '4be0c322dda4d57a9ae43c4bb5b7b608'),
(45, 1, 'en_US', 'Botble\\Blog\\Models\\Tag', 'cb81f9780b7fcdcb490a2dc412bf2dc8'),
(47, 2, 'en_US', 'Botble\\Blog\\Models\\Tag', 'b1f1b44f1eb59e622269e868a16d4ead'),
(50, 3, 'en_US', 'Botble\\Blog\\Models\\Tag', '3facfab60703e4bb17ce679a63d04d6e'),
(51, 3, 'en_US', 'Botble\\RealEstate\\Models\\Project', '1631e995fd3df41119f30d9608085dae'),
(52, 4, 'en_US', 'Botble\\RealEstate\\Models\\Project', 'e6f78da435a49ddb8497a027537ad6f5'),
(53, 5, 'en_US', 'Botble\\RealEstate\\Models\\Project', 'e10e38c14cc5ba56f403049c9f003285'),
(54, 6, 'en_US', 'Botble\\RealEstate\\Models\\Project', '0f0ae4af74e088ea71a1456a71084118'),
(55, 13, 'en_US', 'Botble\\RealEstate\\Models\\Property', 'cb46b75d51f5b9ca4f7ea650ae885169'),
(56, 14, 'en_US', 'Botble\\RealEstate\\Models\\Property', '702833126d23884c8fa5f965b7fa3870'),
(57, 15, 'en_US', 'Botble\\RealEstate\\Models\\Property', '73a8f9e2401b54cca959e1a0a5fb9c9e'),
(58, 16, 'en_US', 'Botble\\RealEstate\\Models\\Property', '4aba3c5a608665c657affb7c59fce1e5'),
(59, 17, 'en_US', 'Botble\\RealEstate\\Models\\Property', '417317c4e6d4e390e19b87986cc52aa0'),
(83, 16, 'vi', 'Botble\\RealEstate\\Models\\Investor', '7e37f52d065e2ac7f71cec27528ff1a7'),
(84, 17, 'vi', 'Botble\\RealEstate\\Models\\Investor', '0dc7c295282a2e338f97f9ac56d3e707'),
(85, 18, 'vi', 'Botble\\RealEstate\\Models\\Investor', 'aa340b8dd1304e49d7b6e3be7bb939cb'),
(86, 19, 'vi', 'Botble\\RealEstate\\Models\\Investor', 'b9df16fdbc60e5d1d446560fa55780ad'),
(87, 20, 'vi', 'Botble\\RealEstate\\Models\\Investor', '33ba5096310a9bb0d2cbed1ebab2f00e'),
(88, 21, 'vi', 'Botble\\RealEstate\\Models\\Investor', '3752c23672cc11767202d85776490354'),
(89, 22, 'vi', 'Botble\\RealEstate\\Models\\Investor', 'a714f38063f2a21302b72ca0c9ebf69d'),
(90, 23, 'vi', 'Botble\\RealEstate\\Models\\Investor', '9c7f8c61383d7ea76f817fcd2224363f'),
(91, 24, 'vi', 'Botble\\RealEstate\\Models\\Investor', '0f2d227a5e8b165455e69574d168d628'),
(92, 25, 'vi', 'Botble\\RealEstate\\Models\\Investor', '35466099783edd979365b6d42380217a'),
(93, 26, 'vi', 'Botble\\RealEstate\\Models\\Investor', '12f47dc443a0c4c9ed8dd3f48e43ef24'),
(94, 27, 'vi', 'Botble\\RealEstate\\Models\\Investor', 'ae7c96e8601ae6be06b85cb1b035498d'),
(96, 29, 'vi', 'Botble\\RealEstate\\Models\\Investor', 'c9199634afef0d21b9ed76f0438c1d92'),
(97, 30, 'vi', 'Botble\\RealEstate\\Models\\Investor', '8b391f8d425ee376f0378860cbc205ae'),
(98, 31, 'vi', 'Botble\\RealEstate\\Models\\Investor', 'b55b725e9ba113942275849272e2969b'),
(122, 2, 'en_US', 'Botble\\Blog\\Models\\Category', '6675f12d6ce53d9ed753a54bca8d67b0'),
(123, 3, 'vi', 'Botble\\Blog\\Models\\Category', '6675f12d6ce53d9ed753a54bca8d67b0'),
(124, 4, 'en_US', 'Botble\\Blog\\Models\\Category', '745e79e10f12a0f66d19ae3b4dad987a'),
(125, 5, 'vi', 'Botble\\Blog\\Models\\Category', '745e79e10f12a0f66d19ae3b4dad987a'),
(126, 6, 'en_US', 'Botble\\Blog\\Models\\Category', 'f1ba0f3404bb5b827cfaa552a6894c0f'),
(127, 7, 'vi', 'Botble\\Blog\\Models\\Category', 'f1ba0f3404bb5b827cfaa552a6894c0f'),
(135, 8, 'vi', 'Botble\\Blog\\Models\\Category', '8804d947c9dfc67caa38c6d758c533fb'),
(144, 1, 'en_US', 'Botble\\Career\\Models\\Career', '09e2cc1ea05bd7c9dd60cfd54725975c'),
(146, 3, 'en_US', 'Botble\\Career\\Models\\Career', 'dcd6eb9e2a31b96825a0c519101c098e'),
(194, 5, 'en_US', 'Botble\\Career\\Models\\Career', '9d36fac293afaacbe2deeaaccc00f346'),
(442, 1, 'en_US', 'Botble\\Menu\\Models\\MenuLocation', '5ad59171af0cc4d0dccc3d38422c455d'),
(443, 1, 'en_US', 'Botble\\Menu\\Models\\Menu', 'ffecf7382cb34d54fb4b6879ce3d4cbd'),
(444, 2, 'en_US', 'Botble\\Menu\\Models\\Menu', '2171b9545e3c19b81ec7d3448699d972'),
(445, 3, 'en_US', 'Botble\\Menu\\Models\\Menu', 'ed29f281cdb65de4428a630d3b917f83'),
(446, 4, 'en_US', 'Botble\\Menu\\Models\\Menu', '55182b2b4e696c141e5cca8a6f85a29e'),
(447, 2, 'vi', 'Botble\\Menu\\Models\\MenuLocation', 'dcaa0fe6da1d86071c035fc304a73d07'),
(448, 5, 'vi', 'Botble\\Menu\\Models\\Menu', 'ffecf7382cb34d54fb4b6879ce3d4cbd'),
(449, 6, 'vi', 'Botble\\Menu\\Models\\Menu', '2171b9545e3c19b81ec7d3448699d972'),
(450, 7, 'vi', 'Botble\\Menu\\Models\\Menu', 'ed29f281cdb65de4428a630d3b917f83'),
(451, 8, 'vi', 'Botble\\Menu\\Models\\Menu', '55182b2b4e696c141e5cca8a6f85a29e');

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1483, 0, '1', 80, 'image/jpeg', 11752, 'accounts/1.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1484, 0, '10', 80, 'image/jpeg', 27814, 'accounts/10.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1485, 0, '2', 80, 'image/jpeg', 19005, 'accounts/2.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1486, 0, '3', 80, 'image/jpeg', 20400, 'accounts/3.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1487, 0, '4', 80, 'image/jpeg', 26819, 'accounts/4.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1488, 0, '5', 80, 'image/jpeg', 14367, 'accounts/5.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1489, 0, '6', 80, 'image/jpeg', 12367, 'accounts/6.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1490, 0, '7', 80, 'image/jpeg', 20652, 'accounts/7.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1491, 0, '8', 80, 'image/jpeg', 21164, 'accounts/8.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1492, 0, '9', 80, 'image/jpeg', 6084, 'accounts/9.jpg', '[]', '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(1494, 0, 'asset-3-at-3x', 82, 'image/png', 76833, 'general/asset-3-at-3x.png', '[]', '2021-12-09 21:25:36', '2021-12-09 21:25:36', NULL),
(1495, 0, 'asset-4-at-3x', 82, 'image/png', 84067, 'general/asset-4-at-3x.png', '[]', '2021-12-09 21:25:36', '2021-12-09 21:25:36', NULL),
(1496, 0, 'breadcrumb-background', 82, 'image/jpeg', 504692, 'general/breadcrumb-background.jpg', '[]', '2021-12-09 21:25:36', '2021-12-09 21:25:36', NULL),
(1497, 0, 'copyright', 82, 'image/jpeg', 128544, 'general/copyright.jpg', '[]', '2021-12-09 21:25:36', '2021-12-09 21:25:36', NULL),
(1498, 0, 'home-banner', 82, 'image/jpeg', 892011, 'general/home-banner.jpg', '[]', '2021-12-09 21:25:36', '2021-12-09 21:25:36', NULL),
(1499, 0, 'termsconditions-pagedesktop', 82, 'image/jpeg', 185151, 'general/termsconditions-pagedesktop.jpg', '[]', '2021-12-09 21:25:37', '2021-12-09 21:25:37', NULL),
(1500, 0, 'video-vi-pham-ban-quyen-bi-youtube-thang-tay-trung-tri', 82, 'image/jpeg', 63143, 'general/video-vi-pham-ban-quyen-bi-youtube-thang-tay-trung-tri.jpg', '[]', '2021-12-09 21:25:37', '2021-12-09 21:25:37', NULL),
(1501, 0, 'vietnam-office-4', 82, 'image/jpeg', 214366, 'general/vietnam-office-4.jpg', '[]', '2021-12-09 21:25:37', '2021-12-09 21:25:37', NULL),
(1502, 0, '1', 83, 'image/jpeg', 66997, 'news/1.jpg', '[]', '2021-12-09 21:25:37', '2021-12-09 21:25:37', NULL),
(1503, 0, '10', 83, 'image/jpeg', 66858, 'news/10.jpg', '[]', '2021-12-09 21:25:38', '2021-12-09 21:25:38', NULL),
(1504, 0, '11', 83, 'image/jpeg', 86492, 'news/11.jpg', '[]', '2021-12-09 21:25:38', '2021-12-09 21:25:38', NULL),
(1505, 0, '12', 83, 'image/jpeg', 91376, 'news/12.jpg', '[]', '2021-12-09 21:25:38', '2021-12-09 21:25:38', NULL),
(1506, 0, '13', 83, 'image/jpeg', 82991, 'news/13.jpg', '[]', '2021-12-09 21:25:38', '2021-12-09 21:25:38', NULL),
(1507, 0, '14', 83, 'image/jpeg', 66997, 'news/14.jpg', '[]', '2021-12-09 21:25:38', '2021-12-09 21:25:38', NULL),
(1508, 0, '15', 83, 'image/jpeg', 111450, 'news/15.jpg', '[]', '2021-12-09 21:25:38', '2021-12-09 21:25:38', NULL),
(1509, 0, '16', 83, 'image/jpeg', 464807, 'news/16.jpg', '[]', '2021-12-09 21:25:38', '2021-12-09 21:25:38', NULL),
(1510, 0, '2', 83, 'image/jpeg', 51884, 'news/2.jpg', '[]', '2021-12-09 21:25:39', '2021-12-09 21:25:39', NULL),
(1511, 0, '3', 83, 'image/jpeg', 132835, 'news/3.jpg', '[]', '2021-12-09 21:25:39', '2021-12-09 21:25:39', NULL),
(1512, 0, '4', 83, 'image/jpeg', 948302, 'news/4.jpg', '[]', '2021-12-09 21:25:39', '2021-12-09 21:25:39', NULL),
(1513, 0, '5', 83, 'image/jpeg', 66858, 'news/5.jpg', '[]', '2021-12-09 21:25:39', '2021-12-09 21:25:39', NULL),
(1514, 0, '6', 83, 'image/jpeg', 328317, 'news/6.jpg', '[]', '2021-12-09 21:25:39', '2021-12-09 21:25:39', NULL),
(1515, 0, '7', 83, 'image/jpeg', 249538, 'news/7.jpg', '[]', '2021-12-09 21:25:39', '2021-12-09 21:25:39', NULL),
(1516, 0, '8', 83, 'image/jpeg', 147871, 'news/8.jpg', '[]', '2021-12-09 21:25:40', '2021-12-09 21:25:40', NULL),
(1517, 0, '9', 83, 'image/jpeg', 194815, 'news/9.jpg', '[]', '2021-12-09 21:25:40', '2021-12-09 21:25:40', NULL),
(1518, 0, 'banner', 1, 'image/jpeg', 239032, 'banner/banner.jpg', '[]', '2021-12-09 21:25:41', '2021-12-09 21:25:41', NULL),
(1519, 0, '2009-0726-ca-bakersfield-truxtontower', 84, 'image/jpeg', 686056, 'cities/2009-0726-ca-bakersfield-truxtontower.jpg', '[]', '2021-12-09 21:25:41', '2021-12-09 21:25:41', NULL),
(1520, 0, 'castillo-de-disneyland', 84, 'image/jpeg', 412609, 'cities/castillo-de-disneyland.jpg', '[]', '2021-12-09 21:25:41', '2021-12-09 21:25:41', NULL),
(1521, 0, 'goldengatebridge-001', 84, 'image/jpeg', 371864, 'cities/goldengatebridge-001.jpg', '[]', '2021-12-09 21:25:41', '2021-12-09 21:25:41', NULL),
(1522, 0, 'los-angeles-winter-2016', 84, 'image/jpeg', 254681, 'cities/los-angeles-winter-2016.jpg', '[]', '2021-12-09 21:25:41', '2021-12-09 21:25:41', NULL),
(1523, 0, 'oaklandnightskylineandlakemerritt', 84, 'image/jpeg', 433073, 'cities/oaklandnightskylineandlakemerritt.jpg', '[]', '2021-12-09 21:25:41', '2021-12-09 21:25:41', NULL),
(1524, 0, 'favicon', 85, 'image/png', 3110, 'logo/favicon.png', '[]', '2021-12-09 21:25:42', '2021-12-09 21:25:42', NULL),
(1525, 0, 'logo-white', 85, 'image/png', 18120, 'logo/logo-white.png', '[]', '2021-12-09 21:25:42', '2021-12-09 21:25:42', NULL),
(1526, 0, 'logo', 85, 'image/png', 23910, 'logo/logo.png', '[]', '2021-12-09 21:25:42', '2021-12-09 21:25:42', NULL),
(1527, 0, '1', 86, 'image/jpeg', 750839, 'projects/1.jpg', '[]', '2021-12-09 21:25:42', '2021-12-09 21:25:42', NULL),
(1528, 0, '11', 86, 'image/jpeg', 1729433, 'projects/11.jpg', '[]', '2021-12-09 21:25:43', '2021-12-09 21:25:43', NULL),
(1529, 0, '12', 86, 'image/jpeg', 942082, 'projects/12.jpg', '[]', '2021-12-09 21:25:43', '2021-12-09 21:25:43', NULL),
(1530, 0, '13', 86, 'image/jpeg', 562580, 'projects/13.jpg', '[]', '2021-12-09 21:25:43', '2021-12-09 21:25:43', NULL),
(1531, 0, '14', 86, 'image/jpeg', 1259051, 'projects/14.jpg', '[]', '2021-12-09 21:25:44', '2021-12-09 21:25:44', NULL),
(1532, 0, '2', 86, 'image/jpeg', 431985, 'projects/2.jpg', '[]', '2021-12-09 21:25:44', '2021-12-09 21:25:44', NULL),
(1533, 0, '21', 86, 'image/jpeg', 173885, 'projects/21.jpg', '[]', '2021-12-09 21:25:44', '2021-12-09 21:25:44', NULL),
(1534, 0, '22', 86, 'image/jpeg', 94488, 'projects/22.jpg', '[]', '2021-12-09 21:25:44', '2021-12-09 21:25:44', NULL),
(1535, 0, '23', 86, 'image/jpeg', 90740, 'projects/23.jpg', '[]', '2021-12-09 21:25:44', '2021-12-09 21:25:44', NULL),
(1536, 0, '24', 86, 'image/jpeg', 96624, 'projects/24.jpg', '[]', '2021-12-09 21:25:44', '2021-12-09 21:25:44', NULL),
(1537, 0, '25', 86, 'image/jpeg', 138699, 'projects/25.jpg', '[]', '2021-12-09 21:25:45', '2021-12-09 21:25:45', NULL),
(1538, 0, '26', 86, 'image/jpeg', 121747, 'projects/26.jpg', '[]', '2021-12-09 21:25:45', '2021-12-09 21:25:45', NULL),
(1539, 0, '3', 86, 'image/jpeg', 450933, 'projects/3.jpg', '[]', '2021-12-09 21:25:45', '2021-12-09 21:25:45', NULL),
(1540, 0, '5', 86, 'image/jpeg', 206027, 'projects/5.jpg', '[]', '2021-12-09 21:25:45', '2021-12-09 21:25:45', NULL),
(1541, 0, '1-1', 87, 'image/jpeg', 750839, 'properties/1-1.jpg', '[]', '2021-12-09 21:25:46', '2021-12-09 21:25:46', NULL),
(1542, 0, '1-2', 87, 'image/jpeg', 1587777, 'properties/1-2.jpg', '[]', '2021-12-09 21:25:46', '2021-12-09 21:25:46', NULL),
(1543, 0, '1-3', 87, 'image/jpeg', 646056, 'properties/1-3.jpg', '[]', '2021-12-09 21:25:46', '2021-12-09 21:25:46', NULL),
(1544, 0, '1', 87, 'image/jpeg', 80373, 'properties/1.jpg', '[]', '2021-12-09 21:25:47', '2021-12-09 21:25:47', NULL),
(1545, 0, '10-1', 87, 'image/jpeg', 198455, 'properties/10-1.jpg', '[]', '2021-12-09 21:25:47', '2021-12-09 21:25:47', NULL),
(1546, 0, '10', 87, 'image/jpeg', 255695, 'properties/10.jpg', '[]', '2021-12-09 21:25:47', '2021-12-09 21:25:47', NULL),
(1547, 0, '11-1', 87, 'image/jpeg', 127294, 'properties/11-1.jpg', '[]', '2021-12-09 21:25:47', '2021-12-09 21:25:47', NULL),
(1548, 0, '11', 87, 'image/jpeg', 79403, 'properties/11.jpg', '[]', '2021-12-09 21:25:47', '2021-12-09 21:25:47', NULL),
(1549, 0, '12', 87, 'image/jpeg', 86373, 'properties/12.jpg', '[]', '2021-12-09 21:25:48', '2021-12-09 21:25:48', NULL),
(1550, 0, '13', 87, 'image/jpeg', 82991, 'properties/13.jpg', '[]', '2021-12-09 21:25:48', '2021-12-09 21:25:48', NULL),
(1551, 0, '14', 87, 'image/jpeg', 66997, 'properties/14.jpg', '[]', '2021-12-09 21:25:48', '2021-12-09 21:25:48', NULL),
(1552, 0, '15', 87, 'image/jpeg', 111450, 'properties/15.jpg', '[]', '2021-12-09 21:25:48', '2021-12-09 21:25:48', NULL),
(1553, 0, '2-1', 87, 'image/jpeg', 431985, 'properties/2-1.jpg', '[]', '2021-12-09 21:25:48', '2021-12-09 21:25:48', NULL),
(1554, 0, '2-2', 87, 'image/jpeg', 260049, 'properties/2-2.jpg', '[]', '2021-12-09 21:25:49', '2021-12-09 21:25:49', NULL),
(1555, 0, '2-3', 87, 'image/jpeg', 684758, 'properties/2-3.jpg', '[]', '2021-12-09 21:25:49', '2021-12-09 21:25:49', NULL),
(1556, 0, '2', 87, 'image/jpeg', 93464, 'properties/2.jpg', '[]', '2021-12-09 21:25:49', '2021-12-09 21:25:49', NULL),
(1557, 0, '21', 87, 'image/jpeg', 85475, 'properties/21.jpg', '[]', '2021-12-09 21:25:49', '2021-12-09 21:25:49', NULL),
(1558, 0, '22-1', 87, 'image/jpeg', 94488, 'properties/22-1.jpg', '[]', '2021-12-09 21:25:50', '2021-12-09 21:25:50', NULL),
(1559, 0, '22', 87, 'image/jpeg', 713091, 'properties/22.jpg', '[]', '2021-12-09 21:25:50', '2021-12-09 21:25:50', NULL),
(1560, 0, '23', 87, 'image/jpeg', 111948, 'properties/23.jpg', '[]', '2021-12-09 21:25:50', '2021-12-09 21:25:50', NULL),
(1561, 0, '24-1', 87, 'image/jpeg', 96624, 'properties/24-1.jpg', '[]', '2021-12-09 21:25:50', '2021-12-09 21:25:50', NULL),
(1562, 0, '24', 87, 'image/jpeg', 69034, 'properties/24.jpg', '[]', '2021-12-09 21:25:50', '2021-12-09 21:25:50', NULL),
(1563, 0, '3-1', 87, 'image/jpeg', 450933, 'properties/3-1.jpg', '[]', '2021-12-09 21:25:51', '2021-12-09 21:25:51', NULL),
(1564, 0, '3-2', 87, 'image/jpeg', 124405, 'properties/3-2.jpg', '[]', '2021-12-09 21:25:51', '2021-12-09 21:25:51', NULL),
(1565, 0, '3-3', 87, 'image/jpeg', 762723, 'properties/3-3.jpg', '[]', '2021-12-09 21:25:51', '2021-12-09 21:25:51', NULL),
(1566, 0, '3', 87, 'image/jpeg', 70442, 'properties/3.jpg', '[]', '2021-12-09 21:25:51', '2021-12-09 21:25:51', NULL),
(1567, 0, '31', 87, 'image/jpeg', 33300, 'properties/31.jpg', '[]', '2021-12-09 21:25:51', '2021-12-09 21:25:51', NULL),
(1568, 0, '311', 87, 'image/jpeg', 22270, 'properties/311.jpg', '[]', '2021-12-09 21:25:51', '2021-12-09 21:25:51', NULL),
(1569, 0, '32', 87, 'image/jpeg', 18100, 'properties/32.jpg', '[]', '2021-12-09 21:25:51', '2021-12-09 21:25:51', NULL),
(1570, 0, '32223-43914-378', 87, 'image/jpeg', 716445, 'properties/32223-43914-378.jpg', '[]', '2021-12-09 21:25:52', '2021-12-09 21:25:52', NULL),
(1571, 0, '33', 87, 'image/jpeg', 21031, 'properties/33.jpg', '[]', '2021-12-09 21:25:52', '2021-12-09 21:25:52', NULL),
(1572, 0, '34', 87, 'image/jpeg', 19947, 'properties/34.jpg', '[]', '2021-12-09 21:25:52', '2021-12-09 21:25:52', NULL),
(1573, 0, '35', 87, 'image/jpeg', 24653, 'properties/35.jpg', '[]', '2021-12-09 21:25:52', '2021-12-09 21:25:52', NULL),
(1574, 0, '4-1', 87, 'image/jpeg', 433537, 'properties/4-1.jpg', '[]', '2021-12-09 21:25:52', '2021-12-09 21:25:52', NULL),
(1575, 0, '4-2', 87, 'image/jpeg', 642443, 'properties/4-2.jpg', '[]', '2021-12-09 21:25:52', '2021-12-09 21:25:52', NULL),
(1576, 0, '4', 87, 'image/jpeg', 96537, 'properties/4.jpg', '[]', '2021-12-09 21:25:53', '2021-12-09 21:25:53', NULL),
(1577, 0, '411', 87, 'image/jpeg', 29035, 'properties/411.jpg', '[]', '2021-12-09 21:25:53', '2021-12-09 21:25:53', NULL),
(1578, 0, '42', 87, 'image/jpeg', 24790, 'properties/42.jpg', '[]', '2021-12-09 21:25:53', '2021-12-09 21:25:53', NULL),
(1579, 0, '421834935dbc9ef3aaa42', 87, 'image/jpeg', 538188, 'properties/421834935dbc9ef3aaa42.jpg', '[]', '2021-12-09 21:25:53', '2021-12-09 21:25:53', NULL),
(1580, 0, '43', 87, 'image/jpeg', 20920, 'properties/43.jpg', '[]', '2021-12-09 21:25:53', '2021-12-09 21:25:53', NULL),
(1581, 0, '44', 87, 'image/jpeg', 17781, 'properties/44.jpg', '[]', '2021-12-09 21:25:53', '2021-12-09 21:25:53', NULL),
(1582, 0, '5-1', 87, 'image/jpeg', 86536, 'properties/5-1.jpg', '[]', '2021-12-09 21:25:53', '2021-12-09 21:25:53', NULL),
(1583, 0, '5-2', 87, 'image/jpeg', 656323, 'properties/5-2.jpg', '[]', '2021-12-09 21:25:53', '2021-12-09 21:25:53', NULL),
(1584, 0, '5', 87, 'image/jpeg', 206027, 'properties/5.jpg', '[]', '2021-12-09 21:25:54', '2021-12-09 21:25:54', NULL),
(1585, 0, '6-1', 87, 'image/jpeg', 252518, 'properties/6-1.jpg', '[]', '2021-12-09 21:25:54', '2021-12-09 21:25:54', NULL),
(1586, 0, '6-2', 87, 'image/jpeg', 76855, 'properties/6-2.jpg', '[]', '2021-12-09 21:25:54', '2021-12-09 21:25:54', NULL),
(1587, 0, '6', 87, 'image/jpeg', 51884, 'properties/6.jpg', '[]', '2021-12-09 21:25:54', '2021-12-09 21:25:54', NULL),
(1588, 0, '7-1', 87, 'image/jpeg', 46086, 'properties/7-1.jpg', '[]', '2021-12-09 21:25:54', '2021-12-09 21:25:54', NULL),
(1589, 0, '7-2', 87, 'image/jpeg', 172462, 'properties/7-2.jpg', '[]', '2021-12-09 21:25:54', '2021-12-09 21:25:54', NULL),
(1590, 0, '7', 87, 'image/jpeg', 464807, 'properties/7.jpg', '[]', '2021-12-09 21:25:55', '2021-12-09 21:25:55', NULL),
(1591, 0, '71', 87, 'image/jpeg', 127638, 'properties/71.jpg', '[]', '2021-12-09 21:25:55', '2021-12-09 21:25:55', NULL),
(1592, 0, '72', 87, 'image/jpeg', 99746, 'properties/72.jpg', '[]', '2021-12-09 21:25:55', '2021-12-09 21:25:55', NULL),
(1593, 0, '73', 87, 'image/jpeg', 99089, 'properties/73.jpg', '[]', '2021-12-09 21:25:55', '2021-12-09 21:25:55', NULL),
(1594, 0, '74', 87, 'image/jpeg', 108268, 'properties/74.jpg', '[]', '2021-12-09 21:25:55', '2021-12-09 21:25:55', NULL),
(1595, 0, '75', 87, 'image/jpeg', 144040, 'properties/75.jpg', '[]', '2021-12-09 21:25:55', '2021-12-09 21:25:55', NULL),
(1596, 0, '78', 87, 'image/jpeg', 132835, 'properties/78.jpg', '[]', '2021-12-09 21:25:55', '2021-12-09 21:25:55', NULL),
(1597, 0, '79', 87, 'image/jpeg', 128490, 'properties/79.jpg', '[]', '2021-12-09 21:25:56', '2021-12-09 21:25:56', NULL),
(1598, 0, '8-1', 87, 'image/jpeg', 35774, 'properties/8-1.jpg', '[]', '2021-12-09 21:25:56', '2021-12-09 21:25:56', NULL),
(1599, 0, '8-2', 87, 'image/jpeg', 116324, 'properties/8-2.jpg', '[]', '2021-12-09 21:25:56', '2021-12-09 21:25:56', NULL),
(1600, 0, '8', 87, 'image/jpeg', 542999, 'properties/8.jpg', '[]', '2021-12-09 21:25:56', '2021-12-09 21:25:56', NULL),
(1601, 0, '9-1', 87, 'image/jpeg', 82701, 'properties/9-1.jpg', '[]', '2021-12-09 21:25:56', '2021-12-09 21:25:56', NULL),
(1602, 0, '9', 87, 'image/jpeg', 98602, 'properties/9.jpg', '[]', '2021-12-09 21:25:56', '2021-12-09 21:25:56', NULL),
(1603, 0, 'a1-1', 87, 'image/jpeg', 244411, 'properties/a1-1.jpg', '[]', '2021-12-09 21:25:57', '2021-12-09 21:25:57', NULL),
(1604, 0, 'a1-2', 87, 'image/jpeg', 213475, 'properties/a1-2.jpg', '[]', '2021-12-09 21:25:57', '2021-12-09 21:25:57', NULL),
(1605, 0, 'a1', 87, 'image/jpeg', 104460, 'properties/a1.jpg', '[]', '2021-12-09 21:25:57', '2021-12-09 21:25:57', NULL),
(1606, 0, 'a10', 87, 'image/jpeg', 135558, 'properties/a10.jpg', '[]', '2021-12-09 21:25:57', '2021-12-09 21:25:57', NULL),
(1607, 0, 'a2-1', 87, 'image/jpeg', 58090, 'properties/a2-1.jpg', '[]', '2021-12-09 21:25:57', '2021-12-09 21:25:57', NULL),
(1608, 0, 'a2-2', 87, 'image/jpeg', 110869, 'properties/a2-2.jpg', '[]', '2021-12-09 21:25:57', '2021-12-09 21:25:57', NULL),
(1609, 0, 'a2', 87, 'image/jpeg', 79585, 'properties/a2.jpg', '[]', '2021-12-09 21:25:57', '2021-12-09 21:25:57', NULL),
(1610, 0, 'a3-1', 87, 'image/jpeg', 103281, 'properties/a3-1.jpg', '[]', '2021-12-09 21:25:58', '2021-12-09 21:25:58', NULL),
(1611, 0, 'a3-2', 87, 'image/jpeg', 180354, 'properties/a3-2.jpg', '[]', '2021-12-09 21:25:58', '2021-12-09 21:25:58', NULL),
(1612, 0, 'a3', 87, 'image/jpeg', 182143, 'properties/a3.jpg', '[]', '2021-12-09 21:25:58', '2021-12-09 21:25:58', NULL),
(1613, 0, 'a4-1', 87, 'image/jpeg', 93023, 'properties/a4-1.jpg', '[]', '2021-12-09 21:25:58', '2021-12-09 21:25:58', NULL),
(1614, 0, 'a4-2', 87, 'image/jpeg', 91918, 'properties/a4-2.jpg', '[]', '2021-12-09 21:25:58', '2021-12-09 21:25:58', NULL),
(1615, 0, 'a4', 87, 'image/jpeg', 79498, 'properties/a4.jpg', '[]', '2021-12-09 21:25:58', '2021-12-09 21:25:58', NULL),
(1616, 0, 'a5-1', 87, 'image/jpeg', 184906, 'properties/a5-1.jpg', '[]', '2021-12-09 21:25:58', '2021-12-09 21:25:58', NULL),
(1617, 0, 'a5', 87, 'image/jpeg', 116582, 'properties/a5.jpg', '[]', '2021-12-09 21:25:59', '2021-12-09 21:25:59', NULL),
(1618, 0, 'a6-1', 87, 'image/jpeg', 581176, 'properties/a6-1.jpg', '[]', '2021-12-09 21:25:59', '2021-12-09 21:25:59', NULL),
(1619, 0, 'a6', 87, 'image/jpeg', 82219, 'properties/a6.jpg', '[]', '2021-12-09 21:25:59', '2021-12-09 21:25:59', NULL),
(1620, 0, 'a7', 87, 'image/jpeg', 436253, 'properties/a7.jpg', '[]', '2021-12-09 21:25:59', '2021-12-09 21:25:59', NULL),
(1621, 0, 'a8', 87, 'image/jpeg', 220787, 'properties/a8.jpg', '[]', '2021-12-09 21:25:59', '2021-12-09 21:25:59', NULL),
(1622, 0, 'a9', 87, 'image/jpeg', 174424, 'properties/a9.jpg', '[]', '2021-12-09 21:25:59', '2021-12-09 21:25:59', NULL),
(1623, 0, 'b1', 87, 'image/jpeg', 169643, 'properties/b1.jpg', '[]', '2021-12-09 21:26:00', '2021-12-09 21:26:00', NULL),
(1624, 0, 'b2', 87, 'image/jpeg', 92903, 'properties/b2.jpg', '[]', '2021-12-09 21:26:00', '2021-12-09 21:26:00', NULL),
(1625, 0, 'b3', 87, 'image/jpeg', 130884, 'properties/b3.jpg', '[]', '2021-12-09 21:26:00', '2021-12-09 21:26:00', NULL),
(1626, 0, 'b4-1', 87, 'image/jpeg', 151288, 'properties/b4-1.jpg', '[]', '2021-12-09 21:26:00', '2021-12-09 21:26:00', NULL),
(1627, 0, 'b4', 87, 'image/jpeg', 101182, 'properties/b4.jpg', '[]', '2021-12-09 21:26:00', '2021-12-09 21:26:00', NULL),
(1628, 0, 'b5-1', 87, 'image/jpeg', 136853, 'properties/b5-1.jpg', '[]', '2021-12-09 21:26:00', '2021-12-09 21:26:00', NULL),
(1629, 0, 'b5', 87, 'image/jpeg', 69849, 'properties/b5.jpg', '[]', '2021-12-09 21:26:00', '2021-12-09 21:26:00', NULL),
(1630, 0, 'b6', 87, 'image/jpeg', 104434, 'properties/b6.jpg', '[]', '2021-12-09 21:26:01', '2021-12-09 21:26:01', NULL),
(1631, 0, 'download', 87, 'image/jpeg', 10833, 'properties/download.jpg', '[]', '2021-12-09 21:26:01', '2021-12-09 21:26:01', NULL),
(1632, 0, 'e1', 87, 'image/jpeg', 1105244, 'properties/e1.jpg', '[]', '2021-12-09 21:26:01', '2021-12-09 21:26:01', NULL),
(1633, 0, 'e2', 87, 'image/jpeg', 1062944, 'properties/e2.jpg', '[]', '2021-12-09 21:26:01', '2021-12-09 21:26:01', NULL),
(1634, 0, 'e3', 87, 'image/jpeg', 1113759, 'properties/e3.jpg', '[]', '2021-12-09 21:26:01', '2021-12-09 21:26:01', NULL),
(1635, 0, 'e4', 87, 'image/jpeg', 1003508, 'properties/e4.jpg', '[]', '2021-12-09 21:26:02', '2021-12-09 21:26:02', NULL),
(1636, 0, 'e5', 87, 'image/jpeg', 948302, 'properties/e5.jpg', '[]', '2021-12-09 21:26:02', '2021-12-09 21:26:02', NULL),
(1637, 0, 'e7', 87, 'image/jpeg', 916078, 'properties/e7.jpg', '[]', '2021-12-09 21:26:02', '2021-12-09 21:26:02', NULL),
(1638, 0, 'e8', 87, 'image/jpeg', 820972, 'properties/e8.jpg', '[]', '2021-12-09 21:26:02', '2021-12-09 21:26:02', NULL),
(1639, 0, 'p1', 87, 'image/jpeg', 198758, 'properties/p1.jpg', '[]', '2021-12-09 21:26:03', '2021-12-09 21:26:03', NULL),
(1640, 0, 'p2', 87, 'image/jpeg', 427643, 'properties/p2.jpg', '[]', '2021-12-09 21:26:03', '2021-12-09 21:26:03', NULL),
(1641, 0, 'property-video-thumb', 87, 'image/jpeg', 26909, 'properties/property-video-thumb.jpg', '[]', '2021-12-09 21:26:03', '2021-12-09 21:26:03', NULL),
(1642, 0, 'q1', 87, 'image/jpeg', 458500, 'properties/q1.jpg', '[]', '2021-12-09 21:26:03', '2021-12-09 21:26:03', NULL),
(1643, 0, 'q2', 87, 'image/jpeg', 233211, 'properties/q2.jpg', '[]', '2021-12-09 21:26:03', '2021-12-09 21:26:03', NULL),
(1644, 0, 'q3', 87, 'image/jpeg', 328317, 'properties/q3.jpg', '[]', '2021-12-09 21:26:04', '2021-12-09 21:26:04', NULL),
(1645, 0, 'q6', 87, 'image/jpeg', 249538, 'properties/q6.jpg', '[]', '2021-12-09 21:26:04', '2021-12-09 21:26:04', NULL),
(1646, 0, 'q7', 87, 'image/jpeg', 147871, 'properties/q7.jpg', '[]', '2021-12-09 21:26:04', '2021-12-09 21:26:04', NULL),
(1647, 0, 'q8', 87, 'image/jpeg', 194815, 'properties/q8.jpg', '[]', '2021-12-09 21:26:04', '2021-12-09 21:26:04', NULL),
(1648, 0, 't1', 87, 'image/jpeg', 66858, 'properties/t1.jpg', '[]', '2021-12-09 21:26:04', '2021-12-09 21:26:04', NULL),
(1649, 0, 't2', 87, 'image/jpeg', 86492, 'properties/t2.jpg', '[]', '2021-12-09 21:26:05', '2021-12-09 21:26:05', NULL),
(1650, 0, 't3', 87, 'image/jpeg', 91376, 'properties/t3.jpg', '[]', '2021-12-09 21:26:05', '2021-12-09 21:26:05', NULL),
(1651, 0, 't4', 87, 'image/jpeg', 77280, 'properties/t4.jpg', '[]', '2021-12-09 21:26:05', '2021-12-09 21:26:05', NULL),
(1652, 0, 't5', 87, 'image/jpeg', 94036, 'properties/t5.jpg', '[]', '2021-12-09 21:26:05', '2021-12-09 21:26:05', NULL),
(1653, 0, 'wp1a', 87, 'image/jpeg', 168494, 'properties/wp1a.jpg', '[]', '2021-12-09 21:26:05', '2021-12-09 21:26:05', NULL),
(1654, 0, 'avatar', 88, 'image/jpeg', 151486, 'users/avatar.jpg', '[]', '2021-12-09 21:26:05', '2021-12-09 21:26:05', NULL),
(1655, 1, 'MicrosoftTeams-image', 89, 'image/png', 40588, 'members/microsoftteams-image.png', '[]', '2022-01-09 23:01:04', '2022-01-09 23:01:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Banners', 'banner', 0, '2019-11-16 02:00:43', '2019-11-16 02:00:50', NULL),
(80, 0, 'accounts', 'accounts', 0, '2021-12-09 21:25:30', '2021-12-09 21:25:30', NULL),
(82, 0, 'general', 'general', 0, '2021-12-09 21:25:36', '2021-12-09 21:25:36', NULL),
(83, 0, 'news', 'news', 0, '2021-12-09 21:25:37', '2021-12-09 21:25:37', NULL),
(84, 0, 'cities', 'cities', 0, '2021-12-09 21:25:41', '2021-12-09 21:25:41', NULL),
(85, 0, 'logo', 'logo', 0, '2021-12-09 21:25:42', '2021-12-09 21:25:42', NULL),
(86, 0, 'projects', 'projects', 0, '2021-12-09 21:25:42', '2021-12-09 21:25:42', NULL),
(87, 0, 'properties', 'properties', 0, '2021-12-09 21:25:46', '2021-12-09 21:25:46', NULL),
(88, 0, 'users', 'users', 0, '2021-12-09 21:26:05', '2021-12-09 21:26:05', NULL),
(89, 1, 'members', 'members', 0, '2022-01-09 23:01:04', '2022-01-09 23:01:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Main menu', 'main-menu', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(2, 'About', 'about', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(3, 'More information', 'more-information', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(4, 'News', 'news', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(5, 'Menu chính', 'menu-chinh', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(6, 'Về chúng tôi', 've-chung-toi', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(7, 'Thông tin thêm', 'thong-tin-them', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(8, 'Tin tức', 'tin-tuc', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'main-menu', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(2, 5, 'main-menu', '2021-12-09 21:25:35', '2021-12-09 21:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reference_id` int(10) UNSIGNED DEFAULT 0,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, NULL, '/projects', NULL, 0, 'Projects', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(2, 1, 0, 0, NULL, '/properties', NULL, 0, 'Properties', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(3, 1, 0, 0, NULL, '/agents', NULL, 0, 'Agents', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(4, 1, 0, 2, 'Botble\\Page\\Models\\Page', '/news', NULL, 0, 'News', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(5, 1, 0, 0, NULL, '/careers', NULL, 0, 'Careers', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(6, 1, 0, 4, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(7, 2, 0, 3, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'About us', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(8, 2, 0, 4, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact us', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(9, 2, 0, 0, NULL, '/careers', NULL, 0, 'Careers', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(10, 2, 0, 5, 'Botble\\Page\\Models\\Page', '/terms-conditions', NULL, 0, 'Terms & Conditions', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(11, 3, 0, 0, NULL, '/projects', NULL, 0, 'All projects', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(12, 3, 0, 0, NULL, '/properties', NULL, 0, 'All properties', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(13, 3, 0, 0, NULL, '/properties?type=sale', NULL, 0, 'Houses for sale', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(14, 3, 0, 0, NULL, '/properties?type=rent', NULL, 0, 'Houses for rent', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(15, 4, 0, 2, 'Botble\\Page\\Models\\Page', '/news', NULL, 0, 'Latest news', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(16, 4, 0, 2, 'Botble\\Blog\\Models\\Category', '/news/house-architecture', NULL, 0, 'House architecture', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(17, 4, 0, 4, 'Botble\\Blog\\Models\\Category', '/news/house-design', NULL, 0, 'House design', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(18, 4, 0, 6, 'Botble\\Blog\\Models\\Category', '/news/building-materials', NULL, 0, 'Building materials', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(19, 5, 0, 0, NULL, '/projects', NULL, 0, 'Dự án', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(20, 5, 0, 0, NULL, '/properties', NULL, 0, 'Nhà - Căn Hộ', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(21, 5, 0, 0, NULL, '/agents', NULL, 0, 'Đại lý', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(22, 5, 0, 2, 'Botble\\Page\\Models\\Page', '/news', NULL, 0, 'Tin tức', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(23, 5, 0, 0, NULL, '/careers', NULL, 0, 'Tuyển dụng', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(24, 5, 0, 4, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Liên hệ', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(25, 6, 0, 3, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'Về chúng tôi', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(26, 6, 0, 4, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Liên hệ', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(27, 6, 0, 0, NULL, '/careers', NULL, 0, 'Tuyển dụng', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(28, 6, 0, 5, 'Botble\\Page\\Models\\Page', '/terms-conditions', NULL, 0, 'Điều khoản và quy định', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(29, 7, 0, 0, NULL, '/projects', NULL, 0, 'Dự án', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(30, 7, 0, 0, NULL, '/properties', NULL, 0, 'Nhà - Căn hộ', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(31, 7, 0, 0, NULL, '/properties?type=sale', NULL, 0, 'Nhà bán', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(32, 7, 0, 0, NULL, '/properties?type=rent', NULL, 0, 'Nhà cho thuê', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(33, 8, 0, 2, 'Botble\\Page\\Models\\Page', '/news', NULL, 0, 'Tin tức mới nhất', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(34, 8, 0, 2, 'Botble\\Blog\\Models\\Category', '/news/house-architecture', NULL, 0, 'Kiến trúc nhà', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(35, 8, 0, 4, 'Botble\\Blog\\Models\\Category', '/news/house-design', NULL, 0, 'Thiết kế nhà', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36'),
(36, 8, 0, 6, 'Botble\\Blog\\Models\\Category', '/news/building-materials', NULL, 0, 'Vật liệu xây dựng', NULL, '_self', 0, '2021-12-09 21:25:35', '2021-12-09 21:25:36');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `reference_id`, `meta_key`, `meta_value`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-17 20:34:59', '2019-11-17 20:34:59'),
(2, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-17 20:53:34', '2019-11-17 20:53:34'),
(3, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-17 21:09:55', '2019-11-17 21:09:55'),
(4, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-17 21:18:11', '2019-11-17 21:18:11'),
(5, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\PropertyFeature', '2019-11-17 21:40:58', '2019-11-17 21:40:58'),
(6, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\PropertyFeature', '2019-11-17 21:41:43', '2019-11-17 21:41:43'),
(7, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-18 00:34:49', '2019-11-18 00:34:49'),
(8, 5, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 00:47:52', '2019-11-18 00:47:52'),
(9, 6, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 01:05:58', '2019-11-18 01:05:58'),
(10, 7, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 01:12:07', '2019-11-18 01:12:07'),
(11, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-18 01:28:45', '2019-11-18 01:28:45'),
(12, 8, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 01:49:36', '2019-11-18 01:49:36'),
(13, 9, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 02:02:19', '2019-11-18 02:02:19'),
(14, 10, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 02:16:53', '2019-11-18 02:16:53'),
(15, 11, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 02:22:48', '2019-11-18 02:22:48'),
(16, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2019-11-18 02:33:35', '2019-11-18 02:33:35'),
(17, 12, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 02:47:05', '2019-11-18 02:47:05'),
(18, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2019-11-18 02:51:35', '2019-11-18 02:51:35'),
(19, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Tag', '2019-11-18 02:51:35', '2019-11-18 02:51:35'),
(20, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2019-11-18 02:55:53', '2019-11-18 02:55:53'),
(21, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Tag', '2019-11-18 02:55:53', '2019-11-18 02:55:53'),
(22, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2019-11-18 02:59:01', '2019-11-18 02:59:01'),
(23, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2019-11-18 03:07:27', '2019-11-18 03:07:27'),
(24, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Tag', '2019-11-18 03:07:27', '2019-11-18 03:07:27'),
(25, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-18 03:30:34', '2019-11-18 03:30:34'),
(26, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-18 03:38:13', '2019-11-18 03:38:13'),
(27, 5, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-18 03:45:06', '2019-11-18 03:45:06'),
(28, 6, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-18 03:53:20', '2019-11-18 03:53:20'),
(29, 13, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 07:23:02', '2019-11-18 07:23:02'),
(30, 14, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 07:36:29', '2019-11-18 07:36:29'),
(31, 15, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 07:44:44', '2019-11-18 07:44:44'),
(32, 16, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 07:59:14', '2019-11-18 07:59:14'),
(33, 17, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-18 08:13:07', '2019-11-18 08:13:07'),
(34, 7, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-21 01:54:36', '2019-11-21 01:54:36'),
(35, 8, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-21 02:28:09', '2019-11-21 02:28:09'),
(36, 9, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-21 02:40:25', '2019-11-21 02:40:25'),
(37, 10, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-21 02:58:55', '2019-11-21 02:58:55'),
(38, 11, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-21 03:16:25', '2019-11-21 03:16:25'),
(39, 12, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Project', '2019-11-21 03:25:22', '2019-11-21 03:25:22'),
(40, 18, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 05:51:54', '2019-11-21 05:51:54'),
(41, 19, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 06:03:11', '2019-11-21 06:03:11'),
(42, 20, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 06:12:15', '2019-11-21 06:12:15'),
(43, 21, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 06:26:59', '2019-11-21 06:26:59'),
(44, 22, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 06:56:50', '2019-11-21 06:56:50'),
(45, 23, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 07:18:36', '2019-11-21 07:18:36'),
(46, 24, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 07:26:48', '2019-11-21 07:26:48'),
(47, 25, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 07:34:38', '2019-11-21 07:34:38'),
(48, 26, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 07:40:46', '2019-11-21 07:40:46'),
(49, 27, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 07:45:34', '2019-11-21 07:45:34'),
(52, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2019-11-21 07:49:25', '2019-11-21 07:49:25'),
(53, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2019-11-21 07:49:35', '2019-11-21 07:49:35'),
(54, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2019-11-21 07:50:02', '2019-11-21 07:50:02'),
(55, 5, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2019-11-21 07:50:17', '2019-11-21 07:50:17'),
(56, 6, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2019-11-21 07:50:36', '2019-11-21 07:50:36'),
(57, 7, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2019-11-21 07:50:58', '2019-11-21 07:50:58'),
(58, 28, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 19:53:17', '2019-11-21 19:53:17'),
(59, 29, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-21 19:59:16', '2019-11-21 19:59:16'),
(60, 30, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-22 00:29:01', '2019-11-22 00:29:01'),
(61, 31, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-22 00:42:28', '2019-11-22 00:42:28'),
(62, 32, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-22 00:47:18', '2019-11-22 00:47:18'),
(63, 33, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-22 00:57:15', '2019-11-22 00:57:15'),
(64, 34, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\RealEstate\\Models\\Property', '2019-11-22 01:06:09', '2019-11-22 01:06:09'),
(65, 8, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2019-11-22 01:26:08', '2019-11-22 01:26:08'),
(66, 5, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2019-11-22 01:26:31', '2019-11-22 01:26:31'),
(67, 6, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2019-11-22 01:29:45', '2019-11-22 01:29:45'),
(68, 7, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2019-11-22 01:33:23', '2019-11-22 01:33:23'),
(69, 8, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2019-11-22 01:39:38', '2019-11-22 01:39:38'),
(74, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Career\\Models\\Career', '2019-11-30 19:43:10', '2019-11-30 19:43:10'),
(75, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Career\\Models\\Career', '2019-11-30 19:49:07', '2019-11-30 19:49:07'),
(76, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Career\\Models\\Career', '2019-11-30 19:52:42', '2019-11-30 19:52:42'),
(77, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Career\\Models\\Career', '2019-11-30 19:56:50', '2019-11-30 19:56:50'),
(80, 2, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(81, 4, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(82, 6, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(83, 8, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(84, 10, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(85, 12, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(86, 14, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(87, 16, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(88, 18, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(89, 20, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(90, 22, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(91, 24, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(92, 26, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(93, 28, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(94, 30, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(95, 32, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(96, 34, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Property', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(97, 2, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Project', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(98, 4, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Project', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(99, 6, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Project', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(100, 8, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Project', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(101, 10, 'video', '[{\"thumbnail\":\"\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Project', '2021-04-29 20:46:36', '2021-04-29 20:46:36'),
(102, 12, 'video', '[{\"thumbnail\":\"properties\\/property-video-thumb.jpg\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=UfEiKK-iX70\"}]', 'Botble\\RealEstate\\Models\\Project', '2021-04-29 20:46:36', '2021-04-29 20:46:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(6, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(7, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(8, '2016_06_01_000004_create_oauth_clients_table', 1),
(9, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(10, '2016_06_10_230148_create_acl_tables', 1),
(11, '2016_06_14_230857_create_menus_table', 1),
(12, '2016_06_28_221418_create_pages_table', 1),
(13, '2016_10_05_074239_create_setting_table', 1),
(14, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(15, '2016_12_16_084601_create_widgets_table', 1),
(16, '2017_05_09_070343_create_media_tables', 1),
(17, '2017_11_03_070450_create_slug_table', 1),
(18, '2019_07_15_042406_change_site_title_from_settings_to_theme_options', 1),
(19, '2019_08_13_033145_remove_unused_columns_in_users_table', 1),
(20, '2019_08_19_000000_create_failed_jobs_table', 1),
(21, '2019_09_07_030654_update_menu_nodes_table', 1),
(22, '2019_09_07_045041_update_slugs_table', 1),
(23, '2019_09_07_050405_update_slug_reference_for_page', 1),
(24, '2019_09_08_014859_update_meta_boxes_table', 1),
(25, '2019_09_08_015629_update_meta_box_data_for_page', 1),
(26, '2019_09_12_073711_update_media_url', 1),
(27, '2019_09_12_073711_update_media_url_for_current_data', 1),
(28, '2019_10_20_002256_remove_parent_id_in_pages_table', 1),
(31, '2018_06_22_032304_create_real_estate_table', 2),
(32, '2015_06_29_025744_create_audit_history', 3),
(33, '2015_06_18_033822_create_blog_table', 4),
(34, '2019_09_07_035526_update_menu_node_reference_type_for_category', 4),
(35, '2019_09_07_050058_update_slug_reference_for_blog', 4),
(36, '2019_09_07_155716_update_language_meta_for_blog', 4),
(37, '2019_09_08_015552_update_meta_box_data_for_blog', 4),
(38, '2019_10_20_002342_remove_parent_id_in_tags_table', 4),
(39, '2016_10_03_032336_create_languages_table', 5),
(40, '2019_09_07_154718_update_lang_meta_table', 5),
(41, '2017_10_24_154832_create_newsletter_table', 6),
(42, '2016_06_17_091537_create_contacts_table', 7),
(43, '2015_08_15_122343_create_notes_table', 8),
(44, '2019_11_18_035125_add_column_type_into_re_properties_table', 9),
(45, '2019_11_18_035712_create_investor_table', 9),
(46, '2019_11_18_040153_update_real_estates_table', 9),
(47, '2019_11_18_041228_drop_table_re_property_categories', 10),
(48, '2019_11_18_082146_create_currencies_table', 11),
(49, '2019_11_18_061011_create_country_table', 12),
(50, '2019_11_18_061730_create_state_table', 12),
(51, '2019_11_18_062515_create_city_table', 12),
(52, '2019_11_19_063851_create_project_features_table', 13),
(53, '2019_11_21_090830_update_project_and_property_table', 14),
(54, '2019_11_21_130139_add_price_to_projects_table', 15),
(55, '2019_11_14_210650_create_consults_table', 16),
(56, '2019_11_26_024326_update_property_type', 17),
(57, '2019_06_24_211801_create_career_table', 18),
(58, '2019_12_03_123314_add_column_slug_into_cities_table', 19),
(59, '2019_12_03_124417_add_column_city_id_into_table_properties_and_projects', 19),
(60, '2017_05_18_080441_create_payment_tables', 20),
(61, '2019_12_10_140938_create_vendor_table', 20),
(62, '2019_12_15_025938_update_column_images_in_real_estate_tables', 20),
(63, '2019_12_17_064316_add_column_period_to_table_re_properties', 20),
(64, '2019_12_24_033049_add_column_author_into_re_properties_table', 20),
(65, '2019_12_24_083810_vendor_create_package_table', 20),
(66, '2019_12_27_004653_update_vendors_table_with_package_data', 20),
(68, '2020_01_08_002704_real_estate_create_type_table', 21),
(69, '2020_01_10_133700_change_re_types_to_re_categories', 22),
(70, '2016_10_07_193005_create_translations_table', 23),
(71, '2020_01_23_133752_update_account_tables', 24),
(72, '2020_02_03_144309_update_column_payment_channel', 25),
(73, '2020_02_06_143217_update_vendor_table', 26),
(74, '2020_02_11_133026_add_description_to_table_payments', 27),
(75, '2020_02_11_140823_create_transactions_table', 27),
(76, '2020_02_23_111922_fix_column_number_block_in_re_properties_table', 27),
(77, '2020_03_24_151004_add_moderation_status_into_properties_table', 28),
(78, '2020_03_25_030953_create_table_vendor_packages', 29),
(79, '2020_03_25_083610_add_column_expire_date_into_re_properties_table', 30),
(80, '2020_03_26_081108_add_column_auto_renew_to_re_properties_table', 31),
(81, '2020_03_16_072752_add_column_abbreviation_to_states_table', 32),
(82, '2020_03_28_020724_make_column_user_id_nullable_table_revisions', 33),
(83, '2020_03_23_093053_update_payments_table', 34),
(84, '2020_04_22_074304_add_column_never_expired_to_re_properties_table', 35),
(85, '2020_05_26_014304_add_column_provider_to_oauth_clients_table', 36),
(86, '2020_07_27_085437_add_icon_to_re_features', 37),
(90, '2020_08_21_102728_real_estate_create_facility_table', 38),
(91, '2020_08_22_024455_rename_table_for_accounts', 39),
(92, '2020_08_26_130439_add_column_username_into_table_re_accounts', 40),
(93, '2020_09_09_110653_update_table_careers', 41),
(94, '2020_09_15_111419_fix_old_data_for_re_properties', 42),
(95, '2020_10_05_030817_make_column_charge_id_nullable', 43),
(96, '2020_10_18_134416_fix_audit_logs_table', 44),
(97, '2020_10_24_133432_change_column_distance_to_string', 45),
(99, '2020_10_31_053746_add_column_description_into_re_categories_table', 46),
(100, '2019_01_05_053554_create_jobs_table', 47),
(101, '2020_12_05_112556_change_contact_page_to_a_page', 48),
(102, '2021_02_11_031126_update_price_column_in_projects_and_properties', 49),
(103, '2021_02_16_092633_remove_default_value_for_author_type', 50),
(104, '2021_03_08_024049_add_lat_long_into_real_estate_tables', 51),
(105, '2021_03_27_144913_add_customer_type_into_table_payments', 52),
(106, '2021_05_24_034720_make_column_currency_nullable', 53),
(107, '2021_06_10_091950_add_column_is_featured_to_table_re_accounts', 54),
(108, '2021_07_07_021757_update_table_account_activity_logs', 55),
(109, '2021_07_18_101839_fix_old_theme_options', 56),
(110, '2021_08_05_134214_fix_social_link_theme_options', 57),
(111, '2021_08_09_161302_add_metadata_column_to_payments_table', 58),
(112, '2021_09_29_042758_create_re_categories_multilevel_table', 59),
(113, '2021_10_19_020859_update_metadata_field', 60),
(114, '2021_10_31_031254_add_company_to_accounts_table', 61),
(115, '2021_10_25_021023_fix-priority-load-for-language-advanced', 62),
(116, '2021_12_03_030600_create_blog_translations', 62),
(117, '2021_12_03_075608_create_page_translations', 62),
(118, '2021_12_03_084118_create_location_translations', 62),
(119, '2021_12_03_094518_migrate_old_location_data', 62),
(120, '2021_12_04_095357_create_careers_translations_table', 62),
(121, '2021_12_10_034440_switch_plugin_location_to_use_language_advanced', 63),
(122, '2021_12_10_034807_create_real_estate_translation_tables', 64),
(123, '2021_12_18_081636_add_property_project_views_count', 65),
(124, '2021_07_08_140130_comment_create_comment_table', 66),
(125, '2021_07_26_132731_create_comment_ratings_table', 66),
(126, '2021_09_04_040331_change_email_column_in_bb_comment_users_table', 66);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('05414d1ece8705bf6a4bdc426207989b7f8f8f96b7c0f9322462ef635eb708a754f4e4bfcd17588a', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-01-12 18:26:33', '2022-01-12 18:26:33', '2023-01-13 01:26:33'),
('087aa3b808cd9e87c1f27f9f2b515d13ba86e2eb2d72d03152960d08617a4e588f4c0a02b0fdfd18', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-14 18:27:53', '2022-01-14 18:27:53', '2023-01-15 01:27:53'),
('0b827eadf5ed0ebe871a003935cf92d2fcec77b872cbc6712e076155f2e983a4bf5d233b73d41350', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-14 18:33:49', '2022-01-14 18:33:49', '2023-01-15 01:33:49'),
('0d6c28a7141aa89266196ea6c2242f6320fd24783ba50b1c485dedb976647327b62c8ae2728149a4', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-14 18:37:08', '2022-01-14 18:37:08', '2023-01-15 01:37:08'),
('10af98643cb021e6d81f28a93e7c2a305154df576834b8495922b3ab51e038f87809c0cc95ffecf6', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-14 18:43:40', '2022-01-14 18:43:40', '2023-01-15 01:43:40'),
('11ccba2eff5d17f47c447cfb0565022d90383e4c314043223c39c0717ecf093be99bf39d8f966169', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-01-15 04:44:30', '2022-01-15 04:44:30', '2023-01-15 11:44:30'),
('2402d58e0f40e059efe734381ceb1fb4e8206e5041b50e54867247e7937f9f1eb9b6887516be2bb2', 2, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-15 06:29:17', '2022-01-15 06:29:17', '2023-01-15 13:29:17'),
('3babc4f07da632630ba1ac63eb75b271aada8f2ba21a9bac57fb58dbdaa44b57a1e27d6f49247fe8', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-15 06:22:14', '2022-01-15 06:22:14', '2023-01-15 13:22:14'),
('49f5c1b7b93d16c690f82b409445d73b8a0fc803a038cd8f44536978e878445ae1a7cc122ef383a6', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-14 06:43:50', '2022-01-14 06:43:50', '2023-01-14 13:43:50'),
('4a8b8e05ddfcfb1fc1a3e09b7b2a8911c40a95b1cafd08e38126185eb2118c424d8c77f0ead96ddd', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-14 18:23:52', '2022-01-14 18:23:52', '2023-01-15 01:23:52'),
('6749d012b3921b2eb177d91f93aed90ae8a6a2fc084fd90a2665e50cc67567e4f56dfd266c654bc2', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-10 18:47:08', '2022-01-10 18:47:08', '2023-01-11 01:47:08'),
('7a581bd6293db65d9c851faf5776336335e512ed0d94cc48e0e54e7384097be05087c4b39848a55e', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-08 19:53:45', '2022-01-08 19:53:45', '2023-01-09 02:53:45'),
('85cc52adeb059da63a97003d59f32694f25d68fed9861cdd466e1ac0cc9d235e1246a9d56717336a', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-14 18:36:50', '2022-01-14 18:36:50', '2023-01-15 01:36:50'),
('967921e11449b591f6b33de8693b69c417b5a6839ae6e3a294874fdbe85a5802d05ae87c8a63f333', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-10 07:28:30', '2022-01-10 07:28:30', '2023-01-10 14:28:30'),
('9e90cee5e8f4dcc74d67d7693fabea6a45c78e9f04f01cfd15b59d3eff4117eaf1d16ef68731501e', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-01-15 02:17:49', '2022-01-15 02:17:49', '2023-01-15 09:17:49'),
('a1337a50f94b2653b6edc3072c1a0ff3d740db5e80e2a9cd4c4eeae7fe1d552708169fec3f7035b9', 2, 1, 'Laravel Password Grant Client', '[]', 0, '2022-01-15 06:30:09', '2022-01-15 06:30:09', '2023-01-15 13:30:09'),
('c35b80f3ec8d9b987f4a255d11494aa3d6c3adca8674f30480b15634d6d9cc59f3d1ecbb511999e7', 1, 1, 'Laravel Password Grant Client', '[]', 1, '2022-01-14 18:14:50', '2022-01-14 18:14:50', '2023-01-15 01:14:50'),
('cfa52bfa4b6db3d66557b7d0e3015ccbf1c3809f93e375bdbc4e5051b13a9d7af4e920a919ac65b4', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-01-14 18:42:25', '2022-01-14 18:42:25', '2023-01-15 01:42:25'),
('d524c535c06ab61d82dfb88cbd41a7e83b9fded796b4a9fe05fc5a91999ab1c68b34afe741fd2e7d', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-01-08 00:13:44', '2022-01-08 00:13:44', '2023-01-08 07:13:44'),
('eca0e38470dc881e2230feb3bd5d92715f5568982b5302cc2d5282ea5693fed2278c0a10df2e5d93', 1, 1, 'Laravel Password Grant Client', '[]', 0, '2022-01-14 23:19:45', '2022-01-14 23:19:45', '2023-01-15 06:19:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, 'Your App Personal Access Client', '7CxyOOm4JtOafXx4OOB0lUDLyEE9hFcwS8rb1EPP', 'http://localhost', 1, 0, 0, '2022-01-08 00:09:44', '2022-01-08 00:09:44', NULL),
(2, NULL, 'Your App Password Grant Client', 'dYkaJYQ5YXHbbuR6dyCIwCvkYsjkfkTMNCVeYGTy', 'http://localhost', 0, 1, 0, '2022-01-08 00:09:44', '2022-01-08 00:09:44', 'users');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-01-08 00:09:44', '2022-01-08 00:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `is_featured`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home', '<div>[featured-projects][/featured-projects]</div><div>[properties-by-locations][/properties-by-locations]</div><div>[properties-for-sale][/properties-for-sale]</div><div>[properties-for-rent][/properties-for-rent]</div><div>[featured-agents title=\"Featured Agents\"][/featured-agents]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\"][/recently-viewed-properties]</div><div>[latest-news][/latest-news]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(2, 'News', '---', 1, NULL, 'default', 0, NULL, 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(3, 'About us', '<h4><span style=\"font-size:18px;\"><b>1. COMPANY</b><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong> PROFILE</strong></span></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.<br />\nWith the slogan &quot;Breaking time, through space&quot; with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field. Real estate, bringing people closer together, over the distance of time and space, is a reliable place for real estate investment - an area that is constantly evolving over time.</span></span></p>\n\n<blockquote>\n<h2 style=\"font-style: italic; text-align: center;\"><span style=\"font-size:24px;\"><strong><span style=\"font-family:Arial,Helvetica,sans-serif;\"><span style=\"color:#16a085;\">&quot;Breaking time, through space&quot;</span></span></strong></span></h2>\n</blockquote>\n\n<h4 style=\"text-align: center;\"><img alt=\"\" src=\"http://flex-home.test/storage/general/asset-3-at-3x.png\" style=\"width: 90%;\" /></h4>\n\n<h4><span style=\"font-size:18px;\"><b><font face=\"Arial, Helvetica, sans-serif\">2. VISION&nbsp;</font></b></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Acquiring domestic areas.<br />\n- Reaching far across continents.</span></span></p>\n\n<h4><span style=\"font-size:18px;\"><b>3. MISSION</b></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">- Creating the community<br />\n- Building destinations<br />\n- Nurture happiness</span></span></p>\n\n<p><img alt=\"\" src=\"http://flex-home.test/storage/general/vietnam-office-4.jpg\" /></p>\n', 1, NULL, 'default', 0, 'Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.\nWith the slogan \"Breaking time, through space\" with a sustainable development strategy, taking Real Estate as a focus area, Flex Home is constantly connecting between buyers and sellers in the field.', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(4, 'Contact', '<p>[contact-form][/contact-form]<br />\n&nbsp;</p>\n\n<h3>Directions</h3>\n\n<p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p>\n\n<p>&nbsp;</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(5, 'Terms & Conditions', '<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Access to and use of the Flex Home website is subject to the following terms, conditions, and relevant laws of Vietnam.</span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>1. Copyright</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes, providing information or personal purposes. </span></span><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Any content from this site may not be used for sale or distribution for profit, nor may it be edited or included in any other publication or website.</span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>2. Content</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">The information on this website is compiled with great confidence but for general information research purposes only. While we endeavor to maintain updated and accurate information, we make no representations or warranties in any manner regarding completeness, accuracy, reliability, appropriateness or availability in relation to web site, or related information, product, service, or image within the website for any purpose. </span></span></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Flex Home and its employees, managers, and agents are not responsible for any loss, damage or expense incurred as a result of accessing and using this website and the sites. </span></span><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">The web is connected to it, including but not limited to, loss of profits, direct or indirect losses. We are also not responsible, or jointly responsible, if the site is temporarily inaccessible due to technical issues beyond our control. Any comments, suggestions, images, ideas and other information or materials that users submit to us through this site will become our exclusive property, including the right to may arise in the future associated with us.</span></span></p>\n\n<p style=\"text-align: center;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><img alt=\"\" src=\"http://flex-home.test/storage/general/copyright.jpg\" style=\"width: 90%;\" /></span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>3. Note on&nbsp;connected sites</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">At many points in the website, users can get links to other websites related to a specific aspect. This does not mean that we are related to the websites or companies that own these websites. Although we intend to connect users to sites of interest, we are not responsible or jointly responsible for our employees, managers, or representatives. with other websites and information contained therein.</span></span></p>\n', 1, NULL, 'default', 0, 'Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes.', 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(6, 'Cookie Policy', '<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-12-09 21:25:35', '2021-12-09 21:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `pages_translations`
--

CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages_translations`
--

INSERT INTO `pages_translations` (`lang_code`, `pages_id`, `name`, `description`, `content`) VALUES
('vi', 1, 'Trang chủ', NULL, '<div>[featured-projects][/featured-projects]</div><div>[properties-by-locations][/properties-by-locations]</div><div>[properties-for-sale][/properties-for-sale]</div><div>[properties-for-rent][/properties-for-rent]</div><div>[featured-agents title=\"Đại lý nổi bật\"][/featured-agents]</div><div>[recently-viewed-properties title=\"Nhà/căn hộ đã xem\" description=\"Các căn hộ/nhà mà bạn đã xem.\"][/recently-viewed-properties]</div><div>[latest-news][/latest-news]</div>'),
('vi', 2, 'Tin tức', NULL, '---'),
('vi', 3, 'Về chúng tôi', 'Được thành lập ngày 28 - 08 -1993 (tiền thân là công ty TNHH Xây Dựng Trường Thịnh Phát), Flex Home hoạt động trong lĩnh vực kinh doanh bất động sản, xây biệt thự cho thuê. Với khẩu hiệu  “Đánh bật thời gian, xuyên qua không gian” cùng chiến lược phát triển bền vững, Flex Home không ngừng kết nối giữa người cần mua và người cần bán trong lĩnh vực bất động sản', '<h4><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>1. SƠ LƯỢC VỀ C&Ocirc;NG TY</strong></span></span></h4>\n\n<p><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Được th&agrave;nh lập ng&agrave;y 28 - 08 -1993 (tiền th&acirc;n l&agrave; c&ocirc;ng ty TNHH X&acirc;y Dựng Trường Thịnh Ph&aacute;t), Flex Home hoạt động trong lĩnh vực kinh doanh bất động sản, x&acirc;y biệt thự cho thu&ecirc;.&nbsp;<br />\nVới khẩu hiệu &nbsp;&ldquo;Đ&aacute;nh bật thời gian, xuy&ecirc;n qua kh&ocirc;ng gian&rdquo; c&ugrave;ng chiến lược ph&aacute;t triển bền vững, lấy Bất Động Sản l&agrave;m lĩnh vực trọng t&acirc;m, Flex Home kh&ocirc;ng ngừng kết nối giữa người cần mua v&agrave; người cần b&aacute;n trong lĩnh vực bất động sản, đưa mọi người x&iacute;ch lại gần nhau hơn, vượt qua khoảng c&aacute;ch về thời gian v&agrave; kh&ocirc;ng gian, l&agrave; nơi đ&aacute;ng tin tưởng cho sự đầu tư bất động sản - một lĩnh vực kh&ocirc;ng ngừng ph&aacute;t triển qua thời gian.</span></span></p>\n\n<blockquote>\n<h3 style=\"text-align: center;\"><span style=\"font-size:24px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><em><strong><span style=\"color:#1abc9c;\">&ldquo;Đ&aacute;nh bật thời gian, xuy&ecirc;n qua kh&ocirc;ng gian&rdquo; </span></strong></em></span></span></h3>\n</blockquote>\n\n<h3 style=\"text-align: center;\"><img alt=\"\" src=\"http://flex-home.test/storage/general/asset-4-at-3x.png\" style=\"width: 90%;\" /></h3>\n\n<h4><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>2. TẦM NH&Igrave;N</strong></span></span></h4>\n\n<ul>\n	<li><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Th&acirc;u t&oacute;m địa b&agrave;n trong nước.</span></span></li>\n	<li><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Vươn xa khắp c&aacute;c ch&acirc;u lục.</span></span></li>\n</ul>\n\n<h4><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>3. SỨ MẠNG</strong></span></span></h4>\n\n<ul>\n	<li><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Kiến tạo cộng đồng</span></span></li>\n	<li><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">X&acirc;y dựng điểm đến</span></span></li>\n	<li><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Vun đắp niềm vui</span></span></li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p><img alt=\"\" src=\"http://flex-home.test/storage/general/vietnam-office-4.jpg\" style=\"width: 100%;\" /></p>\n\n<p>&nbsp;</p>\n'),
('vi', 4, 'Liên hệ', NULL, '<p>[contact-form][/contact-form]<br />\n&nbsp;</p>\n\n<h3>Tìm đường đi</h3>\n\n<p>[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]</p>\n\n<p>&nbsp;</p>'),
('vi', 5, 'Điều khoản và quy định', 'Quyền tác giả và các quyền sở hữu trí tuệ khác đối với mọi văn bản, hình ảnh, âm thanh, phần mềm và các nội dung khác trên trang web này thuộc quyền sở hữu của Flex Home cùng các công ty thành viên. Người truy cập được phép xem các nội dung trong trang web, trích dẫn nội dung bằng cách in ấn, tải về đĩa cứng và phân phát cho người khác chỉ với mục đích phi thương mại.', '<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Việc truy cập v&agrave; sử dụng trang web của Flex Home phụ thuộc v&agrave;o những điều khoản, điều kiện dưới đ&acirc;y, v&agrave; luật ph&aacute;p li&ecirc;n quan của Việt Nam.</span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>1. Quyền t&aacute;c giả&nbsp;</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Quyền t&aacute;c giả v&agrave; c&aacute;c quyền sở hữu tr&iacute; tuệ kh&aacute;c đối với mọi văn bản, h&igrave;nh ảnh, &acirc;m thanh, phần mềm v&agrave; c&aacute;c nội dung kh&aacute;c tr&ecirc;n trang web n&agrave;y thuộc quyền sở hữu của Flex Home c&ugrave;ng c&aacute;c c&ocirc;ng ty th&agrave;nh vi&ecirc;n. Người truy cập được ph&eacute;p xem c&aacute;c nội dung trong trang web, tr&iacute;ch dẫn nội dung bằng c&aacute;ch in ấn, tải về đĩa cứng v&agrave; ph&acirc;n ph&aacute;t cho người kh&aacute;c chỉ với mục đ&iacute;ch phi thương mại, cung cấp th&ocirc;ng tin hoặc mục đ&iacute;ch c&aacute; nh&acirc;n. Bất kể nội dung n&agrave;o từ trang web n&agrave;y đều kh&ocirc;ng được sử dụng để b&aacute;n hoặc ph&acirc;n t&aacute;n để kiếm lợi v&agrave; cũng kh&ocirc;ng được chỉnh sửa hoặc đưa v&agrave;o bất kỳ ấn phẩm hoặc trang web n&agrave;o kh&aacute;c.</span></span></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>2. Nội dung</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Th&ocirc;ng tin tr&ecirc;n trang web n&agrave;y được bi&ecirc;n soạn với sự tin tưởng cao độ nhưng chỉ d&agrave;nh cho c&aacute;c mục đ&iacute;ch nghi&ecirc;n cứu th&ocirc;ng tin tổng qu&aacute;t. Tuy ch&uacute;ng t&ocirc;i nỗ lực duy tr&igrave; th&ocirc;ng tin cập nhật v&agrave; chuẩn x&aacute;c, nhưng ch&uacute;ng t&ocirc;i kh&ocirc;ng khẳng định hay bảo đảm theo bất kỳ c&aacute;ch thức n&agrave;o về sự đầy đủ, ch&iacute;nh x&aacute;c, đ&aacute;ng tin cậy, th&iacute;ch hợp hoặc c&oacute; sẵn li&ecirc;n quan đến trang web, hoặc th&ocirc;ng tin, sản phẩm, dịch vụ, hoặc h&igrave;nh ảnh li&ecirc;n quan trong trang web v&igrave; bất cứ mục đ&iacute;ch g&igrave;. </span></span></p>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Flex Home v&agrave; mọi nh&acirc;n vi&ecirc;n, nh&agrave; quản l&yacute;, v&agrave; c&aacute;c b&ecirc;n đại diện ho&agrave;n to&agrave;n kh&ocirc;ng chịu tr&aacute;ch nhiệm g&igrave; đối với bất kỳ tổn thất, thiệt hại hoặc chi ph&iacute; ph&aacute;t sinh do việc truy cập v&agrave; sử dụng trang web n&agrave;y v&agrave; c&aacute;c trang web được kết nối với n&oacute;, bao gồm nhưng kh&ocirc;ng giới hạn, việc mất đi lợi nhuận, c&aacute;c khoản lỗ trực tiếp hoặc gi&aacute;n tiếp. Ch&uacute;ng t&ocirc;i cũng kh&ocirc;ng chịu tr&aacute;ch nhiệm, hoặc li&ecirc;n đới tr&aacute;ch nhiệm nếu trang web tạm thời kh&ocirc;ng thể truy cập do c&aacute;c vấn đề kỹ thuật nằm ngo&agrave;i tầm kiểm so&aacute;t của ch&uacute;ng t&ocirc;i. Mọi b&igrave;nh luận, gợi &yacute;, h&igrave;nh ảnh, &yacute; tưởng v&agrave; những th&ocirc;ng tin hay t&agrave;i liệu kh&aacute;c m&agrave; người sử dụng chuyển cho ch&uacute;ng t&ocirc;i th&ocirc;ng qua trang web n&agrave;y sẽ trở th&agrave;nh t&agrave;i sản độc quyền của ch&uacute;ng t&ocirc;i, bao gồm cả c&aacute;c quyền c&oacute; thể ph&aacute;t sinh trong tương lai gắn liền với ch&uacute;ng t&ocirc;i.</span></span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://flex-home.test/storage/general/copyright.jpg\" style=\"width: 90%;\" /></p>\n\n<h4 style=\"text-align: justify;\"><span style=\"font-size:18px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\"><strong>3. Lưu &yacute; c&aacute;c trang web được kết nối</strong></span></span></h4>\n\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">Tại nhiều điểm trong trang web, người sử dụng c&oacute; thể nhận được c&aacute;c kết nối đến c&aacute;c trang web kh&aacute;c li&ecirc;n quan đến một kh&iacute;a cạnh cụ thể. Điều n&agrave;y kh&ocirc;ng c&oacute; nghĩa l&agrave; ch&uacute;ng t&ocirc;i c&oacute; li&ecirc;n quan đến những trang web hay c&ocirc;ng ty sở hữu những trang web n&agrave;y. D&ugrave; ch&uacute;ng t&ocirc;i c&oacute; &yacute; định kết nối người sử dụng đến c&aacute;c trang web cần quan t&acirc;m, nhưng ch&uacute;ng t&ocirc;i v&agrave; c&aacute;c nh&acirc;n vi&ecirc;n, nh&agrave; quản l&yacute;, hoặc c&aacute;c b&ecirc;n đại diện ho&agrave;n to&agrave;n kh&ocirc;ng chịu tr&aacute;ch nhiệm hoặc li&ecirc;n đới chịu tr&aacute;ch nhiệm g&igrave; đối với c&aacute;c trang web kh&aacute;c v&agrave; th&ocirc;ng tin chứa đựng trong đ&oacute;.</span></span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size:16px;\"><span style=\"font-family:Arial,Helvetica,sans-serif;\">At many points in the website, users can get links to other websites related to a specific aspect. This does not mean that we are related to the websites or companies that own these websites. Although we intend to connect users to sites of interest, we are not responsible or jointly responsible for our employees, managers, or representatives. with other websites and information contained therein.</span></span></p>\n'),
('vi', 6, 'Cookie Policy', NULL, '<h3>EU Cookie Consent</h3><p>Để sử dụng trang web này, chúng tôi đang sử dụng Cookie và thu thập một số Dữ liệu. Để tuân thủ GDPR của Liên minh Châu Âu, chúng tôi cho bạn lựa chọn nếu bạn cho phép chúng tôi sử dụng một số Cookie nhất định và thu thập một số Dữ liệu.</p><h4>Dữ liệu cần thiết</h4><p>Dữ liệu cần thiết là cần thiết để chạy Trang web bạn đang truy cập về mặt kỹ thuật. Bạn không thể hủy kích hoạt chúng.</p><p>- Session Cookie: PHP sử dụng Cookie để xác định phiên của người dùng. Nếu không có Cookie này, trang web sẽ không hoạt động.</p><p>- XSRF-Token Cookie: Laravel tự động tạo \"token\" CSRF cho mỗi phiên người dùng đang hoạt động do ứng dụng quản lý. Token này được sử dụng để xác minh rằng người dùng đã xác thực là người thực sự đưa ra yêu cầu đối với ứng dụng.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `charge_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, 'BCG sets great store by real estate negotiations', 'BCG leaders shared with investors at a meeting this month that real estate and renewable energy will be the two main activities of the group. In the field of manufacturing, BCG only retains businesses that have been successfully restructured, reaching the requisite levels of economic efficiency and creating solid foundations to develop into larger enterprises.', '<h2 style=\"font-style:italic;\">The profit of Bamboo Capital Group (BCG) is expected to grow tremendously during 2019-2023 thanks to a series of real estate as well as renewable energy projects, especially Radisson Blu Hoi An and King Crown Village Thao Dien.</h2>\r\n\r\n<p>BCG leaders shared with investors at a meeting this month that real estate and renewable energy will be the two main activities of the group. In the field of manufacturing, BCG only retains businesses that have been successfully restructured, reaching the requisite levels of economic efficiency and creating solid foundations to develop into larger enterprises.</p>\r\n\r\n<p>BCG expects to reach the after-tax profit of VND312 billion ($13.56 million) this year, VND681.5 ($29.6 million) in 2020, and VND826.5 billion ($35.93 million) in 2023. In real estate, BCG has implemented the Radisson Blu Hoi An project with the scale of 734 apartments and coastal villas, King Crown Village Thao Dien in District 2, Ho Chi Minh City with 17 villas in the first phase and serviced apartments and a hotel, as well as offices for lease in the second phase.</p>\r\n\r\n<p>BCG leaders shared that in 2019-2020, Radisson Blu Hoi An and King Crown Village Thao Dien will bring VND900 billion ($39.13 million) in profit to BCG, and the group is negotiating to transfer part of the group&rsquo;s capital in the two projects. BCG owns a hundred per cent in Radisson Blu Hoi An, and 48.5 per cent in King Crown Village Thao Dien.</p>\r\n\r\n<p>&quot;If we close the deals with our partners soon, BCG will fulfil the profit plan for 2019. Currently, the deal is still in progress, but we are confident in implementing our 2019 profit plan. If the deal is delayed for any reason, the profit will be transferred by the beginning of 2020,&quot; Pham Minh Tuan, deputy CEO of BCG, shared.</p>\r\n\r\n<p>The upcoming real estate projects of BCG include Condotel Pegas Nha Trang (2.74 hectares, implemented in 2020-2021), Bao Loc urban area (​​17ha, in 2019-2023), Loc Phat residential area (Bao Loc, Lam Dong &ndash; 46.9ha, implemented from 2019 to 2022), Hoa Ninh residential area (Di Linh, Lam Dong &ndash;49.3ha, implemented in 2020-2023), Hiep Binh Chanh urban area (​​6.3ha, implemented in 2020-2022).</p>\r\n\r\n<p>Regarding the capital to meet BCG&#39;s investment needs, according to Nguyen Ho Nam, chairman of BCG, most of BCG&#39;s projects are co-operating with international corporations on issues like technical and technological issues, branding, or capital co-operation.</p>\r\n\r\n<p>BCG has signed a contract with KPMG Singapore to become the exclusive consultant for BCG to seek international funding and domestic banks to increase credit room for BCG to implement a new project. Along with that, BCG received capital contributions from South Korean investors including Hanwha Energy involved in solar power plant projects and real estate firm Woomi.</p>\r\n\r\n<p>BCG is also working with a strategic partner from Europe. In the field of renewable energy, BCG finished two solar energy projects in Long An with the total capacity of over 140MW. Of these, the BCG-CME Long An 1 solar power plant, which in BCG holds 37.5 per cent, has the capacity of 40.5MW and is expected to bring revenue of VND140-150 billion ($6.1-6.5 million) per year from 2020.</p>\r\n\r\n<p>BCG-CME Long An 2 (GAIA) has the capacity of 100.5MW and is expected to launch operations in this November, bringing revenue of about VND320 billion per year from 2020. BCG has a 32.5 per cent stake in GAIA.</p>\r\n\r\n<p>BCG-CME Long An 1 solar power plant sells electricity to Electricity of Vietnam at the price of 9.35 US cent per kW for 20 years, while GAIA hopes to sell electricity at 8.72 US cent per kW. In addition to the two projects above, BCG is trying to complete procedures for other solar power plants in Long An (100MW), Dak Lak (50MW), Gia Lai (300MW), Tay Ninh (165MW), a surface solar power plant in Quang Nam (200MW), a wind power plant in Soc Trang (50MW).</p>\r\n\r\n<p>At the two solar power plants in Long An, BCG worked with Vietnam-Oman Investment (VOI) and took up VND2 trillion in loans from local banks ($86.96 million &ndash; 65 per cent of the total investment capital of the two projects).</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'properties/1-2.jpg', 1663, NULL, '2021-12-09 21:25:40', '2022-01-15 06:21:27'),
(2, 'Private Home Sales Drop 27% In October', 'New private home sales in Singapore fell 27% in October from September, reported Channel News Asia, based on the data released by the Urban Redevelopment Authority (URA).\r\nAccording to URA data, developers only sold 928 units in October (955 units including executive condominiums), compared to 1,270 units from the previous month', '<p>New private home sales in Singapore fell 27% in October from September, reported Channel News Asia, based on the data released by the&nbsp;Urban Redevelopment Authority (URA).</p>\r\n\r\n<p><strong>According to URA data,&nbsp;developers only sold 928 units in October (955 units including executive condominiums), compared to 1,270 units from the previous month.</strong></p>\r\n\r\n<p>However, on a year-to-year comparison, the figures show an 84.9% increase.</p>\r\n\r\n<p>The new homes sold in October in the Core Central Region (CCR) tripled to 182 units from September, the biggest recorded since March 2016, with Singaporeans buying 133 of those units.</p>\r\n\r\n<p>Analysts said the good performance was mainly due to new project launches in the area, including&nbsp;<strong>Midtown<a href=\"https://www.propertyguru.com.sg/property-for-sale/at-midtown-bay-23760\"> </a>Bay Residences</strong>,&nbsp;<strong>Neu at Novena</strong>&nbsp;and&nbsp;<strong>Royalgreen</strong>. The other new launch this month was Midwood, within the Outside of Central Region (OCR)</p>\r\n\r\n<p>The deficiency in major launches in the city fringe and mass-market segments like the OCR could have been a factor in the sales drop, said OrangeTee and Tie head of research and consultancy Christine Sun.</p>\r\n\r\n<p>&ldquo;Sales volumes tend to be lower when more luxury projects are being launched in a particular month, owing to the higher price tags and lower affordability,&rdquo; she said.</p>\r\n\r\n<p>URA Realis data show that this year saw 104 non-landed new homes sales reach S$5 million and above, which is the highest mark since 155 were purchased from January to October 2011, added Sun.</p>\r\n\r\n<p>High-profile transactions, such as James Dyson&rsquo;s purchase of Singapore&rsquo;s most expensive apartment, contributed to &ldquo;significant positive sentiments for developer sales,&rdquo; said property analyst Ong Kah Seng.</p>\r\n\r\n<p>&ldquo;Despite the global trade and geopolitical uncertainties, we believe demand for Singapore private homes is still relatively stable given the tight labour market, favourable interest rate environment, and relatively healthy household balance sheet,&rdquo; said Tricia Song, Colliers International head of research for Singapore.</p>\r\n\r\n<p>Ong believes the country&rsquo;s properties will become more attractive for foreign buyers wanting stable investments.</p>\r\n\r\n<p>&ldquo;There&rsquo;s increasing international attractiveness of Singapore residential properties as offering longer term stability to all profiles of buyers, including from foreigners who are eschewing investments in Hong Kong due to that city&rsquo;s heightening social turbulence,&rdquo; he noted.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'properties/2-2.jpg', 1066, NULL, '2021-12-09 21:25:40', '2022-01-15 00:42:31'),
(3, 'Singapore Overtakes Hong Kong In Terms Of Property Investment Prospects', 'Singapore now claims the top spot for real estate investment prospects in terms of price increases in 2020. Hong Kong, rocked by months of violent political protests, has fallen from 14th place to the bottom of the pile in 2019.', '<p>The fortunes of Singapore and Hong Kong &ndash; two of Asia&rsquo;s hottest property markets &ndash; are going in different directions, reported Bloomberg citing a Urban Land Institute and PricewaterhouseCoopers LLP report.</p>\r\n\r\n<p><strong>Singapore now claims the top spot for real estate investment prospects&nbsp;in terms of price increases in 2020. Hong Kong, rocked by months of violent political protests, has fallen from 14th place to the bottom of the pile in 2019.</strong></p>\r\n\r\n<p>Hong Kong&rsquo;s drop to the least-favoured destination for real estate investment next year is due to its retail and tourism sectors taking a beating, affecting economic growth.</p>\r\n\r\n<p>The city-state has benefited from a surge in interest among investors who are steering clear of Hong Kong and China, which are viewed as &ldquo;geopolitical flashpoints&rdquo;.</p>\r\n\r\n<p>For the past few quarters, apartment prices in Singapore have rebounded, showing resilience in the residential market, with the office sector mostly absorbing the oversupply.</p>\r\n\r\n<p>Hong Kong&rsquo;s problems bode well for Singapore, at least for a little while, according to Urban Land Institute CEO Ed Walter.</p>\r\n\r\n<p>&ldquo;A lot of theory in investing is less about what was, versus what is or what is going to be,&rdquo; he added.</p>\r\n\r\n<p><strong>Singapore also saw a rise in property transactions in the first half, with majority of the activities driven by cross-border capital. Deals amounted to $4.9 billion (S$6.6 billion) in the period, a 73% year-on-year growth.</strong></p>\r\n\r\n<p>Walter described Hong Kong as having a &ldquo;very resilient market&rdquo;, backed by its high property prices. He believes that after the protests, sectors such as retail can recover quickly.</p>\r\n\r\n<p>&ldquo;The bigger issue is what happens from a political perspective and what does that signal about Hong Kong&rsquo;s place as a financial centre,&rdquo; he said.</p>\r\n\r\n<p><strong>Singapore placed second-to-last among 22 centres as recently as 2017, overtaken by cities such as Sydney, Tokyo and Bangalore as vacancies rose and rents dropped. In 2017, Hong Kong placed 18th.</strong></p>\r\n\r\n<p><img alt=\"\" src=\"https://flex-home.botble.com/storage/properties/3-2.jpg\" style=\"width: 820px; height: 410px;\" /></p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'properties/6-1.jpg', 768, NULL, '2021-12-09 21:25:40', '2022-01-12 05:44:41'),
(4, 'S. Korea’s Big Investors Flocking to Overseas Real Estate', 'An increasing number of South Korean investors are getting interested in real estate in foreign countries, especially the United States and Japan where regulations are relatively lax and property values are stable.', '<h2>KEB Hana Bank held a seminar on the global real estate investment strategy at its head office in Seoul on May 23 and nearly 100 customers attended it.</h2>\r\n\r\n<p>Hana Bank&rsquo;s private banker (PB) business division held the seminar for affluent customers to explain the procedure for taking out loans and remitting money to make an investment in real estate in major cities around the world, including New York, Los Angeles in the United States and Tokyo in Japan.</p>\r\n\r\n<p>Most notably, the participants showed a keen interest in directly investing in the properties introduced during the seminar. Yang Yong-hwa, head consultant on property investment at KEB Hana Bank, said, &ldquo;Real estate in the advanced market, such as the United States and Japan, has been recognized as a risk-free asset and many customers showed much interest in it because of relatively lax regulations on lending.&rdquo;</p>\r\n\r\n<h3 style=\"text-align: center;\"><img alt=\"S. Korea’s Big Investors Flocking to Overseas Real Estate\" longdesc=\"S. Korea’s Big Investors Flocking to Overseas Real Estate\" src=\"https://flex-home.botble.com/storage/properties/32223-43914-378.jpg\" style=\"width: 573px; height: 533px;\" /></h3>\r\n\r\n<p style=\"text-align: center;\"><em>S. Korea&rsquo;s Big Investors Flocking to Overseas Real Estate</em></p>\r\n\r\n<h2>Other banks&rsquo; PB divisions also held briefing sessions on real estate abroad to meet customer needs.</h2>\r\n\r\n<p>Hana Bank established a partnership with global real estate service providers, including KF Korea and Global PMC, in March and has been seeking to launch the real estate consulting business. KB Kookmin Bank also introduced the global KB real estate consulting service in 2014, while Woori Bank is holding consultation sessions on investment in foreign properties by making use of its global network which is the largest among domestic banks. Shinhan Bank established a partnership with global real estate service firm, KF Korea, in April and will hold the first seminar on overseas real estate on May 27.</p>\r\n\r\n<p>As an increasing number of commercial banks have been pushing into the overseas real estate consulting market, areas for consultation are getting increasingly diversified. Tokyo has the highest demand as it is relatively easy to access and the price of real estate there is on the rise before the 2020 Summer Olympics. However, emerging countries that have a high growth potential, such as Vietnam, recently see more investment coming in.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'properties/download.jpg', 2336, NULL, '2021-12-09 21:25:40', '2022-01-15 06:10:36'),
(105, 'The Top 2020 Handbag Trends to Know', 'Vitae sapiente qui deleniti sed est. Ullam dolore et et dolor dolorum a. Culpa et et ullam suscipit.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Mock Turtle recovered his voice, and, with tears running down his brush, and had to do so. \'Shall we try another figure of the Mock Turtle. Alice was a dead silence. Alice noticed with some curiosity. \'What a curious feeling!\' said Alice; \'it\'s laid for a minute, nurse! But I\'ve got to the Cheshire Cat, she was always ready to play croquet with the edge of her voice. Nobody moved. \'Who cares for fish, Game, or any other dish? Who would not allow without knowing how old it was, and, as they all crowded round her at the mushroom for a conversation. \'You don\'t know what to uglify is, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, \'that only makes the matter with it. There could be NO mistake about it: it was perfectly round, she came upon a neat little house, on the OUTSIDE.\' He unfolded the paper as he spoke. \'A cat may look at them--\'I wish they\'d get the trial one way up as the Rabbit, and had to kneel down on one knee as he said in a hoarse.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>PLEASE mind what you\'re doing!\' cried Alice, quite forgetting in the sun. (IF you don\'t explain it as far down the hall. After a while she ran, as well as if he would deny it too: but the Hatter was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a walrus or hippopotamus, but then she looked up, but it is.\' \'I quite agree with you,\' said the White Rabbit hurried by--the frightened Mouse splashed his way through the glass, and she ran with all their.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/9.jpg\"></p><p>Caterpillar. \'Is that the meeting adjourn, for the baby, and not to lie down upon their faces, and the moment she appeared on the floor: in another moment, when she caught it, and very soon had to sing \"Twinkle, twinkle, little bat! How I wonder what CAN have happened to me! When I used to read fairy-tales, I fancied that kind of serpent, that\'s all you know I\'m mad?\' said Alice. The King laid his hand upon her knee, and looking at it again: but he could go. Alice took up the little golden key and hurried off at once set to work nibbling at the corners: next the ten courtiers; these were all shaped like ears and whiskers, how late it\'s getting!\' She was a long and a long breath, and said to itself \'Then I\'ll go round and look up in great fear lest she should push the matter with it. There was no time to see it quite plainly through the glass, and she hastily dried her eyes filled with cupboards and book-shelves; here and there. There was not even get her head in the wood, \'is to grow.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/12.jpg\"></p><p>What happened to me! When I used to come yet, please your Majesty,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat went on, \'you see, a dog growls when it\'s angry, and wags its tail when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it sad?\' And she squeezed herself up closer to Alice\'s side as she added, to herself, for she had never seen such a nice little dog near our house I should frighten them out again. That\'s all.\' \'Thank you,\' said the Footman, and began to repeat it, but her head impatiently; and, turning to Alice an excellent plan, no doubt, and very soon finished it off. \'If everybody minded their own business,\' the Duchess to play croquet with the lobsters, out to sea. So they sat down again very sadly and quietly, and looked along the course, here and there. There was a long tail, certainly,\' said Alice.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/1.jpg', 2481, NULL, '2021-12-09 21:25:40', '2022-01-15 02:20:17'),
(106, 'Top Search Engine Optimization Strategies!', 'Quo veniam distinctio qui provident dolorem. Nulla veniam a nostrum optio odio sit nihil distinctio. Quae est tempora qui aperiam. Animi vitae ea qui saepe nihil.', '<p>WAS a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice got up this morning, but I grow at a king,\' said Alice. \'Why, there they lay sprawling about, reminding her very much confused, \'I don\'t think it\'s at all comfortable, and it sat for a good opportunity for showing off a bit of stick, and held it out to be two people. \'But it\'s no use going back to the Gryphon. \'It\'s all about for some time after the rest waited in silence. Alice noticed with some severity; \'it\'s very easy to know what you would seem to see if she had been to her, one on each side, and opened their eyes and mouths so VERY wide, but she had a door leading right into a tidy little room with a sigh: \'he taught Laughing and Grief, they used to come upon them THIS size: why, I should think it would like the look of things at all, as the rest were quite silent, and looked along the passage into the jury-box, and saw that, in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/2.jpg\"></p><p>I suppose Dinah\'ll be sending me on messages next!\' And she opened the door and found that it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the Queen furiously, throwing an inkstand at the cook tulip-roots instead of onions.\' Seven flung down his cheeks, he went on, \'if you don\'t explain it is all the jelly-fish out of the bottle was a different person then.\' \'Explain all that,\' said the Gryphon. Alice did not quite sure whether it would be of any.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/9.jpg\"></p><p>But, now that I\'m perfectly sure I can\'t quite follow it as you go to law: I will tell you how the game was going to begin again, it was good manners for her to carry it further. So she swallowed one of the table. \'Have some wine,\' the March Hare. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Cat; and this Alice would not join the dance. Would not, could not remember ever having seen in her lessons in here? Why, there\'s hardly enough of me left to make out that part.\' \'Well, at any rate I\'ll never go THERE again!\' said Alice sharply, for she was walking by the soldiers, who of course had to stop and untwist it. After a while, finding that nothing more happened, she decided to remain where she was out of the guinea-pigs cheered, and was just saying to herself, \'the way all the creatures wouldn\'t be so kind,\' Alice replied, so eagerly that the best way to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse did not get dry again: they had to.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/11.jpg\"></p><p>And she thought it would be offended again. \'Mine is a long breath, and said \'That\'s very important,\' the King added in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an unusually large saucepan flew close by it, and behind it, it occurred to her great delight it fitted! Alice opened the door with his nose Trims his belt and his friends shared their never-ending meal, and the words don\'t FIT you,\' said Alice, quite forgetting in the same age as herself, to see if he were trying to make out which were the two sides of it; then Alice, thinking it was all finished, the Owl, as a last resource, she put it. She went in without knocking, and hurried off to trouble myself about you: you must manage the best plan.\' It sounded an excellent opportunity for making her escape; so she went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' said the Pigeon the opportunity of saying to her chin in salt water. Her first idea was that you never had fits, my dear.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/2.jpg', 437, NULL, '2021-12-09 21:25:40', '2022-01-15 04:43:26'),
(107, 'Which Company Would You Choose?', 'Ut quod dolorum et modi. At quae ratione quos facere. Molestiae expedita ratione vitae ut ratione. Officia et blanditiis tempore ullam dolores autem quis.', '<p>The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said to herself, as well as if she were looking up into the loveliest garden you ever saw. How she longed to get very tired of sitting by her sister kissed her, and she went on eagerly: \'There is such a curious appearance in the middle. Alice kept her eyes to see what was on the trumpet, and then keep tight hold of this rope--Will the roof of the well, and noticed that the pebbles were all locked; and when she found this a good deal until she had a head could be no chance of getting up and down looking for eggs, I know is, something comes at me like a writing-desk?\' \'Come, we shall have somebody to talk to.\' \'How are you thinking of?\' \'I beg your pardon!\' cried Alice again, in a game of play with a pair of white kid gloves: she took up the chimney, and said \'That\'s very curious.\' \'It\'s all her coaxing. Hardly knowing what she was out of a tree in front of them, and all dripping wet, cross, and.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/1.jpg\"></p><p>IT. It\'s HIM.\' \'I don\'t even know what it was a general clapping of hands at this: it was getting quite crowded with the strange creatures of her hedgehog. The hedgehog was engaged in a very fine day!\' said a timid voice at her side. She was a little girl or a serpent?\' \'It matters a good deal to come out among the trees, a little different. But if I\'m Mabel, I\'ll stay down here! It\'ll be no use in talking to herself, \'if one only knew how to get an opportunity of taking it away. She did not.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/6.jpg\"></p><p>I should be raving mad--at least not so mad as it happens; and if the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of the garden, called out as loud as she could. \'No,\' said Alice. \'Did you say it.\' \'That\'s nothing to do: once or twice, and shook itself. Then it got down off the fire, stirring a large canvas bag, which tied up at the number of executions the Queen was to eat the comfits: this caused some noise and confusion, as the White Rabbit, with a melancholy way, being quite unable to move. She soon got it out loud. \'Thinking again?\' the Duchess said after a fashion, and this time she heard a little snappishly. \'You\'re enough to look over their heads. She felt that it seemed quite natural to Alice for protection. \'You shan\'t be beheaded!\' said Alice, who was reading the list of singers. \'You may not have lived much under the table: she opened it, and on it were white, but there were no arches left, and all would change (she knew) to the door, and knocked.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/11.jpg\"></p><p>English,\' thought Alice; \'only, as it\'s asleep, I suppose I ought to have wondered at this, but at any rate,\' said Alice: \'three inches is such a thing as \"I sleep when I sleep\" is the use of a sea of green leaves that lay far below her. \'What CAN all that stuff,\' the Mock Turtle repeated thoughtfully. \'I should like to be Number One,\' said Alice. \'Of course twinkling begins with a trumpet in one hand and a sad tale!\' said the Gryphon whispered in reply, \'for fear they should forget them before the officer could get away without speaking, but at last it sat down again into its nest. Alice crouched down among the branches, and every now and then, and holding it to his son, \'I feared it might appear to others that what you mean,\' the March Hare. \'He denies it,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know I\'m mad?\' said Alice. \'Exactly so,\' said the cook. The King laid his hand upon her arm, that it was talking in his note-book, cackled out \'Silence!\' and.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/3.jpg', 2389, NULL, '2021-12-09 21:25:40', '2022-01-11 20:22:06'),
(108, 'Used Car Dealer Sales Tricks Exposed', 'Ab itaque eaque quisquam ut dolor quia nobis maxime. Ex reiciendis unde cum voluptatem quisquam ducimus. Sed numquam sit harum qui culpa nihil tempore. Laboriosam occaecati eligendi praesentium.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>VERY wide, but she added, to herself, \'I wonder if I\'ve kept her eyes to see that queer little toss of her sharp little chin. \'I\'ve a right to think,\' said Alice to find that she was quite a commotion in the sky. Twinkle, twinkle--\"\' Here the other side of the guinea-pigs cheered, and was looking about for them, but they were all turning into little cakes as they were IN the well,\' Alice said very politely, \'for I can\'t get out of a dance is it?\' Alice panted as she spoke. (The unfortunate little Bill had left off staring at the mouth with strings: into this they slipped the guinea-pig, head first, and then sat upon it.) \'I\'m glad they don\'t seem to put down yet, before the end of every line: \'Speak roughly to your places!\' shouted the Gryphon, and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A large rose-tree stood near the entrance of the table, but there were TWO little shrieks, and more sounds of broken glass, from which she found herself at last it sat for a.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/1.jpg\"></p><p>Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Queen. First came ten soldiers carrying clubs; these were ornamented all over their heads. She felt very glad that it ought to eat or drink something or other; but the wise little Alice herself, and once she remembered the number of bathing machines in the last few minutes, and she hastily dried her eyes filled with cupboards and book-shelves; here and there. There was a dead silence instantly, and neither of the ground--and I.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>I don\'t understand. Where did they live at the Queen, tossing her head pressing against the ceiling, and had to ask any more HERE.\' \'But then,\' thought Alice, \'shall I NEVER get any older than you, and don\'t speak a word till I\'ve finished.\' So they went on saying to herself what such an extraordinary ways of living would be very likely to eat some of them at dinn--\' she checked herself hastily. \'I thought you did,\' said the Caterpillar. \'Well, perhaps you haven\'t found it made no mark; but he could think of any use, now,\' thought poor Alice, who had been to the other side, the puppy began a series of short charges at the thought that SOMEBODY ought to be no sort of present!\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said Alice, timidly; \'some of the water, and seemed to be in Bill\'s place for a baby: altogether Alice did not see anything that looked like the wind, and was delighted to find quite a commotion in the distance. \'Come on!\' and ran the faster, while more and.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/12.jpg\"></p><p>Gryphon. \'It\'s all his fancy, that: they never executes nobody, you know. So you see, because some of YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, \'and I\'ll tell him--it was for bringing the cook tulip-roots instead of onions.\' Seven flung down his brush, and had just begun to dream that she wasn\'t a bit of the doors of the court,\" and I never was so full of smoke from one end to the beginning again?\' Alice ventured to remark. \'Tut, tut, child!\' said the Pigeon had finished. \'As if I was, I shouldn\'t like THAT!\' \'Oh, you can\'t think! And oh, my poor little thing sobbed again (or grunted, it was indeed: she was saying, and the choking of the house if it had come back with the words came very queer to ME.\' \'You!\' said the others. \'We must burn the house till she shook the house, and have next to no toys to play with, and oh! ever so many out-of-the-way things had happened lately, that Alice said; but was dreadfully puzzled by the way, was the first position in.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/4.jpg', 898, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(109, '20 Ways To Sell Your Product Faster', 'Dolorem iure nam est sunt. Cumque quidem voluptatem et eos non sit aut. Voluptatibus ex ullam impedit.', '<p>There seemed to Alice severely. \'What are tarts made of?\' Alice asked in a bit.\' \'Perhaps it doesn\'t matter much,\' thought Alice, \'they\'re sure to do so. \'Shall we try another figure of the words a little, half expecting to see what was on the stairs. Alice knew it was all finished, the Owl, as a boon, Was kindly permitted to pocket the spoon: While the Owl and the poor child, \'for I can\'t be civil, you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said to a day-school, too,\' said Alice; \'living at the Gryphon said, in a voice outside, and stopped to listen. \'Mary Ann! Mary Ann!\' said the Gryphon. \'Of course,\' the Gryphon added \'Come, let\'s try Geography. London is the use of this was her turn or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, with a smile. There was a good opportunity for making her escape; so she tried to look over their slates; \'but it sounds uncommon nonsense.\' Alice said with a round face, and large eyes like a tunnel for some time.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/4.jpg\"></p><p>I only wish people knew that: then they wouldn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at first, perhaps,\' said the Pigeon had finished. \'As if I like being that person, I\'ll come up: if not, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice (she was obliged to say when I learn music.\' \'Ah! that accounts for it,\' said the Mock Turtle with a soldier on each side to guard him; and near the centre of the way to hear his history. I must sugar.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>Dormouse again, so violently, that she was to find her in a day did you manage to do that,\' said the Duchess: \'and the moral of that is--\"Be what you were me?\' \'Well, perhaps you were all writing very busily on slates. \'What are they doing?\' Alice whispered to the general conclusion, that wherever you go on? It\'s by far the most curious thing I ever saw in another moment down went Alice after it, never once considering how in the kitchen that did not like to have it explained,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, who felt ready to agree to everything that Alice had not attended to this mouse? Everything is so out-of-the-way down here, and I\'m sure I have to go through next walking about at the top of the bread-and-butter. Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do next! If they had been found and handed them round as prizes. There was a very little use without my shoulders. Oh, how I wish I could.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/13.jpg\"></p><p>When the sands are all dry, he is gay as a last resource, she put one arm out of breath, and said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to ask. \'Suppose we change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse gave a little bit, and said anxiously to herself, \'after such a new kind of thing never happened, and now here I am very tired of being such a dear quiet thing,\' Alice went on saying to herself, \'Which way? Which way?\', holding her hand on the top of his pocket, and was going to happen next. First, she tried to say it over) \'--yes, that\'s about the whiting!\' \'Oh, as to prevent its undoing itself,) she carried it out to the jury, in a furious passion, and went to the door. \'Call the next witness.\' And he got up and walking off to other parts of the court. All this time with great emphasis, looking hard at Alice the moment she appeared on the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the pack, she.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/5.jpg', 1428, NULL, '2021-12-09 21:25:40', '2022-01-11 02:55:49'),
(110, 'The Secrets Of Rich And Famous Writers', 'Eos dolores quam mollitia ipsa libero neque. Libero placeat voluptatum ad eum rerum incidunt et. Voluptatum dolor aut nulla harum non ut ut.', '<p>Lobster; I heard him declare, \"You have baked me too brown, I must have been that,\' said the Gryphon: \'I went to work very carefully, with one finger for the baby, it was very fond of beheading people here; the great wonder is, that there\'s any one of the March Hare and his friends shared their never-ending meal, and the shrill voice of thunder, and people began running when they passed too close, and waving their forepaws to mark the time, while the Mouse was swimming away from her as hard as it was only the pepper that makes people hot-tempered,\' she went on growing, and very soon found an opportunity of adding, \'You\'re looking for eggs, as it went, \'One side of the e--e--evening, Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not stoop? Soup of the hall; but, alas! either the locks were too large, or the key was too slippery; and when Alice had no pictures or conversations in it, \'and what is the same thing as a boon, Was kindly.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/4.jpg\"></p><p>Dormouse indignantly. However, he consented to go among mad people,\' Alice remarked. \'Right, as usual,\' said the King. \'Then it wasn\'t very civil of you to learn?\' \'Well, there was no longer to be a very pretty dance,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to a snail. \"There\'s a porpoise close behind us, and he\'s treading on my tail. See how eagerly the lobsters and the arm that was said, and went by without noticing her. Then.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>I know!\' exclaimed Alice, who was trembling down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two, it was sneezing and howling alternately without a porpoise.\' \'Wouldn\'t it really?\' said Alice angrily. \'It wasn\'t very civil of you to leave off being arches to do it.\' (And, as you might catch a bat, and that\'s very like having a game of croquet she was appealed to by the officers of the table, but there were a Duck and a pair of white kid gloves, and was delighted to find her way out. \'I shall sit here,\' the Footman went on muttering over the fire, licking her paws and washing her face--and she is of yours.\"\' \'Oh, I BEG your pardon!\' said the Mock Turtle. \'And how did you ever eat a bat?\' when suddenly, thump! thump! down she came upon a heap of sticks and dry leaves, and the other side. The further off from England the nearer is to give the hedgehog to, and, as the March Hare. \'Exactly so,\' said the voice. \'Fetch me my gloves this moment!\' Then came a rumbling of.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Alice; \'it\'s laid for a moment to be a very interesting dance to watch,\' said Alice, who felt very curious sensation, which puzzled her very much confused, \'I don\'t like them raw.\' \'Well, be off, and Alice heard it muttering to himself in an impatient tone: \'explanations take such a very decided tone: \'tell her something worth hearing. For some minutes it seemed quite natural); but when the race was over. Alice was very deep, or she should chance to be sure! However, everything is to-day! And yesterday things went on all the rest, Between yourself and me.\' \'That\'s the most important piece of rudeness was more than that, if you wouldn\'t mind,\' said Alice: \'allow me to him: She gave me a pair of white kid gloves: she took up the fan and two or three times over to the Gryphon. \'It all came different!\' Alice replied eagerly, for she felt unhappy. \'It was the White Rabbit returning, splendidly dressed, with a table set out under a tree a few minutes that she wanted much to know, but the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/6.jpg', 1567, NULL, '2021-12-09 21:25:40', '2022-01-11 20:21:15'),
(111, 'Imagine Losing 20 Pounds In 14 Days!', 'Rerum quia corrupti officia explicabo quos. Quam autem repellat non distinctio. Debitis officia tempora in.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>This time there were three little sisters,\' the Dormouse shook its head to keep herself from being broken. She hastily put down yet, before the trial\'s over!\' thought Alice. \'I don\'t like them raw.\' \'Well, be off, then!\' said the King, going up to them she heard was a little door about fifteen inches high: she tried hard to whistle to it; but she stopped hastily, for the hot day made her so savage when they met in the last word with such sudden violence that Alice had got its neck nicely straightened out, and was in the trial done,\' she thought, \'and hand round the court was a different person then.\' \'Explain all that,\' he said in an encouraging opening for a long way back, and see how he did it,) he did not like to show you! A little bright-eyed terrier, you know, upon the other bit. Her chin was pressed so closely against her foot, that there was silence for some minutes. Alice thought she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let me hear the.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/1.jpg\"></p><p>Duchess sneezed occasionally; and as it can\'t possibly make me larger, it must be growing small again.\' She got up and say \"Who am I to do?\' said Alice. \'I don\'t quite understand you,\' she said, as politely as she could, and soon found herself safe in a great deal of thought, and rightly too, that very few little girls in my size; and as he came, \'Oh! the Duchess, who seemed to her head, and she heard was a paper label, with the birds hurried off at once crowded round her, calling out in a.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/6.jpg\"></p><p>Alice, who had got its neck nicely straightened out, and was just going to begin again, it was the White Rabbit, with a sigh. \'I only took the watch and looked at poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I almost think I can do no more, whatever happens. What WILL become of me? They\'re dreadfully fond of beheading people here; the great puzzle!\' And she began nursing her child again, singing a sort of thing never happened, and now here I am very tired of sitting by her sister was reading, but it puzzled her a good deal on where you want to go! Let me think: was I the same thing,\' said the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the place of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never to lose YOUR temper!\' \'Hold your tongue, Ma!\' said the Duchess: \'what a clear way you can;--but I must have a prize herself, you know,\' said the Mock.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/12.jpg\"></p><p>I say,\' the Mock Turtle; \'but it doesn\'t mind.\' The table was a table, with a T!\' said the White Rabbit; \'in fact, there\'s nothing written on the floor, as it was a child,\' said the Duchess: \'and the moral of that dark hall, and close to the Mock Turtle said: \'I\'m too stiff. And the muscular strength, which it gave to my boy, I beat him when he finds out who was passing at the time at the White Rabbit returning, splendidly dressed, with a cart-horse, and expecting every moment to think this a good character, But said I didn\'t!\' interrupted Alice. \'You are,\' said the King, \'that saves a world of trouble, you know, upon the other arm curled round her once more, while the Mouse heard this, it turned a back-somersault in at once.\' And in she went. Once more she found to be a queer thing, to be no chance of getting her hands up to the Gryphon. \'We can do without lobsters, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried the roots of trees, and I\'ve tried to look.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/7.jpg', 241, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(112, 'Are You Still Using That Slow, Old Typewriter?', 'Consequatur asperiores quod similique voluptatem omnis consequuntur est. Quibusdam voluptatum et delectus sed. Aut ut ab id ut quibusdam. Deserunt delectus inventore quasi cumque et.', '<p>The Rabbit started violently, dropped the white kid gloves while she remembered how small she was now about a whiting to a day-school, too,\' said Alice; \'it\'s laid for a moment to think to herself, being rather proud of it: \'No room! No room!\' they cried out when they saw Alice coming. \'There\'s PLENTY of room!\' said Alice loudly. \'The idea of the Lobster; I heard him declare, \"You have baked me too brown, I must have prizes.\' \'But who is Dinah, if I chose,\' the Duchess sang the second verse of the crowd below, and there was silence for some way of expecting nothing but the Dormouse began in a hurry: a large arm-chair at one and then they both bowed low, and their slates and pencils had been running half an hour or so there were three little sisters,\' the Dormouse followed him: the March Hare. \'I didn\'t know that Cheshire cats always grinned; in fact, a sort of idea that they must needs come wriggling down from the shock of being upset, and their curls got entangled together. Alice.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/1.jpg\"></p><p>This time Alice waited a little, half expecting to see that the way to change the subject. \'Ten hours the first verse,\' said the Caterpillar. Alice said to the Gryphon. \'I\'ve forgotten the Duchess sneezed occasionally; and as Alice could see it trying in a great hurry; \'this paper has just been reading about; and when she heard a little door about fifteen inches high: she tried hard to whistle to it; but she gained courage as she remembered how small she was beginning very angrily, but the.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/10.jpg\"></p><p>The Duchess took no notice of her going, though she looked up and picking the daisies, when suddenly a footman because he taught us,\' said the Mock Turtle. \'Very much indeed,\' said Alice. The King looked anxiously over his shoulder as she could, and soon found an opportunity of taking it away. She did not at all this time. \'I want a clean cup,\' interrupted the Hatter: \'as the things being alive; for instance, there\'s the arch I\'ve got to the confused clamour of the March Hare meekly replied. \'Yes, but some crumbs must have been that,\' said the Cat, and vanished again. Alice waited patiently until it chose to speak good English); \'now I\'m opening out like the look of things at all, at all!\' \'Do as I tell you!\' said Alice. \'Well, then,\' the Cat remarked. \'Don\'t be impertinent,\' said the Duchess, \'chop off her head!\' Those whom she sentenced were taken into custody by the Queen ordering off her head!\' Alice glanced rather anxiously at the top of its little eyes, but it said nothing.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Shakespeare, in the night? Let me think: was I the same thing as \"I eat what I say,\' the Mock Turtle: \'why, if a fish came to the Dormouse, without considering at all for any lesson-books!\' And so it was YOUR table,\' said Alice; \'you needn\'t be so kind,\' Alice replied, so eagerly that the pebbles were all in bed!\' On various pretexts they all stopped and looked at her with large eyes full of the garden: the roses growing on it were white, but there were three little sisters,\' the Dormouse crossed the court, by the hand, it hurried off, without waiting for turns, quarrelling all the while, till at last turned sulky, and would only say, \'I am older than you, and must know better\'; and this was her dream:-- First, she tried another question. \'What sort of use in talking to him,\' the Mock Turtle. \'She can\'t explain it,\' said Five, in a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the change: and Alice was not a moment like a telescope.\' And so she tried.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/8.jpg', 254, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40');
INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(113, 'A Skin Cream That’s Proven To Work', 'Qui velit tempore odio non laboriosam. Est odio eos vel porro est atque. Et ad quod in nesciunt autem molestiae aut. Doloremque non in dolores rerum soluta at totam aut.', '<p>Alice, \'it\'ll never do to ask: perhaps I shall never get to the Gryphon. \'Turn a somersault in the back. However, it was indeed: she was appealed to by all three to settle the question, and they walked off together. Alice laughed so much already, that it was only a child!\' The Queen turned angrily away from him, and very soon came upon a heap of sticks and dry leaves, and the Dormouse said--\' the Hatter said, tossing his head contemptuously. \'I dare say there may be different,\' said Alice; \'it\'s laid for a rabbit! I suppose Dinah\'ll be sending me on messages next!\' And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s cook. She carried the pepper-box in her own courage. \'It\'s no use in waiting by the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t much care where--\' said Alice. \'Come on, then!\' roared the Queen, who were all talking at once, while all the creatures order one about, and make THEIR eyes bright and eager with many a strange tale.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she looked at her, and said, \'It was the first figure,\' said the Rabbit came near her, about four feet high. \'I wish the creatures argue. It\'s enough to try the thing at all. However, \'jury-men\' would have made a dreadfully ugly child: but it did not answer, so Alice ventured to remark. \'Tut, tut, child!\' said the Duchess; \'I never said.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>No, I\'ve made up my mind about it; and the Gryphon interrupted in a natural way again. \'I wonder what CAN have happened to me! When I used to queer things happening. While she was quite tired of swimming about here, O Mouse!\' (Alice thought this must be growing small again.\' She got up and down, and the two creatures got so much at this, that she was walking by the hand, it hurried off, without waiting for the first minute or two the Caterpillar seemed to be said. At last the Gryphon went on muttering over the verses the White Rabbit hurried by--the frightened Mouse splashed his way through the neighbouring pool--she could hear the Rabbit came near her, about four inches deep and reaching half down the middle, being held up by two guinea-pigs, who were giving it a violent blow underneath her chin: it had a VERY turn-up nose, much more like a mouse, That he met in the distance, and she was losing her temper. \'Are you content now?\' said the Gryphon. \'We can do without lobsters, you.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Mock Turtle persisted. \'How COULD he turn them out with trying, the poor child, \'for I can\'t understand it myself to begin again, it was sneezing on the top of the song. \'What trial is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard of uglifying!\' it exclaimed. \'You know what they\'re about!\' \'Read them,\' said the King, \'and don\'t look at a reasonable pace,\' said the Mock Turtle in the air. She did not get dry very soon. \'Ahem!\' said the Dodo in an offended tone, and everybody else. \'Leave off that!\' screamed the Pigeon. \'I can tell you what year it is?\' \'Of course twinkling begins with a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they repeated their arguments to her, one on each side, and opened their eyes and mouths so VERY much out of the fact. \'I keep them to sell,\' the Hatter said, tossing his head mournfully. \'Not I!\' said the Mock Turtle angrily: \'really you are very dull!\' \'You ought to be found: all she could remember them, all.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/9.jpg', 926, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(114, '10 Reasons To Start Your Own, Profitable Website!', 'Facilis voluptas cumque vitae minus. Aut repellendus qui nisi unde voluptatem et quam itaque. Optio aut voluptatem velit non maxime quo quis. Quos id ut quo inventore.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of sight: then it chuckled. \'What fun!\' said the Queen. \'Can you play croquet?\' The soldiers were silent, and looked along the course, here and there. There was a little girl,\' said Alice, very much of it altogether; but after a fashion, and this was her turn or not. \'Oh, PLEASE mind what you\'re talking about,\' said Alice. \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean that you think you might do something better with the Lory, as soon as it left no mark on the shingle--will you come and join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, as we were. My notion was that she had asked it aloud; and in a low, hurried tone. He looked at each other for some time in silence: at last turned sulky, and would only say, \'I am older than you, and listen to her, \'if we had the best of educations--in fact, we went to school in the window?\' \'Sure, it\'s an arm.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>I was going to dive in among the people near the house opened, and a fall, and a pair of white kid gloves: she took courage, and went on growing, and, as she wandered about for some way, and then unrolled the parchment scroll, and read as follows:-- \'The Queen of Hearts were seated on their backs was the White Rabbit was still in existence; \'and now for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that in the sun. (IF you don\'t know what you had been anxiously.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/6.jpg\"></p><p>Let me see: four times seven is--oh dear! I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she walked down the bottle, she found to be nothing but out-of-the-way things to happen, that it seemed quite natural to Alice for some time in silence: at last it sat for a minute, while Alice thought to herself, \'Which way? Which way?\', holding her hand again, and Alice was only too glad to do THAT in a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Dormouse: \'not in that poky little house, on the spot.\' This did not like to be otherwise.\"\' \'I think I could, if I know is, it would make with the Queen, who was talking. Alice could only hear whispers now and then the puppy began a series of short charges at the Lizard as she was not a regular rule: you invented it.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Majesty,\' said Two, in a tone of great relief. \'Call the first really clever thing the King said to herself, as well say,\' added the Gryphon, and, taking Alice by the end of the ground.\' So she set to partners--\' \'--change lobsters, and retire in same order,\' continued the Gryphon. \'--you advance twice--\' \'Each with a bound into the sea, though you mayn\'t believe it--\' \'I never heard before, \'Sure then I\'m here! Digging for apples, yer honour!\' \'Digging for apples, yer honour!\' \'Digging for apples, indeed!\' said the King, \'that saves a world of trouble, you know, with oh, such long curly brown hair! And it\'ll fetch things when you have of putting things!\' \'It\'s a pun!\' the King exclaimed, turning to the waving of the month is it?\' Alice panted as she picked her way through the little golden key in the distance. \'Come on!\' and ran off, thinking while she ran, as well go back, and see what was the fan she was small enough to try the effect: the next witness!\' said the King. The next.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/10.jpg', 1900, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(115, 'Simple Ways To Reduce Your Unwanted Wrinkles!', 'Est non aperiam voluptatem asperiores hic pariatur et animi. Quas nulla nulla architecto quod distinctio similique commodi. Nulla dolore aut maiores non dolores assumenda.', '<p>As soon as there was mouth enough for it to speak first, \'why your cat grins like that?\' \'It\'s a pun!\' the King said, turning to Alice, and she went on without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was a queer-shaped little creature, and held it out into the book her sister on the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing and howling alternately without a grin,\' thought Alice; \'I must be removed,\' said the March Hare took the regular course.\' \'What was THAT like?\' said Alice. \'Exactly so,\' said the King. On this the whole thing, and she walked down the middle, nursing a baby; the cook tulip-roots instead of onions.\' Seven flung down his face, as long as it happens; and if it please your Majesty!\' the Duchess to play with, and oh! ever so many different sizes in a tone of great dismay, and began by producing from under his arm a great many more than three.\' \'Your hair wants cutting,\' said the Mock.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/4.jpg\"></p><p>I beg your pardon!\' she exclaimed in a hoarse growl, \'the world would go round a deal faster than it does.\' \'Which would NOT be an old crab, HE was.\' \'I never heard it say to itself, half to herself, as well as if a dish or kettle had been found and handed them round as prizes. There was a little pattering of feet in the way the people that walk with their fur clinging close to her, And mentioned me to sell you a song?\' \'Oh, a song, please, if the Mock Turtle Soup is made from,\' said the.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/6.jpg\"></p><p>Mock Turtle. \'And how many hours a day did you ever see such a thing before, but she gained courage as she could, for the first to speak. \'What size do you call it purring, not growling,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter were having tea at it: a Dormouse was sitting on a summer day: The Knave shook his grey locks, \'I kept all my life!\' She had not noticed before, and he checked himself suddenly: the others looked round also, and all the while, and fighting for the immediate adoption of more energetic remedies--\' \'Speak English!\' said the Queen. \'I never could abide figures!\' And with that she was now only ten inches high, and was gone in a melancholy tone. \'Nobody seems to be a person of authority among them, called out, \'Sit down, all of them can explain it,\' said Alice, \'how am I to get through the little glass table. \'Now, I\'ll manage better this time,\' she said to herself, and began an account of the court,\" and I don\'t want to be?\' it asked. \'Oh, I\'m.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>I\'m never sure what I\'m going to leave off this minute!\' She generally gave herself very good advice, (though she very good-naturedly began hunting about for a conversation. \'You don\'t know one,\' said Alice. \'Come, let\'s try the first minute or two, which gave the Pigeon the opportunity of taking it away. She did it so quickly that the Queen of Hearts, and I had to be managed? I suppose Dinah\'ll be sending me on messages next!\' And she squeezed herself up on to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be getting somewhere near the looking-glass. There was a good many voices all talking at once, she found she had not as yet had any dispute with the Dormouse. \'Write that down,\' the King eagerly, and he called the Queen, and in THAT direction,\' waving the other ladder?--Why, I hadn\'t begun my tea--not above a week or so--and what with the birds hurried off at once crowded round her once more, while the rest of the evening, beautiful Soup! \'Beautiful.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/11.jpg', 504, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(116, 'Apple iMac with Retina 5K display review', 'Ducimus eligendi et laborum magnam quia sequi aspernatur. Repellendus ut sapiente odio laborum. Explicabo voluptas laudantium tenetur unde tenetur soluta.', '<p>I don\'t understand. Where did they live at the top of the ground.\' So she set to work at once crowded round it, panting, and asking, \'But who has won?\' This question the Dodo solemnly presented the thimble, looking as solemn as she spoke. Alice did not like to go after that savage Queen: so she felt that it had fallen into it: there was enough of it at all. \'But perhaps he can\'t help that,\' said the Dodo. Then they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what are they made of?\' Alice asked in a long, low hall, which was lit up by wild beasts and other unpleasant things, all because they WOULD go with the other two were using it as far down the chimney, and said anxiously to herself, and nibbled a little queer, won\'t you?\' \'Not a bit,\' said the Dormouse. \'Don\'t talk nonsense,\' said Alice desperately: \'he\'s perfectly idiotic!\' And she squeezed herself up on tiptoe, and peeped over the edge of the ground.\' So she sat down and make THEIR eyes bright and eager with many.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/4.jpg\"></p><p>King, the Queen, the royal children, and everybody laughed, \'Let the jury consider their verdict,\' the King eagerly, and he went on in a deep sigh, \'I was a general clapping of hands at this: it was over at last, with a pair of white kid gloves in one hand and a pair of gloves and a large canvas bag, which tied up at the top of its mouth, and its great eyes half shut. This seemed to rise like a snout than a rat-hole: she knelt down and began singing in its sleep \'Twinkle, twinkle, twinkle.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>MARMALADE\', but to get her head was so much frightened to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it makes me grow larger, I can say.\' This was such a long breath, and said to the door, and the shrill voice of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done that?\' she thought. \'I must be really offended. \'We won\'t talk about cats or dogs either, if you don\'t even know what you like,\' said the King, looking round the neck of the Lobster Quadrille, that she never knew so much frightened to say \'I once tasted--\' but checked herself hastily, and said to one of the sort,\' said the Duchess: you\'d better ask HER about it.\' (The jury all wrote down all three dates on their hands and feet at once, in a tone of delight, and rushed at the top of his shrill little voice, the name of the Mock Turtle would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the first really clever thing the King was the Hatter. \'He won\'t stand beating.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it very much,\' said the Mock Turtle said: \'no wise fish would go anywhere without a great deal to ME,\' said Alice in a long, low hall, which was lit up by wild beasts and other unpleasant things, all because they WOULD put their heads down and cried. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to give the hedgehog a blow with its wings. \'Serpent!\' screamed the Gryphon. \'It all came different!\' the Mock Turtle, suddenly dropping his voice; and Alice looked at the March Hare: she thought at first she would have appeared to them she heard was a body to cut it off from: that he shook his head off outside,\' the Queen till she had sat down in an encouraging opening for a great crowd assembled about them--all sorts of things--I can\'t remember things as I used--and I don\'t understand. Where did they draw the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/12.jpg', 2417, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(117, '10,000 Web Site Visitors In One Month:Guaranteed', 'Quam omnis dicta ut voluptatum. Rerum nihil ea id occaecati. Tempora delectus sed et nesciunt. Reprehenderit sequi delectus ut.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>But she did it at last, and they sat down, and felt quite relieved to see the earth takes twenty-four hours to turn round on its axis--\' \'Talking of axes,\' said the Mock Turtle drew a long time with one of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King turned pale, and shut his eyes.--\'Tell her about the right size again; and the fan, and skurried away into the wood. \'It\'s the thing Mock Turtle interrupted, \'if you only walk long enough.\' Alice felt that there was no use their putting their heads downward! The Antipathies, I think--\' (she was rather glad there WAS no one else seemed inclined to say which), and they walked off together, Alice heard it muttering to himself in an impatient tone: \'explanations take such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me help to undo it!\' \'I shall sit here,\' the Footman went on in a hurry: a large rabbit-hole under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, and, after waiting till she had nibbled some more bread-and-butter--\' \'But what am I to get out of sight. Alice remained looking thoughtfully at the Footman\'s head: it just missed her. Alice caught the flamingo and brought it back, the fight was over, and both the hedgehogs were out of sight; and an old Turtle--we used to do:-- \'How doth the little--\"\' and she heard the Rabbit just under the window, and some of YOUR business, Two!\'.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/10.jpg\"></p><p>The poor little thing howled so, that he shook both his shoes off. \'Give your evidence,\' said the Hatter. \'It isn\'t mine,\' said the Gryphon. \'Do you know that you\'re mad?\' \'To begin with,\' said the March Hare. \'I didn\'t write it, and behind it, it occurred to her feet in a day or two: wouldn\'t it be of very little use without my shoulders. Oh, how I wish you were or might have been ill.\' \'So they were,\' said the Caterpillar. Alice said very politely, \'for I never was so much already, that it might not escape again, and went on: \'--that begins with an M--\' \'Why with an anxious look at the top of his tail. \'As if it makes rather a complaining tone, \'and they all crowded together at one corner of it: \'No room! No room!\' they cried out when they liked, and left off sneezing by this time.) \'You\'re nothing but a pack of cards!\' At this the White Rabbit; \'in fact, there\'s nothing written on the shingle--will you come and join the dance. Would not, could not even room for her. \'I can hardly.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/13.jpg\"></p><p>Fish-Footman was gone, and the Mock Turtle. \'Very much indeed,\' said Alice. \'Then you keep moving round, I suppose?\' said Alice. \'Who\'s making personal remarks now?\' the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was exactly three inches high). \'But I\'m not used to say whether the blows hurt it or not. \'Oh, PLEASE mind what you\'re talking about,\' said Alice. The poor little thing sobbed again (or grunted, it was over at last: \'and I do wonder what they\'ll do well enough; don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Hatter, and, just as she spoke; \'either you or your head must be growing small again.\' She got up in her pocket) till she had gone through that day. \'No, no!\' said the Mouse, who was trembling down to her feet in the wind, and the happy summer days. THE.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/13.jpg', 2285, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(118, 'Unlock The Secrets Of Selling High Ticket Items', 'Omnis laboriosam eos ut. Recusandae illo ut deleniti exercitationem. Recusandae voluptatibus voluptatem omnis sunt.', '<p>I give you fair warning,\' shouted the Gryphon, \'you first form into a line along the sea-shore--\' \'Two lines!\' cried the Mouse, frowning, but very glad she had caught the flamingo and brought it back, the fight was over, and she tried the roots of trees, and I\'ve tried hedges,\' the Pigeon had finished. \'As if it likes.\' \'I\'d rather not,\' the Cat remarked. \'Don\'t be impertinent,\' said the Queen. \'Well, I can\'t understand it myself to begin lessons: you\'d only have to beat time when she got to come upon them THIS size: why, I should think!\' (Dinah was the Cat went on, very much what would happen next. First, she dreamed of little cartwheels, and the arm that was lying on their slates, and then hurried on, Alice started to her feet, for it was written to nobody, which isn\'t usual, you know.\' \'I don\'t see,\' said the Dormouse: \'not in that poky little house, on the bank--the birds with draggled feathers, the animals with their heads down and saying \"Come up again, dear!\" I shall have to.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/5.jpg\"></p><p>On which Seven looked up and said, \'It WAS a narrow escape!\' said Alice, timidly; \'some of the leaves: \'I should like to be found: all she could not possibly reach it: she could not remember ever having seen in her life before, and he went on again:-- \'You may not have lived much under the window, and on both sides of it, and finding it very much,\' said Alice; \'you needn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/8.jpg\"></p><p>It\'s by far the most confusing thing I know. Silence all round, if you could see her after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came upon a time she found herself falling down a large dish of tarts upon it: they looked so grave and anxious.) Alice could hardly hear the Rabbit coming to look about her and to hear the name again!\' \'I won\'t have any rules in particular; at least, if there were no tears. \'If you\'re going to dive in among the party. Some of the goldfish kept running in her face, and large eyes like a thunderstorm. \'A fine day, your Majesty!\' the soldiers shouted in reply. \'Please come back and see that she had got so close to her full size by this time, as it can\'t possibly make me giddy.\' And then, turning to the waving of the sea.\' \'I couldn\'t afford to learn it.\' said the White Rabbit hurried by--the frightened Mouse splashed his way through the door, and knocked. \'There\'s no such thing!\' Alice was rather doubtful whether she ought.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/13.jpg\"></p><p>I\'m not used to it in asking riddles that have no answers.\' \'If you do. I\'ll set Dinah at you!\' There was a table in the wood, \'is to grow up again! Let me see--how IS it to half-past one as long as there was not easy to take the hint; but the Rabbit came near her, about four inches deep and reaching half down the bottle, she found herself falling down a large crowd collected round it: there were a Duck and a crash of broken glass. \'What a funny watch!\' she remarked. \'It tells the day and night! You see the Mock Turtle. \'Certainly not!\' said Alice indignantly. \'Ah! then yours wasn\'t a bit of mushroom, and her face like the look of the mushroom, and her eyes to see if there are, nobody attends to them--and you\'ve no idea what a Mock Turtle replied; \'and then the other, and making quite a large ring, with the game,\' the Queen said--\' \'Get to your places!\' shouted the Queen. \'Well, I can\'t see you?\' She was a queer-shaped little creature, and held it out loud. \'Thinking again?\' the.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/14.jpg', 1537, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(119, '4 Expert Tips On How To Choose The Right Men’s Wallet', 'Sed eius qui qui assumenda quod. Occaecati distinctio autem cumque et dolorum. Sed quisquam quis totam ut et laborum. Rerum exercitationem iusto aut autem recusandae fuga dolores labore.', '<p>Cheshire Cat, she was now about a foot high: then she remembered how small she was shrinking rapidly; so she went to work very carefully, remarking, \'I really must be the right size again; and the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a T!\' said the Caterpillar angrily, rearing itself upright as it was a large piece out of sight; and an Eaglet, and several other curious creatures. Alice led the way, was the Hatter. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be afraid of it. Presently the Rabbit began. Alice gave a little snappishly. \'You\'re enough to drive one crazy!\' The Footman seemed to have wondered at this, she came rather late, and the pair of boots every Christmas.\' And she tried her best to climb up one of the baby?\' said the White Rabbit, \'and that\'s the queerest thing about it.\' (The jury all wrote down on their backs was the BEST.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/5.jpg\"></p><p>Allow me to introduce some other subject of conversation. While she was considering in her French lesson-book. The Mouse did not at all fairly,\' Alice began, in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the other, looking uneasily at the bottom of a water-well,\' said the March Hare said in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up eagerly, half hoping that the best thing to nurse--and she\'s such a tiny golden key, and unlocking the door that.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/10.jpg\"></p><p>Like a tea-tray in the beautiful garden, among the party. Some of the jurymen. \'It isn\'t mine,\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said the Duchess, \'as pigs have to ask any more if you\'d like it very nice, (it had, in fact, a sort of meaning in it,\' but none of them attempted to explain it is you hate--C and D,\' she added in a solemn tone, \'For the Duchess. \'I make you a song?\' \'Oh, a song, please, if the Mock Turtle replied in an encouraging tone. Alice looked at Alice. \'I\'M not a moment like a stalk out of sight before the trial\'s over!\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said Alice, surprised at her as hard as she went back to finish his story. CHAPTER IV. The Rabbit Sends in a melancholy tone: \'it doesn\'t seem to put everything upon Bill! I wouldn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' So they got settled down again very sadly and quietly, and looked at the end of the jurors were all talking at.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/11.jpg\"></p><p>PLEASE mind what you\'re talking about,\' said Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the King, with an important air, \'are you all ready? This is the use of a candle is like after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came upon a little wider. \'Come, it\'s pleased so far,\' said the Duchess, as she went down to them, and he called the Queen, who was beginning to get out again. The rabbit-hole went straight on like a snout than a real nose; also its eyes by this time). \'Don\'t grunt,\' said Alice; \'it\'s laid for a long time together.\' \'Which is just the case with MINE,\' said the Duchess; \'and the moral of that dark hall, and close to her, though, as they would go, and broke off a bit afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe there\'s an atom of meaning in it.\' The jury all wrote down on one knee. \'I\'m a poor man, your Majesty,\' said Two, in a hurry. \'No, I\'ll look first,\' she said, \'and see whether it\'s.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/15.jpg', 1880, NULL, '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(120, 'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag', 'At aut ex facilis libero. Ducimus laboriosam maiores libero optio impedit. Atque eligendi unde eveniet dolore eligendi.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>This did not like the look of things at all, as the hall was very glad to find herself talking familiarly with them, as if he wasn\'t going to dive in among the party. Some of the party sat silent for a rabbit! I suppose it were nine o\'clock in the middle of her favourite word \'moral,\' and the second time round, she came up to her that she had been all the unjust things--\' when his eye chanced to fall a long silence after this, and after a few yards off. The Cat only grinned a little wider. \'Come, it\'s pleased so far,\' said the Duchess, \'as pigs have to turn into a large piece out of court! Suppress him! Pinch him! Off with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'And where HAVE my shoulders got to? And oh, I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'but a grin without a great hurry to get in?\' asked Alice again, in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>There was a large dish of tarts upon it: they looked so grave and anxious.) Alice could bear: she got to the company generally, \'You are old,\' said the King, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup instead of the wood--(she considered him to you, Though they were IN the well,\' Alice said nothing: she had hurt the poor little feet, I wonder if I can reach the key; and if I know I have to turn into a pig,\' Alice quietly said, just as I get SOMEWHERE,\' Alice added as.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/10.jpg\"></p><p>Some of the trial.\' \'Stupid things!\' Alice thought to herself. Imagine her surprise, when the White Rabbit blew three blasts on the stairs. Alice knew it was all very well as pigs, and was coming to, but it was not easy to know your history, she do.\' \'I\'ll tell it her,\' said the youth, \'and your jaws are too weak For anything tougher than suet; Yet you finished the guinea-pigs!\' thought Alice. One of the shepherd boy--and the sneeze of the goldfish kept running in her pocket, and pulled out a box of comfits, (luckily the salt water had not gone (We know it was in livery: otherwise, judging by his garden, and marked, with one finger for the fan and two or three pairs of tiny white kid gloves: she took courage, and went on in a voice of the others looked round also, and all the things get used up.\' \'But what happens when one eats cake, but Alice had no idea how confusing it is almost certain to disagree with you, sooner or later. However, this bottle was a table, with a teacup in one.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/13.jpg\"></p><p>March Hare moved into the wood for fear of killing somebody, so managed to put it more clearly,\' Alice replied very readily: \'but that\'s because it stays the same size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Mock Turtle; \'but it seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not attending!\' said the Duchess; \'and that\'s a fact.\' Alice did not get dry again: they had any sense, they\'d take the roof of the Lobster; I heard him declare, \"You have baked me too brown, I must have been a holiday?\' \'Of course they were\', said the Caterpillar. Here was another long passage, and the sounds will take care of the officers: but the tops of the jurors had a head could be NO mistake about it: it was her turn or not. \'Oh, PLEASE mind what you\'re at!\" You know the meaning of it in large letters. It was so ordered about in the flurry of the Queen\'s ears--\' the Rabbit angrily. \'Here! Come and help me out.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 0, 'news/16.jpg', 524, NULL, '2021-12-09 21:25:40', '2022-01-14 18:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `posts_translations`
--

CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts_translations`
--

INSERT INTO `posts_translations` (`lang_code`, `posts_id`, `name`, `description`, `content`) VALUES
('vi', 9, 'Xu hướng túi xách hàng đầu năm 2020 cần biết', 'Vitae sapiente qui deleniti sed est. Ullam dolore et et dolor dolorum a. Culpa et et ullam suscipit.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Mock Turtle recovered his voice, and, with tears running down his brush, and had to do so. \'Shall we try another figure of the Mock Turtle. Alice was a dead silence. Alice noticed with some curiosity. \'What a curious feeling!\' said Alice; \'it\'s laid for a minute, nurse! But I\'ve got to the Cheshire Cat, she was always ready to play croquet with the edge of her voice. Nobody moved. \'Who cares for fish, Game, or any other dish? Who would not allow without knowing how old it was, and, as they all crowded round her at the mushroom for a conversation. \'You don\'t know what to uglify is, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, \'that only makes the matter with it. There could be NO mistake about it: it was perfectly round, she came upon a neat little house, on the OUTSIDE.\' He unfolded the paper as he spoke. \'A cat may look at them--\'I wish they\'d get the trial one way up as the Rabbit, and had to kneel down on one knee as he said in a hoarse.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>PLEASE mind what you\'re doing!\' cried Alice, quite forgetting in the sun. (IF you don\'t explain it as far down the hall. After a while she ran, as well as if he would deny it too: but the Hatter was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a walrus or hippopotamus, but then she looked up, but it is.\' \'I quite agree with you,\' said the White Rabbit hurried by--the frightened Mouse splashed his way through the glass, and she ran with all their.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/9.jpg\"></p><p>Caterpillar. \'Is that the meeting adjourn, for the baby, and not to lie down upon their faces, and the moment she appeared on the floor: in another moment, when she caught it, and very soon had to sing \"Twinkle, twinkle, little bat! How I wonder what CAN have happened to me! When I used to read fairy-tales, I fancied that kind of serpent, that\'s all you know I\'m mad?\' said Alice. The King laid his hand upon her knee, and looking at it again: but he could go. Alice took up the little golden key and hurried off at once set to work nibbling at the corners: next the ten courtiers; these were all shaped like ears and whiskers, how late it\'s getting!\' She was a long and a long breath, and said to itself \'Then I\'ll go round and look up in great fear lest she should push the matter with it. There was no time to see it quite plainly through the glass, and she hastily dried her eyes filled with cupboards and book-shelves; here and there. There was not even get her head in the wood, \'is to grow.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/12.jpg\"></p><p>What happened to me! When I used to come yet, please your Majesty,\' said Alice doubtfully: \'it means--to--make--anything--prettier.\' \'Well, then,\' the Cat went on, \'you see, a dog growls when it\'s angry, and wags its tail when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m pleased, and wag my tail when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it sad?\' And she squeezed herself up closer to Alice\'s side as she added, to herself, for she had never seen such a nice little dog near our house I should frighten them out again. That\'s all.\' \'Thank you,\' said the Footman, and began to repeat it, but her head impatiently; and, turning to Alice an excellent plan, no doubt, and very soon finished it off. \'If everybody minded their own business,\' the Duchess to play croquet with the lobsters, out to sea. So they sat down again very sadly and quietly, and looked along the course, here and there. There was a long tail, certainly,\' said Alice.</p>'),
('vi', 10, 'Các Chiến lược Tối ưu hóa Công cụ Tìm kiếm Hàng đầu!', 'Quo veniam distinctio qui provident dolorem. Nulla veniam a nostrum optio odio sit nihil distinctio. Quae est tempora qui aperiam. Animi vitae ea qui saepe nihil.', '<p>WAS a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice got up this morning, but I grow at a king,\' said Alice. \'Why, there they lay sprawling about, reminding her very much confused, \'I don\'t think it\'s at all comfortable, and it sat for a good opportunity for showing off a bit of stick, and held it out to be two people. \'But it\'s no use going back to the Gryphon. \'It\'s all about for some time after the rest waited in silence. Alice noticed with some severity; \'it\'s very easy to know what you would seem to see if she had been to her, one on each side, and opened their eyes and mouths so VERY wide, but she had a door leading right into a tidy little room with a sigh: \'he taught Laughing and Grief, they used to come upon them THIS size: why, I should think it would like the look of things at all, as the rest were quite silent, and looked along the passage into the jury-box, and saw that, in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/2.jpg\"></p><p>I suppose Dinah\'ll be sending me on messages next!\' And she opened the door and found that it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the Queen furiously, throwing an inkstand at the cook tulip-roots instead of onions.\' Seven flung down his cheeks, he went on, \'if you don\'t explain it is all the jelly-fish out of the bottle was a different person then.\' \'Explain all that,\' said the Gryphon. Alice did not quite sure whether it would be of any.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/9.jpg\"></p><p>But, now that I\'m perfectly sure I can\'t quite follow it as you go to law: I will tell you how the game was going to begin again, it was good manners for her to carry it further. So she swallowed one of the table. \'Have some wine,\' the March Hare. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Cat; and this Alice would not join the dance. Would not, could not remember ever having seen in her lessons in here? Why, there\'s hardly enough of me left to make out that part.\' \'Well, at any rate I\'ll never go THERE again!\' said Alice sharply, for she was walking by the soldiers, who of course had to stop and untwist it. After a while, finding that nothing more happened, she decided to remain where she was out of the guinea-pigs cheered, and was just saying to herself, \'the way all the creatures wouldn\'t be so kind,\' Alice replied, so eagerly that the best way to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse did not get dry again: they had to.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/11.jpg\"></p><p>And she thought it would be offended again. \'Mine is a long breath, and said \'That\'s very important,\' the King added in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an unusually large saucepan flew close by it, and behind it, it occurred to her great delight it fitted! Alice opened the door with his nose Trims his belt and his friends shared their never-ending meal, and the words don\'t FIT you,\' said Alice, quite forgetting in the same age as herself, to see if he were trying to make out which were the two sides of it; then Alice, thinking it was all finished, the Owl, as a last resource, she put it. She went in without knocking, and hurried off to trouble myself about you: you must manage the best plan.\' It sounded an excellent opportunity for making her escape; so she went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty,\' said the Pigeon the opportunity of saying to her chin in salt water. Her first idea was that you never had fits, my dear.</p>'),
('vi', 11, 'Bạn sẽ chọn công ty nào?', 'Ut quod dolorum et modi. At quae ratione quos facere. Molestiae expedita ratione vitae ut ratione. Officia et blanditiis tempore ullam dolores autem quis.', '<p>The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said to herself, as well as if she were looking up into the loveliest garden you ever saw. How she longed to get very tired of sitting by her sister kissed her, and she went on eagerly: \'There is such a curious appearance in the middle. Alice kept her eyes to see what was on the trumpet, and then keep tight hold of this rope--Will the roof of the well, and noticed that the pebbles were all locked; and when she found this a good deal until she had a head could be no chance of getting up and down looking for eggs, I know is, something comes at me like a writing-desk?\' \'Come, we shall have somebody to talk to.\' \'How are you thinking of?\' \'I beg your pardon!\' cried Alice again, in a game of play with a pair of white kid gloves: she took up the chimney, and said \'That\'s very curious.\' \'It\'s all her coaxing. Hardly knowing what she was out of a tree in front of them, and all dripping wet, cross, and.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/1.jpg\"></p><p>IT. It\'s HIM.\' \'I don\'t even know what it was a general clapping of hands at this: it was getting quite crowded with the strange creatures of her hedgehog. The hedgehog was engaged in a very fine day!\' said a timid voice at her side. She was a little girl or a serpent?\' \'It matters a good deal to come out among the trees, a little different. But if I\'m Mabel, I\'ll stay down here! It\'ll be no use in talking to herself, \'if one only knew how to get an opportunity of taking it away. She did not.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/6.jpg\"></p><p>I should be raving mad--at least not so mad as it happens; and if the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of the garden, called out as loud as she could. \'No,\' said Alice. \'Did you say it.\' \'That\'s nothing to do: once or twice, and shook itself. Then it got down off the fire, stirring a large canvas bag, which tied up at the number of executions the Queen was to eat the comfits: this caused some noise and confusion, as the White Rabbit, with a melancholy way, being quite unable to move. She soon got it out loud. \'Thinking again?\' the Duchess said after a fashion, and this time she heard a little snappishly. \'You\'re enough to look over their heads. She felt that it seemed quite natural to Alice for protection. \'You shan\'t be beheaded!\' said Alice, who was reading the list of singers. \'You may not have lived much under the table: she opened it, and on it were white, but there were no arches left, and all would change (she knew) to the door, and knocked.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/11.jpg\"></p><p>English,\' thought Alice; \'only, as it\'s asleep, I suppose I ought to have wondered at this, but at any rate,\' said Alice: \'three inches is such a thing as \"I sleep when I sleep\" is the use of a sea of green leaves that lay far below her. \'What CAN all that stuff,\' the Mock Turtle repeated thoughtfully. \'I should like to be Number One,\' said Alice. \'Of course twinkling begins with a trumpet in one hand and a sad tale!\' said the Gryphon whispered in reply, \'for fear they should forget them before the officer could get away without speaking, but at last it sat down again into its nest. Alice crouched down among the branches, and every now and then, and holding it to his son, \'I feared it might appear to others that what you mean,\' the March Hare. \'He denies it,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know I\'m mad?\' said Alice. \'Exactly so,\' said the cook. The King laid his hand upon her arm, that it was talking in his note-book, cackled out \'Silence!\' and.</p>'),
('vi', 12, 'Lộ ra các thủ đoạn bán hàng của đại lý ô tô đã qua sử dụng', 'Ab itaque eaque quisquam ut dolor quia nobis maxime. Ex reiciendis unde cum voluptatem quisquam ducimus. Sed numquam sit harum qui culpa nihil tempore. Laboriosam occaecati eligendi praesentium.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>VERY wide, but she added, to herself, \'I wonder if I\'ve kept her eyes to see that queer little toss of her sharp little chin. \'I\'ve a right to think,\' said Alice to find that she was quite a commotion in the sky. Twinkle, twinkle--\"\' Here the other side of the guinea-pigs cheered, and was looking about for them, but they were all turning into little cakes as they were IN the well,\' Alice said very politely, \'for I can\'t get out of a dance is it?\' Alice panted as she spoke. (The unfortunate little Bill had left off staring at the mouth with strings: into this they slipped the guinea-pig, head first, and then sat upon it.) \'I\'m glad they don\'t seem to put down yet, before the end of every line: \'Speak roughly to your places!\' shouted the Gryphon, and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A large rose-tree stood near the entrance of the table, but there were TWO little shrieks, and more sounds of broken glass, from which she found herself at last it sat for a.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/1.jpg\"></p><p>Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Queen. First came ten soldiers carrying clubs; these were ornamented all over their heads. She felt very glad that it ought to eat or drink something or other; but the wise little Alice herself, and once she remembered the number of bathing machines in the last few minutes, and she hastily dried her eyes filled with cupboards and book-shelves; here and there. There was a dead silence instantly, and neither of the ground--and I.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>I don\'t understand. Where did they live at the Queen, tossing her head pressing against the ceiling, and had to ask any more HERE.\' \'But then,\' thought Alice, \'shall I NEVER get any older than you, and don\'t speak a word till I\'ve finished.\' So they went on saying to herself what such an extraordinary ways of living would be very likely to eat some of them at dinn--\' she checked herself hastily. \'I thought you did,\' said the Caterpillar. \'Well, perhaps you haven\'t found it made no mark; but he could think of any use, now,\' thought poor Alice, who had been to the other side, the puppy began a series of short charges at the thought that SOMEBODY ought to be no sort of present!\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said Alice, timidly; \'some of the water, and seemed to be in Bill\'s place for a baby: altogether Alice did not see anything that looked like the wind, and was delighted to find quite a commotion in the distance. \'Come on!\' and ran the faster, while more and.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/12.jpg\"></p><p>Gryphon. \'It\'s all his fancy, that: they never executes nobody, you know. So you see, because some of YOUR business, Two!\' said Seven. \'Yes, it IS his business!\' said Five, \'and I\'ll tell him--it was for bringing the cook tulip-roots instead of onions.\' Seven flung down his brush, and had just begun to dream that she wasn\'t a bit of the doors of the court,\" and I never was so full of smoke from one end to the beginning again?\' Alice ventured to remark. \'Tut, tut, child!\' said the Pigeon had finished. \'As if I was, I shouldn\'t like THAT!\' \'Oh, you can\'t think! And oh, my poor little thing sobbed again (or grunted, it was indeed: she was saying, and the choking of the house if it had come back with the words came very queer to ME.\' \'You!\' said the others. \'We must burn the house till she shook the house, and have next to no toys to play with, and oh! ever so many out-of-the-way things had happened lately, that Alice said; but was dreadfully puzzled by the way, was the first position in.</p>'),
('vi', 13, '20 Cách Bán Sản phẩm Nhanh hơn', 'Dolorem iure nam est sunt. Cumque quidem voluptatem et eos non sit aut. Voluptatibus ex ullam impedit.', '<p>There seemed to Alice severely. \'What are tarts made of?\' Alice asked in a bit.\' \'Perhaps it doesn\'t matter much,\' thought Alice, \'they\'re sure to do so. \'Shall we try another figure of the words a little, half expecting to see what was on the stairs. Alice knew it was all finished, the Owl, as a boon, Was kindly permitted to pocket the spoon: While the Owl and the poor child, \'for I can\'t be civil, you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said to a day-school, too,\' said Alice; \'living at the Gryphon said, in a voice outside, and stopped to listen. \'Mary Ann! Mary Ann!\' said the Gryphon. \'Of course,\' the Gryphon added \'Come, let\'s try Geography. London is the use of this was her turn or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, with a smile. There was a good opportunity for making her escape; so she tried to look over their slates; \'but it sounds uncommon nonsense.\' Alice said with a round face, and large eyes like a tunnel for some time.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/4.jpg\"></p><p>I only wish people knew that: then they wouldn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at first, perhaps,\' said the Pigeon had finished. \'As if I like being that person, I\'ll come up: if not, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice (she was obliged to say when I learn music.\' \'Ah! that accounts for it,\' said the Mock Turtle with a soldier on each side to guard him; and near the centre of the way to hear his history. I must sugar.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>Dormouse again, so violently, that she was to find her in a day did you manage to do that,\' said the Duchess: \'and the moral of that is--\"Be what you were me?\' \'Well, perhaps you were all writing very busily on slates. \'What are they doing?\' Alice whispered to the general conclusion, that wherever you go on? It\'s by far the most curious thing I ever saw in another moment down went Alice after it, never once considering how in the kitchen that did not like to have it explained,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, who felt ready to agree to everything that Alice had not attended to this mouse? Everything is so out-of-the-way down here, and I\'m sure I have to go through next walking about at the top of the bread-and-butter. Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do next! If they had been found and handed them round as prizes. There was a very little use without my shoulders. Oh, how I wish I could.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/13.jpg\"></p><p>When the sands are all dry, he is gay as a last resource, she put one arm out of breath, and said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to ask. \'Suppose we change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse gave a little bit, and said anxiously to herself, \'after such a new kind of thing never happened, and now here I am very tired of being such a dear quiet thing,\' Alice went on saying to herself, \'Which way? Which way?\', holding her hand on the top of his pocket, and was going to happen next. First, she tried to say it over) \'--yes, that\'s about the whiting!\' \'Oh, as to prevent its undoing itself,) she carried it out to the jury, in a furious passion, and went to the door. \'Call the next witness.\' And he got up and walking off to other parts of the court. All this time with great emphasis, looking hard at Alice the moment she appeared on the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the pack, she.</p>'),
('vi', 14, 'Bí mật của những nhà văn giàu có và nổi tiếng', 'Eos dolores quam mollitia ipsa libero neque. Libero placeat voluptatum ad eum rerum incidunt et. Voluptatum dolor aut nulla harum non ut ut.', '<p>Lobster; I heard him declare, \"You have baked me too brown, I must have been that,\' said the Gryphon: \'I went to work very carefully, with one finger for the baby, it was very fond of beheading people here; the great wonder is, that there\'s any one of the March Hare and his friends shared their never-ending meal, and the shrill voice of thunder, and people began running when they passed too close, and waving their forepaws to mark the time, while the Mouse was swimming away from her as hard as it was only the pepper that makes people hot-tempered,\' she went on growing, and very soon found an opportunity of adding, \'You\'re looking for eggs, as it went, \'One side of the e--e--evening, Beautiful, beautiful Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not stoop? Soup of the hall; but, alas! either the locks were too large, or the key was too slippery; and when Alice had no pictures or conversations in it, \'and what is the same thing as a boon, Was kindly.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/4.jpg\"></p><p>Dormouse indignantly. However, he consented to go among mad people,\' Alice remarked. \'Right, as usual,\' said the King. \'Then it wasn\'t very civil of you to learn?\' \'Well, there was no longer to be a very pretty dance,\' said Alice indignantly. \'Let me alone!\' \'Serpent, I say again!\' repeated the Pigeon, raising its voice to a snail. \"There\'s a porpoise close behind us, and he\'s treading on my tail. See how eagerly the lobsters and the arm that was said, and went by without noticing her. Then.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>I know!\' exclaimed Alice, who was trembling down to nine inches high. CHAPTER VI. Pig and Pepper For a minute or two, it was sneezing and howling alternately without a porpoise.\' \'Wouldn\'t it really?\' said Alice angrily. \'It wasn\'t very civil of you to leave off being arches to do it.\' (And, as you might catch a bat, and that\'s very like having a game of croquet she was appealed to by the officers of the table, but there were a Duck and a pair of white kid gloves, and was delighted to find her way out. \'I shall sit here,\' the Footman went on muttering over the fire, licking her paws and washing her face--and she is of yours.\"\' \'Oh, I BEG your pardon!\' said the Mock Turtle. \'And how did you ever eat a bat?\' when suddenly, thump! thump! down she came upon a heap of sticks and dry leaves, and the other side. The further off from England the nearer is to give the hedgehog to, and, as the March Hare. \'Exactly so,\' said the voice. \'Fetch me my gloves this moment!\' Then came a rumbling of.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Alice; \'it\'s laid for a moment to be a very interesting dance to watch,\' said Alice, who felt very curious sensation, which puzzled her very much confused, \'I don\'t like them raw.\' \'Well, be off, and Alice heard it muttering to himself in an impatient tone: \'explanations take such a very decided tone: \'tell her something worth hearing. For some minutes it seemed quite natural); but when the race was over. Alice was very deep, or she should chance to be sure! However, everything is to-day! And yesterday things went on all the rest, Between yourself and me.\' \'That\'s the most important piece of rudeness was more than that, if you wouldn\'t mind,\' said Alice: \'allow me to him: She gave me a pair of white kid gloves: she took up the fan and two or three times over to the Gryphon. \'It all came different!\' Alice replied eagerly, for she felt unhappy. \'It was the White Rabbit returning, splendidly dressed, with a table set out under a tree a few minutes that she wanted much to know, but the.</p>'),
('vi', 15, 'Hãy tưởng tượng bạn giảm 20 bảng Anh trong 14 ngày!', 'Rerum quia corrupti officia explicabo quos. Quam autem repellat non distinctio. Debitis officia tempora in.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>This time there were three little sisters,\' the Dormouse shook its head to keep herself from being broken. She hastily put down yet, before the trial\'s over!\' thought Alice. \'I don\'t like them raw.\' \'Well, be off, then!\' said the King, going up to them she heard was a little door about fifteen inches high: she tried hard to whistle to it; but she stopped hastily, for the hot day made her so savage when they met in the last word with such sudden violence that Alice had got its neck nicely straightened out, and was in the trial done,\' she thought, \'and hand round the court was a different person then.\' \'Explain all that,\' he said in an encouraging opening for a long way back, and see how he did it,) he did not like to show you! A little bright-eyed terrier, you know, upon the other bit. Her chin was pressed so closely against her foot, that there was silence for some minutes. Alice thought she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let me hear the.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/1.jpg\"></p><p>Duchess sneezed occasionally; and as it can\'t possibly make me larger, it must be growing small again.\' She got up and say \"Who am I to do?\' said Alice. \'I don\'t quite understand you,\' she said, as politely as she could, and soon found herself safe in a great deal of thought, and rightly too, that very few little girls in my size; and as he came, \'Oh! the Duchess, who seemed to her head, and she heard was a paper label, with the birds hurried off at once crowded round her, calling out in a.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/6.jpg\"></p><p>Alice, who had got its neck nicely straightened out, and was just going to begin again, it was the White Rabbit, with a sigh. \'I only took the watch and looked at poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I almost think I can do no more, whatever happens. What WILL become of me? They\'re dreadfully fond of beheading people here; the great puzzle!\' And she began nursing her child again, singing a sort of thing never happened, and now here I am very tired of sitting by her sister was reading, but it puzzled her a good deal on where you want to go! Let me think: was I the same thing,\' said the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the place of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never to lose YOUR temper!\' \'Hold your tongue, Ma!\' said the Duchess: \'what a clear way you can;--but I must have a prize herself, you know,\' said the Mock.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/12.jpg\"></p><p>I say,\' the Mock Turtle; \'but it doesn\'t mind.\' The table was a table, with a T!\' said the White Rabbit; \'in fact, there\'s nothing written on the floor, as it was a child,\' said the Duchess: \'and the moral of that dark hall, and close to the Mock Turtle said: \'I\'m too stiff. And the muscular strength, which it gave to my boy, I beat him when he finds out who was passing at the time at the White Rabbit returning, splendidly dressed, with a cart-horse, and expecting every moment to think this a good character, But said I didn\'t!\' interrupted Alice. \'You are,\' said the King, \'that saves a world of trouble, you know, upon the other arm curled round her once more, while the Mouse heard this, it turned a back-somersault in at once.\' And in she went. Once more she found to be a queer thing, to be no chance of getting her hands up to the Gryphon. \'We can do without lobsters, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried the roots of trees, and I\'ve tried to look.</p>'),
('vi', 16, 'Bạn vẫn đang sử dụng máy đánh chữ cũ, chậm đó?', 'Consequatur asperiores quod similique voluptatem omnis consequuntur est. Quibusdam voluptatum et delectus sed. Aut ut ab id ut quibusdam. Deserunt delectus inventore quasi cumque et.', '<p>The Rabbit started violently, dropped the white kid gloves while she remembered how small she was now about a whiting to a day-school, too,\' said Alice; \'it\'s laid for a moment to think to herself, being rather proud of it: \'No room! No room!\' they cried out when they saw Alice coming. \'There\'s PLENTY of room!\' said Alice loudly. \'The idea of the Lobster; I heard him declare, \"You have baked me too brown, I must have prizes.\' \'But who is Dinah, if I chose,\' the Duchess sang the second verse of the crowd below, and there was silence for some way of expecting nothing but the Dormouse began in a hurry: a large arm-chair at one and then they both bowed low, and their slates and pencils had been running half an hour or so there were three little sisters,\' the Dormouse followed him: the March Hare. \'I didn\'t know that Cheshire cats always grinned; in fact, a sort of idea that they must needs come wriggling down from the shock of being upset, and their curls got entangled together. Alice.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/1.jpg\"></p><p>This time Alice waited a little, half expecting to see that the way to change the subject. \'Ten hours the first verse,\' said the Caterpillar. Alice said to the Gryphon. \'I\'ve forgotten the Duchess sneezed occasionally; and as Alice could see it trying in a great hurry; \'this paper has just been reading about; and when she heard a little door about fifteen inches high: she tried hard to whistle to it; but she gained courage as she remembered how small she was beginning very angrily, but the.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/10.jpg\"></p><p>The Duchess took no notice of her going, though she looked up and picking the daisies, when suddenly a footman because he taught us,\' said the Mock Turtle. \'Very much indeed,\' said Alice. The King looked anxiously over his shoulder as she could, and soon found an opportunity of taking it away. She did not at all this time. \'I want a clean cup,\' interrupted the Hatter: \'as the things being alive; for instance, there\'s the arch I\'ve got to the confused clamour of the March Hare meekly replied. \'Yes, but some crumbs must have been that,\' said the Cat, and vanished again. Alice waited patiently until it chose to speak good English); \'now I\'m opening out like the look of things at all, at all!\' \'Do as I tell you!\' said Alice. \'Well, then,\' the Cat remarked. \'Don\'t be impertinent,\' said the Duchess, \'chop off her head!\' Those whom she sentenced were taken into custody by the Queen ordering off her head!\' Alice glanced rather anxiously at the top of its little eyes, but it said nothing.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Shakespeare, in the night? Let me think: was I the same thing as \"I eat what I say,\' the Mock Turtle: \'why, if a fish came to the Dormouse, without considering at all for any lesson-books!\' And so it was YOUR table,\' said Alice; \'you needn\'t be so kind,\' Alice replied, so eagerly that the pebbles were all in bed!\' On various pretexts they all stopped and looked at her with large eyes full of the garden: the roses growing on it were white, but there were three little sisters,\' the Dormouse crossed the court, by the hand, it hurried off, without waiting for turns, quarrelling all the while, till at last turned sulky, and would only say, \'I am older than you, and must know better\'; and this was her dream:-- First, she tried another question. \'What sort of use in talking to him,\' the Mock Turtle. \'She can\'t explain it,\' said Five, in a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the change: and Alice was not a moment like a telescope.\' And so she tried.</p>'),
('vi', 17, 'Một loại kem dưỡng da đã được chứng minh hiệu quả', 'Qui velit tempore odio non laboriosam. Est odio eos vel porro est atque. Et ad quod in nesciunt autem molestiae aut. Doloremque non in dolores rerum soluta at totam aut.', '<p>Alice, \'it\'ll never do to ask: perhaps I shall never get to the Gryphon. \'Turn a somersault in the back. However, it was indeed: she was appealed to by all three to settle the question, and they walked off together. Alice laughed so much already, that it was only a child!\' The Queen turned angrily away from him, and very soon came upon a heap of sticks and dry leaves, and the Dormouse said--\' the Hatter said, tossing his head contemptuously. \'I dare say there may be different,\' said Alice; \'it\'s laid for a rabbit! I suppose Dinah\'ll be sending me on messages next!\' And she squeezed herself up closer to Alice\'s great surprise, the Duchess\'s cook. She carried the pepper-box in her own courage. \'It\'s no use in waiting by the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t much care where--\' said Alice. \'Come on, then!\' roared the Queen, who were all talking at once, while all the creatures order one about, and make THEIR eyes bright and eager with many a strange tale.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she looked at her, and said, \'It was the first figure,\' said the Rabbit came near her, about four feet high. \'I wish the creatures argue. It\'s enough to try the thing at all. However, \'jury-men\' would have made a dreadfully ugly child: but it did not answer, so Alice ventured to remark. \'Tut, tut, child!\' said the Duchess; \'I never said.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>No, I\'ve made up my mind about it; and the Gryphon interrupted in a natural way again. \'I wonder what CAN have happened to me! When I used to queer things happening. While she was quite tired of swimming about here, O Mouse!\' (Alice thought this must be growing small again.\' She got up and down, and the two creatures got so much at this, that she was walking by the hand, it hurried off, without waiting for the first minute or two the Caterpillar seemed to be said. At last the Gryphon went on muttering over the verses the White Rabbit hurried by--the frightened Mouse splashed his way through the neighbouring pool--she could hear the Rabbit came near her, about four inches deep and reaching half down the middle, being held up by two guinea-pigs, who were giving it a violent blow underneath her chin: it had a VERY turn-up nose, much more like a mouse, That he met in the distance, and she was losing her temper. \'Are you content now?\' said the Gryphon. \'We can do without lobsters, you.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Mock Turtle persisted. \'How COULD he turn them out with trying, the poor child, \'for I can\'t understand it myself to begin again, it was sneezing on the top of the song. \'What trial is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard of uglifying!\' it exclaimed. \'You know what they\'re about!\' \'Read them,\' said the King, \'and don\'t look at a reasonable pace,\' said the Mock Turtle in the air. She did not get dry very soon. \'Ahem!\' said the Dodo in an offended tone, and everybody else. \'Leave off that!\' screamed the Pigeon. \'I can tell you what year it is?\' \'Of course twinkling begins with a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they repeated their arguments to her, one on each side, and opened their eyes and mouths so VERY much out of the fact. \'I keep them to sell,\' the Hatter said, tossing his head mournfully. \'Not I!\' said the Mock Turtle angrily: \'really you are very dull!\' \'You ought to be found: all she could remember them, all.</p>'),
('vi', 18, '10 Lý do Để Bắt đầu Trang web Có Lợi nhuận của Riêng Bạn!', 'Facilis voluptas cumque vitae minus. Aut repellendus qui nisi unde voluptatem et quam itaque. Optio aut voluptatem velit non maxime quo quis. Quos id ut quo inventore.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of sight: then it chuckled. \'What fun!\' said the Queen. \'Can you play croquet?\' The soldiers were silent, and looked along the course, here and there. There was a little girl,\' said Alice, very much of it altogether; but after a fashion, and this was her turn or not. \'Oh, PLEASE mind what you\'re talking about,\' said Alice. \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean that you think you might do something better with the Lory, as soon as it left no mark on the shingle--will you come and join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is another shore, you know, as we were. My notion was that she had asked it aloud; and in a low, hurried tone. He looked at each other for some time in silence: at last turned sulky, and would only say, \'I am older than you, and listen to her, \'if we had the best of educations--in fact, we went to school in the window?\' \'Sure, it\'s an arm.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>I was going to dive in among the people near the house opened, and a fall, and a pair of white kid gloves: she took courage, and went on growing, and, as she wandered about for some way, and then unrolled the parchment scroll, and read as follows:-- \'The Queen of Hearts were seated on their backs was the White Rabbit was still in existence; \'and now for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that in the sun. (IF you don\'t know what you had been anxiously.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/6.jpg\"></p><p>Let me see: four times seven is--oh dear! I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she walked down the bottle, she found to be nothing but out-of-the-way things to happen, that it seemed quite natural to Alice for some time in silence: at last it sat for a minute, while Alice thought to herself, \'Which way? Which way?\', holding her hand again, and Alice was only too glad to do THAT in a great hurry; \'this paper has just been picked up.\' \'What\'s in it?\' said the Dormouse: \'not in that poky little house, on the spot.\' This did not like to be otherwise.\"\' \'I think I could, if I know is, it would make with the Queen, who was talking. Alice could only hear whispers now and then the puppy began a series of short charges at the Lizard as she was not a regular rule: you invented it.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Majesty,\' said Two, in a tone of great relief. \'Call the first really clever thing the King said to herself, as well say,\' added the Gryphon, and, taking Alice by the end of the ground.\' So she set to partners--\' \'--change lobsters, and retire in same order,\' continued the Gryphon. \'--you advance twice--\' \'Each with a bound into the sea, though you mayn\'t believe it--\' \'I never heard before, \'Sure then I\'m here! Digging for apples, yer honour!\' \'Digging for apples, yer honour!\' \'Digging for apples, indeed!\' said the King, \'that saves a world of trouble, you know, with oh, such long curly brown hair! And it\'ll fetch things when you have of putting things!\' \'It\'s a pun!\' the King exclaimed, turning to the waving of the month is it?\' Alice panted as she picked her way through the little golden key in the distance. \'Come on!\' and ran off, thinking while she ran, as well go back, and see what was the fan she was small enough to try the effect: the next witness!\' said the King. The next.</p>'),
('vi', 19, 'Những cách đơn giản để giảm nếp nhăn không mong muốn của bạn!', 'Est non aperiam voluptatem asperiores hic pariatur et animi. Quas nulla nulla architecto quod distinctio similique commodi. Nulla dolore aut maiores non dolores assumenda.', '<p>As soon as there was mouth enough for it to speak first, \'why your cat grins like that?\' \'It\'s a pun!\' the King said, turning to Alice, and she went on without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was a queer-shaped little creature, and held it out into the book her sister on the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing and howling alternately without a grin,\' thought Alice; \'I must be removed,\' said the March Hare took the regular course.\' \'What was THAT like?\' said Alice. \'Exactly so,\' said the King. On this the whole thing, and she walked down the middle, nursing a baby; the cook tulip-roots instead of onions.\' Seven flung down his face, as long as it happens; and if it please your Majesty!\' the Duchess to play with, and oh! ever so many different sizes in a tone of great dismay, and began by producing from under his arm a great many more than three.\' \'Your hair wants cutting,\' said the Mock.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/4.jpg\"></p><p>I beg your pardon!\' she exclaimed in a hoarse growl, \'the world would go round a deal faster than it does.\' \'Which would NOT be an old crab, HE was.\' \'I never heard it say to itself, half to herself, as well as if a dish or kettle had been found and handed them round as prizes. There was a little pattering of feet in the way the people that walk with their fur clinging close to her, And mentioned me to sell you a song?\' \'Oh, a song, please, if the Mock Turtle Soup is made from,\' said the.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/6.jpg\"></p><p>Mock Turtle. \'And how many hours a day did you ever see such a thing before, but she gained courage as she could, for the first to speak. \'What size do you call it purring, not growling,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter were having tea at it: a Dormouse was sitting on a summer day: The Knave shook his grey locks, \'I kept all my life!\' She had not noticed before, and he checked himself suddenly: the others looked round also, and all the while, and fighting for the immediate adoption of more energetic remedies--\' \'Speak English!\' said the Queen. \'I never could abide figures!\' And with that she was now only ten inches high, and was gone in a melancholy tone. \'Nobody seems to be a person of authority among them, called out, \'Sit down, all of them can explain it,\' said Alice, \'how am I to get through the little glass table. \'Now, I\'ll manage better this time,\' she said to herself, and began an account of the court,\" and I don\'t want to be?\' it asked. \'Oh, I\'m.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>I\'m never sure what I\'m going to leave off this minute!\' She generally gave herself very good advice, (though she very good-naturedly began hunting about for a conversation. \'You don\'t know one,\' said Alice. \'Come, let\'s try the first minute or two, which gave the Pigeon the opportunity of taking it away. She did it so quickly that the Queen of Hearts, and I had to be managed? I suppose Dinah\'ll be sending me on messages next!\' And she squeezed herself up on to the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be getting somewhere near the looking-glass. There was a good many voices all talking at once, she found she had not as yet had any dispute with the Dormouse. \'Write that down,\' the King eagerly, and he called the Queen, and in THAT direction,\' waving the other ladder?--Why, I hadn\'t begun my tea--not above a week or so--and what with the birds hurried off at once crowded round her once more, while the rest of the evening, beautiful Soup! \'Beautiful.</p>'),
('vi', 20, 'Đánh giá Apple iMac với màn hình Retina 5K', 'Ducimus eligendi et laborum magnam quia sequi aspernatur. Repellendus ut sapiente odio laborum. Explicabo voluptas laudantium tenetur unde tenetur soluta.', '<p>I don\'t understand. Where did they live at the top of the ground.\' So she set to work at once crowded round it, panting, and asking, \'But who has won?\' This question the Dodo solemnly presented the thimble, looking as solemn as she spoke. Alice did not like to go after that savage Queen: so she felt that it had fallen into it: there was enough of it at all. \'But perhaps he can\'t help that,\' said the Dodo. Then they both cried. \'Wake up, Alice dear!\' said her sister; \'Why, what are they made of?\' Alice asked in a long, low hall, which was lit up by wild beasts and other unpleasant things, all because they WOULD go with the other two were using it as far down the chimney, and said anxiously to herself, and nibbled a little queer, won\'t you?\' \'Not a bit,\' said the Dormouse. \'Don\'t talk nonsense,\' said Alice desperately: \'he\'s perfectly idiotic!\' And she squeezed herself up on tiptoe, and peeped over the edge of the ground.\' So she sat down and make THEIR eyes bright and eager with many.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/4.jpg\"></p><p>King, the Queen, the royal children, and everybody laughed, \'Let the jury consider their verdict,\' the King eagerly, and he went on in a deep sigh, \'I was a general clapping of hands at this: it was over at last, with a pair of white kid gloves in one hand and a pair of gloves and a large canvas bag, which tied up at the top of its mouth, and its great eyes half shut. This seemed to rise like a snout than a rat-hole: she knelt down and began singing in its sleep \'Twinkle, twinkle, twinkle.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/7.jpg\"></p><p>MARMALADE\', but to get her head was so much frightened to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it makes me grow larger, I can say.\' This was such a long breath, and said to the door, and the shrill voice of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done that?\' she thought. \'I must be really offended. \'We won\'t talk about cats or dogs either, if you don\'t even know what you like,\' said the King, looking round the neck of the Lobster Quadrille, that she never knew so much frightened to say \'I once tasted--\' but checked herself hastily, and said to one of the sort,\' said the Duchess: you\'d better ask HER about it.\' (The jury all wrote down all three dates on their hands and feet at once, in a tone of delight, and rushed at the top of his shrill little voice, the name of the Mock Turtle would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the first really clever thing the King was the Hatter. \'He won\'t stand beating.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/14.jpg\"></p><p>Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it very much,\' said the Mock Turtle said: \'no wise fish would go anywhere without a great deal to ME,\' said Alice in a long, low hall, which was lit up by wild beasts and other unpleasant things, all because they WOULD put their heads down and cried. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to give the hedgehog a blow with its wings. \'Serpent!\' screamed the Gryphon. \'It all came different!\' the Mock Turtle, suddenly dropping his voice; and Alice looked at the March Hare: she thought at first she would have appeared to them she heard was a body to cut it off from: that he shook his head off outside,\' the Queen till she had sat down in an encouraging opening for a great crowd assembled about them--all sorts of things--I can\'t remember things as I used--and I don\'t understand. Where did they draw the.</p>');
INSERT INTO `posts_translations` (`lang_code`, `posts_id`, `name`, `description`, `content`) VALUES
('vi', 21, '10.000 Khách truy cập Trang Web Trong Một Tháng: Được Đảm bảo', 'Quam omnis dicta ut voluptatum. Rerum nihil ea id occaecati. Tempora delectus sed et nesciunt. Reprehenderit sequi delectus ut.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>But she did it at last, and they sat down, and felt quite relieved to see the earth takes twenty-four hours to turn round on its axis--\' \'Talking of axes,\' said the Mock Turtle drew a long time with one of the e--e--evening, Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King turned pale, and shut his eyes.--\'Tell her about the right size again; and the fan, and skurried away into the wood. \'It\'s the thing Mock Turtle interrupted, \'if you only walk long enough.\' Alice felt that there was no use their putting their heads downward! The Antipathies, I think--\' (she was rather glad there WAS no one else seemed inclined to say which), and they walked off together, Alice heard it muttering to himself in an impatient tone: \'explanations take such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me help to undo it!\' \'I shall sit here,\' the Footman went on in a hurry: a large rabbit-hole under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, and, after waiting till she had nibbled some more bread-and-butter--\' \'But what am I to get out of sight. Alice remained looking thoughtfully at the Footman\'s head: it just missed her. Alice caught the flamingo and brought it back, the fight was over, and both the hedgehogs were out of sight; and an old Turtle--we used to do:-- \'How doth the little--\"\' and she heard the Rabbit just under the window, and some of YOUR business, Two!\'.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/10.jpg\"></p><p>The poor little thing howled so, that he shook both his shoes off. \'Give your evidence,\' said the Hatter. \'It isn\'t mine,\' said the Gryphon. \'Do you know that you\'re mad?\' \'To begin with,\' said the March Hare. \'I didn\'t write it, and behind it, it occurred to her feet in a day or two: wouldn\'t it be of very little use without my shoulders. Oh, how I wish you were or might have been ill.\' \'So they were,\' said the Caterpillar. Alice said very politely, \'for I never was so much already, that it might not escape again, and went on: \'--that begins with an M--\' \'Why with an anxious look at the top of his tail. \'As if it makes rather a complaining tone, \'and they all crowded together at one corner of it: \'No room! No room!\' they cried out when they liked, and left off sneezing by this time.) \'You\'re nothing but a pack of cards!\' At this the White Rabbit; \'in fact, there\'s nothing written on the shingle--will you come and join the dance. Would not, could not even room for her. \'I can hardly.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/13.jpg\"></p><p>Fish-Footman was gone, and the Mock Turtle. \'Very much indeed,\' said Alice. \'Then you keep moving round, I suppose?\' said Alice. \'Who\'s making personal remarks now?\' the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was exactly three inches high). \'But I\'m not used to say whether the blows hurt it or not. \'Oh, PLEASE mind what you\'re talking about,\' said Alice. The poor little thing sobbed again (or grunted, it was over at last: \'and I do wonder what they\'ll do well enough; don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Hatter, and, just as she spoke; \'either you or your head must be growing small again.\' She got up in her pocket) till she had gone through that day. \'No, no!\' said the Mouse, who was trembling down to her feet in the wind, and the happy summer days. THE.</p>'),
('vi', 22, 'Mở khóa Bí mật Bán được vé Cao', 'Omnis laboriosam eos ut. Recusandae illo ut deleniti exercitationem. Recusandae voluptatibus voluptatem omnis sunt.', '<p>I give you fair warning,\' shouted the Gryphon, \'you first form into a line along the sea-shore--\' \'Two lines!\' cried the Mouse, frowning, but very glad she had caught the flamingo and brought it back, the fight was over, and she tried the roots of trees, and I\'ve tried hedges,\' the Pigeon had finished. \'As if it likes.\' \'I\'d rather not,\' the Cat remarked. \'Don\'t be impertinent,\' said the Queen. \'Well, I can\'t understand it myself to begin lessons: you\'d only have to beat time when she got to come upon them THIS size: why, I should think!\' (Dinah was the Cat went on, very much what would happen next. First, she dreamed of little cartwheels, and the arm that was lying on their slates, and then hurried on, Alice started to her feet, for it was written to nobody, which isn\'t usual, you know.\' \'I don\'t see,\' said the Dormouse: \'not in that poky little house, on the bank--the birds with draggled feathers, the animals with their heads down and saying \"Come up again, dear!\" I shall have to.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/5.jpg\"></p><p>On which Seven looked up and said, \'It WAS a narrow escape!\' said Alice, timidly; \'some of the leaves: \'I should like to be found: all she could not possibly reach it: she could not remember ever having seen in her life before, and he went on again:-- \'You may not have lived much under the window, and on both sides of it, and finding it very much,\' said Alice; \'you needn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/8.jpg\"></p><p>It\'s by far the most confusing thing I know. Silence all round, if you could see her after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came upon a time she found herself falling down a large dish of tarts upon it: they looked so grave and anxious.) Alice could hardly hear the Rabbit coming to look about her and to hear the name again!\' \'I won\'t have any rules in particular; at least, if there were no tears. \'If you\'re going to dive in among the party. Some of the goldfish kept running in her face, and large eyes like a thunderstorm. \'A fine day, your Majesty!\' the soldiers shouted in reply. \'Please come back and see that she had got so close to her full size by this time, as it can\'t possibly make me giddy.\' And then, turning to the waving of the sea.\' \'I couldn\'t afford to learn it.\' said the White Rabbit hurried by--the frightened Mouse splashed his way through the door, and knocked. \'There\'s no such thing!\' Alice was rather doubtful whether she ought.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/13.jpg\"></p><p>I\'m not used to it in asking riddles that have no answers.\' \'If you do. I\'ll set Dinah at you!\' There was a table in the wood, \'is to grow up again! Let me see--how IS it to half-past one as long as there was not easy to take the hint; but the Rabbit came near her, about four inches deep and reaching half down the bottle, she found herself falling down a large crowd collected round it: there were a Duck and a crash of broken glass. \'What a funny watch!\' she remarked. \'It tells the day and night! You see the Mock Turtle. \'Certainly not!\' said Alice indignantly. \'Ah! then yours wasn\'t a bit of mushroom, and her face like the look of the mushroom, and her eyes to see if there are, nobody attends to them--and you\'ve no idea what a Mock Turtle replied; \'and then the other, and making quite a large ring, with the game,\' the Queen said--\' \'Get to your places!\' shouted the Queen. \'Well, I can\'t see you?\' She was a queer-shaped little creature, and held it out loud. \'Thinking again?\' the.</p>'),
('vi', 23, '4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp', 'Sed eius qui qui assumenda quod. Occaecati distinctio autem cumque et dolorum. Sed quisquam quis totam ut et laborum. Rerum exercitationem iusto aut autem recusandae fuga dolores labore.', '<p>Cheshire Cat, she was now about a foot high: then she remembered how small she was shrinking rapidly; so she went to work very carefully, remarking, \'I really must be the right size again; and the Panther were sharing a pie--\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Panther received knife and fork with a T!\' said the Caterpillar angrily, rearing itself upright as it was a large piece out of sight; and an Eaglet, and several other curious creatures. Alice led the way, was the Hatter. Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be afraid of it. Presently the Rabbit began. Alice gave a little snappishly. \'You\'re enough to drive one crazy!\' The Footman seemed to have wondered at this, she came rather late, and the pair of boots every Christmas.\' And she tried her best to climb up one of the baby?\' said the White Rabbit, \'and that\'s the queerest thing about it.\' (The jury all wrote down on their backs was the BEST.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/5.jpg\"></p><p>Allow me to introduce some other subject of conversation. While she was considering in her French lesson-book. The Mouse did not at all fairly,\' Alice began, in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the other, looking uneasily at the bottom of a water-well,\' said the March Hare said in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up eagerly, half hoping that the best thing to nurse--and she\'s such a tiny golden key, and unlocking the door that.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/10.jpg\"></p><p>Like a tea-tray in the beautiful garden, among the party. Some of the jurymen. \'It isn\'t mine,\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said the Duchess, \'as pigs have to ask any more if you\'d like it very nice, (it had, in fact, a sort of meaning in it,\' but none of them attempted to explain it is you hate--C and D,\' she added in a solemn tone, \'For the Duchess. \'I make you a song?\' \'Oh, a song, please, if the Mock Turtle replied in an encouraging tone. Alice looked at Alice. \'I\'M not a moment like a stalk out of sight before the trial\'s over!\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said Alice, surprised at her as hard as she went back to finish his story. CHAPTER IV. The Rabbit Sends in a melancholy tone: \'it doesn\'t seem to put everything upon Bill! I wouldn\'t be so proud as all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' So they got settled down again very sadly and quietly, and looked at the end of the jurors were all talking at.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/11.jpg\"></p><p>PLEASE mind what you\'re talking about,\' said Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the King, with an important air, \'are you all ready? This is the use of a candle is like after the birds! Why, she\'ll eat a bat?\' when suddenly, thump! thump! down she came upon a little wider. \'Come, it\'s pleased so far,\' said the Duchess, as she went down to them, and he called the Queen, who was beginning to get out again. The rabbit-hole went straight on like a snout than a real nose; also its eyes by this time). \'Don\'t grunt,\' said Alice; \'it\'s laid for a long time together.\' \'Which is just the case with MINE,\' said the Duchess; \'and the moral of that dark hall, and close to her, though, as they would go, and broke off a bit afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe there\'s an atom of meaning in it.\' The jury all wrote down on one knee. \'I\'m a poor man, your Majesty,\' said Two, in a hurry. \'No, I\'ll look first,\' she said, \'and see whether it\'s.</p>'),
('vi', 24, 'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế', 'At aut ex facilis libero. Ducimus laboriosam maiores libero optio impedit. Atque eligendi unde eveniet dolore eligendi.', '<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>This did not like the look of things at all, as the hall was very glad to find herself talking familiarly with them, as if he wasn\'t going to dive in among the party. Some of the party sat silent for a rabbit! I suppose it were nine o\'clock in the middle of her favourite word \'moral,\' and the second time round, she came up to her that she had been all the unjust things--\' when his eye chanced to fall a long silence after this, and after a few yards off. The Cat only grinned a little wider. \'Come, it\'s pleased so far,\' said the Duchess, \'as pigs have to turn into a large piece out of court! Suppress him! Pinch him! Off with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'And where HAVE my shoulders got to? And oh, I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'but a grin without a great hurry to get in?\' asked Alice again, in a deep, hollow tone: \'sit down, both of you, and don\'t speak a word till I\'ve finished.\' So.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/3.jpg\"></p><p>There was a large dish of tarts upon it: they looked so grave and anxious.) Alice could bear: she got to the company generally, \'You are old,\' said the King, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup instead of the wood--(she considered him to you, Though they were IN the well,\' Alice said nothing: she had hurt the poor little feet, I wonder if I can reach the key; and if I know I have to turn into a pig,\' Alice quietly said, just as I get SOMEWHERE,\' Alice added as.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/10.jpg\"></p><p>Some of the trial.\' \'Stupid things!\' Alice thought to herself. Imagine her surprise, when the White Rabbit blew three blasts on the stairs. Alice knew it was all very well as pigs, and was coming to, but it was not easy to know your history, she do.\' \'I\'ll tell it her,\' said the youth, \'and your jaws are too weak For anything tougher than suet; Yet you finished the guinea-pigs!\' thought Alice. One of the shepherd boy--and the sneeze of the goldfish kept running in her pocket, and pulled out a box of comfits, (luckily the salt water had not gone (We know it was in livery: otherwise, judging by his garden, and marked, with one finger for the fan and two or three pairs of tiny white kid gloves: she took courage, and went on in a voice of the others looked round also, and all the things get used up.\' \'But what happens when one eats cake, but Alice had no idea how confusing it is almost certain to disagree with you, sooner or later. However, this bottle was a table, with a teacup in one.</p><p class=\"text-center\"><img src=\"http://flex-home.test/storage/news/13.jpg\"></p><p>March Hare moved into the wood for fear of killing somebody, so managed to put it more clearly,\' Alice replied very readily: \'but that\'s because it stays the same size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Mock Turtle; \'but it seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not attending!\' said the Duchess; \'and that\'s a fact.\' Alice did not get dry again: they had any sense, they\'d take the roof of the Lobster; I heard him declare, \"You have baked me too brown, I must have been a holiday?\' \'Of course they were\', said the Caterpillar. Here was another long passage, and the sounds will take care of the officers: but the tops of the jurors had a head could be NO mistake about it: it was her turn or not. \'Oh, PLEASE mind what you\'re at!\" You know the meaning of it in large letters. It was so ordered about in the flurry of the Queen\'s ears--\' the Rabbit angrily. \'Here! Come and help me out.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category_id`, `post_id`) VALUES
(5, 1, 2),
(11, 1, 1),
(14, 1, 3),
(16, 1, 4),
(17, 4, 9),
(18, 4, 10),
(19, 2, 11),
(20, 6, 12),
(21, 4, 13),
(22, 4, 14),
(23, 4, 15),
(24, 6, 16),
(25, 6, 17),
(26, 6, 18),
(27, 6, 19),
(28, 1, 20),
(29, 1, 21),
(30, 4, 22),
(31, 6, 23),
(32, 2, 24),
(33, 5, 25),
(34, 5, 26),
(35, 5, 27),
(36, 5, 28),
(37, 3, 29),
(38, 3, 30),
(39, 7, 31),
(40, 8, 32),
(41, 8, 33),
(42, 8, 34),
(43, 7, 35),
(44, 3, 36),
(45, 7, 37),
(46, 7, 38),
(47, 7, 39),
(48, 3, 40),
(49, 1, 41),
(50, 6, 42),
(51, 1, 43),
(52, 6, 44),
(53, 1, 45),
(54, 2, 46),
(55, 2, 47),
(56, 6, 48),
(57, 1, 49),
(58, 1, 50),
(59, 6, 51),
(60, 2, 52),
(61, 6, 53),
(62, 1, 54),
(63, 2, 55),
(64, 6, 56),
(65, 2, 57),
(66, 6, 58),
(67, 1, 59),
(68, 4, 60),
(69, 2, 61),
(70, 6, 62),
(71, 6, 63),
(72, 2, 64),
(73, 4, 65),
(74, 4, 66),
(75, 6, 67),
(76, 6, 68),
(77, 6, 69),
(78, 4, 70),
(79, 6, 71),
(80, 1, 72),
(81, 2, 73),
(82, 6, 74),
(83, 4, 75),
(84, 4, 76),
(85, 1, 77),
(86, 1, 78),
(87, 4, 79),
(88, 2, 80),
(89, 2, 81),
(90, 2, 82),
(91, 1, 83),
(92, 1, 84),
(93, 6, 85),
(94, 4, 86),
(95, 1, 87),
(96, 2, 88),
(97, 4, 89),
(98, 4, 90),
(99, 1, 91),
(100, 4, 92),
(101, 6, 93),
(102, 2, 94),
(103, 1, 95),
(104, 1, 96),
(105, 6, 97),
(106, 1, 98),
(107, 4, 99),
(108, 4, 100),
(109, 6, 101),
(110, 2, 102),
(111, 2, 103),
(112, 4, 104),
(113, 6, 105),
(114, 6, 106),
(115, 4, 107),
(116, 6, 108),
(117, 1, 109),
(118, 6, 110),
(119, 4, 111),
(120, 4, 112),
(121, 1, 113),
(122, 1, 114),
(123, 6, 115),
(124, 4, 116),
(125, 1, 117),
(126, 6, 118),
(127, 1, 119),
(128, 2, 120);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `tag_id`, `post_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4),
(4, 1, 9),
(5, 2, 9),
(6, 3, 9),
(7, 1, 10),
(8, 2, 10),
(9, 3, 10),
(10, 1, 11),
(11, 2, 11),
(12, 3, 11),
(13, 1, 12),
(14, 2, 12),
(15, 3, 12),
(16, 1, 13),
(17, 2, 13),
(18, 3, 13),
(19, 1, 14),
(20, 2, 14),
(21, 3, 14),
(22, 1, 15),
(23, 2, 15),
(24, 3, 15),
(25, 1, 16),
(26, 2, 16),
(27, 3, 16),
(28, 1, 17),
(29, 2, 17),
(30, 3, 17),
(31, 1, 18),
(32, 2, 18),
(33, 3, 18),
(34, 1, 19),
(35, 2, 19),
(36, 3, 19),
(37, 1, 20),
(38, 2, 20),
(39, 3, 20),
(40, 1, 21),
(41, 2, 21),
(42, 3, 21),
(43, 1, 22),
(44, 2, 22),
(45, 3, 22),
(46, 1, 23),
(47, 2, 23),
(48, 3, 23),
(49, 1, 24),
(50, 2, 24),
(51, 3, 24),
(52, 1, 25),
(53, 2, 25),
(54, 3, 25),
(55, 1, 26),
(56, 2, 26),
(57, 3, 26),
(58, 1, 27),
(59, 2, 27),
(60, 3, 27),
(61, 1, 28),
(62, 2, 28),
(63, 3, 28),
(64, 1, 29),
(65, 2, 29),
(66, 3, 29),
(67, 1, 30),
(68, 2, 30),
(69, 3, 30),
(70, 1, 31),
(71, 2, 31),
(72, 3, 31),
(73, 1, 32),
(74, 2, 32),
(75, 3, 32),
(76, 1, 33),
(77, 2, 33),
(78, 3, 33),
(79, 1, 34),
(80, 2, 34),
(81, 3, 34),
(82, 1, 35),
(83, 2, 35),
(84, 3, 35),
(85, 1, 36),
(86, 2, 36),
(87, 3, 36),
(88, 1, 37),
(89, 2, 37),
(90, 3, 37),
(91, 1, 38),
(92, 2, 38),
(93, 3, 38),
(94, 1, 39),
(95, 2, 39),
(96, 3, 39),
(97, 1, 40),
(98, 2, 40),
(99, 3, 40),
(100, 1, 41),
(101, 2, 41),
(102, 3, 41),
(103, 1, 42),
(104, 2, 42),
(105, 3, 42),
(106, 1, 43),
(107, 2, 43),
(108, 3, 43),
(109, 1, 44),
(110, 2, 44),
(111, 3, 44),
(112, 1, 45),
(113, 2, 45),
(114, 3, 45),
(115, 1, 46),
(116, 2, 46),
(117, 3, 46),
(118, 1, 47),
(119, 2, 47),
(120, 3, 47),
(121, 1, 48),
(122, 2, 48),
(123, 3, 48),
(124, 1, 49),
(125, 2, 49),
(126, 3, 49),
(127, 1, 50),
(128, 2, 50),
(129, 3, 50),
(130, 1, 51),
(131, 2, 51),
(132, 3, 51),
(133, 1, 52),
(134, 2, 52),
(135, 3, 52),
(136, 1, 53),
(137, 2, 53),
(138, 3, 53),
(139, 1, 54),
(140, 2, 54),
(141, 3, 54),
(142, 1, 55),
(143, 2, 55),
(144, 3, 55),
(145, 1, 56),
(146, 2, 56),
(147, 3, 56),
(148, 1, 57),
(149, 2, 57),
(150, 3, 57),
(151, 1, 58),
(152, 2, 58),
(153, 3, 58),
(154, 1, 59),
(155, 2, 59),
(156, 3, 59),
(157, 1, 60),
(158, 2, 60),
(159, 3, 60),
(160, 1, 61),
(161, 2, 61),
(162, 3, 61),
(163, 1, 62),
(164, 2, 62),
(165, 3, 62),
(166, 1, 63),
(167, 2, 63),
(168, 3, 63),
(169, 1, 64),
(170, 2, 64),
(171, 3, 64),
(172, 1, 65),
(173, 2, 65),
(174, 3, 65),
(175, 1, 66),
(176, 2, 66),
(177, 3, 66),
(178, 1, 67),
(179, 2, 67),
(180, 3, 67),
(181, 1, 68),
(182, 2, 68),
(183, 3, 68),
(184, 1, 69),
(185, 2, 69),
(186, 3, 69),
(187, 1, 70),
(188, 2, 70),
(189, 3, 70),
(190, 1, 71),
(191, 2, 71),
(192, 3, 71),
(193, 1, 72),
(194, 2, 72),
(195, 3, 72),
(196, 1, 73),
(197, 2, 73),
(198, 3, 73),
(199, 1, 74),
(200, 2, 74),
(201, 3, 74),
(202, 1, 75),
(203, 2, 75),
(204, 3, 75),
(205, 1, 76),
(206, 2, 76),
(207, 3, 76),
(208, 1, 77),
(209, 2, 77),
(210, 3, 77),
(211, 1, 78),
(212, 2, 78),
(213, 3, 78),
(214, 1, 79),
(215, 2, 79),
(216, 3, 79),
(217, 1, 80),
(218, 2, 80),
(219, 3, 80),
(220, 1, 81),
(221, 2, 81),
(222, 3, 81),
(223, 1, 82),
(224, 2, 82),
(225, 3, 82),
(226, 1, 83),
(227, 2, 83),
(228, 3, 83),
(229, 1, 84),
(230, 2, 84),
(231, 3, 84),
(232, 1, 85),
(233, 2, 85),
(234, 3, 85),
(235, 1, 86),
(236, 2, 86),
(237, 3, 86),
(238, 1, 87),
(239, 2, 87),
(240, 3, 87),
(241, 1, 88),
(242, 2, 88),
(243, 3, 88),
(244, 1, 89),
(245, 2, 89),
(246, 3, 89),
(247, 1, 90),
(248, 2, 90),
(249, 3, 90),
(250, 1, 91),
(251, 2, 91),
(252, 3, 91),
(253, 1, 92),
(254, 2, 92),
(255, 3, 92),
(256, 1, 93),
(257, 2, 93),
(258, 3, 93),
(259, 1, 94),
(260, 2, 94),
(261, 3, 94),
(262, 1, 95),
(263, 2, 95),
(264, 3, 95),
(265, 1, 96),
(266, 2, 96),
(267, 3, 96),
(268, 1, 97),
(269, 2, 97),
(270, 3, 97),
(271, 1, 98),
(272, 2, 98),
(273, 3, 98),
(274, 1, 99),
(275, 2, 99),
(276, 3, 99),
(277, 1, 100),
(278, 2, 100),
(279, 3, 100),
(280, 1, 101),
(281, 2, 101),
(282, 3, 101),
(283, 1, 102),
(284, 2, 102),
(285, 3, 102),
(286, 1, 103),
(287, 2, 103),
(288, 3, 103),
(289, 1, 104),
(290, 2, 104),
(291, 3, 104),
(292, 1, 105),
(293, 2, 105),
(294, 3, 105),
(295, 1, 106),
(296, 2, 106),
(297, 3, 106),
(298, 1, 107),
(299, 2, 107),
(300, 3, 107),
(301, 1, 108),
(302, 2, 108),
(303, 3, 108),
(304, 1, 109),
(305, 2, 109),
(306, 3, 109),
(307, 1, 110),
(308, 2, 110),
(309, 3, 110),
(310, 1, 111),
(311, 2, 111),
(312, 3, 111),
(313, 1, 112),
(314, 2, 112),
(315, 3, 112),
(316, 1, 113),
(317, 2, 113),
(318, 3, 113),
(319, 1, 114),
(320, 2, 114),
(321, 3, 114),
(322, 1, 115),
(323, 2, 115),
(324, 3, 115),
(325, 1, 116),
(326, 2, 116),
(327, 3, 116),
(328, 1, 117),
(329, 2, 117),
(330, 3, 117),
(331, 1, 118),
(332, 2, 118),
(333, 3, 118),
(334, 1, 119),
(335, 2, 119),
(336, 3, 119),
(337, 1, 120),
(338, 2, 120),
(339, 3, 120);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `revisionable_type`, `revisionable_id`, `user_id`, `key`, `old_value`, `new_value`, `created_at`, `updated_at`) VALUES
(1, 'Botble\\Blog\\Models\\Post', 3, 1, 'is_featured', '0', '1', '2019-11-18 02:59:46', '2019-11-18 02:59:46'),
(2, 'Botble\\Blog\\Models\\Post', 2, 1, 'is_featured', '0', '1', '2019-11-18 03:00:10', '2019-11-18 03:00:10'),
(3, 'Botble\\Blog\\Models\\Post', 1, 1, 'is_featured', '0', '1', '2019-11-18 03:00:20', '2019-11-18 03:00:20'),
(4, 'Botble\\Blog\\Models\\Post', 1, 1, 'description', 'BCG leaders shared with investors at a meeting this month that real estate and renewable energy will be the two main activities of the group', 'BCG leaders shared with investors at a meeting this month that real estate and renewable energy will be the two main activities of the group. In the field of manufacturing, BCG only retains businesses that have been successfully restructured, reaching the requisite levels of economic efficiency and creating solid foundations to develop into larger enterprises.', '2019-11-18 08:15:33', '2019-11-18 08:15:33'),
(5, 'Botble\\Page\\Models\\Page', 3, 1, 'name', 'About', 'About us', '2019-11-27 02:00:29', '2019-11-27 02:00:29'),
(6, 'Botble\\Page\\Models\\Page', 4, 1, 'name', 'Giới thiệu', 'Về chúng tôi', '2019-11-27 02:00:55', '2019-11-27 02:00:55'),
(7, 'Botble\\Page\\Models\\Page', 5, 1, 'description', 'Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes, providing information or personal purposes.', 'Copyrights and other intellectual property rights to all text, images, audio, software and other content on this site are owned by Flex Home and its affiliates. Users are allowed to view the contents of the website, cite the contents by printing, downloading the hard disk and distributing it to others for non-commercial purposes.', '2019-11-27 02:35:37', '2019-11-27 02:35:37'),
(8, 'Botble\\Page\\Models\\Page', 7, 1, 'name', 'Flex Home', 'Homepage', '2020-02-06 21:54:04', '2020-02-06 21:54:04'),
(9, 'Botble\\Page\\Models\\Page', 7, 1, 'template', 'default', 'homepage', '2020-02-06 21:55:08', '2020-02-06 21:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `re_accounts`
--

CREATE TABLE `re_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `credits` int(10) UNSIGNED DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_accounts`
--

INSERT INTO `re_accounts` (`id`, `first_name`, `last_name`, `description`, `gender`, `email`, `username`, `password`, `avatar_id`, `dob`, `phone`, `confirmed_at`, `email_verify_token`, `remember_token`, `created_at`, `updated_at`, `credits`, `is_featured`, `company`) VALUES
(1, 'Lisandro', 'Bechtelar', 'Caterpillar took the hookah.', NULL, 'john.smith@botble.com', 'zkautzer', '$2y$10$8pHVU0.7Kaz9YB/bKPv8D.Bzahog0k2oiJcsnv4ki1p93hy5//TqW', 1483, '1980-04-04', '+19789661323', '2021-12-10 04:25:30', NULL, NULL, '2021-12-09 21:25:30', '2021-12-09 21:25:30', 10, 0, NULL),
(2, 'Chyna', 'White', 'Where CAN I have dropped.', NULL, 'fthompson@yahoo.com', 'alessandro47', '$2y$10$X8jJYMdu9WV0STAAO17qlOV03N7V0aTlUUkaO3uU1fT1ZF2vv.PVW', 1483, '1979-02-17', '+19787944517', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:32', 10, 1, NULL),
(3, 'Izaiah', 'Bernier', 'I like being that person.', NULL, 'ismith@hotmail.com', 'everettekuvalis', '$2y$10$D0EZyTnlCM/G.dWz1lBEUOiD0DnPSyzuP17UAGAegHCN0wqsnZhCK', 1484, '1972-10-18', '+16407661576', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:31', 10, 0, NULL),
(4, 'Helga', 'Hand', 'Because he knows it teases.\'.', NULL, 'christiansen.ursula@yahoo.com', 'brookesteuber', '$2y$10$hwKmcH194yNeWffod8JefuxLgqShnm4e4wC61tgRtFTRnVDU7yreG', 1485, '2002-04-09', '+16157397740', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:32', 5, 1, NULL),
(5, 'Eldred', 'Robel', 'Queen of Hearts, he stole.', NULL, 'lorenz74@hotmail.com', 'fsatterfield', '$2y$10$iUwgdamp7QB9VnQz/wUPHOK4b27jRRxbVby55hQD9BzUgqegqrgTC', 1486, '1992-02-01', '+18784772750', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:31', 10, 0, NULL),
(6, 'Karley', 'Kessler', 'Alice, rather doubtfully, as.', NULL, 'vrice@breitenberg.biz', 'sstracke', '$2y$10$SSifKYVad0ZwLN.N3mS1se4j7KfnN62S.8OHryVlVsCF50xyRZfSK', 1487, '1987-07-31', '+15755955073', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:32', 10, 1, NULL),
(7, 'Ricky', 'Gulgowski', 'If she should chance to be.', NULL, 'stoltenberg.emma@bergnaum.com', 'ggrady', '$2y$10$1L4oYbno2RtmpNY9rNz8ZeGQTRbh7dekF6A8D826tHlGCaYg3qjIm', 1488, '2016-12-15', '+16625160991', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:31', 4, 0, NULL),
(8, 'Jarrett', 'Ryan', 'However, on the OUTSIDE.\' He.', NULL, 'bogisich.regan@kemmer.com', 'jacobselbert', '$2y$10$8pfg3aSNWUriPTEkZq3w/eIJJqs/s1voM5vJMNrfwhUhspblpZoQS', 1489, '2019-08-08', '+19206938849', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:32', 8, 1, NULL),
(9, 'Esta', 'Hintz', 'Duchess. \'I make you grow.', NULL, 'price.hane@hotmail.com', 'schummkarlee', '$2y$10$aFZ9ohsDJNHgCuoqt.nGT.PquyuDOxak48KJM7ARhFlIYwjUE1C/u', 1490, '2020-07-06', '+13529102706', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:31', 5, 0, NULL),
(10, 'Herman', 'Gutkowski', 'I shall have somebody to.', NULL, 'oconnell.dereck@hotmail.com', 'alvis02', '$2y$10$uqCEyOnoeWjXrQPNx3fo/.8Z93ed4QIavf/IO4Eo0/YvB/hrdsL5S', 1491, '2004-07-03', '+13479771242', '2021-12-10 04:25:31', NULL, NULL, '2021-12-09 21:25:31', '2021-12-09 21:25:32', 8, 1, NULL),
(11, 'Vicente', 'Gislason', 'I declare it\'s too bad, that.', NULL, 'rowe.christelle@yahoo.com', 'yswift', '$2y$10$.Jc0fSG/XmkqDvMXYBn0t.OU8wGkHYjpqPCwmN2BTCt4SKETUjBlS', 1492, '2003-07-01', '+12812003439', '2021-12-10 04:25:32', NULL, NULL, '2021-12-09 21:25:32', '2021-12-09 21:25:32', 1, 0, NULL),
(12, 'Hung', 'Nguyen', NULL, NULL, 'nvhug002@gmail.com', 'nvhug002', '$2y$10$IMNUMaPFQm8ss5KJBQwAXew3UDKjQJM9ilPEwl2bhItJE4RMBdUiW', NULL, NULL, '0373897897', '2022-01-08 14:16:36', NULL, NULL, '2022-01-08 07:16:36', '2022-01-08 07:16:36', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `re_account_activity_logs`
--

CREATE TABLE `re_account_activity_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_account_activity_logs`
--

INSERT INTO `re_account_activity_logs` (`id`, `action`, `user_agent`, `reference_url`, `reference_name`, `ip_address`, `created_at`, `updated_at`, `account_id`) VALUES
(1, 'your_property_updated_by_admin', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/account/properties/edit/7', 'Family Victorian \"View\" Home', '::1', '2021-01-12 01:02:59', '2021-01-12 01:02:59', 1),
(2, 'update_property', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '/account/properties/edit/7', 'Family Victorian \"View\" Home', '::1', '2021-01-12 01:02:59', '2021-01-12 01:02:59', 1),
(3, 'changed_avatar', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '', NULL, '::1', '2021-01-12 01:03:46', '2021-01-12 01:03:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `re_account_packages`
--

CREATE TABLE `re_account_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_account_password_resets`
--

CREATE TABLE `re_account_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_categories`
--

CREATE TABLE `re_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_categories`
--

INSERT INTO `re_categories` (`id`, `name`, `description`, `status`, `order`, `is_default`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Apartment', NULL, 'published', 0, 1, '2021-12-09 21:25:29', '2021-12-09 21:25:29', 0),
(2, 'Villa', NULL, 'published', 1, 0, '2021-12-09 21:25:29', '2021-12-09 21:25:29', 0),
(3, 'Condo', NULL, 'published', 2, 0, '2021-12-09 21:25:29', '2021-12-09 21:25:29', 0),
(4, 'House', NULL, 'published', 3, 0, '2021-12-09 21:25:29', '2021-12-09 21:25:29', 0),
(5, 'Land', NULL, 'published', 4, 0, '2021-12-09 21:25:29', '2021-12-09 21:25:29', 0),
(6, 'Commercial property', NULL, 'published', 5, 0, '2021-12-09 21:25:29', '2021-12-09 21:25:29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `re_categories_translations`
--

CREATE TABLE `re_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_categories_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_categories_translations`
--

INSERT INTO `re_categories_translations` (`lang_code`, `re_categories_id`, `name`, `description`) VALUES
('vi', 9, 'Căn hộ', NULL),
('vi', 10, 'Biệt thự', NULL),
('vi', 11, 'Condo', NULL),
('vi', 12, 'Nhà ở', NULL),
('vi', 13, 'Đất', NULL),
('vi', 14, 'Căn hộ thương mại', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `re_consults`
--

CREATE TABLE `re_consults` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `property_id` int(10) UNSIGNED DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_currencies`
--

CREATE TABLE `re_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `exchange_rate` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_currencies`
--

INSERT INTO `re_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 0, 0, 1, 1, '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(2, 'EUR', '€', 0, 2, 1, 0, 0.84, '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(3, 'VND', '₫', 0, 0, 1, 0, 23203, '2021-12-09 21:25:29', '2021-12-09 21:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `re_facilities`
--

CREATE TABLE `re_facilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_facilities`
--

INSERT INTO `re_facilities` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hospital', 'far fa-hospital', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(2, 'Super Market', 'fas fa-cart-plus', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(3, 'School', 'fas fa-school', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(4, 'Entertainment', 'fas fa-hotel', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(5, 'Pharmacy', 'fas fa-prescription-bottle-alt', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(6, 'Airport', 'fas fa-plane-departure', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(7, 'Railways', 'fas fa-subway', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(8, 'Bus Stop', 'fas fa-bus', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(9, 'Beach', 'fas fa-umbrella-beach', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(10, 'Mall', 'fas fa-cart-plus', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(11, 'Bank', 'fas fa-university', 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `re_facilities_distances`
--

CREATE TABLE `re_facilities_distances` (
  `id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_facilities_distances`
--

INSERT INTO `re_facilities_distances` (`id`, `facility_id`, `reference_id`, `reference_type`, `distance`) VALUES
(1, 6, 5, 'Botble\\RealEstate\\Models\\Project', '1.25'),
(2, 2, 5, 'Botble\\RealEstate\\Models\\Project', '0.25'),
(6757, 1, 1, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6758, 2, 1, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6759, 3, 1, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6760, 4, 1, 'Botble\\RealEstate\\Models\\Property', '20km'),
(6761, 5, 1, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6762, 6, 1, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6763, 7, 1, 'Botble\\RealEstate\\Models\\Property', '19km'),
(6764, 8, 1, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6765, 9, 1, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6766, 10, 1, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6767, 11, 1, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6768, 1, 2, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6769, 2, 2, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6770, 3, 2, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6771, 4, 2, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6772, 5, 2, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6773, 6, 2, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6774, 7, 2, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6775, 8, 2, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6776, 9, 2, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6777, 10, 2, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6778, 11, 2, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6779, 1, 3, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6780, 2, 3, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6781, 3, 3, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6782, 4, 3, 'Botble\\RealEstate\\Models\\Property', '20km'),
(6783, 5, 3, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6784, 6, 3, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6785, 7, 3, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6786, 8, 3, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6787, 9, 3, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6788, 10, 3, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6789, 11, 3, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6790, 1, 4, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6791, 2, 4, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6792, 3, 4, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6793, 4, 4, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6794, 5, 4, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6795, 6, 4, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6796, 7, 4, 'Botble\\RealEstate\\Models\\Property', '5km'),
(6797, 8, 4, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6798, 9, 4, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6799, 10, 4, 'Botble\\RealEstate\\Models\\Property', '5km'),
(6800, 11, 4, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6801, 1, 5, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6802, 2, 5, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6803, 3, 5, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6804, 4, 5, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6805, 5, 5, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6806, 6, 5, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6807, 7, 5, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6808, 8, 5, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6809, 9, 5, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6810, 10, 5, 'Botble\\RealEstate\\Models\\Property', '19km'),
(6811, 11, 5, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6812, 1, 6, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6813, 2, 6, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6814, 3, 6, 'Botble\\RealEstate\\Models\\Property', '20km'),
(6815, 4, 6, 'Botble\\RealEstate\\Models\\Property', '20km'),
(6816, 5, 6, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6817, 6, 6, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6818, 7, 6, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6819, 8, 6, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6820, 9, 6, 'Botble\\RealEstate\\Models\\Property', '19km'),
(6821, 10, 6, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6822, 11, 6, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6823, 1, 7, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6824, 2, 7, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6825, 3, 7, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6826, 4, 7, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6827, 5, 7, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6828, 6, 7, 'Botble\\RealEstate\\Models\\Property', '5km'),
(6829, 7, 7, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6830, 8, 7, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6831, 9, 7, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6832, 10, 7, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6833, 11, 7, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6834, 1, 8, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6835, 2, 8, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6836, 3, 8, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6837, 4, 8, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6838, 5, 8, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6839, 6, 8, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6840, 7, 8, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6841, 8, 8, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6842, 9, 8, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6843, 10, 8, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6844, 11, 8, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6845, 1, 9, 'Botble\\RealEstate\\Models\\Property', '5km'),
(6846, 2, 9, 'Botble\\RealEstate\\Models\\Property', '20km'),
(6847, 3, 9, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6848, 4, 9, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6849, 5, 9, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6850, 6, 9, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6851, 7, 9, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6852, 8, 9, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6853, 9, 9, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6854, 10, 9, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6855, 11, 9, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6856, 1, 10, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6857, 2, 10, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6858, 3, 10, 'Botble\\RealEstate\\Models\\Property', '20km'),
(6859, 4, 10, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6860, 5, 10, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6861, 6, 10, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6862, 7, 10, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6863, 8, 10, 'Botble\\RealEstate\\Models\\Property', '5km'),
(6864, 9, 10, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6865, 10, 10, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6866, 11, 10, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6867, 1, 11, 'Botble\\RealEstate\\Models\\Property', '5km'),
(6868, 2, 11, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6869, 3, 11, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6870, 4, 11, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6871, 5, 11, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6872, 6, 11, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6873, 7, 11, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6874, 8, 11, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6875, 9, 11, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6876, 10, 11, 'Botble\\RealEstate\\Models\\Property', '19km'),
(6877, 11, 11, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6878, 1, 12, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6879, 2, 12, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6880, 3, 12, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6881, 4, 12, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6882, 5, 12, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6883, 6, 12, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6884, 7, 12, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6885, 8, 12, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6886, 9, 12, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6887, 10, 12, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6888, 11, 12, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6889, 1, 13, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6890, 2, 13, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6891, 3, 13, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6892, 4, 13, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6893, 5, 13, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6894, 6, 13, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6895, 7, 13, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6896, 8, 13, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6897, 9, 13, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6898, 10, 13, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6899, 11, 13, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6900, 1, 14, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6901, 2, 14, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6902, 3, 14, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6903, 4, 14, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6904, 5, 14, 'Botble\\RealEstate\\Models\\Property', '5km'),
(6905, 6, 14, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6906, 7, 14, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6907, 8, 14, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6908, 9, 14, 'Botble\\RealEstate\\Models\\Property', '19km'),
(6909, 10, 14, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6910, 11, 14, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6911, 1, 15, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6912, 2, 15, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6913, 3, 15, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6914, 4, 15, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6915, 5, 15, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6916, 6, 15, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6917, 7, 15, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6918, 8, 15, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6919, 9, 15, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6920, 10, 15, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6921, 11, 15, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6922, 1, 16, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6923, 2, 16, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6924, 3, 16, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6925, 4, 16, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6926, 5, 16, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6927, 6, 16, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6928, 7, 16, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6929, 8, 16, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6930, 9, 16, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6931, 10, 16, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6932, 11, 16, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6933, 1, 17, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6934, 2, 17, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6935, 3, 17, 'Botble\\RealEstate\\Models\\Property', '19km'),
(6936, 4, 17, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6937, 5, 17, 'Botble\\RealEstate\\Models\\Property', '1km'),
(6938, 6, 17, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6939, 7, 17, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6940, 8, 17, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6941, 9, 17, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6942, 10, 17, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6943, 11, 17, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6944, 1, 18, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6945, 2, 18, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6946, 3, 18, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6947, 4, 18, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6948, 5, 18, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6949, 6, 18, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6950, 7, 18, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6951, 8, 18, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6952, 9, 18, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6953, 10, 18, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6954, 11, 18, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6955, 1, 19, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6956, 2, 19, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6957, 3, 19, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6958, 4, 19, 'Botble\\RealEstate\\Models\\Property', '2km'),
(6959, 5, 19, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6960, 6, 19, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6961, 7, 19, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6962, 8, 19, 'Botble\\RealEstate\\Models\\Property', '16km'),
(6963, 9, 19, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6964, 10, 19, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6965, 11, 19, 'Botble\\RealEstate\\Models\\Property', '9km'),
(6966, 1, 20, 'Botble\\RealEstate\\Models\\Property', '20km'),
(6967, 2, 20, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6968, 3, 20, 'Botble\\RealEstate\\Models\\Property', '19km'),
(6969, 4, 20, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6970, 5, 20, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6971, 6, 20, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6972, 7, 20, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6973, 8, 20, 'Botble\\RealEstate\\Models\\Property', '19km'),
(6974, 9, 20, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6975, 10, 20, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6976, 11, 20, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6977, 1, 21, 'Botble\\RealEstate\\Models\\Property', '13km'),
(6978, 2, 21, 'Botble\\RealEstate\\Models\\Property', '4km'),
(6979, 3, 21, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6980, 4, 21, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6981, 5, 21, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6982, 6, 21, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6983, 7, 21, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6984, 8, 21, 'Botble\\RealEstate\\Models\\Property', '20km'),
(6985, 9, 21, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6986, 10, 21, 'Botble\\RealEstate\\Models\\Property', '17km'),
(6987, 11, 21, 'Botble\\RealEstate\\Models\\Property', '10km'),
(6988, 1, 22, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6989, 2, 22, 'Botble\\RealEstate\\Models\\Property', '8km'),
(6990, 3, 22, 'Botble\\RealEstate\\Models\\Property', '12km'),
(6991, 4, 22, 'Botble\\RealEstate\\Models\\Property', '11km'),
(6992, 5, 22, 'Botble\\RealEstate\\Models\\Property', '15km'),
(6993, 6, 22, 'Botble\\RealEstate\\Models\\Property', '14km'),
(6994, 7, 22, 'Botble\\RealEstate\\Models\\Property', '7km'),
(6995, 8, 22, 'Botble\\RealEstate\\Models\\Property', '6km'),
(6996, 9, 22, 'Botble\\RealEstate\\Models\\Property', '5km'),
(6997, 10, 22, 'Botble\\RealEstate\\Models\\Property', '18km'),
(6998, 11, 22, 'Botble\\RealEstate\\Models\\Property', '3km'),
(6999, 1, 23, 'Botble\\RealEstate\\Models\\Property', '2km'),
(7000, 2, 23, 'Botble\\RealEstate\\Models\\Property', '2km'),
(7001, 3, 23, 'Botble\\RealEstate\\Models\\Property', '19km'),
(7002, 4, 23, 'Botble\\RealEstate\\Models\\Property', '15km'),
(7003, 5, 23, 'Botble\\RealEstate\\Models\\Property', '5km'),
(7004, 6, 23, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7005, 7, 23, 'Botble\\RealEstate\\Models\\Property', '6km'),
(7006, 8, 23, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7007, 9, 23, 'Botble\\RealEstate\\Models\\Property', '16km'),
(7008, 10, 23, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7009, 11, 23, 'Botble\\RealEstate\\Models\\Property', '18km'),
(7010, 1, 24, 'Botble\\RealEstate\\Models\\Property', '13km'),
(7011, 2, 24, 'Botble\\RealEstate\\Models\\Property', '10km'),
(7012, 3, 24, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7013, 4, 24, 'Botble\\RealEstate\\Models\\Property', '7km'),
(7014, 5, 24, 'Botble\\RealEstate\\Models\\Property', '3km'),
(7015, 6, 24, 'Botble\\RealEstate\\Models\\Property', '1km'),
(7016, 7, 24, 'Botble\\RealEstate\\Models\\Property', '5km'),
(7017, 8, 24, 'Botble\\RealEstate\\Models\\Property', '1km'),
(7018, 9, 24, 'Botble\\RealEstate\\Models\\Property', '17km'),
(7019, 10, 24, 'Botble\\RealEstate\\Models\\Property', '2km'),
(7020, 11, 24, 'Botble\\RealEstate\\Models\\Property', '18km'),
(7021, 1, 25, 'Botble\\RealEstate\\Models\\Property', '5km'),
(7022, 2, 25, 'Botble\\RealEstate\\Models\\Property', '5km'),
(7023, 3, 25, 'Botble\\RealEstate\\Models\\Property', '15km'),
(7024, 4, 25, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7025, 5, 25, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7026, 6, 25, 'Botble\\RealEstate\\Models\\Property', '13km'),
(7027, 7, 25, 'Botble\\RealEstate\\Models\\Property', '6km'),
(7028, 8, 25, 'Botble\\RealEstate\\Models\\Property', '13km'),
(7029, 9, 25, 'Botble\\RealEstate\\Models\\Property', '2km'),
(7030, 10, 25, 'Botble\\RealEstate\\Models\\Property', '9km'),
(7031, 11, 25, 'Botble\\RealEstate\\Models\\Property', '19km'),
(7032, 1, 26, 'Botble\\RealEstate\\Models\\Property', '17km'),
(7033, 2, 26, 'Botble\\RealEstate\\Models\\Property', '11km'),
(7034, 3, 26, 'Botble\\RealEstate\\Models\\Property', '5km'),
(7035, 4, 26, 'Botble\\RealEstate\\Models\\Property', '16km'),
(7036, 5, 26, 'Botble\\RealEstate\\Models\\Property', '3km'),
(7037, 6, 26, 'Botble\\RealEstate\\Models\\Property', '18km'),
(7038, 7, 26, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7039, 8, 26, 'Botble\\RealEstate\\Models\\Property', '9km'),
(7040, 9, 26, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7041, 10, 26, 'Botble\\RealEstate\\Models\\Property', '13km'),
(7042, 11, 26, 'Botble\\RealEstate\\Models\\Property', '10km'),
(7043, 1, 27, 'Botble\\RealEstate\\Models\\Property', '1km'),
(7044, 2, 27, 'Botble\\RealEstate\\Models\\Property', '1km'),
(7045, 3, 27, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7046, 4, 27, 'Botble\\RealEstate\\Models\\Property', '1km'),
(7047, 5, 27, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7048, 6, 27, 'Botble\\RealEstate\\Models\\Property', '1km'),
(7049, 7, 27, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7050, 8, 27, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7051, 9, 27, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7052, 10, 27, 'Botble\\RealEstate\\Models\\Property', '9km'),
(7053, 11, 27, 'Botble\\RealEstate\\Models\\Property', '3km'),
(7054, 1, 28, 'Botble\\RealEstate\\Models\\Property', '12km'),
(7055, 2, 28, 'Botble\\RealEstate\\Models\\Property', '2km'),
(7056, 3, 28, 'Botble\\RealEstate\\Models\\Property', '17km'),
(7057, 4, 28, 'Botble\\RealEstate\\Models\\Property', '2km'),
(7058, 5, 28, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7059, 6, 28, 'Botble\\RealEstate\\Models\\Property', '7km'),
(7060, 7, 28, 'Botble\\RealEstate\\Models\\Property', '19km'),
(7061, 8, 28, 'Botble\\RealEstate\\Models\\Property', '17km'),
(7062, 9, 28, 'Botble\\RealEstate\\Models\\Property', '3km'),
(7063, 10, 28, 'Botble\\RealEstate\\Models\\Property', '7km'),
(7064, 11, 28, 'Botble\\RealEstate\\Models\\Property', '7km'),
(7065, 1, 29, 'Botble\\RealEstate\\Models\\Property', '11km'),
(7066, 2, 29, 'Botble\\RealEstate\\Models\\Property', '10km'),
(7067, 3, 29, 'Botble\\RealEstate\\Models\\Property', '12km'),
(7068, 4, 29, 'Botble\\RealEstate\\Models\\Property', '16km'),
(7069, 5, 29, 'Botble\\RealEstate\\Models\\Property', '5km'),
(7070, 6, 29, 'Botble\\RealEstate\\Models\\Property', '9km'),
(7071, 7, 29, 'Botble\\RealEstate\\Models\\Property', '5km'),
(7072, 8, 29, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7073, 9, 29, 'Botble\\RealEstate\\Models\\Property', '9km'),
(7074, 10, 29, 'Botble\\RealEstate\\Models\\Property', '9km'),
(7075, 11, 29, 'Botble\\RealEstate\\Models\\Property', '20km'),
(7076, 1, 30, 'Botble\\RealEstate\\Models\\Property', '9km'),
(7077, 2, 30, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7078, 3, 30, 'Botble\\RealEstate\\Models\\Property', '20km'),
(7079, 4, 30, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7080, 5, 30, 'Botble\\RealEstate\\Models\\Property', '11km'),
(7081, 6, 30, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7082, 7, 30, 'Botble\\RealEstate\\Models\\Property', '12km'),
(7083, 8, 30, 'Botble\\RealEstate\\Models\\Property', '19km'),
(7084, 9, 30, 'Botble\\RealEstate\\Models\\Property', '2km'),
(7085, 10, 30, 'Botble\\RealEstate\\Models\\Property', '1km'),
(7086, 11, 30, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7087, 1, 31, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7088, 2, 31, 'Botble\\RealEstate\\Models\\Property', '11km'),
(7089, 3, 31, 'Botble\\RealEstate\\Models\\Property', '20km'),
(7090, 4, 31, 'Botble\\RealEstate\\Models\\Property', '13km'),
(7091, 5, 31, 'Botble\\RealEstate\\Models\\Property', '6km'),
(7092, 6, 31, 'Botble\\RealEstate\\Models\\Property', '1km'),
(7093, 7, 31, 'Botble\\RealEstate\\Models\\Property', '17km'),
(7094, 8, 31, 'Botble\\RealEstate\\Models\\Property', '3km'),
(7095, 9, 31, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7096, 10, 31, 'Botble\\RealEstate\\Models\\Property', '13km'),
(7097, 11, 31, 'Botble\\RealEstate\\Models\\Property', '12km'),
(7098, 1, 32, 'Botble\\RealEstate\\Models\\Property', '19km'),
(7099, 2, 32, 'Botble\\RealEstate\\Models\\Property', '19km'),
(7100, 3, 32, 'Botble\\RealEstate\\Models\\Property', '10km'),
(7101, 4, 32, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7102, 5, 32, 'Botble\\RealEstate\\Models\\Property', '10km'),
(7103, 6, 32, 'Botble\\RealEstate\\Models\\Property', '6km'),
(7104, 7, 32, 'Botble\\RealEstate\\Models\\Property', '11km'),
(7105, 8, 32, 'Botble\\RealEstate\\Models\\Property', '9km'),
(7106, 9, 32, 'Botble\\RealEstate\\Models\\Property', '10km'),
(7107, 10, 32, 'Botble\\RealEstate\\Models\\Property', '12km'),
(7108, 11, 32, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7109, 1, 33, 'Botble\\RealEstate\\Models\\Property', '10km'),
(7110, 2, 33, 'Botble\\RealEstate\\Models\\Property', '15km'),
(7111, 3, 33, 'Botble\\RealEstate\\Models\\Property', '7km'),
(7112, 4, 33, 'Botble\\RealEstate\\Models\\Property', '6km'),
(7113, 5, 33, 'Botble\\RealEstate\\Models\\Property', '6km'),
(7114, 6, 33, 'Botble\\RealEstate\\Models\\Property', '20km'),
(7115, 7, 33, 'Botble\\RealEstate\\Models\\Property', '18km'),
(7116, 8, 33, 'Botble\\RealEstate\\Models\\Property', '12km'),
(7117, 9, 33, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7118, 10, 33, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7119, 11, 33, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7120, 1, 34, 'Botble\\RealEstate\\Models\\Property', '11km'),
(7121, 2, 34, 'Botble\\RealEstate\\Models\\Property', '13km'),
(7122, 3, 34, 'Botble\\RealEstate\\Models\\Property', '16km'),
(7123, 4, 34, 'Botble\\RealEstate\\Models\\Property', '2km'),
(7124, 5, 34, 'Botble\\RealEstate\\Models\\Property', '4km'),
(7125, 6, 34, 'Botble\\RealEstate\\Models\\Property', '8km'),
(7126, 7, 34, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7127, 8, 34, 'Botble\\RealEstate\\Models\\Property', '14km'),
(7128, 9, 34, 'Botble\\RealEstate\\Models\\Property', '11km'),
(7129, 10, 34, 'Botble\\RealEstate\\Models\\Property', '6km'),
(7130, 11, 34, 'Botble\\RealEstate\\Models\\Property', '1km');

-- --------------------------------------------------------

--
-- Table structure for table `re_facilities_translations`
--

CREATE TABLE `re_facilities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_facilities_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_facilities_translations`
--

INSERT INTO `re_facilities_translations` (`lang_code`, `re_facilities_id`, `name`) VALUES
('vi', 9, 'Bệnh viện'),
('vi', 10, 'Siêu thị'),
('vi', 11, 'Trường học'),
('vi', 12, 'Trung tâm giải trí'),
('vi', 13, 'Hiệu thuốc'),
('vi', 14, 'Sân bay'),
('vi', 15, 'Tàu điện ngầm'),
('vi', 16, 'Trạm xe buýt'),
('vi', 17, 'Bãi biển'),
('vi', 18, 'Trung tâm mua sắm'),
('vi', 19, 'Ngân hàng');

-- --------------------------------------------------------

--
-- Table structure for table `re_features`
--

CREATE TABLE `re_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_features`
--

INSERT INTO `re_features` (`id`, `name`, `status`, `icon`) VALUES
(1, 'Wifi', 'published', NULL),
(2, 'Parking', 'published', NULL),
(3, 'Swimming pool', 'published', NULL),
(4, 'Balcony', 'published', NULL),
(5, 'Garden', 'published', NULL),
(6, 'Security', 'published', NULL),
(7, 'Fitness center', 'published', NULL),
(8, 'Air Conditioning', 'published', NULL),
(9, 'Central Heating  ', 'published', NULL),
(10, 'Laundry Room', 'published', NULL),
(11, 'Pets Allow', 'published', NULL),
(12, 'Spa & Massage', 'published', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `re_features_translations`
--

CREATE TABLE `re_features_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_features_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_features_translations`
--

INSERT INTO `re_features_translations` (`lang_code`, `re_features_id`, `name`) VALUES
('vi', 9, 'Wifi'),
('vi', 10, 'Bãi đậu xe'),
('vi', 11, 'Hồ bơi'),
('vi', 12, 'Ban công'),
('vi', 13, 'Sân vườn'),
('vi', 14, 'An ninh'),
('vi', 15, 'Trung tâm thể dục'),
('vi', 16, 'Điều hoà nhiệt độ'),
('vi', 17, 'Hệ thống sưởi trung tâm'),
('vi', 18, 'Phòng giặt ủi'),
('vi', 19, 'Cho phép nuôi thú'),
('vi', 20, 'Spa & Massage');

-- --------------------------------------------------------

--
-- Table structure for table `re_investors`
--

CREATE TABLE `re_investors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_investors`
--

INSERT INTO `re_investors` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'National Pension Service', 'published', '2019-11-18 01:16:23', '2019-11-18 01:16:23'),
(2, 'Generali', 'published', '2019-11-18 01:16:47', '2019-11-18 01:16:47'),
(3, 'Temasek', 'published', '2019-11-18 01:16:57', '2019-11-18 01:16:57'),
(4, 'China Investment Corporation', 'published', '2019-11-18 01:17:11', '2019-11-18 01:17:11'),
(5, 'Government Pension Fund Global', 'published', '2019-11-18 01:17:35', '2019-11-18 01:17:35'),
(6, 'PSP Investments', 'published', '2019-11-18 01:17:47', '2019-11-18 01:17:47'),
(7, 'MEAG Munich ERGO', 'published', '2019-11-18 01:17:57', '2019-11-18 01:17:57'),
(8, 'HOOPP', 'published', '2019-11-18 01:18:08', '2019-11-18 01:18:08'),
(9, 'BT Group', 'published', '2019-11-18 01:18:21', '2019-11-18 01:18:21'),
(10, 'Ping An', 'published', '2019-11-18 01:18:32', '2019-11-18 01:18:32'),
(11, 'New Jersey Division of Investment', 'published', '2019-11-18 01:18:45', '2019-11-18 01:18:45'),
(12, 'New York City ERS', 'published', '2019-11-18 01:18:57', '2019-11-18 01:18:57'),
(13, 'State Super', 'published', '2019-11-18 01:19:10', '2019-11-18 01:19:10'),
(14, 'Shinkong', 'published', '2019-11-18 01:19:20', '2019-11-18 01:19:20'),
(15, 'Rest Super', 'published', '2019-11-18 01:19:31', '2019-11-18 01:19:31'),
(16, 'Rest Super', 'published', '2019-11-21 01:50:47', '2019-11-21 01:50:47'),
(17, 'Shinkong', 'published', '2019-11-21 01:51:03', '2019-11-21 01:51:03'),
(18, 'State Super', 'published', '2019-11-21 01:51:21', '2019-11-21 01:51:21'),
(19, 'New York City ERS', 'published', '2019-11-21 01:51:33', '2019-11-21 01:51:33'),
(20, 'New Jersey Division of Investment', 'published', '2019-11-21 01:51:51', '2019-11-21 01:51:51'),
(21, 'Ping An', 'published', '2019-11-21 01:52:04', '2019-11-21 01:52:04'),
(22, 'BT Group', 'published', '2019-11-21 01:52:16', '2019-11-21 01:52:16'),
(23, 'HOOPP', 'published', '2019-11-21 01:52:28', '2019-11-21 01:52:28'),
(24, 'MEAG Munich ERGO', 'published', '2019-11-21 01:52:47', '2019-11-21 01:52:47'),
(25, 'PSP Investments', 'published', '2019-11-21 01:52:57', '2019-11-21 01:52:57'),
(26, 'Government Pension Fund Global', 'published', '2019-11-21 01:53:18', '2019-11-21 01:53:18'),
(27, 'China Investment Corporation', 'published', '2019-11-21 01:53:33', '2019-11-21 01:53:33'),
(29, 'Temasek', 'published', '2019-11-21 01:53:48', '2019-11-21 01:53:48'),
(30, 'Generali', 'published', '2019-11-21 01:54:01', '2019-11-21 01:54:01'),
(31, 'National Pension Service', 'published', '2019-11-21 01:54:14', '2019-11-21 01:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `re_packages`
--

CREATE TABLE `re_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `number_of_listings` int(10) UNSIGNED NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percent_save` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `account_limit` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_packages`
--

INSERT INTO `re_packages` (`id`, `name`, `price`, `currency_id`, `number_of_listings`, `order`, `is_default`, `status`, `created_at`, `updated_at`, `percent_save`, `account_limit`) VALUES
(1, 'Free First Post', 0.00, 1, 1, 0, 0, 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29', 0, 1),
(2, 'Single Post', 250.00, 1, 1, 0, 1, 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29', 0, NULL),
(3, '5 Posts', 1000.00, 1, 5, 0, 0, 'published', '2021-12-09 21:25:29', '2021-12-09 21:25:29', 20, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `re_projects`
--

CREATE TABLE `re_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_block` smallint(5) UNSIGNED DEFAULT NULL,
  `number_floor` smallint(6) DEFAULT NULL,
  `number_flat` smallint(6) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `date_finish` date DEFAULT NULL,
  `date_sell` date DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `investor_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_from` decimal(15,0) DEFAULT NULL,
  `price_to` decimal(15,0) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_projects`
--

INSERT INTO `re_projects` (`id`, `name`, `content`, `images`, `location`, `number_block`, `number_floor`, `number_flat`, `is_featured`, `date_finish`, `date_sell`, `status`, `created_at`, `updated_at`, `investor_id`, `description`, `price_from`, `price_to`, `currency_id`, `city_id`, `author_id`, `author_type`, `latitude`, `longitude`, `views`) VALUES
(1, 'Walnut Park Apartments', '<p>Now Open &amp; Leasing!</p>\r\n\r\n<p>Walnut Park is conveniently located on North Lamar Boulevard across from the 293-acre Walnut Creek Metropolitan Park and just south of Yager Lane near numerous shops and restaurants. Only 11 miles from downtown Austin, the heavily-wooded site borders Walnut Creek and offers residents inspiring views in an unparalleled, secluded community. In addition to resort spa amenities, the interiors are built and designed to condominium specifications with energy efficient features, stunning detail and upgraded finishes.</p>', '[\"projects\\/1.jpg\",\"projects\\/5.jpg\",\"projects\\/3.jpg\",\"projects\\/2.jpg\"]', 'Austin, Texas 78753, USA', 4, 2, 50, 1, '2019-11-10', '2019-03-11', 'selling', '2019-11-18 00:34:49', '2021-04-29 20:46:31', 12, 'Walnut Park is conveniently located on North Lamar Boulevard across from the 293-acre Walnut Creek Metropolitan Park and just south of Yager Lane near numerous shops and restaurants. Only 11 miles from downtown Austin, the heavily-wooded site borders Walnut Creek and offers residents inspiring views in an unparalleled, secluded community', NULL, NULL, 1, 4, NULL, 'Botble\\ACL\\Models\\User', '43.578848', '-76.32197', 0),
(2, 'Osaka Heights', '<p>Osaka Heights is a state of the art apartment crafted with elegance, comfort and classiness.</p>\r\n\r\n<p>The grander apartments add new heights to the life of people in Colombo, Sri Lanka.</p>\r\n\r\n<p>Devised by a team of international consultants, Osaka Heights is all about contemporary design and comprehensive attention to detail in execution. If you are interested to own a luxury apartment at Sri Lanka, Osaka Heights is the best choice. The foundation of Osaka Heights is laid by skilled professionals, who capture your vision completely. The construction is built as per your elegant lifestyles, without any compromise in quality and class.</p>\r\n\r\n<p>The homes come with all comfy amenities and facilities for a superior life. From the panoramic views, the rooftop swimming pool and the landscaped eco-balconies, beauty meets you at every step in Osaka Heights. Made for an exclusive few, Osaka Heights gives you the advantage of sharing a space with like-minded individuals. An elevated lifestyle naturally follows, making Osaka Heights one of the most sought-after addresses in Colombo.</p>', '[\"projects\\/21.jpg\",\"projects\\/24.jpg\",\"projects\\/23.jpg\",\"projects\\/25.jpg\",\"projects\\/26.jpg\",\"projects\\/22.jpg\"]', 'Kirulapone, Colombo 06, Colombo, Sri Lanka', 1, 15, 450, 1, '2019-08-09', '2019-08-10', 'selling', '2019-11-18 01:28:45', '2021-06-11 20:56:44', 3, 'The homes come with all comfy amenities and facilities for a superior life. From the panoramic views, the rooftop swimming pool and the landscaped eco-balconies, beauty meets you at every step in Osaka Heights. Made for an exclusive few, Osaka Heights gives you the advantage of sharing a space with like-minded individuals.', NULL, NULL, 1, 3, NULL, 'Botble\\ACL\\Models\\User', '43.013638', '-75.848066', 0),
(3, 'Mimaroba Paradise', '<h2><b>Why you should buy a house from this project?</b></h2>\r\n\r\n<ul>\r\n	<li>1. A summerhouse in the center of the city.</li>\r\n	<li>2. Remove the boundaries between you and the sea, you will be surrounded by blue sea.</li>\r\n	<li>3.&nbsp;Everything you have imagined - from infinity pool, zen garden, gourmet restaurant to thematic playgrounds awaiting you.</li>\r\n	<li>4.&nbsp;A unique design that makes luxury a habit, a wide variety of apartment plan options.</li>\r\n	<li>5.&nbsp;Reasonable payment options, affordable prices in Istanbul&#39;s most exclusive area.</li>\r\n</ul>\r\n\r\n<p>&lsquo;&rsquo; Mimaroba&rsquo;&rsquo; a modern beach district away from the bustle of Istanbul.&nbsp;The aim of the project is to make a living feel for the hosts in the deepest way.&nbsp;In this project you can enjoy a life with the sea and you can have a holiday for 12 months with social facilities and activities.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>', '[\"projects\\/13.jpg\",\"projects\\/12.jpg\",\"projects\\/11.jpg\",\"projects\\/14.jpg\"]', 'Texas, USA', 2, 16, 327, 1, '2020-06-09', '2019-09-10', 'selling', '2019-11-18 03:30:34', '2021-06-11 20:56:44', 15, 'A summerhouse in the center of the city. Remove the boundaries between you and the sea, you will be surrounded by blue sea. Everything you have imagined - from infinity pool, zen garden, gourmet restaurant to thematic playgrounds awaiting you. A unique design that makes luxury a habit, a wide variety of apartment plan options.', NULL, NULL, 1, 1, NULL, 'Botble\\ACL\\Models\\User', '42.795156', '-76.237441', 0),
(4, 'Aegean Villas', '<h2><strong>Aegean Villas</strong></h2>\r\n\r\n<p>Looks like Aegean town and be one of the highest rated sites in the region. A very large area of 312.000sqm&nbsp; has only 144 villas. Each villa&rsquo;s garden is independent of one another and protects private life. There are 400 adult olive trees in the common area landscape. Strengthening of neighborly relations with common sharing points such as open air cinema, village coffee, market.&nbsp; Increase the living motivation with 2,5km walking and cycling trail, tennis courts and carpet right activities.&nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n\r\n<h4><strong>Why you should buy a house from this project?</strong></h4>\r\n\r\n<ul>\r\n	<li>1. Natural Architectural design.</li>\r\n	<li>2. Highest session rate in the region</li>\r\n	<li>3. Common sharing areas like open air cinema and village cafe.</li>\r\n	<li>4. 2,5km walking and cycling trail.</li>\r\n	<li>5. The gardens are detached and useful.</li>\r\n</ul>', '[\"properties\\/a5-1.jpg\",\"properties\\/a6-1.jpg\",\"properties\\/a7.jpg\",\"properties\\/a8.jpg\",\"properties\\/a10.jpg\",\"properties\\/a9.jpg\"]', 'Büyükçekmece, İstanbul, Turkey', 5, 2, 144, 1, '2020-06-09', '2020-10-04', 'selling', '2019-11-18 03:38:13', '2021-06-11 20:56:44', 11, 'A very large area of 312.000sqm  has only 144 villas. Each villa’s garden is independent of one another and protects private life. There are 400 adult olive trees in the common area landscape. Strengthening of neighborly relations with common sharing points such as open air cinema, village coffee, market.', NULL, NULL, 1, 2, NULL, 'Botble\\ACL\\Models\\User', '42.478281', '-75.321856', 0),
(5, 'Aydos Forest Apartments', '<p>The project, which offers unique opportunities for those who want to move into their new home, is the most advantageous housing project of the location with its easy payment options according to your budget. In your new home you will have a live site life with 90% occupancy; The <strong>clean air</strong> of Aydos Forest, the most important social facility of the region with <strong>3,700 sqm</strong> which brings enjoyable social activities to your feet, and much more are waiting for you. You will live a life with nature thanks to the artificial lake and cherry trees in the project as well as the landscape of Aydos Forest. and bacause of its easy connection to the main roads, you can easily reach the important centers of Istanbul.</p>\r\n\r\n<h4><b>Why you should buy a house from this project?</b></h4>\r\n\r\n<ul>\r\n	<li>1.&nbsp;Ready for delivery.</li>\r\n	<li>2.&nbsp;82% open area of landscape.</li>\r\n	<li>3.&nbsp;Aydos forest is right next to the project.</li>\r\n	<li>4.&nbsp;More than 90% of the project is occupied and full of life.</li>\r\n	<li>5. Ease of transportation.</li>\r\n</ul>', '[\"properties\\/q1.jpg\",\"properties\\/q2.jpg\",\"properties\\/q8.jpg\",\"properties\\/q7.jpg\",\"properties\\/q3.jpg\",\"properties\\/q6.jpg\"]', 'Sancaktepe/İstanbul, Turkey', 4, 18, 1394, 1, '2019-10-30', '2019-07-21', 'selling', '2019-11-18 03:45:06', '2021-04-18 09:20:14', 2, 'You will have a live site life with 90% occupancy; The clean air of Aydos Forest, the most important social facility of the region with 3,700 sqm which brings enjoyable social activities to your feet, and much more are waiting for you. You will live a life with nature thanks to the artificial lake and cherry trees in the project as', NULL, NULL, 1, 3, NULL, 'Botble\\ACL\\Models\\User', '43.270016', '-75.054121', 0),
(6, 'The Avila Apartments', '<p>A profoundly special project amidst history and Istanbul. In the heart of the Historical Peninsula, Select Lifestyle Alternatives ranging from 1+1 to 6+1, in limited numbers&hellip;. A timeless aesthetic enriched in perfect details .</p>\r\n\r\n<h4><b>Why you should buy a house from this project?</b></h4>\r\n\r\n<ul>\r\n	<li>1.&nbsp;Within the historical peninsula, there is a very special area where you will never find a similar one.</li>\r\n	<li>2.&nbsp;Unique sea view with a historical texture of Istanbul.</li>\r\n	<li>3.&nbsp;In the bustling city life, in the middle of all transportation possibilities.</li>\r\n	<li>4. 1+1 to 6+1 very special, suitable for all needs loft apartments</li>\r\n	<li>5.Large landscaping areas, cafes, shopping opportunities.</li>\r\n</ul>', '[\"properties\\/e1.jpg\",\"properties\\/e2.jpg\",\"properties\\/e3.jpg\",\"properties\\/e4.jpg\",\"properties\\/e5.jpg\",\"properties\\/e7.jpg\",\"properties\\/e8.jpg\"]', 'Singapore Island, Singapore', 2, 4, 125, 1, '2019-11-19', '2019-03-11', 'selling', '2019-11-18 03:53:20', '2022-01-15 04:43:00', 10, 'Within the historical peninsula, there is a very special area where you will never find a similar one. Unique sea view with a historical texture of Istanbul. In the bustling city life, in the middle of all transportation possibilities. Large landscaping areas, cafes, shopping opportunities.', NULL, NULL, 1, 5, NULL, 'Botble\\ACL\\Models\\User', '43.481307', '-74.862851', 3);

-- --------------------------------------------------------

--
-- Table structure for table `re_projects_translations`
--

CREATE TABLE `re_projects_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_projects_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_projects_translations`
--

INSERT INTO `re_projects_translations` (`lang_code`, `re_projects_id`, `name`, `description`, `content`, `location`) VALUES
('vi', 1, 'Căn hộ Walnut Park', 'Walnut Park tọa lạc tại vị trí thuận tiện trên Đại lộ Bắc Lamar đối diện Công viên Thành phố Walnut Creek rộng 293 mẫu và ngay phía nam của Yager Lane gần nhiều cửa hàng và nhà hàng. Chỉ có 11 dặm từ trung tâm thành phố Austin, khu căn hộ này gồm các khuôn viên nhiều cây cối giáp Walnut Creek và những quang cảnh tuyệt vời', '<p>Mở b&aacute;n&nbsp;v&agrave; cho thu&ecirc;!</p>\r\n\r\n<p>Walnut Park tọa lạc tại vị tr&iacute; thuận tiện tr&ecirc;n Đại lộ Bắc Lamar đối diện C&ocirc;ng vi&ecirc;n Th&agrave;nh phố Walnut Creek rộng 293 mẫu v&agrave; ngay ph&iacute;a nam của Yager Lane gần nhiều cửa h&agrave;ng v&agrave; nh&agrave; h&agrave;ng. Chỉ c&oacute; 11 dặm từ trung t&acirc;m th&agrave;nh phố Austin, khu căn hộ&nbsp;n&agrave;y gồm c&aacute;c khu&ocirc;n vi&ecirc;n nhiều c&acirc;y cối gi&aacute;p Walnut Creek v&agrave; những quang cảnh tuyệt vời. Ngo&agrave;i c&aacute;c tiện nghi spa của khu nghỉ m&aacute;t, nội thất được x&acirc;y dựng v&agrave; thiết kế theo th&ocirc;ng số kỹ thuật của nh&agrave; chung cư với c&aacute;c t&iacute;nh năng tiết kiệm năng lượng, chi tiết tuyệt đẹp v&agrave; ho&agrave;n thiện n&acirc;ng cấp.</p>', 'Austin, Texas 78753, USA'),
('vi', 2, 'Dự án Osaka Heights', 'Các ngôi nhà đi kèm với tất cả các tiện nghi và tiện nghi thoải mái cho một cuộc sống cao cấp. Từ góc nhìn toàn cảnh, hồ bơi trên sân thượng và ban công sinh thái có cảnh quan, vẻ đẹp sẽ gặp bạn ở mọi bước chân ở Osaka Heights. Tạo ra một không gian riêng biệt, Osaka Heights mang đến cho bạn lợi thế chia sẻ không gian với những người có cùng đẳng cấp.', '<p>Osaka Heights l&agrave; một khu căn hộ nghệ thuật được chế t&aacute;c với sự sang trọng, tiện nghi v&agrave; đẳng cấp.<br />\r\nC&aacute;c căn hộ lớn hơn tạo th&ecirc;m một tầm cao mới cho cuộc sống của người d&acirc;n ở thủ đ&ocirc; Colombo, Sri Lanka.<br />\r\nĐược tạo ra bởi một nh&oacute;m c&aacute;c nh&agrave; tư vấn quốc tế, Osaka Heights l&agrave; tất cả về thiết kế hiện đại v&agrave; sự ch&uacute; &yacute; to&agrave;n diện đến từng chi tiết trong thực hiện. V&igrave; vậy việc sở hữu một căn hộ cao cấp tại Sri Lanka, Osaka Heights l&agrave; lựa chọn tốt nhất. Nền tảng của Osaka Heights được đặt bởi c&aacute;c chuy&ecirc;n gia l&agrave;nh nghề, những người nắm bắt ho&agrave;n to&agrave;n tầm nh&igrave;n của bạn. C&ocirc;ng tr&igrave;nh được x&acirc;y dựng theo lối sống thanh lịch, chất lượng v&agrave; đẳng cấp.<br />\r\nC&aacute;c ng&ocirc;i nh&agrave; đi k&egrave;m với tất cả c&aacute;c tiện nghi v&agrave; tiện nghi thoải m&aacute;i cho một cuộc sống cao cấp. Từ g&oacute;c nh&igrave;n to&agrave;n cảnh, hồ bơi tr&ecirc;n s&acirc;n thượng v&agrave; ban c&ocirc;ng sinh th&aacute;i c&oacute; cảnh quan, vẻ đẹp sẽ gặp bạn ở mọi bước ch&acirc;n ở Osaka Heights. Tạo ra một kh&ocirc;ng gian ri&ecirc;ng biệt, Osaka Heights mang đến cho bạn lợi thế chia sẻ kh&ocirc;ng gian với những người c&oacute; c&ugrave;ng đẳng cấp. Một lối sống n&acirc;ng cao tự nhi&ecirc;n, l&agrave;m cho Osaka Heights trở th&agrave;nh một trong những địa chỉ được t&igrave;m kiếm nhiều nhất ở Colombo.</p>', 'Kirulapone, Colombo 06, Colombo, Sri Lanka'),
('vi', 3, 'Thiên đường Mimaroba', 'Một ngôi nhà mùa hè ở trung tâm thành phố. Xóa bỏ ranh giới giữa bạn và biển, bạn sẽ được bao quanh bởi biển xanh. Mọi thứ giống như bạn đã tưởng tượng - từ hồ bơi vô cực, vườn thiền, nhà hàng chuyên phục vụ người sành ăn đến các sân chơi theo chủ đề đang chờ bạn. Một thiết kế độc đáo làm cho sự sang trọng trở thành một thói quen, một loạt các lựa chọn kế hoạch căn hộ.', '<p>Tại sao bạn n&ecirc;n mua một ng&ocirc;i nh&agrave; từ dự &aacute;n n&agrave;y?<br />\r\n1. Một ng&ocirc;i nh&agrave; m&ugrave;a h&egrave; ở trung t&acirc;m th&agrave;nh phố.<br />\r\n2. X&oacute;a bỏ ranh giới giữa bạn v&agrave; biển, bạn sẽ được bao quanh bởi biển xanh.<br />\r\n3. Mọi thứ giống như bạn đ&atilde; tưởng tượng - từ hồ bơi v&ocirc; cực, vườn thiền, nh&agrave; h&agrave;ng chuy&ecirc;n phục vụ người s&agrave;nh ăn đến c&aacute;c s&acirc;n chơi theo chủ đề đang chờ bạn.<br />\r\n4. Một thiết kế độc đ&aacute;o l&agrave;m cho sự sang trọng trở th&agrave;nh một th&oacute;i quen, một loạt c&aacute;c lựa chọn kế hoạch căn hộ.<br />\r\n5. T&ugrave;y chọn thanh to&aacute;n hợp l&yacute;, gi&aacute; cả phải chăng trong khu vực độc quyền nhất của Istanbul.<br />\r\nMimaroba ở khu vực b&atilde;i biển hiện đại c&aacute;ch xa sự nhộn nhịp của Istanbul. Mục đ&iacute;ch của dự &aacute;n l&agrave; tạo cảm gi&aacute;c sống động cho chủ nh&agrave; một c&aacute;ch s&acirc;u sắc nhất. Trong dự &aacute;n n&agrave;y, bạn c&oacute; thể tận hưởng một cuộc sống với biển v&agrave; bạn c&oacute; thể c&oacute; một kỳ nghỉ trong 12 th&aacute;ng với c&aacute;c hoạt động v&agrave; tiện &iacute;ch x&atilde; hội.</p>', 'Texas, USA'),
('vi', 4, 'Khu biệt thự Aegean', 'Một diện tích rất lớn với diện tích 312.000m2 chỉ có 144 biệt thự. Mỗi biệt thự vườn độc lập với nhau và bảo vệ cuộc sống riêng tư. Có 400 cây ô liu trưởng thành trong cảnh quan khu vực chung. Tăng cường mối quan hệ láng giềng với các điểm chia sẻ chung như rạp chiếu phim ngoài trời, cà phê làng, chợ.', '<p>Biệt thự Aegean tr&ocirc;ng giống như thị trấn Aegean v&agrave; l&agrave; một trong những khu biệt thự được đ&aacute;nh gi&aacute; cao nhất trong khu vực. Một diện t&iacute;ch rất lớn với diện t&iacute;ch 312.000m2 chỉ c&oacute; 144 biệt thự. Mỗi biệt thự vườn độc lập với nhau v&agrave; bảo vệ cuộc sống ri&ecirc;ng tư. C&oacute; 400 c&acirc;y &ocirc; liu trưởng th&agrave;nh trong cảnh quan khu vực chung. Tăng cường mối quan hệ l&aacute;ng giềng với c&aacute;c điểm chia sẻ chung như rạp chiếu phim ngo&agrave;i trời, c&agrave; ph&ecirc; l&agrave;ng, chợ. Tăng động lực sống với 2,5km đi bộ v&agrave; đi xe đạp, s&acirc;n tennis v&agrave; thảm hoạt động.</p>\r\n\r\n<h4><strong>Tại sao bạn n&ecirc;n mua ng&ocirc;i nh&agrave; từ dự &aacute;n n&agrave;y?</strong></h4>\r\n\r\n<p><br />\r\n1. Thiết kế kiến tr&uacute;c tự nhi&ecirc;n.<br />\r\n2. Tỷ lệ quản l&yacute; cao nhất trong khu vực<br />\r\n3. Khu vực chia sẻ chung như rạp chiếu phim ngo&agrave;i trời v&agrave; qu&aacute;n c&agrave; ph&ecirc; l&agrave;ng.<br />\r\n4. Đường đi bộ v&agrave; đi xe đạp 2,5km.<br />\r\n5. C&aacute;c khu vườn được t&aacute;ch ra v&agrave; hữu &iacute;ch.</p>', 'Büyükçekmece, İstanbul, Turkey'),
('vi', 5, 'Chung cư rừng Aydos', 'Bạn sẽ có một cuộc sống trong khu chung cư với tỷ lệ lấp đầy 90% là không khí trong lành của Rừng Aydos với 3.700 m2, mang lại các hoạt động thú vị cho đôi chân của bạn, và còn nhiều điều nữa đang chờ đợi bạn. Bạn sẽ sống một cuộc sống với thiên nhiên nhờ hồ nhân tạo và cây anh đào trong dự án cũng như cảnh quan của Rừng Aydos.', '<p>Dự &aacute;n, mang đến cơ hội duy nhất cho những ai muốn chuyển đến ng&ocirc;i nh&agrave; mới của họ, l&agrave; dự &aacute;n nh&agrave; ở thuận lợi nhất của địa điểm với c&aacute;c t&ugrave;y chọn thanh to&aacute;n dễ d&agrave;ng theo ng&acirc;n s&aacute;ch của bạn. Trong ng&ocirc;i nh&agrave; mới của bạn, bạn sẽ c&oacute; một cuộc sống trong khu chung cư với tỷ lệ lấp đầy 90% l&agrave; kh&ocirc;ng kh&iacute; trong l&agrave;nh của Rừng Aydos với 3.700 m2, mang lại c&aacute;c hoạt động th&uacute; vị cho đ&ocirc;i ch&acirc;n của bạn, v&agrave; c&ograve;n nhiều điều nữa đang chờ đợi bạn. Bạn sẽ sống một cuộc sống với thi&ecirc;n nhi&ecirc;n nhờ hồ nh&acirc;n tạo v&agrave; c&acirc;y anh đ&agrave;o trong dự &aacute;n cũng như cảnh quan của Rừng Aydos. V&agrave; bởi v&igrave; kết nối dễ d&agrave;ng với c&aacute;c con đường ch&iacute;nh, bạn c&oacute; thể dễ d&agrave;ng đến c&aacute;c trung t&acirc;m quan trọng của Istanbul.</p>\r\n\r\n<h4><strong>Tại sao bạn n&ecirc;n mua ng&ocirc;i nh&agrave; từ dự &aacute;n n&agrave;y?</strong></h4>\r\n\r\n<p>1. Sẵn s&agrave;ng giao nh&agrave;.<br />\r\n2. 82% diện t&iacute;ch l&agrave; cảnh quan.<br />\r\n3. Rừng Aydos nằm ngay cạnh dự &aacute;n.<br />\r\n4. Đ&atilde; b&agrave;n giao hơn 90% dự &aacute;n.<br />\r\n5. Dễ vận chuyển.</p>', 'Sancaktepe/İstanbul, Turkey'),
('vi', 6, 'Khu chung cư The Avila', 'Trong bán đảo lịch sử, có một khu vực rất đặc biệt, nơi bạn sẽ không bao giờ tìm thấy một khu vực tương tự. Cảnh biển độc đáo với kết cấu lịch sử của Istanbul. Trong cuộc sống thành phố nhộn nhịp, ở giữa mọi khả năng giao thông. Khu vực cảnh quan rộng lớn, quán cà phê, cơ hội mua sắm.', '<p>Một dự &aacute;n đặc biệt s&acirc;u sắc giữa lịch sử v&agrave; Istanbul. Ở trung t&acirc;m của b&aacute;n đảo lịch sử.&nbsp;<br />\r\nMột thẩm mỹ vượt thời gian l&agrave;m phong ph&uacute; trong c&aacute;c chi tiết ho&agrave;n hảo.</p>\r\n\r\n<h4><strong>Tại sao bạn n&ecirc;n mua một ng&ocirc;i nh&agrave; từ dự &aacute;n n&agrave;y?</strong></h4>\r\n\r\n<p>1. Trong b&aacute;n đảo lịch sử, c&oacute; một khu vực rất đặc biệt, nơi bạn sẽ kh&ocirc;ng bao giờ t&igrave;m thấy một khu vực tương tự.<br />\r\n2. Cảnh biển độc đ&aacute;o với kết cấu lịch sử của Istanbul.<br />\r\n3. Trong cuộc sống th&agrave;nh phố nhộn nhịp, ở giữa mọi khả năng giao th&ocirc;ng.<br />\r\n4. 1 + 1 đến 6 + 1 rất đặc biệt, ph&ugrave; hợp với mọi nhu cầu căn hộ g&aacute;c x&eacute;p<br />\r\n5. Khu vực cảnh quan rộng lớn, qu&aacute;n c&agrave; ph&ecirc;, cơ hội mua sắm.</p>', 'Singapore Island, Singapore');

-- --------------------------------------------------------

--
-- Table structure for table `re_project_categories`
--

CREATE TABLE `re_project_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_project_categories`
--

INSERT INTO `re_project_categories` (`id`, `project_id`, `category_id`) VALUES
(45, 3, 4),
(46, 5, 2),
(54, 1, 4),
(55, 2, 3),
(56, 4, 6),
(57, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `re_project_features`
--

CREATE TABLE `re_project_features` (
  `project_id` int(10) UNSIGNED NOT NULL,
  `feature_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_project_features`
--

INSERT INTO `re_project_features` (`project_id`, `feature_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 7),
(2, 8),
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(1, 7),
(7, 10),
(7, 12),
(7, 13),
(7, 15),
(7, 16),
(8, 9),
(8, 10),
(8, 12),
(8, 14),
(8, 15),
(8, 16),
(3, 1),
(3, 2),
(3, 3),
(3, 5),
(3, 7),
(9, 10),
(9, 12),
(9, 14),
(9, 15),
(9, 16),
(4, 1),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(10, 10),
(10, 11),
(10, 12),
(10, 13),
(10, 16),
(5, 1),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(11, 9),
(11, 10),
(11, 11),
(11, 12),
(11, 14),
(11, 16),
(6, 1),
(6, 3),
(6, 5),
(6, 6),
(6, 7),
(12, 10),
(12, 11),
(12, 12),
(12, 14),
(12, 16);

-- --------------------------------------------------------

--
-- Table structure for table `re_properties`
--

CREATE TABLE `re_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `number_bedroom` smallint(5) UNSIGNED DEFAULT NULL,
  `number_bathroom` smallint(5) UNSIGNED DEFAULT NULL,
  `number_floor` smallint(5) UNSIGNED DEFAULT NULL,
  `square` int(11) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `price_unit` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `period` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `expire_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT 0,
  `never_expired` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_properties`
--

INSERT INTO `re_properties` (`id`, `name`, `content`, `location`, `images`, `project_id`, `number_bedroom`, `number_bathroom`, `number_floor`, `square`, `price`, `price_unit`, `is_featured`, `status`, `created_at`, `updated_at`, `type`, `description`, `currency_id`, `city_id`, `period`, `author_id`, `author_type`, `moderation_status`, `expire_date`, `auto_renew`, `never_expired`, `latitude`, `longitude`, `views`) VALUES
(1, '3 Beds Villa Calpe, Alicante', '<p>This villa is equipped with all conveniences, where everything takes place on one living level. Three spacious bedrooms that all have direct access to the pool terrace and a spacious living room with an American kitchen with cooking island, from where you can walk onto the terrace through large glass sliding doors. Downstairs there is an indoor, double garage and laundry room with an internal staircase to the house. But you can also drive up to the front door by car. The terrace is spacious and there is an extra-long swimming pool, where you can swim laps well. Around there is a landscaped garden, which is also low in maintenance. Instead of gardening, there is more time left for wonderful enjoyment in and around this beautiful villa.</p>', 'Alicante, Spain', '[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\"]', 6, 3, 3, 1, 600, '700000.00', NULL, 1, 'selling', '2019-11-17 20:34:59', '2021-12-09 21:25:32', 'sale', 'This villa is equipped with all conveniences, where everything takes place on one living level. Three spacious bedrooms that all have direct access to the pool terrace and a spacious living room with an American kitchen with cooking island, from where you can walk onto the terrace through large glass sliding doors.', 1, 5, 'month', 2, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.954366', '-76.204832', 0),
(2, 'Property For sale , Johannesburg, South Africa', '<p><strong>Beautiful home situated in road closure in bedfordview.&nbsp;</strong>Nestled on a rocky outcrop of enormous boulders, this unique home is an architectural triumph designed to titilate the senses from the very start with a waterfall cascading into heated black quartzite pool &amp; stunning koi-pond. Flavours of the Seychelles.&nbsp;Enter from a winding pathway lined by palms and tree ferns into the hallway. The spacious living room with magnificent wood burning fireplace and large diningroom are complemented by a wet barrel bar, featuring designer built in wine cellar wall.</p>', 'Johannesburg, South Africa', '[\"properties\\/23.jpg\",\"properties\\/21.jpg\",\"properties\\/24.jpg\",\"properties\\/22.jpg\"]', 6, 4, 4, 2, 800, '800000.00', NULL, 1, 'selling', '2019-11-17 20:53:34', '2021-12-09 21:25:32', 'sale', 'Beautiful home. Nestled on a rocky outcrop of enormous boulders, this unique home is an architectural triumph designed to titilate the senses from the very start with a waterfall cascading into heated black quartzite pool & stunning koi-pond. Flavours of the Seychelles.', 1, 2, 'month', 10, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.819483', '-76.703637', 0),
(3, 'Stunning French Inspired Manor', '<p>Stunning French Inspired Manor located within Briarwood Ranch near Solvang in the heart of the magnificent Santa Ynez Valley. This residence features appx 5,000sqft 4+ bedroom, 3.5 bath home with elegant and spacious interiors including formal living and dining, amazing view great room and kitchen, and massive bonus library media room with bar and custom built-ins. The magnificent lagoon-like infinity edge swimming pool offers beach entry, waterfalls and slide, Cabana and a complimentary poolside bar combo BBQ kitchen. A spacious 2 car garage is adjacent to craft room and large art studio</p>', 'Solvang, Santa Barbara County, CA 93463, USA', '[\"properties\\/31.jpg\",\"properties\\/32.jpg\",\"properties\\/33.jpg\",\"properties\\/34.jpg\",\"properties\\/35.jpg\",\"properties\\/311.jpg\"]', 5, 4, 3, 1, 450, '1695000.00', NULL, 1, 'selling', '2019-11-17 21:09:55', '2021-12-09 21:24:36', 'sale', 'This residence features appx 5,000sqft 4+ bedroom, 3.5 bath home with elegant and spacious interiors including formal living and dining, amazing view great room and kitchen, and massive bonus library media room with bar and custom built-ins. The magnificent lagoon-like infinity edge swimming pool offers beach entry, waterfalls and slide', 1, 5, 'month', 10, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.722299', '-75.466082', 0),
(4, 'Villa for sale at Bermuda Dunes', '<p>This rare and exceptional custom-built home sits on a premiere lot in the exclusive, private section of Castle Harbour. The property borders the golf course for 360 lineal feet, adding not only a gorgeous view but also complete privacy. The home itself sets above the golf course, for further privacy, and is located between the 5th and 6th fairways of the prestigious Bermuda Dunes Country Club. Chiseled glass entry doors lead you into a magnificent Italian Marble entry that encompasses the entire hallway and living room with a fireplace. The vast great room, with raised ceilings, captures the pool, golf, lake and dynamic southern, mountain views. There&#39;s a lovely Library with built in shelves on one wall. There&rsquo;s a sunken wet bar, with Italian Marble flooring, that provides views of the golf course and surrounding mountains.</p>', 'Bermuda Dunes, Riverside County, CA 92203, USA', '[\"properties\\/411.jpg\",\"properties\\/44.jpg\",\"properties\\/43.jpg\",\"properties\\/42.jpg\"]', 4, 4, 3, 1, 480, '1295000.00', NULL, 1, 'selling', '2019-11-17 21:18:11', '2021-12-09 21:25:32', 'sale', 'This rare and exceptional custom-built home sits on a premiere lot in the exclusive, private section of Castle Harbour. The property borders the golf course for 360 lineal feet, adding not only a gorgeous view but also complete privacy. The home itself sets above the golf course, for further privacy, and is located between the 5th and 6th fairways of the prestigious Bermuda Dunes Country Club', 1, 1, 'month', 3, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.982274', '-76.182356', 0),
(5, 'Walnut Park Apartment', '<p>Only 11 miles from downtown Austin, the heavily-wooded site borders Walnut Creek and offers residents inspiring views in an unparalleled, secluded community</p>\r\n\r\n<ul>\r\n	<li>Heavily wooded site with dramatic 30-foot bluffs overlooking the scenic Walnut Creek</li>\r\n	<li>Conveniently located on North Lamar near numerous shops, major employers and restaurants</li>\r\n	<li>Easy access to I-35 and a short distance to US-183 and SH-45</li>\r\n	<li>Elegant clubhouse with a full kitchen, bar area, lounging area and creek-view veranda</li>\r\n	<li>24-hour fully-equipped fitness center with lockers and changing area</li>\r\n	<li>Indoor spa with cascading waterfall, steam room and cedar sauna</li>\r\n	<li>Spacious, gourmet kitchens with granite countertops and backsplashes</li>\r\n	<li>Stainless steel appliances and natural gas ranges</li>\r\n	<li>Designer hardwood cabinets with under-cabinet lighting</li>\r\n</ul>', 'North Lamar Boulevard, Austin, Texas 78753, USA', '[\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/1-1.jpg\"]', 1, 2, 2, 1, 980, '2035.00', NULL, 1, 'renting', '2019-11-18 00:47:52', '2021-12-09 21:25:32', 'rent', 'Heavily wooded site with dramatic 30-foot bluffs overlooking the scenic Walnut Creek\r\nConveniently located on North Lamar near numerous shops, major employers and restaurants\r\nEasy access to I-35 and a short distance to US-183 and SH-45\r\nElegant clubhouse with a full kitchen, bar area, lounging area and creek-view veranda', 1, 1, 'month', 2, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '42.669053', '-75.578469', 0),
(6, '5 beds luxury house', '<p>Luxury and spacious remodeled house in Sea Cliff with 3 levels, 5 bedrooms and 4 bathrooms, and a great Golden Gate View. 4-Car garage. The house is remodeled and spacious with a great layout, and is offered furnished. It is charming and beautiful with lots of details, has thoughtful front landscaping and a large backyard and a patio, and has a great view of the Golden Gate. On the main level the entry opens to a large foyer which connects to a beautiful and large living room with a fireplace, and to a formal dining room.</p>\r\n\r\n<p>The house has a garage which can accommodate 3 to 4 cars. The house is offered furnished. Can be leased for short term or long term. The minimum lease term is 3 months.</p>', 'Seacliff San Francisco, Sea Cliff Avenue, San Francisco, CA 94121, USA', '[\"properties\\/a3.jpg\",\"properties\\/a1.jpg\",\"properties\\/a2.jpg\",\"properties\\/a4.jpg\"]', 2, 5, 4, 3, 270, '1808.00', NULL, 1, 'renting', '2019-11-18 01:05:58', '2021-12-09 21:25:32', 'rent', 'Luxury and spacious remodeled house in Sea Cliff with 3 levels, 5 bedrooms and 4 bathrooms, and a great Golden Gate View. 4-Car garage. The house is remodeled and spacious with a great layout, and is offered furnished. It is charming and beautiful with lots of details, has thoughtful front landscaping and a large backyard and a patio, and has a great view of the Golden Gate', 1, 1, 'month', 4, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '42.946985', '-76.206616', 0),
(7, 'Family Victorian \"View\" Home', '<p>There is a formal dining room and spacious living room located on either side of the updated eat-in kitchen skylight, white cabinets, and stainless steel appliances. Enjoy ample natural light and spectacular southern views from the main living room oversized windows and a walk-out deck. A bonus room (guest bedroom/office) and a full bath complete this level.</p>\r\n<p> </p>', 'Safeway San Francisco CA, Market Street, San Francisco, CA 94114, USA', '[\"properties\\/b5.jpg\",\"properties\\/b1.jpg\",\"properties\\/b4.jpg\",\"properties\\/b6.jpg\",\"properties\\/b2.jpg\"]', 3, 3, 2, 1, 180, '2580.00', NULL, 1, 'renting', '2019-11-18 01:12:07', '2021-12-09 21:25:32', 'rent', 'There is a formal dining room and spacious living room located on either side of the updated eat-in kitchen skylight, white cabinets, and stainless steel appliances. Enjoy ample natural light and spectacular southern views from the main living room oversized windows and a walk-out deck. A bonus room (guest bedroom/office) and a full bath complete t', 1, 1, 'month', 8, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.819646', '-74.89512', 0),
(8, 'Osaka Heights Apartment', '<p><strong>Kitchen</strong><br />\r\nCeramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\r\n\r\n<p><strong>Toilets</strong><br />\r\nAnti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\r\n\r\n<p><strong>Doors</strong><br />\r\nMain door will be high quality wooden door, premium Windows quality pre-hung internal doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\r\n\r\n<p>&nbsp;9 km to Katunayaka airport expressway entrance</p>\r\n\r\n<p>&nbsp;12 km to Southern expressway entrance at Kottawa</p>\r\n\r\n<p>&nbsp;2 km to Kalubowila General hospital</p>\r\n\r\n<p>&nbsp;All leading banks within a few kilometer radii</p>\r\n\r\n<p>&nbsp;Very close proximity to railway stations</p>\r\n\r\n<p>&nbsp;Many leading schools including CIS within 5 km radius</p>', 'High Level Road, Colombo 06, Sri Lanka', '[\"properties\\/24-1.jpg\",\"properties\\/22-1.jpg\",\"properties\\/p1.jpg\",\"properties\\/p2.jpg\"]', 2, 2, 2, 1, 110, '150000.00', NULL, 1, 'selling', '2019-11-18 01:49:36', '2021-12-09 21:25:32', 'sale', 'Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided. Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White coloured branded sanitary fittings, Chromium plated taps , concealed plumbing.', 1, 5, 'month', 7, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '42.928003', '-74.902172', 0),
(9, 'Private Estate Magnificent Views', '<p>Spacious 3 bedroom stabilised earth brick home, light and bright with statement entrance hall. Conservatory sun room, open plan kitchen/dining/lounge with raked cedar lined ceiling, kitchen with oregon timber cupboards and new Smeg oven. Air conditioner &amp; wood heater<br />\r\nGood sized bedrooms and main bedroom with spa overlooking tranquil gardens and Inlet.</p>', '110 Springdale Heights, Hay Denmark, WA, Australia', '[\"properties\\/79.jpg\",\"properties\\/71.jpg\",\"properties\\/73.jpg\",\"properties\\/72.jpg\",\"properties\\/74.jpg\",\"properties\\/75.jpg\",\"properties\\/78.jpg\"]', 2, 3, 1, 1, 2000, '694000.00', NULL, 1, 'selling', '2019-11-18 02:02:19', '2021-12-09 21:25:32', 'sale', 'Spacious 3 bedroom stabilised earth brick home, light and bright with statement entrance hall. Conservatory sun room, open plan kitchen/dining/lounge with raked cedar lined ceiling, kitchen with oregon timber cupboards and new Smeg oven. Air conditioner & wood heater', 1, 5, 'month', 11, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '42.812299', '-76.137607', 0),
(10, 'Thompsons Road House for rent', '<p>Perfectly positioned in the exclusive suburb of Bulleen, this renovated home 3 bedroom home offers a superb lifestyle to those seeking all the expected comforts, privacy, convenience to freeways &amp; transport, and space.<br />\r\nYou are welcomed by a beautiful, low maintenance and established front garden, with ample off street parking, an elevated porch and tantum large garage. Inside you will find a lovely neutral colour scheme and near new gleaming timber timber floors. There are three spacious bedrooms all with built in robes, serviced by a central family bathroom and separate powder room, along with a large open lounge and formal dining room beaming with natural light. The stunning kitchen comes complete with Blanco appliances, breakfast bar and top quality fittings and fixtures.</p>', 'Thompsons Road, Bulleen VIC, Australia', '[\"properties\\/5-1.jpg\",\"properties\\/7-1.jpg\",\"properties\\/8-1.jpg\",\"properties\\/9.jpg\",\"properties\\/6.jpg\"]', 6, 3, 3, 1, 160, '1465.00', NULL, 1, 'renting', '2019-11-18 02:16:53', '2021-12-09 21:24:36', 'rent', 'Perfectly positioned in the exclusive suburb of Bulleen, this renovated home 3 bedroom home offers a superb lifestyle to those seeking all the expected comforts, privacy, convenience to freeways & transport, and space.\r\nYou are welcomed by a beautiful, low maintenance and established front garden, with ample off street parking, an elevated porch and tantum large garage', 1, 3, 'month', 10, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '42.601639', '-76.36969', 0),
(11, 'Brand New 1 Bedroom Apartment In First Class Location', '<p>Set-back from Sandy Bay Road, walk to everything that counts: vibrant Battery Point village, Salamanca Place (Tasmania&#39;s premier entertainment precinct), the City Centre, University of Tasmania, hotel, retail and an easy stroll away from bustling Sandy Bay shops, local schools and with public transport outside your front door.</p>\r\n\r\n<p>Please note: Elders Brown and Banks do not accept applications from applicants who have not inspected the property internally.</p>', 'Sandy Bay Road, Sandy Bay TAS, Australia', '[\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/13.jpg\",\"properties\\/14.jpg\",\"properties\\/15.jpg\"]', 5, 1, 1, 1, 80, '1680.00', NULL, 1, 'renting', '2019-11-18 02:22:48', '2021-12-09 21:25:32', 'rent', 'Set-back from Sandy Bay Road, walk to everything that counts: vibrant Battery Point village, Salamanca Place (Tasmania\'s premier entertainment precinct), the City Centre, University of Tasmania, hotel, retail and an easy stroll away from bustling Sandy Bay shops, local schools and with public transport outside your front door.', 1, 5, 'month', 11, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '42.659611', '-76.197177', 0),
(12, 'Elegant family home presents premium modern living', '<p>Move straight into this beautifully presented four-bedroom home and enjoy the best in modern family living without lifting a finger. Two separate living areas and four generous bedrooms provide plenty of space to grow, and entertaining is a real pleasure on the elegant alfresco patio in a peaceful garden setting. The home is ideally set walking distance to parks and bus stops, moments to your choice of schools, and just several minutes to Westfield North Lakes.<br />\r\n&nbsp;</p>', 'North Lakes QLD 4509, Australia', '[\"properties\\/a1-1.jpg\",\"properties\\/a2-1.jpg\",\"properties\\/a3-1.jpg\",\"properties\\/a5.jpg\",\"properties\\/a4-1.jpg\",\"properties\\/a6.jpg\"]', 6, 3, 3, 1, 658, '1574.00', NULL, 1, 'renting', '2019-11-18 02:47:05', '2021-12-09 21:24:36', 'rent', 'Move straight into this beautifully presented four-bedroom home and enjoy the best in modern family living without lifting a finger. Two separate living areas and four generous bedrooms provide plenty of space to grow, and entertaining is a real pleasure on the elegant alfresco patio in a peaceful garden setting.', 1, 5, 'month', 11, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.137361', '-76.539998', 0),
(13, 'Luxury Apartments in Singapore for Sale', '<p>This apartment&nbsp;is located in Singapore, which has become a comfortable living center for the living, providing both attractive gains for investors and high premium. 840sqft<br />\r\n- High Floor<br />\r\n- Chinese Family<br />\r\n- Sky Garden<br />\r\n- Beautiful Roof Terrace with Jaccuzzi And<br />\r\nAlfresco Dinning<br />\r\n- Renovated with Quality Finishes<br />\r\n- Near Amenities<br />\r\n- Plenty of eateries.<br />\r\n- 5mins Walk to NTUC / Shaw Plaza<br />\r\n- Mins Drive To Orchard</p>', 'Balestier Road, Singapore', '[\"properties\\/5-2.jpg\",\"properties\\/2-3.jpg\",\"properties\\/3-3.jpg\",\"properties\\/4-2.jpg\",\"properties\\/1-3.jpg\"]', 6, 2, 2, 1, 78, '918000.00', NULL, 1, 'selling', '2019-11-18 07:23:02', '2021-12-09 21:25:32', 'sale', 'This apartment is located in Singapore. High Floor, Chinese Family, Sky Garden, Beautiful Roof Terrace with Jaccuzzi and Alfresco Dinning, Renovated with Quality Finishes, Near Amenities, Plenty of eateries, 5mins Walk to NTUC / Shaw Plaza, Mins Drive To Orchard', 1, 5, 'month', 11, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '42.813772', '-76.615855', 0),
(14, '5 room luxury penthouse for sale in Kuala Lumpur', '<p>The Sentral Residence (BRAND NEW LUXURY CONDO)<br />\r\n<br />\r\n-Next to St Regis 5 Star Hotel<br />\r\n-Excellent accessibility (LRT,KLIA TRANSIT,KTM)<br />\r\n-Rooftop Sky lounge,sky pool,sky gym<br />\r\n-Private lift lobby to own unit<br />\r\n<br />\r\nEPIC LUXE PREMIUM UNITS<br />\r\n(KLCC and Lake Garden VIEW)<br />\r\n<br />\r\nLargest unit in Sentral Residence<br />\r\n&nbsp;</p>', 'Kuala Lumpur, Malaysia', '[\"properties\\/6-2.jpg\",\"properties\\/7-2.jpg\",\"properties\\/9-1.jpg\",\"properties\\/8-2.jpg\",\"properties\\/10-1.jpg\",\"properties\\/11-1.jpg\"]', 1, 5, 7, 20, 377, '1590000.00', NULL, 1, 'selling', '2019-11-18 07:36:29', '2021-12-09 21:25:32', 'sale', 'Next to St Regis 5 Star Hotel, Excellent accessibility (LRT,KLIA TRANSIT,KTM), Rooftop Sky lounge, sky pool, sky gym, KLCC and Lake Garden VIEW', 1, 4, 'month', 6, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '42.504328', '-76.341293', 0),
(15, '2 Floor house in Compound Pejaten Barat Kemang', '<p>Want to lease a nice house in compound Renovated, balinese style ,homey and comfy area 220/300,&nbsp;3&nbsp;bedrooms,&nbsp;2 bathrooms, garden furnished renovated fasilitas : s.pool, tenis court, jogging track 24 hours security rent price : IDR 250.000.000 / year&nbsp;</p>', 'Kota Administrasi Jakarta Selatan, South Jakarta City, Jakarta Raya, Indonesia', '[\"properties\\/a1-2.jpg\",\"properties\\/a2-2.jpg\",\"properties\\/a3-2.jpg\",\"properties\\/a4-2.jpg\"]', 1, 3, 2, 2, 200, '1400.00', NULL, 1, 'renting', '2019-11-18 07:44:44', '2021-12-09 21:25:32', 'rent', 'Want to lease a nice house in compound Renovated, balinese style ,homey and comfy area 220/300, 3 bedrooms, 2 bathrooms, garden furnished renovated fasilitas : s.pool, tenis court, jogging track 24 hours security rent price : IDR 250.000.000 / year ', 1, 5, 'month', 5, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.636294', '-76.116519', 0),
(16, 'Apartment Muiderstraatweg in Diemen', '<p>For rent fully furnished 3 bedroom apartment in Diemen.<br />\r\nVery suitable for a couple or maximum 2 working sharers, garantors are not accepted.<br />\r\n<br />\r\nLovely modern and very well maintained apartment in Diemen.<br />\r\nThe property is located on the first floor where you will find the living room and the kitchen with all modern conveniences.<br />\r\nOn the second floor 2 bedrooms and a nice bathroom with a seperate shower and bathtub.<br />\r\nOn this floor you have access to the small roof terrace.<br />\r\nLast but not least there is a spacious attic room on the third floor.<br />\r\nThe tram stops in front of the door and within 20 minutes you are in the heart of Amsterdam.<br />\r\nPets are not allowed.</p>', 'Diemen, Netherlands', '[\"properties\\/b4-1.jpg\",\"properties\\/b3.jpg\",\"properties\\/b5-1.jpg\"]', 3, 3, 1, 2, 90, '2123.00', NULL, 1, 'renting', '2019-11-18 07:59:14', '2021-12-09 21:25:32', 'rent', 'Lovely modern and very well maintained apartment in Diemen.\r\nThe property is located on the first floor where you will find the living room and the kitchen with all modern conveniences.\r\nOn the second floor 2 bedrooms and a nice bathroom with a seperate shower and bathtub.\r\nOn this floor you have access to the small roof terrace.', 1, 3, 'month', 1, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.52876', '-76.65882', 0),
(17, 'Nice Apartment for rent in Berlin', '<p>Fully furnished shared all-inclusive apartments, with modern amenities that&rsquo;ll make you feel right at home. A great starting point for exploring the rest of the city and its many hidden gems. Area In the center of East Berlin, you&rsquo;ll find everything from delicious street food to flee markets, to high-end restaurants.</p>\r\n\r\n<p>In this bright, modern h(e)aven, you&rsquo;ll find a Queen size bed, a fully equipped kitchen, a separate bathroom with a walk-in shower and a study area for when the dedicated student in you awakens. Some come with great views, others with a nice and cozy balcony.</p>', 'Berlin, Germany', '[\"properties\\/t3.jpg\",\"properties\\/t1.jpg\",\"properties\\/t2.jpg\",\"properties\\/t4.jpg\",\"properties\\/t5.jpg\"]', 6, 1, 1, 1, 33, '1217.00', NULL, 1, 'renting', '2019-11-18 08:13:07', '2021-12-09 21:25:32', 'rent', 'Fully furnished shared all-inclusive apartments, with modern amenities that’ll make you feel right at home. A great starting point for exploring the rest of the city and its many hidden gems. Area In the center of East Berlin, you’ll find everything from delicious street food to flee markets, to high-end restaurants.', 1, 5, 'month', 4, 'Botble\\RealEstate\\Models\\Account', 'approved', '2025-03-25', 0, 1, '43.222732', '-76.105523', 0);

-- --------------------------------------------------------

--
-- Table structure for table `re_properties_translations`
--

CREATE TABLE `re_properties_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_properties_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_properties_translations`
--

INSERT INTO `re_properties_translations` (`lang_code`, `re_properties_id`, `name`, `description`, `content`, `location`) VALUES
('vi', 1, 'Bán biệt thự 3 phòng ngủ Calpe, Alicante', 'Biệt thự được trang bị đầy đủ tiện nghi. Ba phòng ngủ rộng rãi đều có lối đi thẳng ra sân thượng hồ bơi và phòng khách rộng rãi với nhà bếp kiểu Mỹ có thể nấu ăn, từ đó bạn có thể đi bộ lên sân thượng qua cửa kính lớn. Ở tầng dưới có một nhà để xe trong nhà, phòng giặt đồ với một cầu thang nội bộ đến nhà', '<p>Biệt thự được trang bị đầy đủ tiện nghi. Ba ph&ograve;ng ngủ rộng r&atilde;i đều c&oacute; lối đi thẳng ra s&acirc;n thượng hồ bơi v&agrave; ph&ograve;ng kh&aacute;ch rộng r&atilde;i với nh&agrave; bếp kiểu Mỹ c&oacute; thể nấu ăn, từ đ&oacute; bạn c&oacute; thể đi bộ l&ecirc;n s&acirc;n thượng qua cửa k&iacute;nh lớn. Ở tầng dưới c&oacute; một nh&agrave; để xe trong nh&agrave;, ph&ograve;ng giặt đồ với một cầu thang nội bộ đến nh&agrave;. Nhưng bạn cũng c&oacute; thể l&aacute;i xe l&ecirc;n đến cửa trước bằng &ocirc; t&ocirc;. S&acirc;n thượng rộng r&atilde;i v&agrave; c&oacute; một bể bơi cực d&agrave;i, thoải m&aacute;i bơi lội. Xung quanh c&oacute; một khu vườn cảnh quan. H&atilde;y d&agrave;nh thời gian để tận hưởng tuyệt vời trong v&agrave; xung quanh biệt thự xinh đẹp n&agrave;y.</p>', 'Alicante, Spain'),
('vi', 2, 'Bán nhà tại Johannesburg, South Africa', 'Nhà đẹp. Nép mình trên một mỏm đá của những tảng đá khổng lồ, ngôi nhà độc đáo này là một chiến thắng kiến trúc được thiết kế để chuẩn độ các giác quan ngay từ đầu với một thác nước đổ xuống hồ thạch anh đen nóng bỏng và hồ cá koi tuyệt đẹp. Hương vị của Seychelles', '<p>Nh&agrave; đẹp. N&eacute;p m&igrave;nh tr&ecirc;n một mỏm đ&aacute; của những tảng đ&aacute; khổng lồ, ng&ocirc;i nh&agrave; độc đ&aacute;o n&agrave;y l&agrave; một chiến thắng kiến tr&uacute;c được thiết kế để chuẩn độ c&aacute;c gi&aacute;c quan ngay từ đầu với một th&aacute;c nước đổ xuống hồ thạch anh đen n&oacute;ng bỏng v&agrave; hồ c&aacute; koi tuyệt đẹp. Hương vị của Seychelles. Đường v&agrave;o nh&agrave; được bao phủ bởi c&acirc;y dương sỉ 2 b&ecirc;n h&agrave;nh lang. Ph&ograve;ng kh&aacute;ch rộng r&atilde;i với l&ograve; sưởi đốt củi tuyệt đẹp v&agrave; ph&ograve;ng ăn lớn c&oacute; th&ecirc;m quầy rượu, được thiết kế v&agrave; x&acirc;y dựng như những bức tường hầm rượu.</p>', 'Johannesburg, South Africa'),
('vi', 3, 'Nhà phong cách Pháp', 'Khu nhà này có 4 phòng ngủ, sấp sỉ 5,000sqft, 3 nhà tắm với nội thất trang nhã và rộng rãi bao gồm phòng khách và ăn uống chính thức, phòng và nhà bếp tuyệt vời, phòng thư viện lớn với quầy bar.\r\nHồ bơi cạnh vô cực tuyệt đẹp giống như lối vào bãi biển, thác nước và cầu trượt.', '<p>Trang vi&ecirc;n&nbsp;lấy cảm hứng từ Ph&aacute;p tuyệt đẹp nằm trong Briarwood Ranch gần Solvang ở trung t&acirc;m thung lũng Santa Ynez tr&aacute;ng lệ. Khu nh&agrave; n&agrave;y c&oacute; 4 ph&ograve;ng ngủ, sấp sỉ 5,000sqft, 3 nh&agrave; tắm với nội thất trang nh&atilde; v&agrave; rộng r&atilde;i bao gồm ph&ograve;ng kh&aacute;ch v&agrave; ăn uống ch&iacute;nh thức, ph&ograve;ng v&agrave; nh&agrave; bếp tuyệt vời, ph&ograve;ng thư viện lớn với quầy bar.<br />\r\nHồ bơi cạnh v&ocirc; cực tuyệt đẹp giống như lối v&agrave;o b&atilde;i biển, th&aacute;c nước v&agrave; cầu trượt, Cabana v&agrave; nh&agrave; bếp kết hợp quầy bar BBQ b&ecirc;n hồ bơi miễn ph&iacute;. Nh&agrave; để xe rộng r&atilde;i, rộng r&atilde;i, liền kề với ph&ograve;ng thủ c&ocirc;ng v&agrave; studio nghệ thuật lớn</p>', 'Solvang, Santa Barbara County, CA 93463, USA'),
('vi', 4, 'Nhà bán tại Bermuda Dunes', 'Ngôi nhà được xây dựng tùy chỉnh hiếm có và đặc biệt này nằm trên một khu đất ra mắt trong khu vực riêng, độc quyền của Castle Harbor. Khu nhà có dải cỏ rộng 360 bước chân, không chỉ có tầm nhìn tuyệt đẹp mà còn hoàn toàn riêng tư. Ngôi nhà nằm phía trên sân cỏ, để có thêm sự riêng tư, và nằm giữa các luồng thứ 5 và thứ 6 của Câu lạc bộ Quốc gia Bermuda Dunes danh tiếng', '<p>Ng&ocirc;i nh&agrave; được x&acirc;y dựng t&ugrave;y chỉnh hiếm c&oacute; v&agrave; đặc biệt n&agrave;y nằm tr&ecirc;n một khu đất ra mắt trong khu vực ri&ecirc;ng, độc quyền của Castle Harbor. Khu nh&agrave; c&oacute; dải cỏ rộng 360 bước ch&acirc;n, kh&ocirc;ng chỉ c&oacute; tầm nh&igrave;n tuyệt đẹp m&agrave; c&ograve;n ho&agrave;n to&agrave;n ri&ecirc;ng tư. Ng&ocirc;i nh&agrave; nằm ph&iacute;a tr&ecirc;n s&acirc;n cỏ, để c&oacute; th&ecirc;m sự ri&ecirc;ng tư, v&agrave; nằm giữa c&aacute;c luồng thứ 5 v&agrave; thứ 6 của C&acirc;u lạc bộ Quốc gia Bermuda Dunes danh tiếng. Cửa ra v&agrave;o bằng k&iacute;nh được đưa bạn v&agrave;o một lối v&agrave;o Đ&aacute; cẩm thạch &Yacute; tuyệt đẹp bao gồm to&agrave;n bộ h&agrave;nh lang v&agrave; ph&ograve;ng kh&aacute;ch với một l&ograve; sưởi. Ph&ograve;ng lớn rộng lớn, với trần nh&agrave; cao l&ecirc;n, thu h&uacute;t hồ bơi, s&acirc;n g&ocirc;n, hồ nước v&agrave; hướng nam năng động, cảnh n&uacute;i non. C&oacute; một thư viện đ&aacute;ng y&ecirc;u được x&acirc;y dựng tr&ecirc;n c&aacute;c kệ tr&ecirc;n một bức tường. C&oacute; một qu&aacute;n bar m&aacute;t mẻ, với s&agrave;n l&aacute;t đ&aacute; cẩm thạch của &Yacute;, cung cấp tầm nh&igrave;n ra s&acirc;n g&ocirc;n v&agrave; những ngọn n&uacute;i xung quanh.</p>', 'Bermuda Dunes, Riverside County, CA 92203, USA'),
('vi', 5, 'Căn hộ Walnut Park', 'Khu rừng rậm rạp với những ngọn cây dài 30 feet nhìn xuống. Walnut Creek tuyệt đẹp.\r\nVị trí thuận tiện trên North Lamar gần nhiều cửa hàng, doanh nghiệp và nhà hàng.\r\nDễ dàng truy cập I-35 và một khoảng cách ngắn đến US-183 và SH-45 Có câu lạc bộ thanh lịch với nhà bếp đầy đủ, khu vực quầy bar, khu vực thư giãn và hiên nhìn ra thung lũng.', '<p>Chỉ c&oacute; 11 dặm từ trung t&acirc;m th&agrave;nh phố Austin, khu căn hộ nhiều c&acirc;y cối rậm rạp gi&aacute;p Walnut Creek v&agrave; tạo cho người d&acirc;n cảm hứng trong một cộng đồng đẳng cấp ri&ecirc;ng biệt.<br />\r\nKhu rừng rậm rạp với những ngọn c&acirc;y d&agrave;i 30 feet nh&igrave;n xuống. Walnut Creek tuyệt đẹp.<br />\r\nVị tr&iacute; thuận tiện tr&ecirc;n North Lamar gần nhiều cửa h&agrave;ng, doanh nghiệp v&agrave; nh&agrave; h&agrave;ng.<br />\r\nDễ d&agrave;ng truy cập I-35 v&agrave; một khoảng c&aacute;ch ngắn đến US-183 v&agrave; SH-45 C&oacute; c&acirc;u lạc bộ thanh lịch với nh&agrave; bếp đầy đủ, khu vực quầy bar, khu vực thư gi&atilde;n v&agrave; hi&ecirc;n nh&igrave;n ra thung lũng.<br />\r\nTrung t&acirc;m thể dục được trang bị đầy đủ 24 giờ với tủ kh&oacute;a v&agrave; khu vực thay đồ.<br />\r\nSpa trong nh&agrave; với th&aacute;c nước, ph&ograve;ng tắm hơi v&agrave; ph&ograve;ng x&ocirc;ng hơi tuyết t&ugrave;ng.<br />\r\nNh&agrave; bếp rộng r&atilde;i, s&agrave;nh điệu với mặt đ&aacute; granite v&agrave; ốp lưng.<br />\r\nThiết bị bằng th&eacute;p kh&ocirc;ng gỉ v&agrave; phạm vi kh&iacute; đốt tự nhi&ecirc;n.<br />\r\nThiết kế tủ gỗ cứng với &aacute;nh s&aacute;ng dưới tủ</p>', 'North Lamar Boulevard, Austin, Texas, USA'),
('vi', 6, 'Cho thuê nhà cao cấp 5 phòng ngủ', 'Ngôi nhà được tu sửa sang trọng và rộng rãi ở Sea Cliff với 3 tầng, 5 phòng ngủ và 4 phòng tắm, và Golden Gate View. Gara ô tô 4 chỗ. Ngôi nhà được tu sửa và rộng rãi với bố cục tuyệt vời, và được cung cấp nội thất. Nó quyến rũ và xinh đẹp với nhiều chi tiết, có cảnh quan phía trước chu đáo và sân sau rộng và sân trong, và có một cái nhìn tuyệt vời về Cổng Vàng', '<p>Ng&ocirc;i nh&agrave; được tu sửa sang trọng v&agrave; rộng r&atilde;i ở Sea Cliff với 3 tầng, 5 ph&ograve;ng ngủ v&agrave; 4 ph&ograve;ng tắm, v&agrave; Golden Gate View. Gara &ocirc; t&ocirc; 4 chỗ. Ng&ocirc;i nh&agrave; được tu sửa v&agrave; rộng r&atilde;i với bố cục tuyệt vời, v&agrave; được cung cấp nội thất. N&oacute; quyến rũ v&agrave; xinh đẹp với nhiều chi tiết, c&oacute; cảnh quan ph&iacute;a trước chu đ&aacute;o v&agrave; s&acirc;n sau rộng v&agrave; s&acirc;n trong, v&agrave; c&oacute; một c&aacute;i nh&igrave;n tuyệt vời về Cổng V&agrave;ng. Ở cấp độ ch&iacute;nh, lối v&agrave;o mở ra một sảnh lớn kết nối với ph&ograve;ng kh&aacute;ch đẹp v&agrave; rộng c&oacute; l&ograve; sưởi v&agrave; ph&ograve;ng ăn trang trọng.<br />\r\n<br />\r\nNg&ocirc;i nh&agrave; c&oacute; một nh&agrave; để xe c&oacute; thể chứa 3 đến 4 xe hơi. Ng&ocirc;i nh&agrave; được cung cấp nội thất. C&oacute; thể được cho thu&ecirc; ngắn hạn hoặc d&agrave;i hạn. Thời hạn thu&ecirc; tối thiểu l&agrave; 3 th&aacute;ng.</p>', 'Seacliff San Francisco, Sea Cliff Avenue, San Francisco, CA 94121, USA'),
('vi', 7, 'Cho thuê nhà view đẹp', 'Có một phòng ăn chính thức và phòng khách rộng rãi nằm ở hai bên của giếng trời nhà bếp được cập nhật, tủ màu trắng và các thiết bị bằng thép không gỉ. Tận hưởng ánh sáng tự nhiên rộng rãi và quang cảnh phía nam ngoạn mục từ các cửa sổ lớn của phòng khách chính và sàn đi bộ. Một phòng thưởng (phòng ngủ cho khách / văn phòng) và phòng tắm đầy đủ.', '<p>C&oacute; một ph&ograve;ng ăn ch&iacute;nh thức v&agrave; ph&ograve;ng kh&aacute;ch rộng r&atilde;i nằm ở hai b&ecirc;n của giếng trời nh&agrave; bếp được cập nhật, tủ m&agrave;u trắng v&agrave; c&aacute;c thiết bị bằng th&eacute;p kh&ocirc;ng gỉ. Tận hưởng &aacute;nh s&aacute;ng tự nhi&ecirc;n rộng r&atilde;i v&agrave; quang cảnh ph&iacute;a nam ngoạn mục từ c&aacute;c cửa sổ lớn của ph&ograve;ng kh&aacute;ch ch&iacute;nh v&agrave; s&agrave;n đi bộ. Một ph&ograve;ng thưởng (ph&ograve;ng ngủ cho kh&aacute;ch / văn ph&ograve;ng) v&agrave; ph&ograve;ng tắm đầy đủ.</p>', 'Safeway San Francisco CA, Market Street, San Francisco, CA 94114, USA'),
('vi', 8, 'Bán căn hộ Osaka Heights', 'Sàn lát gạch men, mặt bàn đá granite, chậu rửa bát inox đơn có bảng thoát nước và các quy định cho máy lọc nước, máy hút mùi điện, quạt hút sẽ được cung cấp. Gạch chống trượt trên sàn và gạch ốp tường có chiều cao lên đến 7 feet. Phụ kiện vệ sinh thương hiệu màu trắng, vòi mạ crom, hệ thống ống nước che giấu.', '<p><strong>Ph&ograve;ng bếp</strong><br />\r\nS&agrave;n l&aacute;t gạch men, mặt b&agrave;n đ&aacute; granite, chậu rửa b&aacute;t inox đơn c&oacute; bảng tho&aacute;t nước v&agrave; c&aacute;c quy định cho m&aacute;y lọc nước, m&aacute;y h&uacute;t m&ugrave;i điện, quạt h&uacute;t sẽ được cung cấp</p>\r\n\r\n<p><strong>Nh&agrave; vệ sinh</strong><br />\r\nGạch chống trượt tr&ecirc;n s&agrave;n v&agrave; gạch ốp tường c&oacute; chiều cao l&ecirc;n đến 7 feet. Phụ kiện vệ sinh thương hiệu m&agrave;u trắng, v&ograve;i mạ crom, hệ thống ống nước che giấu</p>\r\n\r\n<p><strong>Cửa ra v&agrave;o</strong><br />\r\nCửa ch&iacute;nh sẽ l&agrave; cửa gỗ chất lượng cao, cửa b&ecirc;n trong chất lượng cao cấp Windows c&oacute; khung gỗ, cửa trượt bằng nhựa UPVC hoặc nh&ocirc;m v&agrave; khung nh&ocirc;m c&oacute; k&iacute;nh cho cửa sổ</p>\r\n\r\n<p>9 km đến lối v&agrave;o đường cao tốc s&acirc;n bay Katunayaka</p>\r\n\r\n<p>12 km đến lối v&agrave;o đường cao tốc ph&iacute;a Nam tại Kottawa</p>\r\n\r\n<p>2 km đến bệnh viện đa khoa Kalubowila</p>\r\n\r\n<p>Tất cả c&aacute;c ng&acirc;n h&agrave;ng h&agrave;ng đầu trong v&ograve;ng v&agrave;i km b&aacute;n k&iacute;nh</p>\r\n\r\n<p>Rất gần c&aacute;c ga đường sắt</p>\r\n\r\n<p>Nhiều trường h&agrave;ng đầu bao gồm CIS trong b&aacute;n k&iacute;nh 5 km</p>', 'High Level Road, Colombo 06, Sri Lanka'),
('vi', 9, 'Bán nhà chính chủ Magnificent View', 'Nhà rộng rãi 3 phòng ngủ, sáng sủa với lối vào sảnh. Phòng tắm nắng, nhà bếp / phòng ăn / phòng khách có không gian mở với trần lót gỗ tuyết tùng, nhà bếp với tủ gỗ oregon và lò nướng Smeg mới. Máy lạnh & máy sưởi gỗ', '<p>Nh&agrave; rộng r&atilde;i 3 ph&ograve;ng ngủ, s&aacute;ng sủa với lối v&agrave;o sảnh. Ph&ograve;ng tắm nắng, nh&agrave; bếp / ph&ograve;ng ăn / ph&ograve;ng kh&aacute;ch c&oacute; kh&ocirc;ng gian mở với trần l&oacute;t gỗ tuyết t&ugrave;ng, nh&agrave; bếp với tủ gỗ oregon v&agrave; l&ograve; nướng Smeg mới. M&aacute;y lạnh &amp; m&aacute;y sưởi gỗ<br />\r\nPh&ograve;ng ngủ k&iacute;ch thước tốt v&agrave; ph&ograve;ng ngủ ch&iacute;nh với spa nh&igrave;n ra khu vườn y&ecirc;n tĩnh v&agrave; lối v&agrave;o.</p>', '110 Springdale Heights, Hay Denmark, WA, Australia'),
('vi', 10, 'Cho thuê nhà trên đường Thompsons', 'Nằm ở vị trí hoàn hảo trong vùng ngoại ô độc quyền của Bulleen, ngôi nhà 3 phòng ngủ được cải tạo này mang đến một lối sống tuyệt vời cho những người tìm kiếm tất cả các tiện nghi, sự riêng tư, thuận tiện cho đường cao tốc & giao thông, và không gian.\r\nBạn được chào đón bởi một khu vườn phía trước đẹp, ít bảo trì và được thiết lập, với bãi đậu xe rộng rãi, một hiên nhà cao và nhà để xe lớn tantum', '<p>Nằm ở vị tr&iacute; ho&agrave;n hảo trong v&ugrave;ng ngoại &ocirc; độc quyền của Bulleen, ng&ocirc;i nh&agrave; 3 ph&ograve;ng ngủ được cải tạo n&agrave;y mang đến một lối sống tuyệt vời cho những người t&igrave;m kiếm tất cả c&aacute;c tiện nghi, sự ri&ecirc;ng tư, thuận tiện cho đường cao tốc &amp; giao th&ocirc;ng, v&agrave; kh&ocirc;ng gian.<br />\r\nBạn được ch&agrave;o đ&oacute;n bởi một khu vườn ph&iacute;a trước đẹp, &iacute;t bảo tr&igrave; v&agrave; được thiết lập, với b&atilde;i đậu xe rộng r&atilde;i, một hi&ecirc;n nh&agrave; cao v&agrave; nh&agrave; để xe lớn tantum. B&ecirc;n trong, bạn sẽ t&igrave;m thấy một bảng m&agrave;u trung t&iacute;nh đ&aacute;ng y&ecirc;u v&agrave; gần s&agrave;n gỗ mới lấp l&aacute;nh. C&oacute; ba ph&ograve;ng ngủ rộng r&atilde;i, tất cả đều được x&acirc;y dựng với &aacute;o cho&agrave;ng, được phục vụ bởi ph&ograve;ng tắm gia đ&igrave;nh trung t&acirc;m v&agrave; ph&ograve;ng bột ri&ecirc;ng biệt, c&ugrave;ng với một ph&ograve;ng kh&aacute;ch rộng mở v&agrave; ph&ograve;ng ăn trang trọng rạng rỡ với &aacute;nh s&aacute;ng tự nhi&ecirc;n. Nh&agrave; bếp tuyệt đẹp đi k&egrave;m với c&aacute;c thiết bị Blanco, quầy bar ăn s&aacute;ng v&agrave; c&aacute;c phụ kiện v&agrave; đồ đạc chất lượng h&agrave;ng đầu.</p>', 'Thompsons Road, Bulleen VIC, Australia'),
('vi', 11, 'Căn hộ 1 phòng ngủ hoàn toàn mới ở vị trí hạng nhất', 'Nằm phía sau Sandy Bay Road, đi bộ đến mọi thứ quan trọng: làng Battery Point sôi động, Salamanca Place (khu giải trí hàng đầu của Tasmania), Trung tâm thành phố, Đại học Tasmania, khách sạn, bán lẻ và dễ dàng đi bộ từ các cửa hàng Sandy Bay nhộn nhịp, trường học địa phương và với giao thông công cộng bên ngoài cửa trước của bạn.', '<p>Nằm ph&iacute;a sau Sandy Bay Road, đi bộ đến mọi thứ quan trọng: l&agrave;ng Battery Point s&ocirc;i động, Salamanca Place (khu giải tr&iacute; h&agrave;ng đầu của Tasmania), Trung t&acirc;m th&agrave;nh phố, Đại học Tasmania, kh&aacute;ch sạn, b&aacute;n lẻ v&agrave; dễ d&agrave;ng đi bộ từ c&aacute;c cửa h&agrave;ng Sandy Bay nhộn nhịp, trường học địa phương v&agrave; với giao th&ocirc;ng c&ocirc;ng cộng b&ecirc;n ngo&agrave;i cửa trước của bạn.<br />\r\nXin lưu &yacute;: Người cao tuổi Brown v&agrave; Ng&acirc;n h&agrave;ng kh&ocirc;ng chấp nhận đơn đăng k&yacute; từ những người nộp đơn chưa kiểm tra t&agrave;i sản trong nội bộ.</p>', 'Sandy Bay Road, Sandy Bay TAS, Australia'),
('vi', 12, 'Nhà cao cấp thanh lịch', 'Dọn vào ở ngay, ngôi nhà bốn phòng ngủ được trình bày đẹp mắt này và tận hưởng những điều tốt nhất trong cuộc sống gia đình hiện đại không cần trang bị tu sửa gì thêm. Hai khu vực sinh hoạt riêng biệt và bốn phòng ngủ rộng rãi cung cấp nhiều không gian để phát triển, và giải trí là một niềm vui thực sự trên sân hiên thanh lịch trong một khung cảnh vườn yên bình', '<p>Dọn v&agrave;o ở ngay, ng&ocirc;i nh&agrave; bốn ph&ograve;ng ngủ được tr&igrave;nh b&agrave;y đẹp mắt n&agrave;y v&agrave; tận hưởng những điều tốt nhất trong cuộc sống gia đ&igrave;nh hiện đại kh&ocirc;ng cần trang bị tu sửa g&igrave; th&ecirc;m. Hai khu vực sinh hoạt ri&ecirc;ng biệt v&agrave; bốn ph&ograve;ng ngủ rộng r&atilde;i cung cấp nhiều kh&ocirc;ng gian để ph&aacute;t triển, v&agrave; giải tr&iacute; l&agrave; một niềm vui thực sự tr&ecirc;n s&acirc;n hi&ecirc;n thanh lịch trong một khung cảnh vườn y&ecirc;n b&igrave;nh. Ng&ocirc;i nh&agrave; l&yacute; tưởng đặt khoảng c&aacute;ch đi bộ đến c&ocirc;ng vi&ecirc;n v&agrave; trạm dừng xe bu&yacute;t, những khoảnh khắc bạn chọn trường v&agrave; chỉ v&agrave;i ph&uacute;t đến Westfield North Lakes.</p>', 'North Lakes QLD 4509, Australia'),
('vi', 13, 'Cần bán căn hộ cao cấp tại Singapore', 'Căn hộ này nằm ở Singapore, tầng cao, gia đình Trung Quốc, khu vườn Trên Mây, sân thượng đẹp với Jaccuzzi và phòng ăn Alfresco, được cải tạo với chất lượng hoàn thiện, gần Tiện nghi, rất nhiều quán ăn, 5 phút đi bộ đến NTUC / Shaw Plaza, chỉ mất vài phút lái xe đến đại lộ', '<p>Căn hộ n&agrave;y nằm ở Singapore, nơi đ&atilde; trở th&agrave;nh một trung t&acirc;m sống thoải m&aacute;i cho người sống, cung cấp cả lợi nhuận hấp dẫn cho c&aacute;c nh&agrave; đầu tư v&agrave; ph&iacute; bảo hiểm cao.<br />\r\n- Tầng cao<br />\r\n- Gia đ&igrave;nh trung quốc<br />\r\n- Khu vườn Tr&ecirc;n M&acirc;y<br />\r\n- S&acirc;n thượng đẹp với Jaccuzzi v&agrave; Ph&ograve;ng ăn Alfresco<br />\r\n- Được cải tạo với chất lượng ho&agrave;n thiện<br />\r\n- Gần Tiện nghi<br />\r\n- Rất nhiều qu&aacute;n ăn.<br />\r\n- 5 ph&uacute;t đi bộ đến NTUC / Shaw Plaza<br />\r\n- Chỉ mất v&agrave;i ph&uacute;t l&aacute;i xe đến đại lộ</p>', 'Balestier Road, Singapore'),
('vi', 14, 'Cần bán căn hộ cao cấp 5 phòng tại Kuala Lumpur', 'Kế bên khách sạn 5 sao St Regis\r\nKhả năng tiếp cận tuyệt vời (LRT, KLIA TRANSIT, KTM)\r\nPhòng chờ trên tầng thượng, hồ bơi ngoài trời, phòng tập thể dục ngoài trời, View KLCC và Lake Garden', '<p>The Sentral Residence (CONDO LUXURY MỚI)</p>\r\n\r\n<p>Kế b&ecirc;n&nbsp;kh&aacute;ch sạn 5 sao St Regis<br />\r\nKhả năng tiếp cận tuyệt vời (LRT, KLIA TRANSIT, KTM)<br />\r\nPh&ograve;ng chờ tr&ecirc;n tầng thượng, hồ bơi ngo&agrave;i&nbsp;trời, ph&ograve;ng tập thể dục ngo&agrave;i&nbsp;trời<br />\r\n-Private n&acirc;ng sảnh để sở hữu đơn vị</p>\r\n\r\n<p>ĐƠN VỊ PREMIUM EPIC LUXE<br />\r\n(View KLCC v&agrave;&nbsp;Lake Garden)</p>\r\n\r\n<p>Đơn vị lớn nhất tại Sentral Residence</p>', 'Kuala Lumpur, Malaysia'),
('vi', 15, 'Nhà 2 tầng tại Compound Pejaten Barat Kemang', 'Muốn cho thuê một ngôi nhà đẹp trong khu phức hợp. Được cải tạo, theo phong cách Bali, khu nhà ấm cúng và thoải mái 220/300, 3 phòng ngủ, 2 phòng tắm, sân vườn được cải tạo: hồ bơi, khu đánh tenis, đường chạy bộ 24 giờ giá thuê an ninh: 250.000 IDR. 000 / năm', '<p>Muốn cho thu&ecirc; một ng&ocirc;i nh&agrave; đẹp trong khu phức hợp. Được cải tạo, theo phong c&aacute;ch Bali, khu nh&agrave; ấm c&uacute;ng v&agrave; thoải m&aacute;i 220/300, 3 ph&ograve;ng ngủ, 2 ph&ograve;ng tắm, s&acirc;n vườn được cải tạo: hồ bơi, khu đ&aacute;nh tenis, đường chạy bộ 24 giờ gi&aacute; thu&ecirc; an ninh: 250.000 IDR. 000 / năm</p>', 'Kota Administrasi Jakarta Selatan, South Jakarta City, Jakarta Raya, Indonesia'),
('vi', 16, 'Căn hộ Muiderstraatweg ở Diemen', 'Căn hộ hiện đại đáng yêu và được bảo trì rất tốt ở Diemen.\r\nNhà khách nằm ở tầng một, nơi bạn sẽ tìm thấy phòng khách và nhà bếp với tất cả các tiện nghi hiện đại.\r\nTrên tầng hai, 2 phòng ngủ và một phòng tắm đẹp với vòi sen và bồn tắm riêng biệt.\r\nTrên tầng này bạn có quyền ra vào sân thượng nhỏ.', '<p>Cho thu&ecirc; căn hộ 3 ph&ograve;ng ngủ đầy đủ nội thất ở Diemen.<br />\r\nRất th&iacute;ch hợp cho một cặp vợ chồng&nbsp;hoặc tối đa 2 người chia sẻ l&agrave;m việc, kh&ocirc;ng bị kiểm so&aacute;t bởi chủ nh&agrave;</p>\r\n\r\n<p>Căn hộ hiện đại đ&aacute;ng y&ecirc;u v&agrave; được bảo tr&igrave; rất tốt ở Diemen.<br />\r\nNh&agrave; kh&aacute;ch&nbsp;nằm ở tầng một, nơi bạn sẽ t&igrave;m thấy ph&ograve;ng kh&aacute;ch v&agrave; nh&agrave; bếp với tất cả c&aacute;c tiện nghi hiện đại.<br />\r\nTr&ecirc;n tầng hai, 2 ph&ograve;ng ngủ v&agrave; một ph&ograve;ng tắm đẹp với v&ograve;i sen v&agrave; bồn tắm ri&ecirc;ng biệt.<br />\r\nTr&ecirc;n tầng n&agrave;y bạn c&oacute; quyền ra v&agrave;o s&acirc;n thượng nhỏ.<br />\r\nCuối c&ugrave;ng nhưng kh&ocirc;ng k&eacute;m phần quan trọng l&agrave; một ph&ograve;ng g&aacute;c m&aacute;i rộng r&atilde;i tr&ecirc;n tầng ba.<br />\r\nXe điện dừng trước cửa v&agrave; trong v&ograve;ng 20 ph&uacute;t, bạn sẽ ở trung t&acirc;m của Amsterdam.<br />\r\nTh&uacute; cưng kh&ocirc;ng được ph&eacute;p nu&ocirc;i.</p>', 'Diemen, Netherlands'),
('vi', 17, 'Căn hộ đẹp cho thuê ở Berlin', 'Căn hộ đầy đủ nội thất, với các tiện nghi hiện đại sẽ khiến bạn cảm thấy như đang ở nhà. Một điểm khởi đầu tuyệt vời để khám phá phần còn lại của thành phố và nhiều viên ngọc ẩn của nó. Khu vực Ở trung tâm của Đông Berlin, bạn sẽ tìm thấy mọi thứ, từ những món ăn đường phố ngon đến những khu chợ trời, đến những nhà hàng cao cấp.', '<p>Căn hộ đầy đủ nội thất, với c&aacute;c tiện nghi hiện đại sẽ khiến bạn cảm thấy như đang ở nh&agrave;. Một điểm khởi đầu tuyệt vời để kh&aacute;m ph&aacute; phần c&ograve;n lại của th&agrave;nh phố v&agrave; nhiều vi&ecirc;n ngọc ẩn của n&oacute;. Khu vực Ở trung t&acirc;m của Đ&ocirc;ng Berlin, bạn sẽ t&igrave;m thấy mọi thứ, từ những m&oacute;n ăn đường phố ngon đến những khu chợ trời, đến những nh&agrave; h&agrave;ng cao cấp.<br />\r\nTrong nh&agrave; c&oacute;&nbsp;một chiếc giường cỡ Queen, nh&agrave; bếp đầy đủ tiện nghi, ph&ograve;ng tắm ri&ecirc;ng biệt với v&ograve;i sen kh&ocirc;ng cửa v&agrave; khu vực học tập khi sinh vi&ecirc;n tận tụy thức dậy. Một số ph&ograve;ng c&oacute; tầm nh&igrave;n tuyệt vời, số kh&aacute;c c&oacute; ban c&ocirc;ng đẹp v&agrave; ấm c&uacute;ng.</p>', 'Berlin, Germany');

-- --------------------------------------------------------

--
-- Table structure for table `re_property_categories`
--

CREATE TABLE `re_property_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_property_categories`
--

INSERT INTO `re_property_categories` (`id`, `property_id`, `category_id`) VALUES
(111, 13, 5),
(156, 1, 1),
(162, 8, 6),
(164, 10, 5),
(169, 17, 4),
(182, 2, 1),
(183, 3, 5),
(184, 4, 6),
(185, 5, 6),
(186, 6, 3),
(187, 7, 5),
(188, 9, 2),
(189, 11, 5),
(190, 12, 2),
(191, 14, 5),
(192, 15, 5),
(193, 16, 6);

-- --------------------------------------------------------

--
-- Table structure for table `re_property_features`
--

CREATE TABLE `re_property_features` (
  `property_id` int(10) UNSIGNED NOT NULL,
  `feature_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `re_property_features`
--

INSERT INTO `re_property_features` (`property_id`, `feature_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(5, 12),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11),
(7, 12),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 12),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 12),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 9),
(11, 10),
(11, 11),
(11, 12),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 9),
(12, 10),
(12, 11),
(12, 12),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(13, 7),
(13, 8),
(13, 9),
(13, 10),
(13, 11),
(13, 12),
(14, 1),
(14, 2),
(14, 3),
(14, 4),
(14, 5),
(14, 6),
(14, 7),
(14, 8),
(14, 9),
(14, 10),
(14, 11),
(14, 12),
(15, 1),
(15, 2),
(15, 3),
(15, 4),
(15, 5),
(15, 6),
(15, 7),
(15, 8),
(15, 9),
(15, 10),
(15, 11),
(15, 12),
(16, 1),
(16, 2),
(16, 3),
(16, 4),
(16, 5),
(16, 6),
(16, 7),
(16, 8),
(16, 9),
(16, 10),
(16, 11),
(16, 12),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 6),
(17, 7),
(17, 8),
(17, 9),
(17, 10),
(17, 11),
(17, 12),
(18, 1),
(18, 2),
(18, 3),
(18, 4),
(18, 5),
(18, 6),
(18, 7),
(18, 8),
(18, 9),
(18, 10),
(18, 11),
(18, 12),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 5),
(19, 6),
(19, 7),
(19, 8),
(19, 9),
(19, 10),
(19, 11),
(19, 12),
(20, 1),
(20, 2),
(20, 3),
(20, 4),
(20, 5),
(20, 6),
(20, 7),
(20, 8),
(20, 9),
(20, 10),
(20, 11),
(20, 12),
(21, 1),
(21, 2),
(21, 3),
(21, 4),
(21, 5),
(21, 6),
(21, 7),
(21, 8),
(21, 9),
(21, 10),
(21, 11),
(21, 12),
(22, 1),
(22, 2),
(22, 3),
(22, 4),
(22, 5),
(22, 6),
(22, 7),
(22, 8),
(22, 9),
(22, 10),
(22, 11),
(22, 12),
(23, 1),
(23, 2),
(23, 3),
(23, 4),
(23, 5),
(23, 6),
(23, 7),
(23, 8),
(23, 9),
(23, 10),
(23, 11),
(23, 12),
(24, 1),
(24, 2),
(24, 3),
(24, 4),
(24, 5),
(24, 6),
(24, 7),
(24, 8),
(24, 9),
(24, 10),
(24, 11),
(24, 12),
(25, 1),
(25, 2),
(25, 3),
(25, 4),
(25, 5),
(25, 6),
(25, 7),
(25, 8),
(25, 9),
(25, 10),
(25, 11),
(25, 12),
(26, 1),
(26, 2),
(26, 3),
(26, 4),
(26, 5),
(26, 6),
(26, 7),
(26, 8),
(26, 9),
(26, 10),
(26, 11),
(26, 12),
(27, 1),
(27, 2),
(27, 3),
(27, 4),
(27, 5),
(27, 6),
(27, 7),
(27, 8),
(27, 9),
(27, 10),
(27, 11),
(27, 12),
(28, 1),
(28, 2),
(28, 3),
(28, 4),
(28, 5),
(28, 6),
(28, 7),
(28, 8),
(28, 9),
(28, 10),
(28, 11),
(28, 12),
(29, 1),
(29, 2),
(29, 3),
(29, 4),
(29, 5),
(29, 6),
(29, 7),
(29, 8),
(29, 9),
(29, 10),
(29, 11),
(29, 12),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(30, 5),
(30, 6),
(30, 7),
(30, 8),
(30, 9),
(30, 10),
(30, 11),
(30, 12),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(31, 5),
(31, 6),
(31, 7),
(31, 8),
(31, 9),
(31, 10),
(31, 11),
(31, 12),
(32, 1),
(32, 2),
(32, 3),
(32, 4),
(32, 5),
(32, 6),
(32, 7),
(32, 8),
(32, 9),
(32, 10),
(32, 11),
(32, 12),
(33, 1),
(33, 2),
(33, 3),
(33, 4),
(33, 5),
(33, 6),
(33, 7),
(33, 8),
(33, 9),
(33, 10),
(33, 11),
(33, 12),
(34, 1),
(34, 2),
(34, 3),
(34, 4),
(34, 5),
(34, 6),
(34, 7),
(34, 8),
(34, 9),
(34, 10),
(34, 11),
(34, 12);

-- --------------------------------------------------------

--
-- Table structure for table `re_tags`
--

CREATE TABLE `re_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `re_tags_items`
--

CREATE TABLE `re_tags_items` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'demo', 'Demo', '{\"career.index\":true,\"career.create\":true,\"career.edit\":true,\"career.destroy\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true}', 'Test', 0, 1, 1, '2021-01-03 17:23:52', '2021-01-03 17:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2021-01-03 17:24:01', '2021-01-03 17:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(11, 'admin_email', 'admin@botble.com', NULL, NULL),
(12, 'time_zone', 'UTC', NULL, NULL),
(13, 'enable_send_error_reporting_via_email', '0', NULL, NULL),
(16, 'admin_title', 'Flex Home', NULL, NULL),
(17, 'rich_editor', 'ckeditor', NULL, NULL),
(18, 'default_admin_theme', 'default', NULL, NULL),
(19, 'enable_change_admin_theme', '1', NULL, NULL),
(20, 'enable_multi_language_in_admin', '1', NULL, NULL),
(21, 'enable_cache', '0', NULL, NULL),
(22, 'cache_time', '10', NULL, NULL),
(23, 'cache_admin_menu_enable', '0', NULL, NULL),
(24, 'optimize_page_speed_enable', '0', NULL, NULL),
(27, 'cache_time_site_map', '3600', NULL, NULL),
(28, 'show_admin_bar', '1', NULL, NULL),
(29, 'theme-flex-home-site_title', 'Flex Home', NULL, NULL),
(30, 'theme-flex-home-show_site_name', '0', NULL, NULL),
(33, 'theme-flex-home-copyright', '© 2020 Flex Home is Proudly Powered by Botble Team', NULL, NULL),
(37, 'theme-flex-home-logo', 'logo/logo.png', NULL, NULL),
(40, 'theme-flex-home-facebook', 'https://www.facebook.com', NULL, NULL),
(41, 'theme-flex-home-youtube', 'https://youtube.com', NULL, NULL),
(44, 'theme-flex-home-hotline', '18006268', NULL, NULL),
(45, 'theme-flex-home-address', 'North Link Building, 10 Admiralty Street, 757695 Singapore', NULL, NULL),
(46, 'theme-flex-home-email', 'contact@flex-home.com', NULL, NULL),
(49, 'theme-flex-home-logo_white', 'logo/logo-white.png', NULL, NULL),
(50, 'membership_authorization_at', '2020-09-23 12:52:41', NULL, NULL),
(56, 'enable_captcha', '0', NULL, NULL),
(57, 'captcha_site_key', 'no-captcha-site-key', NULL, NULL),
(58, 'captcha_secret', 'no-captcha-secret', NULL, NULL),
(65, 'store_weight_unit', 'g', NULL, NULL),
(66, 'store_width_height_unit', 'cm', NULL, NULL),
(67, 'currencies_is_default', '0', NULL, NULL),
(72, 'language_show_default_item_if_current_version_not_existed', '1', NULL, NULL),
(73, 'theme-flex-home-seo_title', 'Flex Home', NULL, NULL),
(85, 'theme-flex-home-vi-site_title', 'Flex Home - Trang thông tin mua bán Bất Động Sản', NULL, NULL),
(86, 'theme-flex-home-vi-show_site_name', '0', NULL, NULL),
(87, 'theme-flex-home-vi-seo_title', 'Flex Home - Trang thông tin mua bán Bất Động Sản', NULL, NULL),
(90, 'theme-flex-home-vi-copyright', '© 2020 Flex Home là một sản phẩm về lĩnh vực bất động sản của Botble Team', NULL, NULL),
(91, 'theme-flex-home-vi-hotline', '18006268', NULL, NULL),
(92, 'theme-flex-home-vi-address', 'Tòa nhà North Link, Đường 10 Admiralty, 757695 Singapore', NULL, NULL),
(93, 'theme-flex-home-vi-email', 'contact@flex-home.com', NULL, NULL),
(95, 'theme-flex-home-vi-logo', 'logo/logo.png', NULL, NULL),
(96, 'theme-flex-home-vi-logo_white', 'logo/logo-white.png', NULL, NULL),
(104, 'theme-flex-home-vi-facebook', 'https://www.facebook.com', NULL, NULL),
(105, 'theme-flex-home-vi-youtube', 'https://youtube.com', NULL, NULL),
(133, 'theme-flex-home-favicon', 'logo/favicon.png', NULL, NULL),
(143, 'theme-flex-home-vi-favicon', 'logo/favicon.png', NULL, NULL),
(148, 'theme-flex-home-seo_description', 'Find your favorite homes at Flex Home', NULL, NULL),
(149, 'theme-flex-home-about-us', 'Founded on August 28, 1993 (formerly known as Truong Thinh Phat Construction Co., Ltd.), Flex Home operates in the field of real estate business, building villas for rent.\n\nSlogan \"Breaking time, through space\".', NULL, NULL),
(150, 'theme-flex-home-home_project_description', 'We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more', NULL, NULL),
(151, 'theme-flex-home-home_description_for_properties_by_locations', 'Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.', NULL, NULL),
(152, 'theme-flex-home-home_description_for_news', 'Below is the latest real estate news we get regularly updated from reliable sources.', NULL, NULL),
(153, 'theme-flex-home-vi-seo_description', 'Tìm ngôi nhà yêu thích tại FlexHome', NULL, NULL),
(154, 'theme-flex-home-vi-about-us', 'Được thành lập ngày 28 - 08 -1993 (tiền thân là công ty TNHH Xây Dựng Trường Thịnh Phát), Flex Home hoạt động trong lĩnh vực kinh doanh bất động sản, xây biệt thự cho thuê. \nPhương châm  “Đánh bật thời gian, xuyên qua không gian\"', NULL, NULL),
(155, 'theme-flex-home-vi-home_project_description', 'Chúng tôi đưa ra những lựa chọn tốt nhất với những dự án hot và uy tín bậc nhất hiện nay, hãy truy cập vào thông tin chi tiết bên dưới để tìm hiểu thêm nhé.', NULL, NULL),
(156, 'theme-flex-home-vi-home_description_for_properties_by_locations', 'Mỗi căn hộ là một lựa chọn tốt, nó sẽ giúp bạn đưa ra quyết định đúng đắn, đừng bỏ lỡ cơ hội khám phá những căn hộ tuyệt vời của chúng tôi.', NULL, NULL),
(157, 'theme-flex-home-vi-home_description_for_news', 'Bên dưới đây là những tin tức mới nhất về lĩnh vực bất động sản được chúng tôi cập nhật thường xuyên từ những nguồn tin đáng tin cậy.', NULL, NULL),
(167, 'theme-flex-home-primary_font', 'Nunito Sans', NULL, NULL),
(168, 'theme-flex-home-twitter', '', NULL, NULL),
(169, 'theme-flex-home-number_of_featured_projects', '4', NULL, NULL),
(170, 'theme-flex-home-number_of_featured_cities', '10', NULL, NULL),
(171, 'theme-flex-home-number_of_properties_for_sell', '8', NULL, NULL),
(172, 'theme-flex-home-number_of_properties_for_rent', '8', NULL, NULL),
(173, 'theme-flex-home-number_of_projects_per_page', '12', NULL, NULL),
(174, 'theme-flex-home-number_of_properties_per_page', '12', NULL, NULL),
(175, 'theme-flex-home-number_of_related_projects', '8', NULL, NULL),
(176, 'theme-flex-home-number_of_related_properties', '8', NULL, NULL),
(177, 'theme-flex-home-properties_description', 'Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.', NULL, NULL),
(178, 'theme-flex-home-home_description_for_properties_for_sale', 'Below is a list of properties that are currently up for sale', NULL, NULL),
(179, 'theme-flex-home-home_description_for_properties_for_rent', 'Below is a detailed price list of each property for rent', NULL, NULL),
(196, 'theme-flex-home-number_of_properties_for_sale', '8', NULL, NULL),
(197, 'theme-flex-home-home_banner_description', 'Find your favorite homes at Flex Home', NULL, NULL),
(198, 'theme-flex-home-home_description_for_projects_by_locations', '', NULL, NULL),
(199, 'theme-flex-home-vi-primary_font', 'Nunito Sans', NULL, NULL),
(200, 'theme-flex-home-vi-twitter', '', NULL, NULL),
(201, 'theme-flex-home-vi-number_of_featured_projects', '4', NULL, NULL),
(202, 'theme-flex-home-vi-number_of_featured_cities', '10', NULL, NULL),
(203, 'theme-flex-home-vi-number_of_properties_for_sale', '8', NULL, NULL),
(204, 'theme-flex-home-vi-number_of_properties_for_rent', '8', NULL, NULL),
(205, 'theme-flex-home-vi-number_of_projects_per_page', '12', NULL, NULL),
(206, 'theme-flex-home-vi-number_of_properties_per_page', '12', NULL, NULL),
(207, 'theme-flex-home-vi-number_of_related_projects', '8', NULL, NULL),
(208, 'theme-flex-home-vi-number_of_related_properties', '8', NULL, NULL),
(209, 'theme-flex-home-vi-home_banner_description', 'Tìm ngôi nhà yêu thích tại FlexHome', NULL, NULL),
(210, 'theme-flex-home-vi-properties_description', '', NULL, NULL),
(211, 'theme-flex-home-vi-home_description_for_projects_by_locations', '', NULL, NULL),
(212, 'theme-flex-home-vi-home_description_for_properties_for_sale', '', NULL, NULL),
(213, 'theme-flex-home-vi-home_description_for_properties_for_rent', '', NULL, NULL),
(214, 'payment_cod_name', 'Cash on delivery (COD)', NULL, NULL),
(216, 'payment_cod_status', '1', NULL, NULL),
(217, 'payment_bank_transfer_name', 'Bank transfer', NULL, NULL),
(219, 'payment_bank_transfer_status', '1', NULL, NULL),
(220, 'theme-flex-home-vi-seo_og_image', '', NULL, NULL),
(221, 'theme-flex-home-vi-primary_color', '#1D5F6F', NULL, NULL),
(222, 'theme-flex-home-vi-primary_color_hover', '#063A5D', NULL, NULL),
(224, 'theme-flex-home-vi-number_of_posts_in_a_category', '12', NULL, NULL),
(225, 'theme-flex-home-vi-number_of_posts_in_a_tag', '12', NULL, NULL),
(227, 'theme-flex-home-vi-cookie_consent_enable', 'yes', NULL, NULL),
(229, 'theme-flex-home-vi-cookie_consent_button_text', 'Allow cookies', NULL, NULL),
(230, 'theme-flex-home-seo_og_image', '', NULL, NULL),
(231, 'theme-flex-home-primary_color', '#1D5F6F', NULL, NULL),
(232, 'theme-flex-home-primary_color_hover', '#063A5D', NULL, NULL),
(234, 'theme-flex-home-number_of_posts_in_a_category', '12', NULL, NULL),
(235, 'theme-flex-home-number_of_posts_in_a_tag', '12', NULL, NULL),
(237, 'theme-flex-home-cookie_consent_enable', 'yes', NULL, NULL),
(239, 'theme-flex-home-cookie_consent_button_text', 'Allow cookies', NULL, NULL),
(270, 'activated_plugins', '[\"language\",\"language-advanced\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"career\",\"contact\",\"cookie-consent\",\"location\",\"payment\",\"paystack\",\"razorpay\",\"real-estate\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"translation\",\"analytics\",\"comment\"]', NULL, NULL),
(283, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(284, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(285, 'theme', 'flex-home', NULL, NULL),
(286, 'admin_logo', 'logo/logo-white.png', NULL, NULL),
(287, 'admin_favicon', 'logo/favicon.png', NULL, NULL),
(296, 'theme-flex-home-vi-homepage_id', '1', NULL, NULL),
(297, 'theme-flex-home-vi-blog_page_id', '2', NULL, NULL),
(298, 'theme-flex-home-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]', NULL, NULL),
(304, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(305, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(306, 'admin_logo', 'logo/logo-white.png', NULL, NULL),
(307, 'admin_favicon', 'logo/favicon.png', NULL, NULL),
(320, 'theme-flex-home-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]', NULL, NULL),
(326, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(327, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(328, 'admin_logo', 'logo/logo-white.png', NULL, NULL),
(329, 'admin_favicon', 'logo/favicon.png', NULL, NULL),
(342, 'theme-flex-home-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]', NULL, NULL),
(348, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(349, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(350, 'admin_logo', 'logo/logo-white.png', NULL, NULL),
(351, 'admin_favicon', 'logo/favicon.png', NULL, NULL),
(364, 'theme-flex-home-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]', NULL, NULL),
(374, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(375, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(376, 'admin_logo', 'logo/logo-white.png', NULL, NULL),
(377, 'admin_favicon', 'logo/favicon.png', NULL, NULL),
(390, 'theme-flex-home-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]', NULL, NULL),
(391, 'language_hide_default', '1', NULL, NULL),
(392, 'language_switcher_display', 'dropdown', NULL, NULL),
(393, 'language_display', 'all', NULL, NULL),
(394, 'language_hide_languages', '[]', NULL, NULL),
(395, 'media_random_hash', 'a07c138f200e77fcfc67b25d74745ae7', NULL, NULL),
(396, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(397, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(398, 'admin_logo', 'logo/logo-white.png', NULL, NULL),
(399, 'admin_favicon', 'logo/favicon.png', NULL, NULL),
(400, 'theme-flex-home-cookie_consent_message', 'Your experience on this site will be improved by allowing cookies ', NULL, NULL),
(401, 'theme-flex-home-cookie_consent_learn_more_url', 'http://flex-home.test/cookie-policy', NULL, NULL),
(402, 'theme-flex-home-cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(403, 'theme-flex-home-homepage_id', '1', NULL, NULL),
(404, 'theme-flex-home-blog_page_id', '2', NULL, NULL),
(405, 'theme-flex-home-home_banner', 'general/home-banner.jpg', NULL, NULL),
(406, 'theme-flex-home-breadcrumb_background', 'general/breadcrumb-background.jpg', NULL, NULL),
(407, 'theme-flex-home-vi-cookie_consent_message', 'Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ', NULL, NULL),
(408, 'theme-flex-home-vi-cookie_consent_learn_more_url', 'http://flex-home.test/cookie-policy', NULL, NULL),
(409, 'theme-flex-home-vi-cookie_consent_learn_more_text', 'Cookie Policy', NULL, NULL),
(410, 'theme-flex-home-vi-home_banner', 'general/home-banner.jpg', NULL, NULL),
(411, 'theme-flex-home-vi-breadcrumb_background', 'general/breadcrumb-background.jpg', NULL, NULL),
(412, 'theme-flex-home-social_links', '[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"fab fa-facebook-f\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"fab fa-twitter\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"fab fa-youtube\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]', NULL, NULL),
(413, 'comment_enable', '1', NULL, NULL),
(414, 'comment_menu_enable', '[\"0\",\"Botble\\\\Page\\\\Models\\\\Page\",\"Botble\\\\Blog\\\\Models\\\\Post\",\"Botble\\\\Blog\\\\Models\\\\Category\",\"Botble\\\\Blog\\\\Models\\\\Tag\",\"Botble\\\\Career\\\\Models\\\\Career\",\"Botble\\\\RealEstate\\\\Models\\\\Property\",\"Botble\\\\RealEstate\\\\Models\\\\Category\",\"Botble\\\\RealEstate\\\\Models\\\\Project\"]', NULL, NULL),
(415, 'plugin_comment_rating', '1', NULL, NULL),
(416, 'plugin_comment_reactions', '0', NULL, NULL),
(417, 'plugin_comment_profiles', '0', NULL, NULL),
(418, 'plugin_comment_copyright', 'Proudly Powered by Bao Boi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(1, '3-beds-villa-calpe-alicante', 1, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-17 20:34:59', '2019-11-17 20:34:59'),
(2, 'property-for-sale-johannesburg-south-africa', 2, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-17 20:53:34', '2019-11-17 20:53:34'),
(3, 'stunning-french-inspired-manor', 3, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-17 21:09:55', '2019-11-17 21:09:55'),
(4, '42460-buccaneer-court', 4, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-17 21:18:11', '2019-11-17 21:18:11'),
(5, 'wifi', 1, 'Botble\\RealEstate\\Models\\PropertyFeature', '', '2019-11-17 21:40:58', '2019-11-17 21:40:58'),
(6, 'swimming-pool', 2, 'Botble\\RealEstate\\Models\\PropertyFeature', '', '2019-11-17 21:41:43', '2019-11-17 21:41:43'),
(7, 'walnut-park-apartment', 1, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-18 00:34:49', '2019-11-18 00:34:49'),
(8, 'walnut-park-apartment', 5, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 00:47:52', '2019-11-18 00:47:52'),
(9, 'el-camino-del-mar', 6, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 01:05:58', '2019-11-18 01:05:58'),
(10, 'family-victorian-view-home', 7, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 01:12:07', '2019-11-18 01:12:07'),
(11, 'osaka-heights', 2, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-18 01:28:45', '2019-11-18 01:28:45'),
(12, 'osaka-heights-apartment', 8, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 01:49:36', '2019-11-18 01:49:36'),
(13, 'private-estate-magnificent-views', 9, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 02:02:19', '2019-11-18 02:02:19'),
(14, 'harry-baskervilles-hay-loft', 10, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 02:16:53', '2019-11-18 02:16:53'),
(15, 'break-lease-available', 11, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 02:22:48', '2019-11-18 02:22:48'),
(16, 'category-news', 1, 'Botble\\Blog\\Models\\Category', 'news', '2019-11-18 02:33:35', '2021-12-09 21:25:35'),
(17, 'elegant-family-home-presents-premium-modern-living', 12, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 02:47:05', '2019-11-18 02:47:05'),
(18, 'bcg-sets-great-store-by-real-estate-negotiations', 1, 'Botble\\Blog\\Models\\Post', 'news', '2019-11-18 02:51:35', '2021-12-09 21:25:35'),
(19, 'bcg-sets-great-store', 1, 'Botble\\Blog\\Models\\Tag', 'tag', '2019-11-18 02:51:35', '2019-11-18 02:51:35'),
(20, 'private-home-sales-drop-27-in-october', 2, 'Botble\\Blog\\Models\\Post', 'news', '2019-11-18 02:55:53', '2021-12-09 21:25:35'),
(21, 'private-home-sales', 2, 'Botble\\Blog\\Models\\Tag', 'tag', '2019-11-18 02:55:53', '2019-11-18 02:55:53'),
(22, 'singapore-overtakes-hong-kong-in-terms-of-property-investment-prospects', 3, 'Botble\\Blog\\Models\\Post', 'news', '2019-11-18 02:59:01', '2021-12-09 21:25:35'),
(23, 's-koreas-big-investors-flocking-to-overseas-real-estate', 4, 'Botble\\Blog\\Models\\Post', 'news', '2019-11-18 03:07:27', '2021-12-09 21:25:35'),
(24, 'south-korean-investors', 3, 'Botble\\Blog\\Models\\Tag', 'tag', '2019-11-18 03:07:27', '2019-11-18 03:07:27'),
(25, 'mimaroba-paradise', 3, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-18 03:30:34', '2019-11-18 03:30:34'),
(26, 'aegean-villas', 4, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-18 03:38:13', '2019-11-18 03:38:13'),
(27, 'aydos-forest-apartment', 5, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-18 03:45:06', '2019-11-18 03:45:06'),
(28, 'park', 6, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-18 03:53:20', '2019-11-18 03:53:20'),
(29, 'the-avila-apartment', 13, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 07:23:02', '2019-11-18 07:23:02'),
(30, 'villa-for-sale-in-lavanya-residences', 14, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 07:36:29', '2019-11-18 07:36:29'),
(31, 'want-to-lease-a-house-in-compound-pejaten-barat-kemang', 15, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 07:44:44', '2019-11-18 07:44:44'),
(32, 'apartment-muiderstraatweg-in-diemen', 16, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 07:59:14', '2019-11-18 07:59:14'),
(33, 'nice-apartment-for-rent-in-berlin', 17, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-18 08:13:07', '2019-11-18 08:13:07'),
(34, 'can-ho-walnut-park', 7, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-21 01:54:36', '2019-11-21 01:54:36'),
(35, '1574328489', 8, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-21 02:28:09', '2019-11-21 02:28:09'),
(36, 'thien-duong-mimaroba', 9, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-21 02:40:25', '2019-11-21 02:40:25'),
(37, 'khu-biet-thu-aegean', 10, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-21 02:58:55', '2019-11-21 02:58:55'),
(38, 'chung-cu-rung-aydos', 11, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-21 03:16:25', '2019-11-21 03:16:25'),
(39, 'khu-chung-cu-the-avila', 12, 'Botble\\RealEstate\\Models\\Project', 'projects', '2019-11-21 03:25:22', '2019-11-21 03:25:22'),
(40, 'ban-biet-thu-3-phong-ngu-calpe-alicante', 18, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 05:51:54', '2019-11-21 05:51:54'),
(41, 'ban-nha-tai-johannesburg-south-africa', 19, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 06:03:12', '2019-11-21 06:03:12'),
(42, 'nha-phong-cach-phap', 20, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 06:12:15', '2019-11-21 06:12:15'),
(43, 'nha-ban-tai', 21, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 06:26:59', '2019-11-21 06:26:59'),
(44, 'can-ho-walnut-park', 22, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 06:56:50', '2019-11-21 06:56:50'),
(45, 'cho-thue-nha-cao-cap-5-phong-ngu', 23, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 07:18:36', '2019-11-21 07:18:36'),
(46, 'cho-thue-nha-view-dep', 24, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 07:26:48', '2019-11-21 07:26:48'),
(47, 'ban-can-ho-osaka-heights', 25, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 07:34:38', '2019-11-21 07:34:38'),
(48, 'nha-chinh-chu', 26, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 07:40:46', '2019-11-21 07:40:46'),
(49, 'cho-thue-nha-tren-duong-thompsons', 27, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 07:45:34', '2019-11-21 07:45:34'),
(52, 'house-architecture', 2, 'Botble\\Blog\\Models\\Category', 'news', '2019-11-21 07:49:25', '2021-12-09 21:25:35'),
(53, 'kien-truc-nha', 3, 'Botble\\Blog\\Models\\Category', 'news', '2019-11-21 07:49:35', '2021-12-09 21:25:35'),
(54, 'house-design', 4, 'Botble\\Blog\\Models\\Category', 'news', '2019-11-21 07:50:02', '2021-12-09 21:25:35'),
(55, 'thiet-ke-nha', 5, 'Botble\\Blog\\Models\\Category', 'news', '2019-11-21 07:50:17', '2021-12-09 21:25:35'),
(56, 'building-materials', 6, 'Botble\\Blog\\Models\\Category', 'news', '2019-11-21 07:50:36', '2021-12-09 21:25:35'),
(57, 'vat-lieu-xay-dung', 7, 'Botble\\Blog\\Models\\Category', 'news', '2019-11-21 07:50:58', '2021-12-09 21:25:35'),
(58, 'can-ho-1-phong-ngu-hoan-toan-moi-o-vi-tri-hang-nhat', 28, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 19:53:17', '2019-11-21 19:53:17'),
(59, 'nha-cao-cap-thanh-lich', 29, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-21 19:59:16', '2019-11-21 19:59:16'),
(60, 'can-ban-can-ho-cao-cap-tai-singapore', 30, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-22 00:29:01', '2019-11-22 00:29:01'),
(61, 'can-ho-cao-cap-5-phong-can-ban-tai-kuala-lumpur', 31, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-22 00:42:28', '2019-11-22 00:42:28'),
(62, 'nha-ompound-pejaten-barat-kemang', 32, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-22 00:47:18', '2019-11-22 00:47:18'),
(63, 'can-ho-muiderstraatweg-o-diemen', 33, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-22 00:57:15', '2019-11-22 00:57:15'),
(64, 'can-ho-dep-cho-thue-o-berlin', 34, 'Botble\\RealEstate\\Models\\Property', 'properties', '2019-11-22 01:06:09', '2019-11-22 01:06:09'),
(65, 'tin-tuc-1', 8, 'Botble\\Blog\\Models\\Category', 'news', '2019-11-22 01:26:08', '2021-12-09 21:25:35'),
(66, 'bcg-thiet-lap-cua-hang-tuyet-voi-bang-cac-cuoc-dam-phan-bat-dong-san', 5, 'Botble\\Blog\\Models\\Post', 'news', '2019-11-22 01:26:31', '2021-12-09 21:25:35'),
(67, 'doanh-so-ban-nha-rieng-giam-27-trong-thang-10', 6, 'Botble\\Blog\\Models\\Post', 'news', '2019-11-22 01:29:45', '2021-12-09 21:25:35'),
(68, 'singapore-vuot-qua-hong-kong-ve-trien-vong-dau-tu-bat-dong-san', 7, 'Botble\\Blog\\Models\\Post', 'news', '2019-11-22 01:33:23', '2021-12-09 21:25:35'),
(69, 'cac-nha-dau-tu-lon-han-quoc-do-xo-vao-bat-dong-san-o-nuoc-ngoai', 8, 'Botble\\Blog\\Models\\Post', 'news', '2019-11-22 01:39:38', '2021-12-09 21:25:35'),
(74, 'sales-manager-real-estate', 1, 'Botble\\Career\\Models\\Career', 'careers', '2019-11-30 19:43:10', '2019-11-30 19:43:10'),
(75, 'truong-phong-kinh-doanh-luong-len-toi', 2, 'Botble\\Career\\Models\\Career', 'careers', '2019-11-30 19:49:07', '2019-11-30 19:49:07'),
(76, 'senior-real-estate-consultant', 3, 'Botble\\Career\\Models\\Career', 'careers', '2019-11-30 19:52:42', '2019-11-30 19:52:42'),
(77, 'chuyen-vien-tu-van-bat-dong-san-cao-cap', 4, 'Botble\\Career\\Models\\Career', 'careers', '2019-11-30 19:56:50', '2019-11-30 19:56:50'),
(348, 'apartment', 1, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(349, 'villa', 2, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(350, 'condo', 3, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(351, 'house', 4, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(352, 'land', 5, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(353, 'commercial-property', 6, 'Botble\\RealEstate\\Models\\Category', 'property-category', '2021-12-09 21:25:29', '2021-12-09 21:25:29'),
(354, 'home', 1, 'Botble\\Page\\Models\\Page', '', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(355, 'news', 2, 'Botble\\Page\\Models\\Page', '', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(356, 'about-us', 3, 'Botble\\Page\\Models\\Page', '', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(357, 'contact', 4, 'Botble\\Page\\Models\\Page', '', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(358, 'terms-conditions', 5, 'Botble\\Page\\Models\\Page', '', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(359, 'cookie-policy', 6, 'Botble\\Page\\Models\\Page', '', '2021-12-09 21:25:35', '2021-12-09 21:25:35'),
(360, 'the-top-2020-handbag-trends-to-know', 105, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(361, 'top-search-engine-optimization-strategies', 106, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(362, 'which-company-would-you-choose', 107, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(363, 'used-car-dealer-sales-tricks-exposed', 108, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(364, '20-ways-to-sell-your-product-faster', 109, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(365, 'the-secrets-of-rich-and-famous-writers', 110, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(366, 'imagine-losing-20-pounds-in-14-days', 111, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(367, 'are-you-still-using-that-slow-old-typewriter', 112, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(368, 'a-skin-cream-thats-proven-to-work', 113, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(369, '10-reasons-to-start-your-own-profitable-website', 114, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(370, 'simple-ways-to-reduce-your-unwanted-wrinkles', 115, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(371, 'apple-imac-with-retina-5k-display-review', 116, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(372, '10000-web-site-visitors-in-one-monthguaranteed', 117, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(373, 'unlock-the-secrets-of-selling-high-ticket-items', 118, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(374, '4-expert-tips-on-how-to-choose-the-right-mens-wallet', 119, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40'),
(375, 'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag', 120, 'Botble\\Blog\\Models\\Post', 'news', '2021-12-09 21:25:40', '2021-12-09 21:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`, `order`, `is_default`, `status`, `created_at`, `updated_at`, `abbreviation`) VALUES
(1, 'California', 1, 0, 0, 'published', '2019-11-18 08:17:57', '2019-11-18 08:17:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states_translations`
--

CREATE TABLE `states_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` int(11) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BCG sets great store', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2019-11-18 02:51:35', '2019-11-18 02:51:35'),
(2, 'Private Home Sales', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2019-11-18 02:55:53', '2019-11-18 02:55:53'),
(3, 'South Korean investors', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2019-11-18 03:07:27', '2019-11-18 03:07:27');

-- --------------------------------------------------------

--
-- Table structure for table `tags_translations`
--

CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `credits` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(2, 0, 'en', 'auth', 'password', 'The provided password is incorrect.', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(3, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(4, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(5, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(6, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(7, 0, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(8, 0, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(9, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(10, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2021-12-31 22:02:22', '2021-12-31 22:02:45'),
(11, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(12, 0, 'en', 'validation', 'accepted_if', 'The :attribute must be accepted when :other is :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(13, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(14, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(15, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(16, 0, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(17, 0, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(18, 0, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(19, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(20, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(21, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(22, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(23, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(24, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(25, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(26, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(27, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(28, 0, 'en', 'validation', 'current_password', 'The password is incorrect.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(29, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(30, 0, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(31, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(32, 0, 'en', 'validation', 'declined', 'The :attribute must be declined.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(33, 0, 'en', 'validation', 'declined_if', 'The :attribute must be declined when :other is :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(34, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(35, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(36, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(37, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(38, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(39, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(40, 0, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(41, 0, 'en', 'validation', 'enum', 'The selected :attribute is invalid.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(42, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(43, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(44, 0, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(45, 0, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(46, 0, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(47, 0, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(48, 0, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(49, 0, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal to :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(50, 0, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal to :value kilobytes.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(51, 0, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal to :value characters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(52, 0, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(53, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(54, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(55, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(56, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(57, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(58, 0, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(59, 0, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(60, 0, 'en', 'validation', 'mac_address', 'The :attribute must be a valid MAC address.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(61, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(62, 0, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(63, 0, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(64, 0, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(65, 0, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(66, 0, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal to :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(67, 0, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal to :value kilobytes.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(68, 0, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal to :value characters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(69, 0, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(70, 0, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(71, 0, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(72, 0, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(73, 0, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(74, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(75, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(76, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(77, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(78, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(79, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(80, 0, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(81, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(82, 0, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(83, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(84, 0, 'en', 'validation', 'password', 'The password is incorrect.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(85, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(86, 0, 'en', 'validation', 'prohibited', 'The :attribute field is prohibited.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(87, 0, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(88, 0, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(89, 0, 'en', 'validation', 'prohibits', 'The :attribute field prohibits :other from being present.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(90, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(91, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(92, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(93, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(94, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(95, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(96, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(97, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(98, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(99, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(100, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(101, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(102, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(103, 0, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(104, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(105, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid timezone.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(106, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(107, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(108, 0, 'en', 'validation', 'url', 'The :attribute must be a valid URL.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(109, 0, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(110, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(111, 0, 'en', 'core/acl/api', 'api_clients', 'API Clients', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(112, 0, 'en', 'core/acl/api', 'create_new_client', 'Create new client', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(113, 0, 'en', 'core/acl/api', 'create_new_client_success', 'Create new client successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(114, 0, 'en', 'core/acl/api', 'edit_client', 'Edit client \":name\"', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(115, 0, 'en', 'core/acl/api', 'edit_client_success', 'Updated client successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(116, 0, 'en', 'core/acl/api', 'delete_success', 'Deleted client successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(117, 0, 'en', 'core/acl/api', 'confirm_delete_title', 'Confirm delete client \":name\"', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(118, 0, 'en', 'core/acl/api', 'confirm_delete_description', 'Do you really want to delete client \":name\"?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(119, 0, 'en', 'core/acl/api', 'cancel_delete', 'No', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(120, 0, 'en', 'core/acl/api', 'continue_delete', 'Yes, let\'s delete it!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(121, 0, 'en', 'core/acl/api', 'name', 'Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(122, 0, 'en', 'core/acl/api', 'cancel', 'Cancel', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(123, 0, 'en', 'core/acl/api', 'save', 'Save', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(124, 0, 'en', 'core/acl/api', 'edit', 'Edit', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(125, 0, 'en', 'core/acl/api', 'delete', 'Delete', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(126, 0, 'en', 'core/acl/api', 'client_id', 'Client ID', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(127, 0, 'en', 'core/acl/api', 'secret', 'Secret', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(128, 0, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(129, 0, 'en', 'core/acl/auth', 'login.email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(130, 0, 'en', 'core/acl/auth', 'login.password', 'Password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(131, 0, 'en', 'core/acl/auth', 'login.title', 'User Login', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(132, 0, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(133, 0, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(134, 0, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(135, 0, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(136, 0, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(137, 0, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(138, 0, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(139, 0, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(140, 0, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(141, 0, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(142, 0, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(143, 0, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(144, 0, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(145, 0, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(146, 0, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(147, 0, 'en', 'core/acl/auth', 'reset.email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(148, 0, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(149, 0, 'en', 'core/acl/auth', 'reset.update', 'Update', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(150, 0, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(151, 0, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(152, 0, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(153, 0, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(154, 0, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(155, 0, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(156, 0, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(157, 0, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(158, 0, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(159, 0, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(160, 0, 'en', 'core/acl/auth', 'failed', 'Failed', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(161, 0, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(162, 0, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(163, 0, 'en', 'core/acl/auth', 'register_now', 'Register now', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(164, 0, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(165, 0, 'en', 'core/acl/auth', 'login_title', 'Admin', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(166, 0, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(167, 0, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(168, 0, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(169, 0, 'en', 'core/acl/auth', 'languages', 'Languages', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(170, 0, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(171, 0, 'en', 'core/acl/auth', 'settings.email.title', 'ACL', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(172, 0, 'en', 'core/acl/auth', 'settings.email.description', 'ACL email configuration', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(173, 0, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(174, 0, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(175, 0, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(176, 0, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(177, 0, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(178, 0, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(179, 0, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(180, 0, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(181, 0, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(182, 0, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(183, 0, 'en', 'core/acl/permissions', 'name', 'Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(184, 0, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(185, 0, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(186, 0, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(187, 0, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(188, 0, 'en', 'core/acl/permissions', 'role_name', 'Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(189, 0, 'en', 'core/acl/permissions', 'role_description', 'Description', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(190, 0, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(191, 0, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(192, 0, 'en', 'core/acl/permissions', 'reset', 'Reset', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(193, 0, 'en', 'core/acl/permissions', 'save', 'Save', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(194, 0, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(195, 0, 'en', 'core/acl/permissions', 'details', 'Details', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(196, 0, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(197, 0, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(198, 0, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(199, 0, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(200, 0, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(201, 0, 'en', 'core/acl/permissions', 'actions', 'Actions', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(202, 0, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(203, 0, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(204, 0, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(205, 0, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(206, 0, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(207, 0, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(208, 0, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(209, 0, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(210, 0, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(211, 0, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(212, 0, 'en', 'core/acl/permissions', 'options', 'Options', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(213, 0, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(214, 0, 'en', 'core/acl/permissions', 'roles', 'Roles', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(215, 0, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(216, 0, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(217, 0, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(218, 0, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(219, 0, 'en', 'core/acl/reminders', 'password', 'Passwords must be at least six characters and match the confirmation.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(220, 0, 'en', 'core/acl/reminders', 'user', 'We can\'t find a user with that e-mail address.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(221, 0, 'en', 'core/acl/reminders', 'token', 'This password reset token is invalid.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(222, 0, 'en', 'core/acl/reminders', 'sent', 'Password reminder sent!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(223, 0, 'en', 'core/acl/reminders', 'reset', 'Password has been reset!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(224, 0, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(225, 0, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(226, 0, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(227, 0, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(228, 0, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(229, 0, 'en', 'core/acl/users', 'not_found', 'User not found', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(230, 0, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(231, 0, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(232, 0, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(233, 0, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(234, 0, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(235, 0, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(236, 0, 'en', 'core/acl/users', 'email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(237, 0, 'en', 'core/acl/users', 'role', 'Role', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(238, 0, 'en', 'core/acl/users', 'username', 'Username', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(239, 0, 'en', 'core/acl/users', 'last_name', 'Last Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(240, 0, 'en', 'core/acl/users', 'first_name', 'First Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(241, 0, 'en', 'core/acl/users', 'message', 'Message', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(242, 0, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(243, 0, 'en', 'core/acl/users', 'change_password', 'Change password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(244, 0, 'en', 'core/acl/users', 'current_password', 'Current password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(245, 0, 'en', 'core/acl/users', 'new_password', 'New Password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(246, 0, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(247, 0, 'en', 'core/acl/users', 'password', 'Password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(248, 0, 'en', 'core/acl/users', 'save', 'Save', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(249, 0, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(250, 0, 'en', 'core/acl/users', 'deleted', 'User deleted', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(251, 0, 'en', 'core/acl/users', 'last_login', 'Last Login', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(252, 0, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(253, 0, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(254, 0, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(255, 0, 'en', 'core/acl/users', 'new_image', 'New Image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(256, 0, 'en', 'core/acl/users', 'loading', 'Loading', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(257, 0, 'en', 'core/acl/users', 'close', 'Close', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(258, 0, 'en', 'core/acl/users', 'update', 'Update', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(259, 0, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(260, 0, 'en', 'core/acl/users', 'users', 'Users', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(261, 0, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(262, 0, 'en', 'core/acl/users', 'info.title', 'User profile', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(263, 0, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(264, 0, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(265, 0, 'en', 'core/acl/users', 'info.email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(266, 0, 'en', 'core/acl/users', 'info.second_email', 'Secondary Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(267, 0, 'en', 'core/acl/users', 'info.address', 'Address', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(268, 0, 'en', 'core/acl/users', 'info.second_address', 'Secondary Address', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(269, 0, 'en', 'core/acl/users', 'info.birth_day', 'Date of birth', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(270, 0, 'en', 'core/acl/users', 'info.job', 'Job Position', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(271, 0, 'en', 'core/acl/users', 'info.mobile_number', 'Mobile Number', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(272, 0, 'en', 'core/acl/users', 'info.second_mobile_number', 'Secondary Phone', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(273, 0, 'en', 'core/acl/users', 'info.interes', 'Interests', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(274, 0, 'en', 'core/acl/users', 'info.about', 'About', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(275, 0, 'en', 'core/acl/users', 'gender.title', 'Gender', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(276, 0, 'en', 'core/acl/users', 'gender.male', 'Male', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(277, 0, 'en', 'core/acl/users', 'gender.female', 'Female', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(278, 0, 'en', 'core/acl/users', 'total_users', 'Total users', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(279, 0, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(280, 0, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(281, 0, 'en', 'core/acl/users', 'make_super', 'Make super', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(282, 0, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(283, 0, 'en', 'core/acl/users', 'is_super', 'Is super?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(284, 0, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(285, 0, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(286, 0, 'en', 'core/acl/users', 'select_role', 'Select role', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(287, 0, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(288, 0, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(289, 0, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(290, 0, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(291, 0, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(292, 0, 'vi', 'core/acl/auth', 'login.username', 'Email/Tên truy cập', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(293, 0, 'vi', 'core/acl/auth', 'login.password', 'Mật khẩu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(294, 0, 'vi', 'core/acl/auth', 'login.title', 'Đăng nhập vào quản trị', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(295, 0, 'vi', 'core/acl/auth', 'login.remember', 'Nhớ mật khẩu?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(296, 0, 'vi', 'core/acl/auth', 'login.login', 'Đăng nhập', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(297, 0, 'vi', 'core/acl/auth', 'login.placeholder.username', 'Vui lòng nhập tên truy cập', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(298, 0, 'vi', 'core/acl/auth', 'login.placeholder.email', 'Vui lòng nhập email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(299, 0, 'vi', 'core/acl/auth', 'login.success', 'Đăng nhập thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(300, 0, 'vi', 'core/acl/auth', 'login.fail', 'Sai tên truy cập hoặc mật khẩu.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(301, 0, 'vi', 'core/acl/auth', 'login.not_active', 'Tài khoản của bạn chưa được kích hoạt!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(302, 0, 'vi', 'core/acl/auth', 'login.banned', 'Tài khoản này đã bị khóa.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(303, 0, 'vi', 'core/acl/auth', 'login.logout_success', 'Đăng xuất thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(304, 0, 'vi', 'core/acl/auth', 'login.dont_have_account', 'Bạn không có tài khoản trong hệ thống, vui lòng liên hệ quản trị viên!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(305, 0, 'vi', 'core/acl/auth', 'login.email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(306, 0, 'vi', 'core/acl/auth', 'forgot_password.title', 'Quên mật khẩu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(307, 0, 'vi', 'core/acl/auth', 'forgot_password.message', '<p>Quên mật khẩu?</p><p>Vui lòng nhập email đăng nhập tài khoản của bạn để hệ thống gửi liên kết khôi phục mật khẩu.</p>', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(308, 0, 'vi', 'core/acl/auth', 'forgot_password.submit', 'Hoàn tất', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(309, 0, 'vi', 'core/acl/auth', 'reset.new_password', 'Mật khẩu mới', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(310, 0, 'vi', 'core/acl/auth', 'reset.title', 'Khôi phục mật khẩu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(311, 0, 'vi', 'core/acl/auth', 'reset.update', 'Cập nhật', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(312, 0, 'vi', 'core/acl/auth', 'reset.wrong_token', 'Liên kết này không chính xác hoặc đã hết hiệu lực, vui lòng yêu cầu khôi phục mật khẩu lại!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(313, 0, 'vi', 'core/acl/auth', 'reset.user_not_found', 'Tên đăng nhập không tồn tại.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(314, 0, 'vi', 'core/acl/auth', 'reset.success', 'Khôi phục mật khẩu thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(315, 0, 'vi', 'core/acl/auth', 'reset.fail', 'Token không hợp lệ hoặc liên kết khôi phục mật khẩu đã hết thời gian hiệu lực!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(316, 0, 'vi', 'core/acl/auth', 'reset.reset.title', 'Email khôi phục mật khẩu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(317, 0, 'vi', 'core/acl/auth', 'reset.send.success', 'Một email khôi phục mật khẩu đã được gửi tới email của bạn, vui lòng kiểm tra và hoàn tất yêu cầu.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(318, 0, 'vi', 'core/acl/auth', 'reset.send.fail', 'Không thể gửi email trong lúc này. Vui lòng thực hiện lại sau.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(319, 0, 'vi', 'core/acl/auth', 'reset.new-password', 'Mật khẩu mới', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(320, 0, 'vi', 'core/acl/auth', 'reset.email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(321, 0, 'vi', 'core/acl/auth', 'email.reminder.title', 'Email khôi phục mật khẩu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(322, 0, 'vi', 'core/acl/auth', 'failed', 'Không thành công', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(323, 0, 'vi', 'core/acl/auth', 'throttle', 'Throttle', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(324, 0, 'vi', 'core/acl/auth', 'back_to_login', 'Quay lại trang đăng nhập', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(325, 0, 'vi', 'core/acl/auth', 'login_title', 'Đăng nhập vào quản trị', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(326, 0, 'vi', 'core/acl/auth', 'login_via_social', 'Đăng nhập thông qua mạng xã hội', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(327, 0, 'vi', 'core/acl/auth', 'lost_your_password', 'Quên mật khẩu?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(328, 0, 'vi', 'core/acl/auth', 'not_member', 'Chưa là thành viên?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(329, 0, 'vi', 'core/acl/auth', 'register_now', 'Đăng ký ngay', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(330, 0, 'vi', 'core/acl/permissions', 'notices.role_in_use', 'Không thể xóa quyền người dùng này vì nó đang được sử dụng!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(331, 0, 'vi', 'core/acl/permissions', 'notices.role_delete_belong_user', 'Không thể xóa quyền hạn này vì nó thuộc về người khác!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(332, 0, 'vi', 'core/acl/permissions', 'notices.role_edit_belong_user', 'Bạn không được phép sửa quyền này vì nó thuộc về người khác', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(333, 0, 'vi', 'core/acl/permissions', 'notices.delete_global_role', 'Bạn không thể xóa quyền người dùng hệ thống!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(334, 0, 'vi', 'core/acl/permissions', 'notices.delete_success', 'Quyền người dùng đã được xóa!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(335, 0, 'vi', 'core/acl/permissions', 'notices.modified_success', 'Quyền người dùng đã được cập nhật thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(336, 0, 'vi', 'core/acl/permissions', 'notices.create_success', 'Quyền người dùng mới đã được tạo thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(337, 0, 'vi', 'core/acl/permissions', 'notices.duplicated_success', 'Quyền người dùng đã được sao chép thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(338, 0, 'vi', 'core/acl/permissions', 'notices.no_select', 'Hãy chọn ít nhất một quyền người dùng để thực hiện hành động này!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(339, 0, 'vi', 'core/acl/permissions', 'notices.not_found', 'Không tìm thấy quyền người dùng này', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(340, 0, 'vi', 'core/acl/permissions', 'name', 'Tên', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(341, 0, 'vi', 'core/acl/permissions', 'current_role', 'Quyền hiện tại', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(342, 0, 'vi', 'core/acl/permissions', 'no_role_assigned', 'Không có quyền hạn nào', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(343, 0, 'vi', 'core/acl/permissions', 'role_assigned', 'Quyền đã được gán', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(344, 0, 'vi', 'core/acl/permissions', 'create_role', 'Tạo quyền mới', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(345, 0, 'vi', 'core/acl/permissions', 'role_name', 'Tên', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(346, 0, 'vi', 'core/acl/permissions', 'role_description', 'Mô tả', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(347, 0, 'vi', 'core/acl/permissions', 'permission_flags', 'Cờ đánh dấu quyền hạn', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(348, 0, 'vi', 'core/acl/permissions', 'cancel', 'Hủy bỏ', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(349, 0, 'vi', 'core/acl/permissions', 'reset', 'Làm lại', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(350, 0, 'vi', 'core/acl/permissions', 'save', 'Lưu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(351, 0, 'vi', 'core/acl/permissions', 'global_role_msg', 'Đây là một phân quyền toàn cục và không thể thay đổi.  Bạn có thể sử dụng nút \"Nhân bản\" để tạo một bản sao chép cho phân quyền này và chỉnh sửa.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(352, 0, 'vi', 'core/acl/permissions', 'details', 'Chi tiết', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(353, 0, 'vi', 'core/acl/permissions', 'duplicate', 'Nhân bản', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(354, 0, 'vi', 'core/acl/permissions', 'all', 'Tất cả phân quyền', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(355, 0, 'vi', 'core/acl/permissions', 'list_role', 'Danh sách quyền', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(356, 0, 'vi', 'core/acl/permissions', 'created_on', 'Ngày tạo', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(357, 0, 'vi', 'core/acl/permissions', 'created_by', 'Được tạo bởi', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(358, 0, 'vi', 'core/acl/permissions', 'actions', 'Tác vụ', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(359, 0, 'vi', 'core/acl/permissions', 'create_success', 'Tạo thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(360, 0, 'vi', 'core/acl/permissions', 'delete_global_role', 'Không thể xóa quyền hệ thống', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(361, 0, 'vi', 'core/acl/permissions', 'delete_success', 'Xóa quyền thành công', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(362, 0, 'vi', 'core/acl/permissions', 'duplicated_success', 'Nhân bản thành công', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(363, 0, 'vi', 'core/acl/permissions', 'modified_success', 'Sửa thành công', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(364, 0, 'vi', 'core/acl/permissions', 'no_select', 'Hãy chọn ít nhất một quyền để thực hiện hành động này!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(365, 0, 'vi', 'core/acl/permissions', 'not_found', 'Không tìm thấy quyền thành viên nào!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(366, 0, 'vi', 'core/acl/permissions', 'options', 'Tùy chọn', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(367, 0, 'vi', 'core/acl/permissions', 'role_delete_belong_user', 'Không thể xóa quyền hạn này vì nó thuộc về người khác!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(368, 0, 'vi', 'core/acl/permissions', 'role_edit_belong_user', 'Bạn không được phép sửa quyền này vì nó thuộc về người khác', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(369, 0, 'vi', 'core/acl/permissions', 'role_in_use', 'Không thể xóa quyền người dùng này vì nó đang được sử dụng!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(370, 0, 'vi', 'core/acl/permissions', 'access_denied_message', 'Bạn không có quyền sử dụng chức năng này!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(371, 0, 'vi', 'core/acl/permissions', 'roles', 'Quyền', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(372, 0, 'vi', 'core/acl/permissions', 'role_permission', 'Nhóm và phân quyền', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(373, 0, 'vi', 'core/acl/permissions', 'user_management', 'Quản lý người dùng hệ thống', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(374, 0, 'vi', 'core/acl/permissions', 'super_user_management', 'Quản lý người dùng cấp cao', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(375, 0, 'vi', 'core/acl/reminders', 'password', 'Mật khẩu phải ít nhất 6 kí tự và trùng khớp với mật khẩu xác nhận.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(376, 0, 'vi', 'core/acl/reminders', 'user', 'Hệ thống không thể tìm thấy tài khoản với email này.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(377, 0, 'vi', 'core/acl/reminders', 'token', 'Mã khôi phục mật khẩu này không hợp lệ.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(378, 0, 'vi', 'core/acl/reminders', 'sent', 'Liên kết khôi phục mật khẩu đã được gửi!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(379, 0, 'vi', 'core/acl/reminders', 'reset', 'Mật khẩu đã được thay đổi!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(380, 0, 'vi', 'core/acl/users', 'delete_user_logged_in', 'Không thể xóa người dùng đang đăng nhập hệ thống!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(381, 0, 'vi', 'core/acl/users', 'no_select', 'Hãy chọn ít nhất một trường để thực hiện hành động này!', '2021-12-31 22:02:23', '2021-12-31 22:02:45');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(382, 0, 'vi', 'core/acl/users', 'lock_user_logged_in', 'Không thể khóa người dùng đang đăng nhập hệ thống!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(383, 0, 'vi', 'core/acl/users', 'update_success', 'Cập nhật trạng thái thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(384, 0, 'vi', 'core/acl/users', 'save_setting_failed', 'Có lỗi xảy ra trong quá trình lưu cài đặt của người dùng', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(385, 0, 'vi', 'core/acl/users', 'not_found', 'Không tìm thấy người dùng', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(386, 0, 'vi', 'core/acl/users', 'email_exist', 'Email này đã được sử dụng bởi người dùng khác trong hệ thống', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(387, 0, 'vi', 'core/acl/users', 'username_exist', 'Tên đăng nhập này đã được sử dụng bởi người dùng khác trong hệ thống', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(388, 0, 'vi', 'core/acl/users', 'update_profile_success', 'Thông tin tài khoản của bạn đã được cập nhật thành công', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(389, 0, 'vi', 'core/acl/users', 'password_update_success', 'Cập nhật mật khẩu thành công', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(390, 0, 'vi', 'core/acl/users', 'current_password_not_valid', 'Mật khẩu hiện tại không chính xác', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(391, 0, 'vi', 'core/acl/users', 'user_exist_in', 'Người dùng đã là thành viên', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(392, 0, 'vi', 'core/acl/users', 'email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(393, 0, 'vi', 'core/acl/users', 'username', 'Tên đăng nhập', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(394, 0, 'vi', 'core/acl/users', 'role', 'Phân quyền', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(395, 0, 'vi', 'core/acl/users', 'first_name', 'Họ', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(396, 0, 'vi', 'core/acl/users', 'last_name', 'Tên', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(397, 0, 'vi', 'core/acl/users', 'message', 'Thông điệp', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(398, 0, 'vi', 'core/acl/users', 'cancel_btn', 'Hủy bỏ', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(399, 0, 'vi', 'core/acl/users', 'password', 'Mật khẩu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(400, 0, 'vi', 'core/acl/users', 'new_password', 'Mật khẩu mới', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(401, 0, 'vi', 'core/acl/users', 'save', 'Lưu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(402, 0, 'vi', 'core/acl/users', 'confirm_new_password', 'Xác nhận mật khẩu mới', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(403, 0, 'vi', 'core/acl/users', 'deleted', 'Xóa thành viên thành công', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(404, 0, 'vi', 'core/acl/users', 'cannot_delete', 'Không thể xóa thành viên', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(405, 0, 'vi', 'core/acl/users', 'last_login', 'Lần cuối đăng nhập', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(406, 0, 'vi', 'core/acl/users', 'error_update_profile_image', 'Có lỗi trong quá trình đổi ảnh đại diện', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(407, 0, 'vi', 'core/acl/users', 'email_reminder_template', '<h3>Xin chào :name</h3><p>Hệ thống vừa nhận được yêu cầu khôi phục mật khẩu cho tài khoản của bạn, để hoàn tất tác vụ này vui lòng click vào đường link bên dưới.</p><p><a href=\":link\">Khôi phục mật khẩu</a></p><p>Nếu không phải bạn yêu cầu khôi phục mật khẩu, vui lòng bỏ qua email này.</p><p>Email này có giá trị trong vòng 60 phút kể từ lúc nhận được email.</p>', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(408, 0, 'vi', 'core/acl/users', 'change_profile_image', 'Thay đổi ảnh đại diện', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(409, 0, 'vi', 'core/acl/users', 'new_image', 'Ảnh mới', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(410, 0, 'vi', 'core/acl/users', 'loading', 'Đang tải', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(411, 0, 'vi', 'core/acl/users', 'close', 'Đóng', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(412, 0, 'vi', 'core/acl/users', 'update', 'Cập nhật', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(413, 0, 'vi', 'core/acl/users', 'read_image_failed', 'Không đọc được nội dung của hình ảnh', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(414, 0, 'vi', 'core/acl/users', 'update_avatar_success', 'Cập nhật ảnh đại diện thành công!', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(415, 0, 'vi', 'core/acl/users', 'users', 'Quản trị viên', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(416, 0, 'vi', 'core/acl/users', 'info.title', 'Thông tin người dùng', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(417, 0, 'vi', 'core/acl/users', 'info.first_name', 'Họ', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(418, 0, 'vi', 'core/acl/users', 'info.last_name', 'Tên', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(419, 0, 'vi', 'core/acl/users', 'info.email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(420, 0, 'vi', 'core/acl/users', 'info.second_email', 'Email dự phòng', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(421, 0, 'vi', 'core/acl/users', 'info.address', 'Địa chỉ', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(422, 0, 'vi', 'core/acl/users', 'info.second_address', 'Địa chỉ dự phòng', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(423, 0, 'vi', 'core/acl/users', 'info.birth_day', 'Ngày sinh', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(424, 0, 'vi', 'core/acl/users', 'info.job', 'Nghề nghiệp', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(425, 0, 'vi', 'core/acl/users', 'info.mobile_number', 'Số điện thoại di động', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(426, 0, 'vi', 'core/acl/users', 'info.second_mobile_number', 'Số điện thoại dự phòng', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(427, 0, 'vi', 'core/acl/users', 'info.interes', 'Sở thích', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(428, 0, 'vi', 'core/acl/users', 'info.about', 'Giới thiệu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(429, 0, 'vi', 'core/acl/users', 'gender.title', 'Giới tính', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(430, 0, 'vi', 'core/acl/users', 'gender.male', 'nam', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(431, 0, 'vi', 'core/acl/users', 'gender.female', 'nữ', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(432, 0, 'vi', 'core/acl/users', 'change_password', 'Thay đổi mật khẩu', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(433, 0, 'vi', 'core/acl/users', 'current_password', 'Mật khẩu hiện tại', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(434, 0, 'en', 'core/base/base', 'yes', 'Yes', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(435, 0, 'en', 'core/base/base', 'no', 'No', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(436, 0, 'en', 'core/base/base', 'is_default', 'Is default?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(437, 0, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(438, 0, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(439, 0, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(440, 0, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(441, 0, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(442, 0, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(443, 0, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(444, 0, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(445, 0, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(446, 0, 'en', 'core/base/base', 'change_image', 'Change image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(447, 0, 'en', 'core/base/base', 'delete_image', 'Delete image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(448, 0, 'en', 'core/base/base', 'preview_image', 'Preview image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(449, 0, 'en', 'core/base/base', 'image', 'Image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(450, 0, 'en', 'core/base/base', 'using_button', 'Using button', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(451, 0, 'en', 'core/base/base', 'select_image', 'Select image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(452, 0, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(453, 0, 'en', 'core/base/base', 'add_image', 'Add image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(454, 0, 'en', 'core/base/base', 'tools', 'Tools', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(455, 0, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(456, 0, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(457, 0, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(458, 0, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(459, 0, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(460, 0, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(461, 0, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(462, 0, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(463, 0, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(464, 0, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(465, 0, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(466, 0, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(467, 0, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(468, 0, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(469, 0, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(470, 0, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(471, 0, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(472, 0, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(473, 0, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(474, 0, 'en', 'core/base/enums', 'statuses.published', 'Published', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(475, 0, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(476, 0, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(477, 0, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(478, 0, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(479, 0, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(480, 0, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(481, 0, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(482, 0, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\"http://flex-home.test/admin\">clicking here</a>.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(483, 0, 'en', 'core/base/errors', 'not_found', 'Not Found', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(484, 0, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(485, 0, 'en', 'core/base/forms', 'actions', 'Actions', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(486, 0, 'en', 'core/base/forms', 'save', 'Save', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(487, 0, 'en', 'core/base/forms', 'save_and_continue', 'Save & Edit', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(488, 0, 'en', 'core/base/forms', 'image', 'Image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(489, 0, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(490, 0, 'en', 'core/base/forms', 'create', 'Create', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(491, 0, 'en', 'core/base/forms', 'edit', 'Edit', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(492, 0, 'en', 'core/base/forms', 'permalink', 'Permalink', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(493, 0, 'en', 'core/base/forms', 'ok', 'OK', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(494, 0, 'en', 'core/base/forms', 'cancel', 'Cancel', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(495, 0, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(496, 0, 'en', 'core/base/forms', 'template', 'Template', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(497, 0, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(498, 0, 'en', 'core/base/forms', 'file', 'File', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(499, 0, 'en', 'core/base/forms', 'content', 'Content', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(500, 0, 'en', 'core/base/forms', 'description', 'Description', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(501, 0, 'en', 'core/base/forms', 'name', 'Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(502, 0, 'en', 'core/base/forms', 'slug', 'Slug', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(503, 0, 'en', 'core/base/forms', 'title', 'Title', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(504, 0, 'en', 'core/base/forms', 'value', 'Value', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(505, 0, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(506, 0, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(507, 0, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(508, 0, 'en', 'core/base/forms', 'parent', 'Parent', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(509, 0, 'en', 'core/base/forms', 'icon', 'Icon', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(510, 0, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(511, 0, 'en', 'core/base/forms', 'order_by', 'Order by', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(512, 0, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(513, 0, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(514, 0, 'en', 'core/base/forms', 'is_default', 'Is default?', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(515, 0, 'en', 'core/base/forms', 'update', 'Update', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(516, 0, 'en', 'core/base/forms', 'publish', 'Publish', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(517, 0, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(518, 0, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(519, 0, 'en', 'core/base/forms', 'order', 'Order', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(520, 0, 'en', 'core/base/forms', 'alias', 'Alias', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(521, 0, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(522, 0, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(523, 0, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(524, 0, 'en', 'core/base/forms', 'add', 'Add', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(525, 0, 'en', 'core/base/forms', 'link', 'Link', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(526, 0, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(527, 0, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(528, 0, 'en', 'core/base/forms', 'expand_all', 'Expand all', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(529, 0, 'en', 'core/base/forms', 'collapse_all', 'Collapse all', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(530, 0, 'en', 'core/base/forms', 'view_new_tab', 'Open in new tab', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(531, 0, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(532, 0, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(533, 0, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(534, 0, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(535, 0, 'en', 'core/base/layouts', 'settings', 'Settings', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(536, 0, 'en', 'core/base/layouts', 'setting_general', 'General', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(537, 0, 'en', 'core/base/layouts', 'setting_email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(538, 0, 'en', 'core/base/layouts', 'system_information', 'System information', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(539, 0, 'en', 'core/base/layouts', 'theme', 'Theme', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(540, 0, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(541, 0, 'en', 'core/base/layouts', 'profile', 'Profile', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(542, 0, 'en', 'core/base/layouts', 'logout', 'Logout', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(543, 0, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(544, 0, 'en', 'core/base/layouts', 'home', 'Home', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(545, 0, 'en', 'core/base/layouts', 'search', 'Search', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(546, 0, 'en', 'core/base/layouts', 'add_new', 'Add new', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(547, 0, 'en', 'core/base/layouts', 'n_a', 'N/A', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(548, 0, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(549, 0, 'en', 'core/base/layouts', 'view_website', 'View website', '2021-12-31 22:02:23', '2021-12-31 22:02:45'),
(550, 0, 'en', 'core/base/mail', 'send-fail', 'Send email failed', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(551, 0, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(552, 0, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(553, 0, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(554, 0, 'en', 'core/base/notices', 'success_header', 'Success!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(555, 0, 'en', 'core/base/notices', 'error_header', 'Error!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(556, 0, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(557, 0, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(558, 0, 'en', 'core/base/notices', 'error', 'Error!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(559, 0, 'en', 'core/base/notices', 'success', 'Success!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(560, 0, 'en', 'core/base/notices', 'info', 'Info!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(561, 0, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(562, 0, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(563, 0, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(564, 0, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(565, 0, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(566, 0, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(567, 0, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(568, 0, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(569, 0, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(570, 0, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(571, 0, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(572, 0, 'en', 'core/base/system', 'user_management', 'User Management', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(573, 0, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(574, 0, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(575, 0, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(576, 0, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(577, 0, 'en', 'core/base/system', 'user.email', 'Email', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(578, 0, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(579, 0, 'en', 'core/base/system', 'user.username', 'Username', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(580, 0, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(581, 0, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(582, 0, 'en', 'core/base/system', 'user.create', 'Create', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(583, 0, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(584, 0, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(585, 0, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(586, 0, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2021-12-31 22:02:23', '2021-12-31 22:02:46'),
(587, 0, 'en', 'core/base/system', 'options.info', 'System information', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(588, 0, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(589, 0, 'en', 'core/base/system', 'info.title', 'System information', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(590, 0, 'en', 'core/base/system', 'info.cache', 'Cache', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(591, 0, 'en', 'core/base/system', 'info.locale', 'Active locale', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(592, 0, 'en', 'core/base/system', 'info.environment', 'Environment', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(593, 0, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(594, 0, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(595, 0, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(596, 0, 'en', 'core/base/system', 'system_environment', 'System Environment', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(597, 0, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(598, 0, 'en', 'core/base/system', 'timezone', 'Timezone', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(599, 0, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(600, 0, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(601, 0, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(602, 0, 'en', 'core/base/system', 'app_size', 'App Size', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(603, 0, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(604, 0, 'en', 'core/base/system', 'php_version', 'PHP Version', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(605, 0, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(606, 0, 'en', 'core/base/system', 'server_software', 'Server Software', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(607, 0, 'en', 'core/base/system', 'server_os', 'Server OS', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(608, 0, 'en', 'core/base/system', 'database', 'Database', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(609, 0, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(610, 0, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(611, 0, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(612, 0, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(613, 0, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(614, 0, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(615, 0, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(616, 0, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(617, 0, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(618, 0, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(619, 0, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(620, 0, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(621, 0, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(622, 0, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(623, 0, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(624, 0, 'en', 'core/base/system', 'package_name', 'Package Name', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(625, 0, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(626, 0, 'en', 'core/base/system', 'version', 'Version', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(627, 0, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(628, 0, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(629, 0, 'en', 'core/base/system', 'updater', 'System Updater', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(630, 0, 'en', 'core/base/system', 'zip', 'Zip Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(631, 0, 'en', 'core/base/tables', 'id', 'ID', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(632, 0, 'en', 'core/base/tables', 'name', 'Name', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(633, 0, 'en', 'core/base/tables', 'slug', 'Slug', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(634, 0, 'en', 'core/base/tables', 'title', 'Title', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(635, 0, 'en', 'core/base/tables', 'order_by', 'Order By', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(636, 0, 'en', 'core/base/tables', 'order', 'Order', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(637, 0, 'en', 'core/base/tables', 'status', 'Status', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(638, 0, 'en', 'core/base/tables', 'created_at', 'Created At', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(639, 0, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(640, 0, 'en', 'core/base/tables', 'description', 'Description', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(641, 0, 'en', 'core/base/tables', 'operations', 'Operations', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(642, 0, 'en', 'core/base/tables', 'url', 'URL', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(643, 0, 'en', 'core/base/tables', 'author', 'Author', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(644, 0, 'en', 'core/base/tables', 'notes', 'Notes', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(645, 0, 'en', 'core/base/tables', 'column', 'Column', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(646, 0, 'en', 'core/base/tables', 'origin', 'Origin', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(647, 0, 'en', 'core/base/tables', 'after_change', 'After changes', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(648, 0, 'en', 'core/base/tables', 'views', 'Views', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(649, 0, 'en', 'core/base/tables', 'browser', 'Browser', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(650, 0, 'en', 'core/base/tables', 'session', 'Session', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(651, 0, 'en', 'core/base/tables', 'activated', 'activated', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(652, 0, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(653, 0, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(654, 0, 'en', 'core/base/tables', 'edit', 'Edit', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(655, 0, 'en', 'core/base/tables', 'delete', 'Delete', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(656, 0, 'en', 'core/base/tables', 'restore', 'Restore', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(657, 0, 'en', 'core/base/tables', 'activate', 'Activate', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(658, 0, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(659, 0, 'en', 'core/base/tables', 'excel', 'Excel', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(660, 0, 'en', 'core/base/tables', 'export', 'Export', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(661, 0, 'en', 'core/base/tables', 'csv', 'CSV', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(662, 0, 'en', 'core/base/tables', 'pdf', 'PDF', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(663, 0, 'en', 'core/base/tables', 'print', 'Print', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(664, 0, 'en', 'core/base/tables', 'reset', 'Reset', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(665, 0, 'en', 'core/base/tables', 'reload', 'Reload', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(666, 0, 'en', 'core/base/tables', 'display', 'Display', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(667, 0, 'en', 'core/base/tables', 'all', 'All', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(668, 0, 'en', 'core/base/tables', 'add_new', 'Add New', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(669, 0, 'en', 'core/base/tables', 'action', 'Actions', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(670, 0, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(671, 0, 'en', 'core/base/tables', 'view', 'View Detail', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(672, 0, 'en', 'core/base/tables', 'save', 'Save', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(673, 0, 'en', 'core/base/tables', 'show_from', 'Show from', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(674, 0, 'en', 'core/base/tables', 'to', 'to', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(675, 0, 'en', 'core/base/tables', 'in', 'in', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(676, 0, 'en', 'core/base/tables', 'records', 'records', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(677, 0, 'en', 'core/base/tables', 'no_data', 'No data to display', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(678, 0, 'en', 'core/base/tables', 'no_record', 'No record', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(679, 0, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(680, 0, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(681, 0, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(682, 0, 'en', 'core/base/tables', 'cancel', 'Cancel', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(683, 0, 'en', 'core/base/tables', 'template', 'Template', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(684, 0, 'en', 'core/base/tables', 'email', 'Email', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(685, 0, 'en', 'core/base/tables', 'last_login', 'Last login', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(686, 0, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(687, 0, 'en', 'core/base/tables', 'image', 'Image', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(688, 0, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(689, 0, 'en', 'core/base/tables', 'submit', 'Submit', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(690, 0, 'en', 'core/base/tables', 'please_select_record', 'Please select at least one record to perform this action!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(691, 0, 'en', 'core/base/tabs', 'detail', 'Detail', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(692, 0, 'en', 'core/base/tabs', 'file', 'Files', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(693, 0, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(694, 0, 'en', 'core/base/tabs', 'revision', 'Revision History', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(695, 0, 'vi', 'core/base/cache', 'cache_management', 'Quản lý bộ nhớ đệm', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(696, 0, 'vi', 'core/base/cache', 'cache_commands', 'Các lệnh xoá bộ nhớ đệm cơ bản', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(697, 0, 'vi', 'core/base/cache', 'commands.clear_cms_cache.title', 'Xóa tất cả bộ đệm hiện có của ứng dụng', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(698, 0, 'vi', 'core/base/cache', 'commands.clear_cms_cache.description', 'Xóa các bộ nhớ đệm của ứng dụng: cơ sở dữ liệu, nội dung tĩnh... Chạy lệnh này khi bạn thử cập nhật dữ liệu nhưng giao diện không thay đổi', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(699, 0, 'vi', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Bộ đệm đã được xóa', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(700, 0, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Làm mới bộ đệm giao diện', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(701, 0, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Làm mới bộ đệm giao diện giúp phần giao diện luôn mới nhất', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(702, 0, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Bộ đệm giao diện đã được làm mới', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(703, 0, 'vi', 'core/base/cache', 'commands.clear_config_cache.title', 'Xóa bộ nhớ đệm của phần cấu hình', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(704, 0, 'vi', 'core/base/cache', 'commands.clear_config_cache.description', 'Bạn cần làm mới bộ đệm cấu hình khi bạn tạo ra sự thay đổi nào đó ở môi trường thành phẩm.', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(705, 0, 'vi', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Bộ đệm cấu hình đã được xóa', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(706, 0, 'vi', 'core/base/cache', 'commands.clear_route_cache.title', 'Xoá cache đường dẫn', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(707, 0, 'vi', 'core/base/cache', 'commands.clear_route_cache.description', 'Cần thực hiện thao tác này khi thấy không xuất hiện đường dẫn mới.', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(708, 0, 'vi', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'Bộ đệm điều hướng đã bị xóa', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(709, 0, 'vi', 'core/base/cache', 'commands.clear_log.description', 'Xoá lịch sử lỗi', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(710, 0, 'vi', 'core/base/cache', 'commands.clear_log.success_msg', 'Lịch sử lỗi đã được làm sạch', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(711, 0, 'vi', 'core/base/cache', 'commands.clear_log.title', 'Xoá lịch sử lỗi', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(712, 0, 'vi', 'core/base/enums', 'statuses.draft', 'Bản nháp', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(713, 0, 'vi', 'core/base/enums', 'statuses.pending', 'Đang chờ xử lý', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(714, 0, 'vi', 'core/base/errors', '401_title', 'Bạn không có quyền truy cập trang này', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(715, 0, 'vi', 'core/base/errors', '401_msg', '<li>Bạn không được cấp quyền truy cập bởi quản trị viên.</li>\n	                <li>Bạn sử dụng sai loại tài khoản.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(716, 0, 'vi', 'core/base/errors', '404_title', 'Không tìm thấy trang yêu cầu', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(717, 0, 'vi', 'core/base/errors', '404_msg', '<li>Trang bạn yêu cầu không tồn tại.</li>\n	                <li>Liên kết bạn vừa nhấn không còn được sử dụng.</li>\n	                <li>Trang này có thể đã được chuyển sang vị trí khác.</li>\n	                <li>Có thể có lỗi xảy ra.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(718, 0, 'vi', 'core/base/errors', '500_title', 'Không thể tải trang', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(719, 0, 'vi', 'core/base/errors', '500_msg', '<li>Trang bạn yêu cầu không tồn tại.</li>\n	                <li>Liên kết bạn vừa nhấn không còn được sử dụng.</li>\n	                <li>Trang này có thể đã được chuyển sang vị trí khác.</li>\n	                <li>Có thể có lỗi xảy ra.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(720, 0, 'vi', 'core/base/errors', 'reasons', 'Điều này có thể xảy ra vì nhiều lý do.', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(721, 0, 'vi', 'core/base/errors', 'try_again', 'Vui lòng thử lại trong vài phút, hoặc quay trở lại trang chủ bằng cách <a href=\"http://cms.local/admin\"> nhấn vào đây </a>.', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(722, 0, 'vi', 'core/base/forms', 'choose_image', 'Chọn ảnh', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(723, 0, 'vi', 'core/base/forms', 'actions', 'Tác vụ', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(724, 0, 'vi', 'core/base/forms', 'save', 'Lưu', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(725, 0, 'vi', 'core/base/forms', 'save_and_continue', 'Lưu & chỉnh sửa', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(726, 0, 'vi', 'core/base/forms', 'image', 'Hình ảnh', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(727, 0, 'vi', 'core/base/forms', 'image_placeholder', 'Chèn đường dẫn hình ảnh hoặc nhấn nút để chọn hình', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(728, 0, 'vi', 'core/base/forms', 'create', 'Tạo mới', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(729, 0, 'vi', 'core/base/forms', 'edit', 'Sửa', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(730, 0, 'vi', 'core/base/forms', 'permalink', 'Đường dẫn', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(731, 0, 'vi', 'core/base/forms', 'ok', 'OK', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(732, 0, 'vi', 'core/base/forms', 'cancel', 'Hủy bỏ', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(733, 0, 'vi', 'core/base/forms', 'character_remain', 'kí tự còn lại', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(734, 0, 'vi', 'core/base/forms', 'template', 'Template', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(735, 0, 'vi', 'core/base/forms', 'choose_file', 'Chọn tập tin', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(736, 0, 'vi', 'core/base/forms', 'file', 'Tập tin', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(737, 0, 'vi', 'core/base/forms', 'content', 'Nội dung', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(738, 0, 'vi', 'core/base/forms', 'description', 'Mô tả', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(739, 0, 'vi', 'core/base/forms', 'name', 'Tên', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(740, 0, 'vi', 'core/base/forms', 'name_placeholder', 'Nhập tên', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(741, 0, 'vi', 'core/base/forms', 'description_placeholder', 'Mô tả ngắn', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(742, 0, 'vi', 'core/base/forms', 'parent', 'Cha', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(743, 0, 'vi', 'core/base/forms', 'icon', 'Biểu tượng', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(744, 0, 'vi', 'core/base/forms', 'order_by', 'Sắp xếp', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(745, 0, 'vi', 'core/base/forms', 'order_by_placeholder', 'Sắp xếp', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(746, 0, 'vi', 'core/base/forms', 'slug', 'Slug', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(747, 0, 'vi', 'core/base/forms', 'is_featured', 'Nổi bật?', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(748, 0, 'vi', 'core/base/forms', 'is_default', 'Mặc định?', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(749, 0, 'vi', 'core/base/forms', 'icon_placeholder', 'Ví dụ: fa fa-home', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(750, 0, 'vi', 'core/base/forms', 'update', 'Cập nhật', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(751, 0, 'vi', 'core/base/forms', 'publish', 'Xuất bản', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(752, 0, 'vi', 'core/base/forms', 'remove_image', 'Xoá ảnh', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(753, 0, 'vi', 'core/base/forms', 'add', 'Thêm', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(754, 0, 'vi', 'core/base/forms', 'add_short_code', 'Thêm shortcode', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(755, 0, 'vi', 'core/base/forms', 'alias', 'Mã thay thế', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(756, 0, 'vi', 'core/base/forms', 'alias_placeholder', 'Mã thay thế', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(757, 0, 'vi', 'core/base/forms', 'basic_information', 'Thông tin cơ bản', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(758, 0, 'vi', 'core/base/forms', 'link', 'Liên kết', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(759, 0, 'vi', 'core/base/forms', 'order', 'Thứ tự', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(760, 0, 'vi', 'core/base/forms', 'short_code', 'Shortcode', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(761, 0, 'vi', 'core/base/forms', 'title', 'Tiêu đề', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(762, 0, 'vi', 'core/base/forms', 'value', 'Giá trị', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(763, 0, 'vi', 'core/base/forms', 'show_hide_editor', 'Ẩn/Hiện trình soạn thảo', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(764, 0, 'vi', 'core/base/forms', 'basic_info_title', 'Thông tin cơ bản', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(765, 0, 'vi', 'core/base/layouts', 'platform_admin', 'Quản trị hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(766, 0, 'vi', 'core/base/layouts', 'dashboard', 'Bảng điều khiển', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(767, 0, 'vi', 'core/base/layouts', 'widgets', 'Tiện ích', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(768, 0, 'vi', 'core/base/layouts', 'plugins', 'Tiện ích mở rộng', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(769, 0, 'vi', 'core/base/layouts', 'settings', 'Cài đặt', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(770, 0, 'vi', 'core/base/layouts', 'setting_general', 'Cơ bản', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(771, 0, 'vi', 'core/base/layouts', 'system_information', 'Thông tin hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(772, 0, 'vi', 'core/base/layouts', 'theme', 'Giao diện', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(773, 0, 'vi', 'core/base/layouts', 'copyright', 'Bản quyền :year &copy; :company. Phiên bản: <span>:version</span>', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(774, 0, 'vi', 'core/base/layouts', 'profile', 'Thông tin cá nhân', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(775, 0, 'vi', 'core/base/layouts', 'logout', 'Đăng xuất', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(776, 0, 'vi', 'core/base/layouts', 'no_search_result', 'Không có kết quả tìm kiếm, hãy thử lại với từ khóa khác.', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(777, 0, 'vi', 'core/base/layouts', 'home', 'Trang chủ', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(778, 0, 'vi', 'core/base/layouts', 'search', 'Tìm kiếm', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(779, 0, 'vi', 'core/base/layouts', 'add_new', 'Thêm mới', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(780, 0, 'vi', 'core/base/layouts', 'n_a', 'N/A', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(781, 0, 'vi', 'core/base/layouts', 'page_loaded_time', 'Trang tải xong trong', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(782, 0, 'vi', 'core/base/layouts', 'view_website', 'Xem trang ngoài', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(783, 0, 'vi', 'core/base/layouts', 'setting_email', 'Email', '2021-12-31 22:02:24', '2021-12-31 22:02:45'),
(784, 0, 'vi', 'core/base/mail', 'send-fail', 'Gửi email không thành công', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(785, 0, 'vi', 'core/base/notices', 'create_success_message', 'Tạo thành công', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(786, 0, 'vi', 'core/base/notices', 'update_success_message', 'Cập nhật thành công', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(787, 0, 'vi', 'core/base/notices', 'delete_success_message', 'Xóa thành công', '2021-12-31 22:02:24', '2021-12-31 22:02:46');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(788, 0, 'vi', 'core/base/notices', 'success_header', 'Thành công!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(789, 0, 'vi', 'core/base/notices', 'error_header', 'Lỗi!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(790, 0, 'vi', 'core/base/notices', 'no_select', 'Chọn ít nhất 1 trường để thực hiện hành động này!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(791, 0, 'vi', 'core/base/notices', 'processing_request', 'Hệ thống đang xử lý yêu cầu.', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(792, 0, 'vi', 'core/base/notices', 'error', 'Lỗi!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(793, 0, 'vi', 'core/base/notices', 'success', 'Thành công!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(794, 0, 'vi', 'core/base/notices', 'info', 'Thông tin!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(795, 0, 'vi', 'core/base/system', 'no_select', 'Hãy chọn ít nhất 1 trường để thực hiện hành động này!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(796, 0, 'vi', 'core/base/system', 'cannot_find_user', 'Không thể tải được thông tin người dùng', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(797, 0, 'vi', 'core/base/system', 'supper_revoked', 'Quyền quản trị viên cao nhất đã được gỡ bỏ', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(798, 0, 'vi', 'core/base/system', 'cannot_revoke_yourself', 'Không thể gỡ bỏ quyền quản trị cấp cao của chính bạn!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(799, 0, 'vi', 'core/base/system', 'cant_remove_supper', 'Bạn không có quyền xóa quản trị viên cấp cao', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(800, 0, 'vi', 'core/base/system', 'cant_find_user_with_email', 'Không thể tìm thấy người dùng với email này', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(801, 0, 'vi', 'core/base/system', 'supper_granted', 'Quyền quản trị cao nhất đã được gán', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(802, 0, 'vi', 'core/base/system', 'delete_log_success', 'Xóa tập tin log thành công!', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(803, 0, 'vi', 'core/base/system', 'get_member_success', 'Hiển thị danh sách thành viên thành công', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(804, 0, 'vi', 'core/base/system', 'error_occur', 'Có lỗi dưới đây', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(805, 0, 'vi', 'core/base/system', 'role_and_permission', 'Phân quyền hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(806, 0, 'vi', 'core/base/system', 'role_and_permission_description', 'Quản lý những phân quyền trong hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(807, 0, 'vi', 'core/base/system', 'user.list_super', 'Danh sách quản trị viên cấp cao', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(808, 0, 'vi', 'core/base/system', 'user.username', 'Tên đăng nhập', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(809, 0, 'vi', 'core/base/system', 'user.email', 'Email', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(810, 0, 'vi', 'core/base/system', 'user.last_login', 'Đăng nhập lần cuối	', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(811, 0, 'vi', 'core/base/system', 'user.add_user', 'Thêm quản trị viên cấp cao', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(812, 0, 'vi', 'core/base/system', 'user.cancel', 'Hủy bỏ', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(813, 0, 'vi', 'core/base/system', 'user.create', 'Thêm', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(814, 0, 'vi', 'core/base/system', 'options.features', 'Kiểm soát truy cập các tính năng', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(815, 0, 'vi', 'core/base/system', 'options.feature_description', 'Bật/tắt các tính năng.', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(816, 0, 'vi', 'core/base/system', 'options.manage_super', 'Quản lý quản trị viên cấp cao', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(817, 0, 'vi', 'core/base/system', 'options.manage_super_description', 'Thêm/xóa quản trị viên cấp cao', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(818, 0, 'vi', 'core/base/system', 'options.info', 'Thông tin hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(819, 0, 'vi', 'core/base/system', 'options.info_description', 'Những thông tin về cấu hình hiện tại của hệ thống.', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(820, 0, 'vi', 'core/base/system', 'info.title', 'Thông tin hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(821, 0, 'vi', 'core/base/system', 'info.cache', 'Bộ nhớ đệm', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(822, 0, 'vi', 'core/base/system', 'info.environment', 'Môi trường', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(823, 0, 'vi', 'core/base/system', 'info.locale', 'Ngôn ngữ hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(824, 0, 'vi', 'core/base/system', 'user_management', 'Quản lý thành viên', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(825, 0, 'vi', 'core/base/system', 'user_management_description', 'Quản lý người dùng trong hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(826, 0, 'vi', 'core/base/system', 'app_size', 'Kích thước ứng dụng', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(827, 0, 'vi', 'core/base/system', 'cache_dir_writable', 'Có thể ghi bộ nhớ đệm', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(828, 0, 'vi', 'core/base/system', 'cache_driver', 'Loại lưu trữ bộ nhớ đệm', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(829, 0, 'vi', 'core/base/system', 'copy_report', 'Sao chép báo cáo', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(830, 0, 'vi', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(831, 0, 'vi', 'core/base/system', 'database', 'Hệ thống dữ liệu', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(832, 0, 'vi', 'core/base/system', 'debug_mode', 'Chế độ sửa lỗi', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(833, 0, 'vi', 'core/base/system', 'dependency_name', 'Tên gói', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(834, 0, 'vi', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(835, 0, 'vi', 'core/base/system', 'extra_information', 'Thông tin mở rộng', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(836, 0, 'vi', 'core/base/system', 'extra_stats', 'Thống kê thêm', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(837, 0, 'vi', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(838, 0, 'vi', 'core/base/system', 'framework_version', 'Phiên bản framework', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(839, 0, 'vi', 'core/base/system', 'get_system_report', 'Lấy thông tin hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(840, 0, 'vi', 'core/base/system', 'installed_packages', 'Các gói đã cài đặt và phiên bản', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(841, 0, 'vi', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(842, 0, 'vi', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(843, 0, 'vi', 'core/base/system', 'package_name', 'Tên gói', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(844, 0, 'vi', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(845, 0, 'vi', 'core/base/system', 'php_version', 'Phiên bản PHP', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(846, 0, 'vi', 'core/base/system', 'report_description', 'Vui lòng chia sẻ thông tin này nhằm mục đích điều tra nguyên nhân gây lỗi', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(847, 0, 'vi', 'core/base/system', 'server_environment', 'Môi trường máy chủ', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(848, 0, 'vi', 'core/base/system', 'server_os', 'Hệ điều hành của máy chủ', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(849, 0, 'vi', 'core/base/system', 'server_software', 'Phần mềm', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(850, 0, 'vi', 'core/base/system', 'session_driver', 'Loại lưu trữ phiên làm việc', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(851, 0, 'vi', 'core/base/system', 'ssl_installed', 'Đã cài đặt chứng chỉ SSL', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(852, 0, 'vi', 'core/base/system', 'storage_dir_writable', 'Có thể lưu trữ dữ liệu tạm', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(853, 0, 'vi', 'core/base/system', 'system_environment', 'Môi trường hệ thống', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(854, 0, 'vi', 'core/base/system', 'timezone', 'Múi giờ', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(855, 0, 'vi', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(856, 0, 'vi', 'core/base/system', 'version', 'Phiên bản', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(857, 0, 'vi', 'core/base/system', 'cms_version', 'Phiên bản CMS', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(858, 0, 'vi', 'core/base/tables', 'id', 'ID', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(859, 0, 'vi', 'core/base/tables', 'name', 'Tên', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(860, 0, 'vi', 'core/base/tables', 'order_by', 'Thứ tự', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(861, 0, 'vi', 'core/base/tables', 'status', 'Trạng thái', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(862, 0, 'vi', 'core/base/tables', 'created_at', 'Ngày tạo', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(863, 0, 'vi', 'core/base/tables', 'updated_at', 'Ngày cập nhật', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(864, 0, 'vi', 'core/base/tables', 'operations', 'Tác vụ', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(865, 0, 'vi', 'core/base/tables', 'url', 'URL', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(866, 0, 'vi', 'core/base/tables', 'author', 'Người tạo', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(867, 0, 'vi', 'core/base/tables', 'column', 'Cột', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(868, 0, 'vi', 'core/base/tables', 'origin', 'Bản cũ', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(869, 0, 'vi', 'core/base/tables', 'after_change', 'Sau khi thay đổi', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(870, 0, 'vi', 'core/base/tables', 'notes', 'Ghi chú', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(871, 0, 'vi', 'core/base/tables', 'activated', 'kích hoạt', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(872, 0, 'vi', 'core/base/tables', 'browser', 'Trình duyệt', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(873, 0, 'vi', 'core/base/tables', 'deactivated', 'hủy kích hoạt', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(874, 0, 'vi', 'core/base/tables', 'description', 'Mô tả', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(875, 0, 'vi', 'core/base/tables', 'session', 'Phiên', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(876, 0, 'vi', 'core/base/tables', 'views', 'Lượt xem', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(877, 0, 'vi', 'core/base/tables', 'restore', 'Khôi phục', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(878, 0, 'vi', 'core/base/tables', 'edit', 'Sửa', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(879, 0, 'vi', 'core/base/tables', 'delete', 'Xóa', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(880, 0, 'vi', 'core/base/tables', 'action', 'Hành động', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(881, 0, 'vi', 'core/base/tables', 'activate', 'Kích hoạt', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(882, 0, 'vi', 'core/base/tables', 'add_new', 'Thêm mới', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(883, 0, 'vi', 'core/base/tables', 'all', 'Tất cả', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(884, 0, 'vi', 'core/base/tables', 'cancel', 'Hủy bỏ', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(885, 0, 'vi', 'core/base/tables', 'confirm_delete', 'Xác nhận xóa', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(886, 0, 'vi', 'core/base/tables', 'confirm_delete_msg', 'Bạn có chắc chắn muốn xóa bản ghi này?', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(887, 0, 'vi', 'core/base/tables', 'csv', 'CSV', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(888, 0, 'vi', 'core/base/tables', 'deactivate', 'Hủy kích hoạt', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(889, 0, 'vi', 'core/base/tables', 'delete_entry', 'Xóa bản ghi', '2021-12-31 22:02:24', '2021-12-31 22:02:46'),
(890, 0, 'vi', 'core/base/tables', 'display', 'Hiển thị', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(891, 0, 'vi', 'core/base/tables', 'excel', 'Excel', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(892, 0, 'vi', 'core/base/tables', 'export', 'Xuất bản', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(893, 0, 'vi', 'core/base/tables', 'in', 'trong tổng số', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(894, 0, 'vi', 'core/base/tables', 'no_data', 'Không có dữ liệu để hiển thị', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(895, 0, 'vi', 'core/base/tables', 'no_record', 'Không có dữ liệu', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(896, 0, 'vi', 'core/base/tables', 'pdf', 'PDF', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(897, 0, 'vi', 'core/base/tables', 'print', 'In', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(898, 0, 'vi', 'core/base/tables', 'records', 'bản ghi', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(899, 0, 'vi', 'core/base/tables', 'reload', 'Tải lại', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(900, 0, 'vi', 'core/base/tables', 'reset', 'Làm mới', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(901, 0, 'vi', 'core/base/tables', 'save', 'Lưu', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(902, 0, 'vi', 'core/base/tables', 'show_from', 'Hiển thị từ', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(903, 0, 'vi', 'core/base/tables', 'template', 'Giao diện', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(904, 0, 'vi', 'core/base/tables', 'to', 'đến', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(905, 0, 'vi', 'core/base/tables', 'view', 'Xem chi tiết', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(906, 0, 'vi', 'core/base/tables', 'email', 'Email', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(907, 0, 'vi', 'core/base/tables', 'image', 'Hình ảnh', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(908, 0, 'vi', 'core/base/tables', 'is_featured', 'Nổi bật', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(909, 0, 'vi', 'core/base/tables', 'last_login', 'Lần cuối đăng nhập', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(910, 0, 'vi', 'core/base/tables', 'order', 'Thứ tự', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(911, 0, 'vi', 'core/base/tables', 'shortcode', 'Shortcode', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(912, 0, 'vi', 'core/base/tables', 'slug', 'Slug', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(913, 0, 'vi', 'core/base/tables', 'title', 'Tiêu đề', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(914, 0, 'vi', 'core/base/tabs', 'detail', 'Chi tiết', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(915, 0, 'vi', 'core/base/tabs', 'file', 'Tập tin', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(916, 0, 'vi', 'core/base/tabs', 'record_note', 'Ghi chú', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(917, 0, 'vi', 'core/base/tabs', 'revision', 'Lịch sử thay đổi', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(918, 0, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(919, 0, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(920, 0, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(921, 0, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(922, 0, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(923, 0, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(924, 0, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(925, 0, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(926, 0, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(927, 0, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(928, 0, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(929, 0, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(930, 0, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(931, 0, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(932, 0, 'en', 'core/dashboard/dashboard', 'predefined_ranges.today', 'Today', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(933, 0, 'en', 'core/dashboard/dashboard', 'predefined_ranges.yesterday', 'Yesterday', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(934, 0, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_week', 'This Week', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(935, 0, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_7_days', 'Last 7 Days', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(936, 0, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_month', 'This Month', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(937, 0, 'en', 'core/dashboard/dashboard', 'predefined_ranges.last_30_days', 'Last 30 Days', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(938, 0, 'en', 'core/dashboard/dashboard', 'predefined_ranges.this_year', 'This Year', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(939, 0, 'vi', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Hủy bỏ', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(940, 0, 'vi', 'core/dashboard/dashboard', 'collapse_expand', 'Mở rộng', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(941, 0, 'vi', 'core/dashboard/dashboard', 'confirm_hide', 'Bạn có chắc?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(942, 0, 'vi', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Vâng, ẩn tiện ích này', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(943, 0, 'vi', 'core/dashboard/dashboard', 'hide', 'Ẩn', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(944, 0, 'vi', 'core/dashboard/dashboard', 'hide_message', 'Bạn có chắc chắn muốn ẩn tiện ích này? Nó sẽ không được hiển thị trên trang chủ nữa!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(945, 0, 'vi', 'core/dashboard/dashboard', 'hide_success', 'Ẩn tiện ích thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(946, 0, 'vi', 'core/dashboard/dashboard', 'manage_widgets', 'Quản lý tiện ích', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(947, 0, 'vi', 'core/dashboard/dashboard', 'reload', 'Làm mới', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(948, 0, 'vi', 'core/dashboard/dashboard', 'save_setting_success', 'Lưu tiện ích thành công', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(949, 0, 'vi', 'core/dashboard/dashboard', 'update_position_success', 'Cập nhật vị trí tiện ích thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(950, 0, 'vi', 'core/dashboard/dashboard', 'widget_not_exists', 'Tiện ích này không tồn tại!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(951, 0, 'vi', 'core/dashboard/dashboard', 'fullscreen', 'Toàn màn hình', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(952, 0, 'vi', 'core/dashboard/dashboard', 'title', 'Trang quản trị', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(953, 0, 'en', 'core/media/media', 'filter', 'Filter', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(954, 0, 'en', 'core/media/media', 'everything', 'Everything', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(955, 0, 'en', 'core/media/media', 'image', 'Image', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(956, 0, 'en', 'core/media/media', 'video', 'Video', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(957, 0, 'en', 'core/media/media', 'document', 'Document', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(958, 0, 'en', 'core/media/media', 'view_in', 'View in', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(959, 0, 'en', 'core/media/media', 'all_media', 'All media', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(960, 0, 'en', 'core/media/media', 'trash', 'Trash', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(961, 0, 'en', 'core/media/media', 'recent', 'Recent', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(962, 0, 'en', 'core/media/media', 'favorites', 'Favorites', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(963, 0, 'en', 'core/media/media', 'upload', 'Upload', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(964, 0, 'en', 'core/media/media', 'create_folder', 'Create folder', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(965, 0, 'en', 'core/media/media', 'refresh', 'Refresh', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(966, 0, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(967, 0, 'en', 'core/media/media', 'search_file_and_folder', 'Search file and folder', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(968, 0, 'en', 'core/media/media', 'sort', 'Sort', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(969, 0, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(970, 0, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(971, 0, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(972, 0, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(973, 0, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(974, 0, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(975, 0, 'en', 'core/media/media', 'actions', 'Actions', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(976, 0, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(977, 0, 'en', 'core/media/media', 'insert', 'Insert', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(978, 0, 'en', 'core/media/media', 'folder_name', 'Folder name', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(979, 0, 'en', 'core/media/media', 'create', 'Create', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(980, 0, 'en', 'core/media/media', 'rename', 'Rename', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(981, 0, 'en', 'core/media/media', 'close', 'Close', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(982, 0, 'en', 'core/media/media', 'save_changes', 'Save changes', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(983, 0, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(984, 0, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(985, 0, 'en', 'core/media/media', 'confirm', 'Confirm', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(986, 0, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(987, 0, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(988, 0, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(989, 0, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(990, 0, 'en', 'core/media/media', 'up_level', 'Up one level', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(991, 0, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(992, 0, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(993, 0, 'en', 'core/media/media', 'gallery', 'Media gallery', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(994, 0, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(995, 0, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(996, 0, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(997, 0, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(998, 0, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(999, 0, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1000, 0, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1001, 0, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1002, 0, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1003, 0, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1004, 0, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1005, 0, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1006, 0, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1007, 0, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1008, 0, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1009, 0, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1010, 0, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1011, 0, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1012, 0, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1013, 0, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1014, 0, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1015, 0, 'en', 'core/media/media', 'menu_name', 'Media', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1016, 0, 'en', 'core/media/media', 'add', 'Add media', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1017, 0, 'en', 'core/media/media', 'javascript.name', 'Name', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1018, 0, 'en', 'core/media/media', 'javascript.url', 'URL', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1019, 0, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1020, 0, 'en', 'core/media/media', 'javascript.size', 'Size', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1021, 0, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1022, 0, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1023, 0, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1024, 0, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1025, 0, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1026, 0, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1027, 0, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1028, 0, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1029, 0, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1030, 0, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1031, 0, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1032, 0, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1033, 0, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1034, 0, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1035, 0, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1036, 0, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1037, 0, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1038, 0, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1039, 0, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1040, 0, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1041, 0, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links has been copied to clipboard', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1042, 0, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1043, 0, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1044, 0, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1045, 0, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1046, 0, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1047, 0, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1048, 0, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1049, 0, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1050, 0, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1051, 0, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1052, 0, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1053, 0, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1054, 0, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1055, 0, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1056, 0, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1057, 0, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1058, 0, 'en', 'core/media/media', 'download_link', 'Download', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1059, 0, 'en', 'core/media/media', 'url', 'URL', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1060, 0, 'en', 'core/media/media', 'download_explain', 'Enter one URL per line.', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1061, 0, 'en', 'core/media/media', 'downloading', 'Downloading...', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1062, 0, 'vi', 'core/media/media', 'filter', 'Lọc', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1063, 0, 'vi', 'core/media/media', 'everything', 'Tất cả', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1064, 0, 'vi', 'core/media/media', 'image', 'Hình ảnh', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1065, 0, 'vi', 'core/media/media', 'video', 'Phim', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1066, 0, 'vi', 'core/media/media', 'document', 'Tài liệu', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1067, 0, 'vi', 'core/media/media', 'view_in', 'Chế độ xem', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1068, 0, 'vi', 'core/media/media', 'all_media', 'Tất cả tập tin', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1069, 0, 'vi', 'core/media/media', 'trash', 'Thùng rác', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1070, 0, 'vi', 'core/media/media', 'recent', 'Gần đây', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1071, 0, 'vi', 'core/media/media', 'favorites', 'Được gắn dấu sao', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1072, 0, 'vi', 'core/media/media', 'upload', 'Tải lên', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1073, 0, 'vi', 'core/media/media', 'create_folder', 'Tạo thư mục', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1074, 0, 'vi', 'core/media/media', 'refresh', 'Làm mới', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1075, 0, 'vi', 'core/media/media', 'empty_trash', 'Dọn thùng rác', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1076, 0, 'vi', 'core/media/media', 'search_file_and_folder', 'Tìm kiếm tập tin và thư mục', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1077, 0, 'vi', 'core/media/media', 'sort', 'Sắp xếp', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1078, 0, 'vi', 'core/media/media', 'file_name_asc', 'Tên tập tin - ASC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1079, 0, 'vi', 'core/media/media', 'file_name_desc', 'Tên tập tin - DESC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1080, 0, 'vi', 'core/media/media', 'uploaded_date_asc', 'Ngày tải lên - ASC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1081, 0, 'vi', 'core/media/media', 'uploaded_date_desc', 'Ngày tải lên - DESC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1082, 0, 'vi', 'core/media/media', 'size_asc', 'Kích thước - ASC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1083, 0, 'vi', 'core/media/media', 'size_desc', 'Kích thước - DESC', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1084, 0, 'vi', 'core/media/media', 'actions', 'Hành động', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1085, 0, 'vi', 'core/media/media', 'nothing_is_selected', 'Không có tập tin nào được chọn', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1086, 0, 'vi', 'core/media/media', 'insert', 'Chèn', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1087, 0, 'vi', 'core/media/media', 'folder_name', 'Tên thư mục', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1088, 0, 'vi', 'core/media/media', 'create', 'Tạo', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1089, 0, 'vi', 'core/media/media', 'rename', 'Đổi tên', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1090, 0, 'vi', 'core/media/media', 'close', 'Đóng', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1091, 0, 'vi', 'core/media/media', 'save_changes', 'Lưu thay đổi', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1092, 0, 'vi', 'core/media/media', 'move_to_trash', 'Đưa vào thùng rác', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1093, 0, 'vi', 'core/media/media', 'confirm_trash', 'Bạn có chắc chắn muốn bỏ những tập tin này vào thùng rác?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1094, 0, 'vi', 'core/media/media', 'confirm', 'Xác nhận', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1095, 0, 'vi', 'core/media/media', 'confirm_delete', 'Xóa tập tin', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1096, 0, 'vi', 'core/media/media', 'confirm_delete_description', 'Hành động này không thể khôi phục. Bạn có chắc chắn muốn xóa các tập tin này?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1097, 0, 'vi', 'core/media/media', 'empty_trash_title', 'Dọn sạch thùng rác', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1098, 0, 'vi', 'core/media/media', 'empty_trash_description', 'Hành động này không thể khôi phục. Bạn có chắc chắn muốn dọn sạch thùng rác?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1099, 0, 'vi', 'core/media/media', 'up_level', 'Quay lại một cấp', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1100, 0, 'vi', 'core/media/media', 'upload_progress', 'Tiến trình tải lên', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1101, 0, 'vi', 'core/media/media', 'folder_created', 'Tạo thư mục thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1102, 0, 'vi', 'core/media/media', 'gallery', 'Thư viện tập tin', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1103, 0, 'vi', 'core/media/media', 'trash_error', 'Có lỗi khi xóa tập tin/thư mục', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1104, 0, 'vi', 'core/media/media', 'trash_success', 'Xóa tập tin/thư mục thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1105, 0, 'vi', 'core/media/media', 'restore_error', 'Có lỗi trong quá trình khôi phục', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1106, 0, 'vi', 'core/media/media', 'restore_success', 'Khôi phục thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1107, 0, 'vi', 'core/media/media', 'copy_success', 'Sao chép thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1108, 0, 'vi', 'core/media/media', 'delete_success', 'Xóa thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1109, 0, 'vi', 'core/media/media', 'favorite_success', 'Thêm dấu sao thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1110, 0, 'vi', 'core/media/media', 'remove_favorite_success', 'Bỏ dấu sao thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1111, 0, 'vi', 'core/media/media', 'rename_error', 'Có lỗi trong quá trình đổi tên', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1112, 0, 'vi', 'core/media/media', 'rename_success', 'Đổi tên thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1113, 0, 'vi', 'core/media/media', 'invalid_action', 'Hành động không hợp lệ!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1114, 0, 'vi', 'core/media/media', 'file_not_exists', 'Tập tin không tồn tại!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1115, 0, 'vi', 'core/media/media', 'download_file_error', 'Có lỗi trong quá trình tải xuống tập tin!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1116, 0, 'vi', 'core/media/media', 'missing_zip_archive_extension', 'Hãy bật ZipArchive extension để tải tập tin!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1117, 0, 'vi', 'core/media/media', 'can_not_download_file', 'Không thể tải tập tin!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1118, 0, 'vi', 'core/media/media', 'invalid_request', 'Yêu cầu không hợp lệ!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1119, 0, 'vi', 'core/media/media', 'add_success', 'Thêm thành công!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1120, 0, 'vi', 'core/media/media', 'file_too_big', 'Tập tin quá lớn. Giới hạn tải lên là :size bytes', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1121, 0, 'vi', 'core/media/media', 'can_not_detect_file_type', 'Loại tập tin không hợp lệ hoặc không thể xác định loại tập tin!', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1122, 0, 'vi', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1123, 0, 'vi', 'core/media/media', 'menu_name', 'Quản lý tập tin', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1124, 0, 'vi', 'core/media/media', 'add', 'Thêm tập tin', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1125, 0, 'vi', 'core/media/media', 'javascript.name', 'Tên', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1126, 0, 'vi', 'core/media/media', 'javascript.url', 'Đường dẫn', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1127, 0, 'vi', 'core/media/media', 'javascript.full_url', 'Đường dẫn tuyệt đối', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1128, 0, 'vi', 'core/media/media', 'javascript.size', 'Kích thước', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1129, 0, 'vi', 'core/media/media', 'javascript.mime_type', 'Loại', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1130, 0, 'vi', 'core/media/media', 'javascript.created_at', 'Được tải lên lúc', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1131, 0, 'vi', 'core/media/media', 'javascript.updated_at', 'Được chỉnh sửa lúc', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1132, 0, 'vi', 'core/media/media', 'javascript.nothing_selected', 'Bạn chưa chọn tập tin nào', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1133, 0, 'vi', 'core/media/media', 'javascript.visit_link', 'Mở liên kết', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1134, 0, 'vi', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1135, 0, 'vi', 'core/media/media', 'javascript.no_item.all_media.title', 'Bạn có thể kéo thả tập tin vào đây để tải lên', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1136, 0, 'vi', 'core/media/media', 'javascript.no_item.all_media.message', 'Hoặc có thể bấm nút Tải lên ở phía trên', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1137, 0, 'vi', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1138, 0, 'vi', 'core/media/media', 'javascript.no_item.trash.title', 'Hiện tại không có tập tin nào trong thùng rác', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1139, 0, 'vi', 'core/media/media', 'javascript.no_item.trash.message', 'Xóa tập tin sẽ đem tập tin lưu vào thùng rác. Xóa tập tin trong thùng rác sẽ xóa vĩnh viễn.', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1140, 0, 'vi', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1141, 0, 'vi', 'core/media/media', 'javascript.no_item.favorites.title', 'Bạn chưa đặt tập tin nào vào mục yêu thích', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1142, 0, 'vi', 'core/media/media', 'javascript.no_item.favorites.message', 'Thêm tập tin vào mục yêu thích để tìm kiếm chúng dễ dàng sau này.', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1143, 0, 'vi', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1144, 0, 'vi', 'core/media/media', 'javascript.no_item.recent.title', 'Bạn chưa mở tập tin nào.', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1145, 0, 'vi', 'core/media/media', 'javascript.no_item.recent.message', 'Mục này hiển thị các tập tin bạn đã xem gần đây.', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1146, 0, 'vi', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1147, 0, 'vi', 'core/media/media', 'javascript.no_item.default.title', 'Thư mục trống', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1148, 0, 'vi', 'core/media/media', 'javascript.no_item.default.message', 'Thư mục này chưa có tập tin nào', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1149, 0, 'vi', 'core/media/media', 'javascript.clipboard.success', 'Đường dẫn của các tập tin đã được sao chép vào clipboard', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1150, 0, 'vi', 'core/media/media', 'javascript.message.error_header', 'Lỗi', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1151, 0, 'vi', 'core/media/media', 'javascript.message.success_header', 'Thành công', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1152, 0, 'vi', 'core/media/media', 'javascript.download.error', 'Bạn chưa chọn tập tin nào hoặc tập tin này không cho phép tải về', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1153, 0, 'vi', 'core/media/media', 'javascript.actions_list.basic.preview', 'Xem trước', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1154, 0, 'vi', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Sao chép đường dẫn', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1155, 0, 'vi', 'core/media/media', 'javascript.actions_list.file.rename', 'Đổi tên', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1156, 0, 'vi', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Nhân bản', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1157, 0, 'vi', 'core/media/media', 'javascript.actions_list.user.favorite', 'Yêu thích', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1158, 0, 'vi', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Xóa khỏi mục yêu thích', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1159, 0, 'vi', 'core/media/media', 'javascript.actions_list.other.download', 'Tải xuống', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1160, 0, 'vi', 'core/media/media', 'javascript.actions_list.other.trash', 'Chuyển vào thùng rác', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1161, 0, 'vi', 'core/media/media', 'javascript.actions_list.other.delete', 'Xóa hoàn toàn', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1162, 0, 'vi', 'core/media/media', 'javascript.actions_list.other.restore', 'Khôi phục', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1163, 0, 'vi', 'core/media/media', 'empty_trash_success', 'Dọn sạch thùng rác thành công', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1164, 0, 'vi', 'core/media/media', 'name_invalid', 'Tên thư mục chứa ký tự không hợp lệ', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1165, 0, 'en', 'core/setting/setting', 'title', 'Settings', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1166, 0, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1167, 0, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1168, 0, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1169, 0, 'en', 'core/setting/setting', 'general.title', 'General', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1170, 0, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1171, 0, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1172, 0, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1173, 0, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1174, 0, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1175, 0, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1176, 0, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1177, 0, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1178, 0, 'en', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1179, 0, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1180, 0, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1181, 0, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1182, 0, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1183, 0, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1184, 0, 'en', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Google Site Verification', '2021-12-31 22:02:25', '2021-12-31 22:02:46');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1185, 0, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1186, 0, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1187, 0, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1188, 0, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1189, 0, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1190, 0, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1191, 0, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1192, 0, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1193, 0, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1194, 0, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1195, 0, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1196, 0, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1197, 0, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1198, 0, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1199, 0, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1200, 0, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1201, 0, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1202, 0, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1203, 0, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1204, 0, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1205, 0, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1206, 0, 'en', 'core/setting/setting', 'general.no', 'No', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1207, 0, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1208, 0, 'en', 'core/setting/setting', 'general.select', '— Select —', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1209, 0, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1210, 0, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1211, 0, 'en', 'core/setting/setting', 'general.locale_direction', 'Front site language direction', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1212, 0, 'en', 'core/setting/setting', 'general.admin_locale_direction', 'Admin language direction', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1213, 0, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1214, 0, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1215, 0, 'en', 'core/setting/setting', 'email.content', 'Content', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1216, 0, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1217, 0, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1218, 0, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1219, 0, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1220, 0, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1221, 0, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1222, 0, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1223, 0, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1224, 0, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1225, 0, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1226, 0, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1227, 0, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1228, 0, 'en', 'core/setting/setting', 'email.port', 'Port', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1229, 0, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1230, 0, 'en', 'core/setting/setting', 'email.host', 'Host', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1231, 0, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1232, 0, 'en', 'core/setting/setting', 'email.username', 'Username', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1233, 0, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1234, 0, 'en', 'core/setting/setting', 'email.password', 'Password', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1235, 0, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1236, 0, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1237, 0, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1238, 0, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1239, 0, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1240, 0, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1241, 0, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1242, 0, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1243, 0, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1244, 0, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1245, 0, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1246, 0, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1247, 0, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1248, 0, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1249, 0, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1250, 0, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1251, 0, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1252, 0, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1253, 0, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1254, 0, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1255, 0, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1256, 0, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1257, 0, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1258, 0, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1259, 0, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1260, 0, 'en', 'core/setting/setting', 'email.default', 'Default', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1261, 0, 'en', 'core/setting/setting', 'email.using_queue_to_send_mail', 'Using queue job to send emails (Must to setup Queue first https://laravel.com/docs/queues#supervisor-configuration)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1262, 0, 'en', 'core/setting/setting', 'media.title', 'Media', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1263, 0, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1264, 0, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1265, 0, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1266, 0, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1267, 0, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1268, 0, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1269, 0, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1270, 0, 'en', 'core/setting/setting', 'media.aws_endpoint', 'AWS Endpoint (Optional)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1271, 0, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1272, 0, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1273, 0, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1274, 0, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1275, 0, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1276, 0, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1277, 0, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1278, 0, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1279, 0, 'en', 'core/setting/setting', 'media.wasabi_access_key_id', 'Wasabi Access Key ID', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1280, 0, 'en', 'core/setting/setting', 'media.wasabi_secret_key', 'Wasabi Secret Key', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1281, 0, 'en', 'core/setting/setting', 'media.wasabi_default_region', 'Wasabi Default Region', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1282, 0, 'en', 'core/setting/setting', 'media.wasabi_bucket', 'Wasabi Bucket', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1283, 0, 'en', 'core/setting/setting', 'media.wasabi_root', 'Wasabi Root', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1284, 0, 'en', 'core/setting/setting', 'media.default_placeholder_image', 'Default placeholder image', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1285, 0, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1286, 0, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2021-12-31 22:02:25', '2021-12-31 22:02:46'),
(1287, 0, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1288, 0, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1289, 0, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1290, 0, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1291, 0, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1292, 0, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1293, 0, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1294, 0, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1295, 0, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1296, 0, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1297, 0, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1298, 0, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1299, 0, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1300, 0, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1301, 0, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1302, 0, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1303, 0, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1304, 0, 'en', 'core/setting/setting', 'media.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1305, 0, 'en', 'core/setting/setting', 'media.bunnycdn_hostname', 'Hostname', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1306, 0, 'en', 'core/setting/setting', 'media.bunnycdn_zone', 'Zone Name (The name of your storage zone)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1307, 0, 'en', 'core/setting/setting', 'media.bunnycdn_key', 'FTP & API Access Password (The storage zone API Access Password)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1308, 0, 'en', 'core/setting/setting', 'media.bunnycdn_region', 'Region (The storage zone region)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1309, 0, 'en', 'core/setting/setting', 'media.optional', 'Optional', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1310, 0, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1311, 0, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1312, 0, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1313, 0, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1314, 0, 'en', 'core/setting/setting', 'template', 'Template', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1315, 0, 'en', 'core/setting/setting', 'description', 'Description', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1316, 0, 'en', 'core/setting/setting', 'enable', 'Enable', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1317, 0, 'en', 'core/setting/setting', 'send', 'Send', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1318, 0, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1319, 0, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1320, 0, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1321, 0, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1322, 0, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1323, 0, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1324, 0, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1325, 0, 'en', 'core/setting/setting', 'saving', 'Saving...', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1326, 0, 'en', 'core/setting/setting', 'emails_warning', 'You can add up to :count emails', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1327, 0, 'en', 'core/setting/setting', 'email_add_more', 'Add more', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1328, 0, 'vi', 'core/setting/setting', 'title', 'Cài đặt', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1329, 0, 'vi', 'core/setting/setting', 'general.theme', 'Giao diện', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1330, 0, 'vi', 'core/setting/setting', 'general.description', 'Cấu hình những thông tin cài đặt website.', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1331, 0, 'vi', 'core/setting/setting', 'general.title', 'Thông tin chung', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1332, 0, 'vi', 'core/setting/setting', 'general.general_block', 'Thông tin chung', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1333, 0, 'vi', 'core/setting/setting', 'general.site_title', 'Tên trang', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1334, 0, 'vi', 'core/setting/setting', 'general.admin_email', 'Email quản trị viên', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1335, 0, 'vi', 'core/setting/setting', 'general.seo_block', 'Cấu hình SEO', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1336, 0, 'vi', 'core/setting/setting', 'general.seo_title', 'Tiêu đề SEO', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1337, 0, 'vi', 'core/setting/setting', 'general.seo_description', 'Mô tả SEO', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1338, 0, 'vi', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1339, 0, 'vi', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1340, 0, 'vi', 'core/setting/setting', 'general.placeholder.site_title', 'Tên trang (tối đa 120 kí tự)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1341, 0, 'vi', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1342, 0, 'vi', 'core/setting/setting', 'general.placeholder.google_analytics', 'Ví dụ: UA-42767940-2', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1343, 0, 'vi', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Mã xác nhận trang web dùng cho Google Webmaster Tool', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1344, 0, 'vi', 'core/setting/setting', 'general.placeholder.seo_title', 'Tiêu đề SEO (tối đa 120 kí tự)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1345, 0, 'vi', 'core/setting/setting', 'general.placeholder.seo_description', 'Mô tả SEO (tối đa 120 kí tự)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1346, 0, 'vi', 'core/setting/setting', 'general.enable_change_admin_theme', 'Cho phép thay đổi giao diện quản trị?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1347, 0, 'vi', 'core/setting/setting', 'general.enable', 'Bật', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1348, 0, 'vi', 'core/setting/setting', 'general.disable', 'Tắt', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1349, 0, 'vi', 'core/setting/setting', 'general.enable_cache', 'Bật bộ nhớ đệm?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1350, 0, 'vi', 'core/setting/setting', 'general.cache_time', 'Thời gian lưu bộ nhớ đệm', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1351, 0, 'vi', 'core/setting/setting', 'general.cache_time_site_map', 'Thời gian lưu sơ đồ trang trong bộ nhớ đệm', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1352, 0, 'vi', 'core/setting/setting', 'general.admin_logo', 'Logo trang quản trị', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1353, 0, 'vi', 'core/setting/setting', 'general.admin_title', 'Tiêu đề trang quản trị', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1354, 0, 'vi', 'core/setting/setting', 'general.admin_title_placeholder', 'Tiêu đề hiển thị trên thẻ trình duyệt', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1355, 0, 'vi', 'core/setting/setting', 'general.rich_editor', 'Bộ soạn thảo văn bản', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1356, 0, 'vi', 'core/setting/setting', 'general.cache_block', 'Bộ nhớ đệm', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1357, 0, 'vi', 'core/setting/setting', 'general.yes', 'Bật', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1358, 0, 'vi', 'core/setting/setting', 'general.no', 'Tắt', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1359, 0, 'vi', 'core/setting/setting', 'email.subject', 'Tiêu đề', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1360, 0, 'vi', 'core/setting/setting', 'email.content', 'Nội dung', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1361, 0, 'vi', 'core/setting/setting', 'email.title', 'Cấu hình email template', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1362, 0, 'vi', 'core/setting/setting', 'email.description', 'Cấu trúc file template sử dụng HTML và các biến trong hệ thống.', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1363, 0, 'vi', 'core/setting/setting', 'email.reset_to_default', 'Khôi phục về mặc định', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1364, 0, 'vi', 'core/setting/setting', 'email.back', 'Trở lại trang cài đặt', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1365, 0, 'vi', 'core/setting/setting', 'email.reset_success', 'Khôi phục mặc định thành công', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1366, 0, 'vi', 'core/setting/setting', 'email.confirm_reset', 'Xác nhận khôi phục mặc định?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1367, 0, 'vi', 'core/setting/setting', 'email.confirm_message', 'Bạn có chắc chắn muốn khôi phục về bản mặc định?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1368, 0, 'vi', 'core/setting/setting', 'email.continue', 'Tiếp tục', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1369, 0, 'vi', 'core/setting/setting', 'email.sender_name', 'Tên người gửi', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1370, 0, 'vi', 'core/setting/setting', 'email.sender_name_placeholder', 'Tên', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1371, 0, 'vi', 'core/setting/setting', 'email.sender_email', 'Email của người gửi', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1372, 0, 'vi', 'core/setting/setting', 'email.port', 'Cổng', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1373, 0, 'vi', 'core/setting/setting', 'email.port_placeholder', 'Ví dụ: 587', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1374, 0, 'vi', 'core/setting/setting', 'email.host', 'Máy chủ', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1375, 0, 'vi', 'core/setting/setting', 'email.host_placeholder', 'Ví dụ: smtp.gmail.com', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1376, 0, 'vi', 'core/setting/setting', 'email.username', 'Tên đăng nhập', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1377, 0, 'vi', 'core/setting/setting', 'email.username_placeholder', 'Tên đăng nhập vào máy chủ mail', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1378, 0, 'vi', 'core/setting/setting', 'email.password', 'Mật khẩu', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1379, 0, 'vi', 'core/setting/setting', 'email.password_placeholder', 'Mật khẩu đăng nhập vào máy chủ mail', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1380, 0, 'vi', 'core/setting/setting', 'email.encryption', 'Mã hoá', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1381, 0, 'vi', 'core/setting/setting', 'email.mail_gun_domain', 'Tên miền', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1382, 0, 'vi', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Tên miền', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1383, 0, 'vi', 'core/setting/setting', 'email.mail_gun_secret', 'Chuỗi bí mật', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1384, 0, 'vi', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Chuỗi bí mật', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1385, 0, 'vi', 'core/setting/setting', 'email.template_title', 'Mẫu giao diện email', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1386, 0, 'vi', 'core/setting/setting', 'email.template_description', 'Giao diện mặc định cho tất cả email', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1387, 0, 'vi', 'core/setting/setting', 'email.template_header', 'Mẫu cho phần trên của email', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1388, 0, 'vi', 'core/setting/setting', 'email.template_header_description', 'Phần trên của tất cả email', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1389, 0, 'vi', 'core/setting/setting', 'email.template_footer', 'Mẫu cho phần dưới của email', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1390, 0, 'vi', 'core/setting/setting', 'email.template_footer_description', 'Phần dưới của tất cả email', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1391, 0, 'vi', 'core/setting/setting', 'save_settings', 'Lưu cài đặt', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1392, 0, 'vi', 'core/setting/setting', 'template', 'Mẫu', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1393, 0, 'vi', 'core/setting/setting', 'description', 'Mô tả', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1394, 0, 'vi', 'core/setting/setting', 'enable', 'Bật', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1395, 0, 'vi', 'core/setting/setting', 'test_send_mail', 'Gửi thử nghiệm', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1396, 0, 'en', 'core/table/general', 'operations', 'Operations', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1397, 0, 'en', 'core/table/general', 'loading_data', 'Loading data from server', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1398, 0, 'en', 'core/table/general', 'display', 'Display', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1399, 0, 'en', 'core/table/general', 'all', 'All', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1400, 0, 'en', 'core/table/general', 'edit_entry', 'Edit', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1401, 0, 'en', 'core/table/general', 'delete_entry', 'Delete', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1402, 0, 'en', 'core/table/general', 'show_from', 'Showing from', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1403, 0, 'en', 'core/table/general', 'to', 'to', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1404, 0, 'en', 'core/table/general', 'in', 'in', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1405, 0, 'en', 'core/table/general', 'records', 'records', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1406, 0, 'en', 'core/table/general', 'no_data', 'No data to display', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1407, 0, 'en', 'core/table/general', 'no_record', 'No record', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1408, 0, 'en', 'core/table/general', 'loading', 'Loading data from server', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1409, 0, 'en', 'core/table/general', 'confirm_delete', 'Confirm delete', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1410, 0, 'en', 'core/table/general', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1411, 0, 'en', 'core/table/general', 'cancel', 'Cancel', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1412, 0, 'en', 'core/table/general', 'delete', 'Delete', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1413, 0, 'en', 'core/table/general', 'close', 'Close', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1414, 0, 'en', 'core/table/general', 'contains', 'Contains', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1415, 0, 'en', 'core/table/general', 'is_equal_to', 'Is equal to', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1416, 0, 'en', 'core/table/general', 'greater_than', 'Greater than', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1417, 0, 'en', 'core/table/general', 'less_than', 'Less than', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1418, 0, 'en', 'core/table/general', 'value', 'Value', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1419, 0, 'en', 'core/table/general', 'select_field', 'Select field', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1420, 0, 'en', 'core/table/general', 'reset', 'Reset', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1421, 0, 'en', 'core/table/general', 'add_additional_filter', 'Add additional filter', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1422, 0, 'en', 'core/table/general', 'apply', 'Apply', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1423, 0, 'en', 'core/table/general', 'filters', 'Filters', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1424, 0, 'en', 'core/table/general', 'bulk_change', 'Bulk changes', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1425, 0, 'en', 'core/table/general', 'select_option', 'Select option', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1426, 0, 'en', 'core/table/general', 'bulk_actions', 'Bulk Actions', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1427, 0, 'en', 'core/table/general', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1428, 0, 'en', 'core/table/general', 'please_select_record', 'Please select at least one record to perform this action!', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1429, 0, 'en', 'core/table/general', 'filtered', '(filtered from _MAX_ total records)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1430, 0, 'en', 'core/table/general', 'search', 'Search...', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1431, 0, 'en', 'core/table/table', 'operations', 'Operations', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1432, 0, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1433, 0, 'en', 'core/table/table', 'display', 'Display', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1434, 0, 'en', 'core/table/table', 'all', 'All', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1435, 0, 'en', 'core/table/table', 'edit_entry', 'Edit', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1436, 0, 'en', 'core/table/table', 'delete_entry', 'Delete', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1437, 0, 'en', 'core/table/table', 'show_from', 'Showing from', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1438, 0, 'en', 'core/table/table', 'to', 'to', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1439, 0, 'en', 'core/table/table', 'in', 'in', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1440, 0, 'en', 'core/table/table', 'records', 'records', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1441, 0, 'en', 'core/table/table', 'no_data', 'No data to display', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1442, 0, 'en', 'core/table/table', 'no_record', 'No record', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1443, 0, 'en', 'core/table/table', 'loading', 'Loading data from server', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1444, 0, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1445, 0, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1446, 0, 'en', 'core/table/table', 'cancel', 'Cancel', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1447, 0, 'en', 'core/table/table', 'delete', 'Delete', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1448, 0, 'en', 'core/table/table', 'close', 'Close', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1449, 0, 'en', 'core/table/table', 'contains', 'Contains', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1450, 0, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1451, 0, 'en', 'core/table/table', 'greater_than', 'Greater than', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1452, 0, 'en', 'core/table/table', 'less_than', 'Less than', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1453, 0, 'en', 'core/table/table', 'value', 'Value', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1454, 0, 'en', 'core/table/table', 'select_field', 'Select field', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1455, 0, 'en', 'core/table/table', 'reset', 'Reset', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1456, 0, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1457, 0, 'en', 'core/table/table', 'apply', 'Apply', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1458, 0, 'en', 'core/table/table', 'filters', 'Filters', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1459, 0, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1460, 0, 'en', 'core/table/table', 'select_option', 'Select option', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1461, 0, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1462, 0, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1463, 0, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1464, 0, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1465, 0, 'en', 'core/table/table', 'search', 'Search...', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1466, 0, 'vi', 'core/table/general', 'operations', 'Hành động', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1467, 0, 'vi', 'core/table/general', 'loading_data', 'Đang tải dữ liệu từ hệ thống', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1468, 0, 'vi', 'core/table/general', 'display', 'Hiển thị', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1469, 0, 'vi', 'core/table/general', 'all', 'Tất cả', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1470, 0, 'vi', 'core/table/general', 'edit_entry', 'Sửa', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1471, 0, 'vi', 'core/table/general', 'delete_entry', 'Xoá', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1472, 0, 'vi', 'core/table/general', 'show_from', 'Hiển thị từ', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1473, 0, 'vi', 'core/table/general', 'to', 'đến', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1474, 0, 'vi', 'core/table/general', 'in', 'trong tổng số', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1475, 0, 'vi', 'core/table/general', 'records', 'bản ghi', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1476, 0, 'vi', 'core/table/general', 'no_data', 'Không có dữ liệu để hiển thị', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1477, 0, 'vi', 'core/table/general', 'no_record', 'không có bản ghi nào', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1478, 0, 'vi', 'core/table/general', 'loading', 'Đang tải dữ liệu từ hệ thống', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1479, 0, 'vi', 'core/table/general', 'confirm_delete', 'Xác nhận xoá', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1480, 0, 'vi', 'core/table/general', 'confirm_delete_msg', 'Bạn có chắc chắn muốn xoá bản ghi này?', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1481, 0, 'vi', 'core/table/general', 'cancel', 'Huỷ bỏ', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1482, 0, 'vi', 'core/table/general', 'delete', 'Xoá', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1483, 0, 'vi', 'core/table/general', 'close', 'Đóng', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1484, 0, 'vi', 'core/table/general', 'is_equal_to', 'Bằng với', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1485, 0, 'vi', 'core/table/general', 'greater_than', 'Lớn hơn', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1486, 0, 'vi', 'core/table/general', 'less_than', 'Nhỏ hơn', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1487, 0, 'vi', 'core/table/general', 'value', 'Giá trị', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1488, 0, 'vi', 'core/table/general', 'select_field', 'Chọn trường', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1489, 0, 'vi', 'core/table/general', 'reset', 'Làm mới', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1490, 0, 'vi', 'core/table/general', 'add_additional_filter', 'Thêm bộ lọc', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1491, 0, 'vi', 'core/table/general', 'apply', 'Áp dụng', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1492, 0, 'vi', 'core/table/general', 'select_option', 'Lựa chọn', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1493, 0, 'vi', 'core/table/general', 'filters', 'Lọc dữ liệu', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1494, 0, 'vi', 'core/table/general', 'bulk_change', 'Thay đổi hàng loạt', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1495, 0, 'vi', 'core/table/general', 'bulk_actions', 'Hành động', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1496, 0, 'vi', 'core/table/general', 'contains', 'Bao gồm', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1497, 0, 'vi', 'core/table/general', 'filtered', '(đã được lọc từ _MAX_ bản ghi)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1498, 0, 'en', 'packages/menu/menu', 'name', 'Menus', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1499, 0, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1500, 0, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1501, 0, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1502, 0, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1503, 0, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1504, 0, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1505, 0, 'en', 'packages/menu/menu', 'remove', 'Remove', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1506, 0, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1507, 0, 'en', 'packages/menu/menu', 'title', 'Title', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1508, 0, 'en', 'packages/menu/menu', 'icon', 'Icon', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1509, 0, 'en', 'packages/menu/menu', 'url', 'URL', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1510, 0, 'en', 'packages/menu/menu', 'target', 'Target', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1511, 0, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1512, 0, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1513, 0, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1514, 0, 'en', 'packages/menu/menu', 'create', 'Create menu', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1515, 0, 'en', 'packages/menu/menu', 'edit', 'Edit menu', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1516, 0, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1517, 0, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1518, 0, 'vi', 'packages/menu/menu', 'name', 'Menu', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1519, 0, 'vi', 'packages/menu/menu', 'cancel', 'Hủy bỏ', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1520, 0, 'vi', 'packages/menu/menu', 'add_link', 'Thêm liên kết', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1521, 0, 'vi', 'packages/menu/menu', 'add_to_menu', 'Thêm vào trình đơn', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1522, 0, 'vi', 'packages/menu/menu', 'basic_info', 'Thông tin cơ bản', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1523, 0, 'vi', 'packages/menu/menu', 'blank_open_link', 'Mở liên kết trong tab mới', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1524, 0, 'vi', 'packages/menu/menu', 'css_class', 'CSS class', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1525, 0, 'vi', 'packages/menu/menu', 'custom_link', 'Liên kết tùy chọn', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1526, 0, 'vi', 'packages/menu/menu', 'icon', 'Biểu tượng', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1527, 0, 'vi', 'packages/menu/menu', 'key_name', 'Tên menu (key::key)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1528, 0, 'vi', 'packages/menu/menu', 'remove', 'Xóa', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1529, 0, 'vi', 'packages/menu/menu', 'self_open_link', 'Mở liên kết trong tab hiện tại', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1530, 0, 'vi', 'packages/menu/menu', 'structure', 'Cấu trúc trình đơn', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1531, 0, 'vi', 'packages/menu/menu', 'target', 'Target', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1532, 0, 'vi', 'packages/menu/menu', 'title', 'Tiêu đề', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1533, 0, 'vi', 'packages/menu/menu', 'url', 'URL', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1534, 0, 'vi', 'packages/menu/menu', 'create', 'Tạo trình đơn', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1535, 0, 'vi', 'packages/menu/menu', 'edit', 'Sửa trình đơn', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1536, 0, 'en', 'packages/page/pages', 'create', 'Create new page', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1537, 0, 'en', 'packages/page/pages', 'edit', 'Edit page', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1538, 0, 'en', 'packages/page/pages', 'form.name', 'Name', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1539, 0, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1540, 0, 'en', 'packages/page/pages', 'form.content', 'Content', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1541, 0, 'en', 'packages/page/pages', 'form.note', 'Note content', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1542, 0, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1543, 0, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1544, 0, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1545, 0, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1546, 0, 'en', 'packages/page/pages', 'pages', 'Pages', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1547, 0, 'en', 'packages/page/pages', 'menu', 'Pages', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1548, 0, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1549, 0, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1550, 0, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1551, 0, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1552, 0, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1553, 0, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1554, 0, 'vi', 'packages/page/pages', 'create', 'Thêm trang', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1555, 0, 'vi', 'packages/page/pages', 'edit', 'Sửa trang', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1556, 0, 'vi', 'packages/page/pages', 'form.name', 'Tiêu đề trang', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1557, 0, 'vi', 'packages/page/pages', 'form.note', 'Nội dung ghi chú', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1558, 0, 'vi', 'packages/page/pages', 'form.name_placeholder', 'Tên trang (tối đa 120 kí tự)', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1559, 0, 'vi', 'packages/page/pages', 'form.content', 'Nội dung', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1560, 0, 'vi', 'packages/page/pages', 'notices.no_select', 'Chọn ít nhất 1 trang để thực hiện hành động này!', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1561, 0, 'vi', 'packages/page/pages', 'notices.update_success_message', 'Cập nhật thành công', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1562, 0, 'vi', 'packages/page/pages', 'deleted', 'Xóa trang thành công', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1563, 0, 'vi', 'packages/page/pages', 'cannot_delete', 'Không thể xóa trang', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1564, 0, 'vi', 'packages/page/pages', 'menu', 'Trang', '2021-12-31 22:02:26', '2021-12-31 22:02:46'),
(1565, 0, 'vi', 'packages/page/pages', 'menu_name', 'Trang', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1566, 0, 'vi', 'packages/page/pages', 'edit_this_page', 'Sửa trang này', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1567, 0, 'vi', 'packages/page/pages', 'pages', 'Trang', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1568, 0, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1569, 0, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1570, 0, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1571, 0, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1572, 0, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1573, 0, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1574, 0, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1575, 0, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1576, 0, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1577, 0, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1578, 0, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1579, 0, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1580, 0, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1581, 0, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1582, 0, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2021-12-31 22:02:27', '2021-12-31 22:02:46');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1583, 0, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1584, 0, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1585, 0, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1586, 0, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1587, 0, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1588, 0, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1589, 0, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1590, 0, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1591, 0, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1592, 0, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin has been removed!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1593, 0, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1594, 0, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1595, 0, 'en', 'packages/plugin-management/plugin', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1596, 0, 'en', 'packages/plugin-management/plugin', 'plugin_is_not_ready', 'Plugin :name is not ready to use', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1597, 0, 'vi', 'packages/plugin-management/plugin', 'activate', 'Kích hoạt', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1598, 0, 'vi', 'packages/plugin-management/plugin', 'author', 'Tác giả', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1599, 0, 'vi', 'packages/plugin-management/plugin', 'version', 'Phiên bản', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1600, 0, 'vi', 'packages/plugin-management/plugin', 'activated', 'Đã kích hoạt', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1601, 0, 'vi', 'packages/plugin-management/plugin', 'deactivate', 'Hủy kích hoạt', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1602, 0, 'vi', 'packages/plugin-management/plugin', 'deactivated', 'Đã vô hiệu', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1603, 0, 'vi', 'packages/plugin-management/plugin', 'enabled', 'Kích hoạt', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1604, 0, 'vi', 'packages/plugin-management/plugin', 'invalid_plugin', 'Gói mở rộng không hợp lệ', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1605, 0, 'vi', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Cập nhật trạng thái gói mở rộng thành công', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1606, 0, 'vi', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Vui lòng kích hoạt các tiện ích mở rộng :plugins trước khi kích hoạt tiện ích này', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1607, 0, 'vi', 'packages/plugin-management/plugin', 'plugins', 'Tiện ích mở rộng', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1608, 0, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1609, 0, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1610, 0, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1611, 0, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1612, 0, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1613, 0, 'vi', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Tối ưu hoá bộ máy tìm kiếm (SEO)', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1614, 0, 'vi', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Chỉnh sửa SEO', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1615, 0, 'vi', 'packages/seo-helper/seo-helper', 'default_description', 'Thiết lập các thẻ mô tả giúp người dùng dễ dàng tìm thấy trên công cụ tìm kiếm như Google.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1616, 0, 'vi', 'packages/seo-helper/seo-helper', 'seo_title', 'Tiêu đề trang', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1617, 0, 'vi', 'packages/seo-helper/seo-helper', 'seo_description', 'Mô tả trang', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1618, 0, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1619, 0, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1620, 0, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1621, 0, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1622, 0, 'en', 'packages/slug/slug', 'settings.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1623, 0, 'en', 'packages/slug/slug', 'preview', 'Preview', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1624, 0, 'en', 'packages/theme/theme', 'name', 'Themes', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1625, 0, 'en', 'packages/theme/theme', 'theme', 'Theme', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1626, 0, 'en', 'packages/theme/theme', 'author', 'Author', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1627, 0, 'en', 'packages/theme/theme', 'version', 'Version', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1628, 0, 'en', 'packages/theme/theme', 'description', 'Description', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1629, 0, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1630, 0, 'en', 'packages/theme/theme', 'active', 'Active', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1631, 0, 'en', 'packages/theme/theme', 'activated', 'Activated', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1632, 0, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1633, 0, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1634, 0, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1635, 0, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1636, 0, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1637, 0, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1638, 0, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1639, 0, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1640, 0, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1641, 0, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1642, 0, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1643, 0, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1644, 0, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1645, 0, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1646, 0, 'en', 'packages/theme/theme', 'remove', 'Remove', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1647, 0, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1648, 0, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1649, 0, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1650, 0, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1651, 0, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1652, 0, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1653, 0, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1654, 0, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1655, 0, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1656, 0, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1657, 0, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1658, 0, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1659, 0, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1660, 0, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1661, 0, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1662, 0, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1663, 0, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1664, 0, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1665, 0, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1666, 0, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1667, 0, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1668, 0, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1669, 0, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1670, 0, 'en', 'packages/theme/theme', 'theme_option_favicon', 'Favicon', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1671, 0, 'en', 'packages/theme/theme', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1672, 0, 'vi', 'packages/theme/theme', 'activated', 'Đã kích hoạt', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1673, 0, 'vi', 'packages/theme/theme', 'active', 'Kích hoạt', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1674, 0, 'vi', 'packages/theme/theme', 'active_success', 'Kích hoạt giao diện thành công!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1675, 0, 'vi', 'packages/theme/theme', 'author', 'Tác giả', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1676, 0, 'vi', 'packages/theme/theme', 'description', 'Mô tả', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1677, 0, 'vi', 'packages/theme/theme', 'theme', 'Giao diện', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1678, 0, 'vi', 'packages/theme/theme', 'theme_options', 'Tuỳ chọn giao diện', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1679, 0, 'vi', 'packages/theme/theme', 'version', 'Phiên bản', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1680, 0, 'vi', 'packages/theme/theme', 'save_changes', 'Lưu thay đổi', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1681, 0, 'vi', 'packages/theme/theme', 'developer_mode', 'Đang kích hoạt chế độ thử nghiệm', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1682, 0, 'vi', 'packages/theme/theme', 'custom_css', 'Tuỳ chỉnh CSS', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1683, 0, 'en', 'packages/widget/global', 'name', 'Widgets', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1684, 0, 'en', 'packages/widget/global', 'create', 'New widget', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1685, 0, 'en', 'packages/widget/global', 'edit', 'Edit widget', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1686, 0, 'en', 'packages/widget/global', 'delete', 'Delete', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1687, 0, 'en', 'packages/widget/global', 'available', 'Available Widgets', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1688, 0, 'en', 'packages/widget/global', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1689, 0, 'en', 'packages/widget/global', 'number_tag_display', 'Number tags will be display', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1690, 0, 'en', 'packages/widget/global', 'number_post_display', 'Number posts will be display', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1691, 0, 'en', 'packages/widget/global', 'select_menu', 'Select Menu', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1692, 0, 'en', 'packages/widget/global', 'widget_text', 'Text', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1693, 0, 'en', 'packages/widget/global', 'widget_text_description', 'Arbitrary text or HTML.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1694, 0, 'en', 'packages/widget/global', 'widget_recent_post', 'Recent Posts', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1695, 0, 'en', 'packages/widget/global', 'widget_recent_post_description', 'Recent posts widget.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1696, 0, 'en', 'packages/widget/global', 'widget_custom_menu', 'Custom Menu', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1697, 0, 'en', 'packages/widget/global', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1698, 0, 'en', 'packages/widget/global', 'widget_tag', 'Tags', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1699, 0, 'en', 'packages/widget/global', 'widget_tag_description', 'Popular tags', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1700, 0, 'en', 'packages/widget/global', 'save_success', 'Save widget successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1701, 0, 'en', 'packages/widget/global', 'delete_success', 'Delete widget successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1702, 0, 'en', 'packages/widget/widget', 'name', 'Widgets', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1703, 0, 'en', 'packages/widget/widget', 'create', 'New widget', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1704, 0, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1705, 0, 'en', 'packages/widget/widget', 'delete', 'Delete', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1706, 0, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1707, 0, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1708, 0, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1709, 0, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1710, 0, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1711, 0, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1712, 0, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1713, 0, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1714, 0, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1715, 0, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1716, 0, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1717, 0, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1718, 0, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1719, 0, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1720, 0, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1721, 0, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1722, 0, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1723, 0, 'vi', 'packages/widget/global', 'name', 'Widgets', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1724, 0, 'vi', 'packages/widget/global', 'create', 'New widget', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1725, 0, 'vi', 'packages/widget/global', 'edit', 'Edit widget', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1726, 0, 'vi', 'packages/widget/global', 'available', 'Tiện ích có sẵn', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1727, 0, 'vi', 'packages/widget/global', 'delete', 'Xóa', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1728, 0, 'vi', 'packages/widget/global', 'instruction', 'Để kích hoạt tiện ích, hãy kéo nó vào sidebar hoặc nhấn vào nó. Để hủy kích hoạt tiện ích và xóa các thiết lập của tiện ích, kéo nó quay trở lại.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1729, 0, 'vi', 'packages/widget/global', 'number_post_display', 'Số bài viết sẽ hiển thị', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1730, 0, 'vi', 'packages/widget/global', 'number_tag_display', 'Số thẻ sẽ hiển thị', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1731, 0, 'vi', 'packages/widget/global', 'select_menu', 'Lựa chọn trình đơn', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1732, 0, 'vi', 'packages/widget/global', 'widget_custom_menu', 'Menu tùy chỉnh', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1733, 0, 'vi', 'packages/widget/global', 'widget_custom_menu_description', 'Thêm menu tùy chỉnh vào khu vực tiện ích của bạn', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1734, 0, 'vi', 'packages/widget/global', 'widget_recent_post', 'Bài viết gần đây', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1735, 0, 'vi', 'packages/widget/global', 'widget_recent_post_description', 'Tiện ích bài viết gần đây', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1736, 0, 'vi', 'packages/widget/global', 'widget_tag', 'Thẻ', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1737, 0, 'vi', 'packages/widget/global', 'widget_tag_description', 'Thẻ phổ biến, sử dụng nhiều', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1738, 0, 'vi', 'packages/widget/global', 'widget_text', 'Văn bản', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1739, 0, 'vi', 'packages/widget/global', 'widget_text_description', 'Văn bản tùy ý hoặc HTML.', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1740, 0, 'vi', 'packages/widget/global', 'delete_success', 'Xoá tiện ích thành công', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1741, 0, 'vi', 'packages/widget/global', 'save_success', 'Lưu tiện ích thành công!', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1742, 0, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1743, 0, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1744, 0, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1745, 0, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1746, 0, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1747, 0, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1748, 0, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1749, 0, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1750, 0, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1751, 0, 'en', 'plugins/analytics/analytics', 'views', 'views', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1752, 0, 'en', 'plugins/analytics/analytics', 'view_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1753, 0, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1754, 0, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1755, 0, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a google analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/master/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/master/plugin-analytics</a>', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1756, 0, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1757, 0, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1758, 0, 'en', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking ID', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1759, 0, 'en', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1760, 0, 'en', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1761, 0, 'en', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1762, 0, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1763, 0, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1764, 0, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1765, 0, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1766, 0, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1767, 0, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1768, 0, 'vi', 'plugins/analytics/analytics', 'avg_duration', 'Trung bình', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1769, 0, 'vi', 'plugins/analytics/analytics', 'bounce_rate', 'Tỉ lệ thoát', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1770, 0, 'vi', 'plugins/analytics/analytics', 'page_session', 'Trang/Phiên', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1771, 0, 'vi', 'plugins/analytics/analytics', 'pageviews', 'Lượt xem', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1772, 0, 'vi', 'plugins/analytics/analytics', 'sessions', 'Phiên', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1773, 0, 'vi', 'plugins/analytics/analytics', 'views', 'lượt xem', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1774, 0, 'vi', 'plugins/analytics/analytics', 'visitors', 'Người truy cập', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1775, 0, 'vi', 'plugins/analytics/analytics', 'visits', 'lượt ghé thăm', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1776, 0, 'vi', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Thông tin cài đặt không hợp lệ. Tài liệu hướng dẫn tại đây: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1777, 0, 'vi', 'plugins/analytics/analytics', 'new_users', 'Lượt khách mới', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1778, 0, 'vi', 'plugins/analytics/analytics', 'percent_new_session', 'Tỉ lệ khách mới', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1779, 0, 'vi', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Ngày bắt đầu :start_date không thể sau ngày kết thúc :end_date', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1780, 0, 'vi', 'plugins/analytics/analytics', 'view_id_not_specified', 'Bạn phải cung cấp View ID hợp lê. Tài liệu hướng dẫn tại đây: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1781, 0, 'vi', 'plugins/analytics/analytics', 'wrong_configuration', 'Để xem dữ liệu thống kê Google Analytics, bạn cần lấy thông tin Client ID và thêm nó vào trong phần cài đặt. Bạn cũng cần thông tin xác thực dạng JSON. Tài liệu hướng dẫn tại đây: <a href=\"http://docs.botble.com/cms/:version/analytics\" target=\"_blank\">http://docs.botble.com/cms/:version/analytics</a>', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1782, 0, 'vi', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1783, 0, 'vi', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1784, 0, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking Code', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1785, 0, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1786, 0, 'vi', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1787, 0, 'vi', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1788, 0, 'vi', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1789, 0, 'vi', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1790, 0, 'vi', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Trình duyệt truy cập nhiều', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1791, 0, 'vi', 'plugins/analytics/analytics', 'widget_analytics_general', 'Thống kê truy cập', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1792, 0, 'vi', 'plugins/analytics/analytics', 'widget_analytics_page', 'Trang được xem nhiều nhất', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1793, 0, 'vi', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Trang giới thiệu nhiều', '2021-12-31 22:02:27', '2021-12-31 22:02:46'),
(1794, 0, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1795, 0, 'en', 'plugins/audit-log/history', 'created', 'created', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1796, 0, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1797, 0, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1798, 0, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1799, 0, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1800, 0, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1801, 0, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1802, 0, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1803, 0, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1804, 0, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1805, 0, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1806, 0, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1807, 0, 'en', 'plugins/audit-log/history', 'post', 'post', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1808, 0, 'en', 'plugins/audit-log/history', 'page', 'page', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1809, 0, 'en', 'plugins/audit-log/history', 'category', 'category', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1810, 0, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1811, 0, 'en', 'plugins/audit-log/history', 'user', 'user', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1812, 0, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1813, 0, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1814, 0, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1815, 0, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1816, 0, 'en', 'plugins/audit-log/history', 'action', 'Action', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1817, 0, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1818, 0, 'en', 'plugins/audit-log/history', 'system', 'System', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1819, 0, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1820, 0, 'vi', 'plugins/audit-log/history', 'name', 'Lịch sử hoạt động', '2021-12-31 22:02:27', '2021-12-31 22:02:47'),
(1821, 0, 'vi', 'plugins/audit-log/history', 'created', ' đã tạo', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1822, 0, 'vi', 'plugins/audit-log/history', 'updated', ' đã cập nhật', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1823, 0, 'vi', 'plugins/audit-log/history', 'deleted', ' đã xóa', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1824, 0, 'vi', 'plugins/audit-log/history', 'attached', 'đính kèm', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1825, 0, 'vi', 'plugins/audit-log/history', 'backup', 'sao lưu', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1826, 0, 'vi', 'plugins/audit-log/history', 'category', 'danh mục', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1827, 0, 'vi', 'plugins/audit-log/history', 'changed password', 'thay đổi mật khẩu', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1828, 0, 'vi', 'plugins/audit-log/history', 'contact', 'liên hệ', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1829, 0, 'vi', 'plugins/audit-log/history', 'custom-field', 'khung mở rộng', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1830, 0, 'vi', 'plugins/audit-log/history', 'logged in', 'đăng nhập', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1831, 0, 'vi', 'plugins/audit-log/history', 'logged out', 'đăng xuất', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1832, 0, 'vi', 'plugins/audit-log/history', 'menu', 'trình đơn', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1833, 0, 'vi', 'plugins/audit-log/history', 'of the system', 'khỏi hệ thống', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1834, 0, 'vi', 'plugins/audit-log/history', 'page', 'trang', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1835, 0, 'vi', 'plugins/audit-log/history', 'post', 'bài viết', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1836, 0, 'vi', 'plugins/audit-log/history', 'shared', 'đã chia sẻ', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1837, 0, 'vi', 'plugins/audit-log/history', 'tag', 'thẻ', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1838, 0, 'vi', 'plugins/audit-log/history', 'to the system', 'vào hệ thống', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1839, 0, 'vi', 'plugins/audit-log/history', 'updated profile', 'cập nhật tài khoản', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1840, 0, 'vi', 'plugins/audit-log/history', 'user', 'thành viên', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1841, 0, 'vi', 'plugins/audit-log/history', 'widget_audit_logs', 'Lịch sử hoạt động', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1842, 0, 'en', 'plugins/backup/backup', 'name', 'Backup', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1843, 0, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1844, 0, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1845, 0, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1846, 0, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1847, 0, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1848, 0, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1849, 0, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1850, 0, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1851, 0, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1852, 0, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1853, 0, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1854, 0, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1855, 0, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1856, 0, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1857, 0, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1858, 0, 'en', 'plugins/backup/backup', 'size', 'Size', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1859, 0, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1860, 0, 'en', 'plugins/backup/backup', 'proc_open_disabled_error', 'Function <strong>proc_open()</strong> has been disabled so the system cannot backup the database. Please contact your hosting provider to enable it.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1861, 0, 'en', 'plugins/backup/backup', 'database_backup_not_existed', 'Backup database is not existed!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1862, 0, 'en', 'plugins/backup/backup', 'uploads_folder_backup_not_existed', 'Backup uploads folder is not existed!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1863, 0, 'en', 'plugins/backup/backup', 'important_message1', 'This is a simple backup feature, it is a solution for you if your site has < 1GB data and can be used for quickly backup your site.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1864, 0, 'en', 'plugins/backup/backup', 'important_message2', 'If you have more than 1GB images/files in local storage, you should use backup feature of your hosting or VPS.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1865, 0, 'en', 'plugins/backup/backup', 'important_message3', 'To backup your database, function <strong>proc_open()</strong> or <strong>system()</strong> must be enabled. Contact your hosting provider to enable it if it is disabled.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1866, 0, 'en', 'plugins/backup/backup', 'important_message4', 'It is not a full backup, it is just back up uploaded files and your database.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1867, 0, 'vi', 'plugins/backup/backup', 'backup_description', 'Sao lưu cơ sở dữ liệu và thư mục /uploads', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1868, 0, 'vi', 'plugins/backup/backup', 'create', 'Tạo bản sao lưu', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1869, 0, 'vi', 'plugins/backup/backup', 'create_backup_success', 'Tạo bản sao lưu thành công!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1870, 0, 'vi', 'plugins/backup/backup', 'create_btn', 'Tạo', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1871, 0, 'vi', 'plugins/backup/backup', 'delete_backup_success', 'Xóa bản sao lưu thành công!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1872, 0, 'vi', 'plugins/backup/backup', 'generate_btn', 'Tạo sao lưu', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1873, 0, 'vi', 'plugins/backup/backup', 'name', 'Sao lưu', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1874, 0, 'vi', 'plugins/backup/backup', 'restore', 'Khôi phục bản sao lưu', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1875, 0, 'vi', 'plugins/backup/backup', 'restore_backup_success', 'Khôi phục bản sao lưu thành công', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1876, 0, 'vi', 'plugins/backup/backup', 'restore_btn', 'Khôi phục', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1877, 0, 'vi', 'plugins/backup/backup', 'restore_confirm_msg', 'Bạn có chắc chắn muốn khôi phục hệ thống về thời điểm tạo bản sao lưu này?', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1878, 0, 'vi', 'plugins/backup/backup', 'restore_tooltip', 'Khôi phục bản sao lưu này', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1879, 0, 'vi', 'plugins/backup/backup', 'download_database', 'Tải về bản sao lưu CSDL', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1880, 0, 'vi', 'plugins/backup/backup', 'download_uploads_folder', 'Tải về bản sao lưu thư mục uploads', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1881, 0, 'vi', 'plugins/backup/backup', 'menu_name', 'Sao lưu', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1882, 0, 'vi', 'plugins/backup/backup', 'demo_alert', 'Chào khách, nếu bạn thấy trang demo bị phá hoại, hãy tới <a href=\":link\">trang sao lưu</a> và khôi phục bản sao lưu cuối cùng. Cảm ơn bạn nhiều!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1883, 0, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1884, 0, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1885, 0, 'en', 'plugins/blog/base', 'select', '-- Select --', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1886, 0, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1887, 0, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1888, 0, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1889, 0, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1890, 0, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1891, 0, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1892, 0, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1893, 0, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1894, 0, 'en', 'plugins/blog/categories', 'edit', 'Edit category', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1895, 0, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1896, 0, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1897, 0, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1898, 0, 'en', 'plugins/blog/categories', 'none', 'None', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1899, 0, 'en', 'plugins/blog/categories', 'total_posts', 'Total posts: :total', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1900, 0, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1901, 0, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1902, 0, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1903, 0, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1904, 0, 'en', 'plugins/blog/member', 'posts', 'Posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1905, 0, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1906, 0, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1907, 0, 'en', 'plugins/blog/posts', 'edit', 'Edit post', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1908, 0, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1909, 0, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1910, 0, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1911, 0, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1912, 0, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1913, 0, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1914, 0, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1915, 0, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1916, 0, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1917, 0, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1918, 0, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1919, 0, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1920, 0, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1921, 0, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1922, 0, 'en', 'plugins/blog/posts', 'post', 'Post', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1923, 0, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1924, 0, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1925, 0, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1926, 0, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1927, 0, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1928, 0, 'en', 'plugins/blog/posts', 'category', 'Category', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1929, 0, 'en', 'plugins/blog/posts', 'author', 'Author', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1930, 0, 'en', 'plugins/blog/settings', 'select', '-- Select --', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1931, 0, 'en', 'plugins/blog/settings', 'blog_page_id', 'Blog page', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1932, 0, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1933, 0, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1934, 0, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1935, 0, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1936, 0, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1937, 0, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1938, 0, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1939, 0, 'en', 'plugins/blog/tags', 'edit', 'Edit tag', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1940, 0, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1941, 0, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1942, 0, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1943, 0, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1944, 0, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1945, 0, 'vi', 'plugins/blog/base', 'menu_name', 'Blog', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1946, 0, 'vi', 'plugins/blog/categories', 'create', 'Thêm danh mục mới', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1947, 0, 'vi', 'plugins/blog/categories', 'edit', 'Sửa danh mục', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1948, 0, 'vi', 'plugins/blog/categories', 'menu_name', 'Danh mục', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1949, 0, 'vi', 'plugins/blog/categories', 'edit_this_category', 'Sửa danh mục này', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1950, 0, 'vi', 'plugins/blog/categories', 'menu', 'Danh mục', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1951, 0, 'vi', 'plugins/blog/posts', 'create', 'Thêm bài viết', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1952, 0, 'vi', 'plugins/blog/posts', 'edit', 'Sửa bài viết', '2021-12-31 22:02:28', '2021-12-31 22:02:47');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1953, 0, 'vi', 'plugins/blog/posts', 'form.name', 'Tên', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1954, 0, 'vi', 'plugins/blog/posts', 'form.name_placeholder', 'Tên bài viết (Tối đa 120 kí tự)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1955, 0, 'vi', 'plugins/blog/posts', 'form.description', 'Mô tả', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1956, 0, 'vi', 'plugins/blog/posts', 'form.description_placeholder', 'Mô tả ngắn cho bài viết (Tối đa 400 kí tự)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1957, 0, 'vi', 'plugins/blog/posts', 'form.categories', 'Chuyên mục', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1958, 0, 'vi', 'plugins/blog/posts', 'form.tags', 'Từ khóa', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1959, 0, 'vi', 'plugins/blog/posts', 'form.tags_placeholder', 'Thêm từ khóa', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1960, 0, 'vi', 'plugins/blog/posts', 'form.content', 'Nội dung', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1961, 0, 'vi', 'plugins/blog/posts', 'form.note', 'Nội dung ghi chú', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1962, 0, 'vi', 'plugins/blog/posts', 'form.format_type', 'Định dạng', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1963, 0, 'vi', 'plugins/blog/posts', 'post_deleted', 'Xóa bài viết thành công', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1964, 0, 'vi', 'plugins/blog/posts', 'cannot_delete', 'Không thể xóa bài viết', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1965, 0, 'vi', 'plugins/blog/posts', 'menu_name', 'Bài viết', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1966, 0, 'vi', 'plugins/blog/posts', 'edit_this_post', 'Sửa bài viết này', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1967, 0, 'vi', 'plugins/blog/posts', 'no_new_post_now', 'Hiện tại không có bài viết mới!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1968, 0, 'vi', 'plugins/blog/posts', 'posts', 'Bài viết', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1969, 0, 'vi', 'plugins/blog/posts', 'widget_posts_recent', 'Bài viết gần đây', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1970, 0, 'vi', 'plugins/blog/posts', 'author', 'Tác giả', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1971, 0, 'vi', 'plugins/blog/tags', 'create', 'Thêm thẻ mới', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1972, 0, 'vi', 'plugins/blog/tags', 'edit', 'Sửa thẻ', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1973, 0, 'vi', 'plugins/blog/tags', 'form.name', 'Tên', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1974, 0, 'vi', 'plugins/blog/tags', 'form.name_placeholder', 'Tên thẻ (Tối đa 120 kí tự)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1975, 0, 'vi', 'plugins/blog/tags', 'form.description', 'Mô tả', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1976, 0, 'vi', 'plugins/blog/tags', 'form.description_placeholder', 'Mô tả ngắn cho tag (Tối đa 400 kí tự)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1977, 0, 'vi', 'plugins/blog/tags', 'form.categories', 'Chuyên mục', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1978, 0, 'vi', 'plugins/blog/tags', 'notices.no_select', 'Chọn ít nhất 1 bài viết để thực hiện hành động này!', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1979, 0, 'vi', 'plugins/blog/tags', 'cannot_delete', 'Không thể xóa thẻ', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1980, 0, 'vi', 'plugins/blog/tags', 'deleted', 'Xóa thẻ thành công', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1981, 0, 'vi', 'plugins/blog/tags', 'menu_name', 'Thẻ', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1982, 0, 'vi', 'plugins/blog/tags', 'edit_this_tag', 'Sửa thẻ này', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1983, 0, 'vi', 'plugins/blog/tags', 'menu', 'Thẻ', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1984, 0, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1985, 0, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1986, 0, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1987, 0, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1988, 0, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1989, 0, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1990, 0, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1991, 0, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1992, 0, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1993, 0, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1994, 0, 'en', 'plugins/captcha/captcha', 'failed_validate', 'Failed to validate the captcha.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1995, 0, 'en', 'plugins/career/career', 'name', 'Careers', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1996, 0, 'en', 'plugins/career/career', 'create', 'New career', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1997, 0, 'en', 'plugins/career/career', 'edit', 'Edit career', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1998, 0, 'en', 'plugins/career/career', 'location', 'Location', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(1999, 0, 'en', 'plugins/career/career', 'salary', 'Salary', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2000, 0, 'vi', 'plugins/career/career', 'name', 'Tuyển dụng', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2001, 0, 'vi', 'plugins/career/career', 'create', 'Thêm tin tuyển dụng', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2002, 0, 'vi', 'plugins/career/career', 'edit', 'Sửa tin tuyển dụng', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2003, 0, 'vi', 'plugins/career/career', 'location', 'Địa điểm', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2004, 0, 'vi', 'plugins/career/career', 'salary', 'Mức lương', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2005, 0, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2006, 0, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2007, 0, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2008, 0, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2009, 0, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2010, 0, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2011, 0, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2012, 0, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2013, 0, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2014, 0, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2015, 0, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2016, 0, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2017, 0, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2018, 0, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2019, 0, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2020, 0, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2021, 0, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2022, 0, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2023, 0, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2024, 0, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2025, 0, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2026, 0, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2027, 0, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2028, 0, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2029, 0, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2030, 0, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2031, 0, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2032, 0, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2033, 0, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2034, 0, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2035, 0, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2036, 0, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2021-12-31 22:02:28', '2021-12-31 22:02:47'),
(2037, 0, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2038, 0, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2039, 0, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2040, 0, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2041, 0, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2042, 0, 'en', 'plugins/contact/contact', 'address', 'Address', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2043, 0, 'en', 'plugins/contact/contact', 'message', 'Message', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2044, 0, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2045, 0, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2046, 0, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2047, 0, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2048, 0, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2049, 0, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2050, 0, 'en', 'plugins/contact/contact', 'send', 'Send', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2051, 0, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2052, 0, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2053, 0, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2054, 0, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2055, 0, 'vi', 'plugins/contact/contact', 'menu', 'Liên hệ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2056, 0, 'vi', 'plugins/contact/contact', 'edit', 'Xem liên hệ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2057, 0, 'vi', 'plugins/contact/contact', 'tables.phone', 'Điện thoại', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2058, 0, 'vi', 'plugins/contact/contact', 'tables.email', 'Email', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2059, 0, 'vi', 'plugins/contact/contact', 'tables.full_name', 'Họ tên', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2060, 0, 'vi', 'plugins/contact/contact', 'tables.time', 'Thời gian', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2061, 0, 'vi', 'plugins/contact/contact', 'tables.address', 'Địa địa chỉ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2062, 0, 'vi', 'plugins/contact/contact', 'tables.subject', 'Tiêu đề', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2063, 0, 'vi', 'plugins/contact/contact', 'tables.content', 'Nội dung', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2064, 0, 'vi', 'plugins/contact/contact', 'contact_information', 'Thông tin liên hệ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2065, 0, 'vi', 'plugins/contact/contact', 'email.title', 'Thông tin liên hệ mới', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2066, 0, 'vi', 'plugins/contact/contact', 'email.header', 'Email', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2067, 0, 'vi', 'plugins/contact/contact', 'form.name.required', 'Tên là bắt buộc', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2068, 0, 'vi', 'plugins/contact/contact', 'form.email.required', 'Email là bắt buộc', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2069, 0, 'vi', 'plugins/contact/contact', 'form.email.email', 'Địa chỉ email không hợp lệ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2070, 0, 'vi', 'plugins/contact/contact', 'form.content.required', 'Nội dung là bắt buộc', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2071, 0, 'vi', 'plugins/contact/contact', 'contact_sent_from', 'Liên hệ này được gửi từ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2072, 0, 'vi', 'plugins/contact/contact', 'form_address', 'Địa chỉ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2073, 0, 'vi', 'plugins/contact/contact', 'form_email', 'Thư điện tử', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2074, 0, 'vi', 'plugins/contact/contact', 'form_message', 'Thông điệp', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2075, 0, 'vi', 'plugins/contact/contact', 'form_name', 'Họ tên', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2076, 0, 'vi', 'plugins/contact/contact', 'form_phone', 'Số điện thoại', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2077, 0, 'vi', 'plugins/contact/contact', 'message_content', 'Nội dung thông điệp', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2078, 0, 'vi', 'plugins/contact/contact', 'required_field', 'Những trường có dấu (<span style=\"color: red\">*</span>) là bắt buộc.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2079, 0, 'vi', 'plugins/contact/contact', 'send_btn', 'Gửi tin nhắn', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2080, 0, 'vi', 'plugins/contact/contact', 'sender', 'Người gửi', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2081, 0, 'vi', 'plugins/contact/contact', 'sender_address', 'Địa chỉ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2082, 0, 'vi', 'plugins/contact/contact', 'sender_email', 'Thư điện tử', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2083, 0, 'vi', 'plugins/contact/contact', 'sender_phone', 'Số điện thoại', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2084, 0, 'vi', 'plugins/contact/contact', 'sent_from', 'Thư được gửi từ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2085, 0, 'vi', 'plugins/contact/contact', 'address', 'Địa chỉ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2086, 0, 'vi', 'plugins/contact/contact', 'message', 'Liên hệ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2087, 0, 'vi', 'plugins/contact/contact', 'new_msg_notice', 'Bạn có <span class=\"bold\">:count</span> tin nhắn mới', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2088, 0, 'vi', 'plugins/contact/contact', 'phone', 'Điện thoại', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2089, 0, 'vi', 'plugins/contact/contact', 'statuses.read', 'Đã đọc', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2090, 0, 'vi', 'plugins/contact/contact', 'statuses.unread', 'Chưa đọc', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2091, 0, 'vi', 'plugins/contact/contact', 'view_all', 'Xem tất cả', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2092, 0, 'vi', 'plugins/contact/contact', 'settings.email.title', 'Liên hệ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2093, 0, 'vi', 'plugins/contact/contact', 'settings.email.description', 'Cấu hình thông tin cho mục liên hệ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2094, 0, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Thông báo tới admin', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2095, 0, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Mẫu nội dung email gửi tới admin khi có liên hệ mới', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2096, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2097, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2098, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2099, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2100, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2101, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2102, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2103, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2104, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2105, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2106, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.style', 'Style', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2107, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.full_width', 'Full width', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2108, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.minimal', 'Minimal', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2109, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2110, 0, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2111, 0, 'en', 'plugins/language/language', 'name', 'Languages', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2112, 0, 'en', 'plugins/language/language', 'choose_language', 'Choose a language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2113, 0, 'en', 'plugins/language/language', 'select_language', 'Select language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2114, 0, 'en', 'plugins/language/language', 'choose_language_helper', 'You can choose a language in the list or directly edit it below.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2115, 0, 'en', 'plugins/language/language', 'language_name', 'Language name', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2116, 0, 'en', 'plugins/language/language', 'language_name_helper', 'The name is how it is displayed on your site (for example: English).', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2117, 0, 'en', 'plugins/language/language', 'locale', 'Locale', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2118, 0, 'en', 'plugins/language/language', 'locale_helper', 'Laravel Locale for the language (for example: <code>en</code>).', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2119, 0, 'en', 'plugins/language/language', 'language_code', 'Language code', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2120, 0, 'en', 'plugins/language/language', 'language_code_helper', 'Language code - preferably 2-letters ISO 639-1 (for example: en)', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2121, 0, 'en', 'plugins/language/language', 'text_direction', 'Text direction', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2122, 0, 'en', 'plugins/language/language', 'text_direction_helper', 'Choose the text direction for the language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2123, 0, 'en', 'plugins/language/language', 'left_to_right', 'Left to right', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2124, 0, 'en', 'plugins/language/language', 'right_to_left', 'Right to left', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2125, 0, 'en', 'plugins/language/language', 'flag', 'Flag', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2126, 0, 'en', 'plugins/language/language', 'flag_helper', 'Choose a flag for the language.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2127, 0, 'en', 'plugins/language/language', 'order', 'Order', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2128, 0, 'en', 'plugins/language/language', 'order_helper', 'Position of the language in the language switcher', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2129, 0, 'en', 'plugins/language/language', 'add_new_language', 'Add new language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2130, 0, 'en', 'plugins/language/language', 'code', 'Code', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2131, 0, 'en', 'plugins/language/language', 'default_language', 'Is default?', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2132, 0, 'en', 'plugins/language/language', 'actions', 'Actions', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2133, 0, 'en', 'plugins/language/language', 'translations', 'Translations', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2134, 0, 'en', 'plugins/language/language', 'edit', 'Edit', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2135, 0, 'en', 'plugins/language/language', 'edit_tooltip', 'Edit this language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2136, 0, 'en', 'plugins/language/language', 'delete', 'Delete', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2137, 0, 'en', 'plugins/language/language', 'delete_tooltip', 'Delete this language and all its associated data', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2138, 0, 'en', 'plugins/language/language', 'choose_default_language', 'Choose :language as default language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2139, 0, 'en', 'plugins/language/language', 'current_language', 'Current record\'s language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2140, 0, 'en', 'plugins/language/language', 'edit_related', 'Edit related language for this record', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2141, 0, 'en', 'plugins/language/language', 'add_language_for_item', 'Add other language version for this record', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2142, 0, 'en', 'plugins/language/language', 'settings', 'Settings', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2143, 0, 'en', 'plugins/language/language', 'language_hide_default', 'Hide default language from URL?', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2144, 0, 'en', 'plugins/language/language', 'language_display_flag_only', 'Flag only', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2145, 0, 'en', 'plugins/language/language', 'language_display_name_only', 'Name only', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2146, 0, 'en', 'plugins/language/language', 'language_display_all', 'Display all flag and name', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2147, 0, 'en', 'plugins/language/language', 'language_display', 'Language display', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2148, 0, 'en', 'plugins/language/language', 'switcher_display', 'Switcher language display', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2149, 0, 'en', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2150, 0, 'en', 'plugins/language/language', 'language_switcher_display_list', 'List', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2151, 0, 'en', 'plugins/language/language', 'current_language_edit_notification', 'You are editing \"<strong class=\"current_language_text\">:language</strong>\" version', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2152, 0, 'en', 'plugins/language/language', 'confirm-change-language', 'Confirm change language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2153, 0, 'en', 'plugins/language/language', 'confirm-change-language-message', 'Do you really want to change language to \"<strong class=\"change_to_language_text\"></strong>\" ? This action will be override \"<strong class=\"change_to_language_text\"></strong>\" version if it\'s existed!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2154, 0, 'en', 'plugins/language/language', 'confirm-change-language-btn', 'Confirm change', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2155, 0, 'en', 'plugins/language/language', 'hide_languages', 'Hide languages', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2156, 0, 'en', 'plugins/language/language', 'hide_languages_description', 'You can completely hide content in specific languages from visitors and search engines, but still view it yourself. This allows reviewing translations that are in progress.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2157, 0, 'en', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} All languages are currently displayed.|{1} :language is currently hidden to visitors.|[2, Inf] :language are currently hidden to visitors.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2158, 0, 'en', 'plugins/language/language', 'show_all', 'Show all', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2159, 0, 'en', 'plugins/language/language', 'change_language', 'Language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2160, 0, 'en', 'plugins/language/language', 'language_show_default_item_if_current_version_not_existed', 'Show item in default language if it is not existed in current language', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2161, 0, 'en', 'plugins/language/language', 'select_flag', 'Select a flag...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2162, 0, 'en', 'plugins/language/language', 'delete_confirmation_message', 'Do you really want to delete this language? It also deletes all items in this language and cannot rollback!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2163, 0, 'en', 'plugins/language/language', 'added_already', 'This language was added already!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2164, 0, 'en', 'plugins/language/language', 'language_auto_detect_user_language', 'Auto detect user language?', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2165, 0, 'vi', 'plugins/language/language', 'name', 'Ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2166, 0, 'vi', 'plugins/language/language', 'choose_language', 'Chọn một ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2167, 0, 'vi', 'plugins/language/language', 'select_language', 'Chọn ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2168, 0, 'vi', 'plugins/language/language', 'choose_language_helper', 'Bạn có thể chọn 1 ngôn ngữ trong danh sách hoặc nhập trực tiếp nội dung xuống các mục dưới', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2169, 0, 'vi', 'plugins/language/language', 'locale', 'Locale', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2170, 0, 'vi', 'plugins/language/language', 'locale_helper', 'Laravel Locale cho ngôn ngữ này (ví dụ: <code>en</code>). Bạn sẽ cần tạo trong <code>/resources/lang/en</code> nếu nó không có sẵn cho ngôn ngữ này.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2171, 0, 'vi', 'plugins/language/language', 'language_code', 'Mã ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2172, 0, 'vi', 'plugins/language/language', 'language_code_helper', 'Mã ngôn ngữ - ưu tiên dạng 2-kí tự theo chuẩn ISO 639-1 (ví dụ: en)', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2173, 0, 'vi', 'plugins/language/language', 'text_direction', 'Hướng viết chữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2174, 0, 'vi', 'plugins/language/language', 'text_direction_helper', 'Chọn hướng viết chữ cho ngôn ngữ này', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2175, 0, 'vi', 'plugins/language/language', 'left_to_right', 'Trái qua phải', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2176, 0, 'vi', 'plugins/language/language', 'right_to_left', 'Phải qua trái', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2177, 0, 'vi', 'plugins/language/language', 'flag', 'Cờ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2178, 0, 'vi', 'plugins/language/language', 'flag_helper', 'Chọn 1 cờ cho ngôn ngữ này', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2179, 0, 'vi', 'plugins/language/language', 'order', 'Sắp xếp', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2180, 0, 'vi', 'plugins/language/language', 'order_helper', 'Vị trí của ngôn ngữ hiển thị trong mục chuyển đổi ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2181, 0, 'vi', 'plugins/language/language', 'add_new_language', 'Thêm ngôn ngữ mới', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2182, 0, 'vi', 'plugins/language/language', 'code', 'Mã', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2183, 0, 'vi', 'plugins/language/language', 'default_language', 'Ngôn ngữ mặc định', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2184, 0, 'vi', 'plugins/language/language', 'actions', 'Hành động', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2185, 0, 'vi', 'plugins/language/language', 'translations', 'Dịch', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2186, 0, 'vi', 'plugins/language/language', 'edit', 'Sửa', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2187, 0, 'vi', 'plugins/language/language', 'edit_tooltip', 'Sửa ngôn ngữ này', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2188, 0, 'vi', 'plugins/language/language', 'delete', 'Xóa', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2189, 0, 'vi', 'plugins/language/language', 'delete_tooltip', 'Xóa ngôn ngữ này và các dữ liệu liên quan', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2190, 0, 'vi', 'plugins/language/language', 'choose_default_language', 'Chọn :language làm ngôn ngữ mặc định', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2191, 0, 'vi', 'plugins/language/language', 'add_language_for_item', 'Thêm ngôn ngữ khác cho bản ghi này', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2192, 0, 'vi', 'plugins/language/language', 'current_language', 'Ngôn ngữ hiện tại của bản ghi', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2193, 0, 'vi', 'plugins/language/language', 'edit_related', 'Sửa bản ngôn ngữ khác của bản ghi này', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2194, 0, 'vi', 'plugins/language/language', 'confirm-change-language', 'Xác nhận thay đổi ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2195, 0, 'vi', 'plugins/language/language', 'confirm-change-language-btn', 'Xác nhận thay đổi', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2196, 0, 'vi', 'plugins/language/language', 'confirm-change-language-message', 'Bạn có chắc chắn muốn thay đổi ngôn ngữ sang tiếng \"<strong class=\"change_to_language_text\"></strong>\" ? Điều này sẽ ghi đè bản ghi tiếng \"<strong class=\"change_to_language_text\"></strong>\" nếu nó đã tồn tại!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2197, 0, 'vi', 'plugins/language/language', 'current_language_edit_notification', 'Bạn đang chỉnh sửa phiên bản tiếng \"<strong class=\"current_language_text\">:language</strong>\"', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2198, 0, 'vi', 'plugins/language/language', 'hide_languages', 'Ẩn ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2199, 0, 'vi', 'plugins/language/language', 'hide_languages_description', 'Bạn có thể hoàn toàn ẩn ngôn ngữ cụ thể đối với người truy cập và công cụ tìm kiếm, nhưng sẽ vẫn hiển thị trong trang quản trị. Điều này cho phép bạn biết những ngôn ngữ nào đang được xử lý.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2200, 0, 'vi', 'plugins/language/language', 'hide_languages_helper_display_hidden', '{0} Tất cả ngôn ngữ đang được hiển thị.|{1} :language đang bị ẩn đối với người truy cập.|[2, Inf]  :language đang bị ẩn đối với người truy cập.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2201, 0, 'vi', 'plugins/language/language', 'language_display', 'Hiển thị ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2202, 0, 'vi', 'plugins/language/language', 'language_display_all', 'Hiển thị cả cờ và tên ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2203, 0, 'vi', 'plugins/language/language', 'language_display_flag_only', 'Chỉ hiển thị cờ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2204, 0, 'vi', 'plugins/language/language', 'language_display_name_only', 'Chỉ hiển thị tên', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2205, 0, 'vi', 'plugins/language/language', 'language_hide_default', 'Ẩn ngôn ngữ mặc định trên URL', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2206, 0, 'vi', 'plugins/language/language', 'language_switcher_display_dropdown', 'Dropdown', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2207, 0, 'vi', 'plugins/language/language', 'language_switcher_display_list', 'Danh sách', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2208, 0, 'vi', 'plugins/language/language', 'settings', 'Cài đặt', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2209, 0, 'vi', 'plugins/language/language', 'switcher_display', 'Hiển thị bộ chuyển đổi ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2210, 0, 'vi', 'plugins/language/language', 'change_language', 'Ngôn ngữ', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2211, 0, 'vi', 'plugins/language/language', 'show_all', 'Hiển thị tất cả', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2212, 0, 'en', 'plugins/location/bulk-import', 'name', 'Bulk Import', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2213, 0, 'en', 'plugins/location/bulk-import', 'loading_text', 'Importing', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2214, 0, 'en', 'plugins/location/bulk-import', 'imported_successfully', 'Imported successfully.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2215, 0, 'en', 'plugins/location/bulk-import', 'please_choose_the_file_mime', 'Please choose the file mime :types', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2216, 0, 'en', 'plugins/location/bulk-import', 'please_choose_the_file', 'Please choose the file', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2217, 0, 'en', 'plugins/location/bulk-import', 'start_import', 'Start Import', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2218, 0, 'en', 'plugins/location/bulk-import', 'note', 'Note!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2219, 0, 'en', 'plugins/location/bulk-import', 'warning_before_importing', 'If this is your first time using this feature, please read the documentation or contact the Administrator for access to the correct functionality!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2220, 0, 'en', 'plugins/location/bulk-import', 'results', 'Result: :success successes, :failed failures', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2221, 0, 'en', 'plugins/location/bulk-import', 'failures', 'Failures', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2222, 0, 'en', 'plugins/location/bulk-import', 'tables.import', 'Import', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2223, 0, 'en', 'plugins/location/bulk-import', 'template', 'Template', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2224, 0, 'en', 'plugins/location/bulk-import', 'rules', 'Rules', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2225, 0, 'en', 'plugins/location/bulk-import', 'choose_file_with_mime', 'Choose file with mime: (:types)', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2226, 0, 'en', 'plugins/location/bulk-import', 'choose_file', 'Choose file', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2227, 0, 'en', 'plugins/location/bulk-import', 'menu', 'Import locations', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2228, 0, 'en', 'plugins/location/bulk-import', 'download-csv-file', 'Download CSV template', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2229, 0, 'en', 'plugins/location/bulk-import', 'download-excel-file', 'Download Excel template', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2230, 0, 'en', 'plugins/location/bulk-import', 'downloading', 'Downloading...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2231, 0, 'en', 'plugins/location/bulk-import', 'export.template.input_error', 'Input error', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2232, 0, 'en', 'plugins/location/bulk-import', 'export.template.number_not_allowed', 'Number is not allowed!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2233, 0, 'en', 'plugins/location/bulk-import', 'export.template.allowed_input', 'Allowed input', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2234, 0, 'en', 'plugins/location/bulk-import', 'export.template.prompt_decimal', 'Only numbers or decimals are accepted and greater than or equal to :min.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2235, 0, 'en', 'plugins/location/bulk-import', 'export.template.prompt_whole_number', 'Only numbers are accepted and greater than or equal to :min.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2236, 0, 'en', 'plugins/location/bulk-import', 'export.template.prompt_list', 'Please pick a value from the drop-down list.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2237, 0, 'en', 'plugins/location/bulk-import', 'export.template.pick_from_list', 'Pick from list', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2238, 0, 'en', 'plugins/location/bulk-import', 'export.template.value_not_in_list', 'Value is not in list.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2239, 0, 'en', 'plugins/location/bulk-import', 'export.template.max_text_length', 'Max text length', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2240, 0, 'en', 'plugins/location/bulk-import', 'export.template.prompt_max_text_length', 'Only accept text with length less than or equal to :max.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2241, 0, 'en', 'plugins/location/bulk-import', 'import_failed_description', 'Import failed, please check the errors below!', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2242, 0, 'en', 'plugins/location/bulk-import', 'available_enable_multi_language', 'Only available when you enable \"Is Multi Language?\"', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2243, 0, 'en', 'plugins/location/bulk-import', 'import_type_required_if', 'The :attribute field is required when \"Import Type\" is :value.', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2244, 0, 'en', 'plugins/location/city', 'name', 'Cities', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2245, 0, 'en', 'plugins/location/city', 'create', 'New city', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2246, 0, 'en', 'plugins/location/city', 'edit', 'Edit city', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2247, 0, 'en', 'plugins/location/city', 'state', 'State', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2248, 0, 'en', 'plugins/location/city', 'select_state', 'Select a state...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2249, 0, 'en', 'plugins/location/city', 'select_city', 'Select a city...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2250, 0, 'en', 'plugins/location/city', 'country', 'Country', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2251, 0, 'en', 'plugins/location/city', 'select_country', 'Select a country...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2252, 0, 'en', 'plugins/location/city', 'city', 'City', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2253, 0, 'en', 'plugins/location/country', 'name', 'Countries', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2254, 0, 'en', 'plugins/location/country', 'create', 'New country', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2255, 0, 'en', 'plugins/location/country', 'edit', 'Edit country', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2256, 0, 'en', 'plugins/location/country', 'nationality', 'Nationality', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2257, 0, 'en', 'plugins/location/location', 'name', 'Locations', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2258, 0, 'en', 'plugins/location/location', 'create', 'New location', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2259, 0, 'en', 'plugins/location/location', 'edit', 'Edit location', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2260, 0, 'en', 'plugins/location/location', 'all_states', 'All states', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2261, 0, 'en', 'plugins/location/location', 'abbreviation', 'Abbreviation', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2262, 0, 'en', 'plugins/location/location', 'abbreviation_placeholder', 'E.g: CA', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2263, 0, 'en', 'plugins/location/state', 'name', 'States', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2264, 0, 'en', 'plugins/location/state', 'create', 'New state', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2265, 0, 'en', 'plugins/location/state', 'edit', 'Edit state', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2266, 0, 'en', 'plugins/location/state', 'country', 'Country', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2267, 0, 'en', 'plugins/location/state', 'select_country', 'Select a country...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2268, 0, 'en', 'plugins/location/state', 'state', 'State', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2269, 0, 'vi', 'plugins/location/city', 'name', 'Quận/huyện', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2270, 0, 'vi', 'plugins/location/city', 'create', 'Thêm quận/huyện', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2271, 0, 'vi', 'plugins/location/city', 'edit', 'Sửa quận/huyện', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2272, 0, 'vi', 'plugins/location/city', 'state', 'Tỉnh', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2273, 0, 'vi', 'plugins/location/city', 'select_state', 'Lựa chọn tỉnh/thành phố...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2274, 0, 'vi', 'plugins/location/city', 'select_city', 'Lựa chọn quận/huyện...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2275, 0, 'vi', 'plugins/location/city', 'country', 'Quốc gia', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2276, 0, 'vi', 'plugins/location/city', 'select_country', 'Lựa chọn quốc gia...', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2277, 0, 'vi', 'plugins/location/city', 'city', 'Quận/huyện', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2278, 0, 'vi', 'plugins/location/country', 'name', 'Quốc gia', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2279, 0, 'vi', 'plugins/location/country', 'create', 'Thêm quốc gia', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2280, 0, 'vi', 'plugins/location/country', 'edit', 'Sửa quốc gia', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2281, 0, 'vi', 'plugins/location/country', 'nationality', 'Quốc tịch', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2282, 0, 'vi', 'plugins/location/location', 'name', 'Địa điểm', '2021-12-31 22:02:29', '2021-12-31 22:02:47'),
(2283, 0, 'vi', 'plugins/location/location', 'create', 'Thêm địa điểm', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2284, 0, 'vi', 'plugins/location/location', 'edit', 'Sửa địa điểm', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2285, 0, 'vi', 'plugins/location/location', 'all_states', 'Tất cả tỉnh thành', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2286, 0, 'vi', 'plugins/location/state', 'name', 'Tỉnh/thành phố', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2287, 0, 'vi', 'plugins/location/state', 'create', 'Thêm tỉnh/thành phố', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2288, 0, 'vi', 'plugins/location/state', 'edit', 'Sửa tỉnh/thành phố', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2289, 0, 'vi', 'plugins/location/state', 'country', 'Quốc gia', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2290, 0, 'vi', 'plugins/location/state', 'select_country', 'Lựa chọn quốc gia...', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2291, 0, 'vi', 'plugins/location/state', 'state', 'Tỉnh/thành phố', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2292, 0, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2293, 0, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2294, 0, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2295, 0, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2296, 0, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2297, 0, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2298, 0, 'en', 'plugins/payment/payment', 'user', 'User', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2299, 0, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2300, 0, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2301, 0, 'en', 'plugins/payment/payment', 'action', 'Action', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2302, 0, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2303, 0, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2304, 0, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2305, 0, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Fast and safe online payment via PayPal.', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2306, 0, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2307, 0, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2308, 0, 'en', 'plugins/payment/payment', 'details', 'Details', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2309, 0, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2310, 0, 'en', 'plugins/payment/payment', 'email', 'Email', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2311, 0, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2312, 0, 'en', 'plugins/payment/payment', 'country', 'Country', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2313, 0, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2314, 0, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2315, 0, 'en', 'plugins/payment/payment', 'card', 'Card', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2316, 0, 'en', 'plugins/payment/payment', 'address', 'Address', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2317, 0, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2318, 0, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2319, 0, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2320, 0, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2321, 0, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2322, 0, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2323, 0, 'en', 'plugins/payment/payment', 'use', 'Use', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2324, 0, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2325, 0, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2326, 0, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2327, 0, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2021-12-31 22:02:30', '2021-12-31 22:02:47');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2328, 0, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2329, 0, 'en', 'plugins/payment/payment', 'update', 'Update', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2330, 0, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2331, 0, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2332, 0, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2333, 0, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2334, 0, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2335, 0, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2336, 0, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2337, 0, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2338, 0, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2339, 0, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2340, 0, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Public Key', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2341, 0, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Private Key', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2342, 0, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2343, 0, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2344, 0, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2345, 0, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2346, 0, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2347, 0, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2348, 0, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2349, 0, 'en', 'plugins/payment/payment', 'name', 'Payments', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2350, 0, 'en', 'plugins/payment/payment', 'create', 'New payment', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2351, 0, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2352, 0, 'en', 'plugins/payment/payment', 'information', 'Information', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2353, 0, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2354, 0, 'en', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2355, 0, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2356, 0, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2357, 0, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2358, 0, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2359, 0, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2360, 0, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2361, 0, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2362, 0, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2363, 0, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2364, 0, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2365, 0, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2366, 0, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2367, 0, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2368, 0, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2369, 0, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2370, 0, 'en', 'plugins/payment/payment', 'total', 'Total', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2371, 0, 'en', 'plugins/payment/payment', 'status', 'Status', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2372, 0, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2373, 0, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2374, 0, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2375, 0, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2376, 0, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2377, 0, 'en', 'plugins/payment/payment', 'callback_url', 'Callback URL', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2378, 0, 'en', 'plugins/payment/payment', 'return_url', 'Return URL', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2379, 0, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2380, 0, 'en', 'plugins/payment/payment', 'refunds.title', 'Refunds', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2381, 0, 'en', 'plugins/payment/payment', 'refunds.id', 'ID', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2382, 0, 'en', 'plugins/payment/payment', 'refunds.breakdowns', 'Breakdowns', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2383, 0, 'en', 'plugins/payment/payment', 'refunds.gross_amount', 'Gross amount', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2384, 0, 'en', 'plugins/payment/payment', 'refunds.paypal_fee', 'PayPal fee', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2385, 0, 'en', 'plugins/payment/payment', 'refunds.net_amount', 'Net amount', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2386, 0, 'en', 'plugins/payment/payment', 'refunds.total_refunded_amount', 'Total refunded amount', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2387, 0, 'en', 'plugins/payment/payment', 'refunds.create_time', 'Create time', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2388, 0, 'en', 'plugins/payment/payment', 'refunds.update_time', 'Update time', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2389, 0, 'en', 'plugins/payment/payment', 'refunds.status', 'Status', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2390, 0, 'en', 'plugins/payment/payment', 'refunds.description', 'Description', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2391, 0, 'en', 'plugins/payment/payment', 'refunds.refunded_at', 'Refunded at', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2392, 0, 'en', 'plugins/payment/payment', 'refunds.error_message', 'Error message', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2393, 0, 'en', 'plugins/payment/payment', 'view_response_source', 'View response source', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2394, 0, 'en', 'plugins/payment/payment', 'status_is_not_completed', 'Status is not COMPLETED', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2395, 0, 'en', 'plugins/payment/payment', 'cannot_found_capture_id', 'Can not found capture id with payment detail', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2396, 0, 'en', 'plugins/payment/payment', 'amount_refunded', 'Amount refunded', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2397, 0, 'en', 'plugins/payment/payment', 'amount_remaining', 'Amount remaining', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2398, 0, 'en', 'plugins/payment/payment', 'paid_at', 'Paid At', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2399, 0, 'en', 'plugins/payment/payment', 'invalid_settings', 'Settings for :name are invalid!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2400, 0, 'en', 'plugins/payment/payment', 'view_transaction', 'Transaction \":charge_id\"', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2401, 0, 'en', 'plugins/payment/payment', 'payment_description', 'Pay for your order #:order_id at :site_url', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2402, 0, 'vi', 'plugins/payment/payment', 'payments', 'Thanh toán', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2403, 0, 'vi', 'plugins/payment/payment', 'checkout_success', 'Thanh toán thành công!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2404, 0, 'vi', 'plugins/payment/payment', 'view_payment', 'Xem thanh toán #', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2405, 0, 'vi', 'plugins/payment/payment', 'charge_id', 'Mã thanh toán', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2406, 0, 'vi', 'plugins/payment/payment', 'amount', 'Số tiền', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2407, 0, 'vi', 'plugins/payment/payment', 'currency', 'Loại tiền tệ', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2408, 0, 'vi', 'plugins/payment/payment', 'user', 'Người dùng', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2409, 0, 'vi', 'plugins/payment/payment', 'stripe', 'Stripe', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2410, 0, 'vi', 'plugins/payment/payment', 'paypal', 'PayPal', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2411, 0, 'vi', 'plugins/payment/payment', 'action', 'Hành động', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2412, 0, 'vi', 'plugins/payment/payment', 'payment_via_card', 'Thanh toán qua thẻ', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2413, 0, 'vi', 'plugins/payment/payment', 'card_number', 'Số thẻ', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2414, 0, 'vi', 'plugins/payment/payment', 'full_name', 'Họ tên', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2415, 0, 'vi', 'plugins/payment/payment', 'payment_via_paypal', 'Thanh toán qua PayPal', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2416, 0, 'vi', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2417, 0, 'vi', 'plugins/payment/payment', 'cvc', 'CVC', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2418, 0, 'vi', 'plugins/payment/payment', 'details', 'Chi tiết', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2419, 0, 'vi', 'plugins/payment/payment', 'payer_name', 'Tên người mua', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2420, 0, 'vi', 'plugins/payment/payment', 'email', 'Email', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2421, 0, 'vi', 'plugins/payment/payment', 'phone', 'Điện thoại', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2422, 0, 'vi', 'plugins/payment/payment', 'country', 'Quốc gia', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2423, 0, 'vi', 'plugins/payment/payment', 'shipping_address', 'Địa chỉ giao hàng', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2424, 0, 'vi', 'plugins/payment/payment', 'payment_details', 'Chi tiết thanh toán', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2425, 0, 'vi', 'plugins/payment/payment', 'card', 'Thẻ', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2426, 0, 'vi', 'plugins/payment/payment', 'address', 'Địa chỉ', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2427, 0, 'vi', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Không thể lấy mã Stripe để thanh toán.', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2428, 0, 'vi', 'plugins/payment/payment', 'payment_id', 'Mã thanh toán', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2429, 0, 'vi', 'plugins/payment/payment', 'payment_methods', 'Phương thức thanh toán', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2430, 0, 'vi', 'plugins/payment/payment', 'transactions', 'Lịch sử giao dịch', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2431, 0, 'vi', 'plugins/payment/payment', 'payment_methods_description', 'Cài đặt các phương thức thanh toán cho website', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2432, 0, 'vi', 'plugins/payment/payment', 'paypal_description', 'Khách hàng có thể mua hàng và thanh toán trực tiếp thông qua cổng thanh toán PayPal', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2433, 0, 'vi', 'plugins/payment/payment', 'use', 'Dùng', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2434, 0, 'vi', 'plugins/payment/payment', 'stripe_description', 'Khách hàng có thể mua hàng và thanh toán bằng Visa, Credit card thông qua cổng thanh toán Stripe', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2435, 0, 'vi', 'plugins/payment/payment', 'edit', 'Chỉnh sửa', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2436, 0, 'vi', 'plugins/payment/payment', 'settings', 'Cài đặt', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2437, 0, 'vi', 'plugins/payment/payment', 'activate', 'Kích hoạt', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2438, 0, 'vi', 'plugins/payment/payment', 'deactivate', 'Huỷ kích hoạt', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2439, 0, 'vi', 'plugins/payment/payment', 'update', 'Cập nhật', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2440, 0, 'vi', 'plugins/payment/payment', 'configuration_instruction', 'Hướng dẫn cấu hình :name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2441, 0, 'vi', 'plugins/payment/payment', 'configuration_requirement', 'Để sử dụng :name bạn cần', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2442, 0, 'vi', 'plugins/payment/payment', 'service_registration', 'Đăng ký dịch vụ với :name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2443, 0, 'vi', 'plugins/payment/payment', 'after_service_registration_msg', 'Sau khi hoàn tất các bước đăng ký tại :name, bạn sẽ có các thông số Client ID, Client Secret', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2444, 0, 'vi', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Nhập các thông số Client ID, Secret vào ô bên phải', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2445, 0, 'vi', 'plugins/payment/payment', 'method_name', 'Tên phương thức', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2446, 0, 'vi', 'plugins/payment/payment', 'please_provide_information', 'Xin vui lòng cung cấp thông tin', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2447, 0, 'vi', 'plugins/payment/payment', 'client_id', 'Client ID', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2448, 0, 'vi', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2449, 0, 'vi', 'plugins/payment/payment', 'stripe_key', 'Stripe Key', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2450, 0, 'vi', 'plugins/payment/payment', 'stripe_secret', 'Stripe Secret', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2451, 0, 'vi', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2452, 0, 'vi', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2453, 0, 'vi', 'plugins/payment/payment', 'secret', 'Secret', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2454, 0, 'vi', 'plugins/payment/payment', 'pay_online_via', 'Thanh toán online qua :name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2455, 0, 'vi', 'plugins/payment/payment', 'sandbox_mode', 'Chế độ thử nghiệm', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2456, 0, 'vi', 'plugins/payment/payment', 'deactivate_payment_method', 'Huỷ kích hoạt phương thức', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2457, 0, 'vi', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Bạn có chắc chắn muốn huỷ phương thức thành toán này?', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2458, 0, 'vi', 'plugins/payment/payment', 'agree', 'Đồng ý', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2459, 0, 'vi', 'plugins/payment/payment', 'name', 'Thanh toán', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2460, 0, 'vi', 'plugins/payment/payment', 'create', 'Thêm thanh toán mới', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2461, 0, 'vi', 'plugins/payment/payment', 'go_back', 'Trở lại', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2462, 0, 'vi', 'plugins/payment/payment', 'information', 'Thông tin', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2463, 0, 'vi', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2464, 0, 'vi', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2465, 0, 'vi', 'plugins/payment/payment', 'methods.cod', 'Thanh toán khi giao hàng (COD)', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2466, 0, 'vi', 'plugins/payment/payment', 'methods.bank_transfer', 'Chuyển khoản qua ngân hàng', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2467, 0, 'vi', 'plugins/payment/payment', 'statuses.pending', 'Chưa hoàn tất', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2468, 0, 'vi', 'plugins/payment/payment', 'statuses.completed', 'Đã hoàn thành', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2469, 0, 'vi', 'plugins/payment/payment', 'statuses.refunding', 'Đang hoàn tiền', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2470, 0, 'vi', 'plugins/payment/payment', 'statuses.refunded', 'Đã hoàn tiền', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2471, 0, 'vi', 'plugins/payment/payment', 'statuses.fraud', 'Gian lận', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2472, 0, 'vi', 'plugins/payment/payment', 'statuses.failed', 'Thất bại', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2473, 0, 'vi', 'plugins/payment/payment', 'payment_methods_instruction', 'Hướng dẫn khách hàng thanh toán trực tiếp. Có thể chọn thanh toán khi giao hàng hoặc chuyển khoản', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2474, 0, 'vi', 'plugins/payment/payment', 'payment_method_description', 'Hướng dẫn thanh toán – (Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán)', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2475, 0, 'vi', 'plugins/payment/payment', 'payment_via_cod', 'Thanh toán khi nhận hàng (COD)', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2476, 0, 'vi', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Chuyển khoản qua ngân hàng', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2477, 0, 'vi', 'plugins/payment/payment', 'payment_pending', 'Thực hiện thành công. Thanh toán của bạn đang được xử lý và sẽ được xác nhận bởi nhân viên.', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2478, 0, 'vi', 'plugins/payment/payment', 'created_at', 'Ngày tạo', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2479, 0, 'vi', 'plugins/payment/payment', 'payment_channel', 'Phương thức thanh toán', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2480, 0, 'vi', 'plugins/payment/payment', 'total', 'Tổng cộng', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2481, 0, 'vi', 'plugins/payment/payment', 'status', 'Trạng thái', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2482, 0, 'vi', 'plugins/payment/payment', 'default_payment_method', 'Phương thức thanh toán mặc định', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2483, 0, 'en', 'plugins/real-estate/account-property', 'draft_properties', 'Draft Properties', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2484, 0, 'en', 'plugins/real-estate/account-property', 'pending_properties', 'Pending Properties', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2485, 0, 'en', 'plugins/real-estate/account-property', 'published_properties', 'Published Properties', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2486, 0, 'en', 'plugins/real-estate/account-property', 'properties', 'Properties', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2487, 0, 'en', 'plugins/real-estate/account-property', 'write_property', 'Write a property', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2488, 0, 'en', 'plugins/real-estate/account', 'create', 'New account', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2489, 0, 'en', 'plugins/real-estate/account', 'edit', 'Edit account \":name\"', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2490, 0, 'en', 'plugins/real-estate/account', 'name', 'Accounts', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2491, 0, 'en', 'plugins/real-estate/account', 'form.email', 'Email', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2492, 0, 'en', 'plugins/real-estate/account', 'form.password', 'Password', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2493, 0, 'en', 'plugins/real-estate/account', 'form.password_confirmation', 'Password confirmation', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2494, 0, 'en', 'plugins/real-estate/account', 'form.change_password', 'Change password?', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2495, 0, 'en', 'plugins/real-estate/account', 'forgot_password', 'Forgot password', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2496, 0, 'en', 'plugins/real-estate/account', 'login', 'Login', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2497, 0, 'en', 'plugins/real-estate/account', 'buy_credits', 'Buy credits', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2498, 0, 'en', 'plugins/real-estate/account', 'credits', 'credits', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2499, 0, 'en', 'plugins/real-estate/account', 'account_settings', 'Account settings', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2500, 0, 'en', 'plugins/real-estate/account', 'update_profile_success', 'Update profile successfully!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2501, 0, 'en', 'plugins/real-estate/account', 'security', 'Security', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2502, 0, 'en', 'plugins/real-estate/account', 'packages', 'Packages', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2503, 0, 'en', 'plugins/real-estate/account', 'transactions', 'Transactions', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2504, 0, 'en', 'plugins/real-estate/account', 'subscribe_package', 'Subscribe package \":name\"', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2505, 0, 'en', 'plugins/real-estate/account', 'first_name', 'First Name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2506, 0, 'en', 'plugins/real-estate/account', 'last_name', 'Last Name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2507, 0, 'en', 'plugins/real-estate/account', 'username', 'Username', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2508, 0, 'en', 'plugins/real-estate/account', 'username_placeholder', 'Ex: john_smith', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2509, 0, 'en', 'plugins/real-estate/account', 'company', 'Company Name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2510, 0, 'en', 'plugins/real-estate/account', 'company_placeholder', 'Company Name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2511, 0, 'en', 'plugins/real-estate/account', 'phone', 'Phone', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2512, 0, 'en', 'plugins/real-estate/account', 'phone_placeholder', 'Phone', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2513, 0, 'en', 'plugins/real-estate/account', 'email_placeholder', 'Ex: example@gmail.com', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2514, 0, 'en', 'plugins/real-estate/account', 'dob', 'Date of birth', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2515, 0, 'en', 'plugins/real-estate/account', 'number_of_properties', 'Number of properties', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2516, 0, 'en', 'plugins/real-estate/account', 'agents', 'Agents', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2517, 0, 'en', 'plugins/real-estate/category', 'name', 'Categories', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2518, 0, 'en', 'plugins/real-estate/category', 'create', 'New category', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2519, 0, 'en', 'plugins/real-estate/category', 'edit', 'Edit category', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2520, 0, 'en', 'plugins/real-estate/category', 'menu', 'Property categories', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2521, 0, 'en', 'plugins/real-estate/category', 'none', 'None', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2522, 0, 'en', 'plugins/real-estate/category', 'total_properties', 'Total properties', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2523, 0, 'en', 'plugins/real-estate/category', 'total_projects', 'Total projects', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2524, 0, 'en', 'plugins/real-estate/category', 'is_default', 'Is default', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2525, 0, 'en', 'plugins/real-estate/consult', 'name', 'Consults', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2526, 0, 'en', 'plugins/real-estate/consult', 'edit', 'View consult', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2527, 0, 'en', 'plugins/real-estate/consult', 'statuses.read', 'Read', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2528, 0, 'en', 'plugins/real-estate/consult', 'statuses.unread', 'Unread', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2529, 0, 'en', 'plugins/real-estate/consult', 'phone', 'Phone', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2530, 0, 'en', 'plugins/real-estate/consult', 'content', 'Details', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2531, 0, 'en', 'plugins/real-estate/consult', 'consult_information', 'Consult information', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2532, 0, 'en', 'plugins/real-estate/consult', 'email.header', 'Email', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2533, 0, 'en', 'plugins/real-estate/consult', 'email.title', 'New consult from your site', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2534, 0, 'en', 'plugins/real-estate/consult', 'email.success', 'Send consult successfully!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2535, 0, 'en', 'plugins/real-estate/consult', 'email.failed', 'Can\'t send request on this time, please try again later!', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2536, 0, 'en', 'plugins/real-estate/consult', 'form.name.required', 'Name is required', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2537, 0, 'en', 'plugins/real-estate/consult', 'form.email.required', 'Email is required', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2538, 0, 'en', 'plugins/real-estate/consult', 'form.email.email', 'The email address is not valid', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2539, 0, 'en', 'plugins/real-estate/consult', 'form.content.required', 'Content is required', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2540, 0, 'en', 'plugins/real-estate/consult', 'form.g-recaptcha-response.required', 'Please confirm you are not a robot before sending the message.', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2541, 0, 'en', 'plugins/real-estate/consult', 'form.g-recaptcha-response.captcha', 'You are not confirm robot yet.', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2542, 0, 'en', 'plugins/real-estate/consult', 'consult_sent_from', 'This consult information sent from', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2543, 0, 'en', 'plugins/real-estate/consult', 'time', 'Time', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2544, 0, 'en', 'plugins/real-estate/consult', 'consult_id', 'Consult ID', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2545, 0, 'en', 'plugins/real-estate/consult', 'form_name', 'Name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2546, 0, 'en', 'plugins/real-estate/consult', 'form_email', 'Email', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2547, 0, 'en', 'plugins/real-estate/consult', 'form_phone', 'Phone', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2548, 0, 'en', 'plugins/real-estate/consult', 'mark_as_read', 'Mark as read', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2549, 0, 'en', 'plugins/real-estate/consult', 'mark_as_unread', 'Mark as unread', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2550, 0, 'en', 'plugins/real-estate/consult', 'new_consult_notice', 'You have <span class=\"bold\">:count</span> New Consults', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2551, 0, 'en', 'plugins/real-estate/consult', 'view_all', 'View all', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2552, 0, 'en', 'plugins/real-estate/consult', 'project', 'Project', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2553, 0, 'en', 'plugins/real-estate/consult', 'property', 'Property', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2554, 0, 'en', 'plugins/real-estate/currency', 'currencies', 'Currencies', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2555, 0, 'en', 'plugins/real-estate/currency', 'setting_description', 'List of currencies using on website', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2556, 0, 'en', 'plugins/real-estate/currency', 'name', 'Name', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2557, 0, 'en', 'plugins/real-estate/currency', 'symbol', 'Symbol', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2558, 0, 'en', 'plugins/real-estate/currency', 'number_of_decimals', 'Number of decimals', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2559, 0, 'en', 'plugins/real-estate/currency', 'exchange_rate', 'Exchange rate', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2560, 0, 'en', 'plugins/real-estate/currency', 'is_prefix_symbol', 'Position of symbol', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2561, 0, 'en', 'plugins/real-estate/currency', 'is_default', 'Is default?', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2562, 0, 'en', 'plugins/real-estate/currency', 'remove', 'Remove', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2563, 0, 'en', 'plugins/real-estate/currency', 'new_currency', 'Add a new currency', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2564, 0, 'en', 'plugins/real-estate/currency', 'save_settings', 'Save settings', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2565, 0, 'en', 'plugins/real-estate/currency', 'before_number', 'Before number', '2021-12-31 22:02:30', '2021-12-31 22:02:47'),
(2566, 0, 'en', 'plugins/real-estate/currency', 'after_number', 'After number', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2567, 0, 'en', 'plugins/real-estate/currency', 'require_at_least_one_currency', 'The system requires at least one currency!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2568, 0, 'en', 'plugins/real-estate/dashboard', 'joined_on', 'Joined :date', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2569, 0, 'en', 'plugins/real-estate/dashboard', 'dob', 'Born :date', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2570, 0, 'en', 'plugins/real-estate/dashboard', 'email', 'Email', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2571, 0, 'en', 'plugins/real-estate/dashboard', 'username', 'Username', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2572, 0, 'en', 'plugins/real-estate/dashboard', 'email_or_username', 'Email/Username', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2573, 0, 'en', 'plugins/real-estate/dashboard', 'password', 'Password', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2574, 0, 'en', 'plugins/real-estate/dashboard', 'password-confirmation', 'Confirm Password', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2575, 0, 'en', 'plugins/real-estate/dashboard', 'remember-me', 'Remember Me', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2576, 0, 'en', 'plugins/real-estate/dashboard', 'login-title', 'Login', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2577, 0, 'en', 'plugins/real-estate/dashboard', 'login-cta', 'Login', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2578, 0, 'en', 'plugins/real-estate/dashboard', 'register-title', 'Register', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2579, 0, 'en', 'plugins/real-estate/dashboard', 'register-cta', 'Register', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2580, 0, 'en', 'plugins/real-estate/dashboard', 'forgot-password-cta', 'Forgot Your Password?', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2581, 0, 'en', 'plugins/real-estate/dashboard', 'name', 'Name', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2582, 0, 'en', 'plugins/real-estate/dashboard', 'reset-password-title', 'Reset Password', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2583, 0, 'en', 'plugins/real-estate/dashboard', 'reset-password-cta', 'Reset Password', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2584, 0, 'en', 'plugins/real-estate/dashboard', 'cancel-link', 'Cancel', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2585, 0, 'en', 'plugins/real-estate/dashboard', 'logout-cta', 'Logout', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2586, 0, 'en', 'plugins/real-estate/dashboard', 'header_profile_link', 'Profile', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2587, 0, 'en', 'plugins/real-estate/dashboard', 'header_settings_link', 'Settings', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2588, 0, 'en', 'plugins/real-estate/dashboard', 'header_logout_link', 'Logout', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2589, 0, 'en', 'plugins/real-estate/dashboard', 'unknown_state', 'Unknown', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2590, 0, 'en', 'plugins/real-estate/dashboard', 'close', 'Close', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2591, 0, 'en', 'plugins/real-estate/dashboard', 'save', 'Save', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2592, 0, 'en', 'plugins/real-estate/dashboard', 'loading', 'Loading...', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2593, 0, 'en', 'plugins/real-estate/dashboard', 'new_image', 'New image', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2594, 0, 'en', 'plugins/real-estate/dashboard', 'change_profile_image', 'Change avatar', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2595, 0, 'en', 'plugins/real-estate/dashboard', 'save_cropped_image_failed', 'Save cropped image failed!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2596, 0, 'en', 'plugins/real-estate/dashboard', 'failed_to_crop_image', 'Failed to crop image', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2597, 0, 'en', 'plugins/real-estate/dashboard', 'failed_to_load_data', 'Failed to load data', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2598, 0, 'en', 'plugins/real-estate/dashboard', 'read_image_failed', 'Read image failed', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2599, 0, 'en', 'plugins/real-estate/dashboard', 'update_avatar_success', 'Update avatar successfully!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2600, 0, 'en', 'plugins/real-estate/dashboard', 'change_avatar_description', 'Click on image to change avatar', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2601, 0, 'en', 'plugins/real-estate/dashboard', 'notices.error', 'Error!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2602, 0, 'en', 'plugins/real-estate/dashboard', 'notices.success', 'Success!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2603, 0, 'en', 'plugins/real-estate/dashboard', 'sidebar_title', 'Personal settings', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2604, 0, 'en', 'plugins/real-estate/dashboard', 'sidebar_information', 'Account Information', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2605, 0, 'en', 'plugins/real-estate/dashboard', 'sidebar_security', 'Security', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2606, 0, 'en', 'plugins/real-estate/dashboard', 'sidebar_packages', 'Packages', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2607, 0, 'en', 'plugins/real-estate/dashboard', 'sidebar_transactions', 'Transactions', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2608, 0, 'en', 'plugins/real-estate/dashboard', 'account_field_title', 'Account Information', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2609, 0, 'en', 'plugins/real-estate/dashboard', 'profile-picture', 'Profile picture', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2610, 0, 'en', 'plugins/real-estate/dashboard', 'uploading', 'Uploading...', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2611, 0, 'en', 'plugins/real-estate/dashboard', 'company', 'Company Name', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2612, 0, 'en', 'plugins/real-estate/dashboard', 'phone', 'Phone', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2613, 0, 'en', 'plugins/real-estate/dashboard', 'first_name', 'First name', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2614, 0, 'en', 'plugins/real-estate/dashboard', 'last_name', 'Last name', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2615, 0, 'en', 'plugins/real-estate/dashboard', 'description', 'Short description', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2616, 0, 'en', 'plugins/real-estate/dashboard', 'description_placeholder', 'Tell something about yourself...', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2617, 0, 'en', 'plugins/real-estate/dashboard', 'verified', 'Verified', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2618, 0, 'en', 'plugins/real-estate/dashboard', 'verify_require_desc', 'Please verify email by link we sent to you.', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2619, 0, 'en', 'plugins/real-estate/dashboard', 'birthday', 'Birthday', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2620, 0, 'en', 'plugins/real-estate/dashboard', 'year_lc', 'year', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2621, 0, 'en', 'plugins/real-estate/dashboard', 'month_lc', 'month', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2622, 0, 'en', 'plugins/real-estate/dashboard', 'day_lc', 'day', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2623, 0, 'en', 'plugins/real-estate/dashboard', 'gender', 'Gender', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2624, 0, 'en', 'plugins/real-estate/dashboard', 'gender_male', 'Male', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2625, 0, 'en', 'plugins/real-estate/dashboard', 'gender_female', 'Female', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2626, 0, 'en', 'plugins/real-estate/dashboard', 'gender_other', 'Other', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2627, 0, 'en', 'plugins/real-estate/dashboard', 'security_title', 'Security', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2628, 0, 'en', 'plugins/real-estate/dashboard', 'packages_title', 'Packages', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2629, 0, 'en', 'plugins/real-estate/dashboard', 'transactions_title', 'Transactions', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2630, 0, 'en', 'plugins/real-estate/dashboard', 'current_password', 'Current password', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2631, 0, 'en', 'plugins/real-estate/dashboard', 'password_new', 'New password', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2632, 0, 'en', 'plugins/real-estate/dashboard', 'password_new_confirmation', 'Confirmation password', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2633, 0, 'en', 'plugins/real-estate/dashboard', 'password_update_btn', 'Update password', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2634, 0, 'en', 'plugins/real-estate/dashboard', 'activity_logs', 'Activity Logs', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2635, 0, 'en', 'plugins/real-estate/dashboard', 'oops', 'Oops!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2636, 0, 'en', 'plugins/real-estate/dashboard', 'no_activity_logs', 'You have no activity logs yet', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2637, 0, 'en', 'plugins/real-estate/dashboard', 'actions.create_property', 'You have created property \":name\"', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2638, 0, 'en', 'plugins/real-estate/dashboard', 'actions.update_property', 'You have updated property \":name\"', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2639, 0, 'en', 'plugins/real-estate/dashboard', 'actions.delete_property', 'You have deleted property \":name\"', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2640, 0, 'en', 'plugins/real-estate/dashboard', 'actions.update_setting', 'You have updated your settings', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2641, 0, 'en', 'plugins/real-estate/dashboard', 'actions.update_security', 'You have updated your security settings', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2642, 0, 'en', 'plugins/real-estate/dashboard', 'actions.your_property_updated_by_admin', 'Your property \":name\" is updated by administrator', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2643, 0, 'en', 'plugins/real-estate/dashboard', 'actions.changed_avatar', 'You have changed your avatar', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2644, 0, 'en', 'plugins/real-estate/dashboard', 'load_more', 'Load more', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2645, 0, 'en', 'plugins/real-estate/dashboard', 'loading_more', 'Loading...', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2646, 0, 'en', 'plugins/real-estate/dashboard', 'back-to-login', 'Back to login page', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2647, 0, 'en', 'plugins/real-estate/dashboard', 'no_transactions', 'No transactions', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2648, 0, 'en', 'plugins/real-estate/dashboard', 'approved_properties', 'Approved properties', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2649, 0, 'en', 'plugins/real-estate/dashboard', 'pending_approve_properties', 'Pending approve properties', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2650, 0, 'en', 'plugins/real-estate/dashboard', 'rejected_properties', 'Rejected properties', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2651, 0, 'en', 'plugins/real-estate/dashboard', 'your_credits', 'Your Credits', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2652, 0, 'en', 'plugins/real-estate/dashboard', 'credits', 'credits', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2653, 0, 'en', 'plugins/real-estate/dashboard', 'per_post', 'per post', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2654, 0, 'en', 'plugins/real-estate/dashboard', 'free', 'Free', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2655, 0, 'en', 'plugins/real-estate/dashboard', 'posts', 'post(s)', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2656, 0, 'en', 'plugins/real-estate/dashboard', 'total', 'Total', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2657, 0, 'en', 'plugins/real-estate/dashboard', 'purchase', 'Purchase', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2658, 0, 'en', 'plugins/real-estate/dashboard', 'select_facility', 'Select facility', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2659, 0, 'en', 'plugins/real-estate/dashboard', 'distance', 'Distance (Km)', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2660, 0, 'en', 'plugins/real-estate/dashboard', 'add_new', 'Add new', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2661, 0, 'en', 'plugins/real-estate/dashboard', 'resend', 'Resend', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2662, 0, 'en', 'plugins/real-estate/dashboard', 'error', 'Error!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2663, 0, 'en', 'plugins/real-estate/dashboard', 'success', 'Success!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2664, 0, 'en', 'plugins/real-estate/facility', 'name', 'Facilities', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2665, 0, 'en', 'plugins/real-estate/facility', 'create', 'New facility', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2666, 0, 'en', 'plugins/real-estate/facility', 'edit', 'Edit facility', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2667, 0, 'en', 'plugins/real-estate/feature', 'name', 'Features', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2668, 0, 'en', 'plugins/real-estate/feature', 'create', 'New feature', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2669, 0, 'en', 'plugins/real-estate/feature', 'edit', 'Edit feature', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2670, 0, 'en', 'plugins/real-estate/feature', 'messages.request.name_required', 'Name is required', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2671, 0, 'en', 'plugins/real-estate/feature', 'form.help_block', 'Property feature information', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2672, 0, 'en', 'plugins/real-estate/feature', 'form.name', 'Title', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2673, 0, 'en', 'plugins/real-estate/feature', 'form.icon', 'Icon', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2674, 0, 'en', 'plugins/real-estate/investor', 'name', 'Investors', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2675, 0, 'en', 'plugins/real-estate/investor', 'create', 'New investor', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2676, 0, 'en', 'plugins/real-estate/investor', 'edit', 'Edit investor', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2677, 0, 'en', 'plugins/real-estate/package', 'name', 'Packages', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2678, 0, 'en', 'plugins/real-estate/package', 'create', 'New package', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2679, 0, 'en', 'plugins/real-estate/package', 'edit', 'Edit package', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2680, 0, 'en', 'plugins/real-estate/package', 'price', 'Price', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2681, 0, 'en', 'plugins/real-estate/package', 'currency', 'Currency', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2682, 0, 'en', 'plugins/real-estate/package', 'percent_save', 'Percent save', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2683, 0, 'en', 'plugins/real-estate/package', 'number_of_listings', 'Number of listings', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2684, 0, 'en', 'plugins/real-estate/package', 'add_credit_success', 'Add credit successfully!', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2685, 0, 'en', 'plugins/real-estate/package', 'setup_payment_methods', 'Please setup payment methods (PayPal, Stripe, COD, Bank transfer)', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2686, 0, 'en', 'plugins/real-estate/package', 'add_credit_warning', 'Please add your credit to create your own posts here:', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2687, 0, 'en', 'plugins/real-estate/package', 'add_credit', 'Add credit', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2688, 0, 'en', 'plugins/real-estate/package', 'account_limit', 'Limit purchase by account', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2689, 0, 'en', 'plugins/real-estate/package', 'account_limit_placeholder', 'An account can purchase x times', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2690, 0, 'en', 'plugins/real-estate/package', 'subscribe_package', 'Subscribe package', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2691, 0, 'en', 'plugins/real-estate/package', 'add_credit_alert', 'Please add your credit to create your own posts.', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2692, 0, 'en', 'plugins/real-estate/project', 'name', 'Projects', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2693, 0, 'en', 'plugins/real-estate/project', 'create', 'New project', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2694, 0, 'en', 'plugins/real-estate/project', 'edit', 'Edit project', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2695, 0, 'en', 'plugins/real-estate/project', 'form.general_info', 'General information', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2696, 0, 'en', 'plugins/real-estate/project', 'form.name', 'Name', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2697, 0, 'en', 'plugins/real-estate/project', 'form.description', 'Description', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2698, 0, 'en', 'plugins/real-estate/project', 'form.basic_info', 'Basic information', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2699, 0, 'en', 'plugins/real-estate/project', 'form.location', 'Location', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2700, 0, 'en', 'plugins/real-estate/project', 'form.investor', 'Investor', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2701, 0, 'en', 'plugins/real-estate/project', 'form.number_block', 'Number blocks', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2702, 0, 'en', 'plugins/real-estate/project', 'form.number_floor', 'Number floors', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2703, 0, 'en', 'plugins/real-estate/project', 'form.number_flat', 'Number flats', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2704, 0, 'en', 'plugins/real-estate/project', 'form.date_finish', 'Finish date', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2705, 0, 'en', 'plugins/real-estate/project', 'form.date_sell', 'Open sell date', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2706, 0, 'en', 'plugins/real-estate/project', 'form.images', 'Images', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2707, 0, 'en', 'plugins/real-estate/project', 'form.price_from', 'Lowest price', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2708, 0, 'en', 'plugins/real-estate/project', 'form.price_to', 'Max price', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2709, 0, 'en', 'plugins/real-estate/project', 'form.currency', 'Currency', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2710, 0, 'en', 'plugins/real-estate/project', 'form.city', 'City', '2021-12-31 22:02:31', '2021-12-31 22:02:48');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2711, 0, 'en', 'plugins/real-estate/project', 'form.category', 'Category', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2712, 0, 'en', 'plugins/real-estate/project', 'form.latitude', 'Latitude', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2713, 0, 'en', 'plugins/real-estate/project', 'form.latitude_helper', 'Go here to get Latitude from address.', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2714, 0, 'en', 'plugins/real-estate/project', 'form.longitude', 'Longitude', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2715, 0, 'en', 'plugins/real-estate/project', 'form.longitude_helper', 'Go here to get Longitude from address.', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2716, 0, 'en', 'plugins/real-estate/project', 'form.categories', 'Categories', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2717, 0, 'en', 'plugins/real-estate/project', 'statuses.not_available', 'Not available', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2718, 0, 'en', 'plugins/real-estate/project', 'statuses.pre_sale', 'Preparing selling', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2719, 0, 'en', 'plugins/real-estate/project', 'statuses.selling', 'Selling', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2720, 0, 'en', 'plugins/real-estate/project', 'statuses.sold', 'Sold', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2721, 0, 'en', 'plugins/real-estate/project', 'statuses.building', 'Building', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2722, 0, 'en', 'plugins/real-estate/project', 'distance_key', 'Distance key between facilities', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2723, 0, 'en', 'plugins/real-estate/project', 'select_investor', 'Select an investor...', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2724, 0, 'en', 'plugins/real-estate/property', 'name', 'Properties', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2725, 0, 'en', 'plugins/real-estate/property', 'create', 'New property', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2726, 0, 'en', 'plugins/real-estate/property', 'edit', 'Edit property', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2727, 0, 'en', 'plugins/real-estate/property', 'form.main_info', 'General information', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2728, 0, 'en', 'plugins/real-estate/property', 'form.basic_info', 'Basic information', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2729, 0, 'en', 'plugins/real-estate/property', 'form.name', 'Title', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2730, 0, 'en', 'plugins/real-estate/property', 'form.type', 'Type', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2731, 0, 'en', 'plugins/real-estate/property', 'form.images', 'Images', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2732, 0, 'en', 'plugins/real-estate/property', 'form.location', 'Property location', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2733, 0, 'en', 'plugins/real-estate/property', 'form.number_bedroom', 'Number bedrooms', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2734, 0, 'en', 'plugins/real-estate/property', 'form.number_bathroom', 'Number bathrooms', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2735, 0, 'en', 'plugins/real-estate/property', 'form.number_floor', 'Number floors', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2736, 0, 'en', 'plugins/real-estate/property', 'form.square', 'Square :unit', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2737, 0, 'en', 'plugins/real-estate/property', 'form.price', 'Price', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2738, 0, 'en', 'plugins/real-estate/property', 'form.features', 'Features', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2739, 0, 'en', 'plugins/real-estate/property', 'form.project', 'Project', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2740, 0, 'en', 'plugins/real-estate/property', 'form.date', 'Date information', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2741, 0, 'en', 'plugins/real-estate/property', 'form.currency', 'Currency', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2742, 0, 'en', 'plugins/real-estate/property', 'form.city', 'City', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2743, 0, 'en', 'plugins/real-estate/property', 'form.period', 'Period', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2744, 0, 'en', 'plugins/real-estate/property', 'form.category', 'Category', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2745, 0, 'en', 'plugins/real-estate/property', 'form.latitude', 'Latitude', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2746, 0, 'en', 'plugins/real-estate/property', 'form.latitude_helper', 'Go here to get Latitude from address.', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2747, 0, 'en', 'plugins/real-estate/property', 'form.longitude', 'Longitude', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2748, 0, 'en', 'plugins/real-estate/property', 'form.longitude_helper', 'Go here to get Longitude from address.', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2749, 0, 'en', 'plugins/real-estate/property', 'form.categories', 'Categories', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2750, 0, 'en', 'plugins/real-estate/property', 'form.images_upload_placeholder', 'Drop files here or click to upload.', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2751, 0, 'en', 'plugins/real-estate/property', 'statuses.not_available', 'Not available', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2752, 0, 'en', 'plugins/real-estate/property', 'statuses.pre_sale', 'Preparing selling', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2753, 0, 'en', 'plugins/real-estate/property', 'statuses.selling', 'Selling', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2754, 0, 'en', 'plugins/real-estate/property', 'statuses.sold', 'Sold', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2755, 0, 'en', 'plugins/real-estate/property', 'statuses.renting', 'Renting', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2756, 0, 'en', 'plugins/real-estate/property', 'statuses.rented', 'Rented', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2757, 0, 'en', 'plugins/real-estate/property', 'statuses.building', 'Building', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2758, 0, 'en', 'plugins/real-estate/property', 'types.sale', 'Sale', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2759, 0, 'en', 'plugins/real-estate/property', 'types.rent', 'Rent', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2760, 0, 'en', 'plugins/real-estate/property', 'periods.day', 'Day', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2761, 0, 'en', 'plugins/real-estate/property', 'periods.month', 'Month', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2762, 0, 'en', 'plugins/real-estate/property', 'periods.year', 'Year', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2763, 0, 'en', 'plugins/real-estate/property', 'moderation_status', 'Moderation status', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2764, 0, 'en', 'plugins/real-estate/property', 'moderation-statuses.pending', 'Pending', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2765, 0, 'en', 'plugins/real-estate/property', 'moderation-statuses.approved', 'Approved', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2766, 0, 'en', 'plugins/real-estate/property', 'moderation-statuses.rejected', 'Rejected', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2767, 0, 'en', 'plugins/real-estate/property', 'renew_notice', 'Renew automatically (you will be charged again in :days days)?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2768, 0, 'en', 'plugins/real-estate/property', 'distance_key', 'Distance key between facilities', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2769, 0, 'en', 'plugins/real-estate/property', 'never_expired', 'Never expired?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2770, 0, 'en', 'plugins/real-estate/property', 'select_project', 'Select a project...', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2771, 0, 'en', 'plugins/real-estate/property', 'account', 'Account', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2772, 0, 'en', 'plugins/real-estate/property', 'select_account', 'Select an account..', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2773, 0, 'en', 'plugins/real-estate/property', 'expire_date', 'Expire date', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2774, 0, 'en', 'plugins/real-estate/property', 'never_expired_label', 'Never expired', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2775, 0, 'en', 'plugins/real-estate/property', 'active_properties', 'Active properties', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2776, 0, 'en', 'plugins/real-estate/property', 'pending_properties', 'Pending properties', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2777, 0, 'en', 'plugins/real-estate/property', 'expired_properties', 'Expired properties', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2778, 0, 'en', 'plugins/real-estate/real-estate', 'name', 'Real Estate', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2779, 0, 'en', 'plugins/real-estate/real-estate', 'settings', 'Settings', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2780, 0, 'en', 'plugins/real-estate/settings', 'title', 'Accounts', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2781, 0, 'en', 'plugins/real-estate/settings', 'description', 'Settings for members', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2782, 0, 'en', 'plugins/real-estate/settings', 'verify_account_email', 'Verify account\'s email?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2783, 0, 'en', 'plugins/real-estate/settings', 'square_unit', 'Unit of square', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2784, 0, 'en', 'plugins/real-estate/settings', 'square_unit_none', 'None', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2785, 0, 'en', 'plugins/real-estate/settings', 'square_unit_meter', 'Square Meter(m²)', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2786, 0, 'en', 'plugins/real-estate/settings', 'square_unit_feet', 'Square Feet(ft2)', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2787, 0, 'en', 'plugins/real-estate/settings', 'general', 'General settings', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2788, 0, 'en', 'plugins/real-estate/settings', 'general_description', 'Basic settings for Real Estate', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2789, 0, 'en', 'plugins/real-estate/settings', 'real_estate_convert_money_to_text_enabled', 'Convert money to text if it is too big?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2790, 0, 'en', 'plugins/real-estate/settings', 'thousands_separator', 'Thousands separator', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2791, 0, 'en', 'plugins/real-estate/settings', 'decimal_separator', 'Decimal separator', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2792, 0, 'en', 'plugins/real-estate/settings', 'separator_period', 'Period (.)', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2793, 0, 'en', 'plugins/real-estate/settings', 'separator_comma', 'Comma (,)', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2794, 0, 'en', 'plugins/real-estate/settings', 'separator_space', 'Space ( )', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2795, 0, 'en', 'plugins/real-estate/settings', 'real_estate_enabled_register', 'Allow visitors to register account and post their properties?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2796, 0, 'en', 'plugins/real-estate/settings', 'email.title', 'Real Estate', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2797, 0, 'en', 'plugins/real-estate/settings', 'email.description', 'Real estate email configuration', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2798, 0, 'en', 'plugins/real-estate/settings', 'property_expired_after_days', 'Property Expired Time (days)', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2799, 0, 'en', 'plugins/real-estate/settings', 'enable_post_approval', 'Enable post approval?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2800, 0, 'en', 'plugins/real-estate/settings', 'enable_credits_system', 'Enable credits system (agents need to buy credits to post their properties)', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2801, 0, 'en', 'plugins/real-estate/settings', 'enable_auto_detect_visitor_currency', 'Enable auto-detect visitor currency?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2802, 0, 'en', 'plugins/real-estate/settings', 'display_views_count_in_detail_page', 'Display views count in the detail page?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2803, 0, 'en', 'plugins/real-estate/settings', 'enable_recaptcha_in_register_page', 'Enable Recaptcha in the registration page?', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2804, 0, 'en', 'plugins/real-estate/settings', 'enable_recaptcha_in_register_page_description', 'Need to setup Captcha in Admin -> Settings -> General first.', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2805, 0, 'en', 'plugins/real-estate/transaction', 'types.add', 'Add', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2806, 0, 'en', 'plugins/real-estate/transaction', 'types.remove', 'Remove', '2021-12-31 22:02:31', '2021-12-31 22:02:48'),
(2807, 0, 'vi', 'plugins/real-estate/account-property', 'draft_properties', 'Bài đăng nháp', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2808, 0, 'vi', 'plugins/real-estate/account-property', 'pending_properties', 'Tin đang xét duyệt', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2809, 0, 'vi', 'plugins/real-estate/account-property', 'published_properties', 'Tin đã được xuất bản', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2810, 0, 'vi', 'plugins/real-estate/account-property', 'properties', 'Tin bất động sản', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2811, 0, 'vi', 'plugins/real-estate/account-property', 'write_property', 'Đăng bài', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2812, 0, 'vi', 'plugins/real-estate/account', 'create', 'Thêm tài khoản', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2813, 0, 'vi', 'plugins/real-estate/account', 'edit', 'Sửa tài khoản', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2814, 0, 'vi', 'plugins/real-estate/account', 'name', 'Tài khoản', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2815, 0, 'vi', 'plugins/real-estate/account', 'form.email', 'Email', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2816, 0, 'vi', 'plugins/real-estate/account', 'form.password', 'Mật khẩu', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2817, 0, 'vi', 'plugins/real-estate/account', 'form.password_confirmation', 'Xác nhận mật khẩu', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2818, 0, 'vi', 'plugins/real-estate/account', 'form.change_password', 'Đổi mật khẩu', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2819, 0, 'vi', 'plugins/real-estate/account', 'forgot_password', 'Quên mật khẩu', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2820, 0, 'vi', 'plugins/real-estate/account', 'login', 'Đăng nhập', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2821, 0, 'vi', 'plugins/real-estate/account', 'buy_credits', 'Mua tín dụng', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2822, 0, 'vi', 'plugins/real-estate/account', 'credits', 'tín dụng', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2823, 0, 'vi', 'plugins/real-estate/account', 'account_settings', 'Cài đặt tài khoản', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2824, 0, 'vi', 'plugins/real-estate/account', 'update_profile_success', 'Cập nhật thông tin tài khoản thành công!', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2825, 0, 'vi', 'plugins/real-estate/account', 'security', 'Bảo mật', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2826, 0, 'vi', 'plugins/real-estate/account', 'packages', 'Gói', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2827, 0, 'vi', 'plugins/real-estate/account', 'transactions', 'Giao dịch', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2828, 0, 'vi', 'plugins/real-estate/account', 'subscribe_package', 'Đăng ký gói \":name\"', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2829, 0, 'vi', 'plugins/real-estate/category', 'name', 'Categories', '2021-12-31 22:02:31', '2021-12-31 22:02:47'),
(2830, 0, 'vi', 'plugins/real-estate/category', 'create', 'New category', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2831, 0, 'vi', 'plugins/real-estate/category', 'edit', 'Edit category', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2832, 0, 'vi', 'plugins/real-estate/consult', 'name', 'Tư vấn', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2833, 0, 'vi', 'plugins/real-estate/consult', 'edit', 'Xem tư vấn', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2834, 0, 'vi', 'plugins/real-estate/consult', 'statuses.read', 'Đã đọc', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2835, 0, 'vi', 'plugins/real-estate/consult', 'statuses.unread', 'Chưa đọc', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2836, 0, 'vi', 'plugins/real-estate/consult', 'phone', 'Điện thoại', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2837, 0, 'vi', 'plugins/real-estate/consult', 'content', 'Chi tiết', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2838, 0, 'vi', 'plugins/real-estate/consult', 'consult_information', 'Nội dung yêu cầu tư vấn', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2839, 0, 'vi', 'plugins/real-estate/consult', 'email.header', 'Email', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2840, 0, 'vi', 'plugins/real-estate/consult', 'email.title', 'Yêu cầu tư vấn mới', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2841, 0, 'vi', 'plugins/real-estate/consult', 'email.success', 'Gửi yêu cầu tư vấn thành công!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2842, 0, 'vi', 'plugins/real-estate/consult', 'email.failed', 'Gửi yêu cầu tư vấn thất bại, vui lòng thử lại sau!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2843, 0, 'vi', 'plugins/real-estate/consult', 'form.name.required', 'Tên là bắt buộc', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2844, 0, 'vi', 'plugins/real-estate/consult', 'form.email.required', 'Email là bắt buộc', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2845, 0, 'vi', 'plugins/real-estate/consult', 'form.email.email', 'Địa chỉ email không hợp lệ', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2846, 0, 'vi', 'plugins/real-estate/consult', 'form.content.required', 'Nội dung là bắt buộc', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2847, 0, 'vi', 'plugins/real-estate/consult', 'form.g-recaptcha-response.required', 'Hãy xác minh không phải là robot trước khi gửi tin nhắn.', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2848, 0, 'vi', 'plugins/real-estate/consult', 'form.g-recaptcha-response.captcha', 'Bạn chưa xác minh không phải là robot thành công.', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2849, 0, 'vi', 'plugins/real-estate/consult', 'consult_sent_from', 'Yêu cầu tư vấn này được gửi từ', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2850, 0, 'vi', 'plugins/real-estate/consult', 'time', 'Thời gian', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2851, 0, 'vi', 'plugins/real-estate/consult', 'consult_id', 'Mã yêu cầu tư vấn', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2852, 0, 'vi', 'plugins/real-estate/consult', 'form_name', 'Tên', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2853, 0, 'vi', 'plugins/real-estate/consult', 'form_email', 'Email', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2854, 0, 'vi', 'plugins/real-estate/consult', 'form_phone', 'Điện thoại', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2855, 0, 'vi', 'plugins/real-estate/consult', 'mark_as_read', 'Đánh dấu đã đọc', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2856, 0, 'vi', 'plugins/real-estate/consult', 'mark_as_unread', 'Đánh dấu chưa đọc', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2857, 0, 'vi', 'plugins/real-estate/consult', 'new_consult_notice', 'Bạn có <span class=\"bold\">:count</span> yêu cầu tư vấn mới', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2858, 0, 'vi', 'plugins/real-estate/consult', 'view_all', 'Xem tất cả', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2859, 0, 'vi', 'plugins/real-estate/consult', 'project', 'Dự án', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2860, 0, 'vi', 'plugins/real-estate/consult', 'property', 'Nhà ở - Căn hộ', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2861, 0, 'vi', 'plugins/real-estate/currency', 'currencies', 'Tiền tệ', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2862, 0, 'vi', 'plugins/real-estate/currency', 'setting_description', 'Các loại tiền tệ được sử dụng trên website.', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2863, 0, 'vi', 'plugins/real-estate/currency', 'name', 'Tên', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2864, 0, 'vi', 'plugins/real-estate/currency', 'symbol', 'Ký hiệu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2865, 0, 'vi', 'plugins/real-estate/currency', 'number_of_decimals', 'Số thập phân', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2866, 0, 'vi', 'plugins/real-estate/currency', 'exchange_rate', 'Tỷ giá', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2867, 0, 'vi', 'plugins/real-estate/currency', 'is_prefix_symbol', 'Vị trí ký hiệu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2868, 0, 'vi', 'plugins/real-estate/currency', 'is_default', 'Mặc định?', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2869, 0, 'vi', 'plugins/real-estate/currency', 'remove', 'Xoá', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2870, 0, 'vi', 'plugins/real-estate/currency', 'new_currency', 'Thêm tiền tệ mới', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2871, 0, 'vi', 'plugins/real-estate/currency', 'save_settings', 'Lưu cài đặt', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2872, 0, 'vi', 'plugins/real-estate/currency', 'before_number', 'Trước số', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2873, 0, 'vi', 'plugins/real-estate/currency', 'after_number', 'Sau số', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2874, 0, 'vi', 'plugins/real-estate/dashboard', 'joined_on', 'Tham gia từ :date', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2875, 0, 'vi', 'plugins/real-estate/dashboard', 'dob', 'Ngày sinh :date', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2876, 0, 'vi', 'plugins/real-estate/dashboard', 'email', 'Email', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2877, 0, 'vi', 'plugins/real-estate/dashboard', 'email_or_username', 'Email/Tên đăng nhập', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2878, 0, 'vi', 'plugins/real-estate/dashboard', 'password', 'Mật khẩu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2879, 0, 'vi', 'plugins/real-estate/dashboard', 'password-confirmation', 'Xác nhận mật khẩu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2880, 0, 'vi', 'plugins/real-estate/dashboard', 'remember-me', 'Ghi nhớ tài khoản', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2881, 0, 'vi', 'plugins/real-estate/dashboard', 'login-title', 'Đăng nhập', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2882, 0, 'vi', 'plugins/real-estate/dashboard', 'login-cta', 'Đăng nhập', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2883, 0, 'vi', 'plugins/real-estate/dashboard', 'register-title', 'Đăng ký', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2884, 0, 'vi', 'plugins/real-estate/dashboard', 'register-cta', 'Đăng ký', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2885, 0, 'vi', 'plugins/real-estate/dashboard', 'forgot-password-cta', 'Quên mật khẩu?', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2886, 0, 'vi', 'plugins/real-estate/dashboard', 'name', 'Tên', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2887, 0, 'vi', 'plugins/real-estate/dashboard', 'reset-password-title', 'Khôi phục mật khẩu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2888, 0, 'vi', 'plugins/real-estate/dashboard', 'reset-password-cta', 'Khôi phục mật khẩu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2889, 0, 'vi', 'plugins/real-estate/dashboard', 'cancel-link', 'Hủy bỏ', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2890, 0, 'vi', 'plugins/real-estate/dashboard', 'logout-cta', 'Đăng xuất', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2891, 0, 'vi', 'plugins/real-estate/dashboard', 'header_profile_link', 'Tài khoản', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2892, 0, 'vi', 'plugins/real-estate/dashboard', 'header_settings_link', 'Cài đặt', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2893, 0, 'vi', 'plugins/real-estate/dashboard', 'header_logout_link', 'Đăng xuất', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2894, 0, 'vi', 'plugins/real-estate/dashboard', 'unknown_state', 'Không xác nhận được', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2895, 0, 'vi', 'plugins/real-estate/dashboard', 'close', 'Đóng', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2896, 0, 'vi', 'plugins/real-estate/dashboard', 'save', 'Lưu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2897, 0, 'vi', 'plugins/real-estate/dashboard', 'loading', 'Đang tải...', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2898, 0, 'vi', 'plugins/real-estate/dashboard', 'new_image', 'Ảnh mới', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2899, 0, 'vi', 'plugins/real-estate/dashboard', 'change_profile_image', 'Đổi ảnh đại diện', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2900, 0, 'vi', 'plugins/real-estate/dashboard', 'save_cropped_image_failed', 'Lưu hình ảnh không thành công!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2901, 0, 'vi', 'plugins/real-estate/dashboard', 'failed_to_crop_image', 'Có lỗi trong quá trình xử lý ảnh', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2902, 0, 'vi', 'plugins/real-estate/dashboard', 'failed_to_load_data', 'Lỗi tải dữ liệu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2903, 0, 'vi', 'plugins/real-estate/dashboard', 'read_image_failed', 'Đọc hình ảnh thất bại', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2904, 0, 'vi', 'plugins/real-estate/dashboard', 'update_avatar_success', 'Cập nhật ảnh đại diện thành công!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2905, 0, 'vi', 'plugins/real-estate/dashboard', 'change_avatar_description', 'Click lên ảnh để chỉnh sửa ảnh đại diện', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2906, 0, 'vi', 'plugins/real-estate/dashboard', 'notices.error', 'Lỗi!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2907, 0, 'vi', 'plugins/real-estate/dashboard', 'notices.success', 'Thành công!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2908, 0, 'vi', 'plugins/real-estate/dashboard', 'sidebar_title', 'Cài đặt cá nhân', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2909, 0, 'vi', 'plugins/real-estate/dashboard', 'sidebar_information', 'Thông tin tài khoản', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2910, 0, 'vi', 'plugins/real-estate/dashboard', 'sidebar_security', 'Bảo mật', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2911, 0, 'vi', 'plugins/real-estate/dashboard', 'sidebar_packages', 'Gói', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2912, 0, 'vi', 'plugins/real-estate/dashboard', 'sidebar_transactions', 'Giao dịch', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2913, 0, 'vi', 'plugins/real-estate/dashboard', 'account_field_title', 'Thông tin tài khoản', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2914, 0, 'vi', 'plugins/real-estate/dashboard', 'profile-picture', 'Ảnh đại diện', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2915, 0, 'vi', 'plugins/real-estate/dashboard', 'uploading', 'Đang tải lên...', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2916, 0, 'vi', 'plugins/real-estate/dashboard', 'phone', 'Điện thoại', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2917, 0, 'vi', 'plugins/real-estate/dashboard', 'first_name', 'Họ', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2918, 0, 'vi', 'plugins/real-estate/dashboard', 'last_name', 'Tên', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2919, 0, 'vi', 'plugins/real-estate/dashboard', 'description', 'Mô tả ngắn', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2920, 0, 'vi', 'plugins/real-estate/dashboard', 'description_placeholder', 'Mô tả đôi chút về bạn...', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2921, 0, 'vi', 'plugins/real-estate/dashboard', 'verified', 'Đã xác thực', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2922, 0, 'vi', 'plugins/real-estate/dashboard', 'verify_require_desc', 'Vui lòng xác nhận email theo liên kết chúng tôi đã gửi cho bạn.', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2923, 0, 'vi', 'plugins/real-estate/dashboard', 'birthday', 'Ngày sinh', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2924, 0, 'vi', 'plugins/real-estate/dashboard', 'year_lc', 'năm', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2925, 0, 'vi', 'plugins/real-estate/dashboard', 'month_lc', 'tháng', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2926, 0, 'vi', 'plugins/real-estate/dashboard', 'day_lc', 'ngày', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2927, 0, 'vi', 'plugins/real-estate/dashboard', 'gender', 'Giới tính', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2928, 0, 'vi', 'plugins/real-estate/dashboard', 'gender_male', 'Nam', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2929, 0, 'vi', 'plugins/real-estate/dashboard', 'gender_female', 'Nữ', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2930, 0, 'vi', 'plugins/real-estate/dashboard', 'gender_other', 'Khác', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2931, 0, 'vi', 'plugins/real-estate/dashboard', 'security_title', 'Bảo mật', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2932, 0, 'vi', 'plugins/real-estate/dashboard', 'packages_title', 'Gói', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2933, 0, 'vi', 'plugins/real-estate/dashboard', 'transactions_title', 'Giao dịch', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2934, 0, 'vi', 'plugins/real-estate/dashboard', 'current_password', 'Mật khẩu hiện tại', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2935, 0, 'vi', 'plugins/real-estate/dashboard', 'password_new', 'Mật khẩu mới', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2936, 0, 'vi', 'plugins/real-estate/dashboard', 'password_new_confirmation', 'Xác nhận mật khẩu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2937, 0, 'vi', 'plugins/real-estate/dashboard', 'password_update_btn', 'Cập nhật mật khẩu', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2938, 0, 'vi', 'plugins/real-estate/dashboard', 'activity_logs', 'Lịch sử hoạt động', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2939, 0, 'vi', 'plugins/real-estate/dashboard', 'oops', 'Oops!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2940, 0, 'vi', 'plugins/real-estate/dashboard', 'no_activity_logs', 'Chưa có hoạt động nào cả', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2941, 0, 'vi', 'plugins/real-estate/dashboard', 'actions.create_property', 'Tạo thành công \":name\"', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2942, 0, 'vi', 'plugins/real-estate/dashboard', 'actions.update_property', 'Cập nhật thành công \":name\"', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2943, 0, 'vi', 'plugins/real-estate/dashboard', 'actions.delete_property', 'Xóa thành công \":name\"', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2944, 0, 'vi', 'plugins/real-estate/dashboard', 'actions.update_setting', 'Cập nhật cài đặt thành công', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2945, 0, 'vi', 'plugins/real-estate/dashboard', 'actions.update_security', 'Cập nhật cài đặt thành công', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2946, 0, 'vi', 'plugins/real-estate/dashboard', 'actions.your_property_updated_by_admin', 'Tin \":name\" đã được cập nhật bởi quản trị viên', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2947, 0, 'vi', 'plugins/real-estate/dashboard', 'actions.changed_avatar', 'Đổi ảnh đại diện thành công', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2948, 0, 'vi', 'plugins/real-estate/dashboard', 'load_more', 'Tải thêm', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2949, 0, 'vi', 'plugins/real-estate/dashboard', 'loading_more', 'Đang tải...', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2950, 0, 'vi', 'plugins/real-estate/dashboard', 'back-to-login', 'Trở lại trang đăng nhập', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2951, 0, 'vi', 'plugins/real-estate/dashboard', 'no_transactions', 'Chưa có giao dịch', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2952, 0, 'vi', 'plugins/real-estate/dashboard', 'approved_properties', 'Tin đã được duyệt', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2953, 0, 'vi', 'plugins/real-estate/dashboard', 'pending_approve_properties', 'Các tin đang chờ xét duyệt', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2954, 0, 'vi', 'plugins/real-estate/dashboard', 'rejected_properties', 'Các tin đã bị từ chối', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2955, 0, 'vi', 'plugins/real-estate/dashboard', 'your_credits', 'Tín dụng của bạn', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2956, 0, 'vi', 'plugins/real-estate/dashboard', 'add_new', 'Thêm mới', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2957, 0, 'vi', 'plugins/real-estate/dashboard', 'credits', 'tín dụng', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2958, 0, 'vi', 'plugins/real-estate/dashboard', 'distance', 'Khoảng cách(km)', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2959, 0, 'vi', 'plugins/real-estate/dashboard', 'free', 'Miễn phí', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2960, 0, 'vi', 'plugins/real-estate/dashboard', 'per_post', 'trên mỗi tin', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2961, 0, 'vi', 'plugins/real-estate/dashboard', 'posts', 'tin', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2962, 0, 'vi', 'plugins/real-estate/dashboard', 'purchase', 'Mua', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2963, 0, 'vi', 'plugins/real-estate/dashboard', 'select_facility', 'Lựa chọn tiện ích', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2964, 0, 'vi', 'plugins/real-estate/dashboard', 'total', 'Tổng cộng', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2965, 0, 'vi', 'plugins/real-estate/dashboard', 'error', 'Lỗi!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2966, 0, 'vi', 'plugins/real-estate/dashboard', 'success', 'Thành công!', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2967, 0, 'vi', 'plugins/real-estate/facility', 'name', 'Facilities', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2968, 0, 'vi', 'plugins/real-estate/facility', 'create', 'New facility', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2969, 0, 'vi', 'plugins/real-estate/facility', 'edit', 'Edit facility', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2970, 0, 'vi', 'plugins/real-estate/feature', 'name', 'Tiện ích', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2971, 0, 'vi', 'plugins/real-estate/feature', 'create', 'Thêm tiện ích', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2972, 0, 'vi', 'plugins/real-estate/feature', 'edit', 'Sửa tiện ích', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2973, 0, 'vi', 'plugins/real-estate/feature', 'messages.request.name_required', 'Tên là thông tin bắt buộc', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2974, 0, 'vi', 'plugins/real-estate/feature', 'form.help_block', 'Thông tin về các tiện ích', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2975, 0, 'vi', 'plugins/real-estate/feature', 'form.name', 'Tiêu đề', '2021-12-31 22:02:32', '2021-12-31 22:02:47'),
(2976, 0, 'vi', 'plugins/real-estate/investor', 'name', 'Nhà đầu tư', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2977, 0, 'vi', 'plugins/real-estate/investor', 'create', 'Thêm nhà đầu tư', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2978, 0, 'vi', 'plugins/real-estate/investor', 'edit', 'Sửa nhà đầu tư', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2979, 0, 'vi', 'plugins/real-estate/package', 'name', 'Gói', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2980, 0, 'vi', 'plugins/real-estate/package', 'create', 'Thêm gói', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2981, 0, 'vi', 'plugins/real-estate/package', 'edit', 'Sửa gói', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2982, 0, 'vi', 'plugins/real-estate/package', 'price', 'Giá', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2983, 0, 'vi', 'plugins/real-estate/package', 'currency', 'Tiền tệ', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2984, 0, 'vi', 'plugins/real-estate/package', 'percent_save', 'Phần trăm tiết kiệm', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2985, 0, 'vi', 'plugins/real-estate/package', 'number_of_listings', 'Số tin đăng', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2986, 0, 'vi', 'plugins/real-estate/package', 'add_credit_success', 'Thêm tín dụng thành công!', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2987, 0, 'vi', 'plugins/real-estate/package', 'setup_payment_methods', 'Vui lòng thiết lập phương thức thanh toán (PayPal, Stripe, COD, Bank transfer)', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2988, 0, 'vi', 'plugins/real-estate/package', 'add_credit_warning', 'Vui lòng thêm tín dụng để đăng tin của bạn tại đây', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2989, 0, 'vi', 'plugins/real-estate/package', 'add_credit', 'Thêm tín dụng', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2990, 0, 'vi', 'plugins/real-estate/package', 'account_limit', 'Giới hạn số gói có thể mua theo tài khoản', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2991, 0, 'vi', 'plugins/real-estate/package', 'account_limit_placeholder', 'Mỗi tài khoản có thể mua x lần', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2992, 0, 'vi', 'plugins/real-estate/package', 'subscribe_package', 'Đăng ký tin', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2993, 0, 'vi', 'plugins/real-estate/project', 'name', 'Dự án', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2994, 0, 'vi', 'plugins/real-estate/project', 'create', 'Thêm dự án', '2021-12-31 22:02:32', '2021-12-31 22:02:48'),
(2995, 0, 'vi', 'plugins/real-estate/project', 'edit', 'Sửa', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(2996, 0, 'vi', 'plugins/real-estate/project', 'form.general_info', 'Thông tin chung', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(2997, 0, 'vi', 'plugins/real-estate/project', 'form.name', 'Tên dự án', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(2998, 0, 'vi', 'plugins/real-estate/project', 'form.description', 'Mô tả', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(2999, 0, 'vi', 'plugins/real-estate/project', 'form.basic_info', 'Thông tin cơ bản', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3000, 0, 'vi', 'plugins/real-estate/project', 'form.location', 'Địa chỉ', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3001, 0, 'vi', 'plugins/real-estate/project', 'form.investor', 'Chủ đầu tư', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3002, 0, 'vi', 'plugins/real-estate/project', 'form.number_block', 'Số block', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3003, 0, 'vi', 'plugins/real-estate/project', 'form.number_floor', 'Số tầng', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3004, 0, 'vi', 'plugins/real-estate/project', 'form.number_flat', 'Số căn hộ', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3005, 0, 'vi', 'plugins/real-estate/project', 'form.date_finish', 'Ngày hoàn thành', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3006, 0, 'vi', 'plugins/real-estate/project', 'form.date_sell', 'Ngày mở bán', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3007, 0, 'vi', 'plugins/real-estate/project', 'form.images', 'Hình ảnh', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3008, 0, 'vi', 'plugins/real-estate/project', 'form.price_from', 'Giá thấp nhất', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3009, 0, 'vi', 'plugins/real-estate/project', 'form.price_to', 'Giá cao nhất', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3010, 0, 'vi', 'plugins/real-estate/project', 'form.currency', 'Loại tiền', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3011, 0, 'vi', 'plugins/real-estate/project', 'form.city', 'Thành phố', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3012, 0, 'vi', 'plugins/real-estate/project', 'form.category', 'Loại dự án', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3013, 0, 'vi', 'plugins/real-estate/project', 'statuses.not_available', 'Không khả dụng', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3014, 0, 'vi', 'plugins/real-estate/project', 'statuses.pre_sale', 'Chuẩn bị mở bán', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3015, 0, 'vi', 'plugins/real-estate/project', 'statuses.selling', 'Đang bán', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3016, 0, 'vi', 'plugins/real-estate/project', 'statuses.sold', 'Đã bán', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3017, 0, 'vi', 'plugins/real-estate/project', 'statuses.building', 'Đang xây dựng', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3018, 0, 'vi', 'plugins/real-estate/property', 'name', 'Nhà - Căn hộ', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3019, 0, 'vi', 'plugins/real-estate/property', 'create', 'Thêm mới', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3020, 0, 'vi', 'plugins/real-estate/property', 'edit', 'Sửa', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3021, 0, 'vi', 'plugins/real-estate/property', 'form.main_info', 'Thông tin', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3022, 0, 'vi', 'plugins/real-estate/property', 'form.basic_info', 'Thông tin cơ bản', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3023, 0, 'vi', 'plugins/real-estate/property', 'form.name', 'Tiêu đề', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3024, 0, 'vi', 'plugins/real-estate/property', 'form.type', 'Loại', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3025, 0, 'vi', 'plugins/real-estate/property', 'form.images', 'Hình ảnh', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3026, 0, 'vi', 'plugins/real-estate/property', 'form.location', 'Địa chỉ', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3027, 0, 'vi', 'plugins/real-estate/property', 'form.number_bedroom', 'Số phòng ngủ', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3028, 0, 'vi', 'plugins/real-estate/property', 'form.number_bathroom', 'Số phòng tắm', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3029, 0, 'vi', 'plugins/real-estate/property', 'form.number_floor', 'Số tầng', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3030, 0, 'vi', 'plugins/real-estate/property', 'form.square', 'Diện tích (m2)', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3031, 0, 'vi', 'plugins/real-estate/property', 'form.price', 'Giá', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3032, 0, 'vi', 'plugins/real-estate/property', 'form.features', 'Tiện ích', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3033, 0, 'vi', 'plugins/real-estate/property', 'form.project', 'Dự án', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3034, 0, 'vi', 'plugins/real-estate/property', 'form.date', 'Thông tin thời gian', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3035, 0, 'vi', 'plugins/real-estate/property', 'form.currency', 'Loại tiền', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3036, 0, 'vi', 'plugins/real-estate/property', 'form.city', 'Thành phố', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3037, 0, 'vi', 'plugins/real-estate/property', 'form.period', 'Chu kỳ', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3038, 0, 'vi', 'plugins/real-estate/property', 'form.category', 'Loại nhà', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3039, 0, 'vi', 'plugins/real-estate/property', 'form.images_upload_placeholder', 'Kéo thả tập tin vào đây hoặc click để thêm tập tin.', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3040, 0, 'vi', 'plugins/real-estate/property', 'statuses.not_available', 'Không khả dụng', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3041, 0, 'vi', 'plugins/real-estate/property', 'statuses.pre_sale', 'Chuẩn bị mở bán', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3042, 0, 'vi', 'plugins/real-estate/property', 'statuses.selling', 'Đang bán', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3043, 0, 'vi', 'plugins/real-estate/property', 'statuses.sold', 'Đã bán', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3044, 0, 'vi', 'plugins/real-estate/property', 'statuses.renting', 'Đang mở thuê', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3045, 0, 'vi', 'plugins/real-estate/property', 'statuses.rented', 'Đã cho thuê', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3046, 0, 'vi', 'plugins/real-estate/property', 'statuses.building', 'Đang xây dựng', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3047, 0, 'vi', 'plugins/real-estate/property', 'types.sale', 'Nhà bán', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3048, 0, 'vi', 'plugins/real-estate/property', 'types.rent', 'Nhà cho thuê', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3049, 0, 'vi', 'plugins/real-estate/property', 'periods.day', 'Ngày', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3050, 0, 'vi', 'plugins/real-estate/property', 'periods.month', 'Tháng', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3051, 0, 'vi', 'plugins/real-estate/property', 'periods.year', 'Năm', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3052, 0, 'vi', 'plugins/real-estate/property', 'moderation_status', 'Trạng thái kiểm duyệt', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3053, 0, 'vi', 'plugins/real-estate/property', 'expire_date', 'Ngày hết hạn', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3054, 0, 'vi', 'plugins/real-estate/real-estate', 'name', 'Bất động sản', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3055, 0, 'vi', 'plugins/real-estate/real-estate', 'settings', 'Cài đặt', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3056, 0, 'vi', 'plugins/real-estate/settings', 'title', 'Accounts', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3057, 0, 'vi', 'plugins/real-estate/settings', 'description', 'Settings for members', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3058, 0, 'vi', 'plugins/real-estate/settings', 'verify_account_email', 'Verify account\'s email?', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3059, 0, 'en', 'plugins/social-login/social-login', 'settings.title', 'Social Login settings', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3060, 0, 'en', 'plugins/social-login/social-login', 'settings.description', 'Configure social login options', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3061, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.title', 'Facebook login settings', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3062, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.description', 'Enable/disable & configure app credentials for Facebook login', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3063, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_id', 'App ID', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3064, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.app_secret', 'App Secret', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3065, 0, 'en', 'plugins/social-login/social-login', 'settings.facebook.helper', 'Please go to https://developers.facebook.com to create new app update App ID, App Secret. Callback URL is :callback', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3066, 0, 'en', 'plugins/social-login/social-login', 'settings.google.title', 'Google login settings', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3067, 0, 'en', 'plugins/social-login/social-login', 'settings.google.description', 'Enable/disable & configure app credentials for Google login', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3068, 0, 'en', 'plugins/social-login/social-login', 'settings.google.app_id', 'App ID', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3069, 0, 'en', 'plugins/social-login/social-login', 'settings.google.app_secret', 'App Secret', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3070, 0, 'en', 'plugins/social-login/social-login', 'settings.google.helper', 'Please go to https://console.developers.google.com/apis/dashboard to create new app update App ID, App Secret. Callback URL is :callback', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3071, 0, 'en', 'plugins/social-login/social-login', 'settings.github.title', 'Github login settings', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3072, 0, 'en', 'plugins/social-login/social-login', 'settings.github.description', 'Enable/disable & configure app credentials for Github login', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3073, 0, 'en', 'plugins/social-login/social-login', 'settings.github.app_id', 'App ID', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3074, 0, 'en', 'plugins/social-login/social-login', 'settings.github.app_secret', 'App Secret', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3075, 0, 'en', 'plugins/social-login/social-login', 'settings.github.helper', 'Please go to https://github.com/settings/developers to create new app update App ID, App Secret. Callback URL is :callback', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3076, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.title', 'Linkedin login settings', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3077, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.description', 'Enable/disable & configure app credentials for Linkedin login', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3078, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_id', 'App ID', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3079, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.app_secret', 'App Secret', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3080, 0, 'en', 'plugins/social-login/social-login', 'settings.linkedin.helper', 'Please go to https://www.linkedin.com/developers/apps/new to create new app update App ID, App Secret. Callback URL is :callback', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3081, 0, 'en', 'plugins/social-login/social-login', 'settings.enable', 'Enable?', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3082, 0, 'en', 'plugins/social-login/social-login', 'menu', 'Social Login', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3083, 0, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3084, 0, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3085, 0, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to the resources/lang file, using \'php artisan cms:translations:export\' command or publish button.', '2021-12-31 22:02:33', '2021-12-31 22:02:48');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(3086, 0, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3087, 0, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3088, 0, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3089, 0, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3090, 0, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3091, 0, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3092, 0, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3093, 0, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3094, 0, 'en', 'plugins/translation/translation', 'back', 'Back', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3095, 0, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3096, 0, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3097, 0, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3098, 0, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3099, 0, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3100, 0, 'en', 'plugins/translation/translation', 'admin-translations', 'Other translations', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3101, 0, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3102, 0, 'en', 'plugins/translation/translation', 'to', 'to', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3103, 0, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3104, 0, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3105, 0, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3106, 0, 'en', 'plugins/translation/translation', 'locale_placeholder', 'Ex: en', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3107, 0, 'en', 'plugins/translation/translation', 'name', 'Name', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3108, 0, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3109, 0, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3110, 0, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3111, 0, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3112, 0, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3113, 0, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3114, 0, 'en', 'plugins/translation/translation', 'folder_is_not_writeable', 'Cannot write files! Folder /resources/lang is not writable. Please chmod to make it writable!', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3115, 0, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3116, 0, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in /resources/lang!', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3117, 0, 'en', 'plugins/translation/translation', 'download', 'Download', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3118, 0, 'en', 'plugins/translation/translation', 'select_locale', 'Select locale', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3119, 0, 'en', 'plugins/translation/translation', 'theme_translations_instruction', 'Click on text to translate. Do NOT translate variables, Eg. :username, :query, :link...', '2021-12-31 22:02:33', '2021-12-31 22:02:48'),
(3120, 0, 'vi', 'auth', 'failed', 'Không tìm thấy thông tin đăng nhập hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3121, 0, 'vi', 'auth', 'throttle', 'Đăng nhập không đúng quá nhiều lần. Vui lòng thử lại sau :seconds giây.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3122, 0, 'vi', 'auth', 'password', 'Mật khẩu không chính xác', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3123, 0, 'vi', 'pagination', 'previous', '&laquo; Trước', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3124, 0, 'vi', 'pagination', 'next', 'Sau &raquo;', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3125, 0, 'vi', 'passwords', 'reset', 'Mật khẩu đã được cập nhật!', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3126, 0, 'vi', 'passwords', 'sent', 'Chúng tôi đã gửi cho bạn đường dẫn thay đổi mật khẩu!', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3127, 0, 'vi', 'passwords', 'token', 'Mã xác nhận mật khẩu không hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3128, 0, 'vi', 'passwords', 'user', 'Không tìm thấy thành viên với địa chỉ email này.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3129, 0, 'vi', 'validation', 'accepted', 'Trường :attribute phải được chấp nhận.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3130, 0, 'vi', 'validation', 'active_url', 'Trường :attribute không phải là một URL hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3131, 0, 'vi', 'validation', 'after', 'Trường :attribute phải là một ngày sau ngày :date.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3132, 0, 'vi', 'validation', 'after_or_equal', 'Trường :attribute phải là thời gian bắt đầu sau hoặc đúng bằng :date.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3133, 0, 'vi', 'validation', 'alpha', 'Trường :attribute chỉ có thể chứa các chữ cái.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3134, 0, 'vi', 'validation', 'alpha_dash', 'Trường :attribute chỉ có thể chứa chữ cái, số và dấu gạch ngang.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3135, 0, 'vi', 'validation', 'alpha_num', 'Trường :attribute chỉ có thể chứa chữ cái và số.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3136, 0, 'vi', 'validation', 'array', 'Trường :attribute phải là dạng mảng.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3137, 0, 'vi', 'validation', 'before', 'Trường :attribute phải là một ngày trước ngày :date.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3138, 0, 'vi', 'validation', 'before_or_equal', 'Trường :attribute phải là thời gian bắt đầu trước hoặc đúng bằng :date.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3139, 0, 'vi', 'validation', 'between.array', 'Trường :attribute phải có từ :min - :max phần tử.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3140, 0, 'vi', 'validation', 'between.file', 'Dung lượng tập tin trong trường :attribute phải từ :min - :max kB.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3141, 0, 'vi', 'validation', 'between.numeric', 'Trường :attribute phải nằm trong khoảng :min - :max.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3142, 0, 'vi', 'validation', 'between.string', 'Trường :attribute phải từ :min - :max kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3143, 0, 'vi', 'validation', 'boolean', 'Trường :attribute phải là true hoặc false.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3144, 0, 'vi', 'validation', 'confirmed', 'Giá trị xác nhận trong trường :attribute không khớp.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3145, 0, 'vi', 'validation', 'date', 'Trường :attribute không phải là định dạng của ngày-tháng.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3146, 0, 'vi', 'validation', 'date_equals', 'Trường :attribute phải là một ngày bằng với :date.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3147, 0, 'vi', 'validation', 'date_format', 'Trường :attribute không giống với định dạng :format.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3148, 0, 'vi', 'validation', 'different', 'Trường :attribute và :other phải khác nhau.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3149, 0, 'vi', 'validation', 'digits', 'Độ dài của trường :attribute phải gồm :digits chữ số.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3150, 0, 'vi', 'validation', 'digits_between', 'Độ dài của trường :attribute phải nằm trong khoảng :min and :max chữ số.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3151, 0, 'vi', 'validation', 'dimensions', 'Trường :attribute có kích thước không hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3152, 0, 'vi', 'validation', 'distinct', 'Trường :attribute có giá trị trùng lặp.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3153, 0, 'vi', 'validation', 'email', 'Trường :attribute phải là một địa chỉ email hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3154, 0, 'vi', 'validation', 'ends_with', 'Trường :attribute phải kết thúc bằng một trong những giá trị sau: :values', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3155, 0, 'vi', 'validation', 'exists', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3156, 0, 'vi', 'validation', 'file', 'Trường :attribute phải là một tệp tin.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3157, 0, 'vi', 'validation', 'filled', 'Trường :attribute không được bỏ trống.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3158, 0, 'vi', 'validation', 'gt.array', 'Mảng :attribute phải có nhiều hơn :value phần tử.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3159, 0, 'vi', 'validation', 'gt.file', 'Dung lượng trường :attribute phải lớn hơn :value kilobytes.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3160, 0, 'vi', 'validation', 'gt.numeric', 'Giá trị trường :attribute phải lớn hơn :value.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3161, 0, 'vi', 'validation', 'gt.string', 'Độ dài trường :attribute phải nhiều hơn :value kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3162, 0, 'vi', 'validation', 'gte.array', 'Mảng :attribute phải có ít nhất :value phần tử.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3163, 0, 'vi', 'validation', 'gte.file', 'Dung lượng trường :attribute phải lớn hơn hoặc bằng :value kilobytes.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3164, 0, 'vi', 'validation', 'gte.numeric', 'Giá trị trường :attribute phải lớn hơn hoặc bằng :value.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3165, 0, 'vi', 'validation', 'gte.string', 'Độ dài trường :attribute phải lớn hơn hoặc bằng :value kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3166, 0, 'vi', 'validation', 'image', 'Trường :attribute phải là định dạng hình ảnh.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3167, 0, 'vi', 'validation', 'in', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3168, 0, 'vi', 'validation', 'in_array', 'Trường :attribute phải thuộc tập cho phép: :other.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3169, 0, 'vi', 'validation', 'integer', 'Trường :attribute phải là một số nguyên.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3170, 0, 'vi', 'validation', 'ip', 'Trường :attribute phải là một địa chỉ IP.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3171, 0, 'vi', 'validation', 'ipv4', 'Trường :attribute phải là một địa chỉ IPv4.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3172, 0, 'vi', 'validation', 'ipv6', 'Trường :attribute phải là một địa chỉ IPv6.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3173, 0, 'vi', 'validation', 'json', 'Trường :attribute phải là một chuỗi JSON.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3174, 0, 'vi', 'validation', 'lt.array', 'Mảng :attribute phải có ít hơn :value phần tử.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3175, 0, 'vi', 'validation', 'lt.file', 'Dung lượng trường :attribute phải nhỏ hơn :value kilobytes.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3176, 0, 'vi', 'validation', 'lt.numeric', 'Giá trị trường :attribute phải nhỏ hơn :value.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3177, 0, 'vi', 'validation', 'lt.string', 'Độ dài trường :attribute phải nhỏ hơn :value kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3178, 0, 'vi', 'validation', 'lte.array', 'Mảng :attribute không được có nhiều hơn :value phần tử.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3179, 0, 'vi', 'validation', 'lte.file', 'Dung lượng trường :attribute phải nhỏ hơn hoặc bằng :value kilobytes.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3180, 0, 'vi', 'validation', 'lte.numeric', 'Giá trị trường :attribute phải nhỏ hơn hoặc bằng :value.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3181, 0, 'vi', 'validation', 'lte.string', 'Độ dài trường :attribute phải nhỏ hơn hoặc bằng :value kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3182, 0, 'vi', 'validation', 'max.array', 'Trường :attribute không được lớn hơn :max phần tử.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3183, 0, 'vi', 'validation', 'max.file', 'Dung lượng tập tin trong trường :attribute không được lớn hơn :max kB.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3184, 0, 'vi', 'validation', 'max.numeric', 'Trường :attribute không được lớn hơn :max.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3185, 0, 'vi', 'validation', 'max.string', 'Trường :attribute không được lớn hơn :max kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3186, 0, 'vi', 'validation', 'mimes', 'Trường :attribute phải là một tập tin có định dạng: :values.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3187, 0, 'vi', 'validation', 'mimetypes', 'Trường :attribute phải là một tập tin có định dạng: :values.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3188, 0, 'vi', 'validation', 'min.array', 'Trường :attribute phải có tối thiểu :min phần tử.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3189, 0, 'vi', 'validation', 'min.file', 'Dung lượng tập tin trong trường :attribute phải tối thiểu :min kB.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3190, 0, 'vi', 'validation', 'min.numeric', 'Trường :attribute phải tối thiểu là :min.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3191, 0, 'vi', 'validation', 'min.string', 'Trường :attribute phải có tối thiểu :min kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3192, 0, 'vi', 'validation', 'multiple_of', 'Trường :attribute phải là bội số của :value', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3193, 0, 'vi', 'validation', 'not_in', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3194, 0, 'vi', 'validation', 'not_regex', 'Trường :attribute có định dạng không hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3195, 0, 'vi', 'validation', 'numeric', 'Trường :attribute phải là một số.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3196, 0, 'vi', 'validation', 'password', 'Mật khẩu không đúng.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3197, 0, 'vi', 'validation', 'present', 'Trường :attribute phải được cung cấp.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3198, 0, 'vi', 'validation', 'prohibited', 'Trường :attribute bị cấm.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3199, 0, 'vi', 'validation', 'prohibited_if', 'Trường :attribute bị cấm khi :other là :value.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3200, 0, 'vi', 'validation', 'prohibited_unless', 'Trường :attribute bị cấm trừ khi :other là một trong :values.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3201, 0, 'vi', 'validation', 'regex', 'Trường :attribute có định dạng không hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3202, 0, 'vi', 'validation', 'required', 'Trường :attribute không được bỏ trống.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3203, 0, 'vi', 'validation', 'required_if', 'Trường :attribute không được bỏ trống khi trường :other là :value.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3204, 0, 'vi', 'validation', 'required_unless', 'Trường :attribute không được bỏ trống trừ khi :other là :values.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3205, 0, 'vi', 'validation', 'required_with', 'Trường :attribute không được bỏ trống khi một trong :values có giá trị.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3206, 0, 'vi', 'validation', 'required_with_all', 'Trường :attribute không được bỏ trống khi tất cả :values có giá trị.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3207, 0, 'vi', 'validation', 'required_without', 'Trường :attribute không được bỏ trống khi một trong :values không có giá trị.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3208, 0, 'vi', 'validation', 'required_without_all', 'Trường :attribute không được bỏ trống khi tất cả :values không có giá trị.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3209, 0, 'vi', 'validation', 'same', 'Trường :attribute và :other phải giống nhau.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3210, 0, 'vi', 'validation', 'size.array', 'Trường :attribute phải chứa :size phần tử.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3211, 0, 'vi', 'validation', 'size.file', 'Dung lượng tập tin trong trường :attribute phải bằng :size kB.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3212, 0, 'vi', 'validation', 'size.numeric', 'Trường :attribute phải bằng :size.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3213, 0, 'vi', 'validation', 'size.string', 'Trường :attribute phải chứa :size kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3214, 0, 'vi', 'validation', 'starts_with', 'Trường :attribute phải được bắt đầu bằng một trong những giá trị sau: :values', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3215, 0, 'vi', 'validation', 'string', 'Trường :attribute phải là một chuỗi kí tự.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3216, 0, 'vi', 'validation', 'timezone', 'Trường :attribute phải là một múi giờ hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3217, 0, 'vi', 'validation', 'unique', 'Trường :attribute đã có trong cơ sở dữ liệu.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3218, 0, 'vi', 'validation', 'uploaded', 'Trường :attribute tải lên thất bại.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3219, 0, 'vi', 'validation', 'url', 'Trường :attribute không giống với định dạng một URL.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3220, 0, 'vi', 'validation', 'uuid', 'Trường :attribute phải là một chuỗi UUID hợp lệ.', '2021-12-31 22:02:33', '2021-12-31 22:02:45'),
(3221, 0, 'vi', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-12-31 22:02:33', '2021-12-31 22:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `permissions`, `last_login`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`) VALUES
(1, 'admin@botble.com', NULL, '$2y$10$YgNlxc.FdD3.DhqtnJtWbewoTZdc.13pcwopFmbGrmd31OOP4QO1e', 'qe9rJJR533jVSzevATK4Dqw3ddWSU2WewXuxHIprfFcQu038dIyxkGwTRbSC', '2021-12-09 21:25:34', '2022-01-10 07:43:11', NULL, '2022-01-10 07:43:11', 'System', 'Admin', 'botble', 1493, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_meta`
--

INSERT INTO `user_meta` (`id`, `key`, `value`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'admin-locale', 'en', 1, '2019-11-17 20:19:14', '2019-11-30 19:25:04');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(20, 'CustomMenuWidget', 'footer_sidebar', 'flex-home', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"About\",\"menu_id\":\"about\"}', '2019-11-17 22:09:57', '2019-11-17 22:09:57'),
(21, 'CustomMenuWidget', 'footer_sidebar', 'flex-home', 1, '{\"id\":\"CustomMenuWidget\",\"name\":\"More information\",\"menu_id\":\"more-information\"}', '2019-11-17 22:09:57', '2019-11-17 22:09:57'),
(22, 'CustomMenuWidget', 'footer_sidebar', 'flex-home', 2, '{\"id\":\"CustomMenuWidget\",\"name\":\"News\",\"menu_id\":\"news\"}', '2019-11-17 22:09:57', '2019-11-17 22:09:57'),
(24, 'CategoriesWidget', 'primary_sidebar', 'flex-home', 0, '{\"id\":\"CategoriesWidget\",\"name\":\"Categories\"}', '2019-11-18 03:50:44', '2019-11-18 03:50:44'),
(25, 'RecentPostsWidget', 'primary_sidebar', 'flex-home', 1, '{\"id\":\"RecentPostsWidget\",\"name\":\"Recent posts\",\"number_display\":\"5\"}', '2019-11-18 03:50:45', '2019-11-18 03:50:45'),
(30, 'CategoriesWidget', 'primary_sidebar', 'flex-home-vi', 0, '{\"id\":\"CategoriesWidget\",\"name\":\"Chuy\\u00ean m\\u1ee5c\"}', '2019-11-21 07:53:12', '2019-11-21 07:53:12'),
(31, 'RecentPostsWidget', 'primary_sidebar', 'flex-home-vi', 1, '{\"id\":\"RecentPostsWidget\",\"name\":\"B\\u00e0i vi\\u1ebft m\\u1edbi nh\\u1ea5t\",\"number_display\":\"5\"}', '2019-11-21 07:53:12', '2019-11-21 07:53:12'),
(41, 'CustomMenuWidget', 'footer_sidebar', 'flex-home-vi', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"Gi\\u1edbi thi\\u1ec7u\",\"menu_id\":\"ve-chung-toi\"}', '2019-11-21 07:53:51', '2019-11-21 07:53:51'),
(42, 'CustomMenuWidget', 'footer_sidebar', 'flex-home-vi', 1, '{\"id\":\"CustomMenuWidget\",\"name\":\" Th\\u00f4ng tin th\\u00eam\",\"menu_id\":\"thong-tin-them\"}', '2019-11-21 07:53:51', '2019-11-21 07:53:51'),
(43, 'CustomMenuWidget', 'footer_sidebar', 'flex-home-vi', 2, '{\"id\":\"CustomMenuWidget\",\"name\":\"Tin t\\u1ee9c\",\"menu_id\":\"tin-tuc\"}', '2019-11-21 07:53:51', '2019-11-21 07:53:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `bb_comments`
--
ALTER TABLE `bb_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bb_comment_likes`
--
ALTER TABLE `bb_comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_comment_likes_comment_id_index` (`comment_id`),
  ADD KEY `bb_comment_likes_user_id_index` (`user_id`);

--
-- Indexes for table `bb_comment_ratings`
--
ALTER TABLE `bb_comment_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_comment_ratings_user_id_index` (`user_id`);

--
-- Indexes for table `bb_comment_recommends`
--
ALTER TABLE `bb_comment_recommends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bb_comment_recommends_user_id_index` (`user_id`);

--
-- Indexes for table `bb_comment_users`
--
ALTER TABLE `bb_comment_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers_translations`
--
ALTER TABLE `careers_translations`
  ADD PRIMARY KEY (`lang_code`,`careers_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_translations`
--
ALTER TABLE `categories_translations`
  ADD PRIMARY KEY (`lang_code`,`categories_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cities_slug_unique` (`slug`);

--
-- Indexes for table `cities_translations`
--
ALTER TABLE `cities_translations`
  ADD PRIMARY KEY (`lang_code`,`cities_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries_translations`
--
ALTER TABLE `countries_translations`
  ADD PRIMARY KEY (`lang_code`,`countries_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`lang_id`);

--
-- Indexes for table `language_meta`
--
ALTER TABLE `language_meta`
  ADD PRIMARY KEY (`lang_meta_id`),
  ADD KEY `language_meta_lang_meta_content_id_index` (`reference_id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `menu_nodes_related_id_index` (`reference_id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_content_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_user_id_index` (`user_id`),
  ADD KEY `notes_reference_id_index` (`reference_id`),
  ADD KEY `notes_created_by_index` (`created_by`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_translations`
--
ALTER TABLE `pages_translations`
  ADD PRIMARY KEY (`lang_code`,`pages_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts_translations`
--
ALTER TABLE `posts_translations`
  ADD PRIMARY KEY (`lang_code`,`posts_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `re_accounts`
--
ALTER TABLE `re_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`),
  ADD UNIQUE KEY `re_accounts_username_unique` (`username`);

--
-- Indexes for table `re_account_activity_logs`
--
ALTER TABLE `re_account_activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_account_packages`
--
ALTER TABLE `re_account_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_account_password_resets`
--
ALTER TABLE `re_account_password_resets`
  ADD KEY `vendor_password_resets_email_index` (`email`),
  ADD KEY `vendor_password_resets_token_index` (`token`);

--
-- Indexes for table `re_categories`
--
ALTER TABLE `re_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_categories_translations`
--
ALTER TABLE `re_categories_translations`
  ADD PRIMARY KEY (`lang_code`,`re_categories_id`);

--
-- Indexes for table `re_consults`
--
ALTER TABLE `re_consults`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_currencies`
--
ALTER TABLE `re_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_facilities`
--
ALTER TABLE `re_facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_facilities_distances`
--
ALTER TABLE `re_facilities_distances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_facilities_translations`
--
ALTER TABLE `re_facilities_translations`
  ADD PRIMARY KEY (`lang_code`,`re_facilities_id`);

--
-- Indexes for table `re_features`
--
ALTER TABLE `re_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_features_translations`
--
ALTER TABLE `re_features_translations`
  ADD PRIMARY KEY (`lang_code`,`re_features_id`);

--
-- Indexes for table `re_investors`
--
ALTER TABLE `re_investors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_packages`
--
ALTER TABLE `re_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_projects`
--
ALTER TABLE `re_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_projects_translations`
--
ALTER TABLE `re_projects_translations`
  ADD PRIMARY KEY (`lang_code`,`re_projects_id`);

--
-- Indexes for table `re_project_categories`
--
ALTER TABLE `re_project_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_properties`
--
ALTER TABLE `re_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_properties_translations`
--
ALTER TABLE `re_properties_translations`
  ADD PRIMARY KEY (`lang_code`,`re_properties_id`);

--
-- Indexes for table `re_property_categories`
--
ALTER TABLE `re_property_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `re_tags`
--
ALTER TABLE `re_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states_translations`
--
ALTER TABLE `states_translations`
  ADD PRIMARY KEY (`lang_code`,`states_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags_translations`
--
ALTER TABLE `tags_translations`
  ADD PRIMARY KEY (`lang_code`,`tags_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bb_comments`
--
ALTER TABLE `bb_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=754;

--
-- AUTO_INCREMENT for table `bb_comment_likes`
--
ALTER TABLE `bb_comment_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `bb_comment_ratings`
--
ALTER TABLE `bb_comment_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bb_comment_recommends`
--
ALTER TABLE `bb_comment_recommends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bb_comment_users`
--
ALTER TABLE `bb_comment_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `lang_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `language_meta`
--
ALTER TABLE `language_meta`
  MODIFY `lang_meta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1656;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `re_accounts`
--
ALTER TABLE `re_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `re_account_activity_logs`
--
ALTER TABLE `re_account_activity_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `re_account_packages`
--
ALTER TABLE `re_account_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_categories`
--
ALTER TABLE `re_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `re_consults`
--
ALTER TABLE `re_consults`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `re_currencies`
--
ALTER TABLE `re_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `re_facilities`
--
ALTER TABLE `re_facilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `re_facilities_distances`
--
ALTER TABLE `re_facilities_distances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7131;

--
-- AUTO_INCREMENT for table `re_features`
--
ALTER TABLE `re_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `re_investors`
--
ALTER TABLE `re_investors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `re_packages`
--
ALTER TABLE `re_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `re_projects`
--
ALTER TABLE `re_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `re_project_categories`
--
ALTER TABLE `re_project_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `re_properties`
--
ALTER TABLE `re_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `re_property_categories`
--
ALTER TABLE `re_property_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `re_tags`
--
ALTER TABLE `re_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=419;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3222;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
