/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.254_test
Source Server Version : 50717
Source Host           : 192.168.1.254:3306
Source Database       : openfire_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-22 17:40:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_cartoon_dub
-- ----------------------------
DROP TABLE IF EXISTS `bbs_cartoon_dub`;
CREATE TABLE `bbs_cartoon_dub` (
  `dub_id` int(11) NOT NULL AUTO_INCREMENT,
  `cartoon_id` int(11) NOT NULL COMMENT '卡通id',
  `actor_id` int(11) NOT NULL COMMENT '第几张图片，从1开始',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `voice_url` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '配音url',
  `voice_time` int(11) NOT NULL COMMENT '配音时长',
  `state` int(1) NOT NULL COMMENT '0是未被选中，1就是被选中',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`dub_id`),
  KEY `cartoon_index` (`cartoon_id`),
  KEY `actor_index` (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
