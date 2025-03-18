/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - finc_apps
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`finc_apps` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `finc_apps`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add bank_details',7,'add_bank_details'),
(26,'Can change bank_details',7,'change_bank_details'),
(27,'Can delete bank_details',7,'delete_bank_details'),
(28,'Can view bank_details',7,'view_bank_details'),
(29,'Can add login_table',8,'add_login_table'),
(30,'Can change login_table',8,'change_login_table'),
(31,'Can delete login_table',8,'delete_login_table'),
(32,'Can view login_table',8,'view_login_table'),
(33,'Can add expert_table',9,'add_expert_table'),
(34,'Can change expert_table',9,'change_expert_table'),
(35,'Can delete expert_table',9,'delete_expert_table'),
(36,'Can view expert_table',9,'view_expert_table'),
(37,'Can add chat_table',10,'add_chat_table'),
(38,'Can change chat_table',10,'change_chat_table'),
(39,'Can delete chat_table',10,'delete_chat_table'),
(40,'Can view chat_table',10,'view_chat_table'),
(41,'Can add tip',11,'add_tip'),
(42,'Can change tip',11,'change_tip'),
(43,'Can delete tip',11,'delete_tip'),
(44,'Can view tip',11,'view_tip'),
(45,'Can add user_table',12,'add_user_table'),
(46,'Can change user_table',12,'change_user_table'),
(47,'Can delete user_table',12,'delete_user_table'),
(48,'Can view user_table',12,'view_user_table'),
(49,'Can add savings',13,'add_savings'),
(50,'Can change savings',13,'change_savings'),
(51,'Can delete savings',13,'delete_savings'),
(52,'Can view savings',13,'view_savings'),
(53,'Can add feedback',14,'add_feedback'),
(54,'Can change feedback',14,'change_feedback'),
(55,'Can delete feedback',14,'delete_feedback'),
(56,'Can view feedback',14,'view_feedback'),
(57,'Can add expert_review',15,'add_expert_review'),
(58,'Can change expert_review',15,'change_expert_review'),
(59,'Can delete expert_review',15,'delete_expert_review'),
(60,'Can view expert_review',15,'view_expert_review'),
(61,'Can add expenses',16,'add_expenses'),
(62,'Can change expenses',16,'change_expenses'),
(63,'Can delete expenses',16,'delete_expenses'),
(64,'Can view expenses',16,'view_expenses'),
(65,'Can add doubt_table',17,'add_doubt_table'),
(66,'Can change doubt_table',17,'change_doubt_table'),
(67,'Can delete doubt_table',17,'delete_doubt_table'),
(68,'Can view doubt_table',17,'view_doubt_table'),
(69,'Can add complaint',18,'add_complaint'),
(70,'Can change complaint',18,'change_complaint'),
(71,'Can delete complaint',18,'delete_complaint'),
(72,'Can view complaint',18,'view_complaint'),
(73,'Can add transactions',19,'add_transactions'),
(74,'Can change transactions',19,'change_transactions'),
(75,'Can delete transactions',19,'delete_transactions'),
(76,'Can view transactions',19,'view_transactions');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$870000$2zrhbWmxD7aCD1h9VU8kVj$fjsvGBWMTdz1FzrVaZX3XDOWnWmNF/2VuoHMktOSxhQ=','2024-12-29 11:50:22.855994',1,'admin','','','athirababu9544@gmail.com',1,1,'2024-12-24 09:37:01.576387');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'FincMent','bank_details'),
(10,'FincMent','chat_table'),
(18,'FincMent','complaint'),
(17,'FincMent','doubt_table'),
(16,'FincMent','expenses'),
(15,'FincMent','expert_review'),
(9,'FincMent','expert_table'),
(14,'FincMent','feedback'),
(8,'FincMent','login_table'),
(13,'FincMent','savings'),
(11,'FincMent','tip'),
(19,'FincMent','transactions'),
(12,'FincMent','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'FincMent','0001_initial','2024-12-24 05:50:43.866854'),
(2,'FincMent','0002_initial','2024-12-24 05:50:44.823278'),
(3,'contenttypes','0001_initial','2024-12-24 05:50:44.873799'),
(4,'auth','0001_initial','2024-12-24 05:50:45.347562'),
(5,'admin','0001_initial','2024-12-24 05:50:45.449091'),
(6,'admin','0002_logentry_remove_auto_add','2024-12-24 05:50:45.458114'),
(7,'admin','0003_logentry_add_action_flag_choices','2024-12-24 05:50:45.467108'),
(8,'contenttypes','0002_remove_content_type_name','2024-12-24 05:50:45.550619'),
(9,'auth','0002_alter_permission_name_max_length','2024-12-24 05:50:45.610618'),
(10,'auth','0003_alter_user_email_max_length','2024-12-24 05:50:45.632159'),
(11,'auth','0004_alter_user_username_opts','2024-12-24 05:50:45.643717'),
(12,'auth','0005_alter_user_last_login_null','2024-12-24 05:50:45.703706'),
(13,'auth','0006_require_contenttypes_0002','2024-12-24 05:50:45.705706'),
(14,'auth','0007_alter_validators_add_error_messages','2024-12-24 05:50:45.714746'),
(15,'auth','0008_alter_user_username_max_length','2024-12-24 05:50:45.773461'),
(16,'auth','0009_alter_user_last_name_max_length','2024-12-24 05:50:45.840993'),
(17,'auth','0010_alter_group_name_max_length','2024-12-24 05:50:45.870995'),
(18,'auth','0011_update_proxy_permissions','2024-12-24 05:50:45.898396'),
(19,'auth','0012_alter_user_first_name_max_length','2024-12-24 05:50:45.995919'),
(20,'sessions','0001_initial','2024-12-24 05:50:46.030043'),
(21,'FincMent','0003_savings_bank','2024-12-24 06:33:30.429361'),
(22,'FincMent','0004_remove_savings_bank_transactions','2024-12-28 04:47:34.593673'),
(23,'FincMent','0005_savings_bank_alter_expenses_bank','2024-12-28 05:39:28.276676'),
(24,'FincMent','0006_savings_category','2024-12-29 07:31:12.667912'),
(25,'FincMent','0007_alter_user_table_email','2024-12-29 12:09:50.574783'),
(26,'FincMent','0008_expenses_time_savings_time','2024-12-29 13:19:36.737730');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('273f9lind91zw56vmmkzau94mke7cxpg','.eJxVjssOgjAURP-la9PYB_Ti0j3fQO4LixJIKKyM_y4kLHQ7Z-Zk3qbDbc3dVnTpBjE348zlNyPkl04HkCdOj9nyPK3LQPao2JMW286i4_3s_gkylryvqygOokTXq-cGnSQlImDPVwAGr3WIDfYeyXtlScFBEox1BK4gBdql4_HPfb7ADzpK:1tQSru:D4t-9378epNwE1jZ9ARXSQSCHseZ-nVkUN4TxSlVON4','2025-01-08 15:00:14.211468'),
('iobaa3478tlmafv67328qfrma3orn1kc','.eJxVjssOgjAURP-la9PYB_Ti0j3fQO4LixJIKKyM_y4kLHQ7Z-Zk3qbDbc3dVnTpBjE348zlNyPkl04HkCdOj9nyPK3LQPao2JMW286i4_3s_gkylryvqygOokTXq-cGnSQlImDPVwAGr3WIDfYeyXtlScFBEox1BK4gBdql4_HPfb7ADzpK:1tR8VJ:WkRZYdDa5xVKZHFxsKpBES3kMzwMLXsfA_v7grDiFWM','2025-01-10 11:27:41.203245'),
('t1tp7sii5lm65t3zs86zprmwogp3fio3','.eJxVjssOgjAURP-la9PYB_Ti0j3fQO4LixJIKKyM_y4kLHQ7Z-Zk3qbDbc3dVnTpBjE348zlNyPkl04HkCdOj9nyPK3LQPao2JMW286i4_3s_gkylryvqygOokTXq-cGnSQlImDPVwAGr3WIDfYeyXtlScFBEox1BK4gBdql4_HPfb7ADzpK:1tR3mo:l0Nebhu_xaYGjDcaWpjlnl6VmpsLRzIpKmRIwzzBqnA','2025-01-10 06:25:26.772730');

/*Table structure for table `fincment_bank_details` */

DROP TABLE IF EXISTS `fincment_bank_details`;

CREATE TABLE `fincment_bank_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `acc_no` bigint NOT NULL,
  `Ifsc_code` varchar(100) NOT NULL,
  `Bank_name` varchar(200) NOT NULL,
  `total_amount` bigint NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_bank_detail_user_id_id_90370734_fk_FincMent_` (`user_id_id`),
  CONSTRAINT `FincMent_bank_detail_user_id_id_90370734_fk_FincMent_` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_bank_details` */

insert  into `fincment_bank_details`(`id`,`acc_no`,`Ifsc_code`,`Bank_name`,`total_amount`,`user_id_id`) values 
(3,1234567891,'KGBVHDGH','KGB',475,1);

/*Table structure for table `fincment_chat_table` */

DROP TABLE IF EXISTS `fincment_chat_table`;

CREATE TABLE `fincment_chat_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `from_id_id` bigint NOT NULL,
  `to_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_chat_table_from_id_id_e809fe92_fk_FincMent_` (`from_id_id`),
  KEY `FincMent_chat_table_to_id_id_8944f996_fk_FincMent_login_table_id` (`to_id_id`),
  CONSTRAINT `FincMent_chat_table_from_id_id_e809fe92_fk_FincMent_` FOREIGN KEY (`from_id_id`) REFERENCES `fincment_login_table` (`id`),
  CONSTRAINT `FincMent_chat_table_to_id_id_8944f996_fk_FincMent_login_table_id` FOREIGN KEY (`to_id_id`) REFERENCES `fincment_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_chat_table` */

insert  into `fincment_chat_table`(`id`,`message`,`date`,`time`,`from_id_id`,`to_id_id`) values 
(1,'hai','2024-12-24','11:30:18.982153',2,4),
(2,'36521563421','2024-12-24','11:30:29.025187',4,2),
(3,'hai','2024-12-27','12:37:35.330422',11,4),
(4,'hai','2024-12-27','14:06:26.321224',4,2),
(5,'hai','2024-12-27','14:06:34.191004',2,4),
(6,'hhh','2024-12-27','15:44:31.944201',4,2),
(7,'gggf','2024-12-27','15:44:40.552710',2,4);

/*Table structure for table `fincment_complaint` */

DROP TABLE IF EXISTS `fincment_complaint`;

CREATE TABLE `fincment_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `complaint` varchar(200) NOT NULL,
  `Reply` varchar(500) NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_complaint_user_id_id_202b18ff_fk_FincMent_user_table_id` (`user_id_id`),
  CONSTRAINT `FincMent_complaint_user_id_id_202b18ff_fk_FincMent_user_table_id` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_complaint` */

insert  into `fincment_complaint`(`id`,`date`,`complaint`,`Reply`,`user_id_id`) values 
(1,'2024-12-24 11:32:45.571490','Not working','Solved',1),
(2,'2024-12-27 09:39:58.610202','noooo','rrrr',1);

/*Table structure for table `fincment_doubt_table` */

DROP TABLE IF EXISTS `fincment_doubt_table`;

CREATE TABLE `fincment_doubt_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doubt` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(200) NOT NULL,
  `expert_id_id` bigint NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_doubt_table_expert_id_id_2f70567a_fk_FincMent_` (`expert_id_id`),
  KEY `FincMent_doubt_table_user_id_id_9d9b76bb_fk_FincMent_` (`user_id_id`),
  CONSTRAINT `FincMent_doubt_table_expert_id_id_2f70567a_fk_FincMent_` FOREIGN KEY (`expert_id_id`) REFERENCES `fincment_expert_table` (`id`),
  CONSTRAINT `FincMent_doubt_table_user_id_id_9d9b76bb_fk_FincMent_` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_doubt_table` */

insert  into `fincment_doubt_table`(`id`,`doubt`,`date`,`reply`,`expert_id_id`,`user_id_id`) values 
(1,'how to manage','2024-12-27','pending',8,1),
(2,'hai','2024-12-27','pending',8,1),
(3,'how','2024-12-12','yaa',1,1),
(4,'tegf','2024-12-27','no',1,1),
(5,'hai','2024-12-27','hello',1,1);

/*Table structure for table `fincment_expenses` */

DROP TABLE IF EXISTS `fincment_expenses`;

CREATE TABLE `fincment_expenses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `category` varchar(200) NOT NULL,
  `amount` bigint NOT NULL,
  `details` varchar(200) NOT NULL,
  `bank` varchar(500) NOT NULL,
  `user_id_id` bigint NOT NULL,
  `time` time(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_expenses_user_id_id_1aa93a49_fk_FincMent_user_table_id` (`user_id_id`),
  CONSTRAINT `FincMent_expenses_user_id_id_1aa93a49_fk_FincMent_user_table_id` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_expenses` */

insert  into `fincment_expenses`(`id`,`date`,`category`,`amount`,`details`,`bank`,`user_id_id`,`time`) values 
(75,'2024-12-29','Shopping',100,'','KGB',1,'18:49:28.631369'),
(76,'2024-12-28','Personal',10,'','KGB',1,'18:49:28.631369'),
(77,'2024-12-27','Business',100,'','KGB',1,'18:49:28.631369'),
(78,'2024-12-26','Business',100,'','KGB',1,'18:49:28.631369'),
(79,'2024-12-25','Shopping',200,'','KGB',1,'18:49:28.631369'),
(80,'2024-12-24','Business',300,'','KGB',1,'18:49:28.631369'),
(81,'2024-12-23','Other',10,'','KGB',1,'18:49:28.631369'),
(82,'2024-12-22','Personal',36,'','KGB',1,'18:49:28.631369'),
(83,'2024-12-21','Other',13,'','KGB',1,'18:49:28.631369'),
(84,'2024-12-20','Personal',30,'','KGB',1,'18:49:28.631369'),
(85,'2024-12-19','Business',1,'','KGB',1,'18:49:28.631369'),
(86,'2024-12-18','Shopping',5,'','KGB',1,'18:49:28.631369'),
(88,'2024-12-29','Shopping',50,'','KGB',1,'18:49:28.631369'),
(89,'2024-12-29','Bills',50,'','KGB',1,'18:49:28.631369'),
(90,'2024-12-29','Business',505,'','Cash',1,'18:49:28.631369'),
(91,'2024-12-29','Personal',160,'','Cash',1,'18:49:28.631369'),
(92,'2024-12-29','Shopping',3000,'','KGB',1,'18:49:28.631369'),
(93,'2024-12-29','Shopping',3000,'','KGB',1,'18:49:28.631369'),
(94,'2024-12-29','Shopping',100,'','KGB',1,'18:49:28.631369'),
(95,'2024-12-29','Personal',4000,'','Cash',1,'18:49:28.631369'),
(96,'2024-12-29','Category',100,'bank transfer','KGB',1,'18:49:28.631369'),
(97,'2024-12-29','Category',95,'bank transfer','KGB',1,'18:57:07.982684');

/*Table structure for table `fincment_expert_review` */

DROP TABLE IF EXISTS `fincment_expert_review`;

CREATE TABLE `fincment_expert_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` double NOT NULL,
  `review` varchar(300) NOT NULL,
  `date` date NOT NULL,
  `EXPERT_id` bigint NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_expert_revi_EXPERT_id_76082ebc_fk_FincMent_` (`EXPERT_id`),
  KEY `FincMent_expert_revi_user_id_id_66b7d05a_fk_FincMent_` (`user_id_id`),
  CONSTRAINT `FincMent_expert_revi_EXPERT_id_76082ebc_fk_FincMent_` FOREIGN KEY (`EXPERT_id`) REFERENCES `fincment_expert_table` (`id`),
  CONSTRAINT `FincMent_expert_revi_user_id_id_66b7d05a_fk_FincMent_` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_expert_review` */

/*Table structure for table `fincment_expert_table` */

DROP TABLE IF EXISTS `fincment_expert_table`;

CREATE TABLE `fincment_expert_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(254) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `LOGIN_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_expert_tabl_LOGIN_ID_id_cbd475f3_fk_FincMent_` (`LOGIN_ID_id`),
  CONSTRAINT `FincMent_expert_tabl_LOGIN_ID_id_cbd475f3_fk_FincMent_` FOREIGN KEY (`LOGIN_ID_id`) REFERENCES `fincment_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_expert_table` */

insert  into `fincment_expert_table`(`id`,`firstname`,`lastname`,`dob`,`gender`,`photo`,`place`,`post`,`phone`,`email`,`qualification`,`LOGIN_ID_id`) values 
(1,'Anshif','p','2004-02-24','Male','pexels-aleksandar-pasaric-1388030.jpg','wayanad','673122',9778514241,'anshif@gmail.com','BCA',2),
(2,'Hafis','A','2011-05-24','Male','pexels-cameron-casey-1722179.jpg','nadavayal','Kottathara P.O',7895847584,'hafismuhammed302@gmail.com','CS',3),
(3,'Athul','NC','2005-11-24','Male','pexels-cameron-casey-1722179_FGMQbgb.jpg','Nadavayal','',3445345465,'athul@gmail.com','BCA',5),
(4,'Aleena','p','2006-07-24','Female','pexels-simon-berger-1323550.jpg','nadavayal','',4444453343,'aleena@gmail.com','BCA',6),
(5,'a','a','2024-12-05','Female','pexels-aleksandar-pasaric-1388030_CEs8ZGa.jpg','aaaa','',5478985645,'ap@gmail.com','a',7),
(6,'b','b','2024-12-27','Female','4.jpg','8888','',7845784578,'ass@gmail.com','b',8),
(7,'c','c','2024-12-05','Female','6.jpg','c','',7878457845,'c@gmail.com','c',9),
(8,'z','z','2024-12-04','Male','4_InGAHgs.jpg','zzz','',7845784578,'c@gmail.com','z',10),
(9,'d','d','2024-12-06','Female','2.jpg','d','',7898564578,'d@gmail.com','d',11),
(10,'e','es','2024-12-06','Male','6_B4i9qlU.jpg','e','673122',1111111111,'t@gmail.com','e',12);

/*Table structure for table `fincment_feedback` */

DROP TABLE IF EXISTS `fincment_feedback`;

CREATE TABLE `fincment_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `Rating` double NOT NULL,
  `review` varchar(300) NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_feedback_user_id_id_778d3878_fk_FincMent_user_table_id` (`user_id_id`),
  CONSTRAINT `FincMent_feedback_user_id_id_778d3878_fk_FincMent_user_table_id` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_feedback` */

insert  into `fincment_feedback`(`id`,`date`,`Rating`,`review`,`user_id_id`) values 
(1,'2024-12-24 11:33:52.812427',3,'good',1),
(2,'2024-12-24 14:20:01.992363',3,'',1),
(3,'2024-12-27 11:10:00.032204',3,'goood',1),
(4,'2024-12-27 15:34:42.041528',2,'gggg',1);

/*Table structure for table `fincment_login_table` */

DROP TABLE IF EXISTS `fincment_login_table`;

CREATE TABLE `fincment_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_login_table` */

insert  into `fincment_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'Anshif','anshif','Expert'),
(3,'Hafis','hafis','Expert'),
(4,'user1@gmail.com','Abcd@123','user'),
(5,'Athul','athul','Expert'),
(6,'Aleena','aleena','Expert'),
(7,'a','a','blocked'),
(8,'b','b','blocked'),
(9,'c','c','blocked'),
(10,'z','z','blocked'),
(11,'d','d','blocked'),
(12,'e','e','blocked');

/*Table structure for table `fincment_savings` */

DROP TABLE IF EXISTS `fincment_savings`;

CREATE TABLE `fincment_savings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` bigint NOT NULL,
  `details` varchar(200) NOT NULL,
  `user_id_id` bigint NOT NULL,
  `bank` varchar(500) NOT NULL,
  `category` varchar(100) NOT NULL,
  `time` time(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_savings_user_id_id_9b7b6934_fk_FincMent_user_table_id` (`user_id_id`),
  CONSTRAINT `FincMent_savings_user_id_id_9b7b6934_fk_FincMent_user_table_id` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_savings` */

insert  into `fincment_savings`(`id`,`date`,`amount`,`details`,`user_id_id`,`bank`,`category`,`time`) values 
(116,'2024-12-29',10,'bank transfer',1,'KGB','Category','18:49:28.631369'),
(117,'2024-12-28',110,'bank transfer',1,'KGB','Other','18:49:28.631369'),
(118,'2024-12-27',250,'',1,'KGB','Sale','18:49:28.631369'),
(119,'2024-12-26',250,'',1,'KGB','Sale','18:49:28.631369'),
(120,'2024-12-25',260,'',1,'KGB','Awards','18:49:28.631369'),
(121,'2024-12-24',1000,'',1,'KGB','Salary','18:49:28.631369'),
(122,'2024-12-23',200,'',1,'KGB','Awards','18:49:28.631369'),
(123,'2024-12-22',200,'friend',1,'KGB','Sale','18:49:28.631369'),
(124,'2024-12-21',500,'',1,'KGB','Rent','18:49:28.631369'),
(125,'2024-12-20',240,'',1,'KGB','Other','18:49:28.631369'),
(126,'2024-12-29',100,'',1,'KGB','Awards','18:49:28.631369'),
(127,'2024-12-29',1000,'',1,'Cash','Refunds','18:49:28.631369'),
(128,'2024-12-29',2000,'',1,'Cash','Salary','18:49:28.631369'),
(129,'2024-12-29',6000,'',1,'KGB','Coupons','18:49:28.631369');

/*Table structure for table `fincment_tip` */

DROP TABLE IF EXISTS `fincment_tip`;

CREATE TABLE `fincment_tip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tips` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `details` varchar(200) NOT NULL,
  `expert_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_tip_expert_id_id_b1502b62_fk_FincMent_expert_table_id` (`expert_id_id`),
  CONSTRAINT `FincMent_tip_expert_id_id_b1502b62_fk_FincMent_expert_table_id` FOREIGN KEY (`expert_id_id`) REFERENCES `fincment_expert_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_tip` */

insert  into `fincment_tip`(`id`,`tips`,`date`,`details`,`expert_id_id`) values 
(2,'Save an Emergency Fund','2024-12-24','This fund can help cover unexpected expenses like medical bills, car repairs, or job loss.',1),
(3,'Investment','2024-12-27','Invest early',1);

/*Table structure for table `fincment_transactions` */

DROP TABLE IF EXISTS `fincment_transactions`;

CREATE TABLE `fincment_transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `date` datetime(6) NOT NULL,
  `amount` double NOT NULL,
  `category` varchar(50) NOT NULL,
  `details` longtext NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_transaction_user_id_id_d856b63c_fk_FincMent_` (`user_id_id`),
  CONSTRAINT `FincMent_transaction_user_id_id_d856b63c_fk_FincMent_` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_transactions` */

/*Table structure for table `fincment_user_table` */

DROP TABLE IF EXISTS `fincment_user_table`;

CREATE TABLE `fincment_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(50) NOT NULL,
  `LOGIN_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_user_table_LOGIN_ID_id_f904d4d7_fk_FincMent_` (`LOGIN_ID_id`),
  CONSTRAINT `FincMent_user_table_LOGIN_ID_id_f904d4d7_fk_FincMent_` FOREIGN KEY (`LOGIN_ID_id`) REFERENCES `fincment_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_user_table` */

insert  into `fincment_user_table`(`id`,`fname`,`lname`,`gender`,`photo`,`place`,`phone`,`email`,`LOGIN_ID_id`) values 
(1,'user','1','Male','1000104429_938fxWK.jpg','Kochi',9778206119,'hafismuhammed302@gmail.com',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
