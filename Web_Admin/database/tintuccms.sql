/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : tintuccms

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-12-29 00:21:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adm_authorities
-- ----------------------------
DROP TABLE IF EXISTS `adm_authorities`;
CREATE TABLE `adm_authorities` (
  `FID` int(10) NOT NULL,
  `DESCRIPTION` varchar(3000) NOT NULL,
  `ORDER_ID` int(10) NOT NULL,
  `AUTH_KEY` int(1) NOT NULL,
  `CREATE_BY` varchar(50) NOT NULL,
  `UPDATE_BY` varchar(50) NOT NULL,
  `GEN_DATE` timestamp NULL DEFAULT NULL,
  `LAST_UPDATED` timestamp NULL DEFAULT NULL,
  `ID` int(10) NOT NULL,
  `AUTHORITY` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adm_authorities
-- ----------------------------
INSERT INTO `adm_authorities` VALUES ('0', 'Quản trị người dùng', '1', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '9', 'ROLE_SYSTEM_USER');
INSERT INTO `adm_authorities` VALUES ('9', 'Thêm người dùng', '1', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '10', 'ROLE_SYSTEM_USER_ADD');
INSERT INTO `adm_authorities` VALUES ('9', 'Xem người dùng', '1', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '11', 'ROLE_SYSTEM_USER_VIEW');
INSERT INTO `adm_authorities` VALUES ('9', 'Sửa người dùng', '1', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '12', 'ROLE_SYSTEM_USER_EDIT');
INSERT INTO `adm_authorities` VALUES ('0', 'Quản trị log hệ thống', '4', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '7', 'ROLE_SYSTEM_LOG');
INSERT INTO `adm_authorities` VALUES ('7', 'Xem log hệ thống', '4', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '8', 'ROLE_SYSTEM_LOG_VIEW');
INSERT INTO `adm_authorities` VALUES ('0', 'Quản trị nhóm quyền', '3', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '14', 'ROLE_SYSTEM_GROUP');
INSERT INTO `adm_authorities` VALUES ('14', 'Xem danh sách nhóm quyền', '3', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '15', 'ROLE_SYSTEM_GROUP_VIEW');
INSERT INTO `adm_authorities` VALUES ('14', 'Thêm nhóm quyền', '3', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '16', 'ROLE_SYSTEM_GROUP_ADD');
INSERT INTO `adm_authorities` VALUES ('14', 'Sửa nhóm quyền', '3', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '17', 'ROLE_SYSTEM_GROUP_EDIT');
INSERT INTO `adm_authorities` VALUES ('14', 'Xóa nhóm quyền', '3', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '18', 'ROLE_SYSTEM_GROUP_DELETE');
INSERT INTO `adm_authorities` VALUES ('9', 'Phân quyền người dùng', '1', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '34', 'ROLE_SYSTEM_USER_AUTHORITY');
INSERT INTO `adm_authorities` VALUES ('0', 'Bài Viết', '19', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '73', 'ROLE_CONTENT_ARTICLE');
INSERT INTO `adm_authorities` VALUES ('73', 'duyệt bài viết', '19', '1', 'admin', 'admin', '2019-07-16 10:56:20', '2019-07-16 10:56:22', '74', 'ROLE_CONTENT_ARTICLE_BROWSE');
INSERT INTO `adm_authorities` VALUES ('73', 'Xem bài biết', '19', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '75', 'ROLE_CONTENT_ARTICLE_VIEW');
INSERT INTO `adm_authorities` VALUES ('73', 'Thêm bài viết', '19', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '76', 'ROLE_CONTENT_ARTICLE_ADD');
INSERT INTO `adm_authorities` VALUES ('73', 'Sửa bài viết', '19', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '77', 'ROLE_CONTENT_ARTICLE_EDIT');
INSERT INTO `adm_authorities` VALUES ('73', 'Xóa bài viết', '19', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '78', 'ROLE_CONTENT_ARTICLE_DELETE');
INSERT INTO `adm_authorities` VALUES ('0', 'Quản trị người chơi', '20', '1', 'admin', 'admin', '2017-12-27 03:13:05', '2017-12-27 03:13:05', '80', 'ROLE_CUSTOMER_MANAGER');
INSERT INTO `adm_authorities` VALUES ('80', 'Xem danh sách người chơi', '1', '1', 'admin', 'admin', '2017-12-27 03:13:05', '2017-12-27 03:13:05', '81', 'ROLE_CUSTOMER_VIEW');
INSERT INTO `adm_authorities` VALUES ('80', 'Xem danh sách người chơi', '1', '1', 'admin', 'admin', '2017-12-27 03:13:05', '2017-12-27 03:13:05', '82', 'ROLE_CUSTOMER_BLOCK');
INSERT INTO `adm_authorities` VALUES ('0', 'Cấu hình thẻ nạp', '21', '1', 'admin', 'admin', '2020-03-17 22:08:57', '2020-03-17 22:08:57', '83', 'ROLE_CONFIG_CARD');
INSERT INTO `adm_authorities` VALUES ('83', 'Cập nhật tỷ lệ thẻ nạp', '21', '1', 'admin', 'admin', '2020-03-17 22:08:57', '2020-03-17 22:08:57', '84', 'ROLE_CONFIG_UPDATE_CARD');
INSERT INTO `adm_authorities` VALUES ('0', 'Chuyên mục bài viết', '14', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '48', 'ROLE_CONTENT_CATEGORY');
INSERT INTO `adm_authorities` VALUES ('85', 'Xem nhóm chủ đề', '22', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '86', 'ROLE_CONTENT_GROUP_TOPIC_VIEW');
INSERT INTO `adm_authorities` VALUES ('85', 'Thêm nhóm chủ đề', '22', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '87', 'ROLE_CONTENT_GROUP_TOPIC_ADD');
INSERT INTO `adm_authorities` VALUES ('85', 'Sửa nhóm chủ đề', '22', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '88', 'ROLE_CONTENT_GROUP_TOPIC_EDIT');
INSERT INTO `adm_authorities` VALUES ('85', 'Xóa nhóm chủ đề', '22', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '89', 'ROLE_CONTENT_GROUP_TOPIC_DELETE');
INSERT INTO `adm_authorities` VALUES ('0', 'Quản lý nhóm chủ đề', '22', '1', 'admin', 'admin', '2020-04-16 23:10:39', '2020-04-16 23:10:42', '85', 'ROLE_CONTENT_GROUP_TOPIC');
INSERT INTO `adm_authorities` VALUES ('48', 'Xem chuyên mục bài viết', '14', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '49', 'ROLE_CONTENT_CATEGORY_VIEW');
INSERT INTO `adm_authorities` VALUES ('48', 'Thêm chuyên mục bài viết', '14', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '50', 'ROLE_CONTENT_CATEGORY_ADD');
INSERT INTO `adm_authorities` VALUES ('48', 'Sửa chuyên mục bài viết', '14', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '51', 'ROLE_CONTENT_CATEGORY_EDIT');
INSERT INTO `adm_authorities` VALUES ('48', 'Xóa chuyên mục', '14', '1', 'admin', 'admin', '2017-12-27 10:13:05', '2017-12-27 10:13:05', '52', 'ROLE_CONTENT_CATEGORY_DELETE');

-- ----------------------------
-- Table structure for adm_group
-- ----------------------------
DROP TABLE IF EXISTS `adm_group`;
CREATE TABLE `adm_group` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `GROUP_NAME` varchar(100) NOT NULL,
  `STATUS` int(1) NOT NULL,
  `AUTHORITY` varchar(1000) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `CREATE_BY` varchar(50) NOT NULL,
  `GEN_DATE` timestamp NULL DEFAULT NULL,
  `UPDATE_BY` varchar(50) DEFAULT NULL,
  `LAST_UPDATED` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `PK_ADM_GROUP` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adm_group
-- ----------------------------
INSERT INTO `adm_group` VALUES ('1', 'Quản trị hệ thống', '1', '', 'Quản trị viên', 'admin', '2018-04-02 09:54:27', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group` VALUES ('420', 'Đăng tải bài viết', '1', null, null, 'admin', '2020-03-06 08:23:19', 'admin', '2020-03-06 08:30:11');

-- ----------------------------
-- Table structure for adm_group_authorities
-- ----------------------------
DROP TABLE IF EXISTS `adm_group_authorities`;
CREATE TABLE `adm_group_authorities` (
  `GROUP_ID` int(10) NOT NULL,
  `AUTHORITY` int(10) NOT NULL,
  `CREATE_BY` varchar(50) NOT NULL,
  `GEN_DATE` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `PK_ADM_GROUP_AUTHORITIES` (`GROUP_ID`,`AUTHORITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adm_group_authorities
-- ----------------------------
INSERT INTO `adm_group_authorities` VALUES ('1', '7', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '8', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '9', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '10', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '11', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '12', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '14', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '15', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '16', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '17', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '18', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '34', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '48', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '49', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '50', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '51', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '52', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '73', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '74', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '75', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '76', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '77', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '78', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '80', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '81', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '82', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '83', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '84', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '85', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '86', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '87', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '88', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('1', '89', 'admin', '2020-04-16 16:43:59');
INSERT INTO `adm_group_authorities` VALUES ('420', '75', 'admin', '2020-03-06 08:30:14');
INSERT INTO `adm_group_authorities` VALUES ('420', '76', 'admin', '2020-03-06 08:30:14');

-- ----------------------------
-- Table structure for adm_group_user
-- ----------------------------
DROP TABLE IF EXISTS `adm_group_user`;
CREATE TABLE `adm_group_user` (
  `GROUP_ID` int(10) NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `CREATE_BY` varchar(50) NOT NULL,
  `GEN_DATE` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `PK_ADM_GROUP_USER1` (`GROUP_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adm_group_user
-- ----------------------------
INSERT INTO `adm_group_user` VALUES ('1', '1', 'admin', '2019-08-25 23:56:19');
INSERT INTO `adm_group_user` VALUES ('420', '729', 'admin', '2020-03-06 08:29:08');

-- ----------------------------
-- Table structure for adm_log_access
-- ----------------------------
DROP TABLE IF EXISTS `adm_log_access`;
CREATE TABLE `adm_log_access` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `MODULE_ID` varchar(100) NOT NULL,
  `IP` varchar(100) NOT NULL,
  `ACTIONS` varchar(200) NOT NULL,
  `GEN_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adm_log_access
-- ----------------------------
INSERT INTO `adm_log_access` VALUES ('1', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-03 14:21:28');
INSERT INTO `adm_log_access` VALUES ('2', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9064', '2019-06-03 14:21:56');
INSERT INTO `adm_log_access` VALUES ('3', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Sửa Chuyên mục, Id:9064', '2019-06-03 14:22:24');
INSERT INTO `adm_log_access` VALUES ('4', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-03 14:32:10');
INSERT INTO `adm_log_access` VALUES ('5', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-03 14:47:32');
INSERT INTO `adm_log_access` VALUES ('6', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:1', '2019-06-03 14:48:39');
INSERT INTO `adm_log_access` VALUES ('7', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-03 14:50:01');
INSERT INTO `adm_log_access` VALUES ('8', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-06-03 14:50:35');
INSERT INTO `adm_log_access` VALUES ('10', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-06-03 15:13:25');
INSERT INTO `adm_log_access` VALUES ('11', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-03 15:15:25');
INSERT INTO `adm_log_access` VALUES ('12', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-03 15:19:25');
INSERT INTO `adm_log_access` VALUES ('13', '700', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-03 15:40:54');
INSERT INTO `adm_log_access` VALUES ('14', '700', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-03 15:41:05');
INSERT INTO `adm_log_access` VALUES ('15', '700', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-06-03 15:41:05');
INSERT INTO `adm_log_access` VALUES ('16', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-03 15:41:09');
INSERT INTO `adm_log_access` VALUES ('17', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-03 15:41:49');
INSERT INTO `adm_log_access` VALUES ('18', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-06-03 15:41:49');
INSERT INTO `adm_log_access` VALUES ('19', '700', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-03 15:41:57');
INSERT INTO `adm_log_access` VALUES ('20', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 14:35:32');
INSERT INTO `adm_log_access` VALUES ('21', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-04 15:06:48');
INSERT INTO `adm_log_access` VALUES ('22', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 15:45:20');
INSERT INTO `adm_log_access` VALUES ('23', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-04 16:23:49');
INSERT INTO `adm_log_access` VALUES ('24', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-06-04 16:23:49');
INSERT INTO `adm_log_access` VALUES ('25', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 16:23:52');
INSERT INTO `adm_log_access` VALUES ('26', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-04 16:26:27');
INSERT INTO `adm_log_access` VALUES ('27', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-06-04 16:26:27');
INSERT INTO `adm_log_access` VALUES ('28', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 16:26:31');
INSERT INTO `adm_log_access` VALUES ('29', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 16:36:47');
INSERT INTO `adm_log_access` VALUES ('30', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 16:47:03');
INSERT INTO `adm_log_access` VALUES ('31', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 16:55:32');
INSERT INTO `adm_log_access` VALUES ('32', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 17:24:43');
INSERT INTO `adm_log_access` VALUES ('33', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 17:25:04');
INSERT INTO `adm_log_access` VALUES ('34', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-04 17:26:22');
INSERT INTO `adm_log_access` VALUES ('35', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-04 17:26:29');
INSERT INTO `adm_log_access` VALUES ('36', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Sửa Chuyên mục, Id:9064', '2019-06-04 17:27:39');
INSERT INTO `adm_log_access` VALUES ('37', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9065', '2019-06-04 17:28:20');
INSERT INTO `adm_log_access` VALUES ('38', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9066', '2019-06-04 17:28:53');
INSERT INTO `adm_log_access` VALUES ('39', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-06-04 17:36:10');
INSERT INTO `adm_log_access` VALUES ('40', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-04 17:55:53');
INSERT INTO `adm_log_access` VALUES ('41', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-04 17:55:53');
INSERT INTO `adm_log_access` VALUES ('42', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-05 08:14:26');
INSERT INTO `adm_log_access` VALUES ('43', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-05 08:19:16');
INSERT INTO `adm_log_access` VALUES ('44', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:2', '2019-06-05 08:20:03');
INSERT INTO `adm_log_access` VALUES ('45', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-06-05 08:41:56');
INSERT INTO `adm_log_access` VALUES ('46', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:3', '2019-06-05 08:48:09');
INSERT INTO `adm_log_access` VALUES ('47', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-05 09:24:38');
INSERT INTO `adm_log_access` VALUES ('48', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-05 11:40:39');
INSERT INTO `adm_log_access` VALUES ('49', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-05 13:31:33');
INSERT INTO `adm_log_access` VALUES ('50', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-06 00:17:12');
INSERT INTO `adm_log_access` VALUES ('51', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-06 07:49:09');
INSERT INTO `adm_log_access` VALUES ('52', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-06 13:48:23');
INSERT INTO `adm_log_access` VALUES ('53', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-06 14:28:50');
INSERT INTO `adm_log_access` VALUES ('54', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-11 15:36:54');
INSERT INTO `adm_log_access` VALUES ('55', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-11 15:44:38');
INSERT INTO `adm_log_access` VALUES ('56', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-11 16:15:09');
INSERT INTO `adm_log_access` VALUES ('57', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-11 16:22:58');
INSERT INTO `adm_log_access` VALUES ('58', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-11 16:52:04');
INSERT INTO `adm_log_access` VALUES ('59', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-11 16:52:17');
INSERT INTO `adm_log_access` VALUES ('60', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-11 17:20:49');
INSERT INTO `adm_log_access` VALUES ('61', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-06-11 17:21:33');
INSERT INTO `adm_log_access` VALUES ('62', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-11 17:21:41');
INSERT INTO `adm_log_access` VALUES ('63', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-11 17:22:24');
INSERT INTO `adm_log_access` VALUES ('64', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-11 17:24:03');
INSERT INTO `adm_log_access` VALUES ('65', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-06-11 17:24:03');
INSERT INTO `adm_log_access` VALUES ('66', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-11 17:24:08');
INSERT INTO `adm_log_access` VALUES ('67', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-11 17:32:34');
INSERT INTO `adm_log_access` VALUES ('68', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 08:50:16');
INSERT INTO `adm_log_access` VALUES ('69', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-12 09:39:11');
INSERT INTO `adm_log_access` VALUES ('70', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 10:03:47');
INSERT INTO `adm_log_access` VALUES ('71', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 14:33:22');
INSERT INTO `adm_log_access` VALUES ('72', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 15:12:33');
INSERT INTO `adm_log_access` VALUES ('73', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 15:48:20');
INSERT INTO `adm_log_access` VALUES ('74', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 15:58:02');
INSERT INTO `adm_log_access` VALUES ('75', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 16:34:17');
INSERT INTO `adm_log_access` VALUES ('76', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 16:54:28');
INSERT INTO `adm_log_access` VALUES ('77', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 17:41:57');
INSERT INTO `adm_log_access` VALUES ('78', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-12 17:41:57');
INSERT INTO `adm_log_access` VALUES ('79', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-12 18:48:24');
INSERT INTO `adm_log_access` VALUES ('80', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 10:01:07');
INSERT INTO `adm_log_access` VALUES ('81', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 10:21:52');
INSERT INTO `adm_log_access` VALUES ('82', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9067', '2019-06-13 10:29:57');
INSERT INTO `adm_log_access` VALUES ('83', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9068', '2019-06-13 10:30:02');
INSERT INTO `adm_log_access` VALUES ('84', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9069', '2019-06-13 10:30:08');
INSERT INTO `adm_log_access` VALUES ('85', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9070', '2019-06-13 10:30:12');
INSERT INTO `adm_log_access` VALUES ('86', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9071', '2019-06-13 10:30:18');
INSERT INTO `adm_log_access` VALUES ('87', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9072', '2019-06-13 10:30:22');
INSERT INTO `adm_log_access` VALUES ('88', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9073', '2019-06-13 10:30:27');
INSERT INTO `adm_log_access` VALUES ('89', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9074', '2019-06-13 10:30:31');
INSERT INTO `adm_log_access` VALUES ('90', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9075', '2019-06-13 10:30:38');
INSERT INTO `adm_log_access` VALUES ('91', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9076', '2019-06-13 10:30:43');
INSERT INTO `adm_log_access` VALUES ('92', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9077', '2019-06-13 10:30:47');
INSERT INTO `adm_log_access` VALUES ('93', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9078', '2019-06-13 10:30:51');
INSERT INTO `adm_log_access` VALUES ('94', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9079', '2019-06-13 10:30:58');
INSERT INTO `adm_log_access` VALUES ('95', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9080', '2019-06-13 10:31:02');
INSERT INTO `adm_log_access` VALUES ('96', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9081', '2019-06-13 10:31:06');
INSERT INTO `adm_log_access` VALUES ('97', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9082', '2019-06-13 10:31:10');
INSERT INTO `adm_log_access` VALUES ('98', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9083', '2019-06-13 10:31:14');
INSERT INTO `adm_log_access` VALUES ('99', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9084', '2019-06-13 10:31:21');
INSERT INTO `adm_log_access` VALUES ('100', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 10:39:39');
INSERT INTO `adm_log_access` VALUES ('101', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 10:58:13');
INSERT INTO `adm_log_access` VALUES ('102', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 11:16:50');
INSERT INTO `adm_log_access` VALUES ('103', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 11:30:31');
INSERT INTO `adm_log_access` VALUES ('104', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 11:36:16');
INSERT INTO `adm_log_access` VALUES ('105', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 11:42:11');
INSERT INTO `adm_log_access` VALUES ('106', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 11:51:55');
INSERT INTO `adm_log_access` VALUES ('107', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-13 13:33:44');
INSERT INTO `adm_log_access` VALUES ('108', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 13:33:51');
INSERT INTO `adm_log_access` VALUES ('109', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 13:43:40');
INSERT INTO `adm_log_access` VALUES ('110', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 13:52:34');
INSERT INTO `adm_log_access` VALUES ('111', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 14:03:59');
INSERT INTO `adm_log_access` VALUES ('112', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 14:11:42');
INSERT INTO `adm_log_access` VALUES ('113', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-13 14:40:36');
INSERT INTO `adm_log_access` VALUES ('114', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-06-13 14:40:36');
INSERT INTO `adm_log_access` VALUES ('115', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 14:40:40');
INSERT INTO `adm_log_access` VALUES ('116', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 14:42:01');
INSERT INTO `adm_log_access` VALUES ('117', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 14:54:52');
INSERT INTO `adm_log_access` VALUES ('118', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 14:58:00');
INSERT INTO `adm_log_access` VALUES ('119', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 15:29:23');
INSERT INTO `adm_log_access` VALUES ('120', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 15:36:13');
INSERT INTO `adm_log_access` VALUES ('121', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-13 16:12:03');
INSERT INTO `adm_log_access` VALUES ('122', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 18:00:23');
INSERT INTO `adm_log_access` VALUES ('123', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 18:14:22');
INSERT INTO `adm_log_access` VALUES ('124', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 23:24:00');
INSERT INTO `adm_log_access` VALUES ('125', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-13 23:27:40');
INSERT INTO `adm_log_access` VALUES ('126', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-13 23:58:22');
INSERT INTO `adm_log_access` VALUES ('127', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-14 09:20:33');
INSERT INTO `adm_log_access` VALUES ('128', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-14 09:30:11');
INSERT INTO `adm_log_access` VALUES ('129', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-14 09:44:27');
INSERT INTO `adm_log_access` VALUES ('130', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-14 09:51:49');
INSERT INTO `adm_log_access` VALUES ('131', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-14 09:59:55');
INSERT INTO `adm_log_access` VALUES ('132', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-14 11:06:42');
INSERT INTO `adm_log_access` VALUES ('133', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-19 22:48:49');
INSERT INTO `adm_log_access` VALUES ('134', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-19 22:51:17');
INSERT INTO `adm_log_access` VALUES ('135', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-19 23:01:16');
INSERT INTO `adm_log_access` VALUES ('136', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-19 23:12:04');
INSERT INTO `adm_log_access` VALUES ('137', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-19 23:40:31');
INSERT INTO `adm_log_access` VALUES ('138', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-19 23:47:55');
INSERT INTO `adm_log_access` VALUES ('139', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 08:17:26');
INSERT INTO `adm_log_access` VALUES ('140', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 08:48:36');
INSERT INTO `adm_log_access` VALUES ('141', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 09:10:03');
INSERT INTO `adm_log_access` VALUES ('142', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 09:21:30');
INSERT INTO `adm_log_access` VALUES ('143', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 09:30:07');
INSERT INTO `adm_log_access` VALUES ('144', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 09:46:20');
INSERT INTO `adm_log_access` VALUES ('145', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 09:54:38');
INSERT INTO `adm_log_access` VALUES ('146', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 10:25:38');
INSERT INTO `adm_log_access` VALUES ('147', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 10:35:22');
INSERT INTO `adm_log_access` VALUES ('148', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 11:08:52');
INSERT INTO `adm_log_access` VALUES ('149', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-20 13:33:17');
INSERT INTO `adm_log_access` VALUES ('150', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 13:37:08');
INSERT INTO `adm_log_access` VALUES ('151', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 14:03:16');
INSERT INTO `adm_log_access` VALUES ('152', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 14:07:18');
INSERT INTO `adm_log_access` VALUES ('153', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 14:09:53');
INSERT INTO `adm_log_access` VALUES ('154', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 14:29:33');
INSERT INTO `adm_log_access` VALUES ('155', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:02:40');
INSERT INTO `adm_log_access` VALUES ('156', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:05:05');
INSERT INTO `adm_log_access` VALUES ('157', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:07:47');
INSERT INTO `adm_log_access` VALUES ('158', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:14:14');
INSERT INTO `adm_log_access` VALUES ('159', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:18:17');
INSERT INTO `adm_log_access` VALUES ('160', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:25:28');
INSERT INTO `adm_log_access` VALUES ('161', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:28:00');
INSERT INTO `adm_log_access` VALUES ('162', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:30:20');
INSERT INTO `adm_log_access` VALUES ('163', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:33:52');
INSERT INTO `adm_log_access` VALUES ('164', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 16:39:53');
INSERT INTO `adm_log_access` VALUES ('165', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-20 17:50:34');
INSERT INTO `adm_log_access` VALUES ('166', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 17:50:43');
INSERT INTO `adm_log_access` VALUES ('167', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 17:54:14');
INSERT INTO `adm_log_access` VALUES ('168', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 18:09:31');
INSERT INTO `adm_log_access` VALUES ('169', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 23:12:04');
INSERT INTO `adm_log_access` VALUES ('170', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 23:14:48');
INSERT INTO `adm_log_access` VALUES ('171', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 23:19:47');
INSERT INTO `adm_log_access` VALUES ('172', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 23:23:48');
INSERT INTO `adm_log_access` VALUES ('173', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 23:32:08');
INSERT INTO `adm_log_access` VALUES ('174', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 23:37:42');
INSERT INTO `adm_log_access` VALUES ('175', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-20 23:40:41');
INSERT INTO `adm_log_access` VALUES ('176', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-21 08:04:27');
INSERT INTO `adm_log_access` VALUES ('177', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 08:05:14');
INSERT INTO `adm_log_access` VALUES ('178', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 08:06:05');
INSERT INTO `adm_log_access` VALUES ('179', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 08:08:47');
INSERT INTO `adm_log_access` VALUES ('180', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 08:18:10');
INSERT INTO `adm_log_access` VALUES ('181', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 08:19:29');
INSERT INTO `adm_log_access` VALUES ('182', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 08:21:33');
INSERT INTO `adm_log_access` VALUES ('183', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 08:33:32');
INSERT INTO `adm_log_access` VALUES ('184', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 09:05:25');
INSERT INTO `adm_log_access` VALUES ('185', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 09:08:24');
INSERT INTO `adm_log_access` VALUES ('186', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 09:12:18');
INSERT INTO `adm_log_access` VALUES ('187', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 09:17:33');
INSERT INTO `adm_log_access` VALUES ('188', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 09:35:27');
INSERT INTO `adm_log_access` VALUES ('189', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 10:02:18');
INSERT INTO `adm_log_access` VALUES ('190', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 10:04:44');
INSERT INTO `adm_log_access` VALUES ('191', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 10:40:51');
INSERT INTO `adm_log_access` VALUES ('192', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 10:50:43');
INSERT INTO `adm_log_access` VALUES ('193', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 11:20:10');
INSERT INTO `adm_log_access` VALUES ('194', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 11:25:16');
INSERT INTO `adm_log_access` VALUES ('195', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 11:50:21');
INSERT INTO `adm_log_access` VALUES ('196', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-21 13:34:23');
INSERT INTO `adm_log_access` VALUES ('197', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 13:45:52');
INSERT INTO `adm_log_access` VALUES ('198', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 13:49:24');
INSERT INTO `adm_log_access` VALUES ('199', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 14:08:28');
INSERT INTO `adm_log_access` VALUES ('200', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 14:21:22');
INSERT INTO `adm_log_access` VALUES ('201', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 14:56:45');
INSERT INTO `adm_log_access` VALUES ('202', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 15:12:55');
INSERT INTO `adm_log_access` VALUES ('203', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 15:18:19');
INSERT INTO `adm_log_access` VALUES ('204', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 15:20:10');
INSERT INTO `adm_log_access` VALUES ('205', '1', 'Tổ chức công chứng', '0:0:0:0:0:0:0:1', 'Thêm TCCC. Id:139', '2019-06-21 15:20:41');
INSERT INTO `adm_log_access` VALUES ('206', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 15:57:26');
INSERT INTO `adm_log_access` VALUES ('207', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 16:15:42');
INSERT INTO `adm_log_access` VALUES ('208', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 16:46:01');
INSERT INTO `adm_log_access` VALUES ('209', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 17:23:34');
INSERT INTO `adm_log_access` VALUES ('210', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 17:43:53');
INSERT INTO `adm_log_access` VALUES ('211', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 17:49:15');
INSERT INTO `adm_log_access` VALUES ('212', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 17:53:59');
INSERT INTO `adm_log_access` VALUES ('213', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-21 18:08:09');
INSERT INTO `adm_log_access` VALUES ('214', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-22 14:26:25');
INSERT INTO `adm_log_access` VALUES ('215', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-22 14:58:21');
INSERT INTO `adm_log_access` VALUES ('216', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-22 14:59:42');
INSERT INTO `adm_log_access` VALUES ('217', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-22 19:58:11');
INSERT INTO `adm_log_access` VALUES ('218', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-22 20:16:18');
INSERT INTO `adm_log_access` VALUES ('219', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-22 22:02:12');
INSERT INTO `adm_log_access` VALUES ('220', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 00:43:26');
INSERT INTO `adm_log_access` VALUES ('221', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 00:46:56');
INSERT INTO `adm_log_access` VALUES ('222', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:3', '2019-06-23 00:54:48');
INSERT INTO `adm_log_access` VALUES ('223', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:4', '2019-06-23 00:56:46');
INSERT INTO `adm_log_access` VALUES ('224', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 01:08:54');
INSERT INTO `adm_log_access` VALUES ('225', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-23 09:52:18');
INSERT INTO `adm_log_access` VALUES ('226', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 13:43:33');
INSERT INTO `adm_log_access` VALUES ('227', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-23 14:14:24');
INSERT INTO `adm_log_access` VALUES ('228', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 15:43:51');
INSERT INTO `adm_log_access` VALUES ('229', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 16:27:41');
INSERT INTO `adm_log_access` VALUES ('230', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 17:34:18');
INSERT INTO `adm_log_access` VALUES ('231', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-23 18:08:15');
INSERT INTO `adm_log_access` VALUES ('232', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 18:38:43');
INSERT INTO `adm_log_access` VALUES ('233', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-23 22:06:57');
INSERT INTO `adm_log_access` VALUES ('234', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-24 07:55:55');
INSERT INTO `adm_log_access` VALUES ('235', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-24 08:05:24');
INSERT INTO `adm_log_access` VALUES ('236', '1', 'Tổ chức công chứng', '0:0:0:0:0:0:0:1', 'Thêm TCCC. Id:140', '2019-06-24 08:06:02');
INSERT INTO `adm_log_access` VALUES ('237', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-24 11:05:43');
INSERT INTO `adm_log_access` VALUES ('238', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-24 11:57:03');
INSERT INTO `adm_log_access` VALUES ('239', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-24 13:41:48');
INSERT INTO `adm_log_access` VALUES ('240', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:4', '2019-06-24 13:42:25');
INSERT INTO `adm_log_access` VALUES ('241', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:4', '2019-06-24 13:42:44');
INSERT INTO `adm_log_access` VALUES ('242', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-24 14:10:23');
INSERT INTO `adm_log_access` VALUES ('243', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:4', '2019-06-24 14:11:03');
INSERT INTO `adm_log_access` VALUES ('244', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:4', '2019-06-24 14:29:16');
INSERT INTO `adm_log_access` VALUES ('245', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:4', '2019-06-24 14:30:37');
INSERT INTO `adm_log_access` VALUES ('246', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9083', '2019-06-24 14:34:51');
INSERT INTO `adm_log_access` VALUES ('247', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9078', '2019-06-24 14:34:55');
INSERT INTO `adm_log_access` VALUES ('248', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9067', '2019-06-24 14:35:00');
INSERT INTO `adm_log_access` VALUES ('249', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9076', '2019-06-24 14:35:05');
INSERT INTO `adm_log_access` VALUES ('250', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9075', '2019-06-24 14:35:09');
INSERT INTO `adm_log_access` VALUES ('251', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9068', '2019-06-24 14:35:13');
INSERT INTO `adm_log_access` VALUES ('252', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9069', '2019-06-24 14:35:17');
INSERT INTO `adm_log_access` VALUES ('253', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9074', '2019-06-24 14:35:21');
INSERT INTO `adm_log_access` VALUES ('254', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9070', '2019-06-24 14:35:24');
INSERT INTO `adm_log_access` VALUES ('255', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9077', '2019-06-24 14:35:29');
INSERT INTO `adm_log_access` VALUES ('256', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9073', '2019-06-24 14:35:33');
INSERT INTO `adm_log_access` VALUES ('257', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9071', '2019-06-24 14:35:37');
INSERT INTO `adm_log_access` VALUES ('258', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9079', '2019-06-24 14:35:41');
INSERT INTO `adm_log_access` VALUES ('259', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9080', '2019-06-24 14:35:45');
INSERT INTO `adm_log_access` VALUES ('260', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9081', '2019-06-24 14:36:29');
INSERT INTO `adm_log_access` VALUES ('261', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9072', '2019-06-24 14:36:34');
INSERT INTO `adm_log_access` VALUES ('262', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9084', '2019-06-24 14:36:38');
INSERT INTO `adm_log_access` VALUES ('263', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Xóa Chuyên mục, Id:9082', '2019-06-24 14:36:45');
INSERT INTO `adm_log_access` VALUES ('264', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 15:35:04');
INSERT INTO `adm_log_access` VALUES ('265', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:4', '2019-06-24 15:36:12');
INSERT INTO `adm_log_access` VALUES ('266', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 15:39:19');
INSERT INTO `adm_log_access` VALUES ('267', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:4', '2019-06-24 15:40:48');
INSERT INTO `adm_log_access` VALUES ('268', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 15:43:39');
INSERT INTO `adm_log_access` VALUES ('269', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:4', '2019-06-24 15:44:42');
INSERT INTO `adm_log_access` VALUES ('270', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-24 17:09:07');
INSERT INTO `adm_log_access` VALUES ('271', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 17:10:04');
INSERT INTO `adm_log_access` VALUES ('272', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 17:17:28');
INSERT INTO `adm_log_access` VALUES ('273', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 18:03:21');
INSERT INTO `adm_log_access` VALUES ('274', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 18:08:57');
INSERT INTO `adm_log_access` VALUES ('275', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 18:19:21');
INSERT INTO `adm_log_access` VALUES ('276', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 18:36:16');
INSERT INTO `adm_log_access` VALUES ('277', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-24 19:12:34');
INSERT INTO `adm_log_access` VALUES ('278', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-24 19:19:51');
INSERT INTO `adm_log_access` VALUES ('279', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 08:09:19');
INSERT INTO `adm_log_access` VALUES ('280', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-25 09:20:12');
INSERT INTO `adm_log_access` VALUES ('281', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 10:50:42');
INSERT INTO `adm_log_access` VALUES ('282', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 11:06:31');
INSERT INTO `adm_log_access` VALUES ('283', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 11:17:34');
INSERT INTO `adm_log_access` VALUES ('284', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 11:58:11');
INSERT INTO `adm_log_access` VALUES ('285', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-25 13:38:24');
INSERT INTO `adm_log_access` VALUES ('286', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 13:41:13');
INSERT INTO `adm_log_access` VALUES ('287', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-25 14:08:55');
INSERT INTO `adm_log_access` VALUES ('288', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 14:40:17');
INSERT INTO `adm_log_access` VALUES ('289', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 14:56:38');
INSERT INTO `adm_log_access` VALUES ('290', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 16:03:27');
INSERT INTO `adm_log_access` VALUES ('291', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-25 17:01:29');
INSERT INTO `adm_log_access` VALUES ('292', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 17:24:52');
INSERT INTO `adm_log_access` VALUES ('293', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 17:26:45');
INSERT INTO `adm_log_access` VALUES ('294', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-25 17:42:51');
INSERT INTO `adm_log_access` VALUES ('295', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 09:38:05');
INSERT INTO `adm_log_access` VALUES ('296', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 09:42:05');
INSERT INTO `adm_log_access` VALUES ('297', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 10:29:54');
INSERT INTO `adm_log_access` VALUES ('298', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 10:34:47');
INSERT INTO `adm_log_access` VALUES ('299', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 10:52:02');
INSERT INTO `adm_log_access` VALUES ('300', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 11:35:37');
INSERT INTO `adm_log_access` VALUES ('301', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 11:39:51');
INSERT INTO `adm_log_access` VALUES ('302', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-26 13:34:43');
INSERT INTO `adm_log_access` VALUES ('303', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 13:39:08');
INSERT INTO `adm_log_access` VALUES ('304', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-26 14:25:35');
INSERT INTO `adm_log_access` VALUES ('305', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 15:37:57');
INSERT INTO `adm_log_access` VALUES ('306', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 15:43:57');
INSERT INTO `adm_log_access` VALUES ('307', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-26 15:59:42');
INSERT INTO `adm_log_access` VALUES ('308', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-26 16:00:07');
INSERT INTO `adm_log_access` VALUES ('309', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-26 16:22:19');
INSERT INTO `adm_log_access` VALUES ('310', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 16:30:04');
INSERT INTO `adm_log_access` VALUES ('311', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-26 16:30:47');
INSERT INTO `adm_log_access` VALUES ('312', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-26 16:50:48');
INSERT INTO `adm_log_access` VALUES ('313', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 17:26:34');
INSERT INTO `adm_log_access` VALUES ('314', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 18:02:23');
INSERT INTO `adm_log_access` VALUES ('315', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 18:29:58');
INSERT INTO `adm_log_access` VALUES ('316', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 19:31:09');
INSERT INTO `adm_log_access` VALUES ('317', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:4', '2019-06-26 19:31:35');
INSERT INTO `adm_log_access` VALUES ('318', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-26 19:40:46');
INSERT INTO `adm_log_access` VALUES ('319', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:4', '2019-06-26 19:41:07');
INSERT INTO `adm_log_access` VALUES ('320', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:4', '2019-06-26 19:41:53');
INSERT INTO `adm_log_access` VALUES ('321', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 08:11:45');
INSERT INTO `adm_log_access` VALUES ('322', '1', 'Bài viết', '127.0.0.1', 'Thêm bài viết. Id:5', '2019-06-27 08:16:45');
INSERT INTO `adm_log_access` VALUES ('323', '1', 'Bài viết', '127.0.0.1', 'Thêm bài viết. Id:6', '2019-06-27 08:19:03');
INSERT INTO `adm_log_access` VALUES ('324', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 08:21:31');
INSERT INTO `adm_log_access` VALUES ('325', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 08:40:52');
INSERT INTO `adm_log_access` VALUES ('326', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:6', '2019-06-27 08:42:18');
INSERT INTO `adm_log_access` VALUES ('327', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 08:51:35');
INSERT INTO `adm_log_access` VALUES ('328', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:6', '2019-06-27 08:52:27');
INSERT INTO `adm_log_access` VALUES ('329', '1', 'Bài viết', '127.0.0.1', 'Sửa bài viết, Id:6', '2019-06-27 08:54:19');
INSERT INTO `adm_log_access` VALUES ('330', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-27 09:22:58');
INSERT INTO `adm_log_access` VALUES ('331', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-27 09:25:14');
INSERT INTO `adm_log_access` VALUES ('332', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-27 10:01:36');
INSERT INTO `adm_log_access` VALUES ('333', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 10:17:06');
INSERT INTO `adm_log_access` VALUES ('334', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-06-27 10:22:52');
INSERT INTO `adm_log_access` VALUES ('335', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 11:07:03');
INSERT INTO `adm_log_access` VALUES ('336', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-06-27 11:08:37');
INSERT INTO `adm_log_access` VALUES ('337', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 11:23:27');
INSERT INTO `adm_log_access` VALUES ('338', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 11:45:29');
INSERT INTO `adm_log_access` VALUES ('339', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 11:56:50');
INSERT INTO `adm_log_access` VALUES ('340', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-27 12:29:15');
INSERT INTO `adm_log_access` VALUES ('341', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 14:00:40');
INSERT INTO `adm_log_access` VALUES ('342', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 14:22:55');
INSERT INTO `adm_log_access` VALUES ('343', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 14:33:03');
INSERT INTO `adm_log_access` VALUES ('344', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 14:36:56');
INSERT INTO `adm_log_access` VALUES ('345', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 14:51:46');
INSERT INTO `adm_log_access` VALUES ('346', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 15:21:49');
INSERT INTO `adm_log_access` VALUES ('347', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 16:17:27');
INSERT INTO `adm_log_access` VALUES ('348', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 17:09:04');
INSERT INTO `adm_log_access` VALUES ('349', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 18:08:56');
INSERT INTO `adm_log_access` VALUES ('350', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-27 18:47:22');
INSERT INTO `adm_log_access` VALUES ('351', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-27 18:59:42');
INSERT INTO `adm_log_access` VALUES ('352', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 09:07:38');
INSERT INTO `adm_log_access` VALUES ('353', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 09:18:11');
INSERT INTO `adm_log_access` VALUES ('354', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 09:34:20');
INSERT INTO `adm_log_access` VALUES ('355', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 10:05:15');
INSERT INTO `adm_log_access` VALUES ('356', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 10:27:00');
INSERT INTO `adm_log_access` VALUES ('357', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 10:44:37');
INSERT INTO `adm_log_access` VALUES ('358', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 11:29:09');
INSERT INTO `adm_log_access` VALUES ('359', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 11:49:41');
INSERT INTO `adm_log_access` VALUES ('360', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 14:00:25');
INSERT INTO `adm_log_access` VALUES ('361', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 14:25:28');
INSERT INTO `adm_log_access` VALUES ('362', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 14:30:20');
INSERT INTO `adm_log_access` VALUES ('363', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 14:37:46');
INSERT INTO `adm_log_access` VALUES ('364', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 14:43:24');
INSERT INTO `adm_log_access` VALUES ('365', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-06-28 15:14:10');
INSERT INTO `adm_log_access` VALUES ('366', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 15:27:28');
INSERT INTO `adm_log_access` VALUES ('367', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 15:56:50');
INSERT INTO `adm_log_access` VALUES ('368', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:01:21');
INSERT INTO `adm_log_access` VALUES ('369', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:09:14');
INSERT INTO `adm_log_access` VALUES ('370', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:19:56');
INSERT INTO `adm_log_access` VALUES ('371', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:22:58');
INSERT INTO `adm_log_access` VALUES ('372', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:26:34');
INSERT INTO `adm_log_access` VALUES ('373', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:34:38');
INSERT INTO `adm_log_access` VALUES ('374', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:40:42');
INSERT INTO `adm_log_access` VALUES ('375', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:51:20');
INSERT INTO `adm_log_access` VALUES ('376', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 16:54:00');
INSERT INTO `adm_log_access` VALUES ('377', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 17:00:57');
INSERT INTO `adm_log_access` VALUES ('378', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 17:16:53');
INSERT INTO `adm_log_access` VALUES ('379', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 17:25:10');
INSERT INTO `adm_log_access` VALUES ('380', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 17:34:30');
INSERT INTO `adm_log_access` VALUES ('381', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 17:48:31');
INSERT INTO `adm_log_access` VALUES ('382', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 18:24:55');
INSERT INTO `adm_log_access` VALUES ('383', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 18:48:04');
INSERT INTO `adm_log_access` VALUES ('384', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-06-28 18:53:56');
INSERT INTO `adm_log_access` VALUES ('385', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-03 15:39:52');
INSERT INTO `adm_log_access` VALUES ('386', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-07-03 15:55:38');
INSERT INTO `adm_log_access` VALUES ('387', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-07-03 15:55:38');
INSERT INTO `adm_log_access` VALUES ('388', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-03 15:55:43');
INSERT INTO `adm_log_access` VALUES ('389', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-07-03 16:26:37');
INSERT INTO `adm_log_access` VALUES ('390', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-04 09:15:16');
INSERT INTO `adm_log_access` VALUES ('391', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất sessionTimeout', '2019-07-04 09:27:50');
INSERT INTO `adm_log_access` VALUES ('392', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-07-04 09:27:50');
INSERT INTO `adm_log_access` VALUES ('393', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-04 09:29:55');
INSERT INTO `adm_log_access` VALUES ('394', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-08 18:53:30');
INSERT INTO `adm_log_access` VALUES ('395', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 08:24:24');
INSERT INTO `adm_log_access` VALUES ('396', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 08:38:05');
INSERT INTO `adm_log_access` VALUES ('397', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 08:43:18');
INSERT INTO `adm_log_access` VALUES ('398', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 08:45:07');
INSERT INTO `adm_log_access` VALUES ('399', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 08:54:19');
INSERT INTO `adm_log_access` VALUES ('400', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 09:04:15');
INSERT INTO `adm_log_access` VALUES ('401', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 09:07:10');
INSERT INTO `adm_log_access` VALUES ('402', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-07-09 09:42:54');
INSERT INTO `adm_log_access` VALUES ('403', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 09:49:19');
INSERT INTO `adm_log_access` VALUES ('404', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 10:15:38');
INSERT INTO `adm_log_access` VALUES ('405', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 11:13:15');
INSERT INTO `adm_log_access` VALUES ('406', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-07-09 12:25:47');
INSERT INTO `adm_log_access` VALUES ('407', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-09 16:57:22');
INSERT INTO `adm_log_access` VALUES ('408', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-07-09 17:28:08');
INSERT INTO `adm_log_access` VALUES ('409', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2019-07-10 10:45:53');
INSERT INTO `adm_log_access` VALUES ('410', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-10 10:52:08');
INSERT INTO `adm_log_access` VALUES ('411', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-10 10:54:41');
INSERT INTO `adm_log_access` VALUES ('412', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-10 11:01:01');
INSERT INTO `adm_log_access` VALUES ('413', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-10 11:05:57');
INSERT INTO `adm_log_access` VALUES ('414', '1', 'Hệ thống', '127.0.0.1', 'Đăng xuất sessionTimeout', '2019-07-10 11:18:19');
INSERT INTO `adm_log_access` VALUES ('415', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-10 11:45:40');
INSERT INTO `adm_log_access` VALUES ('416', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-10 11:49:01');
INSERT INTO `adm_log_access` VALUES ('417', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-10 13:39:54');
INSERT INTO `adm_log_access` VALUES ('418', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-10 14:45:14');
INSERT INTO `adm_log_access` VALUES ('419', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:9085', '2019-07-11 10:14:15');
INSERT INTO `adm_log_access` VALUES ('420', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:2', '2019-07-11 10:26:45');
INSERT INTO `adm_log_access` VALUES ('423', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:3', '2019-07-11 13:52:57');
INSERT INTO `adm_log_access` VALUES ('424', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-11 15:01:53');
INSERT INTO `adm_log_access` VALUES ('425', '1', 'Tổ chức công chứng', '0:0:0:0:0:0:0:1', 'Thêm TCCC. Id:5', '2019-07-11 15:03:26');
INSERT INTO `adm_log_access` VALUES ('426', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-11 15:11:20');
INSERT INTO `adm_log_access` VALUES ('427', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-11 15:40:19');
INSERT INTO `adm_log_access` VALUES ('428', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Sửa Chuyên mục, Id:2', '2019-07-11 15:49:46');
INSERT INTO `adm_log_access` VALUES ('429', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:1', '2019-07-11 16:01:34');
INSERT INTO `adm_log_access` VALUES ('430', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-11 16:27:13');
INSERT INTO `adm_log_access` VALUES ('431', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-11 16:32:53');
INSERT INTO `adm_log_access` VALUES ('432', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-11 16:40:48');
INSERT INTO `adm_log_access` VALUES ('433', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-11 18:04:44');
INSERT INTO `adm_log_access` VALUES ('434', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-12 13:38:40');
INSERT INTO `adm_log_access` VALUES ('435', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-12 13:39:11');
INSERT INTO `adm_log_access` VALUES ('436', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-12 14:31:20');
INSERT INTO `adm_log_access` VALUES ('437', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:2', '2019-07-12 14:34:49');
INSERT INTO `adm_log_access` VALUES ('438', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-12 14:44:46');
INSERT INTO `adm_log_access` VALUES ('439', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-12 15:57:32');
INSERT INTO `adm_log_access` VALUES ('440', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-13 14:29:15');
INSERT INTO `adm_log_access` VALUES ('441', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-13 15:34:50');
INSERT INTO `adm_log_access` VALUES ('442', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 08:07:38');
INSERT INTO `adm_log_access` VALUES ('443', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 08:28:30');
INSERT INTO `adm_log_access` VALUES ('444', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 08:34:28');
INSERT INTO `adm_log_access` VALUES ('445', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 08:42:11');
INSERT INTO `adm_log_access` VALUES ('446', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 08:45:28');
INSERT INTO `adm_log_access` VALUES ('447', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 08:50:56');
INSERT INTO `adm_log_access` VALUES ('448', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 09:01:05');
INSERT INTO `adm_log_access` VALUES ('449', '1', 'Hệ thống', '192.168.1.99', 'Đăng nhập', '2019-07-15 09:35:35');
INSERT INTO `adm_log_access` VALUES ('450', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 09:46:28');
INSERT INTO `adm_log_access` VALUES ('451', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 10:09:29');
INSERT INTO `adm_log_access` VALUES ('452', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 11:26:49');
INSERT INTO `adm_log_access` VALUES ('453', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-07-15 11:43:09');
INSERT INTO `adm_log_access` VALUES ('454', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 13:36:07');
INSERT INTO `adm_log_access` VALUES ('455', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:3', '2019-07-15 13:55:58');
INSERT INTO `adm_log_access` VALUES ('456', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Xóa bài viết, Id:3', '2019-07-15 13:56:33');
INSERT INTO `adm_log_access` VALUES ('457', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 14:08:48');
INSERT INTO `adm_log_access` VALUES ('458', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 14:22:25');
INSERT INTO `adm_log_access` VALUES ('459', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-15 15:11:04');
INSERT INTO `adm_log_access` VALUES ('460', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-15 15:24:30');
INSERT INTO `adm_log_access` VALUES ('461', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-15 15:32:30');
INSERT INTO `adm_log_access` VALUES ('462', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 16:17:58');
INSERT INTO `adm_log_access` VALUES ('463', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 16:25:59');
INSERT INTO `adm_log_access` VALUES ('464', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-15 16:38:45');
INSERT INTO `adm_log_access` VALUES ('465', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 17:54:31');
INSERT INTO `adm_log_access` VALUES ('466', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 18:40:31');
INSERT INTO `adm_log_access` VALUES ('467', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 18:43:17');
INSERT INTO `adm_log_access` VALUES ('468', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-15 18:46:51');
INSERT INTO `adm_log_access` VALUES ('469', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 01:58:12');
INSERT INTO `adm_log_access` VALUES ('470', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 02:33:47');
INSERT INTO `adm_log_access` VALUES ('471', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 08:22:15');
INSERT INTO `adm_log_access` VALUES ('472', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 08:32:50');
INSERT INTO `adm_log_access` VALUES ('473', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 09:56:50');
INSERT INTO `adm_log_access` VALUES ('474', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 10:07:42');
INSERT INTO `adm_log_access` VALUES ('475', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 10:12:52');
INSERT INTO `adm_log_access` VALUES ('476', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 10:15:19');
INSERT INTO `adm_log_access` VALUES ('477', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 11:12:49');
INSERT INTO `adm_log_access` VALUES ('478', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 13:35:35');
INSERT INTO `adm_log_access` VALUES ('479', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 14:17:37');
INSERT INTO `adm_log_access` VALUES ('480', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Xóa bài viết, Id:2', '2019-07-16 14:20:24');
INSERT INTO `adm_log_access` VALUES ('481', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Xóa bài viết, Id:2', '2019-07-16 14:21:11');
INSERT INTO `adm_log_access` VALUES ('482', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 14:26:18');
INSERT INTO `adm_log_access` VALUES ('483', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-16 14:26:49');
INSERT INTO `adm_log_access` VALUES ('484', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-16 14:27:16');
INSERT INTO `adm_log_access` VALUES ('485', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 14:46:31');
INSERT INTO `adm_log_access` VALUES ('486', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 14:50:51');
INSERT INTO `adm_log_access` VALUES ('487', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 15:09:06');
INSERT INTO `adm_log_access` VALUES ('488', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-16 15:26:10');
INSERT INTO `adm_log_access` VALUES ('489', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-16 15:27:25');
INSERT INTO `adm_log_access` VALUES ('490', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-16 15:28:20');
INSERT INTO `adm_log_access` VALUES ('491', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 15:30:19');
INSERT INTO `adm_log_access` VALUES ('492', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-16 15:30:32');
INSERT INTO `adm_log_access` VALUES ('493', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 15:39:32');
INSERT INTO `adm_log_access` VALUES ('494', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-16 15:46:47');
INSERT INTO `adm_log_access` VALUES ('495', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-17 08:36:03');
INSERT INTO `adm_log_access` VALUES ('496', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-17 13:40:55');
INSERT INTO `adm_log_access` VALUES ('497', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-17 15:17:57');
INSERT INTO `adm_log_access` VALUES ('498', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Sửa Chuyên mục, Id:3', '2019-07-17 15:19:13');
INSERT INTO `adm_log_access` VALUES ('499', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:4', '2019-07-17 15:19:29');
INSERT INTO `adm_log_access` VALUES ('500', '1', 'Chuyên mục bài viết', '0:0:0:0:0:0:0:1', 'Thêm chuyên mục. Id:5', '2019-07-17 15:19:40');
INSERT INTO `adm_log_access` VALUES ('501', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 08:51:19');
INSERT INTO `adm_log_access` VALUES ('502', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 09:01:24');
INSERT INTO `adm_log_access` VALUES ('503', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 09:07:16');
INSERT INTO `adm_log_access` VALUES ('504', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 09:44:10');
INSERT INTO `adm_log_access` VALUES ('505', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 09:48:38');
INSERT INTO `adm_log_access` VALUES ('506', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 09:57:12');
INSERT INTO `adm_log_access` VALUES ('507', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 10:06:51');
INSERT INTO `adm_log_access` VALUES ('508', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 10:23:09');
INSERT INTO `adm_log_access` VALUES ('509', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 11:39:33');
INSERT INTO `adm_log_access` VALUES ('510', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 13:31:35');
INSERT INTO `adm_log_access` VALUES ('511', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 13:58:20');
INSERT INTO `adm_log_access` VALUES ('512', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 14:08:25');
INSERT INTO `adm_log_access` VALUES ('513', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 14:34:12');
INSERT INTO `adm_log_access` VALUES ('514', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 14:49:16');
INSERT INTO `adm_log_access` VALUES ('515', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 14:57:42');
INSERT INTO `adm_log_access` VALUES ('516', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-18 15:11:52');
INSERT INTO `adm_log_access` VALUES ('517', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-18 15:13:43');
INSERT INTO `adm_log_access` VALUES ('518', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-19 08:24:02');
INSERT INTO `adm_log_access` VALUES ('519', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-19 16:21:09');
INSERT INTO `adm_log_access` VALUES ('520', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-19 16:21:35');
INSERT INTO `adm_log_access` VALUES ('521', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-19 18:10:20');
INSERT INTO `adm_log_access` VALUES ('522', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-19 18:11:04');
INSERT INTO `adm_log_access` VALUES ('523', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-19 18:11:13');
INSERT INTO `adm_log_access` VALUES ('524', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-19 18:11:38');
INSERT INTO `adm_log_access` VALUES ('525', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-19 18:13:48');
INSERT INTO `adm_log_access` VALUES ('526', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-19 18:21:28');
INSERT INTO `adm_log_access` VALUES ('527', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-19 18:23:25');
INSERT INTO `adm_log_access` VALUES ('528', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-19 18:37:36');
INSERT INTO `adm_log_access` VALUES ('529', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-22 01:54:11');
INSERT INTO `adm_log_access` VALUES ('530', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-22 08:42:55');
INSERT INTO `adm_log_access` VALUES ('531', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-22 09:41:55');
INSERT INTO `adm_log_access` VALUES ('532', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-22 10:33:57');
INSERT INTO `adm_log_access` VALUES ('533', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:4', '2019-07-22 10:45:35');
INSERT INTO `adm_log_access` VALUES ('534', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:5', '2019-07-22 10:46:07');
INSERT INTO `adm_log_access` VALUES ('535', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:2', '2019-07-22 10:59:09');
INSERT INTO `adm_log_access` VALUES ('536', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:4', '2019-07-22 11:02:38');
INSERT INTO `adm_log_access` VALUES ('537', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-22 11:15:13');
INSERT INTO `adm_log_access` VALUES ('538', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:1', '2019-07-22 11:15:49');
INSERT INTO `adm_log_access` VALUES ('539', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:5', '2019-07-22 11:17:43');
INSERT INTO `adm_log_access` VALUES ('540', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:4', '2019-07-22 11:21:09');
INSERT INTO `adm_log_access` VALUES ('541', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-22 14:08:40');
INSERT INTO `adm_log_access` VALUES ('542', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:6', '2019-07-22 14:09:30');
INSERT INTO `adm_log_access` VALUES ('543', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:7', '2019-07-22 14:09:51');
INSERT INTO `adm_log_access` VALUES ('544', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-23 14:52:47');
INSERT INTO `adm_log_access` VALUES ('545', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-23 15:57:27');
INSERT INTO `adm_log_access` VALUES ('546', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-24 10:57:27');
INSERT INTO `adm_log_access` VALUES ('547', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-24 11:01:29');
INSERT INTO `adm_log_access` VALUES ('548', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:8', '2019-07-24 11:26:00');
INSERT INTO `adm_log_access` VALUES ('549', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:8', '2019-07-24 11:35:39');
INSERT INTO `adm_log_access` VALUES ('550', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-24 16:09:35');
INSERT INTO `adm_log_access` VALUES ('551', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:8', '2019-07-24 16:18:36');
INSERT INTO `adm_log_access` VALUES ('552', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:8', '2019-07-24 16:22:13');
INSERT INTO `adm_log_access` VALUES ('553', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:8', '2019-07-24 16:23:11');
INSERT INTO `adm_log_access` VALUES ('554', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-25 13:46:00');
INSERT INTO `adm_log_access` VALUES ('555', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-25 17:13:49');
INSERT INTO `adm_log_access` VALUES ('556', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:9', '2019-07-25 17:14:24');
INSERT INTO `adm_log_access` VALUES ('557', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-25 17:25:42');
INSERT INTO `adm_log_access` VALUES ('558', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-26 19:11:25');
INSERT INTO `adm_log_access` VALUES ('559', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:10', '2019-07-26 19:16:20');
INSERT INTO `adm_log_access` VALUES ('560', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-29 12:43:16');
INSERT INTO `adm_log_access` VALUES ('561', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:85', '2019-07-29 12:43:50');
INSERT INTO `adm_log_access` VALUES ('562', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-29 15:09:15');
INSERT INTO `adm_log_access` VALUES ('563', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-29 17:56:56');
INSERT INTO `adm_log_access` VALUES ('564', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-29 18:29:51');
INSERT INTO `adm_log_access` VALUES ('565', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-29 22:15:11');
INSERT INTO `adm_log_access` VALUES ('566', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:86', '2019-07-29 22:23:15');
INSERT INTO `adm_log_access` VALUES ('567', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-29 22:45:16');
INSERT INTO `adm_log_access` VALUES ('568', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:86', '2019-07-29 22:47:42');
INSERT INTO `adm_log_access` VALUES ('569', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-30 00:41:32');
INSERT INTO `adm_log_access` VALUES ('570', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-30 01:05:00');
INSERT INTO `adm_log_access` VALUES ('571', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-30 01:17:58');
INSERT INTO `adm_log_access` VALUES ('572', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:86', '2019-07-30 01:20:04');
INSERT INTO `adm_log_access` VALUES ('573', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:86', '2019-07-30 01:20:58');
INSERT INTO `adm_log_access` VALUES ('574', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:86', '2019-07-30 01:24:40');
INSERT INTO `adm_log_access` VALUES ('575', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-30 08:22:33');
INSERT INTO `adm_log_access` VALUES ('576', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-30 11:39:05');
INSERT INTO `adm_log_access` VALUES ('577', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-30 14:34:12');
INSERT INTO `adm_log_access` VALUES ('578', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-30 16:59:39');
INSERT INTO `adm_log_access` VALUES ('579', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 00:38:47');
INSERT INTO `adm_log_access` VALUES ('580', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 00:50:53');
INSERT INTO `adm_log_access` VALUES ('581', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 01:41:27');
INSERT INTO `adm_log_access` VALUES ('582', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 02:14:04');
INSERT INTO `adm_log_access` VALUES ('583', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 08:55:12');
INSERT INTO `adm_log_access` VALUES ('584', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 10:53:03');
INSERT INTO `adm_log_access` VALUES ('585', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 13:51:36');
INSERT INTO `adm_log_access` VALUES ('586', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 14:02:45');
INSERT INTO `adm_log_access` VALUES ('587', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 14:07:58');
INSERT INTO `adm_log_access` VALUES ('588', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 14:12:22');
INSERT INTO `adm_log_access` VALUES ('589', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 14:23:13');
INSERT INTO `adm_log_access` VALUES ('590', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 15:31:50');
INSERT INTO `adm_log_access` VALUES ('591', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 15:35:28');
INSERT INTO `adm_log_access` VALUES ('592', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 15:39:39');
INSERT INTO `adm_log_access` VALUES ('593', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-07-31 15:46:42');
INSERT INTO `adm_log_access` VALUES ('594', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-01 09:05:27');
INSERT INTO `adm_log_access` VALUES ('595', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-01 10:09:16');
INSERT INTO `adm_log_access` VALUES ('596', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-01 10:18:07');
INSERT INTO `adm_log_access` VALUES ('597', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-01 10:26:42');
INSERT INTO `adm_log_access` VALUES ('598', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-06 17:52:27');
INSERT INTO `adm_log_access` VALUES ('599', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 00:39:10');
INSERT INTO `adm_log_access` VALUES ('600', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 08:08:05');
INSERT INTO `adm_log_access` VALUES ('601', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 08:32:50');
INSERT INTO `adm_log_access` VALUES ('602', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 08:34:44');
INSERT INTO `adm_log_access` VALUES ('603', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 08:42:30');
INSERT INTO `adm_log_access` VALUES ('604', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 08:45:44');
INSERT INTO `adm_log_access` VALUES ('605', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 08:48:38');
INSERT INTO `adm_log_access` VALUES ('606', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 08:53:19');
INSERT INTO `adm_log_access` VALUES ('607', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 08:55:00');
INSERT INTO `adm_log_access` VALUES ('608', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 09:02:15');
INSERT INTO `adm_log_access` VALUES ('609', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 09:33:52');
INSERT INTO `adm_log_access` VALUES ('610', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 10:16:04');
INSERT INTO `adm_log_access` VALUES ('611', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 14:42:05');
INSERT INTO `adm_log_access` VALUES ('612', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:87', '2019-08-07 14:43:35');
INSERT INTO `adm_log_access` VALUES ('613', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 15:34:39');
INSERT INTO `adm_log_access` VALUES ('614', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 15:40:56');
INSERT INTO `adm_log_access` VALUES ('615', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 17:08:12');
INSERT INTO `adm_log_access` VALUES ('616', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 17:16:18');
INSERT INTO `adm_log_access` VALUES ('617', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 17:18:01');
INSERT INTO `adm_log_access` VALUES ('618', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 17:30:49');
INSERT INTO `adm_log_access` VALUES ('619', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 17:35:26');
INSERT INTO `adm_log_access` VALUES ('620', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 17:37:39');
INSERT INTO `adm_log_access` VALUES ('621', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 17:38:57');
INSERT INTO `adm_log_access` VALUES ('622', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 17:52:08');
INSERT INTO `adm_log_access` VALUES ('623', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 18:10:34');
INSERT INTO `adm_log_access` VALUES ('624', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 18:11:12');
INSERT INTO `adm_log_access` VALUES ('625', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 18:12:45');
INSERT INTO `adm_log_access` VALUES ('626', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 18:14:10');
INSERT INTO `adm_log_access` VALUES ('627', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 18:16:36');
INSERT INTO `adm_log_access` VALUES ('628', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 18:18:41');
INSERT INTO `adm_log_access` VALUES ('629', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 18:19:37');
INSERT INTO `adm_log_access` VALUES ('630', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-07 18:30:39');
INSERT INTO `adm_log_access` VALUES ('631', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 22:35:33');
INSERT INTO `adm_log_access` VALUES ('632', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-07 23:33:57');
INSERT INTO `adm_log_access` VALUES ('633', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 00:27:35');
INSERT INTO `adm_log_access` VALUES ('634', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 00:29:35');
INSERT INTO `adm_log_access` VALUES ('635', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 00:29:48');
INSERT INTO `adm_log_access` VALUES ('636', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 00:31:22');
INSERT INTO `adm_log_access` VALUES ('637', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 00:31:38');
INSERT INTO `adm_log_access` VALUES ('638', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 00:31:57');
INSERT INTO `adm_log_access` VALUES ('639', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 00:44:05');
INSERT INTO `adm_log_access` VALUES ('640', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 00:50:51');
INSERT INTO `adm_log_access` VALUES ('641', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:08:57');
INSERT INTO `adm_log_access` VALUES ('642', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:09:20');
INSERT INTO `adm_log_access` VALUES ('643', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:24:24');
INSERT INTO `adm_log_access` VALUES ('644', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:24:36');
INSERT INTO `adm_log_access` VALUES ('645', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:25:09');
INSERT INTO `adm_log_access` VALUES ('646', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:25:25');
INSERT INTO `adm_log_access` VALUES ('647', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 01:30:53');
INSERT INTO `adm_log_access` VALUES ('648', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:31:36');
INSERT INTO `adm_log_access` VALUES ('649', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:49:16');
INSERT INTO `adm_log_access` VALUES ('650', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:57:42');
INSERT INTO `adm_log_access` VALUES ('651', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:57:53');
INSERT INTO `adm_log_access` VALUES ('652', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 01:58:12');
INSERT INTO `adm_log_access` VALUES ('653', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:87', '2019-08-08 02:06:24');
INSERT INTO `adm_log_access` VALUES ('654', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Xóa bài viết, Id:87', '2019-08-08 02:07:02');
INSERT INTO `adm_log_access` VALUES ('655', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 08:36:34');
INSERT INTO `adm_log_access` VALUES ('656', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 09:05:29');
INSERT INTO `adm_log_access` VALUES ('657', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 10:21:12');
INSERT INTO `adm_log_access` VALUES ('658', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:88', '2019-08-08 10:21:56');
INSERT INTO `adm_log_access` VALUES ('659', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:89', '2019-08-08 10:32:22');
INSERT INTO `adm_log_access` VALUES ('660', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 13:40:26');
INSERT INTO `adm_log_access` VALUES ('661', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:90', '2019-08-08 13:43:42');
INSERT INTO `adm_log_access` VALUES ('662', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:91', '2019-08-08 14:06:54');
INSERT INTO `adm_log_access` VALUES ('663', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:92', '2019-08-08 14:15:46');
INSERT INTO `adm_log_access` VALUES ('664', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:93', '2019-08-08 14:18:21');
INSERT INTO `adm_log_access` VALUES ('665', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:94', '2019-08-08 14:19:58');
INSERT INTO `adm_log_access` VALUES ('666', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:95', '2019-08-08 14:21:29');
INSERT INTO `adm_log_access` VALUES ('667', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:96', '2019-08-08 15:22:41');
INSERT INTO `adm_log_access` VALUES ('668', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:97', '2019-08-08 15:26:08');
INSERT INTO `adm_log_access` VALUES ('669', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:98', '2019-08-08 15:27:39');
INSERT INTO `adm_log_access` VALUES ('670', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:99', '2019-08-08 15:29:37');
INSERT INTO `adm_log_access` VALUES ('671', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:100', '2019-08-08 15:35:15');
INSERT INTO `adm_log_access` VALUES ('672', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 15:37:10');
INSERT INTO `adm_log_access` VALUES ('673', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:101', '2019-08-08 15:37:39');
INSERT INTO `adm_log_access` VALUES ('674', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 16:01:36');
INSERT INTO `adm_log_access` VALUES ('675', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:101', '2019-08-08 16:04:17');
INSERT INTO `adm_log_access` VALUES ('676', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:101', '2019-08-08 16:07:09');
INSERT INTO `adm_log_access` VALUES ('677', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:101', '2019-08-08 16:08:18');
INSERT INTO `adm_log_access` VALUES ('678', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-08 16:46:20');
INSERT INTO `adm_log_access` VALUES ('679', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:101', '2019-08-08 16:46:49');
INSERT INTO `adm_log_access` VALUES ('680', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:101', '2019-08-08 16:48:04');
INSERT INTO `adm_log_access` VALUES ('681', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:101', '2019-08-08 16:48:19');
INSERT INTO `adm_log_access` VALUES ('682', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:102', '2019-08-08 17:15:05');
INSERT INTO `adm_log_access` VALUES ('683', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-09 08:30:27');
INSERT INTO `adm_log_access` VALUES ('684', '1', 'Tổ chức công chứng', '0:0:0:0:0:0:0:1', 'Thêm TCCC. Id:77', '2019-08-09 10:10:11');
INSERT INTO `adm_log_access` VALUES ('685', '1', 'Tổ chức công chứng', '0:0:0:0:0:0:0:1', 'Thêm TCCC. Id:82', '2019-08-09 10:45:22');
INSERT INTO `adm_log_access` VALUES ('686', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-09 13:45:08');
INSERT INTO `adm_log_access` VALUES ('687', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-09 16:58:27');
INSERT INTO `adm_log_access` VALUES ('688', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-09 17:43:03');
INSERT INTO `adm_log_access` VALUES ('689', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-09 18:47:34');
INSERT INTO `adm_log_access` VALUES ('690', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-09 18:49:45');
INSERT INTO `adm_log_access` VALUES ('691', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-09 19:57:28');
INSERT INTO `adm_log_access` VALUES ('692', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-09 19:59:19');
INSERT INTO `adm_log_access` VALUES ('693', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-10 01:37:01');
INSERT INTO `adm_log_access` VALUES ('694', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:103', '2019-08-10 03:05:21');
INSERT INTO `adm_log_access` VALUES ('695', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-10 18:04:00');
INSERT INTO `adm_log_access` VALUES ('696', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-10 18:12:08');
INSERT INTO `adm_log_access` VALUES ('697', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:104', '2019-08-10 18:12:35');
INSERT INTO `adm_log_access` VALUES ('698', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:105', '2019-08-10 18:15:52');
INSERT INTO `adm_log_access` VALUES ('699', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-10 20:29:29');
INSERT INTO `adm_log_access` VALUES ('700', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-10 22:05:29');
INSERT INTO `adm_log_access` VALUES ('701', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:105', '2019-08-10 22:10:36');
INSERT INTO `adm_log_access` VALUES ('702', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-10 22:33:56');
INSERT INTO `adm_log_access` VALUES ('703', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-10 23:17:13');
INSERT INTO `adm_log_access` VALUES ('704', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-11 07:26:31');
INSERT INTO `adm_log_access` VALUES ('705', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-13 22:42:36');
INSERT INTO `adm_log_access` VALUES ('706', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-13 22:46:31');
INSERT INTO `adm_log_access` VALUES ('707', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 00:16:54');
INSERT INTO `adm_log_access` VALUES ('708', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:1', '2019-08-14 00:31:30');
INSERT INTO `adm_log_access` VALUES ('709', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:1', '2019-08-14 00:31:38');
INSERT INTO `adm_log_access` VALUES ('710', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 01:00:13');
INSERT INTO `adm_log_access` VALUES ('711', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 01:32:29');
INSERT INTO `adm_log_access` VALUES ('712', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 08:28:21');
INSERT INTO `adm_log_access` VALUES ('713', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 08:46:17');
INSERT INTO `adm_log_access` VALUES ('714', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:701', '2019-08-14 08:47:44');
INSERT INTO `adm_log_access` VALUES ('715', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:701', '2019-08-14 08:47:59');
INSERT INTO `adm_log_access` VALUES ('716', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 08:51:51');
INSERT INTO `adm_log_access` VALUES ('717', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 09:01:22');
INSERT INTO `adm_log_access` VALUES ('718', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 09:03:53');
INSERT INTO `adm_log_access` VALUES ('719', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 09:04:06');
INSERT INTO `adm_log_access` VALUES ('720', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 09:06:21');
INSERT INTO `adm_log_access` VALUES ('721', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 09:06:57');
INSERT INTO `adm_log_access` VALUES ('722', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 09:07:06');
INSERT INTO `adm_log_access` VALUES ('723', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 09:08:26');
INSERT INTO `adm_log_access` VALUES ('724', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 09:36:25');
INSERT INTO `adm_log_access` VALUES ('725', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 09:36:36');
INSERT INTO `adm_log_access` VALUES ('726', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 10:23:02');
INSERT INTO `adm_log_access` VALUES ('727', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 10:33:18');
INSERT INTO `adm_log_access` VALUES ('728', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 10:36:56');
INSERT INTO `adm_log_access` VALUES ('729', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 10:37:00');
INSERT INTO `adm_log_access` VALUES ('730', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 11:19:48');
INSERT INTO `adm_log_access` VALUES ('731', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 11:27:55');
INSERT INTO `adm_log_access` VALUES ('732', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 11:28:46');
INSERT INTO `adm_log_access` VALUES ('733', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 11:28:50');
INSERT INTO `adm_log_access` VALUES ('734', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 11:29:10');
INSERT INTO `adm_log_access` VALUES ('735', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 11:31:07');
INSERT INTO `adm_log_access` VALUES ('736', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 11:31:29');
INSERT INTO `adm_log_access` VALUES ('737', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 11:31:38');
INSERT INTO `adm_log_access` VALUES ('738', '499', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 11:31:45');
INSERT INTO `adm_log_access` VALUES ('739', '499', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 11:32:37');
INSERT INTO `adm_log_access` VALUES ('740', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 11:48:59');
INSERT INTO `adm_log_access` VALUES ('741', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 11:49:08');
INSERT INTO `adm_log_access` VALUES ('742', '499', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 12:36:25');
INSERT INTO `adm_log_access` VALUES ('743', '499', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 12:37:42');
INSERT INTO `adm_log_access` VALUES ('744', '499', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 12:38:01');
INSERT INTO `adm_log_access` VALUES ('745', '499', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 12:42:24');
INSERT INTO `adm_log_access` VALUES ('746', '499', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 12:47:46');
INSERT INTO `adm_log_access` VALUES ('747', '499', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 12:47:50');
INSERT INTO `adm_log_access` VALUES ('748', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 12:52:45');
INSERT INTO `adm_log_access` VALUES ('749', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 12:52:57');
INSERT INTO `adm_log_access` VALUES ('750', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 14:25:37');
INSERT INTO `adm_log_access` VALUES ('751', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 14:40:59');
INSERT INTO `adm_log_access` VALUES ('752', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:499', '2019-08-14 14:46:02');
INSERT INTO `adm_log_access` VALUES ('753', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-14 16:22:19');
INSERT INTO `adm_log_access` VALUES ('754', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-14 16:35:17');
INSERT INTO `adm_log_access` VALUES ('755', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-15 09:20:27');
INSERT INTO `adm_log_access` VALUES ('756', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-16 11:07:04');
INSERT INTO `adm_log_access` VALUES ('757', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-16 13:46:28');
INSERT INTO `adm_log_access` VALUES ('758', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-16 16:33:42');
INSERT INTO `adm_log_access` VALUES ('759', '1', 'Tổ chức công chứng', '0:0:0:0:0:0:0:1', 'Thêm TCCC. Id:84', '2019-08-16 16:53:17');
INSERT INTO `adm_log_access` VALUES ('760', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-16 19:34:28');
INSERT INTO `adm_log_access` VALUES ('761', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-17 15:38:41');
INSERT INTO `adm_log_access` VALUES ('762', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-18 22:05:00');
INSERT INTO `adm_log_access` VALUES ('763', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-20 00:23:06');
INSERT INTO `adm_log_access` VALUES ('764', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-20 00:58:18');
INSERT INTO `adm_log_access` VALUES ('765', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-20 16:31:32');
INSERT INTO `adm_log_access` VALUES ('766', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-21 00:18:49');
INSERT INTO `adm_log_access` VALUES ('767', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-21 10:57:01');
INSERT INTO `adm_log_access` VALUES ('768', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-21 15:28:16');
INSERT INTO `adm_log_access` VALUES ('769', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-21 15:33:01');
INSERT INTO `adm_log_access` VALUES ('770', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-21 15:35:10');
INSERT INTO `adm_log_access` VALUES ('771', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-21 15:38:33');
INSERT INTO `adm_log_access` VALUES ('772', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-21 16:25:09');
INSERT INTO `adm_log_access` VALUES ('773', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-22 08:56:54');
INSERT INTO `adm_log_access` VALUES ('774', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-23 11:25:17');
INSERT INTO `adm_log_access` VALUES ('775', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-23 11:41:53');
INSERT INTO `adm_log_access` VALUES ('776', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-23 14:12:13');
INSERT INTO `adm_log_access` VALUES ('777', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-23 14:50:35');
INSERT INTO `adm_log_access` VALUES ('778', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-23 18:35:25');
INSERT INTO `adm_log_access` VALUES ('779', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-23 19:54:46');
INSERT INTO `adm_log_access` VALUES ('780', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-24 22:52:47');
INSERT INTO `adm_log_access` VALUES ('781', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-24 23:36:01');
INSERT INTO `adm_log_access` VALUES ('782', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-25 10:12:58');
INSERT INTO `adm_log_access` VALUES ('783', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-25 23:31:41');
INSERT INTO `adm_log_access` VALUES ('784', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-08-26 00:22:13');
INSERT INTO `adm_log_access` VALUES ('785', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-26 00:22:15');
INSERT INTO `adm_log_access` VALUES ('786', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:105', '2019-08-26 00:27:40');
INSERT INTO `adm_log_access` VALUES ('787', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:105', '2019-08-26 00:27:49');
INSERT INTO `adm_log_access` VALUES ('788', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-26 08:17:11');
INSERT INTO `adm_log_access` VALUES ('789', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-26 14:42:36');
INSERT INTO `adm_log_access` VALUES ('790', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-26 15:10:08');
INSERT INTO `adm_log_access` VALUES ('791', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-27 10:22:46');
INSERT INTO `adm_log_access` VALUES ('792', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-27 14:38:28');
INSERT INTO `adm_log_access` VALUES ('793', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-27 16:40:36');
INSERT INTO `adm_log_access` VALUES ('794', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-27 16:47:09');
INSERT INTO `adm_log_access` VALUES ('795', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-27 16:57:55');
INSERT INTO `adm_log_access` VALUES ('796', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-27 17:15:48');
INSERT INTO `adm_log_access` VALUES ('797', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-27 23:19:19');
INSERT INTO `adm_log_access` VALUES ('798', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-28 00:18:40');
INSERT INTO `adm_log_access` VALUES ('799', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-28 08:05:30');
INSERT INTO `adm_log_access` VALUES ('800', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-28 08:52:49');
INSERT INTO `adm_log_access` VALUES ('801', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:05:51');
INSERT INTO `adm_log_access` VALUES ('802', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:06:05');
INSERT INTO `adm_log_access` VALUES ('803', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:06:25');
INSERT INTO `adm_log_access` VALUES ('804', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:06:40');
INSERT INTO `adm_log_access` VALUES ('805', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:07:04');
INSERT INTO `adm_log_access` VALUES ('806', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:08:04');
INSERT INTO `adm_log_access` VALUES ('807', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:08:16');
INSERT INTO `adm_log_access` VALUES ('808', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:08:29');
INSERT INTO `adm_log_access` VALUES ('809', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:08:43');
INSERT INTO `adm_log_access` VALUES ('810', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:08:59');
INSERT INTO `adm_log_access` VALUES ('811', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:09:13');
INSERT INTO `adm_log_access` VALUES ('812', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:09:26');
INSERT INTO `adm_log_access` VALUES ('813', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:09:42');
INSERT INTO `adm_log_access` VALUES ('816', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:10:18');
INSERT INTO `adm_log_access` VALUES ('819', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:10:55');
INSERT INTO `adm_log_access` VALUES ('822', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:12:06');
INSERT INTO `adm_log_access` VALUES ('823', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:12:19');
INSERT INTO `adm_log_access` VALUES ('824', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:12:32');
INSERT INTO `adm_log_access` VALUES ('825', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:12:46');
INSERT INTO `adm_log_access` VALUES ('826', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2019-08-28 09:13:00');
INSERT INTO `adm_log_access` VALUES ('827', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-28 09:48:46');
INSERT INTO `adm_log_access` VALUES ('828', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-29 08:18:44');
INSERT INTO `adm_log_access` VALUES ('829', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:106', '2019-08-29 08:38:29');
INSERT INTO `adm_log_access` VALUES ('830', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:111', '2019-08-29 08:45:04');
INSERT INTO `adm_log_access` VALUES ('831', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:113', '2019-08-29 09:10:12');
INSERT INTO `adm_log_access` VALUES ('832', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:113', '2019-08-29 09:10:58');
INSERT INTO `adm_log_access` VALUES ('833', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:113', '2019-08-29 09:12:02');
INSERT INTO `adm_log_access` VALUES ('834', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:113', '2019-08-29 09:13:48');
INSERT INTO `adm_log_access` VALUES ('835', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:113', '2019-08-29 09:14:05');
INSERT INTO `adm_log_access` VALUES ('836', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:37:26');
INSERT INTO `adm_log_access` VALUES ('837', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:38:11');
INSERT INTO `adm_log_access` VALUES ('838', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:39:28');
INSERT INTO `adm_log_access` VALUES ('839', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:41:58');
INSERT INTO `adm_log_access` VALUES ('840', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:42:29');
INSERT INTO `adm_log_access` VALUES ('841', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:43:05');
INSERT INTO `adm_log_access` VALUES ('842', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:43:23');
INSERT INTO `adm_log_access` VALUES ('843', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:44:09');
INSERT INTO `adm_log_access` VALUES ('844', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:44:16');
INSERT INTO `adm_log_access` VALUES ('845', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:45:19');
INSERT INTO `adm_log_access` VALUES ('846', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 09:45:45');
INSERT INTO `adm_log_access` VALUES ('847', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 10:11:21');
INSERT INTO `adm_log_access` VALUES ('848', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:106', '2019-08-29 10:13:07');
INSERT INTO `adm_log_access` VALUES ('849', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-08-29 10:29:25');
INSERT INTO `adm_log_access` VALUES ('850', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:8', '2019-08-29 10:29:56');
INSERT INTO `adm_log_access` VALUES ('851', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-11 09:23:28');
INSERT INTO `adm_log_access` VALUES ('852', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-11 17:08:07');
INSERT INTO `adm_log_access` VALUES ('853', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-11 18:06:19');
INSERT INTO `adm_log_access` VALUES ('854', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-11 23:21:46');
INSERT INTO `adm_log_access` VALUES ('855', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-12 08:03:21');
INSERT INTO `adm_log_access` VALUES ('856', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-12 09:05:07');
INSERT INTO `adm_log_access` VALUES ('857', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:113', '2019-09-12 09:14:35');
INSERT INTO `adm_log_access` VALUES ('858', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:113', '2019-09-12 09:14:45');
INSERT INTO `adm_log_access` VALUES ('859', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:113', '2019-09-12 09:29:28');
INSERT INTO `adm_log_access` VALUES ('860', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-17 23:19:13');
INSERT INTO `adm_log_access` VALUES ('861', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-17 23:28:26');
INSERT INTO `adm_log_access` VALUES ('862', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-17 23:36:43');
INSERT INTO `adm_log_access` VALUES ('863', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-20 15:15:48');
INSERT INTO `adm_log_access` VALUES ('864', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-26 18:12:43');
INSERT INTO `adm_log_access` VALUES ('865', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 11:36:14');
INSERT INTO `adm_log_access` VALUES ('866', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 11:40:07');
INSERT INTO `adm_log_access` VALUES ('867', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2019-09-27 11:46:12');
INSERT INTO `adm_log_access` VALUES ('868', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 11:46:19');
INSERT INTO `adm_log_access` VALUES ('869', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 13:42:26');
INSERT INTO `adm_log_access` VALUES ('870', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 14:01:42');
INSERT INTO `adm_log_access` VALUES ('871', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 14:08:55');
INSERT INTO `adm_log_access` VALUES ('872', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 14:42:00');
INSERT INTO `adm_log_access` VALUES ('873', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-27 14:53:41');
INSERT INTO `adm_log_access` VALUES ('874', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-27 14:54:44');
INSERT INTO `adm_log_access` VALUES ('875', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 14:57:25');
INSERT INTO `adm_log_access` VALUES ('876', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-27 14:57:55');
INSERT INTO `adm_log_access` VALUES ('877', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-27 15:03:21');
INSERT INTO `adm_log_access` VALUES ('878', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-27 15:03:29');
INSERT INTO `adm_log_access` VALUES ('879', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 13:42:34');
INSERT INTO `adm_log_access` VALUES ('880', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 14:26:41');
INSERT INTO `adm_log_access` VALUES ('881', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 18:20:13');
INSERT INTO `adm_log_access` VALUES ('882', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-28 18:20:29');
INSERT INTO `adm_log_access` VALUES ('883', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-28 18:21:25');
INSERT INTO `adm_log_access` VALUES ('884', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-28 18:22:12');
INSERT INTO `adm_log_access` VALUES ('885', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-28 18:23:09');
INSERT INTO `adm_log_access` VALUES ('886', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 18:32:17');
INSERT INTO `adm_log_access` VALUES ('887', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 18:39:09');
INSERT INTO `adm_log_access` VALUES ('888', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 18:41:50');
INSERT INTO `adm_log_access` VALUES ('889', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 18:46:36');
INSERT INTO `adm_log_access` VALUES ('890', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-09-28 18:46:51');
INSERT INTO `adm_log_access` VALUES ('891', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Thêm đối tác tra cứu TTNC. Id:2', '2019-09-28 18:47:11');
INSERT INTO `adm_log_access` VALUES ('892', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Thêm đối tác tra cứu TTNC. Id:3', '2019-09-28 18:47:50');
INSERT INTO `adm_log_access` VALUES ('893', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Thêm đối tác tra cứu TTNC. Id:4', '2019-09-28 18:50:02');
INSERT INTO `adm_log_access` VALUES ('894', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 19:12:35');
INSERT INTO `adm_log_access` VALUES ('895', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Thêm đối tác tra cứu TTNC. Id:5', '2019-09-28 19:12:59');
INSERT INTO `adm_log_access` VALUES ('896', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Thêm đối tác tra cứu TTNC. Id:6', '2019-09-28 19:14:05');
INSERT INTO `adm_log_access` VALUES ('897', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-28 19:17:00');
INSERT INTO `adm_log_access` VALUES ('898', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Thêm đối tác tra cứu TTNC. Id:7', '2019-09-28 19:17:12');
INSERT INTO `adm_log_access` VALUES ('899', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Xóa đối tác tra cứu TTNC. Id:7', '2019-09-28 19:30:56');
INSERT INTO `adm_log_access` VALUES ('900', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Xóa đối tác tra cứu TTNC. Id:6', '2019-09-28 19:31:00');
INSERT INTO `adm_log_access` VALUES ('901', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-29 01:48:40');
INSERT INTO `adm_log_access` VALUES ('902', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-29 01:51:46');
INSERT INTO `adm_log_access` VALUES ('903', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-29 02:06:08');
INSERT INTO `adm_log_access` VALUES ('904', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-29 22:12:29');
INSERT INTO `adm_log_access` VALUES ('905', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-29 23:54:11');
INSERT INTO `adm_log_access` VALUES ('906', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-30 16:04:44');
INSERT INTO `adm_log_access` VALUES ('907', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-30 18:02:03');
INSERT INTO `adm_log_access` VALUES ('908', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-30 18:10:43');
INSERT INTO `adm_log_access` VALUES ('909', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-30 18:28:22');
INSERT INTO `adm_log_access` VALUES ('910', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-09-30 18:34:52');
INSERT INTO `adm_log_access` VALUES ('911', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-10-01 08:00:19');
INSERT INTO `adm_log_access` VALUES ('912', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-10-01 08:09:57');
INSERT INTO `adm_log_access` VALUES ('913', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:1', '2019-10-01 08:54:34');
INSERT INTO `adm_log_access` VALUES ('914', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-10-01 09:56:53');
INSERT INTO `adm_log_access` VALUES ('915', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-10-01 10:47:31');
INSERT INTO `adm_log_access` VALUES ('916', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-10-01 11:32:39');
INSERT INTO `adm_log_access` VALUES ('917', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-10-03 18:00:39');
INSERT INTO `adm_log_access` VALUES ('918', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:2', '2019-10-03 18:01:22');
INSERT INTO `adm_log_access` VALUES ('919', '1', 'Đối tác tra cứu TTNC', '0:0:0:0:0:0:0:1', 'Chỉnh sửa đối tác tra cứu TTNC. Id:1', '2019-10-03 18:09:59');
INSERT INTO `adm_log_access` VALUES ('920', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2019-10-05 17:10:05');
INSERT INTO `adm_log_access` VALUES ('921', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-04 17:29:17');
INSERT INTO `adm_log_access` VALUES ('922', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-04 17:51:52');
INSERT INTO `adm_log_access` VALUES ('923', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Thêm bài viết. Id:114', '2020-03-04 17:53:27');
INSERT INTO `adm_log_access` VALUES ('924', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-04 17:58:10');
INSERT INTO `adm_log_access` VALUES ('925', '1', 'Bài viết', '0:0:0:0:0:0:0:1', 'Sửa bài viết, Id:114', '2020-03-04 17:58:33');
INSERT INTO `adm_log_access` VALUES ('926', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-04 18:17:54');
INSERT INTO `adm_log_access` VALUES ('927', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-05 17:02:16');
INSERT INTO `adm_log_access` VALUES ('928', '1', 'Nhóm quyền', '0:0:0:0:0:0:0:1', 'Xóa nhóm quyền Id:399', '2020-03-05 17:02:47');
INSERT INTO `adm_log_access` VALUES ('929', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 00:45:45');
INSERT INTO `adm_log_access` VALUES ('930', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 01:34:13');
INSERT INTO `adm_log_access` VALUES ('931', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 03:41:07');
INSERT INTO `adm_log_access` VALUES ('932', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 03:57:44');
INSERT INTO `adm_log_access` VALUES ('933', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 04:04:04');
INSERT INTO `adm_log_access` VALUES ('934', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 04:11:39');
INSERT INTO `adm_log_access` VALUES ('935', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:16:36');
INSERT INTO `adm_log_access` VALUES ('936', '1', 'Nhóm quyền', '0:0:0:0:0:0:0:1', 'Xóa nhóm quyền Id:417', '2020-03-06 08:16:44');
INSERT INTO `adm_log_access` VALUES ('937', '1', 'Nhóm quyền', '0:0:0:0:0:0:0:1', 'Xóa nhóm quyền Id:299', '2020-03-06 08:16:47');
INSERT INTO `adm_log_access` VALUES ('938', '1', 'Nhóm quyền', '0:0:0:0:0:0:0:1', 'Xóa nhóm quyền Id:99', '2020-03-06 08:16:49');
INSERT INTO `adm_log_access` VALUES ('939', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:1', '2020-03-06 08:21:54');
INSERT INTO `adm_log_access` VALUES ('940', '1', 'User', '0:0:0:0:0:0:0:1', 'Sửa người dùng:1', '2020-03-06 08:22:12');
INSERT INTO `adm_log_access` VALUES ('941', '1', 'User', '0:0:0:0:0:0:0:1', 'Thêm người dùng', '2020-03-06 08:22:38');
INSERT INTO `adm_log_access` VALUES ('942', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-06 08:24:39');
INSERT INTO `adm_log_access` VALUES ('943', '729', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:24:45');
INSERT INTO `adm_log_access` VALUES ('944', '729', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-06 08:24:52');
INSERT INTO `adm_log_access` VALUES ('945', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:24:57');
INSERT INTO `adm_log_access` VALUES ('946', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:28:50');
INSERT INTO `adm_log_access` VALUES ('947', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-06 08:29:13');
INSERT INTO `adm_log_access` VALUES ('948', '729', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:29:17');
INSERT INTO `adm_log_access` VALUES ('949', '729', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-06 08:29:41');
INSERT INTO `adm_log_access` VALUES ('950', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:29:48');
INSERT INTO `adm_log_access` VALUES ('951', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-06 08:30:18');
INSERT INTO `adm_log_access` VALUES ('952', '729', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:30:27');
INSERT INTO `adm_log_access` VALUES ('953', '729', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-06 08:32:59');
INSERT INTO `adm_log_access` VALUES ('954', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:33:19');
INSERT INTO `adm_log_access` VALUES ('955', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:37:19');
INSERT INTO `adm_log_access` VALUES ('956', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:49:57');
INSERT INTO `adm_log_access` VALUES ('957', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:53:11');
INSERT INTO `adm_log_access` VALUES ('958', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 08:55:20');
INSERT INTO `adm_log_access` VALUES ('959', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 09:01:19');
INSERT INTO `adm_log_access` VALUES ('960', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 09:11:47');
INSERT INTO `adm_log_access` VALUES ('961', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 09:14:20');
INSERT INTO `adm_log_access` VALUES ('962', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 09:16:24');
INSERT INTO `adm_log_access` VALUES ('963', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 09:18:21');
INSERT INTO `adm_log_access` VALUES ('964', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 09:36:31');
INSERT INTO `adm_log_access` VALUES ('965', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 09:38:55');
INSERT INTO `adm_log_access` VALUES ('966', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 09:45:42');
INSERT INTO `adm_log_access` VALUES ('967', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 10:15:09');
INSERT INTO `adm_log_access` VALUES ('968', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 10:37:43');
INSERT INTO `adm_log_access` VALUES ('969', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 10:48:51');
INSERT INTO `adm_log_access` VALUES ('970', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-06 10:58:37');
INSERT INTO `adm_log_access` VALUES ('971', '729', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 10:58:44');
INSERT INTO `adm_log_access` VALUES ('972', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 17:00:39');
INSERT INTO `adm_log_access` VALUES ('973', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 17:58:25');
INSERT INTO `adm_log_access` VALUES ('974', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 18:51:21');
INSERT INTO `adm_log_access` VALUES ('975', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 19:05:20');
INSERT INTO `adm_log_access` VALUES ('976', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-06 19:10:47');
INSERT INTO `adm_log_access` VALUES ('977', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-07 00:52:08');
INSERT INTO `adm_log_access` VALUES ('978', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-07 01:30:36');
INSERT INTO `adm_log_access` VALUES ('979', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-07 02:18:14');
INSERT INTO `adm_log_access` VALUES ('980', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-10 17:05:54');
INSERT INTO `adm_log_access` VALUES ('981', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-10 17:23:46');
INSERT INTO `adm_log_access` VALUES ('982', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-10 17:23:52');
INSERT INTO `adm_log_access` VALUES ('983', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-10 17:40:11');
INSERT INTO `adm_log_access` VALUES ('984', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-10 17:42:45');
INSERT INTO `adm_log_access` VALUES ('985', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-10 17:45:15');
INSERT INTO `adm_log_access` VALUES ('986', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-10 18:10:00');
INSERT INTO `adm_log_access` VALUES ('987', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-11 01:23:16');
INSERT INTO `adm_log_access` VALUES ('988', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-11 01:51:31');
INSERT INTO `adm_log_access` VALUES ('989', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-11 02:22:48');
INSERT INTO `adm_log_access` VALUES ('990', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-12 04:06:54');
INSERT INTO `adm_log_access` VALUES ('991', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-12 09:23:38');
INSERT INTO `adm_log_access` VALUES ('992', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-12 14:13:00');
INSERT INTO `adm_log_access` VALUES ('993', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-12 15:16:12');
INSERT INTO `adm_log_access` VALUES ('994', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-12 15:17:59');
INSERT INTO `adm_log_access` VALUES ('995', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-12 15:28:08');
INSERT INTO `adm_log_access` VALUES ('996', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-12 15:42:25');
INSERT INTO `adm_log_access` VALUES ('997', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-12 15:46:23');
INSERT INTO `adm_log_access` VALUES ('998', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-13 04:28:21');
INSERT INTO `adm_log_access` VALUES ('999', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-14 14:55:02');
INSERT INTO `adm_log_access` VALUES ('1000', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-14 15:04:53');
INSERT INTO `adm_log_access` VALUES ('1001', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2020-03-16 01:34:16');
INSERT INTO `adm_log_access` VALUES ('1002', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-16 01:35:39');
INSERT INTO `adm_log_access` VALUES ('1003', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 04:16:19');
INSERT INTO `adm_log_access` VALUES ('1004', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 07:47:58');
INSERT INTO `adm_log_access` VALUES ('1005', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 07:53:08');
INSERT INTO `adm_log_access` VALUES ('1006', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 07:56:52');
INSERT INTO `adm_log_access` VALUES ('1007', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 08:45:48');
INSERT INTO `adm_log_access` VALUES ('1008', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 15:18:24');
INSERT INTO `adm_log_access` VALUES ('1009', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-17 15:19:50');
INSERT INTO `adm_log_access` VALUES ('1010', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 15:20:00');
INSERT INTO `adm_log_access` VALUES ('1011', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 15:21:27');
INSERT INTO `adm_log_access` VALUES ('1012', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-03-17 15:28:26');
INSERT INTO `adm_log_access` VALUES ('1013', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 15:28:31');
INSERT INTO `adm_log_access` VALUES ('1014', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 15:32:09');
INSERT INTO `adm_log_access` VALUES ('1015', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 16:25:16');
INSERT INTO `adm_log_access` VALUES ('1016', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 16:28:19');
INSERT INTO `adm_log_access` VALUES ('1017', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 16:34:43');
INSERT INTO `adm_log_access` VALUES ('1018', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 16:38:13');
INSERT INTO `adm_log_access` VALUES ('1019', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 16:47:33');
INSERT INTO `adm_log_access` VALUES ('1020', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 16:50:26');
INSERT INTO `adm_log_access` VALUES ('1021', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 16:52:29');
INSERT INTO `adm_log_access` VALUES ('1022', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 17:03:38');
INSERT INTO `adm_log_access` VALUES ('1023', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 17:47:43');
INSERT INTO `adm_log_access` VALUES ('1024', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 17:52:07');
INSERT INTO `adm_log_access` VALUES ('1025', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 17:55:47');
INSERT INTO `adm_log_access` VALUES ('1026', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 17:59:44');
INSERT INTO `adm_log_access` VALUES ('1027', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 18:06:12');
INSERT INTO `adm_log_access` VALUES ('1028', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 18:12:03');
INSERT INTO `adm_log_access` VALUES ('1029', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 18:23:16');
INSERT INTO `adm_log_access` VALUES ('1030', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 18:45:10');
INSERT INTO `adm_log_access` VALUES ('1031', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 18:47:13');
INSERT INTO `adm_log_access` VALUES ('1032', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 19:00:28');
INSERT INTO `adm_log_access` VALUES ('1033', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 19:02:04');
INSERT INTO `adm_log_access` VALUES ('1034', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-17 20:06:45');
INSERT INTO `adm_log_access` VALUES ('1035', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 02:15:32');
INSERT INTO `adm_log_access` VALUES ('1036', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 03:17:11');
INSERT INTO `adm_log_access` VALUES ('1037', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 04:00:01');
INSERT INTO `adm_log_access` VALUES ('1038', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 04:44:36');
INSERT INTO `adm_log_access` VALUES ('1039', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 06:38:43');
INSERT INTO `adm_log_access` VALUES ('1040', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 07:38:02');
INSERT INTO `adm_log_access` VALUES ('1041', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 07:41:18');
INSERT INTO `adm_log_access` VALUES ('1042', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 07:44:49');
INSERT INTO `adm_log_access` VALUES ('1043', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 08:43:14');
INSERT INTO `adm_log_access` VALUES ('1044', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 09:01:03');
INSERT INTO `adm_log_access` VALUES ('1045', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 09:27:49');
INSERT INTO `adm_log_access` VALUES ('1046', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 09:57:51');
INSERT INTO `adm_log_access` VALUES ('1047', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 11:06:45');
INSERT INTO `adm_log_access` VALUES ('1048', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 11:10:11');
INSERT INTO `adm_log_access` VALUES ('1049', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 15:27:24');
INSERT INTO `adm_log_access` VALUES ('1050', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 16:02:17');
INSERT INTO `adm_log_access` VALUES ('1051', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 17:11:49');
INSERT INTO `adm_log_access` VALUES ('1052', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 17:35:26');
INSERT INTO `adm_log_access` VALUES ('1053', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 17:43:48');
INSERT INTO `adm_log_access` VALUES ('1054', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-18 18:18:04');
INSERT INTO `adm_log_access` VALUES ('1055', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 01:35:08');
INSERT INTO `adm_log_access` VALUES ('1056', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 02:33:05');
INSERT INTO `adm_log_access` VALUES ('1057', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 03:23:35');
INSERT INTO `adm_log_access` VALUES ('1058', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 04:12:35');
INSERT INTO `adm_log_access` VALUES ('1059', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 04:20:13');
INSERT INTO `adm_log_access` VALUES ('1060', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 06:55:18');
INSERT INTO `adm_log_access` VALUES ('1061', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 07:04:12');
INSERT INTO `adm_log_access` VALUES ('1062', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 07:21:43');
INSERT INTO `adm_log_access` VALUES ('1063', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 08:52:10');
INSERT INTO `adm_log_access` VALUES ('1064', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 08:54:46');
INSERT INTO `adm_log_access` VALUES ('1065', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 09:06:19');
INSERT INTO `adm_log_access` VALUES ('1066', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 09:34:10');
INSERT INTO `adm_log_access` VALUES ('1067', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 10:21:13');
INSERT INTO `adm_log_access` VALUES ('1068', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-19 11:40:56');
INSERT INTO `adm_log_access` VALUES ('1069', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-21 04:08:22');
INSERT INTO `adm_log_access` VALUES ('1070', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-21 04:40:48');
INSERT INTO `adm_log_access` VALUES ('1071', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-21 04:46:13');
INSERT INTO `adm_log_access` VALUES ('1072', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-22 08:13:59');
INSERT INTO `adm_log_access` VALUES ('1073', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-22 09:21:35');
INSERT INTO `adm_log_access` VALUES ('1074', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-22 09:24:50');
INSERT INTO `adm_log_access` VALUES ('1075', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 04:24:25');
INSERT INTO `adm_log_access` VALUES ('1076', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 04:29:38');
INSERT INTO `adm_log_access` VALUES ('1077', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 06:53:19');
INSERT INTO `adm_log_access` VALUES ('1078', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 07:16:58');
INSERT INTO `adm_log_access` VALUES ('1079', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 07:22:17');
INSERT INTO `adm_log_access` VALUES ('1080', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 08:13:19');
INSERT INTO `adm_log_access` VALUES ('1081', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 08:18:08');
INSERT INTO `adm_log_access` VALUES ('1082', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 08:49:56');
INSERT INTO `adm_log_access` VALUES ('1083', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 14:34:17');
INSERT INTO `adm_log_access` VALUES ('1084', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 15:36:50');
INSERT INTO `adm_log_access` VALUES ('1085', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 15:49:58');
INSERT INTO `adm_log_access` VALUES ('1086', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 16:46:32');
INSERT INTO `adm_log_access` VALUES ('1087', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-23 17:07:01');
INSERT INTO `adm_log_access` VALUES ('1088', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-24 01:15:51');
INSERT INTO `adm_log_access` VALUES ('1089', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-24 08:31:12');
INSERT INTO `adm_log_access` VALUES ('1090', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-24 16:44:43');
INSERT INTO `adm_log_access` VALUES ('1091', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-24 19:11:51');
INSERT INTO `adm_log_access` VALUES ('1092', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-25 15:33:38');
INSERT INTO `adm_log_access` VALUES ('1093', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-25 16:41:00');
INSERT INTO `adm_log_access` VALUES ('1094', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 01:17:12');
INSERT INTO `adm_log_access` VALUES ('1095', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 02:09:49');
INSERT INTO `adm_log_access` VALUES ('1096', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 02:29:39');
INSERT INTO `adm_log_access` VALUES ('1097', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 02:35:03');
INSERT INTO `adm_log_access` VALUES ('1098', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 05:30:34');
INSERT INTO `adm_log_access` VALUES ('1099', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 09:41:10');
INSERT INTO `adm_log_access` VALUES ('1100', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 10:37:59');
INSERT INTO `adm_log_access` VALUES ('1101', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 14:29:04');
INSERT INTO `adm_log_access` VALUES ('1102', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-26 16:11:27');
INSERT INTO `adm_log_access` VALUES ('1103', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 01:04:38');
INSERT INTO `adm_log_access` VALUES ('1104', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 01:46:18');
INSERT INTO `adm_log_access` VALUES ('1105', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 02:56:11');
INSERT INTO `adm_log_access` VALUES ('1106', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 03:01:03');
INSERT INTO `adm_log_access` VALUES ('1107', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 03:06:19');
INSERT INTO `adm_log_access` VALUES ('1108', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 03:16:59');
INSERT INTO `adm_log_access` VALUES ('1109', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 03:38:15');
INSERT INTO `adm_log_access` VALUES ('1110', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 03:42:52');
INSERT INTO `adm_log_access` VALUES ('1111', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 04:42:06');
INSERT INTO `adm_log_access` VALUES ('1112', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 04:45:16');
INSERT INTO `adm_log_access` VALUES ('1113', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 04:48:44');
INSERT INTO `adm_log_access` VALUES ('1114', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 04:54:55');
INSERT INTO `adm_log_access` VALUES ('1115', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 05:28:22');
INSERT INTO `adm_log_access` VALUES ('1116', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 05:35:57');
INSERT INTO `adm_log_access` VALUES ('1117', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 06:59:22');
INSERT INTO `adm_log_access` VALUES ('1118', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 08:15:05');
INSERT INTO `adm_log_access` VALUES ('1119', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 08:32:18');
INSERT INTO `adm_log_access` VALUES ('1120', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 08:53:58');
INSERT INTO `adm_log_access` VALUES ('1121', '1', 'Hệ thống', '127.0.0.1', 'Đăng nhập', '2020-03-27 09:06:07');
INSERT INTO `adm_log_access` VALUES ('1122', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 09:09:22');
INSERT INTO `adm_log_access` VALUES ('1123', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 15:07:06');
INSERT INTO `adm_log_access` VALUES ('1124', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 15:49:16');
INSERT INTO `adm_log_access` VALUES ('1125', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 16:03:23');
INSERT INTO `adm_log_access` VALUES ('1126', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 16:33:51');
INSERT INTO `adm_log_access` VALUES ('1127', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-27 17:06:13');
INSERT INTO `adm_log_access` VALUES ('1128', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 04:45:18');
INSERT INTO `adm_log_access` VALUES ('1129', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 04:56:01');
INSERT INTO `adm_log_access` VALUES ('1130', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 05:13:42');
INSERT INTO `adm_log_access` VALUES ('1131', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 08:12:13');
INSERT INTO `adm_log_access` VALUES ('1132', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 10:55:48');
INSERT INTO `adm_log_access` VALUES ('1133', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 11:18:51');
INSERT INTO `adm_log_access` VALUES ('1134', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 11:22:30');
INSERT INTO `adm_log_access` VALUES ('1135', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 11:31:13');
INSERT INTO `adm_log_access` VALUES ('1136', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 11:43:15');
INSERT INTO `adm_log_access` VALUES ('1137', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 11:44:44');
INSERT INTO `adm_log_access` VALUES ('1138', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 11:49:34');
INSERT INTO `adm_log_access` VALUES ('1139', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:05:37');
INSERT INTO `adm_log_access` VALUES ('1140', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:07:34');
INSERT INTO `adm_log_access` VALUES ('1141', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:12:49');
INSERT INTO `adm_log_access` VALUES ('1142', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:14:12');
INSERT INTO `adm_log_access` VALUES ('1143', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:20:22');
INSERT INTO `adm_log_access` VALUES ('1144', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:21:19');
INSERT INTO `adm_log_access` VALUES ('1145', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:22:22');
INSERT INTO `adm_log_access` VALUES ('1146', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:25:33');
INSERT INTO `adm_log_access` VALUES ('1147', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:50:08');
INSERT INTO `adm_log_access` VALUES ('1148', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:51:23');
INSERT INTO `adm_log_access` VALUES ('1149', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:54:18');
INSERT INTO `adm_log_access` VALUES ('1150', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:57:17');
INSERT INTO `adm_log_access` VALUES ('1151', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 12:58:32');
INSERT INTO `adm_log_access` VALUES ('1152', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 13:07:37');
INSERT INTO `adm_log_access` VALUES ('1153', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 13:39:33');
INSERT INTO `adm_log_access` VALUES ('1154', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 13:41:34');
INSERT INTO `adm_log_access` VALUES ('1155', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 13:44:49');
INSERT INTO `adm_log_access` VALUES ('1156', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-28 13:51:12');
INSERT INTO `adm_log_access` VALUES ('1157', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-30 15:35:57');
INSERT INTO `adm_log_access` VALUES ('1158', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-30 15:37:35');
INSERT INTO `adm_log_access` VALUES ('1159', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-30 16:25:52');
INSERT INTO `adm_log_access` VALUES ('1160', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-30 17:33:23');
INSERT INTO `adm_log_access` VALUES ('1161', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-03-31 18:58:56');
INSERT INTO `adm_log_access` VALUES ('1162', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-01 17:22:08');
INSERT INTO `adm_log_access` VALUES ('1163', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-02 03:44:49');
INSERT INTO `adm_log_access` VALUES ('1164', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-02 07:47:11');
INSERT INTO `adm_log_access` VALUES ('1165', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-02 08:16:27');
INSERT INTO `adm_log_access` VALUES ('1166', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-02 16:47:11');
INSERT INTO `adm_log_access` VALUES ('1167', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-02 18:37:33');
INSERT INTO `adm_log_access` VALUES ('1168', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 04:26:33');
INSERT INTO `adm_log_access` VALUES ('1169', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:08:39');
INSERT INTO `adm_log_access` VALUES ('1170', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:11:13');
INSERT INTO `adm_log_access` VALUES ('1171', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:23:25');
INSERT INTO `adm_log_access` VALUES ('1172', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-04-04 06:23:39');
INSERT INTO `adm_log_access` VALUES ('1173', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:23:41');
INSERT INTO `adm_log_access` VALUES ('1174', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:27:31');
INSERT INTO `adm_log_access` VALUES ('1175', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:31:43');
INSERT INTO `adm_log_access` VALUES ('1176', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:37:22');
INSERT INTO `adm_log_access` VALUES ('1177', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:40:26');
INSERT INTO `adm_log_access` VALUES ('1178', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 06:56:10');
INSERT INTO `adm_log_access` VALUES ('1179', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 07:18:01');
INSERT INTO `adm_log_access` VALUES ('1180', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 07:19:59');
INSERT INTO `adm_log_access` VALUES ('1181', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 07:30:06');
INSERT INTO `adm_log_access` VALUES ('1182', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 07:34:44');
INSERT INTO `adm_log_access` VALUES ('1183', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 07:37:42');
INSERT INTO `adm_log_access` VALUES ('1184', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 07:43:25');
INSERT INTO `adm_log_access` VALUES ('1185', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 07:46:04');
INSERT INTO `adm_log_access` VALUES ('1186', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 07:58:25');
INSERT INTO `adm_log_access` VALUES ('1187', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 16:25:18');
INSERT INTO `adm_log_access` VALUES ('1188', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 16:54:55');
INSERT INTO `adm_log_access` VALUES ('1189', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-04 17:24:55');
INSERT INTO `adm_log_access` VALUES ('1190', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-12 11:29:17');
INSERT INTO `adm_log_access` VALUES ('1191', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-12 11:32:18');
INSERT INTO `adm_log_access` VALUES ('1192', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-14 09:54:04');
INSERT INTO `adm_log_access` VALUES ('1193', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 15:48:38');
INSERT INTO `adm_log_access` VALUES ('1194', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 16:42:33');
INSERT INTO `adm_log_access` VALUES ('1195', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-04-16 16:44:02');
INSERT INTO `adm_log_access` VALUES ('1196', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 16:44:06');
INSERT INTO `adm_log_access` VALUES ('1197', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 16:48:49');
INSERT INTO `adm_log_access` VALUES ('1198', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 16:52:21');
INSERT INTO `adm_log_access` VALUES ('1199', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 17:05:02');
INSERT INTO `adm_log_access` VALUES ('1200', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 17:56:43');
INSERT INTO `adm_log_access` VALUES ('1201', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 18:08:41');
INSERT INTO `adm_log_access` VALUES ('1202', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 18:14:58');
INSERT INTO `adm_log_access` VALUES ('1203', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 18:18:08');
INSERT INTO `adm_log_access` VALUES ('1204', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 18:28:24');
INSERT INTO `adm_log_access` VALUES ('1205', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-16 18:30:44');
INSERT INTO `adm_log_access` VALUES ('1206', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-19 15:19:13');
INSERT INTO `adm_log_access` VALUES ('1207', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-04-19 15:19:52');
INSERT INTO `adm_log_access` VALUES ('1208', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-19 15:20:13');
INSERT INTO `adm_log_access` VALUES ('1209', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-04-19 15:20:17');
INSERT INTO `adm_log_access` VALUES ('1210', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-21 15:49:45');
INSERT INTO `adm_log_access` VALUES ('1211', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-24 18:20:31');
INSERT INTO `adm_log_access` VALUES ('1212', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-24 18:42:55');
INSERT INTO `adm_log_access` VALUES ('1213', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-24 22:44:59');
INSERT INTO `adm_log_access` VALUES ('1214', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-26 16:41:49');
INSERT INTO `adm_log_access` VALUES ('1215', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-26 16:49:51');
INSERT INTO `adm_log_access` VALUES ('1216', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-04-26 17:11:40');
INSERT INTO `adm_log_access` VALUES ('1217', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-05-02 16:39:42');
INSERT INTO `adm_log_access` VALUES ('1218', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-05-02 16:47:03');
INSERT INTO `adm_log_access` VALUES ('1219', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng xuất', '2020-05-02 16:47:43');
INSERT INTO `adm_log_access` VALUES ('1220', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-05-02 18:54:23');
INSERT INTO `adm_log_access` VALUES ('1221', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-08-07 17:36:04');
INSERT INTO `adm_log_access` VALUES ('1222', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-12-28 16:59:19');
INSERT INTO `adm_log_access` VALUES ('1223', '1', 'Hệ thống', '0:0:0:0:0:0:0:1', 'Đăng nhập', '2020-12-28 17:18:22');

-- ----------------------------
-- Table structure for adm_users
-- ----------------------------
DROP TABLE IF EXISTS `adm_users`;
CREATE TABLE `adm_users` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `FULL_NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `LAST_ACCESS_TIME` date DEFAULT NULL,
  `STATUS` int(10) NOT NULL,
  `GEN_DATE` timestamp NULL DEFAULT NULL,
  `LAST_UPDATED` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `PK_ADM_USERS` (`ID`),
  UNIQUE KEY `UNIQUE_USER_USERNAME` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=730 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adm_users
-- ----------------------------
INSERT INTO `adm_users` VALUES ('1', 'admin', '$2a$10$6XJsNNVh3VR0tzq7SqunPeSaoQJTu9QypXvVaUg1onrFftQ3VB0mu', 'Trần Hùng', 'đây là admin', '2017-12-26', '1', '2017-12-26 04:14:31', '2017-12-26 04:14:31');
INSERT INTO `adm_users` VALUES ('729', 'dang_bai', '$2a$10$vDlYBwWEEPOMjMXJwnMpQu2XiAZF2YOJjXMtmhPZHKb9EpJMB.zu2', 'Nguyễn Văn Thiện', 'Chỉ có phép đăng bài', null, '1', '2020-03-06 08:22:38', '2020-03-06 08:22:38');

-- ----------------------------
-- Table structure for tqc_article
-- ----------------------------
DROP TABLE IF EXISTS `tqc_article`;
CREATE TABLE `tqc_article` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `GEN_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TITLE` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `USER_CREATED` int(11) NOT NULL,
  `USER_UPDATED` int(11) NOT NULL,
  `DATE_CREATED` datetime NOT NULL,
  `DATE_UPDATED` datetime NOT NULL,
  `STATUS` int(1) NOT NULL DEFAULT 0 COMMENT '0: công khai, 1: bản nháp, 2: bị xóa',
  `isPin` int(1) DEFAULT NULL,
  `idlike` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0',
  `iddislike` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0',
  `countlike` int(11) NOT NULL DEFAULT 0,
  `countdislike` int(11) NOT NULL DEFAULT 0,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `byCustomer` int(1) NOT NULL DEFAULT 0 COMMENT 'bản tin dc tạo bởi customer? 1: có, 0: không',
  `username_created` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userFullName_created` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_updated` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userFullName_updated` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countView` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tqc_article
-- ----------------------------
INSERT INTO `tqc_article` VALUES ('1', '<p>&agrave;dsdf</p>', '2020-04-20 19:58:46', 'Muốn cạnh tranh với Huawei, Mỹ phải mua cổ phần của Nokia và Ericsson', 'ádf', '1', '1', '1', '2020-04-04 07:58:42', '2020-04-04 17:37:56', '1', '0', '', '', '0', '0', 'thẻ 1, thẻ 2', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('2', '<p>adsfasdfsdaf</p>', '2020-04-20 19:58:46', 'Muốn cạnh tranh với Huawei, Mỹ phải mua cổ phần của Nokia và Ericsson', 'asdfasdf', '1', '1', '1', '2020-04-04 17:25:54', '2020-04-04 17:37:45', '1', '1', '', '', '0', '0', 'thẻ 3, thẻ 4', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('22', '<p>fasdfasdfasd</p>', '2020-04-20 19:58:46', 'ádfasd', '', '1', '1', '1', '2020-04-12 11:12:41', '2020-04-12 11:12:41', '0', '0', '', '', '0', '0', null, '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('23', '<p>fasdfasdfasd</p>', '2020-04-20 19:58:46', 'ádfasd', '', '1', '1', '1', '2020-04-12 11:14:31', '2020-04-12 11:14:31', '0', '0', '', '', '0', '0', null, '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('24', '<p>nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;nội dung&nbsp;</p>', '2020-04-27 23:05:17', 'tiêu đề tin tức chu quang đại', '', '1', '1', '1', '2020-04-12 11:23:19', '2020-04-12 11:23:19', '0', '0', '', '', '0', '0', 'thẻ 1, thẻ 2, thẻ 3, thẻ 4', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '11');
INSERT INTO `tqc_article` VALUES ('25', '<p>ấdfsd</p>', '2020-04-20 19:58:46', 'adfasd', '', '1', '1', '1', '2020-04-12 11:26:17', '2020-04-12 11:26:17', '0', '0', '', '', '0', '0', 'ádf', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('26', '<p>fasdfasdf</p>', '2020-04-20 19:58:46', 'ádfsd', '', '1', '1', '1', '2020-04-12 11:28:03', '2020-04-12 11:28:03', '0', '0', '', '', '0', '0', 'ádfsf', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('27', '<p>fasdfasdfasdf</p>', '2020-04-20 19:58:46', 'adfasd', '', '1', '1', '1', '2020-04-12 11:28:30', '2020-04-12 11:28:30', '0', '0', '', '', '0', '0', 'adfad', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('28', '<p>fasdfasdfaf</p>', '2020-04-20 19:58:46', 'ádfsd', 'ádfsd', '1', '1', '1', '2020-04-12 11:34:02', '2020-04-12 11:34:02', '0', '0', '', '', '0', '0', null, '0', 'admim', 'Admin', 'admim', 'Admin', '0');
INSERT INTO `tqc_article` VALUES ('29', '<p>gfsfdgsdf</p>', '2020-04-20 19:58:47', 'sagfasdfgsd', '', '1', '1', '1', '2020-04-12 11:39:20', '2020-04-12 11:39:20', '0', '0', '', '', '0', '0', 'sdfgdsfg', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('30', '<p>b&agrave;i viết chủ đề 1 by thiennv&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;&nbsp;b&agrave;i viết chủ đề 1 by thiennv&nbsp;</p>', '2020-04-25 02:41:49', 'bài viết chủ đề 1 by thiennv', '', '1', '52', '52', '2020-04-12 11:45:45', '2020-04-12 11:45:45', '0', '0', '', '', '0', '0', ' bài viết chủ đề 1 by thiennv', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '3');
INSERT INTO `tqc_article` VALUES ('31', '<p>adsfasdfsdaf</p>', '2020-04-25 04:34:29', 'Tin tạo mới từ tin nháp', '', '1', '1', '1', '2020-04-16 15:15:53', '2020-04-16 15:15:53', '0', '0', '', '', '0', '0', 'thẻ 3, thẻ 4', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '4');
INSERT INTO `tqc_article` VALUES ('32', '<p>fasfsdfsadfd</p>', '2020-04-25 04:34:20', 'ádfas', '', '1', '1', '1', '2020-04-16 15:20:54', '2020-04-16 15:20:54', '0', '0', '', '', '0', '0', 'ádfsad', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '22');
INSERT INTO `tqc_article` VALUES ('33', '<p>fasfasdfasfasdfasdf</p>', '2020-04-20 19:58:47', 'ádfas', '', '1', '1', '1', '2020-04-16 15:22:18', '2020-04-16 15:22:18', '1', '0', '', '', '0', '0', 'ádfasf', '1', 'daicq', 'Chu Quang Đại', 'daicq', 'Chu Quang Đại', '0');
INSERT INTO `tqc_article` VALUES ('34', '<p>aaaaaaaaaaaa</p>', '2020-04-26 23:36:09', 'aaaaaaaaaaaaa', 'aaaaaaaa', '2', '1', '1', '2020-04-16 18:42:19', '2020-04-16 18:43:10', '0', '0', '', '', '0', '0', null, '0', 'admim', 'Admin', 'admim', 'Admin', '280');
INSERT INTO `tqc_article` VALUES ('35', '<p>ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;ti&ecirc;u đề tin tức chu quang đại&nbsp;</p>', '2020-04-29 01:54:04', 'tiêu đề tin tức chu quang đại', '', '2', '1', '1', '2020-04-24 18:44:55', '2020-04-24 18:44:55', '0', '0', '', '', '0', '0', 'thẻ 1, thẻ 2, thẻ 3, thẻ 4', '1', 'daicq', 'chu quang đại', 'daicq', 'chu quang đại', '157');
INSERT INTO `tqc_article` VALUES ('36', '<p>fasdfsadfsa sa</p>', '2020-04-29 02:03:56', 'asdf', 'adsfsd', '1', '1', '1', '2020-04-24 22:46:33', '2020-04-24 22:46:44', '0', '0', '', '', '0', '0', null, '0', 'admin', 'Trần Hùng', 'admin', 'Trần Hùng', '25');
INSERT INTO `tqc_article` VALUES ('37', '<p>&Aacute;DFASDFASD</p>', '2020-05-04 00:46:32', 'ÁDFSDFA', '', '2', '1', '1', '2020-05-02 16:53:24', '2020-05-02 16:53:24', '0', '0', '', '', '0', '0', 'Ầ ADSF ASDF SD', '1', 'daicq', 'chu quang đại', 'daicq', 'chu quang đại', '1');
INSERT INTO `tqc_article` VALUES ('38', '<p>DDDDDDD</p>', '2020-05-04 00:46:24', 'DDDDDĐ', '', '1', '1', '1', '2020-05-02 16:53:48', '2020-05-02 16:53:48', '0', '0', '', '', '0', '0', 'DDDDDDĐ', '1', 'daicq', 'chu quang đại', 'daicq', 'chu quang đại', '23');

-- ----------------------------
-- Table structure for tqc_category
-- ----------------------------
DROP TABLE IF EXISTS `tqc_category`;
CREATE TABLE `tqc_category` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `user_created` bigint(11) NOT NULL,
  `user_updated` bigint(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `status` int(1) NOT NULL,
  `groupTopicId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tqc_category
-- ----------------------------
INSERT INTO `tqc_category` VALUES ('1', 'chủ đề 1', 'mô tả chủ đề 1', '1', '1', '2020-04-04 07:47:47', '2020-04-24 22:52:12', '1', '1');
INSERT INTO `tqc_category` VALUES ('2', 'Chủ đề 2', 'Chủ đề 2', '1', '1', '2020-04-04 17:42:57', '2020-04-24 22:53:12', '1', '3');
INSERT INTO `tqc_category` VALUES ('8', 'Chủ đề 3', 'Chủ đề 3 Chủ đề 3', '1', '1', '2020-04-24 22:53:22', '2020-04-24 22:53:22', '1', '3');
INSERT INTO `tqc_category` VALUES ('9', 'Chủ đề 4', 'Chủ đề 3 Chủ đề 3', '1', '1', '2020-04-24 22:53:33', '2020-04-24 22:53:33', '1', '3');

-- ----------------------------
-- Table structure for tqc_comment
-- ----------------------------
DROP TABLE IF EXISTS `tqc_comment`;
CREATE TABLE `tqc_comment` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(11) NOT NULL,
  `content` longtext NOT NULL,
  `date_created` datetime NOT NULL,
  `user_created` bigint(11) NOT NULL,
  `idlike` varchar(10000) NOT NULL,
  `iddislike` varchar(10000) NOT NULL,
  `countlike` int(11) NOT NULL,
  `countdislike` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tqc_comment
-- ----------------------------
INSERT INTO `tqc_comment` VALUES ('1', '34', 'uh chu ddaij quang ddaij quangddaij quangddaij quangddaij quangddaij quangddaij quangddaij quangddaij quangddaij quangddaij quangddaij quangddaij quang', '2020-04-20 21:03:24', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('2', '34', '<p>fffffffffdđ ddddđ sssssssss</p>\n', '2020-04-23 02:07:51', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('3', '34', '<p>fffffffffdđ ddddđ sssssssss</p>\n', '2020-04-23 02:07:53', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('4', '34', '<p>dai chu quang</p>\n', '2020-04-23 02:15:06', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('5', '34', '<p>sdfgsdfg</p>\n', '2020-04-23 03:15:44', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('6', '34', '<p>sdfgsdfg</p>\n', '2020-04-23 03:15:44', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('7', '34', '<p>sdfgsdfg</p>\n', '2020-04-23 03:15:44', '1', '1', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('8', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:23', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('9', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:40', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('10', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:41', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('11', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:42', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('12', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:43', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('13', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:43', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('14', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:43', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('15', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:44', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('16', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:44', '1', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('17', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:44', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('18', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:44', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('19', '34', '<p>ggggggg</p>\n', '2020-04-23 03:29:44', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('20', '34', 'binh luan boi chu quang dai', '2020-04-23 14:11:38', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('21', '34', 'comment 1', '2020-04-23 14:16:15', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('22', '34', 'comment 2', '2020-04-23 14:16:18', '1', '1', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('23', '34', 'comment 3', '2020-04-23 14:16:21', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('24', '34', 'comment 4', '2020-04-23 14:16:24', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('25', '34', 'comment 5', '2020-04-23 14:16:27', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('26', '34', 'comment 6', '2020-04-23 14:16:30', '1', '1', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('27', '34', 'comment 7', '2020-04-23 14:16:32', '1', '1', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('28', '34', 'comment 8', '2020-04-23 14:16:35', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('29', '34', 'comment 9', '2020-04-23 14:16:37', '1', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('30', '34', 'sdfdf', '2020-04-23 17:15:41', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('31', '34', 'sdfdfdddddddddd', '2020-04-23 17:15:46', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('32', '34', 'binh luan cua thiennv', '2020-04-23 17:24:03', '52', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('33', '34', 'd', '2020-04-24 17:09:31', '1', '1', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('34', '34', 'dddd', '2020-04-24 17:10:16', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('35', '34', 'xb', '2020-04-24 17:39:36', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('36', '35', 'Binh luan boi chu quang dai', '2020-04-24 18:53:39', '1', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('37', '32', 'đ', '2020-04-24 19:42:37', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('38', '32', 'binh luan boi chu quang dai', '2020-04-24 19:42:48', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('39', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8585/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--20.gif\" /></p>', '2020-04-26 18:05:29', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('40', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8585/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--29.gif\" /></p>', '2020-04-26 18:18:13', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('41', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8585/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--20.gif\" /></p>', '2020-04-26 18:33:09', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('42', '35', '<p><img width=\"28\" height=\"28\" src=\"http://localhost:8585/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/facebook/disappointed-but-relieved-face_1f625.png\" /></p>', '2020-04-26 19:10:50', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('43', '35', '<p>chu quang ddaij&nbsp;<img width=\"50\" height=\"50\" src=\"http://localhost:8585/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--108.gif\" /></p>', '2020-04-26 19:11:01', '1', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('44', '35', '<p><img width=\"60\" height=\"60\" src=\"http://localhost:8585/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/milkbottle/Milk%20Bottle--12.gif\" /></p>', '2020-04-26 19:11:32', '1', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('45', '36', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--10.gif\" /></p>', '2020-04-27 16:05:27', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('46', '36', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--107.gif\" /></p>', '2020-04-27 16:05:38', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('47', '36', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--108.gif\" /></p>', '2020-04-27 16:05:45', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('48', '36', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--17.gif\" /></p>', '2020-04-27 16:07:39', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('49', '36', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--2.gif\" /></p>', '2020-04-27 16:12:59', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('50', '36', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--18.gif\" /></p>', '2020-04-27 16:13:15', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('51', '36', '<p><strong>chu quang dai</strong></p>', '2020-04-27 16:16:41', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('52', '36', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--111.gif\" /></p>', '2020-04-27 16:20:49', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('53', '35', '<p>sxfvsa</p>', '2020-04-27 18:46:49', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('54', '35', '<p>dfgsdfg</p>', '2020-04-28 16:08:04', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('55', '35', '<p>sfdg</p>', '2020-04-28 16:08:06', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('56', '35', '<p>sdfgsd</p>', '2020-04-28 16:08:07', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('57', '35', '<p>jghj</p>', '2020-04-28 16:08:09', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('58', '35', '<p>567</p>', '2020-04-28 16:08:10', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('59', '35', '<p>487</p>', '2020-04-28 16:08:11', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('60', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--11.gif\" /></p>', '2020-04-28 16:08:15', '1', '1', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('61', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--105.gif\" /></p>', '2020-04-28 16:08:17', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('62', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--23.gif\" /></p>', '2020-04-28 16:08:21', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('63', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--19.gif\" /></p>', '2020-04-28 16:08:23', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('64', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--56.gif\" /></p>', '2020-04-28 16:08:32', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('65', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--98.gif\" /></p>', '2020-04-28 16:08:36', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('66', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--90.gif\" /></p>', '2020-04-28 16:08:40', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('67', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--96.gif\" /></p>', '2020-04-28 16:08:43', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('68', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--17.gif\" /></p>', '2020-04-28 16:08:55', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('69', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '2020-04-28 16:08:57', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('70', '35', '<p>vbm</p>', '2020-04-28 16:09:00', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('71', '35', '<p>fghjghj</p><p>ghjfg</p><p>gj</p>', '2020-04-28 16:09:03', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('72', '35', '<p>fghjfghj</p>', '2020-04-28 16:09:05', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('73', '35', '<p>fgjgh</p>', '2020-04-28 16:09:07', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('74', '35', '<p>fgjgh</p>', '2020-04-28 16:09:08', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('75', '35', '<p>jgjgfh</p>', '2020-04-28 16:09:09', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('76', '35', '<p>jfgjfghj</p>', '2020-04-28 16:09:10', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('77', '35', '<p>jfghjhgf</p>', '2020-04-28 16:09:11', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('78', '35', '<p>gfhjfghjfgjfg</p>', '2020-04-28 16:09:13', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('79', '35', '<p>jfhgfj</p>', '2020-04-28 16:09:14', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('80', '35', '<p>fghjfghj</p>', '2020-04-28 16:09:15', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('81', '35', '<p>jfghj</p>', '2020-04-28 16:09:17', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('82', '35', '<p>fghjfhgj</p>', '2020-04-28 16:09:18', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('83', '35', '<p>hkjgjhk</p>', '2020-04-28 16:09:20', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('84', '35', '<p>ghjkghj</p>', '2020-04-28 16:09:21', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('85', '35', '<p>hjk<img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '2020-04-28 17:14:43', '1', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('86', '35', '<p>sg</p>', '2020-04-28 17:23:20', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('87', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--20.gif\" /></p>', '2020-04-28 17:24:04', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('88', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--15.gif\" /></p>', '2020-04-28 17:40:21', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('89', '35', '<p>asdfasd</p>', '2020-04-28 18:46:13', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('90', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--106.gif\" /></p>', '2020-04-28 18:46:19', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('91', '35', '<p><img width=\"28\" height=\"28\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/facebook/face-screaming-in-fear_1f631.png\" /><img width=\"28\" height=\"28\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/facebook/frowning-face-with-open-mouth_1f626.png\" /></p>', '2020-04-28 18:49:06', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('92', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--10.gif\" /></p>', '2020-04-28 18:55:03', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('93', '35', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--103.gif\" /></p>', '2020-04-28 18:55:31', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('94', '36', '<p><strong>chu quang đại đ&oacute;&nbsp;<img width=\"28\" height=\"28\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/facebook/grimacing-face_1f62c.png\" /></strong></p>', '2020-04-28 19:04:19', '1', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('95', '36', '<p><strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.</p>', '2020-04-28 19:06:02', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('96', '36', '<p><strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.</p>', '2020-04-28 19:06:08', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('97', '36', '<p><strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.<strong>Example 2:&nbsp;</strong>This example gets the whole document by first selecting the elements with tagname &lsquo;HTML&rsquo; and selecting the first element by indexing using&nbsp;<strong>document.getElementsByTagName(&lsquo;html&rsquo;)[0].innerHTML</strong>.</p>', '2020-04-28 19:06:24', '1', '', '1', '0', '0');
INSERT INTO `tqc_comment` VALUES ('98', '38', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/red/Animaux-Crabe-11.gif\" /></p>', '2020-05-02 18:32:19', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('99', '38', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--14.gif\" /></p>', '2020-05-03 15:46:06', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('100', '38', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--2.gif\" /></p>', '2020-05-03 16:51:57', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('101', '38', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--11.gif\" /></p>', '2020-05-03 16:52:14', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('102', '38', '<p><loader-elem><div style=\"position: relative; z-index: 100;width: 100%;height: 100%;text-align: center;background: white;opacity: 0.75;pointer-events:none\"><img src=\"/ajax_loader_gray_64.gif\" style=\"width: 30px;height: 30px;margin-top: 100px;\" /></div></loader-elem></p>', '2020-05-03 16:52:19', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('103', '38', '<p><loader-elem><div style=\"position: relative; z-index: 100;width: 100%;height: 100%;text-align: center;background: white;opacity: 0.75;pointer-events:none\"><img src=\"/ajax_loader_gray_64.gif\" style=\"width: 30px;height: 30px;margin-top: 100px;\" /></div></loader-elem></p>', '2020-05-03 16:52:47', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('104', '38', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--11.gif\" /></p>', '2020-05-03 16:54:15', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('105', '38', '<p><loader-elem><div style=\"position: relative; z-index: 100;width: 100%;height: 100%;text-align: center;background: white;opacity: 0.75;pointer-events:none\"><img src=\"/ajax_loader_gray_64.gif\" style=\"width: 30px;height: 30px;margin-top: 100px;\" /></div></loader-elem></p>', '2020-05-03 16:54:20', '1', '', '', '0', '0');
INSERT INTO `tqc_comment` VALUES ('106', '37', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--11.gif\" /></p>', '2020-05-03 17:46:38', '1', '', '', '0', '0');

-- ----------------------------
-- Table structure for tqc_customer
-- ----------------------------
DROP TABLE IF EXISTS `tqc_customer`;
CREATE TABLE `tqc_customer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` text DEFAULT NULL,
  `PASSWORD` text DEFAULT NULL,
  `EMAIL` text DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `GEN_DATE` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SCAN` int(11) DEFAULT NULL,
  `RESET_DATE` timestamp NULL DEFAULT NULL,
  `CODE_RESET` text DEFAULT NULL,
  `FILE_NAME` varchar(255) DEFAULT '',
  `LINK_FILE` varchar(255) DEFAULT NULL,
  `IMAGE` text DEFAULT NULL,
  `FULL_NAME` varchar(100) DEFAULT NULL,
  `SEX` int(1) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tqc_customer
-- ----------------------------
INSERT INTO `tqc_customer` VALUES ('1', 'daicq', '25d55ad283aa400af464c76d713c07ad', 'daicq.dev@gmail.com', '1', '2020-04-02 08:38:31', '2020-04-24 21:28:33', '0', '2020-04-02 09:15:05', '81d7cd9b594066cfcb686bcef1f5dd63', 'IMG_1900.jpg', '/tmpFiles/daicq_04-04-2020.jpg', 'data:image/png;base64,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', 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('38', 'tk123', 'b0f8b3e58f093359fe1af416b5ea8ed6', 'nguyenthienat10a@gmail.com', '1', '2020-03-23 15:36:02', '2020-03-23 15:36:02', '0', null, null, null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('39', 'tk2', '25f9e794323b453885f5181f1b624d0b', 'nguyenthienat10a@gmail.com', '1', '2020-03-23 15:36:21', '2020-03-23 15:36:21', '0', null, null, null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('40', 'tk3', '25d55ad283aa400af464c76d713c07ad', 'nguyenthienat10a@gmail.com', '1', '2020-03-23 15:36:40', '2020-03-23 15:36:40', '0', '2020-03-25 14:52:56', '', null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('41', 'tk1', '25f9e794323b453885f5181f1b624d0b', 'nguyenthienat10a@gmail.com', '1', '2020-03-27 18:18:41', '2020-03-27 18:18:41', '0', null, null, null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('42', 'clailongivay', '25f9e794323b453885f5181f1b624d0b', 'nguyenthienat10a@gmail.com', '1', '2020-03-29 06:56:01', '2020-03-29 06:56:01', '0', null, null, null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('43', 'cailongithe', '25f9e794323b453885f5181f1b624d0b', 'nguyenthienat10a@gmail.com', '1', '2020-03-29 07:37:20', '2020-03-29 07:37:20', '0', null, null, null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('44', 'corona2019', '25f9e794323b453885f5181f1b624d0b', 'nguyenthienat10a@gmail.com', '1', '2020-03-29 07:47:31', '2020-03-29 07:47:31', '0', null, null, null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('46', 'daicq2', '25d55ad283aa400af464c76d713c07ad', 'daicq2@gmail.com', '1', '2020-04-02 08:54:24', '2020-04-02 08:54:24', '0', null, null, null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('47', 'daicq3`', '25d55ad283aa400af464c76d713c07ad', 'quangdai2904@gmail.com', '1', '2020-04-04 15:13:50', '2020-04-04 15:13:50', '0', null, null, null, null, null, 'chu quang đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('48', 'daicq4', '25d55ad283aa400af464c76d713c07ad', 'daicq4@gmail.com', '1', '2020-04-04 15:17:03', '2020-04-04 15:17:03', '0', null, null, null, null, null, 'chu quang đại 2', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('49', 'daicq5', '25d55ad283aa400af464c76d713c07ad', 'daicq@gmail.com', '1', '2020-04-04 15:18:54', '2020-04-04 15:18:54', '0', null, null, null, null, null, 'chu đại', '1', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('50', 'daicq6', '25d55ad283aa400af464c76d713c07ad', 'daicq@gmail.com', '1', '2020-04-04 15:21:22', '2020-04-04 15:21:22', '0', null, null, null, null, null, 'chu đại 1', '1', '2020-03-31');
INSERT INTO `tqc_customer` VALUES ('51', 'daicq7', '25d55ad283aa400af464c76d713c07ad', 'daicq.dev@gmail.com', '1', '2020-04-04 15:33:11', '2020-04-04 16:07:47', '0', null, null, 'IMG_2537.jpg', '/tmpFiles/daicq7_04-04-2020.jpg', null, 'chu đại 7', '0', '2020-03-03');
INSERT INTO `tqc_customer` VALUES ('52', 'thiennv', '25d55ad283aa400af464c76d713c07ad', 'thiennv@gmail.com', '1', '2020-04-11 16:13:36', '2020-04-11 16:42:25', '0', null, null, '91969269_1326654464192312_622953777577590784_n.jpg', '/tmpFiles/thiennv_11-04-2020.jpg', null, 'thiện văn nguyễn', '1', '1995-03-04');

-- ----------------------------
-- Table structure for tqc_group_topic
-- ----------------------------
DROP TABLE IF EXISTS `tqc_group_topic`;
CREATE TABLE `tqc_group_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isNotifice` int(1) NOT NULL,
  `user_created` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `user_updated` int(11) NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tqc_group_topic
-- ----------------------------
INSERT INTO `tqc_group_topic` VALUES ('1', 'Thông báo', 'Khu vực thông báo từ ban quản trị DaiCQ', '1', '1', '2020-04-16 16:52:40', '1', '2020-04-16 16:54:03');
INSERT INTO `tqc_group_topic` VALUES ('3', 'Danh mục tin tức cha 1', 'Khu vực danh mục tin tức cha 1', '0', '1', '2020-04-16 17:08:08', '1', '2020-12-28 17:18:51');
INSERT INTO `tqc_group_topic` VALUES ('4', 'Danh mục tin tức cha 2', 'Nhóm tin tức thuộc danh mục tin tức cha 2', '0', '1', '2020-05-02 23:54:34', '1', '2020-12-28 17:19:15');

-- ----------------------------
-- Table structure for tqc_recoment
-- ----------------------------
DROP TABLE IF EXISTS `tqc_recoment`;
CREATE TABLE `tqc_recoment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcomment` int(11) NOT NULL,
  `usercreated` int(11) NOT NULL,
  `countlike` int(11) NOT NULL,
  `countdislike` int(11) NOT NULL,
  `idlike` varchar(10000) NOT NULL,
  `gen_date` datetime NOT NULL,
  `content` longtext NOT NULL,
  `iddislike` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tqc_recoment
-- ----------------------------
INSERT INTO `tqc_recoment` VALUES ('1', '1', '1', '0', '0', '', '2020-04-20 21:04:53', 'ok', '');
INSERT INTO `tqc_recoment` VALUES ('2', '1', '1', '0', '0', '', '2020-04-20 21:18:57', 'ờ', '');
INSERT INTO `tqc_recoment` VALUES ('3', '15', '1', '0', '0', '', '2020-04-23 14:01:38', '<p>rep by chu quang dai</p>\n', '');
INSERT INTO `tqc_recoment` VALUES ('4', '15', '1', '0', '0', '', '2020-04-23 14:02:07', '<p>rep by chu quang dai con</p>\n', '');
INSERT INTO `tqc_recoment` VALUES ('5', '15', '1', '0', '0', '', '2020-04-23 14:06:35', '<p><img alt=\"laugh\" src=\"http://localhost:8585/sansim_customer_war_exploded/assets/ckeditor/plugins/smiley/images/teeth_smile.png\" style=\"height:23px; width:23px\" title=\"laugh\" /></p>\n', '');
INSERT INTO `tqc_recoment` VALUES ('6', '15', '1', '0', '0', '', '2020-04-23 14:10:52', 'chu quang dai so', '');
INSERT INTO `tqc_recoment` VALUES ('7', '15', '1', '0', '0', '', '2020-04-23 14:11:11', 'chu quang dai tra loi comment nay', '');
INSERT INTO `tqc_recoment` VALUES ('8', '29', '1', '0', '0', '', '2020-04-23 14:48:25', 'chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay', '');
INSERT INTO `tqc_recoment` VALUES ('9', '29', '1', '0', '0', '', '2020-04-23 14:48:46', '', '');
INSERT INTO `tqc_recoment` VALUES ('10', '29', '1', '0', '0', '', '2020-04-23 14:50:42', 'chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay chu quang dai tra loi comment nay ', '');
INSERT INTO `tqc_recoment` VALUES ('11', '29', '1', '0', '0', '', '2020-04-23 14:52:23', '', '');
INSERT INTO `tqc_recoment` VALUES ('12', '29', '1', '0', '0', '', '2020-04-23 14:56:09', 'Nội dung trả lời bình luận của chu quang đại', '');
INSERT INTO `tqc_recoment` VALUES ('13', '29', '1', '0', '0', '', '2020-04-23 14:56:21', 'Nội dung trả lời bình luận của chu quang đạiNội dung trả lời bình luận của chu quang đạiNội dung trả lời bình luận của chu quang đạiNội dung trả lời bình luận của chu quang đạiNội dung trả lời bình luận của chu quang đạiNội dung trả lời bình luận của chu quang đại', '');
INSERT INTO `tqc_recoment` VALUES ('14', '28', '1', '0', '0', '', '2020-04-23 15:39:02', 'tra loi comment 8 by chu quang dai tra loi comment 8 by chu quang dai tra loi comment 8 by chu quang dai tra loi comment 8 by chu quang dai tra loi comment 8 by chu quang dai tra loi comment 8 by chu quang dai tra loi comment 8 by chu quang dai tra loi comment 8 by chu quang dai ', '');
INSERT INTO `tqc_recoment` VALUES ('15', '27', '1', '0', '0', '', '2020-04-23 16:19:04', 'ok', '');
INSERT INTO `tqc_recoment` VALUES ('16', '27', '1', '0', '0', '', '2020-04-23 16:19:15', 'okfd', '');
INSERT INTO `tqc_recoment` VALUES ('17', '27', '1', '0', '0', '', '2020-04-23 16:21:30', 'ok 2', '');
INSERT INTO `tqc_recoment` VALUES ('18', '27', '1', '0', '0', '', '2020-04-23 16:22:44', 'ok 3', '');
INSERT INTO `tqc_recoment` VALUES ('19', '27', '1', '0', '0', '', '2020-04-23 16:23:01', 'ádfsadfsd', '');
INSERT INTO `tqc_recoment` VALUES ('20', '27', '1', '0', '0', '', '2020-04-23 16:23:06', 'aaaaaaaaaaa', '');
INSERT INTO `tqc_recoment` VALUES ('21', '28', '1', '0', '0', '', '2020-04-23 16:32:42', 'sdfas', '');
INSERT INTO `tqc_recoment` VALUES ('22', '28', '1', '0', '0', '1', '2020-04-23 16:32:46', 'dfasdfsdf', '');
INSERT INTO `tqc_recoment` VALUES ('23', '29', '1', '0', '0', '', '2020-04-23 16:40:47', 'Nội dung trả lời bình luận của chu quang đạiNội dung trả lời bình luận của chu quang đạiNội dung trả lời bình luận của chu quang đạiNội dung', '');
INSERT INTO `tqc_recoment` VALUES ('24', '2', '1', '0', '0', '1', '2020-04-23 17:15:33', 'dadfdf', '');
INSERT INTO `tqc_recoment` VALUES ('25', '31', '1', '0', '0', '', '2020-04-23 17:22:11', 'ffffffffffffffff', '');
INSERT INTO `tqc_recoment` VALUES ('26', '31', '52', '0', '0', '', '2020-04-23 17:24:11', 'ok dai', '');
INSERT INTO `tqc_recoment` VALUES ('27', '33', '1', '0', '0', '', '2020-04-24 17:10:27', 'dasdgfasdf ', '1');
INSERT INTO `tqc_recoment` VALUES ('28', '38', '1', '0', '0', '', '2020-04-24 19:43:00', 'tra loi binh luan nay', '');
INSERT INTO `tqc_recoment` VALUES ('29', '36', '1', '0', '0', '1', '2020-04-24 21:28:53', 'ng đại tiêu đề tin tức chu quang đại tiêu đề tin tức chu quang đại tiêu đề tin tức chu quang đại tiêu đề tin tức chu quang đại tiêu đề tin tức chu quang', '');
INSERT INTO `tqc_recoment` VALUES ('30', '41', '1', '0', '0', '', '2020-04-26 19:07:21', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8585/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('31', '42', '1', '0', '0', '', '2020-04-26 19:11:43', '<p>asdf</p>', '');
INSERT INTO `tqc_recoment` VALUES ('32', '42', '1', '0', '0', '', '2020-04-26 19:11:46', '<p>asfsad</p>', '');
INSERT INTO `tqc_recoment` VALUES ('33', '50', '1', '0', '0', '', '2020-04-27 16:13:29', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--29.gif\" /></p>', '1');
INSERT INTO `tqc_recoment` VALUES ('34', '85', '1', '0', '0', '1', '2020-04-28 17:15:28', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('35', '88', '1', '0', '0', '', '2020-04-28 18:46:28', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--12.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('36', '98', '1', '0', '0', '', '2020-05-03 15:45:54', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('37', '98', '1', '0', '0', '', '2020-05-03 15:45:53', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('38', '98', '1', '0', '0', '', '2020-05-03 15:45:52', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('39', '98', '1', '0', '0', '', '2020-05-03 15:45:54', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('40', '98', '1', '0', '0', '', '2020-05-03 15:45:54', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('41', '98', '1', '0', '0', '', '2020-05-03 15:45:49', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('42', '98', '1', '0', '0', '', '2020-05-03 15:45:55', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('43', '98', '1', '0', '0', '', '2020-05-03 15:45:55', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--110.gif\" /></p>', '');
INSERT INTO `tqc_recoment` VALUES ('44', '106', '1', '0', '0', '', '2020-05-03 17:46:44', '<p><img width=\"50\" height=\"50\" src=\"http://localhost:8080/sansim_customer_war_exploded/assets/ckeditorForComment/ckeditor/plugins/hkemoji/sticker/onion/Onion--21.gif\" /></p>', '');
