/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.254_test
Source Server Version : 50717
Source Host           : 192.168.1.254:3306
Source Database       : openfire_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-22 17:42:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bbs_cartoon
-- ----------------------------
DROP TABLE IF EXISTS `bbs_cartoon`;
CREATE TABLE `bbs_cartoon` (
  `cartoon_id` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_id` int(11) NOT NULL DEFAULT '0' COMMENT '帖子ID',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `author_count` int(11) NOT NULL DEFAULT '0' COMMENT '创作人数',
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '视频URL',
  `video_image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '视频封面',
  `video_time` int(5) NOT NULL DEFAULT '0' COMMENT '视频时长',
  `play_count` int(5) NOT NULL DEFAULT '0' COMMENT '播放次数',
  `state` tinyint(3) NOT NULL DEFAULT '1' COMMENT '-1表示是删除 ,0表示待审核，1表示正常，２表示进行中,3表示可以后期',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `dub_count` int(11) DEFAULT '0' COMMENT '参与人个数',
  `schedule` int(11) DEFAULT '0' COMMENT '进度,百分之20就返回 整数 20',
  `uid` int(11) NOT NULL COMMENT '编剧',
  `title` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `topic_id` int(11) DEFAULT NULL,
  `screen_type` int(1) NOT NULL DEFAULT '0' COMMENT '0:横屏,1:竖屏',
  `shared_count` int(255) DEFAULT '0' COMMENT '分享次数',
  PRIMARY KEY (`cartoon_id`),
  KEY `IDX_BI_REF_ID` (`bbs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=1523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2055319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='帖子表';
