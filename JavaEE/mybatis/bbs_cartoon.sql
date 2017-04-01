/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.254_test
Source Server Version : 50717
Source Host           : 192.168.1.254:3306
Source Database       : openfire_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-03-22 17:39:51
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
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
