/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.254_test
Source Server Version : 50717
Source Host           : 192.168.1.254:3306
Source Database       : openfire_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-22 17:40:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_posts
-- ----------------------------
DROP TABLE IF EXISTS `bbs_posts`;
CREATE TABLE `bbs_posts` (
  `bbs_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bbs_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8mb4_unicode_ci,
  `comments_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `trend_id` int(11) DEFAULT '0' COMMENT '话题编号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发贴用户编号',
  `is_anonymity` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否匿名 1 是 0 否',
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0.0.0.0',
  `state` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态<1非有效数据',
  `top` tinyint(4) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `comment_user_count` int(11) DEFAULT '0',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `likes_count` int(11) NOT NULL DEFAULT '0',
  `phone_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`bbs_id`),
  KEY `index1` (`topic_id`),
  KEY `index2` (`created_at`),
  KEY `index3` (`uid`),
  KEY `create_date` (`create_date`),
  KEY `city` (`city`) USING BTREE,
  KEY `trend_id` (`trend_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2055318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='帖子表';
