/*
 Navicat Premium Data Transfer

 Source Server         : WindowMysql
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : lu_tale

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 04/08/2018 22:20:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_attach
-- ----------------------------
drop table IF EXISTS `t_attach`;
create TABLE `t_attach`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ftype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `fkey` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorId` int(10) DEFAULT NULL,
  `created` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
drop table IF EXISTS `t_comments`;
create TABLE `t_comments`  (
  `coid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED DEFAULT 0,
  `created` int(10) UNSIGNED DEFAULT 0,
  `author` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `authorId` int(10) UNSIGNED DEFAULT 0,
  `ownerId` int(10) UNSIGNED DEFAULT 0,
  `mail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `agent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'comment',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'approved',
  `parent` int(10) UNSIGNED DEFAULT 0,
  PRIMARY KEY (`coid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `created`(`created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for t_contents
-- ----------------------------
drop table IF EXISTS `t_contents`;
create TABLE `t_contents`  (
  `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `titlePic` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created` int(10) UNSIGNED DEFAULT 0,
  `modified` int(10) UNSIGNED DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '内容文字',
  `authorId` int(10) UNSIGNED DEFAULT 0,
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'post',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'publish',
  `tags` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `categories` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hits` int(10) UNSIGNED DEFAULT 0,
  `commentsNum` int(10) UNSIGNED DEFAULT 0,
  `allowComment` tinyint(1) DEFAULT 1,
  `allowPing` tinyint(1) DEFAULT 1,
  `allowFeed` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `created`(`created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for t_logs
-- ----------------------------
drop table IF EXISTS `t_logs`;
create TABLE `t_logs`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `action` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '事件',
  `data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '数据',
  `authorId` int(10) DEFAULT NULL COMMENT '作者编号',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ip地址',
  `created` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


-- ----------------------------
-- Table structure for t_metas
-- ----------------------------
drop table IF EXISTS `t_metas`;
create TABLE `t_metas`  (
  `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contentType` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sort` int(10) UNSIGNED DEFAULT 0,
  `parent` int(10) UNSIGNED DEFAULT 0,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
drop table IF EXISTS `t_options`;
create TABLE `t_options`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_relationships
-- ----------------------------
drop table IF EXISTS `t_relationships`;
create TABLE `t_relationships`  (
  `cid` int(10) UNSIGNED NOT NULL,
  `mid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`cid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_relationships
-- ----------------------------
insert into `t_relationships` VALUES (27, 41);
insert into `t_relationships` VALUES (27, 42);
insert into `t_relationships` VALUES (27, 43);
insert into `t_relationships` VALUES (27, 46);
insert into `t_relationships` VALUES (28, 41);
insert into `t_relationships` VALUES (28, 43);
insert into `t_relationships` VALUES (29, 41);
insert into `t_relationships` VALUES (29, 42);
insert into `t_relationships` VALUES (29, 43);
insert into `t_relationships` VALUES (30, 48);
insert into `t_relationships` VALUES (31, 48);
insert into `t_relationships` VALUES (32, 41);
insert into `t_relationships` VALUES (32, 43);
insert into `t_relationships` VALUES (33, 48);

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
drop table IF EXISTS `t_users`;
create TABLE `t_users`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `homeUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `screenName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created` int(10) UNSIGNED DEFAULT 0,
  `activated` int(10) UNSIGNED DEFAULT 0,
  `logged` int(10) UNSIGNED DEFAULT 0,
  `groupName` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'visitor',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `name`(`username`) USING BTREE,
  UNIQUE INDEX `mail`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_users
-- ----------------------------
insert into `t_users` VALUES (1, 'admin', 'a66abb5684c45962d887564f08346e8d', '864655735@qq.com', NULL, 'admin', 1490756162, 0, 0, 'visitor');

SET FOREIGN_KEY_CHECKS = 1;


insert into t_options (name, value, description) values ('baidu_site_verification', '123456789', '百度网站验证码');
insert into t_options (name, value, description) values ('google_site_verification', '100000000', '谷歌网站验证码');
insert into t_options (name, value, description) values ('site_description', 'adafdsfasdfasdfas', 'asdfadsfa');
insert into t_options (name, value, description) values ('site_record', '10000', 'c');
insert into t_options (name, value, description) values ('site_title', 'Google', 'google is a great company');
insert into t_options (name, value, description) values ('social_csdn', 'zky', 'abc');
insert into t_options (name, value, description) values ('social_github', 'https://github.com/', 'social_github');
insert into t_options (name, value, description) values ('social_jianshu', 'zky', 'social_jianshu');
insert into t_options (name, value, description) values ('social_resume', 'zky', '简历');
insert into t_options (name, value, description) values ('social_twitter', 'zky', 'social_twitter');
insert into t_options (name, value, description) values ('social_weibo', 'zkydrx', 'social_weibo');
insert into t_options (name, value, description) values ('social_zhihu', '', 'social_zhihu');
