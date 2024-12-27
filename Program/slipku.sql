-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2024 at 01:15 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slipku`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1735304010),
('a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1735304010;', 1735304010);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_name`, `address`, `phone`, `position_id`, `created_at`, `updated_at`) VALUES
(1, 'Andi', 'Cebongan', '081234567890', 1, '2024-12-26 20:27:56', '2024-12-26 20:27:56'),
(2, 'Budi', 'Kronggahan', '081029384756', 2, '2024-12-26 20:28:26', '2024-12-26 20:28:26'),
(3, 'Jennie', 'Pekalongan', '082163840989', 5, '2024-12-26 20:29:02', '2024-12-26 20:29:02'),
(4, 'Mega', 'Semarang', '081173529461', 3, '2024-12-26 20:29:44', '2024-12-26 20:29:44'),
(5, 'Sumanto', 'Bandung', '085724372937', 4, '2024-12-26 20:30:29', '2024-12-26 20:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `exports`
--

CREATE TABLE `exports` (
  `id` bigint UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exporter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rows` int UNSIGNED NOT NULL,
  `successful_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exports`
--

INSERT INTO `exports` (`id`, `completed_at`, `file_disk`, `file_name`, `exporter`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2024-12-27 05:09:19', 'local', 'export-1-wages', 'App\\Filament\\Exports\\WageExporter', 65, 65, 65, 1, '2024-12-27 05:06:48', '2024-12-27 05:09:19'),
(2, '2024-12-27 05:45:47', 'local', 'export-2-wages', 'App\\Filament\\Exports\\WageExporter', 5, 5, 5, 1, '2024-12-27 05:45:45', '2024-12-27 05:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9dd3221c-01b0-48ab-b94f-358bfbe01f38', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5536:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\WageExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\WageExporter\";s:10:\"total_rows\";i:65;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2024-12-27 12:06:48\";s:10:\"created_at\";s:19:\"2024-12-27 12:06:48\";s:2:\"id\";i:1;s:9:\"file_name\";s:14:\"export-1-wages\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\WageExporter\";s:10:\"total_rows\";i:65;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2024-12-27 12:06:48\";s:10:\"created_at\";s:19:\"2024-12-27 12:06:48\";s:2:\"id\";i:1;s:9:\"file_name\";s:14:\"export-1-wages\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:14:\"export-1-wages\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:6:{s:22:\"employee.employee_name\";s:8:\"Employee\";s:29:\"employee.position.hourly_rate\";s:8:\"Position\";s:13:\"working_hours\";s:13:\"Working hours\";s:5:\"bonus\";s:5:\"Bonus\";s:5:\"total\";s:5:\"Total\";s:4:\"date\";s:4:\"Date\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:6:{s:22:\"employee.employee_name\";s:8:\"Employee\";s:29:\"employee.position.hourly_rate\";s:8:\"Position\";s:13:\"working_hours\";s:13:\"Working hours\";s:5:\"bonus\";s:5:\"Bonus\";s:5:\"total\";s:5:\"Total\";s:4:\"date\";s:4:\"Date\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2419:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\WageExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\WageExporter\";s:10:\"total_rows\";i:65;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2024-12-27 12:06:48\";s:10:\"created_at\";s:19:\"2024-12-27 12:06:48\";s:2:\"id\";i:1;s:9:\"file_name\";s:14:\"export-1-wages\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\WageExporter\";s:10:\"total_rows\";i:65;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2024-12-27 12:06:48\";s:10:\"created_at\";s:19:\"2024-12-27 12:06:48\";s:2:\"id\";i:1;s:9:\"file_name\";s:14:\"export-1-wages\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:14:\"export-1-wages\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:6:{s:22:\"employee.employee_name\";s:8:\"Employee\";s:29:\"employee.position.hourly_rate\";s:8:\"Position\";s:13:\"working_hours\";s:13:\"Working hours\";s:5:\"bonus\";s:5:\"Bonus\";s:5:\"total\";s:5:\"Total\";s:4:\"date\";s:4:\"Date\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:6:{s:22:\"employee.employee_name\";s:8:\"Employee\";s:29:\"employee.position.hourly_rate\";s:8:\"Position\";s:13:\"working_hours\";s:13:\"Working hours\";s:5:\"bonus\";s:5:\"Bonus\";s:5:\"total\";s:5:\"Total\";s:4:\"date\";s:4:\"Date\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000008890000000000000000\";}\";s:4:\"hash\";s:44:\"xNvWG035V+FPE5cM554Q0s8aKU80tzlxQnhO5UieCtg=\";}}}}', NULL, 1735301359, 1735301359),
('9dd32f27-5284-44c9-bdf0-ccd8aced21ee', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5532:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\WageExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\WageExporter\";s:10:\"total_rows\";i:5;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2024-12-27 12:45:45\";s:10:\"created_at\";s:19:\"2024-12-27 12:45:45\";s:2:\"id\";i:2;s:9:\"file_name\";s:14:\"export-2-wages\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\WageExporter\";s:10:\"total_rows\";i:5;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2024-12-27 12:45:45\";s:10:\"created_at\";s:19:\"2024-12-27 12:45:45\";s:2:\"id\";i:2;s:9:\"file_name\";s:14:\"export-2-wages\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:14:\"export-2-wages\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:6:{s:22:\"employee.employee_name\";s:8:\"Employee\";s:29:\"employee.position.hourly_rate\";s:8:\"Position\";s:13:\"working_hours\";s:13:\"Working hours\";s:5:\"bonus\";s:5:\"Bonus\";s:5:\"total\";s:5:\"Total\";s:4:\"date\";s:4:\"Date\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:6:{s:22:\"employee.employee_name\";s:8:\"Employee\";s:29:\"employee.position.hourly_rate\";s:8:\"Position\";s:13:\"working_hours\";s:13:\"Working hours\";s:5:\"bonus\";s:5:\"Bonus\";s:5:\"total\";s:5:\"Total\";s:4:\"date\";s:4:\"Date\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2417:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\WageExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\WageExporter\";s:10:\"total_rows\";i:5;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2024-12-27 12:45:45\";s:10:\"created_at\";s:19:\"2024-12-27 12:45:45\";s:2:\"id\";i:2;s:9:\"file_name\";s:14:\"export-2-wages\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\WageExporter\";s:10:\"total_rows\";i:5;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2024-12-27 12:45:45\";s:10:\"created_at\";s:19:\"2024-12-27 12:45:45\";s:2:\"id\";i:2;s:9:\"file_name\";s:14:\"export-2-wages\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:14:\"export-2-wages\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:6:{s:22:\"employee.employee_name\";s:8:\"Employee\";s:29:\"employee.position.hourly_rate\";s:8:\"Position\";s:13:\"working_hours\";s:13:\"Working hours\";s:5:\"bonus\";s:5:\"Bonus\";s:5:\"total\";s:5:\"Total\";s:4:\"date\";s:4:\"Date\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:6:{s:22:\"employee.employee_name\";s:8:\"Employee\";s:29:\"employee.position.hourly_rate\";s:8:\"Position\";s:13:\"working_hours\";s:13:\"Working hours\";s:5:\"bonus\";s:5:\"Bonus\";s:5:\"total\";s:5:\"Total\";s:4:\"date\";s:4:\"Date\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"000000000000089e0000000000000000\";}\";s:4:\"hash\";s:44:\"ivykUnA0W0CIgJsmgeefC5fmTSm+Qqin1tMsPpyOF+0=\";}}}}', NULL, 1735303547, 1735303547);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_27_110745_create_notifications_table', 1),
(5, '2024_12_27_110754_create_exports_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint UNSIGNED NOT NULL,
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hourly_rate` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `position_name`, `hourly_rate`, `created_at`, `updated_at`) VALUES
(1, 'Front-End Developer', 20, '2024-12-26 20:26:12', '2024-12-26 20:26:12'),
(2, 'Back-End Developer', 25, '2024-12-26 20:26:30', '2024-12-26 20:26:30'),
(3, 'Social Media Specialist', 15, '2024-12-26 20:26:48', '2024-12-26 20:26:48'),
(4, 'Project Manager', 30, '2024-12-26 20:26:56', '2024-12-26 20:26:56'),
(5, 'Machine Learning Engineer', 25, '2024-12-26 20:27:22', '2024-12-26 20:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fGRn1cZI3ReaGxs3V5dtDo89WDiBwI8wgpz3Czcz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZTIwVE9DT3Jlc0UxQ2pKYzYzNUhQd3ZXVTFiSkd5cmZNaG5UWFpwVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9sb2dpbiI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi93YWdlcyI7fX0=', 1735304357);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$12$HG6S1mNd3TgVsWd37N8YqOukxyt1TtMQFYR3PehHfx8ogbwZebMeK', '80dNwvcKCPZwQrovWJtaggQ8GuSfDUTM8aVFTTsbAe8ZILHe64MKf0vyp8JZ', '2024-12-27 05:06:35', '2024-12-27 05:06:35');

-- --------------------------------------------------------

--
-- Table structure for table `wages`
--

CREATE TABLE `wages` (
  `id` bigint UNSIGNED NOT NULL,
  `employee_id` bigint UNSIGNED NOT NULL,
  `working_hours` int NOT NULL,
  `bonus` int NOT NULL,
  `total` int NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wages`
--

INSERT INTO `wages` (`id`, `employee_id`, `working_hours`, `bonus`, `total`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 160, 0, 3200, '2024-01-01', '2024-12-26 20:32:44', '2024-12-26 20:32:44'),
(2, 2, 160, 0, 4000, '2024-01-01', '2024-12-26 20:32:59', '2024-12-26 20:32:59'),
(3, 3, 160, 0, 4000, '2024-01-01', '2024-12-26 20:33:10', '2024-12-26 20:33:10'),
(4, 4, 160, 0, 2400, '2024-01-01', '2024-12-26 20:33:22', '2024-12-26 20:33:22'),
(5, 5, 160, 0, 4800, '2024-01-01', '2024-12-26 20:33:33', '2024-12-26 20:33:33'),
(6, 1, 170, 200, 3600, '2024-02-01', '2024-12-26 20:34:07', '2024-12-26 20:34:07'),
(7, 2, 170, 250, 4500, '2024-02-01', '2024-12-26 20:34:20', '2024-12-26 20:34:20'),
(8, 3, 170, 250, 4500, '2024-02-01', '2024-12-26 20:34:29', '2024-12-26 20:34:29'),
(9, 4, 170, 150, 2700, '2024-02-01', '2024-12-26 20:34:38', '2024-12-26 20:34:38'),
(10, 5, 170, 300, 5400, '2024-02-01', '2024-12-26 20:34:46', '2024-12-26 20:34:46'),
(11, 1, 175, 300, 3800, '2024-03-01', '2024-12-26 20:35:18', '2024-12-26 20:35:18'),
(12, 2, 175, 375, 4750, '2024-03-01', '2024-12-26 20:35:26', '2024-12-26 20:35:26'),
(13, 3, 175, 375, 4750, '2024-03-01', '2024-12-26 20:35:43', '2024-12-26 20:35:43'),
(14, 4, 175, 225, 2850, '2024-03-01', '2024-12-26 20:35:51', '2024-12-26 20:35:51'),
(15, 5, 175, 450, 5700, '2024-03-01', '2024-12-26 20:36:05', '2024-12-26 20:36:05'),
(16, 1, 155, 0, 3100, '2024-04-01', '2024-12-26 20:36:24', '2024-12-26 20:36:24'),
(17, 2, 155, 0, 3875, '2024-04-01', '2024-12-26 20:36:32', '2024-12-26 20:36:32'),
(18, 3, 155, 0, 3875, '2024-04-01', '2024-12-26 20:36:39', '2024-12-26 20:36:39'),
(19, 4, 155, 0, 2325, '2024-04-01', '2024-12-26 20:36:45', '2024-12-26 20:36:45'),
(20, 5, 155, 0, 4650, '2024-04-01', '2024-12-26 20:36:56', '2024-12-26 20:36:56'),
(21, 1, 170, 200, 3600, '2024-05-01', '2024-12-26 20:37:36', '2024-12-26 20:37:36'),
(22, 2, 170, 250, 4500, '2024-05-01', '2024-12-26 20:37:59', '2024-12-26 20:37:59'),
(23, 3, 170, 250, 4500, '2024-05-01', '2024-12-26 20:38:11', '2024-12-26 20:38:11'),
(24, 4, 170, 150, 2700, '2024-05-01', '2024-12-26 20:38:22', '2024-12-26 20:38:22'),
(25, 5, 170, 300, 5400, '2024-05-01', '2024-12-26 20:38:30', '2024-12-26 20:38:30'),
(26, 1, 190, 600, 4400, '2024-06-01', '2024-12-26 20:39:09', '2024-12-26 20:39:09'),
(27, 2, 190, 750, 5500, '2024-06-01', '2024-12-26 20:39:18', '2024-12-26 20:39:18'),
(28, 3, 190, 750, 5500, '2024-06-01', '2024-12-26 20:39:27', '2024-12-26 20:39:27'),
(29, 4, 190, 450, 3300, '2024-06-01', '2024-12-26 20:39:38', '2024-12-26 20:39:38'),
(30, 5, 190, 900, 6600, '2024-06-01', '2024-12-26 20:39:51', '2024-12-26 20:39:51'),
(31, 1, 175, 300, 3800, '2024-07-01', '2024-12-26 20:40:07', '2024-12-26 20:40:07'),
(32, 2, 175, 375, 4750, '2024-07-01', '2024-12-26 20:40:18', '2024-12-26 20:40:18'),
(33, 3, 175, 375, 4750, '2024-07-01', '2024-12-26 20:40:48', '2024-12-26 20:40:48'),
(34, 4, 175, 225, 2850, '2024-07-01', '2024-12-26 20:41:50', '2024-12-26 20:41:50'),
(35, 5, 175, 450, 5700, '2024-07-01', '2024-12-26 20:41:59', '2024-12-26 20:41:59'),
(36, 1, 160, 0, 3200, '2024-08-01', '2024-12-26 20:42:30', '2024-12-26 20:42:30'),
(37, 2, 160, 0, 4000, '2024-08-01', '2024-12-26 20:42:37', '2024-12-26 20:42:37'),
(38, 3, 160, 0, 4000, '2024-08-01', '2024-12-26 20:42:45', '2024-12-26 20:42:45'),
(39, 4, 160, 0, 2400, '2024-08-01', '2024-12-26 20:42:51', '2024-12-26 20:42:51'),
(40, 5, 160, 0, 4800, '2024-08-01', '2024-12-26 20:42:58', '2024-12-26 20:42:58'),
(41, 1, 170, 200, 3600, '2024-09-01', '2024-12-26 20:43:34', '2024-12-26 20:43:34'),
(42, 2, 170, 250, 4500, '2024-09-01', '2024-12-26 20:43:41', '2024-12-26 20:43:41'),
(43, 3, 170, 250, 4500, '2024-09-01', '2024-12-26 20:43:49', '2024-12-26 20:43:49'),
(44, 4, 170, 150, 2700, '2024-09-01', '2024-12-26 20:43:56', '2024-12-26 20:43:56'),
(45, 5, 170, 300, 5400, '2024-09-01', '2024-12-26 20:44:05', '2024-12-26 20:44:05'),
(46, 1, 165, 100, 3400, '2024-10-01', '2024-12-26 20:44:40', '2024-12-26 20:44:40'),
(47, 2, 165, 125, 4250, '2024-10-01', '2024-12-26 20:45:05', '2024-12-26 20:45:05'),
(48, 3, 165, 125, 4250, '2024-10-01', '2024-12-26 20:45:15', '2024-12-26 20:45:15'),
(49, 4, 165, 75, 2550, '2024-10-01', '2024-12-26 20:45:31', '2024-12-26 20:45:31'),
(50, 5, 165, 150, 5100, '2024-10-01', '2024-12-26 20:45:43', '2024-12-26 20:45:43'),
(51, 1, 185, 500, 4200, '2024-11-01', '2024-12-26 20:46:07', '2024-12-26 20:46:07'),
(52, 2, 185, 625, 5250, '2024-11-01', '2024-12-26 20:46:14', '2024-12-26 20:46:14'),
(53, 3, 185, 625, 5250, '2024-11-01', '2024-12-26 20:46:21', '2024-12-26 20:46:21'),
(54, 4, 185, 375, 3150, '2024-11-01', '2024-12-26 20:46:27', '2024-12-26 20:46:27'),
(55, 5, 185, 750, 6300, '2024-11-01', '2024-12-26 20:46:38', '2024-12-26 20:46:38'),
(56, 1, 195, 700, 4600, '2024-12-01', '2024-12-26 20:47:01', '2024-12-26 20:47:01'),
(57, 2, 195, 875, 5750, '2024-12-01', '2024-12-26 20:47:10', '2024-12-26 20:47:10'),
(58, 3, 195, 875, 5750, '2024-12-01', '2024-12-26 20:47:28', '2024-12-26 20:47:28'),
(59, 4, 195, 525, 3450, '2024-12-01', '2024-12-26 20:47:35', '2024-12-26 20:47:35'),
(60, 5, 195, 1050, 6900, '2024-12-01', '2024-12-26 20:47:40', '2024-12-26 20:47:40'),
(61, 1, 150, 0, 3000, '2023-12-31', '2024-12-26 21:09:53', '2024-12-26 21:11:35'),
(62, 2, 150, 0, 3750, '2023-12-31', '2024-12-26 21:10:04', '2024-12-26 21:12:08'),
(63, 3, 150, 0, 3750, '2023-12-31', '2024-12-26 21:10:16', '2024-12-26 21:12:36'),
(64, 4, 150, 0, 2250, '2023-12-31', '2024-12-26 21:10:25', '2024-12-26 21:12:53'),
(65, 5, 150, 0, 4500, '2023-12-31', '2024-12-26 21:10:34', '2024-12-26 21:13:04');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exports_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `wages`
--
ALTER TABLE `wages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exports`
--
ALTER TABLE `exports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wages`
--
ALTER TABLE `wages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
