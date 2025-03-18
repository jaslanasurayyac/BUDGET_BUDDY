/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - finc_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`finc_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `finc_app`;

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(25,'Can add login_table',7,'add_login_table'),
(26,'Can change login_table',7,'change_login_table'),
(27,'Can delete login_table',7,'delete_login_table'),
(28,'Can view login_table',7,'view_login_table'),
(29,'Can add expert_table',8,'add_expert_table'),
(30,'Can change expert_table',8,'change_expert_table'),
(31,'Can delete expert_table',8,'delete_expert_table'),
(32,'Can view expert_table',8,'view_expert_table'),
(33,'Can add chat_table',9,'add_chat_table'),
(34,'Can change chat_table',9,'change_chat_table'),
(35,'Can delete chat_table',9,'delete_chat_table'),
(36,'Can view chat_table',9,'view_chat_table'),
(37,'Can add tip',10,'add_tip'),
(38,'Can change tip',10,'change_tip'),
(39,'Can delete tip',10,'delete_tip'),
(40,'Can view tip',10,'view_tip'),
(41,'Can add user_table',11,'add_user_table'),
(42,'Can change user_table',11,'change_user_table'),
(43,'Can delete user_table',11,'delete_user_table'),
(44,'Can view user_table',11,'view_user_table'),
(45,'Can add savings',12,'add_savings'),
(46,'Can change savings',12,'change_savings'),
(47,'Can delete savings',12,'delete_savings'),
(48,'Can view savings',12,'view_savings'),
(49,'Can add feedback',13,'add_feedback'),
(50,'Can change feedback',13,'change_feedback'),
(51,'Can delete feedback',13,'delete_feedback'),
(52,'Can view feedback',13,'view_feedback'),
(53,'Can add expert_review',14,'add_expert_review'),
(54,'Can change expert_review',14,'change_expert_review'),
(55,'Can delete expert_review',14,'delete_expert_review'),
(56,'Can view expert_review',14,'view_expert_review'),
(57,'Can add expenses',15,'add_expenses'),
(58,'Can change expenses',15,'change_expenses'),
(59,'Can delete expenses',15,'delete_expenses'),
(60,'Can view expenses',15,'view_expenses'),
(61,'Can add doubt_table',16,'add_doubt_table'),
(62,'Can change doubt_table',16,'change_doubt_table'),
(63,'Can delete doubt_table',16,'delete_doubt_table'),
(64,'Can view doubt_table',16,'view_doubt_table'),
(65,'Can add complaint',17,'add_complaint'),
(66,'Can change complaint',17,'change_complaint'),
(67,'Can delete complaint',17,'delete_complaint'),
(68,'Can view complaint',17,'view_complaint'),
(69,'Can add bank_details',18,'add_bank_details'),
(70,'Can change bank_details',18,'change_bank_details'),
(71,'Can delete bank_details',18,'delete_bank_details'),
(72,'Can view bank_details',18,'view_bank_details');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(18,'FincMent','bank_details'),
(9,'FincMent','chat_table'),
(17,'FincMent','complaint'),
(16,'FincMent','doubt_table'),
(15,'FincMent','expenses'),
(14,'FincMent','expert_review'),
(8,'FincMent','expert_table'),
(13,'FincMent','feedback'),
(7,'FincMent','login_table'),
(12,'FincMent','savings'),
(10,'FincMent','tip'),
(11,'FincMent','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'FincMent','0001_initial','2024-09-22 11:49:32.106361'),
(2,'contenttypes','0001_initial','2024-09-22 11:49:32.150413'),
(3,'auth','0001_initial','2024-09-22 11:49:32.579418'),
(4,'admin','0001_initial','2024-09-22 11:49:32.687821'),
(5,'admin','0002_logentry_remove_auto_add','2024-09-22 11:49:32.695816'),
(6,'admin','0003_logentry_add_action_flag_choices','2024-09-22 11:49:32.705537'),
(7,'contenttypes','0002_remove_content_type_name','2024-09-22 11:49:32.790878'),
(8,'auth','0002_alter_permission_name_max_length','2024-09-22 11:49:32.842307'),
(9,'auth','0003_alter_user_email_max_length','2024-09-22 11:49:32.867680'),
(10,'auth','0004_alter_user_username_opts','2024-09-22 11:49:32.875531'),
(11,'auth','0005_alter_user_last_login_null','2024-09-22 11:49:32.933950'),
(12,'auth','0006_require_contenttypes_0002','2024-09-22 11:49:32.936947'),
(13,'auth','0007_alter_validators_add_error_messages','2024-09-22 11:49:32.943205'),
(14,'auth','0008_alter_user_username_max_length','2024-09-22 11:49:33.007993'),
(15,'auth','0009_alter_user_last_name_max_length','2024-09-22 11:49:33.063908'),
(16,'auth','0010_alter_group_name_max_length','2024-09-22 11:49:33.083845'),
(17,'auth','0011_update_proxy_permissions','2024-09-22 11:49:33.098603'),
(18,'auth','0012_alter_user_first_name_max_length','2024-09-22 11:49:33.153866'),
(19,'sessions','0001_initial','2024-09-22 11:49:33.188955');

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
('nu1s7us6prbl3b1b2j16t1vczutar3pw','eyJjaWQiOjMsImxpZCI6MSwiZGlkIjoxfQ:1st39v:5zUCiWLd6uvToZa9MlcXIJYAJGiZozAf1eg_Fq-oY8w','2024-10-08 10:52:43.933868'),
('ozj554afcy1m07qjkajnjd36k3bszxc0','eyJsaWQiOjEsImNpZCI6M30:1st22T:O4JzrL677jxzZleJQA4bSJkbsJJUcC_4kyBNgk3W8DA','2024-10-08 09:40:57.352503'),
('vnt9axe2qw4sbnbs5vv26o4r2v3brk7u','eyJsaWQiOjEsImNpZCI6M30:1st2BJ:6S68_4A2lE3kCsBJ5CnqisB_DZudf3S2HYRM8_1VXN8','2024-10-08 09:50:05.142836'),
('xquaftwxn0at4rj8gya58lcoyu9o0z67','eyJjaWQiOjMsImxpZCI6MSwiZGlkIjoxfQ:1st47w:IYlWSDCJMUGnMO1IthemUdgYTLGZFRuPa4Rw_cijCHM','2024-10-08 11:54:44.314191'),
('yc3f5g939sh0nv521oekajn34nxb8yj5','eyJjaWQiOjN9:1st26F:QhxDeNpTjAPp7O9syKe3ln3qO34DXfwmczydjhFNYSw','2024-10-08 09:44:51.070366');

/*Table structure for table `fincment_bank_details` */

DROP TABLE IF EXISTS `fincment_bank_details`;

CREATE TABLE `fincment_bank_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `acc_no` bigint NOT NULL,
  `Ifsc_code` bigint NOT NULL,
  `Bank_name` varchar(200) NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_bank_detail_user_id_id_90370734_fk_FincMent_` (`user_id_id`),
  CONSTRAINT `FincMent_bank_detail_user_id_id_90370734_fk_FincMent_` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_bank_details` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_chat_table` */

insert  into `fincment_chat_table`(`id`,`message`,`date`,`time`,`from_id_id`,`to_id_id`) values 
(1,'hlo','2024-09-24','16:29:39.998418',2,5);

/*Table structure for table `fincment_complaint` */

DROP TABLE IF EXISTS `fincment_complaint`;

CREATE TABLE `fincment_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `complaint` varchar(200) NOT NULL,
  `Reply` varchar(500) NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_complaint_user_id_id_202b18ff_fk_FincMent_user_table_id` (`user_id_id`),
  CONSTRAINT `FincMent_complaint_user_id_id_202b18ff_fk_FincMent_user_table_id` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_complaint` */

