/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-04-17 16:45:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_level`
-- ----------------------------
DROP TABLE IF EXISTS `cms_level`;
CREATE TABLE `cms_level` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(20) NOT NULL,
  `level_info` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_level
-- ----------------------------
INSERT INTO `cms_level` VALUES ('1', '普通管理员', '除了不能操作其他管理员以为，其他功能都能操作');
INSERT INTO `cms_level` VALUES ('2', '超级管理员', '最大权限，只有一个超管的情况下，不能删除自己');
INSERT INTO `cms_level` VALUES ('3', '发帖专员', '可以发表文章，修改和删除的权限');
INSERT INTO `cms_level` VALUES ('4', '评论专员', '可以评论哦');
INSERT INTO `cms_level` VALUES ('5', '会员专员', '只有管理会员的权限');
INSERT INTO `cms_level` VALUES ('10', '后台游客', '只有访问权限');

-- ----------------------------
-- Table structure for `cms_manage`
-- ----------------------------
DROP TABLE IF EXISTS `cms_manage`;
CREATE TABLE `cms_manage` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(20) NOT NULL,
  `admin_pass` char(40) NOT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '1',
  `login_count` smallint(5) NOT NULL DEFAULT '0',
  `last_ip` varchar(20) NOT NULL DEFAULT '000.000.000.000',
  `last_time` datetime NOT NULL,
  `reg_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_manage
-- ----------------------------
INSERT INTO `cms_manage` VALUES ('1', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-03-27 15:19:54');
INSERT INTO `cms_manage` VALUES ('2', 'oliver', '7c4a8d09ca3762af61e59520943dc26494f8941b', '5', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-03-27 15:23:59');
INSERT INTO `cms_manage` VALUES ('3', '我是MT', '7c4a8d09ca3762af61e59520943dc26494f8941b', '5', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-03-27 15:24:28');
INSERT INTO `cms_manage` VALUES ('4', '樱木花道', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `cms_manage` VALUES ('5', '赤木晴子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `cms_manage` VALUES ('8', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 10:55:30');
INSERT INTO `cms_manage` VALUES ('10', '流川枫', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 10:58:38');
INSERT INTO `cms_manage` VALUES ('29', '宫城良田', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 13:55:04');
INSERT INTO `cms_manage` VALUES ('34', '蜡笔小新', '7c4a8d09ca3762af61e59520943dc26494f8941b', '10', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-17 11:19:41');
INSERT INTO `cms_manage` VALUES ('35', '赤木刚宪', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-17 11:19:58');
