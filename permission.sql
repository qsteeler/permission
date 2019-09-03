/*
 Navicat Premium Data Transfer

 Source Server         : Connection_SWP
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : permission

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 19/02/2019 16:27:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '技术部');
INSERT INTO `department` VALUES (2, '人事部');
INSERT INTO `department` VALUES (3, '财务部');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `inputtime` datetime(0) DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `dep_id` bigint(20) DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `dep_id`(`dep_id`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (23, 'gxq', NULL, '', '', 0, 0, 1, 'ab0d3829c9ae33c58d2a108555cea422');
INSERT INTO `employee` VALUES (48, 'swp', '2019-02-11 00:00:00', '13218037380', '13218037380@163.com', 1, 1, 1, '2ce599abccd0bcddb148d2d58fbfe6ab');
INSERT INTO `employee` VALUES (49, 'xxx', '2019-01-28 00:00:00', '13218037380', '13218037380@163.com', 0, 1, 2, '2e1a13948e8fd4ed1f01badde1be41b9');
INSERT INTO `employee` VALUES (53, 'cs', NULL, '', '', 1, 0, 1, 'fd384c6171e887ba24ced8a305ef57b3');

-- ----------------------------
-- Table structure for employee_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `employee_role_rel`;
CREATE TABLE `employee_role_rel`  (
  `eid` bigint(20) NOT NULL,
  `rid` bigint(20) NOT NULL,
  PRIMARY KEY (`eid`, `rid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  CONSTRAINT `employee_role_rel_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_role_rel_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_role_rel
-- ----------------------------
INSERT INTO `employee_role_rel` VALUES (23, 1);
INSERT INTO `employee_role_rel` VALUES (48, 1);
INSERT INTO `employee_role_rel` VALUES (49, 1);
INSERT INTO `employee_role_rel` VALUES (53, 2);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '系统管理', NULL, NULL, NULL);
INSERT INTO `menu` VALUES (2, '员工管理', '/employee', 1, 4);
INSERT INTO `menu` VALUES (3, '角色权限管理', '/role', 1, 5);
INSERT INTO `menu` VALUES (4, '菜单管理', '/menu', 1, 6);
INSERT INTO `menu` VALUES (6, '财务管理', '', NULL, NULL);
INSERT INTO `menu` VALUES (7, '公司流水', '/liushui', 6, NULL);
INSERT INTO `menu` VALUES (9, '人事管理', '/renshi', 1, NULL);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `pid` bigint(20) NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `presource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '员工添加', 'employee:add');
INSERT INTO `permission` VALUES (2, '员工删除', 'employee:delete');
INSERT INTO `permission` VALUES (3, '员工编辑', 'employee:edit');
INSERT INTO `permission` VALUES (4, '员工主页', 'employee:index');
INSERT INTO `permission` VALUES (5, '角色权限主页', 'role:index');
INSERT INTO `permission` VALUES (6, '菜单主页', 'menu:index');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` bigint(20) NOT NULL AUTO_INCREMENT,
  `rnum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '管理员');
INSERT INTO `role` VALUES (2, 'hr', '人事');
INSERT INTO `role` VALUES (4, 'manger', '经理');
INSERT INTO `role` VALUES (7, 'cfo', '首席财务官');

-- ----------------------------
-- Table structure for role_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_rel`;
CREATE TABLE `role_permission_rel`  (
  `rid` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  PRIMARY KEY (`rid`, `pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission_rel
-- ----------------------------
INSERT INTO `role_permission_rel` VALUES (1, 1);
INSERT INTO `role_permission_rel` VALUES (1, 2);
INSERT INTO `role_permission_rel` VALUES (1, 3);
INSERT INTO `role_permission_rel` VALUES (1, 4);
INSERT INTO `role_permission_rel` VALUES (1, 5);
INSERT INTO `role_permission_rel` VALUES (1, 6);
INSERT INTO `role_permission_rel` VALUES (2, 1);
INSERT INTO `role_permission_rel` VALUES (2, 4);
INSERT INTO `role_permission_rel` VALUES (3, 3);
INSERT INTO `role_permission_rel` VALUES (4, 1);
INSERT INTO `role_permission_rel` VALUES (4, 2);
INSERT INTO `role_permission_rel` VALUES (4, 3);
INSERT INTO `role_permission_rel` VALUES (4, 4);
INSERT INTO `role_permission_rel` VALUES (7, 1);
INSERT INTO `role_permission_rel` VALUES (7, 4);
INSERT INTO `role_permission_rel` VALUES (7, 5);

-- ----------------------------
-- Table structure for systemlog
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `optime` datetime(0) DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `function` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
