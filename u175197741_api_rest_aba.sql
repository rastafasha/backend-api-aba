-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-02-2024 a las 23:49:39
-- Versión del servidor: 10.6.14-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u175197741_api_rest_aba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `behavior_asistants`
--

CREATE TABLE `behavior_asistants` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `behavior_assistant_work_schedule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`behavior_assistant_work_schedule`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `behavior_asistants`
--

INSERT INTO `behavior_asistants` (`id`, `bip_id`, `patient_id`, `client_id`, `description`, `behavior_assistant_work_schedule`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'dsaadsa', '[{\"monday\":\"dsads\",\"tuesday\":\"dasd\",\"wednesday\":\"dasds\",\"thursday\":\"dsads\",\"friday\":\"dsads\",\"saturday\":\"dasddas\"},{\"monday\":\"sads\",\"tuesday\":\"dsada\",\"wednesday\":\"dasds\",\"thursday\":\"dassad\",\"friday\":\"dasds\",\"saturday\":\"dsads\"}]', '2024-02-15 03:15:49', '2024-02-15 03:15:59', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bips`
--

CREATE TABLE `bips` (
  `id` bigint(20) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_of_assessment` tinyint(1) DEFAULT 1 COMMENT '1:initial,2:reassestment',
  `documents_reviewed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`documents_reviewed`)),
  `background_information` text DEFAULT NULL,
  `previus_treatment_and_result` text DEFAULT NULL,
  `current_treatment_and_progress` text DEFAULT NULL,
  `education_status` text DEFAULT NULL,
  `phisical_and_medical_status` text DEFAULT NULL,
  `maladaptives` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`maladaptives`)),
  `assestment_conducted` text DEFAULT NULL,
  `assestment_conducted_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`assestment_conducted_options`)),
  `prevalent_setting_event_and_atecedents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`prevalent_setting_event_and_atecedents`)),
  `interventions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`interventions`)),
  `reduction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `bips`
--

