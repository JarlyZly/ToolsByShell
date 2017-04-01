/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.254_test
Source Server Version : 50717
Source Host           : 192.168.1.254:3306
Source Database       : openfire_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-22 17:39:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_cartoon_actor
-- ----------------------------
DROP TABLE IF EXISTS `bbs_cartoon_actor`;
CREATE TABLE `bbs_cartoon_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cartoon_id` int(11) NOT NULL COMMENT '卡通id',
  `image_id` int(11) NOT NULL COMMENT '第几张图片，从1开始',
  `actor_id` int(11) NOT NULL COMMENT '第几个台词位,从1开始',
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `actor_text` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '台词',
  PRIMARY KEY (`id`),
  KEY `cartoon_index` (`cartoon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