insert  into `fincment_complaint`(`id`,`date`,`time`,`complaint`,`Reply`,`user_id_id`) values 
(3,'2024-09-24','12:00:00.000000','errdrrrser','pending',1);

/*Table structure for table `fincment_doubt_table` */

DROP TABLE IF EXISTS `fincment_doubt_table`;

CREATE TABLE `fincment_doubt_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doubt` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `reply` varchar(200) NOT NULL,
  `expert_id_id` bigint NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_doubt_table_expert_id_id_2f70567a_fk_FincMent_` (`expert_id_id`),
  KEY `FincMent_doubt_table_user_id_id_9d9b76bb_fk_FincMent_` (`user_id_id`),
  CONSTRAINT `FincMent_doubt_table_expert_id_id_2f70567a_fk_FincMent_` FOREIGN KEY (`expert_id_id`) REFERENCES `fincment_expert_table` (`id`),
  CONSTRAINT `FincMent_doubt_table_user_id_id_9d9b76bb_fk_FincMent_` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_doubt_table` */

insert  into `fincment_doubt_table`(`id`,`doubt`,`date`,`time`,`reply`,`expert_id_id`,`user_id_id`) values 
(1,'doubt1','2024-01-11','00:00:12.300000','kkk',1,1);

/*Table structure for table `fincment_expenses` */

DROP TABLE IF EXISTS `fincment_expenses`;

CREATE TABLE `fincment_expenses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `category` varchar(200) NOT NULL,
  `amount` bigint NOT NULL,
  `details` varchar(200) NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_expenses_user_id_id_1aa93a49_fk_FincMent_user_table_id` (`user_id_id`),
  CONSTRAINT `FincMent_expenses_user_id_id_1aa93a49_fk_FincMent_user_table_id` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_expenses` */

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_expert_review` */

