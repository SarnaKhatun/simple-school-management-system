-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2022 at 07:26 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simple_school_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ending_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` double(10,2) NOT NULL DEFAULT 0.00,
  `short_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 => Active; 0 => Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `starting_date`, `ending_date`, `fee`, `short_description`, `long_description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(9, 'C# Programming', '2022-01-25', '2022-10-15', 20000.00, 'C# is used to develop web apps, desktop apps, mobile apps, games and much more.', 'C# (C-Sharp) is a programming language developed by Microsoft that runs on the .NET Framework.', 'course-assets/img/wtf2DkQ2y1HywhX0.jpg', 1, '2022-07-15 10:22:18', '2022-07-15 10:22:18'),
(10, 'PHP with Laravel Framework', '2022-06-20', '2022-09-10', 21000.00, 'PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages.', 'PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft\'s ASP.\r\nPHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages.', 'course-assets/img/lXzOEKPOJXjh51S2.jpg', 1, '2022-07-15 10:24:25', '2022-07-15 10:24:25'),
(11, 'php programming', '2022-06-29', '2022-09-01', 20000.00, 'PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages.', '<p>PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages.</p>', 'course-assets/img/xcyO2yGlPkP89xX2.jpg', 1, '2022-07-15 10:25:17', '2022-07-15 10:45:22'),
(12, 'Python Programming', '2022-07-20', '2022-10-05', 25000.00, 'Python is a popular programming language.', 'Python is a popular programming language. Python can be used on a server to create web applications.', 'course-assets/img/cVKQh1tj0VDzTYjk.jfif', 1, '2022-07-15 10:26:59', '2022-07-15 10:26:59'),
(13, 'Java Programming', '2022-07-20', '2022-09-20', 26000.00, 'Java is a popular programming language.', 'Java is a popular programming language.\r\nJava is used to develop mobile apps, web apps, desktop apps, games and much more.', 'course-assets/img/io40QZ9D5Kk3jrHU.jfif', 1, '2022-07-15 10:29:09', '2022-07-15 10:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `enrolls`
--

CREATE TABLE `enrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `enroll_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 => cash; 0 => SSLCom',
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrolls`
--

INSERT INTO `enrolls` (`id`, `course_id`, `user_id`, `enroll_date`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 13, 2, '15-07-2022', 1, 'complete', '2022-07-15 10:55:34', '2022-07-15 10:57:01'),
(2, 12, 2, '15-07-2022', 1, 'complete', '2022-07-15 10:55:39', '2022-07-15 10:57:06'),
(3, 11, 2, '15-07-2022', 1, 'complete', '2022-07-15 10:55:54', '2022-07-15 10:57:10'),
(4, 10, 2, '15-07-2022', 1, 'complete', '2022-07-15 10:56:01', '2022-07-15 10:57:08'),
(5, 9, 2, '15-07-2022', 1, 'complete', '2022-07-15 10:56:06', '2022-07-15 10:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_07_15_040057_create_sessions_table', 1),
(7, '2022_07_15_044806_create_user_details_table', 1),
(8, '2022_07_15_081344_create_courses_table', 2),
(9, '2022_07_15_144056_create_enrolls_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9NrmY01qNeLAOoEFvOvOqVf2GmAV86g1puqCWmi3', 3, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaFpSOHNQeHdoSjhkN0h6M2hxUFRCOGoxcGlNM040bzVlZzFvbExtSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly9sb2NhbGhvc3Qvc2ltcGxlLXNjaG9vbC1tYW5hZ2VtZW50LXN5c3RlbS9wdWJsaWMvdXNlcnMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDZOUk1qUThnS2dpREY0UTlMV092N082NG5VVEhub3FVWGRCYUtqd0RNZnJqZzBzRXljZFlHIjt9', 1657905834);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_label` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 0 => student; 1 => teacher; 2 => admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `image`, `access_label`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Sarna Hasan', 'sarnahasan@gmail.com', NULL, '$2y$10$FsuuRbWY.s1q1BZ.q6TbPuvxiWyd8f5jhyYVDrvGSVc1cN9aLRFV.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2022-07-15 01:19:06', '2022-07-15 01:20:59'),
(2, 'sarn', 'alif@domain.com', NULL, '$2y$10$xF4gE9RjHETbF0.5SVBJDellycXURs/3No7H9FDl6NuIv5h15Krga', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '2022-07-15 01:19:31', '2022-07-15 01:19:31'),
(3, 'sarna', 'admin@admin.com', NULL, '$2y$10$6NRMjQ8gKgiDF4Q9LWOv7O64nUTHnoqUXdBaKjwDMfrjg0sEycdYG', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, '2022-07-15 01:20:05', '2022-07-15 01:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 => Published; 0 => Unpublished',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `phone`, `address`, `image`, `nid`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '01987985663', 'dhaka', 'profile-assets/img/wgbpEtoK6M21srrk.jpg', '4646545475477', 1, '2022-07-15 01:19:06', '2022-07-15 11:23:18'),
(2, 2, '01998569663', 'Tejgaon,Dhaka-1215.', 'profile-assets/img/NWrMwzyMJz8Z9GnW.jpg', '24635456475784', 1, '2022-07-15 01:19:31', '2022-07-15 10:10:30'),
(3, 3, '01998569663', 'Dhaka', 'profile-assets/img/va6xkgp2Ftdpekk5.jpg', '4646545475477', 1, '2022-07-15 01:20:05', '2022-07-15 02:08:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrolls`
--
ALTER TABLE `enrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `enrolls`
--
ALTER TABLE `enrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
