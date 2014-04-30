/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2014-04-30 17:00:30
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_manage
-- ----------------------------
INSERT INTO `cms_manage` VALUES ('1', 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2', '8', '127.0.0.1', '2014-04-30 08:54:26', '2014-03-27 15:19:54');
INSERT INTO `cms_manage` VALUES ('2', 'oliver', '7c4a8d09ca3762af61e59520943dc26494f8941b', '5', '1', '127.0.0.1', '2014-04-24 08:51:52', '2014-03-27 15:23:59');
INSERT INTO `cms_manage` VALUES ('3', '我是MT', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-03-27 15:24:28');
INSERT INTO `cms_manage` VALUES ('4', '樱木花道', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `cms_manage` VALUES ('5', '赤木晴子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `cms_manage` VALUES ('8', '樱桃小丸子', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 10:55:30');
INSERT INTO `cms_manage` VALUES ('10', '流川枫', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 10:58:38');
INSERT INTO `cms_manage` VALUES ('29', '宫城良田', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-10 13:55:04');
INSERT INTO `cms_manage` VALUES ('34', '蜡笔小新', '7c4a8d09ca3762af61e59520943dc26494f8941b', '10', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-17 11:19:41');
INSERT INTO `cms_manage` VALUES ('35', '赤木刚宪', '7c4a8d09ca3762af61e59520943dc26494f8941b', '4', '0', '000.000.000.000', '0000-00-00 00:00:00', '2014-04-17 11:19:58');

-- ----------------------------
-- Table structure for `cms_nav`
-- ----------------------------
DROP TABLE IF EXISTS `cms_nav`;
CREATE TABLE `cms_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(20) NOT NULL,
  `nav_info` varchar(200) NOT NULL,
  `pid` mediumint(8) NOT NULL DEFAULT '0',
  `sort` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_nav
-- ----------------------------
INSERT INTO `cms_nav` VALUES ('1', '军事动态', '军事方面的新闻', '0', '1');
INSERT INTO `cms_nav` VALUES ('2', '八卦娱乐', '娱乐界的狗仔新闻', '0', '2');
INSERT INTO `cms_nav` VALUES ('3', '时尚女人', '关于时尚和女人的信息', '0', '3');
INSERT INTO `cms_nav` VALUES ('4', '科技频道', '关于科技方面的信息', '0', '4');
INSERT INTO `cms_nav` VALUES ('5', '智能手机', '关于智能手机方面的推荐', '0', '5');
INSERT INTO `cms_nav` VALUES ('6', '美容护肤', '美容护肤', '0', '6');
INSERT INTO `cms_nav` VALUES ('7', '热门汽车', '热门汽车', '0', '7');
INSERT INTO `cms_nav` VALUES ('8', '房产家居', '房产家居', '0', '8');
INSERT INTO `cms_nav` VALUES ('9', '读书教育', '读书教育', '0', '9');
INSERT INTO `cms_nav` VALUES ('11', '股票基金', '股票基金', '0', '11');
INSERT INTO `cms_nav` VALUES ('13', '中国军事', '中国军事', '1', '5');
INSERT INTO `cms_nav` VALUES ('14', '美国军事', '美国军事', '1', '1');
INSERT INTO `cms_nav` VALUES ('15', '韩国军事', '韩国军事', '1', '2');
INSERT INTO `cms_nav` VALUES ('16', '日本军事', '日本军事', '1', '3');
INSERT INTO `cms_nav` VALUES ('18', '越南军事', '越南军事', '1', '4');
