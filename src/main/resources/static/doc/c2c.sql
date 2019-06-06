/*
 Navicat Premium Data Transfer

 Source Server         : mariadb
 Source Server Type    : MySQL
 Source Server Version : 100206
 Source Host           : localhost:3306
 Source Schema         : c2c

 Target Server Type    : MySQL
 Target Server Version : 100206
 File Encoding         : 65001

 Date: 15/05/2019 21:40:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer` (
  `b_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '买家ID',
  `b_name` varchar(255) NOT NULL COMMENT '买家用户名',
  `b_password` varchar(255) NOT NULL COMMENT '买家登录密码',
  `b_phone` varchar(255) DEFAULT NULL COMMENT '买家电话号码',
  `b_tx` varchar(255) DEFAULT NULL COMMENT '买家QQ或者微信',
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `b_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `go_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `go_num` int(10) NOT NULL COMMENT '商品数量',
  `count_price` decimal(8,2) NOT NULL COMMENT '计算数量价格',
  KEY `cbuyer` (`b_id`),
  KEY `cgoods` (`go_id`),
  CONSTRAINT `cbuyer` FOREIGN KEY (`b_id`) REFERENCES `buyer` (`b_id`),
  CONSTRAINT `cgoods` FOREIGN KEY (`go_id`) REFERENCES `goods` (`go_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail` (
  `o_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `go_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `go_num` int(10) NOT NULL COMMENT '商品数量',
  `count_price` decimal(8,2) NOT NULL COMMENT '计算数量价格',
  KEY `deorder` (`o_id`),
  KEY `degoods` (`go_id`),
  CONSTRAINT `degoods` FOREIGN KEY (`go_id`) REFERENCES `goods` (`go_id`),
  CONSTRAINT `deorder` FOREIGN KEY (`o_id`) REFERENCES `order` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `ga_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '游戏ID',
  `ga_name` varchar(255) NOT NULL COMMENT '游戏名称',
  PRIMARY KEY (`ga_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `go_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `ga_id` int(10) unsigned NOT NULL COMMENT '游戏ID',
  `s_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `go_name` varchar(255) NOT NULL COMMENT '商品名',
  `go_state` int(1) NOT NULL DEFAULT 0 COMMENT '商品状态',
  `go_price` decimal(8,2) NOT NULL COMMENT '商品价格',
  PRIMARY KEY (`go_id`) USING BTREE,
  KEY `gogame` (`ga_id`),
  KEY `goseller` (`s_id`),
  CONSTRAINT `gogame` FOREIGN KEY (`ga_id`) REFERENCES `game` (`ga_id`),
  CONSTRAINT `goseller` FOREIGN KEY (`s_id`) REFERENCES `seller` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `o_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `b_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `s_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `o_price` decimal(8,2) NOT NULL COMMENT '订单价格',
  `o_state` int(1) NOT NULL DEFAULT 0 COMMENT '订单状态',
  PRIMARY KEY (`o_id`) USING BTREE,
  KEY `obuyer` (`b_id`),
  KEY `oseller` (`s_id`),
  CONSTRAINT `obuyer` FOREIGN KEY (`b_id`) REFERENCES `buyer` (`b_id`),
  CONSTRAINT `oseller` FOREIGN KEY (`s_id`) REFERENCES `seller` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `s_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家ID',
  `s_name` varchar(255) NOT NULL COMMENT '卖家用户名',
  `s_password` varchar(255) NOT NULL COMMENT '卖家登录密码',
  `s_phone` varchar(255) NOT NULL COMMENT '卖家电话号码',
  `s_mail` varchar(255) NOT NULL COMMENT '卖家邮箱',
  `s_level` int(3) NOT NULL DEFAULT 1 COMMENT '卖家等级',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
