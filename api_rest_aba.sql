-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 01-02-2024 a las 23:51:54
-- Versión del servidor: 5.7.34
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_rest_aba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bips`
--

CREATE TABLE `bips` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_of_assessment` tinyint(1) DEFAULT '1' COMMENT '1:initial,2:reassestment',
  `documents_reviewed` json DEFAULT NULL,
  `background_information` text,
  `previus_treatment_and_result` text,
  `current_treatment_and_progress` text,
  `education_status` text,
  `phisical_and_medical_status` text,
  `maladaptives` json DEFAULT NULL,
  `assestment_conducted` text,
  `assestment_conducted_options` json DEFAULT NULL,
  `prevalent_setting_event_and_atecedents` json DEFAULT NULL,
  `interventions` json DEFAULT NULL,
  `reduction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bips`
--

INSERT INTO `bips` (`id`, `client_id`, `patient_id`, `doctor_id`, `type_of_assessment`, `documents_reviewed`, `background_information`, `previus_treatment_and_result`, `current_treatment_and_progress`, `education_status`, `phisical_and_medical_status`, `maladaptives`, `assestment_conducted`, `assestment_conducted_options`, `prevalent_setting_event_and_atecedents`, `interventions`, `reduction_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 'cliente3243', 1, 2, '[{\"document_title\": \"ADOs\", \"document_status\": \"yes\"}]', 'asdsa', 'dsadsa', 'dsads', 'dsadas', 'dsasd', '[{\"baseline_level\": \"dsadasdas\", \"initial_interesting\": 32, \"maladaptive_behavior\": \"Negative Self talk\", \"topografical_definition\": \"adassad\"}, {\"baseline_level\": \"dasadssad\", \"initial_interesting\": 23, \"maladaptive_behavior\": \"dasdsa\", \"topografical_definition\": \"dasdsa\"}]', 'sadsa', '[{\"assestment_title\": \"dasdas\", \"assestment_status\": \"yes\"}]', '[{\"behavior\": \"das\", \"hypothesized_functions\": \"das\", \"prevalent_setting_event_and_atecedent\": \"das\"}, {\"behavior\": \"sdad\", \"hypothesized_functions\": \"sa\", \"prevalent_setting_event_and_atecedent\": \"dsa\"}]', '[{\"dra\": \"dsaad\", \"dro\": \"dsada\", \"ncr\": \"dasdas\", \"pairing\": \"dasdas\", \"shaping\": \"dasda\", \"chaining\": \"dsa\", \"redirection\": \"dasdas\", \"response_block\": \"dsad\", \"premack_principal\": \"dasda\", \"errorless_teaching\": \"dassd\"}]', NULL, '2024-01-30 21:41:01', '2024-02-02 00:17:49', NULL),
(2, 5, 'cliente3243', 1, 2, '[{\"cde\": true, \"iep\": false, \"mnl\": true, \"referal\": true, \"medical_notes\": false, \"doctor_referal\": true}]', 'actualiadsads', 'dsadsa', 'dsadsdas', 'dsadas', 'dsasd', '[{\"title\": \"mald\", \"definition\": \"adsdsa\", \"unit_malad\": 323}, {\"title\": \"mlkds\", \"definition\": \"dasds\", \"unit_malad\": 43}]', 'sadsa', '[{\"ados\": true, \"vineland_behavior_rating_scale\": false, \"functional_assessment_interview_completed\": true}]', '[{\"behavior\": \"das\", \"hypothesized_functions\": \"das\", \"prevalent_setting_event_and_atecedent\": \"das\"}, {\"behavior\": \"sdad\", \"hypothesized_functions\": \"sa\", \"prevalent_setting_event_and_atecedent\": \"dsa\"}]', '[{\"dra\": \"dsaad\", \"dro\": \"dsada\", \"ncr\": \"dasdas\", \"pairing\": \"dasdas\", \"shaping\": \"dasda\", \"chaining\": \"dsa\", \"redirection\": \"dasdas\", \"response_block\": \"dsad\", \"premack_principal\": \"dasda\", \"errorless_teaching\": \"dassd\"}, {\"dra\": \"dasas\", \"dro\": \"dsas\", \"ncr\": \"dasasd\", \"pairing\": \"dsadsa\", \"shaping\": \"das\", \"chaining\": \"dsads\", \"redirection\": \"dasas\", \"response_block\": \"dsasd\", \"premack_principal\": \"dsadas\", \"errorless_teaching\": \"dasas\"}]', NULL, '2024-02-01 03:10:06', '2024-02-01 03:10:06', NULL),
(3, 7, 'asd234', 1, 1, '[{\"cde\": true, \"mnl\": true, \"referal\": true, \"medical_notes\": true, \"doctor_referal\": true}]', 'dasads', 'dasdas', 'dasdas', 'dasdas', 'dsads', '[{\"title\": \"dsadas\", \"definition\": \"dasdas\", \"unit_malad\": 32}, {\"title\": \"dasas\", \"definition\": \"dasdas\", \"unit_malad\": 23}]', 'dasdas', '[{\"ados\": true, \"vineland_behavior_rating_scale\": true, \"functional_assessment_interview_completed\": true}]', '[{\"behavior\": \"dadas\", \"hypothesized_functions\": \"dsaad\", \"prevalent_setting_event_and_atecedent\": \"dsasd\"}, {\"behavior\": \"dasdasd\", \"hypothesized_functions\": \"asdas\", \"prevalent_setting_event_and_atecedent\": \"saddas\"}, {\"behavior\": \"dasdasdsa\", \"hypothesized_functions\": \"das\", \"prevalent_setting_event_and_atecedent\": \"dasdsa\"}]', '[{\"dra\": \"dasds\", \"dro\": \"dasad\", \"ncr\": \"dsadas\", \"pairing\": \"asads\", \"shaping\": \"dsada\", \"chaining\": \"dsaad\", \"redirection\": \"das\", \"response_block\": \"dasa\", \"premack_principal\": \"dasad\", \"errorless_teaching\": \"dsadasdsa\"}]', NULL, '2024-02-01 03:35:32', '2024-02-01 04:25:14', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bip_files`
--

CREATE TABLE `bip_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `size` varchar(50) NOT NULL,
  `file` varchar(250) NOT NULL,
  `type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insurances`
--

CREATE TABLE `insurances` (
  `id` bigint(50) NOT NULL,
  `insurer_name` varchar(255) DEFAULT NULL,
  `services` json DEFAULT NULL,
  `notes` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `insurances`
--

INSERT INTO `insurances` (`id`, `insurer_name`, `services`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Fl Blue', '[{\"code\": \"97151\", \"provider\": \"BCBA\", \"hourly_fee\": \"84\", \"unit_prize\": \"21\", \"description\": \"Assessment\", \"max_allowed\": \"(max 2 hrs/day) total 40 units/10 hours copay will aply per day\"}, {\"code\": \"97153\", \"provider\": \"RBT\", \"hourly_fee\": \"52\", \"unit_prize\": \"13\", \"description\": \"Therapy\", \"max_allowed\": \"(max 8 hrs/day)\"}, {\"code\": \"97155\", \"provider\": \"BCBA\", \"hourly_fee\": \"81.6\", \"unit_prize\": \"20.4\", \"description\": \"BIP modification only\", \"max_allowed\": null}, {\"code\": \"97156\", \"provider\": \"BCBA\", \"hourly_fee\": \"76\", \"unit_prize\": \"19\", \"description\": \"Caregiver Training\", \"max_allowed\": null}, {\"code\": \"97157\", \"provider\": \"BCBA\", \"hourly_fee\": null, \"unit_prize\": \"3\", \"description\": \"Group Caregiver Training( Multi-family)\", \"max_allowed\": null}, {\"code\": \"H0032\", \"provider\": \"BCBA\", \"hourly_fee\": \"68\", \"unit_prize\": \"17\", \"description\": null, \"max_allowed\": null}]', '[{\"note\": \"Horizon by BCBS\"}, {\"note\": \"Horizon BCBSNJ will use H0032 for Indirect service (treatment planning)\"}, {\"note\": \"telehealth: submit a claim to Florida Blue using one of the regular codes included in your fee schedule. The place of service should be the regular place of service as if you saw the patient in-person.\"}, {\"note\": \"Modifier XE for 2 sessions, same day different POS\"}, {\"note\": \"Now allows concurrent billing of 97155 and 97153, effecitve 12/01/2021\"}, {\"note\": \"97156 is always ALLOWED to overlap with 97153\"}]', '2024-01-26 00:17:41', '2024-01-27 02:09:11', NULL),
(2, 'United', '[{\"code\": \"97153\", \"provider\": \"RBT\", \"hourly_fee\": \"50.04\", \"unit_prize\": \"12.51\", \"description\": \"therapy\"}, {\"code\": \"97151\", \"provider\": \"BCBA\", \"hourly_fee\": \"119.52\", \"unit_prize\": \"29.88\", \"description\": \"IA (40 units)\", \"max_allowed\": null}, {\"code\": \"97155\", \"provider\": \"BCBA 97155\", \"hourly_fee\": \"77.28\", \"unit_prize\": \"19.32\", \"description\": \"supervision\", \"max_allowed\": null}, {\"code\": \"97156\", \"provider\": \"BCBA 97156\", \"hourly_fee\": \"70.04\", \"unit_prize\": \"17.51\", \"description\": \"PT\", \"max_allowed\": null}, {\"code\": \"97153\", \"provider\": \"BCBA\", \"hourly_fee\": \"66.72\", \"unit_prize\": \"16.68\", \"description\": \"therapy\", \"max_allowed\": null}, {\"code\": \"97151\", \"provider\": \"BCaBA\", \"hourly_fee\": \"101.6\", \"unit_prize\": \"25.4\", \"description\": null, \"max_allowed\": null}, {\"code\": \"97153\", \"provider\": \"BCaBA\", \"hourly_fee\": \"56.72\", \"unit_prize\": \"14.18\", \"description\": null, \"max_allowed\": null}, {\"code\": \"97155\", \"provider\": \"BCaBA\", \"hourly_fee\": \"65.68\", \"unit_prize\": \"16.42\", \"description\": null, \"max_allowed\": null}, {\"code\": \"97156\", \"provider\": \"BCaBA\", \"hourly_fee\": \"59.52\", \"unit_prize\": \"14.88\", \"description\": null, \"max_allowed\": null}]', '[{\"note\": \"No school or community covered unless aproved by peer review on auth\"}, {\"note\": \"If the rendering provider is required, use the BCBA on the case.\"}, {\"note\": \"for 97155 Yes. When supervision is provided, you may bill concurrently for both Supervisors and Behavior Technicians, billing with 97153 and 97155.\"}, {\"note\": \"Modifier XE for 2 sessions, same day different POS\"}, {\"note\": \"Modifiers: RBT- HM, BCBA- HO, BCaBA- HN\"}, {\"note\": \"97156 is always allowed to overlap with 97153\"}]', '2024-01-27 02:14:56', '2024-01-28 03:51:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `zip` varchar(150) DEFAULT NULL,
  `address` text,
  `email` varchar(150) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `locations`
--

INSERT INTO `locations` (`id`, `title`, `city`, `state`, `zip`, `address`, `email`, `phone1`, `phone2`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Candelaria', 'Candelaria', 'Capital', '1010', 'Centro Comercial Sambil Candelaria, Local e23', 'AbaThepC@app.com', '324432', '55665654', '2024-02-01 20:32:49', '2024-02-01 20:58:42', NULL),
(2, 'Chacao', 'dasdas', 'dasdsa', '234we', 'Centro Comercial Sambil Chacao, Local e23', 'AbaThepCh@app.com', '2344432', '55665654', '2024-02-01 20:33:21', '2024-02-01 20:58:06', NULL),
(3, 'Santa Paula', 'Caracas', 'Distrito Capital', '1010A', 'Centro Comercial Santa paula, Local e23', 'AbaThep@app.com', '322344', '55665654', '2024-02-01 20:35:26', '2024-02-01 20:55:30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maladaptives`
--

CREATE TABLE `maladaptives` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `maladaptive` varchar(255) DEFAULT NULL,
  `bl_week` double NOT NULL,
  `reduction_w` double NOT NULL,
  `s_date` timestamp NULL DEFAULT NULL,
  `s_value` double DEFAULT NULL,
  `m_date` timestamp NULL DEFAULT NULL,
  `m_value` double DEFAULT NULL,
  `t_date` timestamp NULL DEFAULT NULL,
  `t_value` double DEFAULT NULL,
  `w_date` timestamp NULL DEFAULT NULL,
  `w_value` double DEFAULT NULL,
  `th_date` timestamp NULL DEFAULT NULL,
  `th_value` double DEFAULT NULL,
  `f_date` timestamp NULL DEFAULT NULL,
  `f_value` double DEFAULT NULL,
  `st_date` timestamp NULL DEFAULT NULL,
  `st_value` double DEFAULT NULL,
  `totals` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `maladaptives`
--

INSERT INTO `maladaptives` (`id`, `client_id`, `maladaptive`, `bl_week`, `reduction_w`, `s_date`, `s_value`, `m_date`, `m_value`, `t_date`, `t_value`, `w_date`, `w_value`, `th_date`, `th_value`, `f_date`, `f_value`, `st_date`, `st_value`, `totals`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1232, 'negative self talk', 20, 0.26, '2024-01-22 00:23:27', 2, '2024-01-23 00:23:27', 3, '2024-01-24 00:23:27', 5, '2024-01-25 00:23:27', 10, '2024-01-26 00:23:27', 10, '2024-01-27 00:23:27', 10, '2024-01-28 00:23:27', 3, 19.74, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_11_30_175428_create_jobs_table', 1),
(6, '2022_12_18_035041_create_contacts_table', 1),
(7, '2023_11_29_231903_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 3),
(7, 'App\\Models\\User', 4),
(8, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 6),
(1, 'App\\Models\\User', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `language` varchar(150) DEFAULT NULL,
  `parent_guardian_name` varchar(150) DEFAULT NULL,
  `relationship` varchar(150) DEFAULT NULL,
  `home_phone` varchar(150) DEFAULT NULL,
  `work_phone` varchar(150) DEFAULT NULL,
  `school_name` varchar(150) DEFAULT NULL,
  `school_number` varchar(150) DEFAULT NULL,
  `zip` varchar(150) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `address` text,
  `gender` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:male,2:female',
  `birth_date` timestamp NULL DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `education` varchar(150) DEFAULT NULL,
  `profession` varchar(150) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `summer_schedule` varchar(255) DEFAULT NULL,
  `special_note` text,
  `insurer` varchar(255) DEFAULT NULL,
  `insuranceId` varchar(50) DEFAULT NULL,
  `insuranceId_secundary` varchar(150) DEFAULT NULL,
  `elegibility_date` timestamp NULL DEFAULT NULL,
  `pos_covered` varchar(50) DEFAULT NULL,
  `deductible_individual_I_F` varchar(150) DEFAULT NULL,
  `balance` varchar(150) DEFAULT NULL,
  `coinsurance` varchar(150) DEFAULT NULL,
  `copayments` varchar(150) DEFAULT NULL,
  `oop` varchar(150) DEFAULT NULL,
  `diagnosis_code` varchar(255) DEFAULT NULL,
  `elegibility_day` timestamp NULL DEFAULT NULL,
  `eligibility` enum('pending','yes','no') NOT NULL DEFAULT 'pending',
  `patient_control` varchar(255) DEFAULT NULL,
  `pa_assessments` json DEFAULT NULL,
  `compayment_per_visit` varchar(255) DEFAULT NULL,
  `insurer_secundary` varchar(50) DEFAULT NULL,
  `welcome` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') DEFAULT 'waiting',
  `consent` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `insurance_card` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `mnl` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `referral` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `ados` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `iep` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `asd_diagnosis` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `cde` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `submitted` enum('waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'waiting',
  `rbt_id` bigint(20) DEFAULT NULL,
  `rbt2_id` bigint(20) DEFAULT NULL,
  `bcba_id` bigint(20) DEFAULT NULL,
  `bcba2_id` bigint(20) DEFAULT NULL,
  `clin_director_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`id`, `location_id`, `patient_id`, `first_name`, `last_name`, `email`, `phone`, `language`, `parent_guardian_name`, `relationship`, `home_phone`, `work_phone`, `school_name`, `school_number`, `zip`, `state`, `address`, `gender`, `birth_date`, `age`, `avatar`, `city`, `education`, `profession`, `schedule`, `summer_schedule`, `special_note`, `insurer`, `insuranceId`, `insuranceId_secundary`, `elegibility_date`, `pos_covered`, `deductible_individual_I_F`, `balance`, `coinsurance`, `copayments`, `oop`, `diagnosis_code`, `elegibility_day`, `eligibility`, `patient_control`, `pa_assessments`, `compayment_per_visit`, `insurer_secundary`, `welcome`, `consent`, `insurance_card`, `mnl`, `referral`, `ados`, `iep`, `asd_diagnosis`, `cde`, `submitted`, `rbt_id`, `rbt2_id`, `bcba_id`, `bcba2_id`, `clin_director_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, NULL, 'prueba4', 'prueba4', 'prueba4', 'prueba4@prueba4.com', '2132', 'prueba4, prueba4, prueba4', 'prueba4', 'prueba4', '534354', '234423', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 2, '2024-01-27 16:00:00', '32', 'patients/gpZvc8J7nt67vm0qUMMAfhNNfKnAtMH1zzr6r3HD.jpg', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', '2', 'prueba4', 'prueba4', '2024-01-26 16:00:00', '03', '3243/432', '2545/354543', '20%/43%', '12/12', '340/434', 'prueba4', NULL, 'yes', 'prueba4', NULL, NULL, 'prueba4', 'waiting', 'requested', 'reviewing', 'reviewing', 'reviewing', 'reviewing', 'reviewing', 'psycho eval', '2 insurance', '2 insurance', 5, 3, 3, 3, 4, '2024-01-28 01:39:48', '2024-01-28 01:46:25', NULL),
(5, NULL, 'cliente3243', 'ClientePrueba', 'ClienteAp', 'ClientePrueba@cliente.com', '3234', 'ads, dsadsa, adsdsa,dasdas', 'daad', 'das', '23443', '23432', 'dsada', 'dasda', 'asd', 'dsadsa', 'dsasd', 1, '2024-01-23 16:00:00', '23', 'patients/hacQifivrjCOOU1U9NjAmi2SUIOO5q0jD4vQICSY.jpg', 'dasdsa', 'adsdsa', 'ddas', 'dasda', 'dsaad', 'dsads', '2', 'dsadas', 'adsdsa', '2024-01-24 16:00:00', '03', '32320/2332', '2323/2332', '23/32', '23/23', '324/3232', 'dadsda', NULL, 'yes', 'adsds', NULL, NULL, 'asddsa', 'waiting', 'requested', 'reviewing', 'reviewing', 'reviewing', 'psycho eval', 'psycho eval', 'reviewing', 'reviewing', 'reviewing', 1, 2, 3, 5, 4, '2024-01-30 21:39:09', '2024-01-30 21:39:31', NULL),
(6, NULL, 'cliente3', 'Cliente3', 'Clientepe', 'Cliente3@cliente.com', '24334', 'adsdas', 'qdasdsa', 'dadsa', '234423', '234432', 'dasd', '3123321', 'Cliente3', 'Cliente3', 'Cliente3', 2, '2024-01-30 16:00:00', '14', 'patients/DCcvJc7Lc3pGGN0Brb2a29hCmBBgdJCMeAdC4lec.jpg', 'Cliente3', 'dsads', 'dasda', 'Cliente3', 'Cliente3', 'Cliente3', '1', 'das', 'das', '2024-01-31 16:00:00', '03', 'das', 'das', 'dsa', 'das', 'dsa', 'Cliente3', NULL, 'yes', 'dsa', NULL, NULL, 'das', 'requested', 'requested', 'reviewing', 'psycho eval', 'requested', 'reviewing', 'psycho eval', 'psycho eval', 'reviewing', 'reviewing', 3, 2, 2, 2, 2, '2024-01-31 02:32:32', '2024-01-31 02:32:41', NULL),
(7, NULL, 'asd234', 'asdasddsa', 'asdasddsa', 'dasads@das.com', 'dasad', 'adsda, dasdas, adsdas', 'dasad', 'dada', 'dadas', 'dadsa', 'dasdas', 'dasda', 'das', 'dasdsa', 'dsads', 2, '2024-01-18 16:00:00', '32', 'patients/n7D5rEBEPBuzn13Q0GGMT01Vy6aF7cxkB5ka8VVO.jpg', 'asddsa', 'asdas', 'dasasd', 'dsadsa', 'dsads', 'dsasd', '2', 'das', 'dsa', '2024-01-11 16:00:00', '12', 'adsdsa', 'dsads', 'dsa', 'dsads', 'dsasd', 'dsasd', NULL, 'yes', 'asdads12321', NULL, NULL, 'das', 'waiting', 'requested', 'reviewing', 'psycho eval', 'need new', 'need new', '2 insurance', 'reviewing', 'yes', 'no', 4, 3, 4, 1, 4, '2024-02-01 01:07:31', '2024-02-01 03:34:12', NULL),
(8, 2, 'cli32232', 'dsads', 'dsads', 'dsad', 'dasdas', 'dsaad', 'dsada', 'dsasd', 'dasddsa', 'dsaads', 'dsaads', 'dsaads', 'dasdas', 'dsads', 'dasdas', 1, '2024-01-10 08:00:00', '32', NULL, 'ddsadas', 'das', 'adsads', 'dsasd', 'dsaads', 'dsaasd', '2', 'saddsa', 'dsaads', '2024-01-26 08:00:00', '12', 'dasads', 'dsads', 'dsasd', 'dsads', 'dsaads', 'dsads', NULL, 'pending', 'dsaasd', 'null', NULL, 'dasads', 'requested', 'psycho eval', 'need new', 'psycho eval', 'psycho eval', 'psycho eval', 'requested', 'yes', 'reviewing', 'requested', 1, 2, 4, 5, 4, '2024-02-01 01:36:04', '2024-02-01 21:06:43', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'register_rol', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(2, 'list_rol', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(3, 'edit_rol', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(4, 'delete_rol', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(9, 'profile_doctor', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(10, 'register_patient', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(11, 'list_patient', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(12, 'edit_patient', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(13, 'delete_patient', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(14, 'profile_patient', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(19, 'register_appointment', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(20, 'list_appointment', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(21, 'edit_appointment', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(22, 'delete_appointment', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(27, 'show_payment', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(28, 'edit_payment', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(29, 'activitie', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(30, 'calendar', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(31, 'expense_report', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(32, 'invoice_report', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(33, 'settings', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(34, 'list_insurance', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(35, 'register_insurance', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(36, 'list_bip', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(37, 'register_bip', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(38, 'edit_bip', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(39, 'attention_bip', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(40, 'admin_dashboard', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(41, 'doctor_dashboard', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(42, 'client_dashboard', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(43, 'list_employers', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(44, 'register_employer', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(45, 'edit_employer', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(46, 'delete_employer', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(47, 'list_location', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(48, 'register_location', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(49, 'edit_location', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reduction_goals`
--

CREATE TABLE `reduction_goals` (
  `id` bigint(20) NOT NULL,
  `goal_id` double DEFAULT NULL,
  `sto` varchar(25) DEFAULT NULL,
  `bip_id` bigint(20) UNSIGNED NOT NULL,
  `goal` varchar(255) DEFAULT NULL,
  `decription_goal` text,
  `status` enum('on hold','initiated','mastered') NOT NULL DEFAULT 'on hold',
  `date` timestamp NULL DEFAULT NULL,
  `lto` varchar(50) DEFAULT NULL,
  `description_lto` text,
  `status_lto` enum('on hold','initiated','mastered') NOT NULL DEFAULT 'on hold',
  `date_lto` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reduction_goals`
--

INSERT INTO `reduction_goals` (`id`, `goal_id`, `sto`, `bip_id`, `goal`, `decription_goal`, `status`, `date`, `lto`, `description_lto`, `status_lto`, `date_lto`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'STO1', 1, 'mald', 'dasdas', 'initiated', '2024-01-17 08:00:00', NULL, NULL, 'on hold', NULL, '2024-01-30 21:41:24', '2024-01-30 21:41:24', NULL),
(2, 1, 'st02', 1, 'mald', 'das', 'initiated', '2024-01-24 08:00:00', NULL, NULL, 'on hold', NULL, '2024-01-31 03:22:47', '2024-01-31 03:22:47', NULL),
(3, 1, NULL, 1, 'mald', NULL, 'on hold', '2024-01-25 08:00:00', NULL, NULL, 'on hold', NULL, '2024-01-31 03:43:59', '2024-02-02 03:44:19', '2024-02-02 03:44:19'),
(4, 1, '32', 1, 'jjjj', 'das', 'mastered', NULL, NULL, NULL, 'on hold', NULL, '2024-02-02 00:57:27', '2024-02-02 03:36:43', '2024-02-02 03:36:43'),
(5, 1, 'dads', 1, 'jjj', 'das', 'on hold', '2024-02-08 08:00:00', NULL, NULL, 'on hold', NULL, '2024-02-02 01:01:12', '2024-02-02 01:01:12', NULL),
(6, 1, 'ds1', 1, 'jjj', 'da', 'initiated', '2024-02-15 08:00:00', NULL, NULL, 'on hold', NULL, '2024-02-02 01:06:06', '2024-02-02 01:06:06', NULL),
(7, 2, 'tr5', 1, 'jjj', 'das', 'on hold', '2024-02-16 08:00:00', NULL, NULL, 'on hold', NULL, '2024-02-02 01:08:16', '2024-02-02 01:08:16', NULL),
(8, 2, 'hyt4', 1, 'Negative Self talk', 'asdsda', 'mastered', '2024-02-17 08:00:00', NULL, NULL, 'on hold', NULL, '2024-02-02 01:09:22', '2024-02-02 01:09:22', NULL),
(9, 2, 'daads', 1, 'Negative Self talk', 'dasasd', 'mastered', '2024-02-21 08:00:00', NULL, NULL, 'on hold', NULL, '2024-02-02 01:12:08', '2024-02-02 01:12:08', NULL),
(10, 2, NULL, 1, 'dasdsa', NULL, 'on hold', NULL, 'lto01', 'sdadas', 'on hold', '2024-02-15 08:00:00', '2024-02-02 01:30:14', '2024-02-02 03:39:19', '2024-02-02 03:39:19'),
(11, NULL, NULL, 1, 'Negative Self talk', NULL, 'on hold', NULL, 'lto02', 'das', 'on hold', '2024-02-14 08:00:00', '2024-02-02 03:41:06', '2024-02-02 03:41:06', NULL),
(12, NULL, NULL, 1, 'dasdsa', NULL, 'on hold', NULL, 'lto04', 'dasdsa', 'mastered', '2024-02-21 08:00:00', '2024-02-02 03:42:38', '2024-02-02 03:42:38', NULL),
(13, NULL, NULL, 1, 'dasdsa', NULL, 'on hold', NULL, 'lto9', 'dsaadsasd', 'on hold', '2024-02-07 08:00:00', '2024-02-02 03:47:15', '2024-02-02 03:47:15', NULL),
(14, NULL, NULL, 1, 'dasdsa', NULL, 'on hold', NULL, NULL, NULL, 'on hold', NULL, '2024-02-02 03:48:57', '2024-02-02 03:49:06', '2024-02-02 03:49:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_clinicos`
--

CREATE TABLE `registro_clinicos` (
  `id` bigint(20) NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `start_in` varchar(20) DEFAULT NULL,
  `end_out` varchar(20) DEFAULT NULL,
  `total_hour` varchar(20) DEFAULT NULL,
  `meet_client_at` enum('home','school','community','pending') NOT NULL DEFAULT 'pending',
  `client_appeared` enum('happy','sad','exited','tired','agresive','distracted','pending') NOT NULL DEFAULT 'pending',
  `as_evidenced_by` enum('pending','smilling at RBT','playing a game','whatching tv','running to greet RBT','scaping','talking to a friend') NOT NULL DEFAULT 'pending',
  `RBT_modeled_and_demostrate` enum('pending','redirection','premack principle','response block','behavioral momentum','DTT') NOT NULL DEFAULT 'pending',
  `responding_this_session_could` enum('pending','yes','no') DEFAULT 'pending',
  `progress_noted_this_session` enum('pending','excelent','good','moderate','minimal') NOT NULL DEFAULT 'pending',
  `client_response_to_treatment` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_atd` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'SUPERADMIN', 'api', '2023-11-30 03:32:36', '2023-11-30 03:32:36'),
(2, 'MANAGER', 'api', '2023-12-01 04:09:47', '2024-01-26 05:05:33'),
(6, 'LM', 'api', '2024-01-21 00:44:59', '2024-01-26 05:04:18'),
(7, 'BCBA', 'api', '2024-01-21 00:45:23', '2024-01-26 05:04:47'),
(8, 'RBT', 'api', '2024-01-21 00:45:41', '2024-01-26 05:04:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(11, 6),
(34, 6),
(35, 6),
(41, 6),
(43, 6),
(44, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` timestamp NULL DEFAULT NULL,
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:masculino,2:femenino',
  `address` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('inactive','active','black list','incoming') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `currently_pay_through_company` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `llc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ien` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `electronic_signature` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agency_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ss_number` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_hire` timestamp NULL DEFAULT NULL,
  `start_pay` timestamp NULL DEFAULT NULL,
  `driver_license_expiration` timestamp NULL DEFAULT NULL,
  `cpr_every_2_years` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_every_5_years` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_verify` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_sex_offender_registry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bacb_license_expiration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `liability_insurance_annually` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `local_police_rec_every_5_years` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medicaid_provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceu_hippa_annually` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceu_domestic_violence_no_expiration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceu_security_awareness_annually` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceu_zero_tolerance_every_3_years` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceu_hiv_bloodborne_pathogens_infection_control_no_expiration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceu_civil_rights_no_expiration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_badge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `w_9_w_4_form` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_four_week_notice_agreement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credentialing_package_bcbas_only` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caqh_bcbas_only` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_type` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `location_id` bigint(50) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `surname`, `phone`, `birth_date`, `gender`, `address`, `avatar`, `status`, `currently_pay_through_company`, `llc`, `ien`, `wc`, `electronic_signature`, `agency_location`, `city`, `languages`, `dob`, `ss_number`, `date_of_hire`, `start_pay`, `driver_license_expiration`, `cpr_every_2_years`, `background_every_5_years`, `e_verify`, `national_sex_offender_registry`, `certificate_number`, `bacb_license_expiration`, `liability_insurance_annually`, `local_police_rec_every_5_years`, `npi`, `medicaid_provider`, `ceu_hippa_annually`, `ceu_domestic_violence_no_expiration`, `ceu_security_awareness_annually`, `ceu_zero_tolerance_every_3_years`, `ceu_hiv_bloodborne_pathogens_infection_control_no_expiration`, `ceu_civil_rights_no_expiration`, `school_badge`, `w_9_w_4_form`, `contract`, `two_four_week_notice_agreement`, `credentialing_package_bcbas_only`, `caqh_bcbas_only`, `contract_type`, `salary`, `location_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'superadmin@superadmin.com', NULL, NULL, NULL, 1, NULL, NULL, 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-30 03:32:36', '$2y$10$PiKCOHK3XOBlqiL0kgJwLOMILMA6uVAAS1ou7JqHsUQaH4yvPkAiC', 'guHmnxhKw1', '2023-11-30 03:32:36', '2024-01-26 01:15:51', NULL),
(2, 'Admin', 'manager@manager.com', 'Manager', '123456', '2024-01-25 16:00:00', 1, 'dasdsa', 'staffs/WdpkCmttLTmbxhXDM7FQhzWheWgr8eEbqYfMqNt4.jpg', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$X9YH3UjUALq07nGq7S5FLe6bAWZ0t6yPhNjHddtS1t9ju8FElC/UO', NULL, '2024-01-26 01:13:28', '2024-01-26 01:15:55', NULL),
(3, 'Tecnico', 'lm@lm.com', 'Doctor', '123456', '2024-01-25 08:00:00', 1, 'password', 'staffs/Br3ln1TSmcLTuQrAGbQtsxiTkmpJk2kONcvDchFB.jpg', 'active', 'dsaads', 'adsdsa', 'dsaad', 'adsdas', NULL, 'dasdsad', 'asdas', 'dasdas, adsdsa', 'adsads', 'adsdsa', '2024-01-25 08:00:00', '2024-01-30 08:00:00', '2030-07-26 08:00:00', 'asddas', 'dasadsd', 'asdas', 'dasads', 'dsaads', '2026-01-22 04:00:00', 'dsadas', 'dasdas', 'dasads', 'dasdas', 'dsadas', 'yes', 'dasads', 'ads', 'yes', 'dsadas', 'yes', 'no', 'yes', 'no', 'asddas', 'dsadsa', '1099', 2000, NULL, NULL, '$2y$10$L9GFjttLbOyyhynDcDaKBeObcfvVA7nZ3cLph0pZvozLqsdYiXgrC', NULL, '2024-01-26 01:17:03', '2024-01-31 15:55:48', NULL),
(4, 'Doctor', 'bcba@bcba.com', 'Bcba', '123456', '2024-01-25 16:00:00', 2, 'dsadas', 'staffs/RbbNRabSWaxhSWcOX0J2GFRArBZAaWyf2cGEiCi1.jpg', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$nBs3RhKzpnMrN6NVJyc8FeIPjKtfQ6CNm63LM5KTsgt8XkbBsk4ma', NULL, '2024-01-26 01:17:55', '2024-01-28 03:47:50', NULL),
(5, 'doctor', 'rbt@rbt.com', 'Rbt', '12345', '2024-01-25 08:00:00', 2, 'dsaads', 'staffs/f7YXFPACowKcCsIse6mvhenpNHgMXw4ZeBvmip8z.jpg', 'active', 'prueba4', 'prueba4', 'prueba4', 'prueba4', NULL, 'prueba4', 'prueba4', 'prueba4, prueba4', 'prueba4', 'prueba4', '1970-01-01 16:00:00', '1970-01-01 16:00:00', '1970-01-01 16:00:00', 'das', 'dadd', 'dasdsa', 'dasdas', 'dasdas', '1970-01-01 12:00:00', 'dasdas', 'dasdasd', 'asdas', 'dasdas', 'dasdas', 'yes', 'dasdas', 'dasdas', 'yes', 'pruebadoc', 'yes', 'yes', 'yes', 'yes', 'pruebadoc', 'ads', 'w2', 3232, NULL, NULL, '$2y$10$5YsgbtRGSUHpczYoTBETke3S/IfYzsv4q.WP2LrKUO1sFjDoNt7..', NULL, '2024-01-26 01:18:43', '2024-01-30 13:29:32', NULL),
(6, 'Maria Eugenia', 'apontemariae@gmail.com', 'Aponte', '+584122070144', '2024-01-10 08:00:00', 2, 'mariae2004', 'staffs/cm0erQamszXAiBjp5QjKlXoBMXdkjLSwMbo0Hlwt.jpg', 'active', NULL, NULL, NULL, NULL, 'http://127.0.0.1:8000/storage/http://127.0.0.1:8000/storage/undefined', NULL, NULL, NULL, NULL, NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '1970-01-01 08:00:00', NULL, NULL, NULL, NULL, NULL, '1970-01-01 04:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, '$2y$10$q/ZdnNEwG3L30uQ9adJpLuwEd2PIZeXXS3ZTPxFLCL.JJQu.vn3T2', NULL, '2024-01-31 02:27:09', '2024-02-01 17:16:20', NULL),
(7, 'Alain', 'alain@practice-mgmt.com', 'Hernandez', '2397101864', '2024-03-11 08:00:00', 1, 'practice', 'staffs/ZNIhSxgjALKEfZp2wFDbkrRg9ANnGK1Yvwec3EcB.jpg', 'active', NULL, NULL, NULL, NULL, 'http://127.0.0.1:8000/storage/undefined', NULL, NULL, NULL, NULL, NULL, '1970-01-01 16:00:00', '1970-01-01 16:00:00', '1970-01-01 16:00:00', NULL, NULL, NULL, NULL, NULL, '1970-01-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$NnOEBxaztsMzzwCmVkNyr.MNhYhWCH.9d7TTywz35Rfi876.T6vzS', NULL, '2024-01-31 02:29:13', '2024-01-31 15:48:39', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bips`
--
ALTER TABLE `bips`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bip_files`
--
ALTER TABLE `bip_files`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maladaptives`
--
ALTER TABLE `maladaptives`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `reduction_goals`
--
ALTER TABLE `reduction_goals`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_clinicos`
--
ALTER TABLE `registro_clinicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bips`
--
ALTER TABLE `bips`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `bip_files`
--
ALTER TABLE `bip_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insurances`
--
ALTER TABLE `insurances`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `maladaptives`
--
ALTER TABLE `maladaptives`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reduction_goals`
--
ALTER TABLE `reduction_goals`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `registro_clinicos`
--
ALTER TABLE `registro_clinicos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
