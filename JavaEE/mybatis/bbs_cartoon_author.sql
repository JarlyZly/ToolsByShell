/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.254_test
Source Server Version : 50717
Source Host           : 192.168.1.254:3306
Source Database       : openfire_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-22 17:40:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_cartoon_author
-- ----------------------------
DROP TABLE IF EXISTS `bbs_cartoon_author`;
CREATE TABLE `bbs_cartoon_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartoon_id` int(11) NOT NULL COMMENT '卡通id',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `uid` int(11) NOT NULL,
  `author_type` int(11) NOT NULL COMMENT '0是编剧scriptwriter，1是编剧dub，2是后期post_author',
  `bbs_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cartoon_index` (`cartoon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1519 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