INSERT INTO `bips` (`id`, `client_id`, `patient_id`, `doctor_id`, `type_of_assessment`, `documents_reviewed`, `background_information`, `previus_treatment_and_result`, `current_treatment_and_progress`, `education_status`, `phisical_and_medical_status`, `maladaptives`, `assestment_conducted`, `assestment_conducted_options`, `prevalent_setting_event_and_atecedents`, `interventions`, `reduction_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 'cliente3243', 1, 2, '[{\"document_title\":\"ADOs\",\"document_status\":\"yes\"}]', 'asdsa', 'dsadsa', 'dsads', 'dsadas', 'dsasd', '[{\"baseline_level\":\"dsadasdas\",\"initial_interesting\":32,\"maladaptive_behavior\":\"Negative Self talk\",\"topografical_definition\":\"adassad\"},{\"baseline_level\":\"dasadssad\",\"initial_interesting\":23,\"maladaptive_behavior\":\"dasdsa\",\"topografical_definition\":\"dasdsa\"},{\"maladaptive_behavior\":\"otro mas\",\"topografical_definition\":\"dasdsa\",\"baseline_level\":\"asddas\",\"initial_interesting\":43}]', 'sadsa', '[{\"assestment_title\":\"dasdas\",\"assestment_status\":\"yes\"}]', '[{\"behavior\":\"das\",\"hypothesized_functions\":\"das\",\"prevalent_setting_event_and_atecedent\":\"das\"},{\"behavior\":\"sdad\",\"hypothesized_functions\":\"sa\",\"prevalent_setting_event_and_atecedent\":\"dsa\"}]', '[{\"dra\":\"dsaad\",\"dro\":\"dsada\",\"ncr\":\"dasdas\",\"pairing\":\"dasdas\",\"shaping\":\"dasda\",\"chaining\":\"dsa\",\"redirection\":\"dasdas\",\"response_block\":\"dsad\",\"premack_principal\":\"dasda\",\"errorless_teaching\":\"dassd\"}]', NULL, '2024-01-30 21:41:01', '2024-02-02 01:31:56', NULL),
(2, 5, 'cliente3243', 1, 2, '[{\"cde\": true, \"iep\": false, \"mnl\": true, \"referal\": true, \"medical_notes\": false, \"doctor_referal\": true}]', 'actualiadsads', 'dsadsa', 'dsadsdas', 'dsadas', 'dsasd', '[{\"title\": \"mald\", \"definition\": \"adsdsa\", \"unit_malad\": 323}, {\"title\": \"mlkds\", \"definition\": \"dasds\", \"unit_malad\": 43}]', 'sadsa', '[{\"ados\": true, \"vineland_behavior_rating_scale\": false, \"functional_assessment_interview_completed\": true}]', '[{\"behavior\": \"das\", \"hypothesized_functions\": \"das\", \"prevalent_setting_event_and_atecedent\": \"das\"}, {\"behavior\": \"sdad\", \"hypothesized_functions\": \"sa\", \"prevalent_setting_event_and_atecedent\": \"dsa\"}]', '[{\"dra\": \"dsaad\", \"dro\": \"dsada\", \"ncr\": \"dasdas\", \"pairing\": \"dasdas\", \"shaping\": \"dasda\", \"chaining\": \"dsa\", \"redirection\": \"dasdas\", \"response_block\": \"dsad\", \"premack_principal\": \"dasda\", \"errorless_teaching\": \"dassd\"}, {\"dra\": \"dasas\", \"dro\": \"dsas\", \"ncr\": \"dasasd\", \"pairing\": \"dsadsa\", \"shaping\": \"das\", \"chaining\": \"dsads\", \"redirection\": \"dasas\", \"response_block\": \"dsasd\", \"premack_principal\": \"dsadas\", \"errorless_teaching\": \"dasas\"}]', NULL, '2024-02-01 03:10:06', '2024-02-01 03:10:06', NULL),
(3, 7, 'asd234', 6, 1, '[{\"document_title\":\"MEDICAL NOTES\",\"document_status\":\"pending\"},{\"document_title\":\"IEP\",\"document_status\":\"yes\"}]', 'Client is an 10-year old male, who lives with his mother, father, sister and brother in Fort Myers, Fl. client was\nreferred for behavioral assessment due to maladaptive behaviors and skill deficits that interfere with his daily\nfunctioning and his ability to learn from others and integrate his environment.', 'Current treatment and progress (11/2021): This treatment update reflects only 1 month of treatment due to family scheduling difficulties. Services actually started in October, 2021. This short period is not clinically significant toshow progress.', '(12/17/2021): client and his family will be on vacation from December 20 to January 2, so the service will be interrupted during this period.\nCurrent treatment and progress (12/31/2021): client this month is currently working for the following reduction behavior goals: on STO 1 for negative self talk, vocal stereotypy, motor stereotypy and property destruction.', 'Client attends Edgewood academy , 6 th grade, ESE classroom.', '(Obtained from medical records and caregiver information) client is diagnosed with Autism spectrum disorder (F84.)). Also diagnosed with receptive expressive language disorder, learning difficulties, stereotypies, epilepsy, developmental delay, anxiousness. Allergic to penicillin.', '[{\"maladaptive_behavior\":\"Negative self talk\",\"topografical_definition\":\"Topographical Definition\",\"baseline_level\":\"20\",\"initial_interesting\":32},{\"maladaptive_behavior\":\"Motor stereotypy\",\"topografical_definition\":\"MALA MOTRICIDAD GRUESA\",\"baseline_level\":\"22\",\"initial_interesting\":15}]', 'A functional behavioral assessment was conducted by Analyst to obtain information regarding the probable\ncontexts and functions of client’s behavior. The following processes and tools were utilized:', '[{\"assestment_title\":\"document name\",\"assestment_status\":\"pending\"},{\"assestment_title\":\"DOCUMENTO 1\",\"assestment_status\":\"yes\"}]', '[{\"prevalent_setting_event_and_atecedent\":\"This behavior occurs when attention is withdrawn or  as a means for automatic reinforcement\",\"behavior\":\"Motor stereotypy\",\"hypothesized_functions\":\"Attention, automatic reinforcement\"},{\"prevalent_setting_event_and_atecedent\":\"SE MOLESTA AL OIR RUIDO\",\"behavior\":\"NO MIRA A LA PERSONAS\",\"hypothesized_functions\":\"ATENCI\\u00d3N\"}]', '[{\"dra\":\"dasds\",\"dro\":\"dasad\",\"ncr\":\"dsadas\",\"pairing\":\"asads\",\"shaping\":\"dsada\",\"chaining\":\"dsaad\",\"redirection\":\"das\",\"response_block\":\"dasa\",\"premack_principal\":\"dasad\",\"errorless_teaching\":\"dsadasdsa\"}]', NULL, '2024-02-01 03:35:32', '2024-02-02 17:56:16', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `comment` text NOT NULL,
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
  `crisis_description` text DEFAULT NULL,
  `crisis_note` text DEFAULT NULL,
  `caregiver_requirements_for_prevention_of_crisis` text DEFAULT NULL,
  `risk_factors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`risk_factors`)),
  `suicidalities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`suicidalities`)),
  `homicidalities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`homicidalities`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `crisis_plans`
--

