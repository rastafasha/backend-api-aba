-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 04-03-2024 a las 19:35:30
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
  `type_of_assessment` tinyint(1) DEFAULT '3' COMMENT '1:Assessment,2:Reassessment, 3:Initial',
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
(1, 5, 'cliente3243', 1, 1, '[{\"document_title\": \"ADOs\", \"document_status\": \"yes\"}]', 'asdsa', 'dsadsa', 'dsads', 'dsadas', 'dsasd', '[{\"baseline_level\": \"dsadasdas\", \"initial_interesting\": 32, \"maladaptive_behavior\": \"Negative Self talk\", \"topografical_definition\": \"adassad\"}, {\"baseline_level\": \"dasadssad\", \"initial_interesting\": 23, \"maladaptive_behavior\": \"dasdsa\", \"topografical_definition\": \"dasdsa\"}]', 'sadsa', '[{\"assestment_title\": \"dasdas\", \"assestment_status\": \"yes\"}]', '[{\"behavior\": \"das\", \"hypothesized_functions\": \"das\", \"prevalent_setting_event_and_atecedent\": \"das\"}, {\"behavior\": \"sdad\", \"hypothesized_functions\": \"sa\", \"prevalent_setting_event_and_atecedent\": \"dsa\"}]', '[{\"dra\": \"dsaad\", \"dro\": \"dsada\", \"ncr\": \"dasdas\", \"pairing\": \"dasdas\", \"shaping\": \"dasda\", \"chaining\": \"dsa\", \"redirection\": \"dasdas\", \"response_block\": \"dsad\", \"premack_principal\": \"dasda\", \"errorless_teaching\": \"dassd\"}]', NULL, '2024-01-30 21:41:01', '2024-02-22 22:30:26', NULL),
(3, 7, 'asd234', 1, 1, '[{\"document_title\": \"dasasd\", \"document_status\": \"pending\"}]', 'dasads', 'dasdas', 'dasdas', 'dasdas', 'dsads', '[{\"baseline_level\": \"Maladaptives dsadsa\", \"initial_interesting\": 34, \"maladaptive_behavior\": \"Maladaptives\", \"topografical_definition\": \"dsadsadsadas\"}, {\"baseline_level\": \"dasas\", \"initial_interesting\": 23, \"maladaptive_behavior\": \"dsads\", \"topografical_definition\": \"asdas\"}, {\"baseline_level\": \"dasds\", \"initial_interesting\": 23, \"maladaptive_behavior\": \"Negative Self talk\", \"topografical_definition\": \"das\"}]', 'dasdas', '[{\"assestment_title\": \"dsadsa\", \"assestment_status\": \"pending\"}]', '[{\"behavior\": \"dadas\", \"hypothesized_functions\": \"dsaad\", \"prevalent_setting_event_and_atecedent\": \"dsasd\"}, {\"behavior\": \"dasdasd\", \"hypothesized_functions\": \"asdas\", \"prevalent_setting_event_and_atecedent\": \"saddas\"}, {\"behavior\": \"dasdsa\", \"hypothesized_functions\": \"ads\", \"prevalent_setting_event_and_atecedent\": \"asd\"}]', '[{\"dra\": \"dasds\", \"dro\": \"dasad\", \"ncr\": \"dsadas\", \"pairing\": \"asads\", \"shaping\": \"dsada\", \"chaining\": \"dsaad\", \"redirection\": \"das\", \"response_block\": \"dasa\", \"premack_principal\": \"dasad\", \"errorless_teaching\": \"dsadasdsa\"}]', NULL, '2024-02-01 03:35:32', '2024-02-07 06:45:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consent_to_treatments`
--

CREATE TABLE `consent_to_treatments` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `analyst_signature` varchar(255) DEFAULT NULL,
  `analyst_signature_date` timestamp NULL DEFAULT NULL,
  `parent_guardian_signature` varchar(255) DEFAULT NULL,
  `parent_guardian_signature_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `consent_to_treatments`
--

INSERT INTO `consent_to_treatments` (`id`, `bip_id`, `patient_id`, `client_id`, `analyst_signature`, `analyst_signature_date`, `parent_guardian_signature`, `parent_guardian_signature_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'signatures/AA1HtTe90AqaAC1tfeOiWZOFBrwS6jl5sXVN1sTp.jpg', '2024-02-17 16:00:00', 'signatures/IvdhT1RnZbCntMGx2p2CFuNjph4Gg6buSfa3bNgS.jpg', '2024-02-23 16:00:00', '2024-02-16 19:33:49', '2024-02-16 19:33:49', NULL);

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
-- Estructura de tabla para la tabla `crisis_plans`
--

CREATE TABLE `crisis_plans` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `crisis_description` text,
  `crisis_note` text,
  `caregiver_requirements_for_prevention_of_crisis` text,
  `risk_factors` json DEFAULT NULL,
  `suicidalities` json DEFAULT NULL,
  `homicidalities` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `crisis_plans`
--

