/*
 Navicat Premium Data Transfer

 Source Server         : root@localhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : erpsys

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 05/11/2019 09:04:19
*/

CREATE DATABASE `erpsys` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键id',
  `NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `CODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门代码',
  `NEWDATE` date NULL DEFAULT NULL COMMENT '成立日期',
  `DESCS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_UNIQUE`(`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('DEPID1001', '生产部', 'SCB1001', '2015-10-12', '协调规划统筹产品制造');
INSERT INTO `department` VALUES ('DEPID1002', '事业部', 'SYB1002', '2015-10-12', '统筹规划公司战略方向');
INSERT INTO `department` VALUES ('DEPID1003', '人事部', 'RSB1003', '2015-10-12', '统筹公司人员调配招聘协调培训');
INSERT INTO `department` VALUES ('DEPID1004', '市场部', 'SCB1004', '2015-10-12', '市场规划，统筹，开拓');
INSERT INTO `department` VALUES ('DEPID1005', '销售部', 'XSB1005', '2015-10-12', '产品推广宣传营销策略制定及执行');
INSERT INTO `department` VALUES ('DEPID1006', '研发部', 'YFB1006', '2015-10-12', '负责公司产品研发');
INSERT INTO `department` VALUES ('DEPID1007', '质检部', 'RSB1007', '2015-10-12', '公司产品质量监督检测');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `GENDER` int(11) NULL DEFAULT 1,
  `BIRTH` date NULL DEFAULT NULL,
  `ADDRESS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ENTRYDATE` date NULL DEFAULT NULL,
  `EMAIL` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_UNIQUE`(`ID`) USING BTREE,
  INDEX `FK_DEPID_EMP_idx`(`DEPID`) USING BTREE,
  CONSTRAINT `FK_DEPID_EMP` FOREIGN KEY (`DEPID`) REFERENCES `department` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('emp1001', '郭靖', 1, '1997-04-22', '大漠沙如雪', '13345669988', '2017-04-12', 'guojing@163.com', 'DEPID1006', NULL);
INSERT INTO `emp` VALUES ('emp1002', '黄蓉', 0, '1998-04-08', '桃花岛', '13115447522', '2017-04-12', 'hrong@163.com', 'DEPID1006', NULL);
INSERT INTO `emp` VALUES ('emp1003', '东邪', 1, '1971-05-08', '桃花岛', '13325996633', '2015-04-12', 'dongxie@163.com', 'DEPID1006', NULL);
INSERT INTO `emp` VALUES ('emp1004', '洪七公', 1, '1970-05-08', '贫穷岛屿', '13966550020', '2015-04-12', 'hqg@163.com', 'DEPID1004', NULL);
INSERT INTO `emp` VALUES ('emp1005', '丘处机', 1, '1980-05-10', '道观', '15544885665', '2015-06-12', 'qcj@163.com', 'DEPID1004', NULL);
INSERT INTO `emp` VALUES ('emp1006', '梅超风', 0, '1982-10-10', '骷髅岛', '13222556687', '2017-06-12', 'meifeng@163.com', 'DEPID1001', NULL);
INSERT INTO `emp` VALUES ('emp1007', '陈旋风', 1, '1982-10-10', '桃花岛', '13355006699', '2017-06-12', 'cxf@163.com', 'DEPID1001', NULL);
INSERT INTO `emp` VALUES ('emp1008', '王重阳', 1, '1970-05-25', '重阳宫', '15633201447', '2015-04-12', 'wcy@163.com', 'DEPID1001', NULL);
INSERT INTO `emp` VALUES ('emp1009', '马玉', 1, '1980-05-10', '重阳宫', '14455889900', '2017-06-11', 'mayu@163.com', 'DEPID1002', NULL);
INSERT INTO `emp` VALUES ('emp1010', '周伯通', 1, '1974-05-10', '流浪街', '15500556699', '2015-03-12', 'zbt@163.com', 'DEPID1002', NULL);
INSERT INTO `emp` VALUES ('emp1011', '铁木真', 1, '1974-06-10', '蒙古包', '13350639978', '2015-04-12', 'tmz@163.com', 'DEPID1002', NULL);
INSERT INTO `emp` VALUES ('emp1012', '完颜洪烈', 1, '1976-09-25', '蒙古包', '13255023699', '2015-03-18', 'wyhl@163.com', 'DEPID1003', NULL);
INSERT INTO `emp` VALUES ('emp1013', '华筝公主', 0, '1997-10-22', '蒙古包', '13122005489', '2017-04-12', 'hzgz@163.com', 'DEPID1003', NULL);
INSERT INTO `emp` VALUES ('emp1014', '托雷', 1, '1995-10-22', '蒙古包', '13122005488', '2017-04-12', 'tuolei@163.com', 'DEPID1003', NULL);
INSERT INTO `emp` VALUES ('emp1015', '徐茂公', 1, '1971-05-08', '瓦岗寨', '17788002599', '2017-04-15', 'xmg@163.com', 'DEPID1005', NULL);
INSERT INTO `emp` VALUES ('emp1016', '李蓉蓉', 0, '1997-10-22', '宫廷', '15633220011', '2017-09-12', 'lrongrong@163.com', 'DEPID1005', NULL);
INSERT INTO `emp` VALUES ('emp1017', '李师师', 0, '1997-10-22', '红袖楼', '15420369959', '2018-09-12', 'lss@163.com', 'DEPID1005', NULL);
INSERT INTO `emp` VALUES ('emp1018', '秦琼', 1, '1992-11-22', '瓦岗寨', '15066339985', '2018-09-12', 'qinqiong@163.com', 'DEPID1005', NULL);
INSERT INTO `emp` VALUES ('emp1019', '罗成', 1, '1994-11-22', '瓦岗寨', '15699804788', '2017-04-15', 'luocheng@163.com', 'DEPID1005', NULL);
INSERT INTO `emp` VALUES ('emp1020', '程咬金', 1, '1980-05-10', '瓦岗寨', '15066332033', '2017-09-12', 'cyj@163.com', 'DEPID1007', NULL);
INSERT INTO `emp` VALUES ('emp1021', '单雄信', 1, '1978-05-10', '二贤庄', '16022559988', '2015-03-12', 'sxx@163.com', 'DEPID1007', NULL);

-- ----------------------------
-- Table structure for jurisdic
-- ----------------------------
DROP TABLE IF EXISTS `jurisdic`;
CREATE TABLE `jurisdic`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限id 主键',
  `NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限短名称',
  `STATUS` int(11) NULL DEFAULT 1 COMMENT '状态 1启用 0 废弃',
  `DESCS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_UNIQUE`(`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jurisdic
-- ----------------------------
INSERT INTO `jurisdic` VALUES ('meeting1001', 'create', 1, '会议信息添加');
INSERT INTO `jurisdic` VALUES ('mess1001', 'create', 1, '添加留言');
INSERT INTO `jurisdic` VALUES ('mess1003', 'reader', 1, '留言查阅');
INSERT INTO `jurisdic` VALUES ('product1001', 'create', 1, '商品添加');
INSERT INTO `jurisdic` VALUES ('product1002', 'update', 1, '商品修改');
INSERT INTO `jurisdic` VALUES ('product1003', 'reader', 1, '商品查询');
INSERT INTO `jurisdic` VALUES ('sales1001', 'create', 1, '销售信息添加');
INSERT INTO `jurisdic` VALUES ('sales1002', 'update', 1, '销售信息修改');
INSERT INTO `jurisdic` VALUES ('sales1003', 'reader', 1, '销售信息查询');
INSERT INTO `jurisdic` VALUES ('self1002', 'update', 1, '修改个人信息');
INSERT INTO `jurisdic` VALUES ('system1001', 'create', 1, '添加系统操作管理');
INSERT INTO `jurisdic` VALUES ('system1002', 'update', 1, '更新系统操作');
INSERT INTO `jurisdic` VALUES ('system1003', 'reader', 1, '系统数据查询');
INSERT INTO `jurisdic` VALUES ('system1004', 'delete', 1, '系统数据删除');

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `TITLE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会议主题',
  `CONTENT` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会议主体内容',
  `STARTDATE` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '实行日期时间',
  `DURATION` int(11) NULL DEFAULT NULL COMMENT '预计时长(分钟)',
  `PARTICIPANT` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '与会人员',
  `ADDRESS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '与会场所',
  `DESCS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `STATUS` int(11) NULL DEFAULT NULL COMMENT '会议状态 0 待执行 1 已执行 -1 已取消',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ID_UNIQUE`(`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES ('1', '未来规划', '规划公司未来发展战略', '2019-03-20 00:00:00.000000', 120, 'emp1001,emp1002,emp1003', '总部会议室', NULL, 1);
INSERT INTO `meeting` VALUES ('2', '产品会议', '主流产品迭代讨论', '2018-11-20 14:00:00.000000', 60, 'emp1004,emp1005,emp1006', '总部会议室', NULL, 1);
INSERT INTO `meeting` VALUES ('3', '市场开拓', '海外市场推广讨论', '2019-10-30 09:00:00.000000', 90, 'emp1004,emp1005', '总部会议室', NULL, 0);
INSERT INTO `meeting` VALUES ('4', '春季销售会议', '2020年春季销售计划讨论', '2019-10-31 00:00:00.000000', 120, 'emp1015,emp1016,emp1017,emp1018,emp1019', '总部会议室', NULL, 0);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'id 主键',
  `CONTENT` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言内容',
  `EMPID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外键作用，可以为空，如果是空则为匿名留言',
  `TYPES` int(11) NOT NULL DEFAULT 1 COMMENT '留言类型 1 建设性意见 ; 2 投诉举报; 3 其他',
  `DODATE` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '留言日期时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品ID',
  `CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品代码',
  `NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `PRICE` float(18, 2) NULL DEFAULT NULL COMMENT '产品单价',
  `QUANTITY` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `DESCS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色ID，主键',
  `NAME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `STATUS` int(11) NULL DEFAULT 1 COMMENT '状态1启用 0 废弃',
  `DESCS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `JURISDICTION` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限范围引用',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('commonuser', '普通用户', 1, '修改个人信息权限', 'self002');
INSERT INTO `role` VALUES ('meetingadmin', '会议管理员', 1, '添加，更新，删除会议权限', 'meeting1001');
INSERT INTO `role` VALUES ('messuser', '留言用户', 1, '普通用户', 'mess1001,mess1003');
INSERT INTO `role` VALUES ('productadmin', '商品信息管理员', 1, '添加，更新，查询商品权限', 'product1001,product1002,product1003');
INSERT INTO `role` VALUES ('salesadmin', '销售主管', 1, '维护销售信息', 'sales1001,sales1002,sales1003');
INSERT INTO `role` VALUES ('superadmin', '超级管理员', 1, '系统超级管理员，拥有多项操作权限', 'system1001,system1002,system1003,system1004');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SALDATE` date NULL DEFAULT NULL,
  `PROID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `EMPID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SALQUANTITY` int(11) NOT NULL COMMENT '销售数量',
  `PRICE` float(18, 2) NULL DEFAULT NULL COMMENT '实际销售单价',
  `DESCS` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_EMPID_SALES`(`EMPID`) USING BTREE,
  INDEX `FK_PROID_SALES`(`PROID`) USING BTREE,
  CONSTRAINT `FK_EMPID_SALES` FOREIGN KEY (`EMPID`) REFERENCES `emp` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PROID_SALES` FOREIGN KEY (`PROID`) REFERENCES `product` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sysusers
-- ----------------------------
DROP TABLE IF EXISTS `sysusers`;
CREATE TABLE `sysusers`  (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `NAME` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录名称',
  `PASSWORD` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `GRANTED` int(11) NULL DEFAULT 0 COMMENT '是否已经被授权使用系统1 是 0 否',
  `EMPID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工id 外键',
  `LASTTIME` timestamp(6) NULL DEFAULT NULL COMMENT '最后登录系统时间',
  `ROLES` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `ID_UNIQUE`(`ID`) USING BTREE,
  INDEX `FK_EMPID_SYSUSERS_idx`(`EMPID`) USING BTREE,
  CONSTRAINT `FK_EMPID_SYSUSERS` FOREIGN KEY (`EMPID`) REFERENCES `emp` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户登录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sysusers
-- ----------------------------
INSERT INTO `sysusers` VALUES ('sys1001', 'wangchongyang', '111111', 1, 'emp1008', NULL, 'superadmin,productadmin');
INSERT INTO `sysusers` VALUES ('sys1002', 'zhoubotong', '111111', 1, 'emp1010', NULL, 'superadmin,productadmin');
INSERT INTO `sysusers` VALUES ('sys1003', 'xumaogong', '111111', 1, 'emp1015', NULL, 'salesadmin');
INSERT INTO `sysusers` VALUES ('sys1004', 'lirongrong', '111111', 1, 'emp1016', NULL, 'commonuser');
INSERT INTO `sysusers` VALUES ('sys1005', 'qiuchuji', '111111', 1, 'emp1004', NULL, 'commonuser');
INSERT INTO `sysusers` VALUES ('sys1006', 'meichaofeng', '111111', 1, 'emp1006', NULL, 'commonuser');
INSERT INTO `sysusers` VALUES ('sys1007', 'tuolei', '111111', 1, 'emp1014', NULL, 'commonuser,meetingadmin');
INSERT INTO `sysusers` VALUES ('sys1008', 'qinqiong', '111111', 1, 'emp1018', NULL, 'messuser');

SET FOREIGN_KEY_CHECKS = 1;