insert  into `fincment_expert_review`(`id`,`rating`,`review`,`date`,`EXPERT_id`,`user_id_id`) values 
(1,5,'good','2024-09-01',1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_expert_table` */

insert  into `fincment_expert_table`(`id`,`firstname`,`lastname`,`dob`,`gender`,`photo`,`place`,`post`,`phone`,`email`,`qualification`,`LOGIN_ID_id`) values 
(1,'expert1','1','2024-09-22','male','all_ke1cq2P.png','nadavayal','palayam',8965542335,'muhammedhafis302@gmail.com','bca',2),
(2,'expert2','2','2024-09-02','female','Screenshot (74).png','wayanad','',45454544,'dudecube1331@gmail.com','science',3),
(3,'expert3','3','2024-09-04','female','Screenshot (74)_9e2CATJ.png','wayanad','',111111111,'expert3@gmail.com','degree',4),
(4,'anshif','p','1994-02-28','male','20726927693A49D8B9B5A4199B151E209002b80ce473e4f4247a4c8a156c4f627f1.jpg','wayanad','manathavady',9876543210,'ap@example.com','m.tech',5),
(5,'anshif','p','2004-05-04','Female','9306495911EB42F7A77C52A067CF86B4120024fd848d82c42978458ae5bf44ff540.jpg','calicut','',8795462130,'anz@gmail.com','mca',6),
(6,'expert','1','2024-09-04','Male','9306495911EB42F7A77C52A067CF86B4900024fd848d82c42978458ae5bf44ff540.jpg','kollam','',8795462130,'anz@gmail.com','mca',7);

/*Table structure for table `fincment_feedback` */

DROP TABLE IF EXISTS `fincment_feedback`;

CREATE TABLE `fincment_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `feedback` varchar(600) NOT NULL,
  `Rating` double NOT NULL,
  `review` varchar(300) NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_feedback_user_id_id_778d3878_fk_FincMent_user_table_id` (`user_id_id`),
  CONSTRAINT `FincMent_feedback_user_id_id_778d3878_fk_FincMent_user_table_id` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_feedback` */

insert  into `fincment_feedback`(`id`,`date`,`time`,`feedback`,`Rating`,`review`,`user_id_id`) values 
(1,'2024-09-24','11:00:00.000000','nhgfythd',3.5,' xnbgha',1);

/*Table structure for table `fincment_login_table` */

DROP TABLE IF EXISTS `fincment_login_table`;

CREATE TABLE `fincment_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_login_table` */

insert  into `fincment_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'expert1','1234','Expert'),
(3,'expert2','1234','Expert'),
(4,'expert3','1234','Expert'),
(5,'anz','12345','Expert'),
(6,'anz','098765','Expert'),
(7,'expertt','1234','Expert');

/*Table structure for table `fincment_savings` */

DROP TABLE IF EXISTS `fincment_savings`;

CREATE TABLE `fincment_savings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` bigint NOT NULL,
  `details` varchar(200) NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_savings_user_id_id_9b7b6934_fk_FincMent_user_table_id` (`user_id_id`),
  CONSTRAINT `FincMent_savings_user_id_id_9b7b6934_fk_FincMent_user_table_id` FOREIGN KEY (`user_id_id`) REFERENCES `fincment_user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_savings` */

/*Table structure for table `fincment_tip` */

DROP TABLE IF EXISTS `fincment_tip`;

CREATE TABLE `fincment_tip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tips` varchar(200) NOT NULL,
  `details` varchar(200) NOT NULL,
  `expert_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_tip_expert_id_id_b1502b62_fk_FincMent_expert_table_id` (`expert_id_id`),
  CONSTRAINT `FincMent_tip_expert_id_id_b1502b62_fk_FincMent_expert_table_id` FOREIGN KEY (`expert_id_id`) REFERENCES `fincment_expert_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_tip` */

insert  into `fincment_tip`(`id`,`tips`,`details`,`expert_id_id`) values 
(1,'1','details....',2),
(4,'1','details',1),
(5,'1','details',1),
(6,'111','222',1),
(7,'www','eeee',1),
(8,'ee','rrr',1),
(10,'qqq','www',1);

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
  `email` varchar(20) NOT NULL,
  `LOGIN_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FincMent_user_table_LOGIN_ID_id_f904d4d7_fk_FincMent_` (`LOGIN_ID_id`),
  CONSTRAINT `FincMent_user_table_LOGIN_ID_id_f904d4d7_fk_FincMent_` FOREIGN KEY (`LOGIN_ID_id`) REFERENCES `fincment_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `fincment_user_table` */

insert  into `fincment_user_table`(`id`,`fname`,`lname`,`gender`,`photo`,`place`,`phone`,`email`,`LOGIN_ID_id`) values 
(1,'user','1','male','photo','panamaram',4565764523,'user1@gmail.com',5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
