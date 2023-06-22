/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 8.0.33 : Database - c_d_m
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`c_d_m` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `c_d_m`;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add company',6,'add_company'),(22,'Can change company',6,'change_company'),(23,'Can delete company',6,'delete_company'),(24,'Can view company',6,'view_company'),(25,'Can add employee',7,'add_employee'),(26,'Can change employee',7,'change_employee'),(27,'Can delete employee',7,'delete_employee'),(28,'Can view employee',7,'view_employee'),(29,'Can add device',8,'add_device'),(30,'Can change device',8,'change_device'),(31,'Can delete device',8,'delete_device'),(32,'Can view device',8,'view_device');

/*Table structure for table `companies_company` */

DROP TABLE IF EXISTS `companies_company`;

CREATE TABLE `companies_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_email` (`company_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `companies_company` */

insert  into `companies_company`(`id`,`password`,`last_login`,`company_email`,`company_name`,`created_at`,`updated_at`,`is_active`,`is_admin`) values (1,'pbkdf2_sha256$600000$3ueBr4LbiNCAzuT40QlA2a$3HvZji+Dt5kVhq7Cy+znhd7/I5/3lcjbr8RovEsFcuI=','2023-06-21 20:20:52.441537','admin@admin.com','admin','2023-06-21 20:20:15.543026','2023-06-21 20:20:15.545746',1,1),(2,'pbkdf2_sha256$600000$8iWmN5uMQ1U2QSrqFQkpXr$4mP5ddvCzZtXDVeuQvjBPU+1S9XsXG+tAZcqWJnmh+I=',NULL,'nill@nill.com','nill','2023-06-21 20:34:58.074806','2023-06-21 20:34:58.074806',1,0);

/*Table structure for table `devices_device` */

DROP TABLE IF EXISTS `devices_device`;

CREATE TABLE `devices_device` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) NOT NULL,
  `device_company_name` varchar(255) NOT NULL,
  `device_type` varchar(255) NOT NULL,
  `device_model` varchar(255) NOT NULL,
  `device_info` varchar(255) NOT NULL,
  `device_assigned_from` datetime(6) DEFAULT NULL,
  `device_assigned_to` datetime(6) DEFAULT NULL,
  `device_log` varchar(255) NOT NULL,
  `device_currently_used` varchar(3) NOT NULL,
  `device_returned` varchar(3) NOT NULL,
  `device_returned_date` datetime(6) DEFAULT NULL,
  `assigned_employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devices_device_assigned_employee_id_711d17c6_fk_employee_` (`assigned_employee_id`),
  CONSTRAINT `devices_device_assigned_employee_id_711d17c6_fk_employee_` FOREIGN KEY (`assigned_employee_id`) REFERENCES `employee_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `devices_device` */

insert  into `devices_device`(`id`,`device_id`,`device_company_name`,`device_type`,`device_model`,`device_info`,`device_assigned_from`,`device_assigned_to`,`device_log`,`device_currently_used`,`device_returned`,`device_returned_date`,`assigned_employee_id`) values (1,'N111','N1','laptop','Super N1','very good laptop','2023-06-24 00:00:00.000000','2023-07-24 00:00:00.000000','is being usedby nill2','1','0',NULL,2);

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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_companies_company_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_companies_company_id` FOREIGN KEY (`user_id`) REFERENCES `companies_company` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'companies','company'),(4,'contenttypes','contenttype'),(8,'devices','device'),(7,'employee','employee'),(5,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2023-06-21 20:16:24.745824'),(2,'companies','0001_initial','2023-06-21 20:16:24.770698'),(3,'admin','0001_initial','2023-06-21 20:16:24.897081'),(4,'admin','0002_logentry_remove_auto_add','2023-06-21 20:16:24.904055'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-21 20:16:24.913030'),(6,'contenttypes','0002_remove_content_type_name','2023-06-21 20:16:24.966323'),(7,'auth','0001_initial','2023-06-21 20:16:25.134021'),(8,'auth','0002_alter_permission_name_max_length','2023-06-21 20:16:25.195864'),(9,'auth','0003_alter_user_email_max_length','2023-06-21 20:16:25.203842'),(10,'auth','0004_alter_user_username_opts','2023-06-21 20:16:25.212886'),(11,'auth','0005_alter_user_last_login_null','2023-06-21 20:16:25.221601'),(12,'auth','0006_require_contenttypes_0002','2023-06-21 20:16:25.224928'),(13,'auth','0007_alter_validators_add_error_messages','2023-06-21 20:16:25.231910'),(14,'auth','0008_alter_user_username_max_length','2023-06-21 20:16:25.239137'),(15,'auth','0009_alter_user_last_name_max_length','2023-06-21 20:16:25.247388'),(16,'auth','0010_alter_group_name_max_length','2023-06-21 20:16:25.267317'),(17,'auth','0011_update_proxy_permissions','2023-06-21 20:16:25.276907'),(18,'auth','0012_alter_user_first_name_max_length','2023-06-21 20:16:25.284694'),(19,'sessions','0001_initial','2023-06-21 20:16:25.313836'),(20,'companies','0002_alter_company_company_email','2023-06-22 01:48:46.933051'),(21,'employee','0001_initial','2023-06-22 01:48:47.101757'),(22,'employee','0002_remove_employee_contact_info_employee_emp_email','2023-06-22 03:05:11.220842'),(23,'employee','0003_alter_employee_company','2023-06-22 08:39:36.639675'),(24,'devices','0001_initial','2023-06-22 08:50:14.724660'),(25,'devices','0002_alter_device_device_currently_used_and_more','2023-06-22 08:52:23.390803'),(26,'devices','0003_alter_device_device_assigned_from_and_more','2023-06-22 09:34:26.252196'),(27,'devices','0004_alter_device_device_currently_used_and_more','2023-06-22 09:36:00.390098');

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

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('k4fjc6l6jt5mk2985sk2rx41mh96yzp2','.eJxVjEEOwiAQRe_C2hAgg1CX7j0DYZgZqRqalHbVeHdt0oVu_3vvbyrldalp7TynkdRFWXX63TCXJ7cd0CO3-6TL1JZ5RL0r-qBd3ybi1_Vw_w5q7vVbA7Ih5wN48OJAzGDgHAuiIIEUQQZGEmNdKJBzHDxaYyNJCMwRg3p_APg-OMM:1qC4Jw:QZ6mK84IWwgG5XfairWaH4VFrZ2oAP14EUQJ5IGJMKU','2023-07-05 20:20:52.444532');

/*Table structure for table `employee_employee` */

DROP TABLE IF EXISTS `employee_employee`;

CREATE TABLE `employee_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `department` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `company_id` bigint NOT NULL,
  `emp_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_employee_company_id_3816de20_fk_companies_company_id` (`company_id`),
  CONSTRAINT `employee_employee_company_id_3816de20_fk_companies_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `employee_employee` */

insert  into `employee_employee`(`id`,`employee_id`,`name`,`date_joined`,`department`,`address`,`company_id`,`emp_email`) values (1,'nill1emp1','nill1','2023-06-22 00:00:00.000000','IT','DHAKA',2,'nill1@nill1.com'),(2,'nill2emp2','nill2','2023-06-23 00:00:00.000000','IT','DHAKA',2,'nill2@nill2.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