INSERT INTO `crisis_plans` (`id`, `bip_id`, `patient_id`, `client_id`, `crisis_description`, `crisis_note`, `caregiver_requirements_for_prevention_of_crisis`, `risk_factors`, `suicidalities`, `homicidalities`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'dsaads', 'dasadsdas', NULL, '[{\"other\": \"dsadasdadsadsa\", \"elopement\": true, \"aggression\": true, \"do_not_apply\": true, \"fire_setting\": true, \"impulsive_behavior\": true, \"psychotic_symptoms\": true, \"assaultive_behavior\": true, \"current_family_violence\": true, \"current_substance_abuse\": true, \"self_injurious_behavior\": true, \"self_mutilation_cutting\": true, \"dealing_with_significant\": true, \"sexually_offending_behavior\": true, \"caring_for_ill_family_recipient\": true, \"prior_psychiatric_inpatient_admission\": true}]', '[{\"plan\": true, \"means\": true, \"ideation\": true, \"not_present\": false, \"prior_attempt\": false}]', '[{\"plan_homicidality\": true, \"means_homicidality\": true, \"ideation_homicidality\": false, \"not_present_homicidality\": false, \"prior_attempt_homicidality\": true}]', '2024-02-14 23:15:10', '2024-02-15 05:19:09', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `de_escalation_techniques`
--

CREATE TABLE `de_escalation_techniques` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text,
  `service_recomendation` text,
  `recomendation_lists` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `de_escalation_techniques`
--

INSERT INTO `de_escalation_techniques` (`id`, `bip_id`, `patient_id`, `client_id`, `description`, `service_recomendation`, `recomendation_lists`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'dsaadsdasdas', 'dassddasds', '[{\"cpt\": \"sdada\", \"location\": \"In Home\", \"num_units\": 2, \"locationnew\": \"In Home\", \"breakdown_per_week\": \"dsadas\", \"description_service\": \"adsads\"}, {\"cpt\": \"dasdsadsa\", \"location\": \"In Home/School\", \"num_units\": 23, \"breakdown_per_week\": \"23dsadsa\", \"description_service\": \"dsa\"}, {\"cpt\": \"saddsads\", \"location\": \"In Home\", \"num_units\": 23, \"breakdown_per_week\": \"das\", \"description_service\": \"adsa\"}, {\"cpt\": \"dsadsa\", \"location\": \"In Home/Community\", \"num_units\": 23, \"breakdown_per_week\": \"das\", \"description_service\": \"dasads\"}]', '2024-02-14 21:52:35', '2024-02-22 21:06:46', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_schedule_hours`
--

CREATE TABLE `doctor_schedule_hours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hour_start` varchar(50) NOT NULL,
  `hour_end` varchar(50) NOT NULL,
  `hour` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `doctor_schedule_hours`
--

INSERT INTO `doctor_schedule_hours` (`id`, `hour_start`, `hour_end`, `hour`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '08:00:00', '08:15:00', '08', NULL, NULL, NULL),
(2, '08:15:00', '08:30:00', '08', NULL, NULL, NULL),
(3, '08:30:00', '08:45:00', '08', NULL, NULL, NULL),
(4, '08:45:00', '09:00:00', '08', NULL, NULL, NULL),
(5, '09:00:00', '09:15:00', '09', NULL, NULL, NULL),
(6, '09:15:00', '09:30:00', '09', NULL, NULL, NULL),
(7, '09:30:00', '09:45:00', '09', NULL, NULL, NULL),
(8, '09:45:00', '10:00:00', '09', NULL, NULL, NULL),
(9, '10:00:00', '10:15:00', '10', NULL, NULL, NULL),
(10, '10:15:00', '10:30:00', '10', NULL, NULL, NULL),
(11, '10:30:00', '10:45:00', '10', NULL, NULL, NULL),
(12, '10:45:00', '11:00:00', '10', NULL, NULL, NULL),
(13, '11:00:00', '11:15:00', '11', NULL, NULL, NULL),
(14, '11:15:00', '11:30:00', '11', NULL, NULL, NULL),
(15, '11:30:00', '11:45:00', '11', NULL, NULL, NULL),
(16, '11:45:00', '12:00:00', '11', NULL, NULL, NULL),
(17, '12:00:00', '12:15:00', '12', NULL, NULL, NULL),
(18, '12:15:00', '12:30:00', '12', NULL, NULL, NULL),
(19, '12:30:00', '12:45:00', '12', NULL, NULL, NULL),
(20, '12:45:00', '13:00:00', '12', NULL, NULL, NULL),
(21, '13:00:00', '13:15:00', '13', NULL, NULL, NULL),
(22, '13:15:00', '13:30:00', '13', NULL, NULL, NULL),
(23, '13:30:00', '13:45:00', '13', NULL, NULL, NULL),
(24, '13:45:00', '14:00:00', '13', NULL, NULL, NULL),
(25, '14:00:00', '14:15:00', '14', NULL, NULL, NULL),
(26, '14:15:00', '14:30:00', '14', NULL, NULL, NULL),
(27, '14:30:00', '14:45:00', '14', NULL, NULL, NULL),
(28, '14:45:00', '15:00:00', '14', NULL, NULL, NULL),
(29, '15:00:00', '15:15:00', '15', NULL, NULL, NULL),
(30, '15:15:00', '15:30:00', '15', NULL, NULL, NULL),
(31, '15:30:00', '15:45:00', '15', NULL, NULL, NULL),
(32, '15:45:00', '16:00:00', '15', NULL, NULL, NULL),
(33, '16:00:00', '16:15:00', '16', NULL, NULL, NULL),
(34, '16:15:00', '16:30:00', '16', NULL, NULL, NULL),
(35, '16:30:00', '16:45:00', '16', NULL, NULL, NULL),
(36, '16:45:00', '17:00:00', '16', NULL, NULL, NULL),
(37, '17:00:00', '17:15:00', '17', NULL, NULL, NULL),
(38, '17:15:00', '17:30:00', '17', NULL, NULL, NULL),
(39, '17:30:00', '17:45:00', '17', NULL, NULL, NULL),
(40, '17:45:00', '18:00:00', '17', NULL, NULL, NULL);

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
-- Estructura de tabla para la tabla `family_envolments`
--

CREATE TABLE `family_envolments` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `caregivers_training_goals` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `family_envolments`
--

INSERT INTO `family_envolments` (`id`, `bip_id`, `patient_id`, `client_id`, `caregivers_training_goals`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, '[{\"criteria\": \"asads\", \"initiation\": \"2024-02-13T04:00:00.000Z\", \"caregiver_goal\": \"daads\", \"current_status\": \"pending\", \"outcome_measure\": \"asdasdd\"}, {\"criteria\": \"dasads\", \"initiation\": \"2024-02-15T04:00:00.000Z\", \"caregiver_goal\": \"addasads\", \"current_status\": \"yes\", \"outcome_measure\": \"dasasddas\"}, {\"criteria\": \"das\", \"initiation\": \"2024-02-22T04:00:00.000Z\", \"caregiver_goal\": \"dsaasd\", \"current_status\": \"new\", \"outcome_measure\": \"dasasd\"}]', '2024-02-11 23:06:11', '2024-02-21 19:35:07', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generalization_trainings`
--

CREATE TABLE `generalization_trainings` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discharge_plan` text,
  `transition_fading_plans` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `generalization_trainings`
--

INSERT INTO `generalization_trainings` (`id`, `bip_id`, `patient_id`, `client_id`, `discharge_plan`, `transition_fading_plans`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'dasdsad', '[{\"phase\": \"sadsa\", \"description\": \"dsadsa\"}, {\"phase\": \"dsadsad\", \"description\": \"sadsa\"}]', '2024-02-14 22:38:07', '2024-02-14 22:39:55', NULL);

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
  `avatar` varchar(255) DEFAULT NULL,
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

INSERT INTO `locations` (`id`, `title`, `avatar`, `city`, `state`, `zip`, `address`, `email`, `phone1`, `phone2`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Candelaria', 'locations/4RkuD10qGcTnfKRXHd2jX594dBVu78RdgDADZfRc.jpg', 'Candelaria', 'Capital', '1010', 'Centro Comercial Sambil Candelaria, Local e23', 'AbaThepC@app.com', '324432', '55665654', '2024-02-01 20:32:49', '2024-02-01 20:58:42', NULL),
(2, 'Chacao', 'locations/Ysx7n3mCj1a7wZuojaplfMPjXjs68MlyDJ5Usts4.jpg', 'dasdas', 'dasdsa', '234we', 'Centro Comercial Sambil Chacao, Local e23', 'AbaThepCh@app.com', '2344432', '55665654', '2024-02-01 20:33:21', '2024-02-01 20:58:06', NULL),
(3, 'Santa Paula', 'locations/4RkuD10qGcTnfKRXHd2jX594dBVu78RdgDADZfRc.jpg', 'Caracas', 'Distrito Capital', '1010A', 'Centro Comercial Santa paula, Local e23', 'AbaThep@app.com', '3223444', '55665654', '2024-02-01 20:35:26', '2024-02-08 09:28:05', NULL);

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
(8, 'App\\Models\\User', 6),
(7, 'App\\Models\\User', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitoring_evaluatings`
--

CREATE TABLE `monitoring_evaluatings` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `treatment_fidelity` text,
  `rbt_training_goals` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `monitoring_evaluatings`
--

INSERT INTO `monitoring_evaluatings` (`id`, `bip_id`, `patient_id`, `client_id`, `treatment_fidelity`, `rbt_training_goals`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'dsadsadsdsa', '[{\"lto\": \"RBT will independently demonstrate DRA procedure, near 100% of opportunities, across two consecutive observations.\", \"date\": \"2024-02-22T04:00:00.000Z\", \"goal\": \"fwerf\", \"status\": \"mastered\", \"current_status\": \"sdfsd\"}, {\"lto\": \"RBT will independently demonstrate Redirection procedure, near 100% of opportunities, across two consecutive observations.\", \"date\": \"2024-02-29T04:00:00.000Z\", \"goal\": \"32\", \"status\": \"inprogress\", \"current_status\": \"15 incidents per week\"}, {\"lto\": \"RBT will independently demonstrate appropriate data collection, near 100% of opportunities, across two consecutive observations.\", \"date\": \"2024-03-04T04:00:00.000Z\", \"status\": \"inprogress\"}]', '2024-02-14 22:55:55', '2024-03-04 22:50:19', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `note_bcbas`
--

CREATE TABLE `note_bcbas` (
  `id` bigint(20) NOT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `birth_date` timestamp NULL DEFAULT NULL,
  `cpt_code` varchar(255) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `note_description` text,
  `rendering_provider` bigint(20) DEFAULT NULL,
  `aba_supervisor` bigint(20) DEFAULT NULL,
  `caregiver_goals` json DEFAULT NULL,
  `rbt_training_goals` json DEFAULT NULL,
  `provider_signature` varchar(255) DEFAULT NULL,
  `provider_name` bigint(20) UNSIGNED DEFAULT NULL,
  `supervisor_signature` varchar(255) DEFAULT NULL,
  `supervisor_name` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `note_rbts`
--

CREATE TABLE `note_rbts` (
  `id` bigint(20) NOT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `provider_name_g` bigint(20) UNSIGNED DEFAULT NULL,
  `provider_credential` varchar(255) DEFAULT NULL,
  `pos` varchar(255) DEFAULT NULL,
  `session_date` timestamp NULL DEFAULT NULL,
  `time_in` double DEFAULT NULL,
  `time_out` double DEFAULT NULL,
  `time_in2` double DEFAULT NULL,
  `time_out2` double DEFAULT NULL,
  `session_length_total` double DEFAULT NULL,
  `environmental_changes` varchar(255) DEFAULT NULL,
  `maladaptives` json DEFAULT NULL,
  `replacements` json DEFAULT NULL,
  `interventions` json DEFAULT NULL,
  `meet_with_client_at` varchar(255) DEFAULT NULL,
  `client_appeared` varchar(255) DEFAULT NULL,
  `as_evidenced_by` varchar(255) DEFAULT NULL,
  `rbt_modeled_and_demonstrated_to_caregiver` varchar(255) DEFAULT NULL,
  `client_response_to_treatment_this_session` text,
  `progress_noted_this_session_compared_to_previous_session` varchar(255) DEFAULT NULL,
  `next_session_is_scheduled_for` timestamp NULL DEFAULT NULL,
  `provider_signature` varchar(255) DEFAULT NULL,
  `provider_name` bigint(20) UNSIGNED DEFAULT NULL,
  `supervisor_signature` varchar(255) DEFAULT NULL,
  `supervisor_name` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `note_rbts`
--

INSERT INTO `note_rbts` (`id`, `doctor_id`, `patient_id`, `bip_id`, `provider_name_g`, `provider_credential`, `pos`, `session_date`, `time_in`, `time_out`, `time_in2`, `time_out2`, `session_length_total`, `environmental_changes`, `maladaptives`, `replacements`, `interventions`, `meet_with_client_at`, `client_appeared`, `as_evidenced_by`, `rbt_modeled_and_demonstrated_to_caregiver`, `client_response_to_treatment_this_session`, `progress_noted_this_session_compared_to_previous_session`, `next_session_is_scheduled_for`, `provider_signature`, `provider_name`, `supervisor_signature`, `supervisor_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 1, 6, 'dsadasd', '234', '2024-03-01 08:00:00', 800, 1345, 915, 1545, NULL, 'dasdas', '\"[{\\\"maladaptive_behavior\\\":\\\"dasdsa\\\",\\\"number_of_occurrences\\\":45},{\\\"maladaptive_behavior\\\":\\\"Negative Self talk\\\",\\\"number_of_occurrences\\\":34}]\"', '\"[{\\\"goal\\\":\\\"new\\\",\\\"total_trials\\\":33,\\\"number_of_correct_response\\\":22},{\\\"goal\\\":\\\"nuevo\\\",\\\"total_trials\\\":56,\\\"number_of_correct_response\\\":44},{\\\"goal\\\":\\\"dasads\\\",\\\"total_trials\\\":33,\\\"number_of_correct_response\\\":44},{\\\"goal\\\":\\\"prueba nueva\\\",\\\"total_trials\\\":34,\\\"number_of_correct_response\\\":44},{\\\"goal\\\":\\\"probando Update\\\",\\\"total_trials\\\":55,\\\"number_of_correct_response\\\":44}]\"', '\"[]\"', 'waiting', 'requested', 'reviewing', 'dasd', 'dasda', 'dsadsa', '2024-03-15 16:00:00', 'noterbts/1S9qae6o4460Yl6m6kJ55EAfDG35ex3ASQGaxHAf.jpg', 6, 'noterbts/RoF2e6zqmsacYSwL6KOXfubkMdoyGi8dSMpfo4Ms.png', 7, '2024-03-02 06:26:53', '2024-03-03 17:49:02', '2024-03-03 17:49:02'),
(2, 1, 'cliente3243', 1, 6, 'dsadasd', 'dasdsa', '2024-03-01 12:00:00', 800, 1045, 1115, 1300, NULL, 'asddas', '\"[{\\\"maladaptive_behavior\\\":\\\"Negative Self talk\\\",\\\"number_of_occurrences\\\":76},{\\\"maladaptive_behavior\\\":\\\"dasdsa\\\",\\\"number_of_occurrences\\\":88}]\"', '\"[{\\\"goal\\\":\\\"nuevo\\\",\\\"total_trials\\\":23,\\\"number_of_correct_response\\\":23},{\\\"goal\\\":\\\"dasads\\\",\\\"total_trials\\\":23,\\\"number_of_correct_response\\\":32},{\\\"goal\\\":\\\"prueba nueva\\\",\\\"total_trials\\\":32,\\\"number_of_correct_response\\\":43},{\\\"goal\\\":\\\"probando Update\\\",\\\"total_trials\\\":70,\\\"number_of_correct_response\\\":65},{\\\"goal\\\":\\\"new\\\",\\\"total_trials\\\":80,\\\"number_of_correct_response\\\":34}]\"', '\"[{\\\"pairing\\\":true,\\\"DRO\\\":true,\\\"errorless_teaching\\\":true,\\\"extinction\\\":true,\\\"natural_teaching\\\":true}]\"', 'waiting', 'waiting', 'requested', 'asdas', 'dasdsa', 'dadsa', '2024-03-21 16:00:00', 'noterbts/xkwDp9xZznUfcYPnveyUlwrywC65k5iF6aEJKGL8.jpg', 6, 'noterbts/CvIJx9AKcpvdP2ppSA6hqcqv5uEsNjqGpU6mgDRB.png', 7, '2024-03-02 06:32:22', '2024-03-02 06:36:45', NULL),
(3, 1, 'cliente3243', 1, 5, 'dasdas', '3234dsa', '2024-03-03 16:00:00', 800, 1130, 1500, 1915, NULL, 'enviromental changes', '\"[{\\\"maladaptive_behavior\\\":\\\"Negative Self talk\\\",\\\"number_of_occurrences\\\":6},{\\\"maladaptive_behavior\\\":\\\"dasdsa\\\",\\\"number_of_occurrences\\\":13}]\"', '\"[{\\\"goal\\\":\\\"probando Update\\\",\\\"total_trials\\\":32,\\\"number_of_correct_response\\\":43},{\\\"goal\\\":\\\"new\\\",\\\"total_trials\\\":3,\\\"number_of_correct_response\\\":4},{\\\"goal\\\":\\\"nuevo\\\",\\\"total_trials\\\":4,\\\"number_of_correct_response\\\":4},{\\\"goal\\\":\\\"dasads\\\",\\\"total_trials\\\":45,\\\"number_of_correct_response\\\":46},{\\\"goal\\\":\\\"prueba nueva\\\",\\\"total_trials\\\":34,\\\"number_of_correct_response\\\":45}]\"', '\"[{\\\"pairing\\\":true,\\\"errorless_teaching\\\":true,\\\"NCR\\\":true,\\\"extinction\\\":true}]\"', 'waiting', 'requested', 'waiting', 'dsffds', 'fdsfds', 'fdsfds', '2024-03-15 16:00:00', 'noterbts/zQ64450F8qg7fS98Wd5CWEnpdY1VFMlRYKbfRhgE.png', 6, 'noterbts/cMupYoIm54g44NYFwDmYSri9ouWd7I3OZwODszDg.png', 7, '2024-03-03 17:45:01', '2024-03-03 17:45:01', NULL);

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
  `insurer_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `status` enum('incoming','active','inactive') NOT NULL DEFAULT 'inactive',
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
  `eligibility` enum('pending','waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') NOT NULL DEFAULT 'pending',
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

INSERT INTO `patients` (`id`, `location_id`, `patient_id`, `first_name`, `last_name`, `email`, `phone`, `language`, `parent_guardian_name`, `relationship`, `home_phone`, `work_phone`, `school_name`, `school_number`, `zip`, `state`, `address`, `gender`, `birth_date`, `age`, `avatar`, `city`, `education`, `profession`, `schedule`, `summer_schedule`, `special_note`, `insurer_id`, `insuranceId`, `insuranceId_secundary`, `elegibility_date`, `pos_covered`, `deductible_individual_I_F`, `balance`, `coinsurance`, `copayments`, `oop`, `diagnosis_code`, `status`, `patient_control`, `pa_assessments`, `compayment_per_visit`, `insurer_secundary`, `welcome`, `consent`, `insurance_card`, `mnl`, `referral`, `ados`, `iep`, `asd_diagnosis`, `cde`, `submitted`, `eligibility`, `rbt_id`, `rbt2_id`, `bcba_id`, `bcba2_id`, `clin_director_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, NULL, 'prueba4', 'prueba4', 'prueba4', 'prueba4@prueba4.com', '2132', 'prueba4, prueba4, prueba4', 'prueba4', 'prueba4', '534354', '234423', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 2, '2024-01-27 20:00:00', '32', 'patients/gpZvc8J7nt67vm0qUMMAfhNNfKnAtMH1zzr6r3HD.jpg', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 2, 'prueba4', 'prueba4', '2024-01-26 20:00:00', '03', '3243/432', '2545/354543', '20%/43%', '12/12', '340/434', 'prueba4', 'incoming', 'prueba4', NULL, NULL, 'prueba4', 'waiting', 'requested', 'reviewing', 'reviewing', 'reviewing', 'reviewing', 'reviewing', 'psycho eval', '2 insurance', '2 insurance', 'pending', 5, 3, 3, 3, 4, '2024-01-28 05:39:48', '2024-02-28 01:36:37', NULL),
(5, NULL, 'cliente3243', 'ClientePrueba', 'ClienteAp', 'ClientePrueba@cliente.com', '3234', 'ads, dsadsa, adsdsa,dasdas', 'daad', 'das', '23443', '23432', 'dsada', 'dasda', 'asd', 'dsadsa', 'dsasd', 1, '2024-01-23 12:00:00', '23', 'patients/hacQifivrjCOOU1U9NjAmi2SUIOO5q0jD4vQICSY.jpg', 'dasdsa', 'adsdsa', 'ddas', 'dasda', 'dsaad', 'dsads', 2, 'dsadas', 'adsdsa', '2024-01-24 12:00:00', '03', '32320/2332', '2323/2332', '23/32', '23/23', '324/3232', 'dadsda', 'active', 'adsds', '\"[{\\\"pa_assessment\\\":\\\"dasdas\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-09T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"adsdas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97151\\\",\\\"n_units\\\":23}]\"', NULL, 'asddsa', 'waiting', 'requested', 'reviewing', 'reviewing', 'reviewing', 'psycho eval', 'psycho eval', 'reviewing', 'reviewing', 'reviewing', 'pending', 6, 5, 7, 4, 3, '2024-01-31 01:39:09', '2024-03-01 17:23:50', NULL),
(6, NULL, 'cliente3', 'Cliente3', 'Clientepe', 'Cliente3@cliente.com', '24334', 'adsdas', 'qdasdsa', 'dadsa', '234423', '234432', 'dasd', '3123321', 'Cliente3', NULL, NULL, 1, '2024-01-30 20:00:00', '14', 'patients/DCcvJc7Lc3pGGN0Brb2a29hCmBBgdJCMeAdC4lec.jpg', 'undefined', 'dsads', 'dasda', 'Cliente3', 'Cliente3', 'Cliente3', 1, 'das', 'das', '2024-01-31 20:00:00', '03', 'das', 'das', 'dsa', 'das', 'dsa', 'undefined', 'active', 'dsa', NULL, NULL, 'das', 'requested', 'requested', 'reviewing', 'psycho eval', 'requested', 'reviewing', 'psycho eval', 'psycho eval', 'reviewing', 'reviewing', 'pending', 3, 2, 2, 2, 2, '2024-01-31 06:32:32', '2024-02-28 02:40:44', NULL),
(7, NULL, 'asd234', 'asdasddsa', 'asdasddsa', 'dasads@das.com', 'dasad', 'adsda, dasdas, adsdas', 'dasad', 'dada', 'dadas', 'dadsa', 'dasdas', 'dasda', 'das', 'dasdsa', 'dsads', 2, '2024-01-18 20:00:00', '32', 'patients/n7D5rEBEPBuzn13Q0GGMT01Vy6aF7cxkB5ka8VVO.jpg', 'asddsa', 'asdas', 'dasasd', 'dsadsa', 'dsads', 'dsasd', 2, 'das', 'dsa', '2024-01-11 20:00:00', '12', 'adsdsa', 'dsads', 'dsa', 'dsads', 'dsasd', 'dsasd', 'active', 'asdads12321', NULL, NULL, 'das', 'waiting', 'requested', 'reviewing', 'psycho eval', 'need new', 'need new', '2 insurance', 'reviewing', 'yes', 'no', 'pending', 4, 3, 4, 1, 4, '2024-02-01 05:07:31', '2024-02-28 02:40:48', NULL),
(8, 2, 'cli32232', 'dsads', 'dsads', 'dsad', 'dasdas', 'dsaad', 'dsada', 'dsasd', 'dasddsa', 'dsaads', 'dsaads', 'dsaads', 'dasdas', 'dsads', 'dasdas', 1, '2024-10-01 12:00:00', '32', NULL, 'ddsadas', 'das', 'adsads', 'dsasd', 'dsaads', 'dsaasd', 2, 'saddsa', 'dsaads', '2024-01-26 12:00:00', '12', 'dasads', 'dsads', 'dsasd', 'dsads', 'dsaads', 'dsads', 'inactive', 'dsaasd', '\"[{\\\"pa_assessment\\\":\\\"saads\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-15T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-08T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"dasads\\\",\\\"pa_services_start_date\\\":\\\"2024-02-08T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-07T04:00:00.000Z\\\"},{\\\"pa_assessment\\\":\\\"dasdas\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-08T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-06T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"dsadas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-22T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-13T04:00:00.000Z\\\"}]\"', NULL, 'dasads', 'requested', 'psycho eval', 'need new', 'psycho eval', 'psycho eval', 'psycho eval', 'requested', 'yes', 'reviewing', 'requested', 'pending', 6, 5, 7, 4, 1, '2024-02-01 05:36:04', '2024-02-04 00:36:20', NULL),
(9, 1, 'adsds9999', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh, jhgjgh jhgjgh, jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 1, '2024-08-02 12:00:00', '12', 'patients/04E4P35o771AxL2Tow4OFDY3kQPAOA08uMzlxxiT.jpg', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 'jhgjgh', 1, 'fsdf', 'dasads', '2024-02-09 12:00:00', '12', 'asdads', 'dsa', 'dsa', 'dsa', 'das', 'jhgjgh', 'inactive', 'dsa', '\"[{\\\"pa_assessment\\\":\\\"asd\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-07T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-06T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"das\\\",\\\"pa_services_start_date\\\":\\\"2024-02-21T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-21T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97153\\\",\\\"n_units\\\":\\\"asddsa\\\"},{\\\"pa_assessment\\\":\\\"dsadas\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-15T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-14T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"adsdas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-09T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-06T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97156\\\",\\\"n_units\\\":\\\"das\\\"}]\"', NULL, 'sdf', 'waiting', 'psycho eval', 'psycho eval', 'psycho eval', 'psycho eval', '2 insurance', 'requested', 'need new', 'reviewing', 'reviewing', 'pending', 6, 6, 7, 7, 1, '2024-02-04 03:16:34', '2024-02-28 01:36:30', '2024-02-28 01:36:30'),
(10, 3, 'fsddfs5', 'gfdfgd', 'fgdfgd', 'fdssd', 'fsdsfd', 'sdfsd', 'sfdfds', 'fdsdsf', 'fdssdf', 'fsddsffdsfsd', 'fdsfds', 'fsdfds', 'fdsfsd', 'fsdfsd', 'fdsfsd', 2, '2024-02-08 20:00:00', '34', NULL, 'fsdfs', 'fdsdf', 'fdsfd', 'fdssdf', 'fdsfd', 'fssd', 1, 'fdfdsfds', 'dfsfds', '2024-02-08 20:00:00', '12', 'dfsdsf', 'fdsdsf', 'fdsdfs', 'fdsfds', 'fsdfds', 'fdsfsd', 'inactive', 'dfsfds', '\"[{\\\"pa_assessment\\\":\\\"fdsfsd\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-06T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-14T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"fdsdfs\\\",\\\"pa_services_start_date\\\":\\\"2024-02-15T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-29T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97155\\\",\\\"n_units\\\":\\\"fdsfds\\\"}]\"', NULL, 'fsdsdf', 'requested', 'waiting', 'psycho eval', 'need new', '2 insurance', 'psycho eval', '2 insurance', 'yes', 'psycho eval', '2 insurance', 'pending', 6, 5, 7, 4, 1, '2024-02-04 03:34:13', '2024-02-28 01:36:26', '2024-02-28 01:36:26'),
(11, 3, 'revision1', 'revision2', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 2, '2024-02-07 20:00:00', '23', 'patients/tZ0LZWP0A4HqawCeyFp9ZXEbtdNl2GCzGhuCw94V.jpg', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 2, 'revision', 'revision', '2024-02-08 20:00:00', '12', 'revision', 'revision', 'revision', 'revision', 'revision', 'revision', 'inactive', 'revision', '\"[]\"', NULL, 'revision', 'requested', 'reviewing', 'reviewing', 'reviewing', 'requested', 'reviewing', 'reviewing', 'requested', 'reviewing', 'reviewing', 'pending', 6, 5, 7, 4, 3, '2024-02-07 23:21:08', '2024-02-28 01:36:22', '2024-02-28 01:36:22'),
(12, 2, 'pbene01', 'prueba', 'beneficios', 'beneficios@beneficios.com', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 2, '2024-02-09 20:00:00', '3', 'patients/HU5aESUxm9Y7MN0LNv1V8sefRtD2vr7Ez0x2IPhs.jpg', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 'beneficios', 1, 'beneficios', 'beneficios', '2024-02-15 20:00:00', '12', 'beneficios/beneficios', 'beneficios/beneficios', 'beneficios/beneficios', 'beneficios/beneficios', 'beneficios', 'beneficios', 'inactive', 'beneficios', '\"[{\\\"pa_assessment\\\":\\\"beneficios\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-09T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-15T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"beneficios2\\\",\\\"pa_services_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-15T04:00:00.000Z\\\",\\\"cpt\\\":\\\"H0032\\\",\\\"n_units\\\":\\\"beneficios\\\"},{\\\"pa_assessment\\\":\\\"asdsa\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-14T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-15T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"asd\\\",\\\"pa_services_start_date\\\":\\\"2024-02-21T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-22T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97156\\\",\\\"n_units\\\":23},{\\\"pa_assessment\\\":\\\"dsadas\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-07T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-14T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"asddas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-06T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-29T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97157\\\",\\\"n_units\\\":33}]\"', NULL, 'beneficios', 'yes', 'requested', 'need new', 'requested', 'psycho eval', 'reviewing', 'need new', 'need new', 'psycho eval', 'need new', 'requested', 6, 5, 4, 7, 1, '2024-02-09 01:52:19', '2024-02-28 01:36:17', '2024-02-28 01:36:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_files`
--

CREATE TABLE `patient_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `name_file` varchar(250) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `file` varchar(250) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `patient_files`
--

INSERT INTO `patient_files` (`id`, `patient_id`, `name_file`, `size`, `resolution`, `file`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'cliente3243', '422441034_326433247058998_8423195820143934154_n.jpg', '40814', '517x540', 'patientFiles/H9vEKuHpZ16ldgQSItBU2qLyieM0nBiDzuOZvtfz.jpg', 'jpg', '2024-03-01 18:00:21', '2024-03-01 18:08:06', '2024-03-01 18:08:06'),
(2, 'cliente3243', 'bill_1611154.png', '17257', '512x512', 'patientFiles/Po4Gmi7nj5YBKqVfjTNOxEhGnjqK5ZBgBxL5wxuh.png', 'png', '2024-03-01 18:00:21', '2024-03-01 18:00:21', NULL),
(3, 'cliente3243', '422441034_326433247058998_8423195820143934154_n.jpg', '40814', '517x540', 'patientFiles/VRT7mFeFb4FxybLeTp4YCyqPFPRwewFvx1YfyzCx.jpg', 'jpg', '2024-03-01 18:02:30', '2024-03-01 18:02:30', NULL),
(4, 'cliente3243', 'bill_1611154.png', '17257', '512x512', 'patientFiles/z9WTaewFuZuWuTjndFaEAWyrXXPXK2tiyVqr6C1D.png', 'png', '2024-03-01 18:02:30', '2024-03-01 18:02:30', NULL),
(5, 'cliente3243', 'logo-CSLDC.png', '57664', '1253x612', 'patientFiles/5Pv3NshBoUBYXX8T2ad2lLN9eE5wQlj9b7jWjBb0.png', 'png', '2024-03-02 18:57:50', '2024-03-02 18:59:04', '2024-03-02 18:59:04'),
(6, 'cliente3243', 'Screenshot 2024-02-24 at 11.16.09 AM.png', '34003', '261x384', 'patientFiles/JZmsM00sdaedekqxEZFUONjR28DBjd1FzYaENDUV.png', 'png', '2024-03-02 18:57:50', '2024-03-02 18:57:50', NULL),
(7, 'cliente3243', 'Screenshot 2024-02-28 at 12.36.47 PM.png', '11846', '98x94', 'patientFiles/BsFgCvGFZig4USJvN47iLHJr7KPHk3L7Pdxa5tfG.png', 'png', '2024-03-02 18:57:50', '2024-03-02 18:57:50', NULL),
(8, 'cliente3243', 'dispatchtable.xml', '2824', NULL, 'patientFiles/AZ5TAjPYogO26oXOoxPZEJvwAqnAWCK5MiUZ7LVf.xml', 'xml', '2024-03-02 19:00:33', '2024-03-02 19:11:40', '2024-03-02 19:11:40'),
(9, 'cliente3243', 'dispatchtable.xml', '2824', NULL, 'patientFiles/4usIpL7h84qmnMwRGO2gFieKUhSeTSWhZQm7dUMA.xml', 'xml', '2024-03-02 19:01:01', '2024-03-02 19:11:38', '2024-03-02 19:11:38'),
(10, 'cliente3243', 'Checkout  BrandCrowd.pdf', '505714', NULL, 'patientFiles/iJhsv4XlV3dPEb1ZWhfVQTG3XFfGVXMlOa3eSBL2.pdf', 'pdf', '2024-03-02 19:01:01', '2024-03-02 19:01:01', NULL),
(11, 'cliente3243', 'MercantilReferenciasBancarias.pdf', '65281', NULL, 'patientFiles/SX3hhF21f0hVFbVQWB6fK7SOkmCME8QQ6d11nUIn.pdf', 'pdf', '2024-03-03 04:02:07', '2024-03-03 04:02:07', NULL);

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
  `maladaptive` varchar(255) DEFAULT NULL,
  `current_status` varchar(155) DEFAULT NULL,
  `patient_id` varchar(150) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bip_id` bigint(20) UNSIGNED NOT NULL,
  `goalstos` json DEFAULT NULL,
  `goalltos` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reduction_goals`
--

INSERT INTO `reduction_goals` (`id`, `maladaptive`, `current_status`, `patient_id`, `client_id`, `bip_id`, `goalstos`, `goalltos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Negative Self talk', '15 incidents per week', 'cliente3243', 5, 1, '[{\"sto\": \"STO3\", \"date_sto\": \"2024-02-14T04:00:00.000Z\", \"status_sto\": \"inprogress\", \"maladaptive\": \"dasdsa\", \"decription_sto\": \"sdasa\", \"status_sto_edit\": \"mastered\"}, {\"sto\": \"1\", \"date_sto\": \"2024-02-13T04:00:00.000Z\", \"status_sto\": \"mastered\", \"maladaptive\": \"Negative Self talk\", \"decription_sto\": \"jghjgjhg\", \"status_sto_edit\": \"mastered\"}, {\"sto\": \"3\", \"date_sto\": \"2024-02-13T04:00:00.000Z\", \"status_sto\": \"discontinued\", \"maladaptive\": \"Negative Self talk\", \"decription_sto\": \"asdas\", \"status_sto_edit\": \"discontinued\"}]', '[{\"lto\": \"23\", \"date_lto\": \"2024-02-14T04:00:00.000Z\", \"status_lto\": \"discontinued\", \"decription_lto\": \"dasas\"}]', '2024-02-10 07:05:36', '2024-02-15 21:42:44', NULL);

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
(44, 6),
(47, 6),
(48, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sustitution_goals`
--

CREATE TABLE `sustitution_goals` (
  `id` bigint(20) NOT NULL,
  `goal` varchar(255) DEFAULT NULL,
  `current_status` varchar(155) DEFAULT NULL,
  `description` text,
  `patient_id` varchar(150) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bip_id` bigint(20) UNSIGNED NOT NULL,
  `goalstos` json DEFAULT NULL,
  `goalltos` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sustitution_goals`
--

INSERT INTO `sustitution_goals` (`id`, `goal`, `current_status`, `description`, `patient_id`, `client_id`, `bip_id`, `goalstos`, `goalltos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'probando Update', 'Aqui', 'Probando update', 'cliente3243', 5, 1, '[{\"sustitution_sto\": \"1\", \"initial_interesting\": \"ads\", \"sustitution_date_sto\": \"2024-02-23T04:00:00.000Z\", \"sustitution_status_sto\": \"initiated\", \"sustitution_decription_sto\": \"ads\", \"sustitution_status_sto_edit\": \"inprogress\"}]', '[{\"sustitution_lto\": \"adsdas\", \"sustitution_date_lto\": \"2024-02-15T04:00:00.000Z\", \"sustitution_status_lto\": \"initiated\", \"sustitution_decription_lto\": \"dasdas\"}]', '2024-02-21 20:33:54', '2024-02-26 18:56:05', NULL),
(2, 'new', 'new sustitution', 'new sust', 'cliente3243', 5, 1, '[{\"sustitution_sto\": \"1\", \"initial_interesting\": \"1\", \"sustitution_date_sto\": \"2024-02-22T04:00:00.000Z\", \"sustitution_status_sto\": \"inprogress\", \"sustitution_decription_sto\": \"adsdas\", \"sustitution_status_sto_edit\": \"inprogress\"}, {\"sustitution_sto\": \"1\", \"initial_interesting\": \"0\", \"sustitution_date_sto\": \"2024-02-22T04:00:00.000Z\", \"sustitution_status_sto\": \"inprogress\", \"sustitution_decription_sto\": \"dasdas\", \"sustitution_status_sto_edit\": \"inprogress\"}]', '[{\"sustitution_lto\": \"dassad\", \"sustitution_date_lto\": \"2024-02-23T04:00:00.000Z\", \"sustitution_status_lto\": \"initiated\", \"sustitution_decription_lto\": \"probando2\"}, {\"sustitution_lto\": \"adsdsa\", \"sustitution_date_lto\": \"2024-02-23T04:00:00.000Z\", \"sustitution_status_lto\": \"initiated\", \"sustitution_decription_lto\": \"dasdas\"}, {\"sustitution_lto\": \"3\", \"sustitution_date_lto\": \"2024-02-23T04:00:00.000Z\", \"sustitution_status_lto\": \"initiated\", \"sustitution_decription_lto\": \"new\"}]', '2024-02-22 19:27:29', '2024-02-22 19:27:29', NULL),
(3, 'nuevo', 'nuevo', 'nuevo', 'cliente3243', 5, 1, '[{\"sustitution_sto\": \"nuevo\", \"initial_interesting\": \"nuevo\", \"sustitution_date_sto\": \"2024-02-22T04:00:00.000Z\", \"sustitution_status_sto\": \"mastered\", \"sustitution_decription_sto\": \"nuevo\", \"sustitution_status_sto_edit\": \"mastered\"}]', '[{\"sustitution_lto\": \"nuevo\", \"sustitution_date_lto\": \"2024-02-23T04:00:00.000Z\", \"sustitution_status_lto\": \"initiated\", \"sustitution_decription_lto\": \"nuevo\"}]', '2024-02-22 19:39:32', '2024-02-22 19:39:32', NULL),
(4, 'dasads', 'ads', 'das', 'cliente3243', 5, 1, '[{\"sustitution_sto\": \"1\", \"initial_interesting\": \"ads\", \"sustitution_date_sto\": \"2024-02-23T04:00:00.000Z\", \"sustitution_status_sto\": \"initiated\", \"sustitution_decription_sto\": \"ads\", \"sustitution_status_sto_edit\": \"inprogress\"}]', '[{\"sustitution_lto\": \"adsdas\", \"sustitution_date_lto\": \"2024-02-15T04:00:00.000Z\", \"sustitution_status_lto\": \"on hold\", \"sustitution_decription_lto\": \"dasdas\"}]', '2024-02-23 04:13:08', '2024-02-23 04:13:08', NULL),
(5, 'prueba nueva', 'probando', 'probando', 'cliente3243', 5, 1, '[{\"sustitution_sto\": \"1\", \"initial_interesting\": \"nuevo\", \"sustitution_date_sto\": \"2024-02-27T04:00:00.000Z\", \"sustitution_status_sto\": \"inprogress\", \"sustitution_decription_sto\": \"sad\", \"sustitution_status_sto_edit\": \"inprogress\"}]', '[{\"sustitution_lto\": \"21\", \"sustitution_date_lto\": \"2024-02-20T04:00:00.000Z\", \"sustitution_status_lto\": \"on hold\", \"sustitution_decription_lto\": \"dasdas\"}]', '2024-02-25 18:51:19', '2024-02-25 18:51:19', NULL),
(6, 'Skill Adqusitions', 'repeat every 15 times', 'dsadsa', 'asd234', 7, 3, '[{\"sustitution_sto\": \"1\", \"initial_interesting\": \"15\", \"sustitution_date_sto\": \"2024-03-01T04:00:00.000Z\", \"sustitution_status_sto\": \"inprogress\", \"sustitution_decription_sto\": \"dasdas\", \"sustitution_status_sto_edit\": \"inprogress\"}]', '[{\"sustitution_lto\": \"1\", \"sustitution_date_lto\": \"2024-03-01T04:00:00.000Z\", \"sustitution_status_lto\": \"inprogress\", \"sustitution_decription_lto\": \"sadsa\"}]', '2024-03-01 20:05:01', '2024-03-01 20:05:01', NULL);

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

INSERT INTO `users` (`id`, `name`, `email`, `surname`, `phone`, `birth_date`, `gender`, `address`, `avatar`, `status`, `currently_pay_through_company`, `llc`, `ien`, `wc`, `electronic_signature`, `agency_location`, `city`, `languages`, `ss_number`, `date_of_hire`, `start_pay`, `driver_license_expiration`, `cpr_every_2_years`, `background_every_5_years`, `e_verify`, `national_sex_offender_registry`, `certificate_number`, `bacb_license_expiration`, `liability_insurance_annually`, `local_police_rec_every_5_years`, `npi`, `medicaid_provider`, `ceu_hippa_annually`, `ceu_domestic_violence_no_expiration`, `ceu_security_awareness_annually`, `ceu_zero_tolerance_every_3_years`, `ceu_hiv_bloodborne_pathogens_infection_control_no_expiration`, `ceu_civil_rights_no_expiration`, `school_badge`, `w_9_w_4_form`, `contract`, `two_four_week_notice_agreement`, `credentialing_package_bcbas_only`, `caqh_bcbas_only`, `contract_type`, `salary`, `location_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'superadmin@superadmin.com', NULL, NULL, NULL, 1, NULL, NULL, 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-30 03:32:36', '$2y$10$PiKCOHK3XOBlqiL0kgJwLOMILMA6uVAAS1ou7JqHsUQaH4yvPkAiC', 'guHmnxhKw1', '2023-11-30 03:32:36', '2024-01-26 01:15:51', NULL),
(2, 'Admin', 'manager@manager.com', 'Manager', '123456', '2024-01-25 16:00:00', 1, 'dasdsa', 'staffs/WdpkCmttLTmbxhXDM7FQhzWheWgr8eEbqYfMqNt4.jpg', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$X9YH3UjUALq07nGq7S5FLe6bAWZ0t6yPhNjHddtS1t9ju8FElC/UO', NULL, '2024-01-26 01:13:28', '2024-02-07 00:18:01', NULL),
(3, 'Tecnico', 'lm@lm.com', 'Doctor', '123456', '2024-01-25 08:00:00', 1, 'password', 'staffs/Br3ln1TSmcLTuQrAGbQtsxiTkmpJk2kONcvDchFB.jpg', 'active', 'dsaads', 'adsdsa', 'dsaad', 'adsdas', NULL, 'dasdsad', 'asdas', 'dasdas, adsdsa', 'adsdsa', '2024-01-25 08:00:00', '2024-01-30 08:00:00', '2030-07-26 08:00:00', 'asddas', 'dasadsd', 'asdas', 'dasads', 'dsaads', '2026-01-22 04:00:00', 'dsadas', 'dasdas', 'dasads', 'dasdas', 'dsadas', 'yes', 'dasads', 'ads', 'yes', 'dsadas', 'yes', 'no', 'yes', 'no', 'asddas', 'dsadsa', '1099', 2000, 1, NULL, '$2y$10$L9GFjttLbOyyhynDcDaKBeObcfvVA7nZ3cLph0pZvozLqsdYiXgrC', NULL, '2024-01-26 01:17:03', '2024-02-07 17:29:28', NULL),
(4, 'Doctor', 'bcba@bcba.com', 'Bcba', '123456', '2024-01-25 16:00:00', 2, 'dsadas', 'staffs/RbbNRabSWaxhSWcOX0J2GFRArBZAaWyf2cGEiCi1.jpg', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$nBs3RhKzpnMrN6NVJyc8FeIPjKtfQ6CNm63LM5KTsgt8XkbBsk4ma', NULL, '2024-01-26 01:17:55', '2024-02-07 00:17:51', NULL),
(5, 'doctor', 'rbt@rbt.com', 'Rbt', '123456', '2024-01-25 08:00:00', 2, 'dsaads', 'staffs/f7YXFPACowKcCsIse6mvhenpNHgMXw4ZeBvmip8z.jpg', 'active', 'prueba4', 'prueba4', 'prueba4', 'prueba4', NULL, 'prueba4', 'prueba4', 'prueba4, prueba4', 'prueba4', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '1970-01-01 08:00:00', 'das', 'dadd', 'dasdsa', 'dasdas', 'dasdas', '1970-01-01 04:00:00', 'dasdas', 'dasdasd', 'asdas', 'dasdas', 'dasdas', 'yes', 'dasdas', 'dasdas', 'yes', 'pruebadoc', 'yes', 'yes', 'yes', 'yes', 'pruebadoc', 'ads', 'w2', 3232, 3, NULL, '$2y$10$5YsgbtRGSUHpczYoTBETke3S/IfYzsv4q.WP2LrKUO1sFjDoNt7..', NULL, '2024-01-26 01:18:43', '2024-02-09 17:12:08', NULL),
(6, 'Maria Eugenia', 'apontemariae@gmail.com', 'Aponte', '+584122070144', '2024-01-10 08:00:00', 2, 'mariae2004', 'staffs/cm0erQamszXAiBjp5QjKlXoBMXdkjLSwMbo0Hlwt.jpg', 'active', 'dasadsda', 'sdas', 'dsadasd', 'asdas', 'signatures/N5v3gqzIkEUw1cKq0rzH6Jvk9Pagx99q8lKVCjaA.jpg', 'dasdas', 'dsadsa', 'dasdasd', 'dasdas', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '1970-01-01 08:00:00', 'asddsad', 'asasdd', 'saasd', 'dasads', 'dsadasd', '1970-01-01 04:00:00', 'saads', 'dsaads', 'dasdas', 'adsasd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, '$2y$10$q/ZdnNEwG3L30uQ9adJpLuwEd2PIZeXXS3ZTPxFLCL.JJQu.vn3T2', NULL, '2024-01-31 02:27:09', '2024-02-16 15:59:57', NULL),
(7, 'Alain', 'alain@practice-mgmt.com', 'Hernandez', '2397101864', '2024-03-11 08:00:00', 1, 'practice', 'staffs/ZNIhSxgjALKEfZp2wFDbkrRg9ANnGK1Yvwec3EcB.jpg', 'active', 'das', 'das', 'ads', 'prueba', NULL, NULL, 'asd', 'dasdsa', NULL, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '1970-01-01 08:00:00', 'das', 'das', 'das', 'dsa', 'dasd', '1970-01-01 04:00:00', 'dasda', 'dasad', 'dad', 'dasd', 'das', 'yes', 'das', 'ads', 'yes', 'adsdas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$NnOEBxaztsMzzwCmVkNyr.MNhYhWCH.9d7TTywz35Rfi876.T6vzS', NULL, '2024-01-31 02:29:13', '2024-02-09 17:12:00', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bips`
--
ALTER TABLE `bips`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consent_to_treatments`
--
ALTER TABLE `consent_to_treatments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `crisis_plans`
--
ALTER TABLE `crisis_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `de_escalation_techniques`
--
ALTER TABLE `de_escalation_techniques`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctor_schedule_hours`
--
ALTER TABLE `doctor_schedule_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `family_envolments`
--
ALTER TABLE `family_envolments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generalization_trainings`
--
ALTER TABLE `generalization_trainings`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `monitoring_evaluatings`
--
ALTER TABLE `monitoring_evaluatings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `note_bcbas`
--
ALTER TABLE `note_bcbas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `note_rbts`
--
ALTER TABLE `note_rbts`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `patient_files`
--
ALTER TABLE `patient_files`
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
-- Indices de la tabla `sustitution_goals`
--
ALTER TABLE `sustitution_goals`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `consent_to_treatments`
--
ALTER TABLE `consent_to_treatments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `crisis_plans`
--
ALTER TABLE `crisis_plans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `de_escalation_techniques`
--
ALTER TABLE `de_escalation_techniques`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `doctor_schedule_hours`
--
ALTER TABLE `doctor_schedule_hours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `family_envolments`
--
ALTER TABLE `family_envolments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `generalization_trainings`
--
ALTER TABLE `generalization_trainings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `monitoring_evaluatings`
--
ALTER TABLE `monitoring_evaluatings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `note_bcbas`
--
ALTER TABLE `note_bcbas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `note_rbts`
--
ALTER TABLE `note_rbts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `patient_files`
--
ALTER TABLE `patient_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `sustitution_goals`
--
ALTER TABLE `sustitution_goals`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