INSERT INTO `crisis_plans` (`id`, `bip_id`, `patient_id`, `client_id`, `crisis_description`, `crisis_note`, `caregiver_requirements_for_prevention_of_crisis`, `risk_factors`, `suicidalities`, `homicidalities`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'dasadsads', 'dsaads', NULL, '[{\"do_not_apply\":true,\"elopement\":true,\"sexually_offending_behavior\":false,\"fire_setting\":true,\"impulsive_behavior\":true,\"psychotic_symptoms\":true,\"dealing_with_significant\":true,\"other\":\"adsasd\"}]', '[{\"not_present\":true,\"ideation\":true}]', '[{\"not_present_homicidality\":true,\"ideation_homicidality\":true}]', '2024-02-15 03:16:51', '2024-02-15 03:17:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `de_escalation_techniques`
--

CREATE TABLE `de_escalation_techniques` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `service_recomendation` text DEFAULT NULL,
  `recomendation_lists` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`recomendation_lists`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `de_escalation_techniques`
--

INSERT INTO `de_escalation_techniques` (`id`, `bip_id`, `patient_id`, `client_id`, `description`, `service_recomendation`, `recomendation_lists`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'asads', 'adsdas', '[{\"cpt\":\"dasdas\",\"description_service\":\"dsadas\",\"num_units\":21,\"breakdown_per_week\":\"dsdas\",\"location\":\"In Home\\/School\\/Community\"},{\"cpt\":\"dasads\",\"description_service\":\"ads\",\"num_units\":32,\"breakdown_per_week\":\"adsdsa\",\"location\":\"In Home\"}]', '2024-02-15 03:17:33', '2024-02-15 03:17:52', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `family_envolments`
--

CREATE TABLE `family_envolments` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `caregivers_training_goals` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`caregivers_training_goals`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `family_envolments`
--

INSERT INTO `family_envolments` (`id`, `bip_id`, `patient_id`, `client_id`, `description`, `caregivers_training_goals`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'dasas', '[{\"caregiver_goal\":\"dasas\",\"outcome_measure\":\"dasda\",\"criteria\":\"80%\",\"initiation\":\"2024-02-15T04:00:00.000Z\",\"current_status\":\"yes\"},{\"caregiver_goal\":\"dasdsa\",\"outcome_measure\":\"dasasd\",\"criteria\":\"60%\",\"initiation\":\"2024-02-22T04:00:00.000Z\",\"current_status\":\"no\"}]', '2024-02-15 03:14:27', '2024-02-15 03:14:48', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generalization_trainings`
--

CREATE TABLE `generalization_trainings` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `generalization` text DEFAULT NULL,
  `risk_assestment` text DEFAULT NULL,
  `discharge_plan` text DEFAULT NULL,
  `transition_fading_plans` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`transition_fading_plans`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `generalization_trainings`
--

INSERT INTO `generalization_trainings` (`id`, `bip_id`, `patient_id`, `client_id`, `generalization`, `risk_assestment`, `discharge_plan`, `transition_fading_plans`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'dadasdas', 'dasdas', 'addas', '[{\"phase\":\"das\",\"description\":\"dasads\"},{\"phase\":\"adsdas\",\"description\":\"asdadsads\"}]', '2024-02-15 03:16:15', '2024-02-15 03:16:23', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insurances`
--

CREATE TABLE `insurances` (
  `id` bigint(50) NOT NULL,
  `insurer_name` varchar(255) DEFAULT NULL,
  `services` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`services`)),
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`notes`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

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
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
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
  `avatar` varchar(255) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `zip` varchar(150) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone1` varchar(50) DEFAULT NULL,
  `phone2` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `locations`
--

INSERT INTO `locations` (`id`, `avatar`, `title`, `city`, `state`, `zip`, `address`, `email`, `phone1`, `phone2`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'locations/4RkuD10qGcTnfKRXHd2jX594dBVu78RdgDADZfRc.jpg', 'Candelaria', 'Candelaria', 'Capital', '1010', 'Centro Comercial Sambil Candelaria, Local e23', 'AbaThepC@app.com', '324432', '55665654', '2024-02-01 20:32:49', '2024-02-01 20:58:42', NULL),
(2, 'locations/Ysx7n3mCj1a7wZuojaplfMPjXjs68MlyDJ5Usts4.jpg', 'Chacao', 'dasdas', 'dasdsa', '234we', 'Centro Comercial Sambil Chacao, Local e23', 'AbaThepCh@app.com', '2344432', '55665654', '2024-02-01 20:33:21', '2024-02-01 20:58:06', NULL),
(3, 'locations/4RkuD10qGcTnfKRXHd2jX594dBVu78RdgDADZfRc.jpg', 'Santa Paula', 'Caracas', 'Distrito Capital', '1010A', 'Centro Comercial Santa paula, Local e23', 'AbaThep@app.com', '322344', '55665654', '2024-02-01 20:35:26', '2024-02-01 20:55:30', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

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
  `migration` varchar(255) NOT NULL,
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
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 2),
(6, 'App\\Models\\User', 3),
(7, 'App\\Models\\User', 4),
(8, 'App\\Models\\User', 5),
(8, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitoring_evaluatings`
--

CREATE TABLE `monitoring_evaluatings` (
  `id` bigint(20) NOT NULL,
  `bip_id` bigint(20) UNSIGNED DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `treatment_fidelity` text DEFAULT NULL,
  `rbt_training_goals` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`rbt_training_goals`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `monitoring_evaluatings`
--

INSERT INTO `monitoring_evaluatings` (`id`, `bip_id`, `patient_id`, `client_id`, `treatment_fidelity`, `rbt_training_goals`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'cliente3243', 5, 'adsdas', '[{\"goal\":\"adsads\",\"lto\":\"lto9\",\"date\":\"2024-02-13T04:00:00.000Z\",\"decription\":\"das\",\"status\":\"initiated\"},{\"goal\":\"adsads\",\"lto\":\"ads\",\"date\":\"2024-02-06T04:00:00.000Z\",\"decription\":\"adsads\",\"status\":\"on hold\"}]', '2024-02-15 03:15:09', '2024-02-15 03:15:24', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
  `address` text DEFAULT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:male,2:female',
  `birth_date` timestamp NULL DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `education` varchar(150) DEFAULT NULL,
  `profession` varchar(150) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `summer_schedule` varchar(255) DEFAULT NULL,
  `special_note` text DEFAULT NULL,
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
  `status` enum('pending','yes','no') NOT NULL DEFAULT 'pending',
  `patient_control` varchar(255) DEFAULT NULL,
  `pa_assessments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`pa_assessments`)),
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
  `eligibility` enum('pending','waiting','reviewing','psycho eval','requested','need new','yes','no','2 insurance') DEFAULT 'pending',
  `rbt_id` bigint(20) DEFAULT NULL,
  `rbt2_id` bigint(20) DEFAULT NULL,
  `bcba_id` bigint(20) DEFAULT NULL,
  `bcba2_id` bigint(20) DEFAULT NULL,
  `clin_director_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`id`, `location_id`, `patient_id`, `first_name`, `last_name`, `email`, `phone`, `language`, `parent_guardian_name`, `relationship`, `home_phone`, `work_phone`, `school_name`, `school_number`, `zip`, `state`, `address`, `gender`, `birth_date`, `age`, `avatar`, `city`, `education`, `profession`, `schedule`, `summer_schedule`, `special_note`, `insurer_id`, `insuranceId`, `insuranceId_secundary`, `elegibility_date`, `pos_covered`, `deductible_individual_I_F`, `balance`, `coinsurance`, `copayments`, `oop`, `diagnosis_code`, `status`, `patient_control`, `pa_assessments`, `compayment_per_visit`, `insurer_secundary`, `welcome`, `consent`, `insurance_card`, `mnl`, `referral`, `ados`, `iep`, `asd_diagnosis`, `cde`, `submitted`, `eligibility`, `rbt_id`, `rbt2_id`, `bcba_id`, `bcba2_id`, `clin_director_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, NULL, 'prueba4', 'prueba4', 'prueba4', 'prueba4@prueba4.com', '2132', 'prueba4, prueba4, prueba4', 'prueba4', 'prueba4', '534354', '234423', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 2, '2024-01-27 08:00:00', '32', 'patients/X43fekW9PIfXaCKu32acdnNN4aqos3WFNgAml43i.jpg', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 'prueba4', 2, 'prueba4', 'prueba4', '2024-01-26 08:00:00', '03', '3243/432', '2545/354543', '20%/43%', '12/12', '340/434', 'prueba4', 'yes', 'prueba4', '\"[{\\\"pa_assessment\\\":\\\"das\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-20T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"addas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-21T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97153\\\",\\\"n_units\\\":34}]\"', NULL, 'prueba4', 'waiting', 'requested', 'reviewing', 'reviewing', 'reviewing', 'reviewing', 'reviewing', 'psycho eval', '2 insurance', '2 insurance', 'pending', 5, 6, 4, 4, 4, '2024-01-28 01:39:48', '2024-02-15 14:54:05', NULL),
(5, NULL, 'cliente3243', 'ClientePrueba', 'ClienteAp', 'ClientePrueba@cliente.com', '3234', 'ads, dsadsa, adsdsa,dasdas', 'daad', 'das', '23443', '23432', 'dsada', 'dasda', 'asd', 'dsadsa', 'dsasd', 1, '2024-01-23 12:00:00', '23', 'patients/hacQifivrjCOOU1U9NjAmi2SUIOO5q0jD4vQICSY.jpg', 'dasdsa', 'adsdsa', 'ddas', 'dasda', 'dsaad', 'dsads', 2, 'dsadas', 'adsdsa', '2024-01-24 12:00:00', '03', '32320/2332', '2323/2332', '23/32', '23/23', '324/3232', 'dadsda', 'yes', 'adsds', '\"[{\\\"pa_assessment\\\":\\\"dsadas\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"dasdas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97155\\\",\\\"n_units\\\":23}]\"', NULL, 'asddsa', 'waiting', 'requested', 'reviewing', 'reviewing', 'reviewing', 'psycho eval', 'psycho eval', 'reviewing', 'reviewing', 'reviewing', 'pending', 6, 5, 4, 4, 4, '2024-01-30 21:39:09', '2024-02-15 14:53:11', NULL),
(6, NULL, 'cliente3', 'Cliente3', 'Clientepe', 'Cliente3@cliente.com', '24334', 'adsdas', 'qdasdsa', 'dadsa', '234423', '234432', 'dasd', '3123321', 'Cliente3', 'Cliente3', 'Cliente3', 2, '2024-01-30 08:00:00', '14', 'patients/DCcvJc7Lc3pGGN0Brb2a29hCmBBgdJCMeAdC4lec.jpg', 'Cliente3', 'dsads', 'dasda', 'Cliente3', 'Cliente3', 'Cliente3', 1, 'das', 'das', '2024-01-31 08:00:00', '03', 'das', 'das', 'dsa', 'das', 'dsa', 'Cliente3', 'yes', 'dsa', '\"[{\\\"pa_assessment\\\":\\\"dsadas\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-21T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"adas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-16T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-20T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97151\\\",\\\"n_units\\\":32}]\"', NULL, 'das', 'requested', 'requested', 'reviewing', 'psycho eval', 'requested', 'reviewing', 'psycho eval', 'psycho eval', 'reviewing', 'reviewing', 'pending', 6, 5, 4, 4, 3, '2024-01-31 02:32:32', '2024-02-15 14:51:59', NULL),
(7, 3, '20557537', 'ARMANDO', 'CÁRDENAS', 'car@gmail.com', '0412 2070144', 'ESPAÑOL E INGLÉS', 'CARMEN CÁRDENAS', 'TÍA', '0212 9863993', '0212 9863993', 'TARBES', 'T-25', '1232', 'Distrito Capital', 'Ave.Ppal de las Mercedes', 1, '2024-02-11 08:00:00', '24', 'patients/7UTBRuLc4r9KNJJYvsjMaGYl0CHdCSIcRcsXeTSK.jpg', 'Caracas', 'PRIMARIA', 'SIN PROFESIÓN', 'DE LUNES A VIERNES ESCUELA Y LOS SÁBADOS EN LA CASA', 'dsads', 'LAS TERAPIAS NO PUEDEN REALIZARSE LOS DÍAS DOMNGO', 1, 'cardenas2525', 'FB-0523', '2024-01-08 12:00:00', '03', '3000/5000', '2500/3500', '20%/25%', '10/10', '5000/8000', 'undefined', 'yes', '2024-01-01', '\"[{\\\"pa_assessment\\\":\\\"ddas\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-07T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-13T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"dsadas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-14T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-19T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97157\\\",\\\"n_units\\\":233},{\\\"pa_assessment\\\":\\\"dsdas\\\",\\\"pa_assessment_start_date\\\":\\\"2024-02-22T04:00:00.000Z\\\",\\\"pa_assessment_end_date\\\":\\\"2024-02-14T04:00:00.000Z\\\",\\\"pa_services\\\":\\\"saas\\\",\\\"pa_services_start_date\\\":\\\"2024-02-20T04:00:00.000Z\\\",\\\"pa_services_end_date\\\":\\\"2024-02-20T04:00:00.000Z\\\",\\\"cpt\\\":\\\"97157\\\",\\\"n_units\\\":23}]\"', NULL, 'FLORIDA BLUE', 'yes', 'yes', 'yes', 'requested', 'yes', 'requested', 'requested', 'no', 'no', 'waiting', 'waiting', 5, 6, 4, 4, 4, '2024-02-01 01:07:31', '2024-02-15 03:28:55', NULL),
(8, 3, 'cli32232', 'Pepito Actualizado', 'Perez', 'pepitop@client.com', '324432432', 'Englis, Spanish, german,', 'James Hietfield', 'Father', '2433422', '243324', 'St.Sophie', '329324859434', 'HoTe3243', 'Texas', 'first Ave. street 23th', 1, '2016-01-10 04:30:00', '12', 'patients/aWPK6YisOpoijasMWlPjBQswZCUfAj3VkzuWP2L3.jpg', 'Houston', 'primary', 'student', 'monday, tuesday, wednesday', 'dsaads', 'hurt himself', 2, 'saddsa', 'dsaads', '2024-01-26 04:00:00', '12', 'dasads', 'dsads', 'dsasd', 'dsads', 'dsaads', 'hurt himself', 'pending', 'dsaasd', NULL, NULL, 'dasads', 'requested', 'psycho eval', 'need new', 'psycho eval', 'psycho eval', 'psycho eval', 'requested', 'yes', 'reviewing', 'requested', 'pending', 1, 2, 4, 5, 4, '2024-02-01 01:36:04', '2024-02-15 03:31:13', '2024-02-15 03:31:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
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
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
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
  `bip_id` bigint(20) UNSIGNED NOT NULL,
  `maladaptive` varchar(255) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `current_status` varchar(150) DEFAULT NULL,
  `goalstos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`goalstos`)),
  `goalltos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`goalltos`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `reduction_goals`
--

INSERT INTO `reduction_goals` (`id`, `bip_id`, `maladaptive`, `patient_id`, `client_id`, `current_status`, `goalstos`, `goalltos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 3, 'Negative self talk', '20557537', '7', '15 incidents per week', '[{\"maladaptive\":\"Negative self talk\",\"sto\":\"1\",\"status_sto\":\"on hold\",\"date_sto\":\"2024-02-12T04:00:00.000Z\",\"decription_sto\":\"client will reduce negative self-talk from 7 to 5 incidents per week for 4 consecutive weeks\"},{\"maladaptive\":\"Negative self talk\",\"sto\":\"2\",\"status_sto\":\"mastered\",\"date_sto\":\"2024-02-14T04:00:00.000Z\",\"decription_sto\":\"client will reduce negative self-talk from 7 to 5 incidents per week for 4 consecutive weeks\"}]', '[{\"lto\":\"1\",\"status_lto\":\"inprogress\",\"date_lto\":\"2024-02-14T04:00:00.000Z\",\"decription_lto\":\"client will reduce negative self-talk from 7 to 5 incidents per week for 4 consecutive weeks\"}]', '2024-02-08 14:43:17', '2024-02-11 02:01:31', NULL);

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
  `client_response_to_treatment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_atd` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
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
(10, 6),
(11, 6),
(34, 6),
(41, 6),
(43, 6),
(47, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sustitution_goals`
--

CREATE TABLE `sustitution_goals` (
  `id` bigint(20) NOT NULL,
  `maladaptive` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `current_sustitution` varchar(155) DEFAULT NULL,
  `patient_id` varchar(150) DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bip_id` bigint(20) UNSIGNED NOT NULL,
  `goalstos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`goalstos`)),
  `goalltos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`goalltos`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `sustitution_goals`
--

INSERT INTO `sustitution_goals` (`id`, `maladaptive`, `description`, `current_sustitution`, `patient_id`, `client_id`, `bip_id`, `goalstos`, `goalltos`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Negative Self talk', 'dasdas', 'dsadsa', 'cliente3243', 5, 1, '[{\"maladaptive\":\"Negative Self talk\",\"sustitution_sto\":\"1\",\"sustitution_status_sto\":\"mastered\",\"sustitution_status_sto_edit\":\"mastered\",\"sustitution_date_sto\":\"2024-02-20T04:00:00.000Z\",\"sustitution_decription_sto\":\"adsdsa\"},{\"maladaptive\":\"Negative Self talk\",\"sustitution_sto\":\"2\",\"sustitution_status_sto\":\"discontinued\",\"sustitution_status_sto_edit\":\"discontinued\",\"sustitution_date_sto\":\"2024-02-21T04:00:00.000Z\",\"sustitution_decription_sto\":\"asdads\"}]', '[{\"sustitution_lto\":\"1\",\"sustitution_status_lto\":\"initiated\",\"sustitution_date_lto\":\"2024-02-27T04:00:00.000Z\",\"sustitution_decription_lto\":\"dasdsa\"}]', '2024-02-15 03:13:46', '2024-02-15 03:13:58', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `surname` varchar(150) DEFAULT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `birth_date` timestamp NULL DEFAULT NULL,
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1:masculino,2:femenino',
  `address` text DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` enum('inactive','active','black list','incoming') NOT NULL DEFAULT 'inactive',
  `currently_pay_through_company` varchar(150) DEFAULT NULL,
  `llc` varchar(150) DEFAULT NULL,
  `ien` varchar(150) DEFAULT NULL,
  `wc` varchar(150) DEFAULT NULL,
  `electronic_signature` varchar(150) DEFAULT NULL,
  `agency_location` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `languages` varchar(50) DEFAULT NULL,
  `dob` varchar(150) DEFAULT NULL,
  `ss_number` varchar(150) DEFAULT NULL,
  `date_of_hire` timestamp NULL DEFAULT NULL,
  `start_pay` timestamp NULL DEFAULT NULL,
  `driver_license_expiration` timestamp NULL DEFAULT NULL,
  `cpr_every_2_years` varchar(255) DEFAULT NULL,
  `background_every_5_years` varchar(255) DEFAULT NULL,
  `e_verify` varchar(255) DEFAULT NULL,
  `national_sex_offender_registry` varchar(255) DEFAULT NULL,
  `certificate_number` varchar(255) DEFAULT NULL,
  `bacb_license_expiration` varchar(255) DEFAULT NULL,
  `liability_insurance_annually` varchar(255) DEFAULT NULL,
  `local_police_rec_every_5_years` varchar(255) DEFAULT NULL,
  `npi` varchar(255) DEFAULT NULL,
  `medicaid_provider` varchar(255) DEFAULT NULL,
  `ceu_hippa_annually` varchar(255) DEFAULT NULL,
  `ceu_domestic_violence_no_expiration` varchar(255) DEFAULT NULL,
  `ceu_security_awareness_annually` varchar(255) DEFAULT NULL,
  `ceu_zero_tolerance_every_3_years` varchar(255) DEFAULT NULL,
  `ceu_hiv_bloodborne_pathogens_infection_control_no_expiration` varchar(255) DEFAULT NULL,
  `ceu_civil_rights_no_expiration` varchar(255) DEFAULT NULL,
  `school_badge` varchar(255) DEFAULT NULL,
  `w_9_w_4_form` varchar(255) DEFAULT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `two_four_week_notice_agreement` varchar(255) DEFAULT NULL,
  `credentialing_package_bcbas_only` varchar(255) DEFAULT NULL,
  `caqh_bcbas_only` varchar(255) DEFAULT NULL,
  `contract_type` varchar(155) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `location_id` bigint(50) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `surname`, `phone`, `birth_date`, `gender`, `address`, `avatar`, `status`, `currently_pay_through_company`, `llc`, `ien`, `wc`, `electronic_signature`, `agency_location`, `city`, `languages`, `dob`, `ss_number`, `date_of_hire`, `start_pay`, `driver_license_expiration`, `cpr_every_2_years`, `background_every_5_years`, `e_verify`, `national_sex_offender_registry`, `certificate_number`, `bacb_license_expiration`, `liability_insurance_annually`, `local_police_rec_every_5_years`, `npi`, `medicaid_provider`, `ceu_hippa_annually`, `ceu_domestic_violence_no_expiration`, `ceu_security_awareness_annually`, `ceu_zero_tolerance_every_3_years`, `ceu_hiv_bloodborne_pathogens_infection_control_no_expiration`, `ceu_civil_rights_no_expiration`, `school_badge`, `w_9_w_4_form`, `contract`, `two_four_week_notice_agreement`, `credentialing_package_bcbas_only`, `caqh_bcbas_only`, `contract_type`, `salary`, `location_id`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'superadmin@superadmin.com', NULL, NULL, NULL, 1, NULL, NULL, 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-30 03:32:36', '$2y$10$PiKCOHK3XOBlqiL0kgJwLOMILMA6uVAAS1ou7JqHsUQaH4yvPkAiC', 'guHmnxhKw1', '2023-11-30 03:32:36', '2024-02-09 06:43:24', NULL),
(2, 'Admin', 'manager@manager.com', 'Manager', '123456', '2024-01-25 16:00:00', 1, 'dasdsa', 'staffs/WdpkCmttLTmbxhXDM7FQhzWheWgr8eEbqYfMqNt4.jpg', 'incoming', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$X9YH3UjUALq07nGq7S5FLe6bAWZ0t6yPhNjHddtS1t9ju8FElC/UO', NULL, '2024-01-26 01:13:28', '2024-02-08 20:18:19', NULL),
(3, 'RICARDO', 'lm@lm.com', 'Doctor', '123456', '2024-01-25 04:00:00', 1, 'password', 'staffs/Br3ln1TSmcLTuQrAGbQtsxiTkmpJk2kONcvDchFB.jpg', 'active', 'dsaads', 'adsdsa', 'dsaad', 'adsdas', NULL, 'dasdsad', 'asdas', 'dasdas, adsdsa', 'adsads', 'adsdsa', '2024-01-25 04:00:00', '2024-01-30 04:00:00', '2030-07-26 04:00:00', 'asddas', 'dasadsd', 'asdas', 'dasads', 'dsaads', '2026-01-22 04:00:00', 'dsadas', 'dasdas', 'dasads', 'dasdas', 'dsadas', 'yes', 'dasads', 'ads', 'yes', 'dsadas', 'yes', 'no', 'yes', 'no', 'asddas', 'dsadsa', '1099', 2000, NULL, NULL, '$2y$10$L9GFjttLbOyyhynDcDaKBeObcfvVA7nZ3cLph0pZvozLqsdYiXgrC', NULL, '2024-01-26 01:17:03', '2024-02-08 20:19:18', NULL),
(4, 'MARTA', 'bcba@bcba.com', 'Bcba', '123456', '2024-01-25 04:00:00', 2, 'dsadas', 'staffs/RbbNRabSWaxhSWcOX0J2GFRArBZAaWyf2cGEiCi1.jpg', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1970-01-01 04:00:00', '1970-01-01 04:00:00', '1970-01-01 04:00:00', NULL, NULL, NULL, NULL, NULL, '1970-01-01 04:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$nBs3RhKzpnMrN6NVJyc8FeIPjKtfQ6CNm63LM5KTsgt8XkbBsk4ma', NULL, '2024-01-26 01:17:55', '2024-02-08 20:19:02', NULL),
(5, 'Paula', 'rbt@rbt.com', 'AUDI Rbt', '12345', '2024-01-25 04:00:00', 2, 'dsaads', 'staffs/f7YXFPACowKcCsIse6mvhenpNHgMXw4ZeBvmip8z.jpg', 'active', 'prueba4', 'prueba4', 'prueba4', 'prueba4', NULL, 'prueba4', 'prueba4', 'prueba4, prueba4', 'prueba4', 'prueba4', '1970-01-01 04:00:00', '1970-01-01 04:00:00', '1970-01-01 04:00:00', 'das', 'dadd', 'dasdsa', 'dasdas', 'dasdas', '1970-01-01 04:00:00', 'dasdas', 'dasdasd', 'asdas', 'dasdas', 'dasdas', 'yes', 'dasdas', 'dasdas', 'yes', 'pruebadoc', 'yes', 'yes', 'yes', 'yes', 'pruebadoc', 'ads', 'w2', 3232, NULL, NULL, '$2y$10$5YsgbtRGSUHpczYoTBETke3S/IfYzsv4q.WP2LrKUO1sFjDoNt7..', NULL, '2024-01-26 01:18:43', '2024-02-08 20:18:59', NULL),
(6, 'Maria Eugenia', 'apontemariae@gmail.com', 'Aponte', '+584122070144', '2024-01-10 04:00:00', 2, 'mariae2004', 'staffs/cm0erQamszXAiBjp5QjKlXoBMXdkjLSwMbo0Hlwt.jpg', 'active', NULL, NULL, NULL, NULL, 'http://127.0.0.1:8000/storage/http://127.0.0.1:8000/storage/undefined', NULL, NULL, NULL, NULL, NULL, '1970-01-01 04:00:00', '1970-01-01 04:00:00', '1970-01-01 04:00:00', NULL, NULL, NULL, NULL, NULL, '1970-01-01 04:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, NULL, '$2y$10$q/ZdnNEwG3L30uQ9adJpLuwEd2PIZeXXS3ZTPxFLCL.JJQu.vn3T2', NULL, '2024-01-31 02:27:09', '2024-02-08 06:42:06', NULL),
(7, 'Alain', 'alain@practice-mgmt.com', 'Hernandez', '2397101864', '2024-03-11 08:00:00', 1, 'practice', 'staffs/ZNIhSxgjALKEfZp2wFDbkrRg9ANnGK1Yvwec3EcB.jpg', 'active', NULL, NULL, NULL, NULL, 'http://127.0.0.1:8000/storage/undefined', NULL, NULL, NULL, NULL, NULL, '1970-01-01 16:00:00', '1970-01-01 16:00:00', '1970-01-01 16:00:00', NULL, NULL, NULL, NULL, NULL, '1970-01-01 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '$2y$10$NnOEBxaztsMzzwCmVkNyr.MNhYhWCH.9d7TTywz35Rfi876.T6vzS', NULL, '2024-01-31 02:29:13', '2024-02-08 20:18:00', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `behavior_asistants`
--
ALTER TABLE `behavior_asistants`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `monitoring_evaluatings`
--
ALTER TABLE `monitoring_evaluatings`
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
-- AUTO_INCREMENT de la tabla `behavior_asistants`
--
ALTER TABLE `behavior_asistants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `consent_to_treatments`
--
ALTER TABLE `consent_to_treatments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `monitoring_evaluatings`
--
ALTER TABLE `monitoring_evaluatings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
