/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.254_test
Source Server Version : 50717
Source Host           : 192.168.1.254:3306
Source Database       : openfire_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-22 17:40:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_cartoon_image
-- ----------------------------
DROP TABLE IF EXISTS `bbs_cartoon_image`;
CREATE TABLE `bbs_cartoon_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartoon_id` int(11) NOT NULL COMMENT '卡通id',
  `image_id` int(11) NOT NULL COMMENT '第几张图片，从1开始',
  `height` int(11) DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '0',
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'url',
  PRIMARY KEY (`id`),
  KEY `cartoon_index` (`cartoon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
