/*
 Navicat Premium Data Transfer

 Source Server         : chopchop
 Source Server Type    : MySQL
 Source Server Version : 50711
 Source Host           : localhost
 Source Database       : FYPRS

 Target Server Type    : MySQL
 Target Server Version : 50711
 File Encoding         : utf-8

 Date: 01/30/2018 22:17:57 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `SESSION_TABLE`
-- ----------------------------
DROP TABLE IF EXISTS `SESSION_TABLE`;
CREATE TABLE `SESSION_TABLE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hxker98q7b5rgt7jo54qjeq0e` (`session_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;



SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
--  Table structure for `TEST_CAST`
-- ----------------------------
DROP TABLE IF EXISTS `TEST_CASE`;
CREATE TABLE `TEST_CASE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
   `test_case_code` varchar(255) NOT NULL,
  `config` varchar(1000) DEFAULT NULL,
  `log_path` varchar(255) DEFAULT NULL,
  `result_path` varchar(255) DEFAULT NULL,
  `rating_metric` varchar(1000) DEFAULT NULL,
  `ranking_metric` varchar(1000) DEFAULT NULL,
  `other_metric` varchar(1000) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
    UNIQUE KEY `UK_hxker98q7b5rgt7jo54qjeq0e` (`test_case_code`,`session_id`),
  CONSTRAINT `FK_nl4vnh3j3rck5xqgeo1067pw4` FOREIGN KEY (`session_id`) REFERENCES `SESSION_TABLE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
