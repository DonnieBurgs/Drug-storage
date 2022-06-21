/*
 Navicat Premium Data Transfer

 Source Server         : liuyi
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : ly

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/06/2022 21:49:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug`  (
  `DrugId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `DrugNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品编号',
  `DrugName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名',
  `DrugExpirydata` int NOT NULL COMMENT '保质期/月',
  `DrugVendor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '厂商',
  `DrugSpec` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格',
  `DrugPlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存放地点',
  `DrugWarning` int NOT NULL COMMENT '库存预警',
  `DrugUsed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用法用量',
  `DrugRemark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`DrugId`) USING BTREE,
  UNIQUE INDEX `no`(`DrugNo`) USING BTREE COMMENT '编号唯一',
  UNIQUE INDEX `place`(`DrugPlace`) USING BTREE COMMENT '存放地点唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品信息表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES (23, '6913869012142', '黄连上清丸', 24, '陕西汉王药业股份有限公司', '每袋装6克', '一货架二层三行', 30, '口服，一次3-6克，一日两次', '脾胃虚寒者禁用');
INSERT INTO `drug` VALUES (24, '6922242721649', '阿莫西林胶囊', 24, '国药集团汕头金石制药有限公司', '0.5g', 'A2', 50, '口服，成人一次0.5g', '成人一次0.5g,每6 ~8小时1次。小儿一日剂量按体重20~40mg/kg,每8小时1次;3个月以下婴儿一日剂量按体重30mg/kg，每12小时1次。');
INSERT INTO `drug` VALUES (25, '6916119070237', '人工牛黄甲硝唑胶囊', 36, '石药集团', '每粒含甲硝唑200mg,人工牛黄5mg', 'B1', 50, '口服，一次两粒，一日三次', '用于急性智齿冠周炎、局部牙槽脓肿、牙髓炎、根尖周炎等');
INSERT INTO `drug` VALUES (26, '6937913310886', '清咽片', 36, '吉林省银诺克药业有限公司', '每基片重0.3克', 'C1', 20, '口服，一次4-6片，一日2次', '密封，置阴凉（不超过20度）干燥处');
INSERT INTO `drug` VALUES (28, '1223132321', '999感冒灵', 36, '999感冒灵厂商', '0.5', '一货架二层一行', 50, '11', NULL);

-- ----------------------------
-- Table structure for drug_in
-- ----------------------------
DROP TABLE IF EXISTS `drug_in`;
CREATE TABLE `drug_in`  (
  `DrugInId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `DrugInNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品编号',
  `DrugInName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名称',
  `DrugSupplierName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商',
  `DrugInTime` date NOT NULL COMMENT '入库时间',
  `DrugInBatch` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次',
  `DrugInFirm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '厂商',
  `DrugInNum` int NOT NULL COMMENT '数量',
  `DrugInProductionTime` date NOT NULL COMMENT '生产时间',
  PRIMARY KEY (`DrugInId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品入库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drug_in
-- ----------------------------
INSERT INTO `drug_in` VALUES (55, '6913869012142', '黄连上清丸', '陕西汉王药业股份有限公司', '2022-03-18', '088111', '陕西汉王药业股份有限公司', 200, '2021-11-26');
INSERT INTO `drug_in` VALUES (56, '6922242721649', '阿莫西林胶囊', '国药集团汕头金石制药有限公司', '2022-02-18', '211109', '国药集团汕头金石制药有限公司', 500, '2022-02-10');
INSERT INTO `drug_in` VALUES (57, '6916119070237', '人工牛黄甲硝唑胶囊', '石药集团欧意药业有限公司', '2022-03-18', '366210820', '石药集团', 60, '2022-03-01');
INSERT INTO `drug_in` VALUES (58, '6922242721649', '阿莫西林胶囊', '国药集团汕头金石制药有限公司', '2022-03-18', '211109', '国药集团汕头金石制药有限公司', 300, '2022-03-18');
INSERT INTO `drug_in` VALUES (59, '6937913310886', '清咽片', '吉林省银诺克药业有限公司', '2022-03-18', '006', '吉林省银诺克药业有限公司', 50, '2022-01-01');
INSERT INTO `drug_in` VALUES (60, '6913869012142', '黄连上清丸', '陕西汉王药业股份有限公司', '2022-03-19', '1', '陕西汉王药业股份有限公司', 100, '2020-07-18');
INSERT INTO `drug_in` VALUES (61, '6922242721649', '阿莫西林胶囊', '国药集团汕头金石制药有限公司', '2022-04-12', '123', '国药集团汕头金石制药有限公司', 20, '2022-04-06');
INSERT INTO `drug_in` VALUES (62, '6937913310886', '清咽片', '陕西汉王药业股份有限公司', '2022-04-12', '765435', '吉林省银诺克药业有限公司', 120, '2022-04-12');
INSERT INTO `drug_in` VALUES (63, '6922242721649', '阿莫西林胶囊', '陕西汉王药业股份有限公司', '2022-04-23', '5431', '国药集团汕头金石制药有限公司', 500, '2022-04-23');
INSERT INTO `drug_in` VALUES (64, '6913869012142', '黄连上清丸', '国药集团汕头金石制药有限公司', '2022-04-23', '12', '陕西汉王药业股份有限公司', 1, '2022-04-23');
INSERT INTO `drug_in` VALUES (65, '6913869012142', '黄连上清丸', '陕西汉王药业股份有限公司', '2022-04-23', '9876', '陕西汉王药业股份有限公司', 20, '2022-04-12');
INSERT INTO `drug_in` VALUES (66, '6916119070237', '人工牛黄甲硝唑胶囊', '陕西汉王药业股份有限公司', '2022-04-23', '999', '石药集团', 30, '2022-04-01');
INSERT INTO `drug_in` VALUES (73, '6922242721649', '阿莫西林胶囊', '石药集团欧意药业有限公司', '2022-04-25', '14213', '国药集团汕头金石制药有限公司', 200, '2022-04-03');
INSERT INTO `drug_in` VALUES (74, '6937913310886', '清咽片', '国药集团汕头金石制药有限公司', '2022-04-26', '12343', '吉林省银诺克药业有限公司', 500, '2022-04-01');
INSERT INTO `drug_in` VALUES (75, '1223132321', '999感冒灵', '陕西汉王药业股份有限公司', '2022-04-26', '6538432', '999感冒灵厂商', 600, '2022-04-04');
INSERT INTO `drug_in` VALUES (76, '6937913310886', '清咽片', '陕西汉王药业股份有限公司', '2022-05-04', '567', '吉林省银诺克药业有限公司', 20, '2022-05-04');
INSERT INTO `drug_in` VALUES (77, '6913869012142', '黄连上清丸', '陕西汉王药业股份有限公司', '2022-05-13', '332', '陕西汉王药业股份有限公司', 30, '2019-05-08');
INSERT INTO `drug_in` VALUES (78, '6922242721649', '阿莫西林胶囊', '国药集团汕头金石制药有限公司', '2022-05-13', '45642', '国药集团汕头金石制药有限公司', 30, '2022-05-04');
INSERT INTO `drug_in` VALUES (85, '6922242721649', '阿莫西林胶囊', '国药集团汕头金石制药有限公司', '2022-05-18', '9574224', '国药集团汕头金石制药有限公司', 100, '2022-05-18');
INSERT INTO `drug_in` VALUES (86, '6922242721649', '阿莫西林胶囊', '诚信药业', '2022-05-20', '34563742', '国药集团汕头金石制药有限公司', 67, '2022-05-08');
INSERT INTO `drug_in` VALUES (87, '6937913310886', '清咽片', '陕西汉王药业股份有限公司', '2022-05-20', '12341112', '吉林省银诺克药业有限公司', 90, '2022-05-25');
INSERT INTO `drug_in` VALUES (88, '6922242721649', '阿莫西林胶囊', '诚信药业', '2022-05-31', '5665324', '国药集团汕头金石制药有限公司', 67, '2022-05-08');

-- ----------------------------
-- Table structure for drug_out
-- ----------------------------
DROP TABLE IF EXISTS `drug_out`;
CREATE TABLE `drug_out`  (
  `DrugOutId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `DrugOutName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名称',
  `DrugOutNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品编号',
  `DrugOutTime` date NOT NULL COMMENT '出库时间',
  `DrugOutBatch` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次',
  `DrugOutNum` int NOT NULL COMMENT '数量',
  PRIMARY KEY (`DrugOutId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品出库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drug_out
-- ----------------------------
INSERT INTO `drug_out` VALUES (52, '黄连上清丸', '6913869012142', '2022-03-18', '088111', 20);
INSERT INTO `drug_out` VALUES (53, '阿莫西林胶囊', '6922242721649', '2022-02-18', '211109', 50);
INSERT INTO `drug_out` VALUES (54, '人工牛黄甲硝唑胶囊', '6916119070237', '2022-03-18', '366210820', 30);
INSERT INTO `drug_out` VALUES (55, '清咽片', '6937913310886', '2022-03-18', '006', 5);
INSERT INTO `drug_out` VALUES (56, '黄连上清丸', '6913869012142', '2022-03-19', '1', 100);
INSERT INTO `drug_out` VALUES (58, '阿莫西林胶囊', '6922242721649', '2022-04-12', '211109', 70);
INSERT INTO `drug_out` VALUES (59, '人工牛黄甲硝唑胶囊', '6916119070237', '2022-04-12', '366210820', 20);
INSERT INTO `drug_out` VALUES (60, '人工牛黄甲硝唑胶囊', '6916119070237', '2022-04-23', '999', 21);
INSERT INTO `drug_out` VALUES (62, '阿莫西林胶囊', '6922242721649', '2022-04-25', '14213', 1100);
INSERT INTO `drug_out` VALUES (63, '清咽片', '6937913310886', '2022-04-26', '12343', 300);
INSERT INTO `drug_out` VALUES (64, '999感冒灵', '1223132321', '2022-04-26', '6538432', 200);
INSERT INTO `drug_out` VALUES (65, '清咽片', '6937913310886', '2022-05-04', '567', 20);
INSERT INTO `drug_out` VALUES (66, '阿莫西林胶囊', '6922242721649', '2022-05-12', '211109', 20);
INSERT INTO `drug_out` VALUES (67, '999感冒灵', '1223132321', '2022-05-12', '6538432', 10);
INSERT INTO `drug_out` VALUES (68, '阿莫西林胶囊', '6922242721649', '2022-05-20', '45642', 40);

-- ----------------------------
-- Table structure for drug_supplier
-- ----------------------------
DROP TABLE IF EXISTS `drug_supplier`;
CREATE TABLE `drug_supplier`  (
  `SupplierId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `SupplierName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `SupplierAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商地址',
  `SupplierUser` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人',
  `SupplierPhone` bigint NOT NULL COMMENT '联系电话',
  `CreateTime` date NOT NULL COMMENT '添加时间',
  `SupplierRemark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`SupplierId`) USING BTREE,
  UNIQUE INDEX `name`(`SupplierName`) USING BTREE COMMENT '供应商名称'
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drug_supplier
-- ----------------------------
INSERT INTO `drug_supplier` VALUES (6, '陕西汉王药业股份有限公司', '陕西省汉中市汉台区迎宾西路', '张际', 8162233, '2022-03-18', '合作多次');
INSERT INTO `drug_supplier` VALUES (7, '国药集团汕头金石制药有限公司', '汕头市泰山路36号', '李乐', 18691072052, '2022-03-18', '合作多次');
INSERT INTO `drug_supplier` VALUES (8, '石药集团欧意药业有限公司', '石家庄经济技术开发区扬子路88号', '赵军', 95001111, '2022-03-18', '');
INSERT INTO `drug_supplier` VALUES (9, '吉林省银诺克药业有限公司', '吉林省镇赉经济开发区幸福东路999号', '刘一', 82565606, '2022-03-18', '洋森');
INSERT INTO `drug_supplier` VALUES (11, '诚信药业', '西安市', '张无忌', 18691076786, '2022-05-20', '修改备注');

-- ----------------------------
-- Table structure for drug_untread
-- ----------------------------
DROP TABLE IF EXISTS `drug_untread`;
CREATE TABLE `drug_untread`  (
  `UntreadId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `UntreadNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品编号',
  `UntreadDrugName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名称',
  `UntreadSupplierName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商',
  `UntreadDrugVendor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '厂商',
  `UntreadNum` int NOT NULL COMMENT '退回数量',
  `UntreadTime` date NOT NULL COMMENT '退货日期',
  `UntreadReason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '退货原因',
  PRIMARY KEY (`UntreadId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品退回记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drug_untread
-- ----------------------------
INSERT INTO `drug_untread` VALUES (8, '6922242721649', '阿莫西林胶囊', '国药集团汕头金石制药有限公司', '国药集团汕头金石制药有限公司', 2, '2022-03-18', '药品受潮了');
INSERT INTO `drug_untread` VALUES (9, '6913869012142', '黄连上清丸', '陕西汉王药业股份有限公司', '陕西汉王药业股份有限公司', 60, '2022-03-18', '存在质量问题');
INSERT INTO `drug_untread` VALUES (10, '6922242721649', '阿莫西林胶囊', '国药集团汕头金石制药有限公司', '国药集团汕头金石制药有限公司', 1, '2022-03-18', '受潮了');
INSERT INTO `drug_untread` VALUES (11, '6922242721649', '阿莫西林胶囊', '石药集团欧意药业有限公司', '国药集团汕头金石制药有限公司', 30, '2022-04-25', '药品损坏');
INSERT INTO `drug_untread` VALUES (23, '6916119070237', '人工牛黄甲硝唑胶囊', '陕西汉王药业股份有限公司', '石药集团', 18, '2022-04-25', '药品质量存在问题');
INSERT INTO `drug_untread` VALUES (25, '6922242721649', '阿莫西林胶囊', '国药集团汕头金石制药有限公司', '国药集团汕头金石制药有限公司', 960, '2022-04-25', '1');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `StockId` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `StockDrugNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品编号',
  `StockDrugName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名',
  `StockNum` int UNSIGNED NOT NULL COMMENT '库存',
  PRIMARY KEY (`StockId`) USING BTREE,
  UNIQUE INDEX `no`(`StockDrugNo`) USING BTREE COMMENT '唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES (89, '6913869012142', '黄连上清丸', 175);
INSERT INTO `stock` VALUES (91, '6922242721649', '阿莫西林胶囊', 1104);
INSERT INTO `stock` VALUES (93, '6916119070237', '人工牛黄甲硝唑胶囊', 1);
INSERT INTO `stock` VALUES (99, '6937913310886', '清咽片', 455);
INSERT INTO `stock` VALUES (145, '1223132321', '999感冒灵', 392);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2022-01-13 16:17:44', 'admin', '2022-02-09 09:46:24', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-01-13 16:17:44', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-01-13 16:17:44', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'false', 'Y', 'admin', '2022-01-13 16:17:44', 'admin', '2022-02-23 17:11:30', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-01-13 16:17:44', 'admin', '2022-04-12 09:48:50', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '桑镇中心医院', 0, '刘依', '15888888888', '123@qq.com', '0', '0', 'admin', '2022-01-13 16:17:44', 'admin', '2022-05-28 10:18:52');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '东桥村卫生室', 1, '刘依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-13 16:17:44', 'admin', '2022-05-28 10:18:45');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-12 14:31:42');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-12 20:07:13');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-12 20:10:37');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-13 20:25:22');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-13 21:09:40');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-13 21:09:44');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-13 21:24:10');
INSERT INTO `sys_logininfor` VALUES (8, 'admi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：admi 不存在', '2022-05-13 21:24:28');
INSERT INTO `sys_logininfor` VALUES (9, 'admi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：admi 不存在', '2022-05-13 21:24:40');
INSERT INTO `sys_logininfor` VALUES (10, 'admi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：admi 不存在', '2022-05-13 21:24:44');
INSERT INTO `sys_logininfor` VALUES (11, 'admi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：admi 不存在', '2022-05-13 21:25:01');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-13 21:26:16');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-13 21:36:46');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-13 21:36:58');
INSERT INTO `sys_logininfor` VALUES (15, 'admi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：admi 不存在', '2022-05-13 21:37:17');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-13 21:38:09');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 17:43:50');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 18:16:03');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 19:40:29');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-15 21:16:02');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 18:16:43');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-16 21:28:22');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-16 21:28:31');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-17 22:53:37');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-17 22:53:42');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-18 13:34:58');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-18 13:35:39');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-18 13:35:44');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-18 13:35:49');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-05-18 13:35:59');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-18 13:36:49');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-18 15:06:57');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-18 20:17:51');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-20 19:14:33');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-25 17:34:40');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-25 17:37:27');
INSERT INTO `sys_logininfor` VALUES (37, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-25 17:37:34');
INSERT INTO `sys_logininfor` VALUES (38, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-25 17:39:09');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-25 17:39:16');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-26 13:38:08');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 21:00:08');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-27 21:02:33');
INSERT INTO `sys_logininfor` VALUES (43, 'ry', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-27 21:04:24');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 08:31:01');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 10:10:43');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-28 10:11:53');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 10:14:20');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-28 10:29:25');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 11:45:26');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-28 11:51:51');
INSERT INTO `sys_logininfor` VALUES (51, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-28 12:09:24');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 10:38:19');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-05-31 10:40:55');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-05-31 10:41:31');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2129 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-01-13 16:17:44', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-01-13 16:17:44', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '1', '0', 'system:role:list', 'peoples', 'admin', '2022-01-13 16:17:44', 'admin', '2022-04-16 19:00:20', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '1', '0', 'system:menu:list', 'tree-table', 'admin', '2022-01-13 16:17:44', 'admin', '2022-05-04 22:10:22', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-01-13 16:17:44', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-01-13 16:17:44', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 0, 5, 'log', '', '', 1, 0, 'M', '0', '0', '', 'logininfor', 'admin', '2022-01-13 16:17:44', 'admin', '2022-03-03 09:41:32', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-01-13 16:17:44', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-01-13 16:17:44', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-01-13 16:17:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '药品管理', 0, 4, 'drug', NULL, NULL, 1, 0, 'M', '0', '0', '', 'button', 'admin', '2022-01-14 19:06:21', 'admin', '2022-01-14 19:13:09', '药品管理目录');
INSERT INTO `sys_menu` VALUES (2094, '药品信息管理', 2051, 1, 'info', 'drug/info/index', NULL, 1, 0, 'C', '0', '0', 'drug:info:list', 'message', 'admin', '2022-02-24 08:57:24', 'admin', '2022-03-02 10:03:43', '药品信息管理菜单');
INSERT INTO `sys_menu` VALUES (2095, '药品信息管理查询', 2094, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:info:query', '#', 'admin', '2022-02-24 08:57:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2096, '药品信息管理新增', 2094, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:info:add', '#', 'admin', '2022-02-24 08:57:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2097, '药品信息管理修改', 2094, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:info:edit', '#', 'admin', '2022-02-24 08:57:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2098, '药品信息管理删除', 2094, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:info:remove', '#', 'admin', '2022-02-24 08:57:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '药品信息管理导出', 2094, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:info:export', '#', 'admin', '2022-02-24 08:57:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2100, '药品入库', 2051, 2, 'drugin', 'drug/drugin/index', NULL, 1, 0, 'C', '0', '0', 'drug:drugin:list', 'education', 'admin', '2022-02-24 09:00:30', 'admin', '2022-03-03 09:40:44', '药品入库菜单');
INSERT INTO `sys_menu` VALUES (2101, '药品入库查询', 2100, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:drugin:query', '#', 'admin', '2022-02-24 09:00:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '药品入库新增', 2100, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:drugin:add', '#', 'admin', '2022-02-24 09:00:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '药品入库修改', 2100, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:drugin:edit', '#', 'admin', '2022-02-24 09:00:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '药品入库删除', 2100, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:drugin:remove', '#', 'admin', '2022-02-24 09:00:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '药品入库导出', 2100, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:drugin:export', '#', 'admin', '2022-02-24 09:00:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '药品出库', 2051, 3, 'out', 'drug/out/index', NULL, 1, 0, 'C', '0', '0', 'drug:out:list', 'excel', 'admin', '2022-02-24 09:02:31', 'admin', '2022-03-03 09:40:52', '出库菜单');
INSERT INTO `sys_menu` VALUES (2107, '出库查询', 2106, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:out:query', '#', 'admin', '2022-02-24 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '出库新增', 2106, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:out:add', '#', 'admin', '2022-02-24 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '出库修改', 2106, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:out:edit', '#', 'admin', '2022-02-24 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '出库删除', 2106, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:out:remove', '#', 'admin', '2022-02-24 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '出库导出', 2106, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:out:export', '#', 'admin', '2022-02-24 09:02:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2112, '药品库存', 2051, 4, 'stock', 'drug/stock/index', NULL, 1, 1, 'C', '0', '0', 'drug:stock:list', 'table', 'admin', '2022-02-24 09:02:44', 'admin', '2022-03-02 11:09:42', '库存菜单');
INSERT INTO `sys_menu` VALUES (2113, '库存查询', 2112, 1, '#', '', NULL, 1, 1, 'F', '0', '0', 'drug:stock:query', '#', 'admin', '2022-02-24 09:02:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2114, '库存新增', 2112, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:stock:add', '#', 'admin', '2022-02-24 09:02:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '库存修改', 2112, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:stock:edit', '#', 'admin', '2022-02-24 09:02:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '库存删除', 2112, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:stock:remove', '#', 'admin', '2022-02-24 09:02:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '库存导出', 2112, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:stock:export', '#', 'admin', '2022-02-24 09:02:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2118, '供应商信息', 2051, 0, 'supplier', 'drug/supplier/index', NULL, 1, 0, 'C', '0', '0', 'drug:supplier:list', 'build', 'admin', '2022-03-02 10:56:55', 'admin', '2022-03-03 09:38:53', '供应商信息菜单');
INSERT INTO `sys_menu` VALUES (2119, '供应商信息查询', 2118, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:supplier:query', '#', 'admin', '2022-03-02 10:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2120, '供应商信息新增', 2118, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:supplier:add', '#', 'admin', '2022-03-02 10:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2121, '供应商信息修改', 2118, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:supplier:edit', '#', 'admin', '2022-03-02 10:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2122, '供应商信息删除', 2118, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:supplier:remove', '#', 'admin', '2022-03-02 10:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '供应商信息导出', 2118, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:supplier:export', '#', 'admin', '2022-03-02 10:56:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2124, '药品退回', 2051, 5, 'untread', 'drug/untread/index', NULL, 1, 0, 'C', '0', '0', 'drug:untread:list', 'edit', 'admin', '2022-03-02 10:57:13', 'admin', '2022-03-03 09:41:19', '药品退回菜单');
INSERT INTO `sys_menu` VALUES (2125, '药品退回查询', 2124, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:untread:query', '#', 'admin', '2022-03-02 10:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '药品退回新增', 2124, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:untread:add', '#', 'admin', '2022-03-02 10:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, '药品退回修改', 2124, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:untread:edit', '#', 'admin', '2022-03-02 10:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2128, '药品退回删除', 2124, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:untread:remove', '#', 'admin', '2022-03-02 10:57:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2129, '药品退回导出', 2124, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'drug:untread:export', '#', 'admin', '2022-03-02 10:57:13', '', NULL, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (2, '出库', 1, 'com.ruoyi.liuyb.controller.DrugOutController.add()', 'POST', 1, 'admin', NULL, '/drug/out', '127.0.0.1', '内网IP', '{\"drugoutname\":\"阿莫西林胶囊\",\"params\":{},\"drugoutid\":66,\"drugoutbatch\":\"211109\",\"drugoutnum\":20,\"drugoutno\":6922242721649}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-12 14:32:13');
INSERT INTO `sys_oper_log` VALUES (3, '出库', 1, 'com.ruoyi.liuyb.controller.DrugOutController.add()', 'POST', 1, 'admin', NULL, '/drug/out', '127.0.0.1', '内网IP', '{\"drugoutname\":\"999感冒灵\",\"params\":{},\"drugoutid\":67,\"drugoutbatch\":\"6538432\",\"drugoutnum\":10,\"drugoutno\":1223132321}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-12 14:32:42');
INSERT INTO `sys_oper_log` VALUES (4, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1647532800000,\"supplierid\":8,\"params\":{},\"supplierphone\":95001111,\"suppliername\":\"石药集团欧意药业有限公司\",\"supplierremark\":\"1\",\"supplieraddress\":\"石家庄经济技术开发区扬子路88号\",\"supplieruser\":\"王五\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-12 20:49:37');
INSERT INTO `sys_oper_log` VALUES (5, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1647532800000,\"supplierid\":8,\"params\":{},\"supplierphone\":95001111,\"suppliername\":\"石药集团欧意药业有限公司\",\"supplierremark\":\"\",\"supplieraddress\":\"石家庄经济技术开发区扬子路88号\",\"supplieruser\":\"王五\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-12 20:50:37');
INSERT INTO `sys_oper_log` VALUES (6, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1620144000000,\"params\":{},\"druginname\":\"黄连上清丸\",\"druginbatch\":\"332\",\"druginno\":6913869012142,\"druginnum\":30,\"druginfirm\":\"陕西汉王药业股份有限公司\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":77}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-13 21:38:52');
INSERT INTO `sys_oper_log` VALUES (7, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651593600000,\"params\":{},\"druginname\":\"阿莫西林胶囊\",\"druginbatch\":\"45642\",\"druginno\":6922242721649,\"druginnum\":30,\"druginfirm\":\"国药集团汕头金石制药有限公司\",\"drugsuppliername\":\"国药集团汕头金石制药有限公司\",\"druginid\":78}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-13 21:47:51');
INSERT INTO `sys_oper_log` VALUES (8, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651507200000,\"params\":{},\"druginname\":\"999感冒灵\",\"druginbatch\":\"1\",\"druginno\":1223132321,\"druginnum\":1,\"druginfirm\":\"999感冒灵厂商\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":79}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-13 21:49:43');
INSERT INTO `sys_oper_log` VALUES (9, '药品入库', 3, 'com.ruoyi.liuyb.controller.DrugInController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/drugin/79', '127.0.0.1', '内网IP', '{druginids=79}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 21:50:34');
INSERT INTO `sys_oper_log` VALUES (10, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651420800000,\"params\":{},\"druginname\":\"999感冒灵\",\"druginbatch\":\"1\",\"druginno\":1223132321,\"druginnum\":1,\"druginfirm\":\"999感冒灵厂商\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":80}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-13 21:50:57');
INSERT INTO `sys_oper_log` VALUES (11, '药品入库', 3, 'com.ruoyi.liuyb.controller.DrugInController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/drugin/80', '127.0.0.1', '内网IP', '{druginids=80}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 21:52:17');
INSERT INTO `sys_oper_log` VALUES (12, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651507200000,\"params\":{},\"druginname\":\"黄连上清丸\",\"druginbatch\":\"1\",\"druginno\":6913869012142,\"druginnum\":1,\"druginfirm\":\"陕西汉王药业股份有限公司\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":81}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-13 21:52:40');
INSERT INTO `sys_oper_log` VALUES (13, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651593600000,\"params\":{},\"druginname\":\"黄连上清丸\",\"druginbatch\":\"1\",\"druginno\":6913869012142,\"druginnum\":1,\"druginfirm\":\"陕西汉王药业股份有限公司\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":82}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-13 21:55:20');
INSERT INTO `sys_oper_log` VALUES (14, '药品入库', 3, 'com.ruoyi.liuyb.controller.DrugInController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/drugin/82', '127.0.0.1', '内网IP', '{druginids=82}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 21:55:39');
INSERT INTO `sys_oper_log` VALUES (15, '药品入库', 3, 'com.ruoyi.liuyb.controller.DrugInController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/drugin/81', '127.0.0.1', '内网IP', '{druginids=81}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 21:55:42');
INSERT INTO `sys_oper_log` VALUES (16, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651680000000,\"params\":{},\"druginname\":\"黄连上清丸\",\"druginbatch\":\"1\",\"druginno\":6913869012142,\"druginnum\":1,\"druginfirm\":\"陕西汉王药业股份有限公司\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":83}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-13 21:55:50');
INSERT INTO `sys_oper_log` VALUES (17, '药品入库', 2, 'com.ruoyi.liuyb.controller.DrugInController.edit()', 'PUT', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651680000000,\"params\":{},\"drugexpirydata\":24,\"druginname\":\"黄连上清丸\",\"drugintime\":1652371200000,\"druginbatch\":\"2\",\"druginno\":6913869012142,\"druginnum\":1,\"time\":723,\"druginfirm\":\"陕西汉王药业股份有限公司\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":83}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 21:56:11');
INSERT INTO `sys_oper_log` VALUES (18, '药品入库', 3, 'com.ruoyi.liuyb.controller.DrugInController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/drugin/83', '127.0.0.1', '内网IP', '{druginids=83}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 21:56:17');
INSERT INTO `sys_oper_log` VALUES (19, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651680000000,\"params\":{},\"druginname\":\"黄连上清丸\",\"druginbatch\":\"1\",\"druginno\":6913869012142,\"druginnum\":1,\"druginfirm\":\"陕西汉王药业股份有限公司\",\"drugsuppliername\":\"国药集团汕头金石制药有限公司\",\"druginid\":84}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-13 22:03:00');
INSERT INTO `sys_oper_log` VALUES (20, '药品入库', 3, 'com.ruoyi.liuyb.controller.DrugInController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/drugin/84', '127.0.0.1', '内网IP', '{druginids=84}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 22:03:05');
INSERT INTO `sys_oper_log` VALUES (21, '药品信息管理', 1, 'com.ruoyi.liuyb.controller.DrugController.add()', 'POST', 1, 'admin', NULL, '/drug/info', '127.0.0.1', '内网IP', '{\"drugno\":732563438,\"drugname\":\"头孢\",\"params\":{},\"drugexpirydata\":12,\"drugwarning\":50,\"drugused\":\"一天一次\",\"drugid\":46,\"drugvendor\":\"头孢生产商\",\"drugplace\":\"二药架三行\",\"drugspec\":\"0.5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 22:28:22');
INSERT INTO `sys_oper_log` VALUES (22, '药品信息管理', 2, 'com.ruoyi.liuyb.controller.DrugController.edit()', 'PUT', 1, 'admin', NULL, '/drug/info', '127.0.0.1', '内网IP', '{\"drugno\":732563438,\"drugname\":\"头孢\",\"params\":{},\"drugexpirydata\":12,\"drugwarning\":50,\"drugused\":\"一天一次\",\"drugid\":46,\"drugvendor\":\"头孢生产商\",\"drugplace\":\"二货架一层三行\",\"drugspec\":\"0.5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 22:29:00');
INSERT INTO `sys_oper_log` VALUES (23, '药品信息管理', 3, 'com.ruoyi.liuyb.controller.DrugController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/info/46', '127.0.0.1', '内网IP', '{drugids=46}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 22:30:38');
INSERT INTO `sys_oper_log` VALUES (24, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1647532800000,\"supplierid\":6,\"params\":{},\"supplierphone\":8162233,\"suppliername\":\"陕西汉王药业股份有限公司\",\"supplierremark\":\"修改备注\",\"supplieraddress\":\"陕西省汉中市汉台区迎宾西路\",\"supplieruser\":\"张无忌\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-13 22:39:35');
INSERT INTO `sys_oper_log` VALUES (25, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1652614829000,\"remark\":\"超级管理员\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"刘一\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"/profile/avatar/2022/02/25/96736d0b-23ce-4d64-b0e8-2cbba713f4f8.jpeg\",\"dept\":{\"deptName\":\"药品科技\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"createTime\":1642061864000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-15 21:17:44');
INSERT INTO `sys_oper_log` VALUES (26, '药品入库', 2, 'com.ruoyi.liuyb.controller.DrugInController.edit()', 'PUT', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1557244800000,\"params\":{},\"drugexpirydata\":24,\"druginname\":\"黄连上清丸\",\"drugintime\":1652371200000,\"druginbatch\":\"332\",\"druginno\":6913869012142,\"druginnum\":30,\"time\":354,\"druginfirm\":\"陕西汉王药业股份有限公司\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":77}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-16 19:38:49');
INSERT INTO `sys_oper_log` VALUES (27, '药品入库', 2, 'com.ruoyi.liuyb.controller.DrugInController.edit()', 'PUT', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1588521600000,\"params\":{},\"drugexpirydata\":24,\"druginname\":\"阿莫西林胶囊\",\"drugintime\":1652371200000,\"druginbatch\":\"45642\",\"druginno\":6922242721649,\"druginnum\":30,\"time\":719,\"druginfirm\":\"国药集团汕头金石制药有限公司\",\"drugsuppliername\":\"国药集团汕头金石制药有限公司\",\"druginid\":78}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-16 20:06:30');
INSERT INTO `sys_oper_log` VALUES (28, '药品入库', 2, 'com.ruoyi.liuyb.controller.DrugInController.edit()', 'PUT', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651593600000,\"params\":{},\"drugexpirydata\":24,\"druginname\":\"阿莫西林胶囊\",\"drugintime\":1652371200000,\"druginbatch\":\"45642\",\"druginno\":6922242721649,\"druginnum\":30,\"time\":-12,\"druginfirm\":\"国药集团汕头金石制药有限公司\",\"drugsuppliername\":\"国药集团汕头金石制药有限公司\",\"druginid\":78}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-16 20:06:39');
INSERT INTO `sys_oper_log` VALUES (29, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1652803200000,\"params\":{},\"druginname\":\"阿莫西林胶囊\",\"druginbatch\":\"9574224\",\"druginno\":6922242721649,\"druginnum\":100,\"druginfirm\":\"国药集团汕头金石制药有限公司\",\"drugsuppliername\":\"国药集团汕头金石制药有限公司\",\"druginid\":85}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-18 13:59:43');
INSERT INTO `sys_oper_log` VALUES (30, '药品信息管理', 1, 'com.ruoyi.liuyb.controller.DrugController.add()', 'POST', 1, 'admin', NULL, '/drug/info', '127.0.0.1', '内网IP', '{\"drugno\":47804610484,\"drugname\":\"速效救心丸\",\"params\":{},\"drugexpirydata\":36,\"drugwarning\":50,\"drugused\":\"成人每次6粒，每天5次\",\"drugid\":47,\"drugvendor\":\"天津市中新药业集团股份有限公司第六中药厂\",\"drugplace\":\"一货架三层\",\"drugremark\":\"密封，置阴凉干燥处\",\"drugspec\":\"60粒\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-18 14:10:43');
INSERT INTO `sys_oper_log` VALUES (31, '药品信息管理', 3, 'com.ruoyi.liuyb.controller.DrugController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/info/47', '127.0.0.1', '内网IP', '{drugids=47}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-18 14:17:05');
INSERT INTO `sys_oper_log` VALUES (32, '药品信息管理', 1, 'com.ruoyi.liuyb.controller.DrugController.add()', 'POST', 1, 'admin', NULL, '/drug/info', '127.0.0.1', '内网IP', '{\"drugno\":47804610484,\"drugname\":\"速效救心丸\",\"params\":{},\"drugexpirydata\":36,\"drugwarning\":50,\"drugused\":\"成人每次6粒，每天5次\",\"drugid\":48,\"drugvendor\":\"天津市中新药业集团股份有限公司第六中药厂\",\"drugplace\":\"一货架三层\",\"drugremark\":\"密封，置阴凉干燥处\",\"drugspec\":\"60粒\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-18 14:20:15');
INSERT INTO `sys_oper_log` VALUES (33, '药品信息管理', 3, 'com.ruoyi.liuyb.controller.DrugController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/info/48', '127.0.0.1', '内网IP', '{drugids=48}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-18 14:20:20');
INSERT INTO `sys_oper_log` VALUES (34, '药品信息管理', 1, 'com.ruoyi.liuyb.controller.DrugController.add()', 'POST', 1, 'admin', NULL, '/drug/info', '127.0.0.1', '内网IP', '{\"drugno\":47804610484,\"drugname\":\"速效救心丸\",\"params\":{},\"drugexpirydata\":36,\"drugwarning\":50,\"drugused\":\"成人每次6粒，每天5次\",\"drugid\":49,\"drugvendor\":\"天津中新药业集团股份有限公司第六中药厂\",\"drugplace\":\"一货架三层\",\"drugremark\":\"密封，置阴凉干燥处\",\"drugspec\":\"60粒\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-18 14:22:40');
INSERT INTO `sys_oper_log` VALUES (35, '药品信息管理', 3, 'com.ruoyi.liuyb.controller.DrugController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/info/49', '127.0.0.1', '内网IP', '{drugids=49}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-18 14:22:45');
INSERT INTO `sys_oper_log` VALUES (36, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1647532800000,\"supplierid\":6,\"params\":{},\"supplierphone\":8162233,\"suppliername\":\"陕西汉王药业股份有限公司\",\"supplierremark\":\"首次合作\",\"supplieraddress\":\"陕西省汉中市汉台区迎宾西路\",\"supplieruser\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-18 14:31:52');
INSERT INTO `sys_oper_log` VALUES (37, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1647532800000,\"supplierid\":6,\"params\":{},\"supplierphone\":8162233,\"suppliername\":\"陕西汉王药业股份有限公司\",\"supplierremark\":\"合作多次\",\"supplieraddress\":\"陕西省汉中市汉台区迎宾西路\",\"supplieruser\":\"张无忌\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-18 14:38:32');
INSERT INTO `sys_oper_log` VALUES (38, '供应商信息', 1, 'com.ruoyi.liuyb.controller.DrugSupplierController.add()', 'POST', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"supplierid\":11,\"params\":{},\"supplierphone\":18691076786,\"suppliername\":\"诚信药业\",\"supplierremark\":\"\",\"supplieraddress\":\"西安市\",\"supplieruser\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-20 19:17:41');
INSERT INTO `sys_oper_log` VALUES (39, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651939200000,\"params\":{},\"druginname\":\"阿莫西林胶囊\",\"druginbatch\":\"34563742\",\"druginno\":6922242721649,\"druginnum\":67,\"druginfirm\":\"国药集团汕头金石制药有限公司\",\"drugsuppliername\":\"诚信药业\",\"druginid\":86}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-20 19:21:06');
INSERT INTO `sys_oper_log` VALUES (40, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1652976000000,\"supplierid\":11,\"params\":{},\"supplierphone\":18691076786,\"suppliername\":\"诚信药业\",\"supplierremark\":\"修改备注\",\"supplieraddress\":\"西安市\",\"supplieruser\":\"张无忌\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-20 19:27:00');
INSERT INTO `sys_oper_log` VALUES (41, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1647532800000,\"supplierid\":6,\"params\":{},\"supplierphone\":8162233,\"suppliername\":\"陕西汉王药业股份有限公司\",\"supplierremark\":\"合作多次\",\"supplieraddress\":\"陕西省汉中市汉台区迎宾西路\",\"supplieruser\":\"张际\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-20 19:27:55');
INSERT INTO `sys_oper_log` VALUES (42, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1652976000000,\"supplierid\":11,\"params\":{},\"supplierphone\":18691076786,\"suppliername\":\"诚信药业\",\"supplierremark\":\"修改备注\",\"supplieraddress\":\"西安市\",\"supplieruser\":\"张无忌\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-20 19:28:07');
INSERT INTO `sys_oper_log` VALUES (43, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1652976000000,\"supplierid\":11,\"params\":{},\"supplierphone\":18691076786,\"suppliername\":\"诚信药业\",\"supplierremark\":\"\",\"supplieraddress\":\"西安市\",\"supplieruser\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-20 19:28:56');
INSERT INTO `sys_oper_log` VALUES (44, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651507200000,\"params\":{},\"druginname\":\"清咽片\",\"druginbatch\":\"12341112\",\"druginno\":6937913310886,\"druginnum\":90,\"druginfirm\":\"吉林省银诺克药业有限公司\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":87}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-20 19:38:01');
INSERT INTO `sys_oper_log` VALUES (45, '出库', 1, 'com.ruoyi.liuyb.controller.DrugOutController.add()', 'POST', 1, 'admin', NULL, '/drug/out', '127.0.0.1', '内网IP', '{\"drugoutname\":\"阿莫西林胶囊\",\"params\":{},\"drugoutid\":68,\"drugoutbatch\":\"45642\",\"drugoutnum\":40,\"drugoutno\":6922242721649}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-20 19:38:28');
INSERT INTO `sys_oper_log` VALUES (46, '药品入库', 2, 'com.ruoyi.liuyb.controller.DrugInController.edit()', 'PUT', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1653408000000,\"params\":{},\"drugexpirydata\":36,\"druginname\":\"清咽片\",\"drugintime\":1652976000000,\"druginbatch\":\"12341112\",\"druginno\":6937913310886,\"druginnum\":90,\"time\":1074,\"druginfirm\":\"吉林省银诺克药业有限公司\",\"drugsuppliername\":\"陕西汉王药业股份有限公司\",\"druginid\":87}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-25 17:35:20');
INSERT INTO `sys_oper_log` VALUES (47, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"东桥村卫生室\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1642061864000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:18:08');
INSERT INTO `sys_oper_log` VALUES (48, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"桑镇中心医院\",\"leader\":\"若依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1642061864000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"123@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:18:33');
INSERT INTO `sys_oper_log` VALUES (49, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"东桥村卫生室\",\"leader\":\"刘依\",\"deptId\":101,\"orderNum\":\"1\",\"delFlag\":\"0\",\"params\":{},\"parentId\":100,\"createBy\":\"admin\",\"children\":[],\"createTime\":1642061864000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0,100\",\"email\":\"ry@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:18:45');
INSERT INTO `sys_oper_log` VALUES (50, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"桑镇中心医院\",\"leader\":\"刘依\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1642061864000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"123@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:18:52');
INSERT INTO `sys_oper_log` VALUES (51, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"\",\"postId\":1,\"params\":{},\"createBy\":\"admin\",\"createTime\":1642061864000,\"updateBy\":\"admin\",\"postName\":\"院长\",\"postCode\":\"ceo\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:19:21');
INSERT INTO `sys_oper_log` VALUES (52, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"2\",\"flag\":false,\"remark\":\"\",\"postId\":4,\"params\":{},\"createBy\":\"admin\",\"createTime\":1642061864000,\"updateBy\":\"admin\",\"postName\":\"药品管理员\",\"postCode\":\"user\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:19:40');
INSERT INTO `sys_oper_log` VALUES (53, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":103,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:22:27');
INSERT INTO `sys_oper_log` VALUES (54, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"admin\",\"params\":{},\"userId\":103,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:22:30');
INSERT INTO `sys_oper_log` VALUES (55, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1652976000000,\"supplierid\":11,\"params\":{},\"supplierphone\":18691076786,\"suppliername\":\"诚信药业\",\"supplierremark\":\"\",\"supplieraddress\":\"西安市\",\"supplieruser\":\"刘阳\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:23:48');
INSERT INTO `sys_oper_log` VALUES (56, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1647532800000,\"supplierid\":7,\"params\":{},\"supplierphone\":18691072052,\"suppliername\":\"国药集团汕头金石制药有限公司\",\"supplierremark\":\"合作多次\",\"supplieraddress\":\"汕头市泰山路36号\",\"supplieruser\":\"李乐\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:24:15');
INSERT INTO `sys_oper_log` VALUES (57, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1647532800000,\"supplierid\":8,\"params\":{},\"supplierphone\":95001111,\"suppliername\":\"石药集团欧意药业有限公司\",\"supplierremark\":\"\",\"supplieraddress\":\"石家庄经济技术开发区扬子路88号\",\"supplieruser\":\"赵军\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-28 10:24:31');
INSERT INTO `sys_oper_log` VALUES (58, '药品入库', 1, 'com.ruoyi.liuyb.controller.DrugInController.add()', 'POST', 1, 'admin', NULL, '/drug/drugin', '127.0.0.1', '内网IP', '{\"druginproductiontime\":1651939200000,\"params\":{},\"druginname\":\"阿莫西林胶囊\",\"druginbatch\":\"5665324\",\"druginno\":6922242721649,\"druginnum\":67,\"druginfirm\":\"国药集团汕头金石制药有限公司\",\"drugsuppliername\":\"诚信药业\",\"druginid\":88}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"msg\":\"操作成功\",\"code\":200}}', 0, NULL, '2022-05-31 10:46:50');
INSERT INTO `sys_oper_log` VALUES (59, '药品信息管理', 1, 'com.ruoyi.liuyb.controller.DrugController.add()', 'POST', 1, 'admin', NULL, '/drug/info', '127.0.0.1', '内网IP', '{\"drugno\":47804610484,\"drugname\":\"头孢\",\"params\":{},\"drugexpirydata\":36,\"drugwarning\":30,\"drugused\":\"一次一个\",\"drugid\":50,\"drugvendor\":\"头孢厂商\",\"drugplace\":\"二货架四层\",\"drugspec\":\"0.5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 10:55:51');
INSERT INTO `sys_oper_log` VALUES (60, '药品信息管理', 3, 'com.ruoyi.liuyb.controller.DrugController.remove()', 'DELETE', 1, 'admin', NULL, '/drug/info/50', '127.0.0.1', '内网IP', '{drugids=50}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 10:56:25');
INSERT INTO `sys_oper_log` VALUES (61, '供应商信息', 2, 'com.ruoyi.liuyb.controller.DrugSupplierController.edit()', 'PUT', 1, 'admin', NULL, '/drug/supplier', '127.0.0.1', '内网IP', '{\"createtime\":1652976000000,\"supplierid\":11,\"params\":{},\"supplierphone\":18691076786,\"suppliername\":\"诚信药业\",\"supplierremark\":\"修改备注\",\"supplieraddress\":\"西安市\",\"supplieruser\":\"张无忌\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-05-31 10:59:32');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '院长', 1, '0', 'admin', '2022-01-13 16:17:44', 'admin', '2022-05-28 10:19:21', '');
INSERT INTO `sys_post` VALUES (4, 'user', '药品管理员', 2, '0', 'admin', '2022-01-13 16:17:44', 'admin', '2022-05-28 10:19:40', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-01-13 16:17:44', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '药品管理员', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-01-13 16:17:44', 'admin', '2022-04-16 18:59:57', '药品管理员');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2051);
INSERT INTO `sys_role_menu` VALUES (2, 2094);
INSERT INTO `sys_role_menu` VALUES (2, 2095);
INSERT INTO `sys_role_menu` VALUES (2, 2096);
INSERT INTO `sys_role_menu` VALUES (2, 2097);
INSERT INTO `sys_role_menu` VALUES (2, 2098);
INSERT INTO `sys_role_menu` VALUES (2, 2099);
INSERT INTO `sys_role_menu` VALUES (2, 2100);
INSERT INTO `sys_role_menu` VALUES (2, 2101);
INSERT INTO `sys_role_menu` VALUES (2, 2102);
INSERT INTO `sys_role_menu` VALUES (2, 2103);
INSERT INTO `sys_role_menu` VALUES (2, 2104);
INSERT INTO `sys_role_menu` VALUES (2, 2105);
INSERT INTO `sys_role_menu` VALUES (2, 2106);
INSERT INTO `sys_role_menu` VALUES (2, 2107);
INSERT INTO `sys_role_menu` VALUES (2, 2108);
INSERT INTO `sys_role_menu` VALUES (2, 2109);
INSERT INTO `sys_role_menu` VALUES (2, 2110);
INSERT INTO `sys_role_menu` VALUES (2, 2111);
INSERT INTO `sys_role_menu` VALUES (2, 2112);
INSERT INTO `sys_role_menu` VALUES (2, 2113);
INSERT INTO `sys_role_menu` VALUES (2, 2114);
INSERT INTO `sys_role_menu` VALUES (2, 2115);
INSERT INTO `sys_role_menu` VALUES (2, 2116);
INSERT INTO `sys_role_menu` VALUES (2, 2117);
INSERT INTO `sys_role_menu` VALUES (2, 2118);
INSERT INTO `sys_role_menu` VALUES (2, 2119);
INSERT INTO `sys_role_menu` VALUES (2, 2120);
INSERT INTO `sys_role_menu` VALUES (2, 2121);
INSERT INTO `sys_role_menu` VALUES (2, 2122);
INSERT INTO `sys_role_menu` VALUES (2, 2123);
INSERT INTO `sys_role_menu` VALUES (2, 2124);
INSERT INTO `sys_role_menu` VALUES (2, 2125);
INSERT INTO `sys_role_menu` VALUES (2, 2126);
INSERT INTO `sys_role_menu` VALUES (2, 2127);
INSERT INTO `sys_role_menu` VALUES (2, 2128);
INSERT INTO `sys_role_menu` VALUES (2, 2129);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '刘一', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2022/02/25/96736d0b-23ce-4d64-b0e8-2cbba713f4f8.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-05-31 10:41:31', 'admin', '2022-01-13 16:17:44', '', '2022-05-31 10:41:31', '超级管理员');
INSERT INTO `sys_user` VALUES (2, 101, 'ry', 'ly', '00', '123@qq.com', '15666666666', '0', '/profile/avatar/2022/03/18/c8d1419e-bcc8-45fc-b2ec-fa565c85a96f.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-05-27 21:04:24', 'admin', '2022-01-13 16:17:44', 'admin', '2022-05-27 21:04:24', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 4);
INSERT INTO `sys_user_post` VALUES (103, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);

SET FOREIGN_KEY_CHECKS = 1;
