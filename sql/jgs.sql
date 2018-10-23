/*
 Navicat Premium Data Transfer

 Source Server         : mysql_win
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : jgs

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 23/10/2018 22:29:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES (1, '江西XXX公司', '陆仟', '18655554444', '江西省九江市庐山区', '这个老板很抠门');
INSERT INTO `t_customer` VALUES (2, '铁马数据XXX公司', '林文', '18655555555', '北京市朝阳区', '有钱的老板');

-- ----------------------------
-- Table structure for t_customer_return_list
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list`;
CREATE TABLE `t_customer_return_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `customer_return_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户退单单号',
  `state` int(11) NULL DEFAULT NULL COMMENT '交易状态：1 已付，2 未付',
  `amount_paid` float NOT NULL COMMENT '实付金额',
  `amount_payable` float NOT NULL COMMENT '应付金额',
  `customer_return_date` datetime(0) NULL DEFAULT NULL COMMENT '客户退单日期',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '退单客户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKd55ju83f0ntixagdvdrsmw10c`(`user_id`) USING BTREE,
  INDEX `FKl0ahdwa8slkocbfe57opembfx`(`customer_id`) USING BTREE,
  CONSTRAINT `FKd55ju83f0ntixagdvdrsmw10c` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKl0ahdwa8slkocbfe57opembfx` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户退单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_customer_return_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_customer_return_list_goods`;
CREATE TABLE `t_customer_return_list_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总价',
  `customer_return_list_id` int(11) NULL DEFAULT NULL COMMENT '对应客户退单表id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类别id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKtqt67mbn96lxn8hvtl4piblhi`(`customer_return_list_id`) USING BTREE,
  INDEX `FK4sm5si4swbj3gae46jfk441yx`(`type_id`) USING BTREE,
  CONSTRAINT `FK4sm5si4swbj3gae46jfk441yx` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtqt67mbn96lxn8hvtl4piblhi` FOREIGN KEY (`customer_return_list_id`) REFERENCES `t_customer_return_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户退单商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_damage_list
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list`;
CREATE TABLE `t_damage_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `damage_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报损单单号',
  `damage_date` datetime(0) NULL DEFAULT NULL COMMENT '报损日期',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpn094ma69sch1icjc2gu7xus`(`user_id`) USING BTREE,
  CONSTRAINT `FKpn094ma69sch1icjc2gu7xus` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报损单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_damage_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_list_goods`;
CREATE TABLE `t_damage_list_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总价',
  `damage_list_id` int(11) NULL DEFAULT NULL COMMENT '对应报损单表id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类别id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbf5m8mm3gctrnuubr9xkjamj8`(`damage_list_id`) USING BTREE,
  INDEX `FKdbdfmp09hlf2raktincwroe9n`(`type_id`) USING BTREE,
  CONSTRAINT `FKbf5m8mm3gctrnuubr9xkjamj8` FOREIGN KEY (`damage_list_id`) REFERENCES `t_damage_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdbdfmp09hlf2raktincwroe9n` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报损单商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号',
  `purchasing_price` float NOT NULL COMMENT '采购价格、成本价，如价格变动，算平均值',
  `last_purchasing_price` float NOT NULL COMMENT '上次采购价格',
  `selling_price` float NOT NULL COMMENT '出售价格',
  `inventory_quantity` int(11) NOT NULL COMMENT '库存数量',
  `min_num` int(11) NOT NULL COMMENT '库存下限',
  `producer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生产商',
  `state` int(11) NOT NULL COMMENT '商品状态：0 初始化状态，1 期初库存入仓库，2 有进货或者销售单据',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类别id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKlxnna5ngumghp4f279mmbjtyo`(`type_id`) USING BTREE,
  CONSTRAINT `FKlxnna5ngumghp4f279mmbjtyo` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类别id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图标',
  `state` int(11) NULL DEFAULT NULL COMMENT '节点类型：1 有子节点，0 无子节点',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '父类别id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goodstype
-- ----------------------------
INSERT INTO `t_goodstype` VALUES (1, '所有类别', 'icon-folderOpen', 1, -1);
INSERT INTO `t_goodstype` VALUES (10, '井冈食品', 'icon-folder', 1, 1);
INSERT INTO `t_goodstype` VALUES (11, '井冈烟', 'icon-folder', 0, 1);
INSERT INTO `t_goodstype` VALUES (12, '井冈酒', 'icon-folder', 1, 1);
INSERT INTO `t_goodstype` VALUES (13, '井冈茶', 'icon-folder', 1, 1);
INSERT INTO `t_goodstype` VALUES (14, '其他', 'icon-folder', 1, 1);
INSERT INTO `t_goodstype` VALUES (21, '饼干', 'icon-folder', 0, 10);
INSERT INTO `t_goodstype` VALUES (22, '水果', 'icon-folder', 0, 10);
INSERT INTO `t_goodstype` VALUES (31, '啤酒', 'icon-folder', 0, 12);
INSERT INTO `t_goodstype` VALUES (32, '白酒', 'icon-folder', 0, 12);
INSERT INTO `t_goodstype` VALUES (41, '红茶', 'icon-folder', 0, 13);
INSERT INTO `t_goodstype` VALUES (42, '菊花茶', 'icon-folder', 0, 13);
INSERT INTO `t_goodstype` VALUES (51, '文创纪念品', 'icon-folder', 0, 14);

-- ----------------------------
-- Table structure for t_goodsunit
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsunit`;
CREATE TABLE `t_goodsunit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品单位id',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品单位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_goodsunit
-- ----------------------------
INSERT INTO `t_goodsunit` VALUES (1, '个');
INSERT INTO `t_goodsunit` VALUES (2, '袋');
INSERT INTO `t_goodsunit` VALUES (3, '盒');
INSERT INTO `t_goodsunit` VALUES (4, '箱');
INSERT INTO `t_goodsunit` VALUES (5, '台');
INSERT INTO `t_goodsunit` VALUES (6, '包');
INSERT INTO `t_goodsunit` VALUES (7, '件');
INSERT INTO `t_goodsunit` VALUES (8, '条');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统日志id',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKbvn5yabu3vqwvtjoh32i9r4ip`(`user_id`) USING BTREE,
  CONSTRAINT `FKbvn5yabu3vqwvtjoh32i9r4ip` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4285 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (3535, '查询商品信息', '查询操作', '2018-06-26 01:36:20', 1);
INSERT INTO `t_log` VALUES (3536, '添加商品类别信息[id=null, name=男装, state=0, icon=icon-folder, pId=1]', '添加操作', '2018-06-26 01:36:23', 1);
INSERT INTO `t_log` VALUES (3537, '查询商品类别信息', '查询操作', '2018-06-26 01:36:23', 1);
INSERT INTO `t_log` VALUES (3538, '查询商品信息', '查询操作', '2018-06-26 01:36:31', 1);
INSERT INTO `t_log` VALUES (3539, '添加商品类别信息[id=null, name=女装, state=0, icon=icon-folder, pId=1]', '添加操作', '2018-06-26 01:36:33', 1);
INSERT INTO `t_log` VALUES (3540, '查询商品类别信息', '查询操作', '2018-06-26 01:36:33', 1);
INSERT INTO `t_log` VALUES (3541, '查询商品信息', '查询操作', '2018-06-26 01:36:39', 1);
INSERT INTO `t_log` VALUES (3542, '添加商品类别信息[id=null, name=中性服装, state=0, icon=icon-folder, pId=1]', '添加操作', '2018-06-26 01:36:40', 1);
INSERT INTO `t_log` VALUES (3543, '查询商品类别信息', '查询操作', '2018-06-26 01:36:40', 1);
INSERT INTO `t_log` VALUES (3544, '查询商品信息', '查询操作', '2018-06-26 01:36:57', 1);
INSERT INTO `t_log` VALUES (3545, '添加商品类别信息[id=null, name=T恤, state=0, icon=icon-folder, pId=28]', '添加操作', '2018-06-26 01:36:59', 1);
INSERT INTO `t_log` VALUES (3546, '查询商品类别信息', '查询操作', '2018-06-26 01:36:59', 1);
INSERT INTO `t_log` VALUES (3547, '查询商品信息', '查询操作', '2018-06-26 01:37:03', 1);
INSERT INTO `t_log` VALUES (3548, '添加商品类别信息[id=null, name=风衣, state=0, icon=icon-folder, pId=28]', '添加操作', '2018-06-26 01:37:06', 1);
INSERT INTO `t_log` VALUES (3549, '查询商品类别信息', '查询操作', '2018-06-26 01:37:06', 1);
INSERT INTO `t_log` VALUES (3550, '查询商品信息', '查询操作', '2018-06-26 01:37:10', 1);
INSERT INTO `t_log` VALUES (3551, '添加商品类别信息[id=null, name=皮衣, state=0, icon=icon-folder, pId=28]', '添加操作', '2018-06-26 01:37:11', 1);
INSERT INTO `t_log` VALUES (3552, '查询商品类别信息', '查询操作', '2018-06-26 01:37:11', 1);
INSERT INTO `t_log` VALUES (3553, '查询商品信息', '查询操作', '2018-06-26 01:37:15', 1);
INSERT INTO `t_log` VALUES (3554, '添加商品类别信息[id=null, name=衬衫, state=0, icon=icon-folder, pId=28]', '添加操作', '2018-06-26 01:37:17', 1);
INSERT INTO `t_log` VALUES (3555, '查询商品类别信息', '查询操作', '2018-06-26 01:37:17', 1);
INSERT INTO `t_log` VALUES (3556, '查询商品信息', '查询操作', '2018-06-26 01:37:18', 1);
INSERT INTO `t_log` VALUES (3557, '添加商品类别信息[id=null, name=衬衫, state=0, icon=icon-folder, pId=29]', '添加操作', '2018-06-26 01:37:19', 1);
INSERT INTO `t_log` VALUES (3558, '查询商品类别信息', '查询操作', '2018-06-26 01:37:19', 1);
INSERT INTO `t_log` VALUES (3559, '查询商品信息', '查询操作', '2018-06-26 01:37:25', 1);
INSERT INTO `t_log` VALUES (3560, '添加商品类别信息[id=null, name=上装, state=0, icon=icon-folder, pId=29]', '添加操作', '2018-06-26 01:37:27', 1);
INSERT INTO `t_log` VALUES (3561, '查询商品类别信息', '查询操作', '2018-06-26 01:37:27', 1);
INSERT INTO `t_log` VALUES (3562, '查询商品信息', '查询操作', '2018-06-26 01:37:28', 1);
INSERT INTO `t_log` VALUES (3563, '查询商品类别信息', '查询操作', '2018-06-26 01:37:41', 1);
INSERT INTO `t_log` VALUES (3564, '查询商品信息', '查询操作', '2018-06-26 01:37:41', 1);
INSERT INTO `t_log` VALUES (3565, '查询商品单位信息', '查询操作', '2018-06-26 01:37:41', 1);
INSERT INTO `t_log` VALUES (3566, '查询商品信息', '查询操作', '2018-06-26 01:37:41', 1);
INSERT INTO `t_log` VALUES (3567, '查询商品单位信息', '查询操作', '2018-06-26 01:37:41', 1);
INSERT INTO `t_log` VALUES (3568, '查询商品信息', '查询操作', '2018-06-26 01:37:42', 1);
INSERT INTO `t_log` VALUES (3569, '添加商品类别信息[id=null, name=裙子, state=0, icon=icon-folder, pId=29]', '添加操作', '2018-06-26 01:37:49', 1);
INSERT INTO `t_log` VALUES (3570, '查询商品类别信息', '查询操作', '2018-06-26 01:37:49', 1);
INSERT INTO `t_log` VALUES (3571, '查询商品信息', '查询操作', '2018-06-26 01:38:01', 1);
INSERT INTO `t_log` VALUES (3572, '查询商品信息', '查询操作', '2018-06-26 01:38:05', 1);
INSERT INTO `t_log` VALUES (3573, '查询商品类别信息', '查询操作', '2018-06-26 01:38:41', 1);
INSERT INTO `t_log` VALUES (3574, '添加商品信息[id=null, code=0001, name=Gurbaks男士短袖t恤夏季迷彩体恤, model=GT2214, unit=件, purchasingPrice=78.0, sellingPrice=99.0, inventoryQuantity=0, minNum=999, producer=gurbaks旗舰店, remarks=Gurbaks男士短袖t恤夏季迷彩体恤圆领韩版潮男上衣假两件宽松衣服\r\n夏季潮流新品短袖T恤，个性迷彩潮男Tee]', '添加操作', '2018-06-26 01:39:47', 1);
INSERT INTO `t_log` VALUES (3575, '查询商品信息', '查询操作', '2018-06-26 01:39:47', 1);
INSERT INTO `t_log` VALUES (3576, '添加商品信息[id=null, code=0002, name=马克华菲T恤男 2018夏季新款半袖, model=718201027039311, unit=件, purchasingPrice=138.0, sellingPrice=199.0, inventoryQuantity=0, minNum=999, producer=马克华菲, remarks=马克华菲T恤男 2018夏季新款半袖男士印花圆领衣服情侣短袖韩版潮\r\nTRAVEL荧光字母印花 透气舒适 彩色]', '添加操作', '2018-06-26 01:40:30', 1);
INSERT INTO `t_log` VALUES (3577, '查询商品信息', '查询操作', '2018-06-26 01:40:30', 1);
INSERT INTO `t_log` VALUES (3578, '查询商品信息', '查询操作', '2018-06-26 01:40:33', 1);
INSERT INTO `t_log` VALUES (3579, '添加商品信息[id=null, code=0003, name=GR男装GRSAGA, model=11733321305, unit=件, purchasingPrice=479.0, sellingPrice=599.0, inventoryQuantity=0, minNum=999, producer=纯电商, remarks=GR男装GRSAGA 2018秋季新款休闲圆领中长款大衣外套男装潮流风衣]', '添加操作', '2018-06-26 01:41:31', 1);
INSERT INTO `t_log` VALUES (3580, '查询商品信息', '查询操作', '2018-06-26 01:41:31', 1);
INSERT INTO `t_log` VALUES (3581, '查询商品信息', '查询操作', '2018-06-26 01:41:33', 1);
INSERT INTO `t_log` VALUES (3582, '查询供应商信息', '查询操作', '2018-06-26 01:41:36', 1);
INSERT INTO `t_log` VALUES (3583, '查询供应商信息', '查询操作', '2018-06-26 01:41:36', 1);
INSERT INTO `t_log` VALUES (3584, '添加供应商信息[id=null, name=淘宝, contact=马云, number=18899999999, address=浙江省杭州市阿里巴巴集团, remarks=浙江省杭州市阿里巴巴集团  马云 18899999999]', '添加操作', '2018-06-26 01:42:05', 1);
INSERT INTO `t_log` VALUES (3585, '查询供应商信息', '查询操作', '2018-06-26 01:42:05', 1);
INSERT INTO `t_log` VALUES (3586, '更新供应商信息[id=15, name=淘宝, contact=马云, number=18899999999, address=浙江省杭州市阿里巴巴集团, remarks=浙江省杭州市阿里巴巴集团  马云  18899999999]', '更新操作', '2018-06-26 01:42:11', 1);
INSERT INTO `t_log` VALUES (3587, '查询供应商信息', '查询操作', '2018-06-26 01:42:12', 1);
INSERT INTO `t_log` VALUES (3588, '更新供应商信息[id=15, name=淘宝, contact=马云啊, number=18899999999, address=浙江省杭州市阿里巴巴集团, remarks=浙江省杭州市阿里巴巴集团  马云  18899999999]', '更新操作', '2018-06-26 01:42:19', 1);
INSERT INTO `t_log` VALUES (3589, '查询供应商信息', '查询操作', '2018-06-26 01:42:19', 1);
INSERT INTO `t_log` VALUES (3590, '更新供应商信息[id=15, name=淘宝, contact=马云, number=18899999999, address=浙江省杭州市阿里巴巴集团, remarks=浙江省杭州市阿里巴巴集团  马云  18899999999]', '更新操作', '2018-06-26 01:42:25', 1);
INSERT INTO `t_log` VALUES (3591, '查询供应商信息', '查询操作', '2018-06-26 01:42:25', 1);
INSERT INTO `t_log` VALUES (3592, '添加供应商信息[id=null, name=腾讯, contact=马化腾, number=18555555555, address=广东省深圳市, remarks=广东省深圳市马化腾腾讯18555555555]', '添加操作', '2018-06-26 01:42:59', 1);
INSERT INTO `t_log` VALUES (3593, '查询供应商信息', '查询操作', '2018-06-26 01:42:59', 1);
INSERT INTO `t_log` VALUES (3594, '查询客户信息', '查询操作', '2018-06-26 01:43:00', 1);
INSERT INTO `t_log` VALUES (3595, '查询客户信息', '查询操作', '2018-06-26 01:43:00', 1);
INSERT INTO `t_log` VALUES (3596, '添加客户信息[id=null, name=共青A超市, contact=A, number=18655555555, address=江西省九江市共青城, remarks=江西省九江市共青城共青A超市A18655555555]', '添加操作', '2018-06-26 01:43:43', 1);
INSERT INTO `t_log` VALUES (3597, '查询客户信息', '查询操作', '2018-06-26 01:43:43', 1);
INSERT INTO `t_log` VALUES (3598, '添加客户信息[id=null, name=18655555555, contact=18655555555, number=18655555555, address=18655555555, remarks=1865555555518655555555]', '添加操作', '2018-06-26 01:43:50', 1);
INSERT INTO `t_log` VALUES (3599, '查询客户信息', '查询操作', '2018-06-26 01:43:50', 1);
INSERT INTO `t_log` VALUES (3600, '查询商品信息（无库存）', '查询操作', '2018-06-26 01:43:54', 1);
INSERT INTO `t_log` VALUES (3601, '查询商品信息（有库存）', '查询操作', '2018-06-26 01:43:54', 1);
INSERT INTO `t_log` VALUES (3602, '查询商品信息（无库存）', '查询操作', '2018-06-26 01:43:54', 1);
INSERT INTO `t_log` VALUES (3603, '查询商品信息（有库存）', '查询操作', '2018-06-26 01:43:54', 1);
INSERT INTO `t_log` VALUES (3604, '修改商品[id=36, code=0001, name=Gurbaks男士短袖t恤夏季迷彩体恤, model=GT2214, unit=件, purchasingPrice=78.0, sellingPrice=99.0, inventoryQuantity=999, minNum=999, producer=gurbaks旗舰店, remarks=Gurbaks男士短袖t恤夏季迷彩体恤圆领韩版潮男上衣假两件宽松衣服\r\n夏季潮流新品短袖T恤，个性迷彩潮男Tee]，价格=78.0,库存=999', '更新操作', '2018-06-26 01:44:11', 1);
INSERT INTO `t_log` VALUES (3605, '查询商品信息（无库存）', '查询操作', '2018-06-26 01:44:11', 1);
INSERT INTO `t_log` VALUES (3606, '查询商品信息（有库存）', '查询操作', '2018-06-26 01:44:11', 1);
INSERT INTO `t_log` VALUES (3607, '修改商品[id=36, code=0001, name=Gurbaks男士短袖t恤夏季迷彩体恤, model=GT2214, unit=件, purchasingPrice=70.0, sellingPrice=99.0, inventoryQuantity=999, minNum=999, producer=gurbaks旗舰店, remarks=Gurbaks男士短袖t恤夏季迷彩体恤圆领韩版潮男上衣假两件宽松衣服\r\n夏季潮流新品短袖T恤，个性迷彩潮男Tee]，价格=70.0,库存=999', '更新操作', '2018-06-26 01:44:26', 1);
INSERT INTO `t_log` VALUES (3608, '查询商品信息（无库存）', '查询操作', '2018-06-26 01:44:26', 1);
INSERT INTO `t_log` VALUES (3609, '查询商品信息（有库存）', '查询操作', '2018-06-26 01:44:26', 1);
INSERT INTO `t_log` VALUES (3610, '查询商品信息', '查询操作', '2018-06-26 01:44:33', 1);
INSERT INTO `t_log` VALUES (3611, '查询商品信息', '查询操作', '2018-06-26 01:44:33', 1);
INSERT INTO `t_log` VALUES (3612, '查询商品类别信息', '查询操作', '2018-06-26 01:44:39', 1);
INSERT INTO `t_log` VALUES (3613, '查询商品信息', '查询操作', '2018-06-26 01:44:43', 1);
INSERT INTO `t_log` VALUES (3614, '查询商品信息', '查询操作', '2018-06-26 01:44:43', 1);
INSERT INTO `t_log` VALUES (3615, '查询商品信息', '查询操作', '2018-06-26 01:44:44', 1);
INSERT INTO `t_log` VALUES (3616, '查询商品信息', '查询操作', '2018-06-26 01:44:45', 1);
INSERT INTO `t_log` VALUES (3617, '查询商品信息', '查询操作', '2018-06-26 01:44:46', 1);
INSERT INTO `t_log` VALUES (3618, '添加进货单', '添加操作', '2018-06-26 01:45:26', 1);
INSERT INTO `t_log` VALUES (3619, '查询商品信息', '查询操作', '2018-06-26 01:45:27', 1);
INSERT INTO `t_log` VALUES (3620, '查询商品信息', '查询操作', '2018-06-26 01:45:27', 1);
INSERT INTO `t_log` VALUES (3621, '查询商品库存信息', '查询操作', '2018-06-26 01:45:51', 1);
INSERT INTO `t_log` VALUES (3622, '查询商品信息', '查询操作', '2018-06-26 01:46:18', 1);
INSERT INTO `t_log` VALUES (3623, '查询商品信息', '查询操作', '2018-06-26 01:46:18', 1);
INSERT INTO `t_log` VALUES (3624, '查询商品信息', '查询操作', '2018-06-26 01:46:45', 1);
INSERT INTO `t_log` VALUES (3625, '查询商品信息', '查询操作', '2018-06-26 01:46:45', 1);
INSERT INTO `t_log` VALUES (3626, '查询商品类别信息', '查询操作', '2018-06-26 01:46:55', 1);
INSERT INTO `t_log` VALUES (3627, '查询商品信息', '查询操作', '2018-06-26 01:46:58', 1);
INSERT INTO `t_log` VALUES (3628, '查询商品信息', '查询操作', '2018-06-26 01:46:58', 1);
INSERT INTO `t_log` VALUES (3629, '查询商品信息', '查询操作', '2018-06-26 01:46:59', 1);
INSERT INTO `t_log` VALUES (3630, '添加退货单', '添加操作', '2018-06-26 01:47:07', 1);
INSERT INTO `t_log` VALUES (3631, '查询商品信息', '查询操作', '2018-06-26 01:47:08', 1);
INSERT INTO `t_log` VALUES (3632, '查询商品信息', '查询操作', '2018-06-26 01:47:08', 1);
INSERT INTO `t_log` VALUES (3633, '查询商品库存信息', '查询操作', '2018-06-26 01:48:18', 1);
INSERT INTO `t_log` VALUES (3634, '查询商品库存信息', '查询操作', '2018-06-26 01:48:19', 1);
INSERT INTO `t_log` VALUES (3635, '查询商品库存信息', '查询操作', '2018-06-26 01:48:19', 1);
INSERT INTO `t_log` VALUES (3636, '查询商品库存信息', '查询操作', '2018-06-26 01:48:20', 1);
INSERT INTO `t_log` VALUES (3637, '查询商品库存信息', '查询操作', '2018-06-26 01:48:20', 1);
INSERT INTO `t_log` VALUES (3638, '查询商品库存信息', '查询操作', '2018-06-26 01:48:20', 1);
INSERT INTO `t_log` VALUES (3639, '查询商品类别信息', '查询操作', '2018-06-26 01:48:28', 1);
INSERT INTO `t_log` VALUES (3640, '查询商品信息', '查询操作', '2018-06-26 01:48:30', 1);
INSERT INTO `t_log` VALUES (3641, '查询商品信息', '查询操作', '2018-06-26 01:48:31', 1);
INSERT INTO `t_log` VALUES (3642, '添加退货单', '添加操作', '2018-06-26 01:48:42', 1);
INSERT INTO `t_log` VALUES (3643, '查询商品信息', '查询操作', '2018-06-26 01:48:43', 1);
INSERT INTO `t_log` VALUES (3644, '查询商品信息', '查询操作', '2018-06-26 01:48:43', 1);
INSERT INTO `t_log` VALUES (3645, '查询商品库存信息', '查询操作', '2018-06-26 01:48:46', 1);
INSERT INTO `t_log` VALUES (3646, '查询商品库存信息', '查询操作', '2018-06-26 01:48:46', 1);
INSERT INTO `t_log` VALUES (3647, '查询商品库存信息', '查询操作', '2018-06-26 01:48:47', 1);
INSERT INTO `t_log` VALUES (3648, '查询商品库存信息', '查询操作', '2018-06-26 01:48:47', 1);
INSERT INTO `t_log` VALUES (3649, '查询商品库存信息', '查询操作', '2018-06-26 01:48:47', 1);
INSERT INTO `t_log` VALUES (3650, '查询商品库存信息', '查询操作', '2018-06-26 01:48:48', 1);
INSERT INTO `t_log` VALUES (3651, '查询商品库存信息', '查询操作', '2018-06-26 01:48:48', 1);
INSERT INTO `t_log` VALUES (3652, '查询商品库存信息', '查询操作', '2018-06-26 01:48:48', 1);
INSERT INTO `t_log` VALUES (3653, '查询商品库存信息', '查询操作', '2018-06-26 01:48:50', 1);
INSERT INTO `t_log` VALUES (3654, '用户登录', '登录操作', '2018-06-26 01:49:41', 1);
INSERT INTO `t_log` VALUES (3655, '查询商品库存信息', '查询操作', '2018-06-26 01:49:41', 1);
INSERT INTO `t_log` VALUES (3656, '查询商品库存信息', '查询操作', '2018-06-26 01:49:46', 1);
INSERT INTO `t_log` VALUES (3657, '查询商品类别信息', '查询操作', '2018-06-26 01:51:01', 1);
INSERT INTO `t_log` VALUES (3658, '查询商品类别信息', '查询操作', '2018-06-26 01:51:06', 1);
INSERT INTO `t_log` VALUES (3659, '查询商品库存信息', '查询操作', '2018-06-26 01:51:09', 1);
INSERT INTO `t_log` VALUES (3660, '查询商品类别信息', '查询操作', '2018-06-26 01:51:10', 1);
INSERT INTO `t_log` VALUES (3661, '查询商品库存信息', '查询操作', '2018-06-26 01:51:15', 1);
INSERT INTO `t_log` VALUES (3662, '查询供应商信息', '查询操作', '2018-06-26 01:51:32', 1);
INSERT INTO `t_log` VALUES (3663, '查询供应商信息', '查询操作', '2018-06-26 01:51:32', 1);
INSERT INTO `t_log` VALUES (3664, '查询商品信息（无库存）', '查询操作', '2018-06-26 01:51:33', 1);
INSERT INTO `t_log` VALUES (3665, '查询商品信息（有库存）', '查询操作', '2018-06-26 01:51:33', 1);
INSERT INTO `t_log` VALUES (3666, '查询商品信息（无库存）', '查询操作', '2018-06-26 01:51:33', 1);
INSERT INTO `t_log` VALUES (3667, '查询商品信息（有库存）', '查询操作', '2018-06-26 01:51:33', 1);
INSERT INTO `t_log` VALUES (3668, '查询商品类别信息', '查询操作', '2018-06-26 01:51:35', 1);
INSERT INTO `t_log` VALUES (3669, '查询商品信息', '查询操作', '2018-06-26 01:51:35', 1);
INSERT INTO `t_log` VALUES (3670, '查询商品单位信息', '查询操作', '2018-06-26 01:51:35', 1);
INSERT INTO `t_log` VALUES (3671, '查询商品信息', '查询操作', '2018-06-26 01:51:35', 1);
INSERT INTO `t_log` VALUES (3672, '查询商品单位信息', '查询操作', '2018-06-26 01:51:35', 1);
INSERT INTO `t_log` VALUES (3673, '查询客户信息', '查询操作', '2018-06-26 01:51:37', 1);
INSERT INTO `t_log` VALUES (3674, '查询客户信息', '查询操作', '2018-06-26 01:51:37', 1);
INSERT INTO `t_log` VALUES (3675, '查询商品信息', '查询操作', '2018-06-26 01:52:09', 1);
INSERT INTO `t_log` VALUES (3676, '查询商品信息', '查询操作', '2018-06-26 01:52:10', 1);
INSERT INTO `t_log` VALUES (3677, '查询商品类别信息', '查询操作', '2018-06-26 01:52:16', 1);
INSERT INTO `t_log` VALUES (3678, '添加销售单', '添加操作', '2018-06-26 01:52:26', 1);
INSERT INTO `t_log` VALUES (3679, '查询商品信息', '查询操作', '2018-06-26 01:52:27', 1);
INSERT INTO `t_log` VALUES (3680, '查询商品信息', '查询操作', '2018-06-26 01:52:27', 1);
INSERT INTO `t_log` VALUES (3681, '查询商品库存信息', '查询操作', '2018-06-26 01:52:29', 1);
INSERT INTO `t_log` VALUES (3682, '查询商品库存信息', '查询操作', '2018-06-26 01:52:31', 1);
INSERT INTO `t_log` VALUES (3683, '查询商品库存信息', '查询操作', '2018-06-26 01:52:31', 1);
INSERT INTO `t_log` VALUES (3684, '查询商品库存信息', '查询操作', '2018-06-26 01:52:32', 1);
INSERT INTO `t_log` VALUES (3685, '查询商品库存信息', '查询操作', '2018-06-26 01:52:32', 1);
INSERT INTO `t_log` VALUES (3686, '查询商品库存信息', '查询操作', '2018-06-26 01:52:32', 1);
INSERT INTO `t_log` VALUES (3687, '查询商品库存信息', '查询操作', '2018-06-26 01:52:33', 1);
INSERT INTO `t_log` VALUES (3688, '查询商品类别信息', '查询操作', '2018-06-26 01:59:42', 1);
INSERT INTO `t_log` VALUES (3689, '查询商品库存信息', '查询操作', '2018-06-26 01:59:48', 1);
INSERT INTO `t_log` VALUES (3690, '查询用户信息', '查询操作', '2018-06-26 02:00:03', 1);
INSERT INTO `t_log` VALUES (3691, '查询用户信息', '查询操作', '2018-06-26 02:00:04', 1);
INSERT INTO `t_log` VALUES (3692, '查询商品库存信息', '查询操作', '2018-06-26 02:03:18', 1);
INSERT INTO `t_log` VALUES (3693, '查询商品信息', '查询操作', '2018-06-26 02:03:22', 1);
INSERT INTO `t_log` VALUES (3694, '查询商品信息', '查询操作', '2018-06-26 02:03:22', 1);
INSERT INTO `t_log` VALUES (3695, '查询商品信息', '查询操作', '2018-06-26 02:03:24', 1);
INSERT INTO `t_log` VALUES (3696, '查询商品信息', '查询操作', '2018-06-26 02:03:24', 1);
INSERT INTO `t_log` VALUES (3697, '查询商品库存信息', '查询操作', '2018-06-26 02:03:26', 1);
INSERT INTO `t_log` VALUES (3698, '查询商品类别信息', '查询操作', '2018-06-26 02:03:29', 1);
INSERT INTO `t_log` VALUES (3699, '查询商品信息', '查询操作', '2018-06-26 02:03:31', 1);
INSERT INTO `t_log` VALUES (3700, '查询商品信息', '查询操作', '2018-06-26 02:03:33', 1);
INSERT INTO `t_log` VALUES (3701, '添加退货单', '添加操作', '2018-06-26 02:03:44', 1);
INSERT INTO `t_log` VALUES (3702, '查询商品信息', '查询操作', '2018-06-26 02:03:45', 1);
INSERT INTO `t_log` VALUES (3703, '查询商品信息', '查询操作', '2018-06-26 02:03:46', 1);
INSERT INTO `t_log` VALUES (3704, '查询商品库存信息', '查询操作', '2018-06-26 02:03:48', 1);
INSERT INTO `t_log` VALUES (3705, '查询商品库存信息', '查询操作', '2018-06-26 02:03:48', 1);
INSERT INTO `t_log` VALUES (3706, '查询商品库存信息', '查询操作', '2018-06-26 02:03:49', 1);
INSERT INTO `t_log` VALUES (3707, '查询商品信息', '查询操作', '2018-06-26 02:03:53', 1);
INSERT INTO `t_log` VALUES (3708, '查询商品信息', '查询操作', '2018-06-26 02:03:53', 1);
INSERT INTO `t_log` VALUES (3709, '查询商品类别信息', '查询操作', '2018-06-26 02:04:12', 1);
INSERT INTO `t_log` VALUES (3710, '添加客户退货单', '添加操作', '2018-06-26 02:04:19', 1);
INSERT INTO `t_log` VALUES (3711, '查询商品信息', '查询操作', '2018-06-26 02:04:20', 1);
INSERT INTO `t_log` VALUES (3712, '查询商品信息', '查询操作', '2018-06-26 02:04:20', 1);
INSERT INTO `t_log` VALUES (3713, '查询商品库存信息', '查询操作', '2018-06-26 02:04:24', 1);
INSERT INTO `t_log` VALUES (3714, '用户登录', '登录操作', '2018-06-26 11:23:42', 1);
INSERT INTO `t_log` VALUES (3715, '查询商品库存信息', '查询操作', '2018-06-26 11:23:42', 1);
INSERT INTO `t_log` VALUES (3716, '用户登录', '登录操作', '2018-06-26 11:31:07', 1);
INSERT INTO `t_log` VALUES (3717, '查询商品库存信息', '查询操作', '2018-06-26 11:31:08', 1);
INSERT INTO `t_log` VALUES (3718, '用户登录', '登录操作', '2018-06-26 12:34:39', 1);
INSERT INTO `t_log` VALUES (3719, '查询商品库存信息', '查询操作', '2018-06-26 12:34:40', 1);
INSERT INTO `t_log` VALUES (3720, '用户登录', '登录操作', '2018-06-26 12:38:37', 1);
INSERT INTO `t_log` VALUES (3721, '查询商品库存信息', '查询操作', '2018-06-26 12:38:38', 1);
INSERT INTO `t_log` VALUES (3722, '查询商品信息', '查询操作', '2018-06-26 12:38:42', 1);
INSERT INTO `t_log` VALUES (3723, '查询商品信息', '查询操作', '2018-06-26 12:38:42', 1);
INSERT INTO `t_log` VALUES (3724, '用户登录', '登录操作', '2018-06-26 14:52:42', 1);
INSERT INTO `t_log` VALUES (3725, '查询商品库存信息', '查询操作', '2018-06-26 14:52:43', 1);
INSERT INTO `t_log` VALUES (3726, '用户登录', '登录操作', '2018-06-26 15:19:11', 1);
INSERT INTO `t_log` VALUES (3727, '查询商品库存信息', '查询操作', '2018-06-26 15:19:12', 1);
INSERT INTO `t_log` VALUES (3728, '查询商品类别信息', '查询操作', '2018-06-26 15:22:38', 1);
INSERT INTO `t_log` VALUES (3729, '查询商品库存信息', '查询操作', '2018-06-26 15:22:43', 1);
INSERT INTO `t_log` VALUES (3730, '查询商品信息', '查询操作', '2018-06-26 15:22:45', 1);
INSERT INTO `t_log` VALUES (3731, '查询商品信息', '查询操作', '2018-06-26 15:22:45', 1);
INSERT INTO `t_log` VALUES (3732, '查询角色信息', '查询操作', '2018-06-26 15:22:48', 1);
INSERT INTO `t_log` VALUES (3733, '查询角色信息', '查询操作', '2018-06-26 15:22:48', 1);
INSERT INTO `t_log` VALUES (3734, '查询用户信息', '查询操作', '2018-06-26 15:22:58', 1);
INSERT INTO `t_log` VALUES (3735, '查询用户信息', '查询操作', '2018-06-26 15:22:58', 1);
INSERT INTO `t_log` VALUES (3736, '修改密码', '更新操作', '2018-06-26 15:24:33', 1);
INSERT INTO `t_log` VALUES (3737, '用户注销', '注销操作', '2018-06-26 15:24:38', 1);
INSERT INTO `t_log` VALUES (3738, '用户登录', '登录操作', '2018-06-26 15:24:49', 1);
INSERT INTO `t_log` VALUES (3739, '查询商品库存信息', '查询操作', '2018-06-26 15:24:50', 1);
INSERT INTO `t_log` VALUES (3740, '查询商品类别信息', '查询操作', '2018-06-26 15:25:03', 1);
INSERT INTO `t_log` VALUES (3741, '查询商品库存信息', '查询操作', '2018-06-26 15:25:06', 1);
INSERT INTO `t_log` VALUES (3742, '查询商品信息', '查询操作', '2018-06-26 15:25:10', 1);
INSERT INTO `t_log` VALUES (3743, '查询商品信息', '查询操作', '2018-06-26 15:25:10', 1);
INSERT INTO `t_log` VALUES (3744, '查询商品类别信息', '查询操作', '2018-06-26 15:25:14', 1);
INSERT INTO `t_log` VALUES (3745, '查询商品信息', '查询操作', '2018-06-26 15:25:20', 1);
INSERT INTO `t_log` VALUES (3746, '查询商品类别信息', '查询操作', '2018-06-26 15:25:33', 1);
INSERT INTO `t_log` VALUES (3747, '添加进货单', '添加操作', '2018-06-26 15:25:45', 1);
INSERT INTO `t_log` VALUES (3748, '查询商品信息', '查询操作', '2018-06-26 15:25:46', 1);
INSERT INTO `t_log` VALUES (3749, '查询商品信息', '查询操作', '2018-06-26 15:25:46', 1);
INSERT INTO `t_log` VALUES (3750, '查询商品库存信息', '查询操作', '2018-06-26 15:25:48', 1);
INSERT INTO `t_log` VALUES (3751, '查询商品库存信息', '查询操作', '2018-06-26 15:25:49', 1);
INSERT INTO `t_log` VALUES (3752, '查询商品库存信息', '查询操作', '2018-06-26 15:25:50', 1);
INSERT INTO `t_log` VALUES (3753, '查询商品库存信息', '查询操作', '2018-06-26 15:25:50', 1);
INSERT INTO `t_log` VALUES (3754, '查询商品库存信息', '查询操作', '2018-06-26 15:25:51', 1);
INSERT INTO `t_log` VALUES (3755, '查询商品库存信息', '查询操作', '2018-06-26 15:25:51', 1);
INSERT INTO `t_log` VALUES (3756, '用户登录', '登录操作', '2018-06-26 16:06:31', 1);
INSERT INTO `t_log` VALUES (3757, '查询商品库存信息', '查询操作', '2018-06-26 16:06:32', 1);
INSERT INTO `t_log` VALUES (3758, '查询商品信息', '查询操作', '2018-06-26 16:07:26', 1);
INSERT INTO `t_log` VALUES (3759, '查询商品信息', '查询操作', '2018-06-26 16:07:26', 1);
INSERT INTO `t_log` VALUES (3760, '查询商品信息', '查询操作', '2018-06-26 16:07:27', 1);
INSERT INTO `t_log` VALUES (3761, '查询商品信息', '查询操作', '2018-06-26 16:07:27', 1);
INSERT INTO `t_log` VALUES (3762, '查询商品信息', '查询操作', '2018-06-26 16:07:29', 1);
INSERT INTO `t_log` VALUES (3763, '查询商品信息', '查询操作', '2018-06-26 16:07:29', 1);
INSERT INTO `t_log` VALUES (3764, '查询客户信息', '查询操作', '2018-06-26 16:07:32', 1);
INSERT INTO `t_log` VALUES (3765, '查询客户信息', '查询操作', '2018-06-26 16:07:32', 1);
INSERT INTO `t_log` VALUES (3766, '用户登录', '登录操作', '2018-06-26 17:22:46', 1);
INSERT INTO `t_log` VALUES (3767, '查询商品库存信息', '查询操作', '2018-06-26 17:22:46', 1);
INSERT INTO `t_log` VALUES (3768, '查询商品库存信息', '查询操作', '2018-06-26 17:22:50', 1);
INSERT INTO `t_log` VALUES (3769, '查询商品信息', '查询操作', '2018-06-26 17:22:52', 1);
INSERT INTO `t_log` VALUES (3770, '查询商品信息', '查询操作', '2018-06-26 17:22:52', 1);
INSERT INTO `t_log` VALUES (3771, '查询商品信息', '查询操作', '2018-06-26 17:22:52', 1);
INSERT INTO `t_log` VALUES (3772, '查询商品信息', '查询操作', '2018-06-26 17:22:52', 1);
INSERT INTO `t_log` VALUES (3773, '用户登录', '登录操作', '2018-06-27 00:37:55', 1);
INSERT INTO `t_log` VALUES (3774, '查询商品库存信息', '查询操作', '2018-06-27 00:37:55', 1);
INSERT INTO `t_log` VALUES (3775, '查询用户信息', '查询操作', '2018-06-27 00:37:56', 1);
INSERT INTO `t_log` VALUES (3776, '查询用户信息', '查询操作', '2018-06-27 00:37:56', 1);
INSERT INTO `t_log` VALUES (3777, '用户登录', '登录操作', '2018-06-27 00:39:48', 1);
INSERT INTO `t_log` VALUES (3778, '查询商品库存信息', '查询操作', '2018-06-27 00:39:48', 1);
INSERT INTO `t_log` VALUES (3779, '查询用户信息', '查询操作', '2018-06-27 00:39:50', 1);
INSERT INTO `t_log` VALUES (3780, '查询用户信息', '查询操作', '2018-06-27 00:39:50', 1);
INSERT INTO `t_log` VALUES (3781, '用户登录', '登录操作', '2018-06-27 00:44:23', 1);
INSERT INTO `t_log` VALUES (3782, '查询商品库存信息', '查询操作', '2018-06-27 00:44:24', 1);
INSERT INTO `t_log` VALUES (3783, '查询用户信息', '查询操作', '2018-06-27 00:44:26', 1);
INSERT INTO `t_log` VALUES (3784, '查询用户信息', '查询操作', '2018-06-27 00:44:26', 1);
INSERT INTO `t_log` VALUES (3785, '删除用户信息[id=3, userName=marry, password=123, trueName=玛丽, remarks=33, roles=null]', '删除操作', '2018-06-27 00:45:01', 1);
INSERT INTO `t_log` VALUES (3786, '查询用户信息', '查询操作', '2018-06-27 00:45:01', 1);
INSERT INTO `t_log` VALUES (3787, '删除用户信息[id=2, userName=jack, password=123, trueName=主管, remarks=2, roles=null]', '删除操作', '2018-06-27 00:45:04', 1);
INSERT INTO `t_log` VALUES (3788, '查询用户信息', '查询操作', '2018-06-27 00:45:04', 1);
INSERT INTO `t_log` VALUES (3789, '查询用户信息', '查询操作', '2018-06-27 00:45:07', 1);
INSERT INTO `t_log` VALUES (3790, '查询用户信息', '查询操作', '2018-06-27 00:45:07', 1);
INSERT INTO `t_log` VALUES (3791, '查询用户信息', '查询操作', '2018-06-27 00:45:07', 1);
INSERT INTO `t_log` VALUES (3792, '查询角色信息', '查询操作', '2018-06-27 00:45:12', 1);
INSERT INTO `t_log` VALUES (3793, '查询角色信息', '查询操作', '2018-06-27 00:45:12', 1);
INSERT INTO `t_log` VALUES (3794, '查询商品类别信息', '查询操作', '2018-06-27 00:45:15', 1);
INSERT INTO `t_log` VALUES (3795, '查询商品单位信息', '查询操作', '2018-06-27 00:45:15', 1);
INSERT INTO `t_log` VALUES (3796, '查询商品信息', '查询操作', '2018-06-27 00:45:15', 1);
INSERT INTO `t_log` VALUES (3797, '查询商品单位信息', '查询操作', '2018-06-27 00:45:15', 1);
INSERT INTO `t_log` VALUES (3798, '查询商品信息', '查询操作', '2018-06-27 00:45:15', 1);
INSERT INTO `t_log` VALUES (3799, '用户登录', '登录操作', '2018-06-27 01:06:57', 1);
INSERT INTO `t_log` VALUES (3800, '查询商品库存信息', '查询操作', '2018-06-27 01:06:58', 1);
INSERT INTO `t_log` VALUES (3801, '查询商品信息', '查询操作', '2018-06-27 01:07:02', 1);
INSERT INTO `t_log` VALUES (3802, '查询商品信息', '查询操作', '2018-06-27 01:07:02', 1);
INSERT INTO `t_log` VALUES (3803, '查询商品信息', '查询操作', '2018-06-27 01:07:04', 1);
INSERT INTO `t_log` VALUES (3804, '查询商品信息', '查询操作', '2018-06-27 01:07:04', 1);
INSERT INTO `t_log` VALUES (3805, '查询角色信息', '查询操作', '2018-06-27 01:07:09', 1);
INSERT INTO `t_log` VALUES (3806, '查询角色信息', '查询操作', '2018-06-27 01:07:09', 1);
INSERT INTO `t_log` VALUES (3807, '查询商品信息', '查询操作', '2018-06-27 01:07:26', 1);
INSERT INTO `t_log` VALUES (3808, '查询商品信息', '查询操作', '2018-06-27 01:07:26', 1);
INSERT INTO `t_log` VALUES (3809, '查询商品信息', '查询操作', '2018-06-27 01:08:43', 1);
INSERT INTO `t_log` VALUES (3810, '查询商品信息', '查询操作', '2018-06-27 01:08:43', 1);
INSERT INTO `t_log` VALUES (3811, '用户登录', '登录操作', '2018-06-27 01:09:00', 1);
INSERT INTO `t_log` VALUES (3812, '查询商品库存信息', '查询操作', '2018-06-27 01:09:00', 1);
INSERT INTO `t_log` VALUES (3813, '查询用户信息', '查询操作', '2018-06-27 01:09:07', 1);
INSERT INTO `t_log` VALUES (3814, '查询用户信息', '查询操作', '2018-06-27 01:09:07', 1);
INSERT INTO `t_log` VALUES (3815, '查询角色信息', '查询操作', '2018-06-27 01:09:08', 1);
INSERT INTO `t_log` VALUES (3816, '查询角色信息', '查询操作', '2018-06-27 01:09:08', 1);
INSERT INTO `t_log` VALUES (3817, '查询商品信息', '查询操作', '2018-06-27 01:09:13', 1);
INSERT INTO `t_log` VALUES (3818, '查询商品信息', '查询操作', '2018-06-27 01:09:13', 1);
INSERT INTO `t_log` VALUES (3819, '查询商品信息', '查询操作', '2018-06-27 01:09:26', 1);
INSERT INTO `t_log` VALUES (3820, '查询商品信息', '查询操作', '2018-06-27 01:09:26', 1);
INSERT INTO `t_log` VALUES (3821, '查询商品类别信息', '查询操作', '2018-06-27 01:09:59', 1);
INSERT INTO `t_log` VALUES (3822, '查询商品信息', '查询操作', '2018-06-27 01:10:06', 1);
INSERT INTO `t_log` VALUES (3823, '查询商品信息', '查询操作', '2018-06-27 01:10:07', 1);
INSERT INTO `t_log` VALUES (3824, '查询商品信息', '查询操作', '2018-06-27 01:10:08', 1);
INSERT INTO `t_log` VALUES (3825, '添加进货单', '添加操作', '2018-06-27 01:10:15', 1);
INSERT INTO `t_log` VALUES (3826, '查询商品信息', '查询操作', '2018-06-27 01:10:20', 1);
INSERT INTO `t_log` VALUES (3827, '查询商品信息', '查询操作', '2018-06-27 01:10:20', 1);
INSERT INTO `t_log` VALUES (3828, '查询商品信息', '查询操作', '2018-06-27 01:12:32', 1);
INSERT INTO `t_log` VALUES (3829, '查询商品信息', '查询操作', '2018-06-27 01:12:32', 1);
INSERT INTO `t_log` VALUES (3830, '查询商品信息', '查询操作', '2018-06-27 01:12:32', 1);
INSERT INTO `t_log` VALUES (3831, '查询商品信息', '查询操作', '2018-06-27 01:12:32', 1);
INSERT INTO `t_log` VALUES (3832, '查询商品信息', '查询操作', '2018-06-27 01:12:38', 1);
INSERT INTO `t_log` VALUES (3833, '查询商品信息', '查询操作', '2018-06-27 01:12:38', 1);
INSERT INTO `t_log` VALUES (3834, '查询商品信息', '查询操作', '2018-06-27 01:13:00', 1);
INSERT INTO `t_log` VALUES (3835, '查询商品信息', '查询操作', '2018-06-27 01:13:00', 1);
INSERT INTO `t_log` VALUES (3836, '查询商品库存信息', '查询操作', '2018-06-27 01:13:00', 1);
INSERT INTO `t_log` VALUES (3837, '查询商品库存信息', '查询操作', '2018-06-27 01:13:12', 1);
INSERT INTO `t_log` VALUES (3838, '查询商品库存信息', '查询操作', '2018-06-27 01:13:13', 1);
INSERT INTO `t_log` VALUES (3839, '查询商品库存信息', '查询操作', '2018-06-27 01:13:14', 1);
INSERT INTO `t_log` VALUES (3840, '查询商品库存信息', '查询操作', '2018-06-27 01:13:16', 1);
INSERT INTO `t_log` VALUES (3841, '查询商品库存信息', '查询操作', '2018-06-27 01:13:17', 1);
INSERT INTO `t_log` VALUES (3842, '用户登录', '登录操作', '2018-06-27 12:11:54', 1);
INSERT INTO `t_log` VALUES (3843, '查询商品库存信息', '查询操作', '2018-06-27 12:11:54', 1);
INSERT INTO `t_log` VALUES (3844, '查询商品信息', '查询操作', '2018-06-27 12:22:19', 1);
INSERT INTO `t_log` VALUES (3845, '查询商品信息', '查询操作', '2018-06-27 12:22:19', 1);
INSERT INTO `t_log` VALUES (3846, '查询商品信息', '查询操作', '2018-06-27 12:22:22', 1);
INSERT INTO `t_log` VALUES (3847, '查询商品信息', '查询操作', '2018-06-27 12:22:22', 1);
INSERT INTO `t_log` VALUES (3848, '查询商品类别信息', '查询操作', '2018-06-27 12:22:28', 1);
INSERT INTO `t_log` VALUES (3849, '查询商品信息', '查询操作', '2018-06-27 12:22:29', 1);
INSERT INTO `t_log` VALUES (3850, '查询商品信息', '查询操作', '2018-06-27 12:22:30', 1);
INSERT INTO `t_log` VALUES (3851, '查询商品信息', '查询操作', '2018-06-27 12:22:31', 1);
INSERT INTO `t_log` VALUES (3852, '查询商品信息', '查询操作', '2018-06-27 12:22:32', 1);
INSERT INTO `t_log` VALUES (3853, '查询商品信息', '查询操作', '2018-06-27 12:22:34', 1);
INSERT INTO `t_log` VALUES (3854, '查询商品信息', '查询操作', '2018-06-27 12:22:34', 1);
INSERT INTO `t_log` VALUES (3855, '查询商品信息', '查询操作', '2018-06-27 12:22:35', 1);
INSERT INTO `t_log` VALUES (3856, '查询商品信息', '查询操作', '2018-06-27 12:22:40', 1);
INSERT INTO `t_log` VALUES (3857, '添加进货单', '添加操作', '2018-06-27 12:22:49', 1);
INSERT INTO `t_log` VALUES (3858, '查询商品信息', '查询操作', '2018-06-27 12:22:50', 1);
INSERT INTO `t_log` VALUES (3859, '查询商品信息', '查询操作', '2018-06-27 12:22:50', 1);
INSERT INTO `t_log` VALUES (3860, '查询商品库存信息', '查询操作', '2018-06-27 12:22:55', 1);
INSERT INTO `t_log` VALUES (3861, '查询角色信息', '查询操作', '2018-06-27 12:47:02', 1);
INSERT INTO `t_log` VALUES (3862, '查询角色信息', '查询操作', '2018-06-27 12:47:02', 1);
INSERT INTO `t_log` VALUES (3863, '查询用户信息', '查询操作', '2018-06-27 12:47:03', 1);
INSERT INTO `t_log` VALUES (3864, '查询用户信息', '查询操作', '2018-06-27 12:47:03', 1);
INSERT INTO `t_log` VALUES (3865, '查询商品库存信息', '查询操作', '2018-06-27 12:59:16', 1);
INSERT INTO `t_log` VALUES (3866, '查询商品信息', '查询操作', '2018-06-27 12:59:18', 1);
INSERT INTO `t_log` VALUES (3867, '查询商品信息', '查询操作', '2018-06-27 12:59:18', 1);
INSERT INTO `t_log` VALUES (3868, '用户登录', '登录操作', '2018-06-29 12:14:08', 1);
INSERT INTO `t_log` VALUES (3869, '查询商品库存信息', '查询操作', '2018-06-29 12:14:08', 1);
INSERT INTO `t_log` VALUES (3870, '查询商品信息', '查询操作', '2018-06-29 12:14:12', 1);
INSERT INTO `t_log` VALUES (3871, '查询商品信息', '查询操作', '2018-06-29 12:14:12', 1);
INSERT INTO `t_log` VALUES (3872, '查询用户信息', '查询操作', '2018-06-29 12:14:15', 1);
INSERT INTO `t_log` VALUES (3873, '查询用户信息', '查询操作', '2018-06-29 12:14:15', 1);
INSERT INTO `t_log` VALUES (3874, '查询角色信息', '查询操作', '2018-06-29 12:14:16', 1);
INSERT INTO `t_log` VALUES (3875, '查询角色信息', '查询操作', '2018-06-29 12:14:16', 1);
INSERT INTO `t_log` VALUES (3876, '查询商品类别信息', '查询操作', '2018-06-29 12:14:16', 1);
INSERT INTO `t_log` VALUES (3877, '查询商品单位信息', '查询操作', '2018-06-29 12:14:17', 1);
INSERT INTO `t_log` VALUES (3878, '查询商品单位信息', '查询操作', '2018-06-29 12:14:17', 1);
INSERT INTO `t_log` VALUES (3879, '查询商品信息', '查询操作', '2018-06-29 12:14:17', 1);
INSERT INTO `t_log` VALUES (3880, '查询商品信息', '查询操作', '2018-06-29 12:14:17', 1);
INSERT INTO `t_log` VALUES (3881, '查询客户信息', '查询操作', '2018-06-29 12:14:17', 1);
INSERT INTO `t_log` VALUES (3882, '查询客户信息', '查询操作', '2018-06-29 12:14:17', 1);
INSERT INTO `t_log` VALUES (3883, '查询商品库存信息', '查询操作', '2018-06-29 12:14:22', 1);
INSERT INTO `t_log` VALUES (3884, '查询商品信息', '查询操作', '2018-06-29 12:14:25', 1);
INSERT INTO `t_log` VALUES (3885, '查询商品信息', '查询操作', '2018-06-29 12:14:25', 1);
INSERT INTO `t_log` VALUES (3886, '查询商品信息', '查询操作', '2018-06-29 12:14:31', 1);
INSERT INTO `t_log` VALUES (3887, '查询商品信息', '查询操作', '2018-06-29 12:14:31', 1);
INSERT INTO `t_log` VALUES (3888, '查询商品信息', '查询操作', '2018-06-29 12:14:31', 1);
INSERT INTO `t_log` VALUES (3889, '查询商品信息', '查询操作', '2018-06-29 12:14:31', 1);
INSERT INTO `t_log` VALUES (3890, '查询供应商信息', '查询操作', '2018-06-29 12:14:47', 1);
INSERT INTO `t_log` VALUES (3891, '查询供应商信息', '查询操作', '2018-06-29 12:14:47', 1);
INSERT INTO `t_log` VALUES (3892, '查询客户信息', '查询操作', '2018-06-29 12:14:48', 1);
INSERT INTO `t_log` VALUES (3893, '查询客户信息', '查询操作', '2018-06-29 12:14:48', 1);
INSERT INTO `t_log` VALUES (3894, '查询商品信息', '查询操作', '2018-06-29 12:30:21', 1);
INSERT INTO `t_log` VALUES (3895, '查询商品信息', '查询操作', '2018-06-29 12:30:21', 1);
INSERT INTO `t_log` VALUES (3896, '用户登录', '登录操作', '2018-06-29 19:31:24', 1);
INSERT INTO `t_log` VALUES (3897, '查询商品库存信息', '查询操作', '2018-06-29 19:31:24', 1);
INSERT INTO `t_log` VALUES (3898, '查询商品库存信息', '查询操作', '2018-06-29 19:32:13', 1);
INSERT INTO `t_log` VALUES (3899, '查询商品信息', '查询操作', '2018-06-29 19:32:14', 1);
INSERT INTO `t_log` VALUES (3900, '查询商品信息', '查询操作', '2018-06-29 19:32:14', 1);
INSERT INTO `t_log` VALUES (3901, '查询商品信息', '查询操作', '2018-06-29 19:32:14', 1);
INSERT INTO `t_log` VALUES (3902, '查询商品信息', '查询操作', '2018-06-29 19:32:14', 1);
INSERT INTO `t_log` VALUES (3903, '查询客户信息', '查询操作', '2018-06-29 19:32:18', 1);
INSERT INTO `t_log` VALUES (3904, '查询客户信息', '查询操作', '2018-06-29 19:32:18', 1);
INSERT INTO `t_log` VALUES (3905, '查询角色信息', '查询操作', '2018-06-29 19:32:27', 1);
INSERT INTO `t_log` VALUES (3906, '查询角色信息', '查询操作', '2018-06-29 19:32:27', 1);
INSERT INTO `t_log` VALUES (3907, '用户登录', '登录操作', '2018-07-07 22:12:05', 1);
INSERT INTO `t_log` VALUES (3908, '查询商品库存信息', '查询操作', '2018-07-07 22:12:06', 1);
INSERT INTO `t_log` VALUES (3909, '查询角色信息', '查询操作', '2018-07-07 22:12:08', 1);
INSERT INTO `t_log` VALUES (3910, '查询角色信息', '查询操作', '2018-07-07 22:12:08', 1);
INSERT INTO `t_log` VALUES (3911, '查询用户信息', '查询操作', '2018-07-07 22:12:11', 1);
INSERT INTO `t_log` VALUES (3912, '查询用户信息', '查询操作', '2018-07-07 22:12:11', 1);
INSERT INTO `t_log` VALUES (3913, '用户登录', '登录操作', '2018-07-09 20:26:26', 1);
INSERT INTO `t_log` VALUES (3914, '查询商品库存信息', '查询操作', '2018-07-09 20:26:27', 1);
INSERT INTO `t_log` VALUES (3915, '查询角色信息', '查询操作', '2018-07-09 20:26:31', 1);
INSERT INTO `t_log` VALUES (3916, '查询角色信息', '查询操作', '2018-07-09 20:26:31', 1);
INSERT INTO `t_log` VALUES (3917, '查询商品类别信息', '查询操作', '2018-07-09 20:26:32', 1);
INSERT INTO `t_log` VALUES (3918, '查询商品单位信息', '查询操作', '2018-07-09 20:26:33', 1);
INSERT INTO `t_log` VALUES (3919, '查询商品信息', '查询操作', '2018-07-09 20:26:33', 1);
INSERT INTO `t_log` VALUES (3920, '查询商品单位信息', '查询操作', '2018-07-09 20:26:33', 1);
INSERT INTO `t_log` VALUES (3921, '查询商品信息', '查询操作', '2018-07-09 20:26:33', 1);
INSERT INTO `t_log` VALUES (3922, '查询客户信息', '查询操作', '2018-07-09 20:26:33', 1);
INSERT INTO `t_log` VALUES (3923, '查询客户信息', '查询操作', '2018-07-09 20:26:33', 1);
INSERT INTO `t_log` VALUES (3924, '查询供应商信息', '查询操作', '2018-07-09 20:26:34', 1);
INSERT INTO `t_log` VALUES (3925, '查询供应商信息', '查询操作', '2018-07-09 20:26:34', 1);
INSERT INTO `t_log` VALUES (3926, '查询用户信息', '查询操作', '2018-07-09 20:26:36', 1);
INSERT INTO `t_log` VALUES (3927, '查询用户信息', '查询操作', '2018-07-09 20:26:36', 1);
INSERT INTO `t_log` VALUES (3928, '查询商品信息（无库存）', '查询操作', '2018-07-09 20:26:42', 1);
INSERT INTO `t_log` VALUES (3929, '查询商品信息（无库存）', '查询操作', '2018-07-09 20:26:42', 1);
INSERT INTO `t_log` VALUES (3930, '查询商品信息（有库存）', '查询操作', '2018-07-09 20:26:42', 1);
INSERT INTO `t_log` VALUES (3931, '查询商品信息（有库存）', '查询操作', '2018-07-09 20:26:42', 1);
INSERT INTO `t_log` VALUES (3932, '查询商品信息', '查询操作', '2018-07-09 20:26:51', 1);
INSERT INTO `t_log` VALUES (3933, '查询商品信息', '查询操作', '2018-07-09 20:26:52', 1);
INSERT INTO `t_log` VALUES (3934, '添加商品类别信息[id=null, name=资料, state=0, icon=icon-folder, pId=1]', '添加操作', '2018-07-09 20:27:05', 1);
INSERT INTO `t_log` VALUES (3935, '查询商品类别信息', '查询操作', '2018-07-09 20:27:05', 1);
INSERT INTO `t_log` VALUES (3936, '查询商品信息', '查询操作', '2018-07-09 20:27:06', 1);
INSERT INTO `t_log` VALUES (3937, '添加商品类别信息[id=null, name=计算机考研, state=0, icon=icon-folder, pId=38]', '添加操作', '2018-07-09 20:27:16', 1);
INSERT INTO `t_log` VALUES (3938, '查询商品类别信息', '查询操作', '2018-07-09 20:27:16', 1);
INSERT INTO `t_log` VALUES (3939, '查询商品信息', '查询操作', '2018-07-09 20:27:17', 1);
INSERT INTO `t_log` VALUES (3940, '查询商品信息', '查询操作', '2018-07-09 20:27:18', 1);
INSERT INTO `t_log` VALUES (3941, '添加商品类别信息[id=null, name=手机, state=0, icon=icon-folder, pId=38]', '添加操作', '2018-07-09 20:27:22', 1);
INSERT INTO `t_log` VALUES (3942, '查询商品类别信息', '查询操作', '2018-07-09 20:27:22', 1);
INSERT INTO `t_log` VALUES (3943, '查询商品信息', '查询操作', '2018-07-09 20:27:23', 1);
INSERT INTO `t_log` VALUES (3944, '添加商品类别信息[id=null, name=MP3, state=0, icon=icon-folder, pId=38]', '添加操作', '2018-07-09 20:27:31', 1);
INSERT INTO `t_log` VALUES (3945, '查询商品类别信息', '查询操作', '2018-07-09 20:27:31', 1);
INSERT INTO `t_log` VALUES (3946, '查询商品信息', '查询操作', '2018-07-09 20:27:33', 1);
INSERT INTO `t_log` VALUES (3947, '添加商品信息[id=null, code=0004, name=计算机考研资料, model=001, unit=个, purchasingPrice=2.0, sellingPrice=5.0, inventoryQuantity=0, minNum=999, producer=百度云盘, remarks=百度云盘  计算机考研资料]', '添加操作', '2018-07-09 20:28:20', 1);
INSERT INTO `t_log` VALUES (3948, '查询商品信息', '查询操作', '2018-07-09 20:28:20', 1);
INSERT INTO `t_log` VALUES (3949, '查询商品类别信息', '查询操作', '2018-07-09 20:28:23', 1);
INSERT INTO `t_log` VALUES (3950, '添加商品信息[id=null, code=0005, name=苹果5S 16G 国行4G A1530, model=A1530, unit=件, purchasingPrice=500.0, sellingPrice=600.0, inventoryQuantity=0, minNum=1, producer=闲鱼 进, remarks=闲鱼 进 650 使用2年  二手商品售卖]', '添加操作', '2018-07-09 20:29:26', 1);
INSERT INTO `t_log` VALUES (3951, '查询商品信息', '查询操作', '2018-07-09 20:29:26', 1);
INSERT INTO `t_log` VALUES (3952, '查询商品信息', '查询操作', '2018-07-09 20:29:29', 1);
INSERT INTO `t_log` VALUES (3953, '查询商品信息', '查询操作', '2018-07-09 20:29:30', 1);
INSERT INTO `t_log` VALUES (3954, '添加商品信息[id=null, code=0006, name=iPod Shuffle 7代, model=iPod Shuffle 7, unit=个, purchasingPrice=130.0, sellingPrice=220.0, inventoryQuantity=0, minNum=1, producer=闲鱼二手, remarks=闲鱼二手 iPod shuffle ]', '添加操作', '2018-07-09 20:30:39', 1);
INSERT INTO `t_log` VALUES (3955, '查询商品信息', '查询操作', '2018-07-09 20:30:39', 1);
INSERT INTO `t_log` VALUES (3956, '查询商品信息', '查询操作', '2018-07-09 20:30:43', 1);
INSERT INTO `t_log` VALUES (3957, '查询商品信息', '查询操作', '2018-07-09 20:30:44', 1);
INSERT INTO `t_log` VALUES (3958, '查询商品信息', '查询操作', '2018-07-09 20:30:47', 1);
INSERT INTO `t_log` VALUES (3959, '查询商品信息', '查询操作', '2018-07-09 20:30:47', 1);
INSERT INTO `t_log` VALUES (3960, '查询商品信息', '查询操作', '2018-07-09 20:30:53', 1);
INSERT INTO `t_log` VALUES (3961, '查询商品信息', '查询操作', '2018-07-09 20:30:55', 1);
INSERT INTO `t_log` VALUES (3962, '查询商品信息', '查询操作', '2018-07-09 20:30:56', 1);
INSERT INTO `t_log` VALUES (3963, '查询商品信息', '查询操作', '2018-07-09 20:30:57', 1);
INSERT INTO `t_log` VALUES (3964, '查询商品信息', '查询操作', '2018-07-09 20:30:57', 1);
INSERT INTO `t_log` VALUES (3965, '查询商品信息', '查询操作', '2018-07-09 20:30:58', 1);
INSERT INTO `t_log` VALUES (3966, '查询商品信息', '查询操作', '2018-07-09 20:30:58', 1);
INSERT INTO `t_log` VALUES (3967, '查询商品信息', '查询操作', '2018-07-09 20:31:00', 1);
INSERT INTO `t_log` VALUES (3968, '查询商品库存信息', '查询操作', '2018-07-09 20:31:02', 1);
INSERT INTO `t_log` VALUES (3969, '查询商品信息', '查询操作', '2018-07-09 20:31:24', 1);
INSERT INTO `t_log` VALUES (3970, '查询商品信息', '查询操作', '2018-07-09 20:31:24', 1);
INSERT INTO `t_log` VALUES (3971, '查询商品类别信息', '查询操作', '2018-07-09 20:31:29', 1);
INSERT INTO `t_log` VALUES (3972, '添加进货单', '添加操作', '2018-07-09 20:31:51', 1);
INSERT INTO `t_log` VALUES (3973, '查询商品信息', '查询操作', '2018-07-09 20:31:52', 1);
INSERT INTO `t_log` VALUES (3974, '查询商品信息', '查询操作', '2018-07-09 20:31:52', 1);
INSERT INTO `t_log` VALUES (3975, '查询商品库存信息', '查询操作', '2018-07-09 20:31:55', 1);
INSERT INTO `t_log` VALUES (3976, '查询商品库存信息', '查询操作', '2018-07-09 20:31:56', 1);
INSERT INTO `t_log` VALUES (3977, '查询商品库存信息', '查询操作', '2018-07-09 20:31:56', 1);
INSERT INTO `t_log` VALUES (3978, '查询商品库存信息', '查询操作', '2018-07-09 20:31:57', 1);
INSERT INTO `t_log` VALUES (3979, '查询商品库存信息', '查询操作', '2018-07-09 20:31:57', 1);
INSERT INTO `t_log` VALUES (3980, '查询商品信息', '查询操作', '2018-07-09 20:32:09', 1);
INSERT INTO `t_log` VALUES (3981, '查询商品信息', '查询操作', '2018-07-09 20:32:09', 1);
INSERT INTO `t_log` VALUES (3982, '更新商品信息[id=39, code=0004, name=计算机考研资料, model=001, unit=个, purchasingPrice=1.0, sellingPrice=5.0, inventoryQuantity=0, minNum=999, producer=百度云盘, remarks=百度云盘  计算机考研资料]', '更新操作', '2018-07-09 20:32:15', 1);
INSERT INTO `t_log` VALUES (3983, '查询商品信息', '查询操作', '2018-07-09 20:32:15', 1);
INSERT INTO `t_log` VALUES (3984, '查询商品库存信息', '查询操作', '2018-07-09 20:32:18', 1);
INSERT INTO `t_log` VALUES (3985, '查询商品库存信息', '查询操作', '2018-07-09 20:32:21', 1);
INSERT INTO `t_log` VALUES (3986, '查询商品库存信息', '查询操作', '2018-07-09 20:32:21', 1);
INSERT INTO `t_log` VALUES (3987, '查询商品库存信息', '查询操作', '2018-07-09 20:32:21', 1);
INSERT INTO `t_log` VALUES (3988, '查询商品库存信息', '查询操作', '2018-07-09 20:32:22', 1);
INSERT INTO `t_log` VALUES (3989, '查询商品库存信息', '查询操作', '2018-07-09 20:32:22', 1);
INSERT INTO `t_log` VALUES (3990, '查询商品库存信息', '查询操作', '2018-07-09 20:32:24', 1);
INSERT INTO `t_log` VALUES (3991, '查询商品库存信息', '查询操作', '2018-07-09 20:32:25', 1);
INSERT INTO `t_log` VALUES (3992, '查询商品库存信息', '查询操作', '2018-07-09 20:32:25', 1);
INSERT INTO `t_log` VALUES (3993, '查询商品库存信息', '查询操作', '2018-07-09 20:32:26', 1);
INSERT INTO `t_log` VALUES (3994, '查询商品信息', '查询操作', '2018-07-09 20:32:40', 1);
INSERT INTO `t_log` VALUES (3995, '查询商品信息', '查询操作', '2018-07-09 20:32:40', 1);
INSERT INTO `t_log` VALUES (3996, '查询商品信息（无库存）', '查询操作', '2018-07-09 20:32:55', 1);
INSERT INTO `t_log` VALUES (3997, '查询商品信息（无库存）', '查询操作', '2018-07-09 20:32:55', 1);
INSERT INTO `t_log` VALUES (3998, '查询商品信息（无库存）', '查询操作', '2018-07-09 20:32:55', 1);
INSERT INTO `t_log` VALUES (3999, '查询商品信息（无库存）', '查询操作', '2018-07-09 20:32:56', 1);
INSERT INTO `t_log` VALUES (4000, '修改商品[id=39, code=0004, name=计算机考研资料, model=001, unit=个, purchasingPrice=1.0, sellingPrice=5.0, inventoryQuantity=999, minNum=999, producer=百度云盘, remarks=百度云盘  计算机考研资料]，价格=1.0,库存=999', '更新操作', '2018-07-09 20:33:04', 1);
INSERT INTO `t_log` VALUES (4001, '查询商品信息（无库存）', '查询操作', '2018-07-09 20:33:04', 1);
INSERT INTO `t_log` VALUES (4002, '查询商品信息（有库存）', '查询操作', '2018-07-09 20:33:04', 1);
INSERT INTO `t_log` VALUES (4003, '查询商品库存信息', '查询操作', '2018-07-09 20:33:09', 1);
INSERT INTO `t_log` VALUES (4004, '查询商品库存信息', '查询操作', '2018-07-09 20:33:10', 1);
INSERT INTO `t_log` VALUES (4005, '查询商品库存信息', '查询操作', '2018-07-09 20:33:10', 1);
INSERT INTO `t_log` VALUES (4006, '查询商品库存信息', '查询操作', '2018-07-09 20:33:11', 1);
INSERT INTO `t_log` VALUES (4007, '查询商品库存信息', '查询操作', '2018-07-09 20:33:11', 1);
INSERT INTO `t_log` VALUES (4008, '查询商品库存信息', '查询操作', '2018-07-09 20:33:11', 1);
INSERT INTO `t_log` VALUES (4009, '查询商品库存信息', '查询操作', '2018-07-09 20:33:12', 1);
INSERT INTO `t_log` VALUES (4010, '查询商品库存信息', '查询操作', '2018-07-09 20:33:12', 1);
INSERT INTO `t_log` VALUES (4011, '查询商品库存信息', '查询操作', '2018-07-09 20:33:12', 1);
INSERT INTO `t_log` VALUES (4012, '查询商品库存信息', '查询操作', '2018-07-09 20:33:13', 1);
INSERT INTO `t_log` VALUES (4013, '查询商品库存信息', '查询操作', '2018-07-09 20:33:13', 1);
INSERT INTO `t_log` VALUES (4014, '查询商品库存信息', '查询操作', '2018-07-09 20:33:13', 1);
INSERT INTO `t_log` VALUES (4015, '查询商品库存信息', '查询操作', '2018-07-09 20:33:14', 1);
INSERT INTO `t_log` VALUES (4016, '查询商品库存信息', '查询操作', '2018-07-09 20:33:14', 1);
INSERT INTO `t_log` VALUES (4017, '查询商品库存信息', '查询操作', '2018-07-09 20:33:14', 1);
INSERT INTO `t_log` VALUES (4018, '查询商品库存信息', '查询操作', '2018-07-09 20:33:15', 1);
INSERT INTO `t_log` VALUES (4019, '查询商品库存信息', '查询操作', '2018-07-09 20:33:15', 1);
INSERT INTO `t_log` VALUES (4020, '用户登录', '登录操作', '2018-07-20 19:34:40', 1);
INSERT INTO `t_log` VALUES (4021, '查询商品库存信息', '查询操作', '2018-07-20 19:34:41', 1);
INSERT INTO `t_log` VALUES (4022, '用户登录', '登录操作', '2018-07-26 19:23:03', 1);
INSERT INTO `t_log` VALUES (4023, '查询商品库存信息', '查询操作', '2018-07-26 19:23:03', 1);
INSERT INTO `t_log` VALUES (4024, '查询商品信息', '查询操作', '2018-07-26 19:26:01', 1);
INSERT INTO `t_log` VALUES (4025, '查询商品信息', '查询操作', '2018-07-26 19:26:01', 1);
INSERT INTO `t_log` VALUES (4026, '查询商品库存信息', '查询操作', '2018-07-26 19:26:03', 1);
INSERT INTO `t_log` VALUES (4027, '查询商品信息', '查询操作', '2018-07-26 19:26:05', 1);
INSERT INTO `t_log` VALUES (4028, '查询商品信息', '查询操作', '2018-07-26 19:26:05', 1);
INSERT INTO `t_log` VALUES (4029, '查询商品信息', '查询操作', '2018-07-26 19:26:05', 1);
INSERT INTO `t_log` VALUES (4030, '查询商品信息', '查询操作', '2018-07-26 19:26:05', 1);
INSERT INTO `t_log` VALUES (4031, '用户登录', '登录操作', '2018-10-23 20:40:20', 1);
INSERT INTO `t_log` VALUES (4032, '查询商品库存信息', '查询操作', '2018-10-23 20:40:22', 1);
INSERT INTO `t_log` VALUES (4033, '查询商品类别信息', '查询操作', '2018-10-23 20:41:42', 1);
INSERT INTO `t_log` VALUES (4034, '查询商品信息', '查询操作', '2018-10-23 20:41:42', 1);
INSERT INTO `t_log` VALUES (4035, '查询商品单位信息', '查询操作', '2018-10-23 20:41:42', 1);
INSERT INTO `t_log` VALUES (4036, '查询商品单位信息', '查询操作', '2018-10-23 20:41:42', 1);
INSERT INTO `t_log` VALUES (4037, '查询商品信息', '查询操作', '2018-10-23 20:41:42', 1);
INSERT INTO `t_log` VALUES (4038, '查询用户信息', '查询操作', '2018-10-23 20:41:57', 1);
INSERT INTO `t_log` VALUES (4039, '查询用户信息', '查询操作', '2018-10-23 20:41:57', 1);
INSERT INTO `t_log` VALUES (4040, '查询角色信息', '查询操作', '2018-10-23 20:41:58', 1);
INSERT INTO `t_log` VALUES (4041, '查询角色信息', '查询操作', '2018-10-23 20:41:58', 1);
INSERT INTO `t_log` VALUES (4042, '添加用户信息[id=null, userName=lin, password=lin, trueName=林总, remarks=采购经理, roles=null]', '添加操作', '2018-10-23 20:47:08', 1);
INSERT INTO `t_log` VALUES (4043, '查询用户信息', '查询操作', '2018-10-23 20:47:09', 1);
INSERT INTO `t_log` VALUES (4044, '查询所有角色信息', '查询操作', '2018-10-23 20:47:12', 1);
INSERT INTO `t_log` VALUES (4045, '保存用户角色设置', '更新操作', '2018-10-23 20:47:21', 1);
INSERT INTO `t_log` VALUES (4046, '查询用户信息', '查询操作', '2018-10-23 20:47:21', 1);
INSERT INTO `t_log` VALUES (4047, '用户注销', '注销操作', '2018-10-23 20:47:28', 1);
INSERT INTO `t_log` VALUES (4048, '用户登录', '登录操作', '2018-10-23 20:47:51', 2);
INSERT INTO `t_log` VALUES (4049, '用户登录', '登录操作', '2018-10-23 20:51:08', 1);
INSERT INTO `t_log` VALUES (4050, '查询商品库存信息', '查询操作', '2018-10-23 20:51:08', 1);
INSERT INTO `t_log` VALUES (4051, '查询角色信息', '查询操作', '2018-10-23 20:51:14', 1);
INSERT INTO `t_log` VALUES (4052, '查询角色信息', '查询操作', '2018-10-23 20:51:14', 1);
INSERT INTO `t_log` VALUES (4053, '保存角色权限设置', '添加操作', '2018-10-23 21:10:39', 1);
INSERT INTO `t_log` VALUES (4054, '查询用户信息', '查询操作', '2018-10-23 21:11:47', 1);
INSERT INTO `t_log` VALUES (4055, '查询用户信息', '查询操作', '2018-10-23 21:11:47', 1);
INSERT INTO `t_log` VALUES (4056, '查询所有角色信息', '查询操作', '2018-10-23 21:11:49', 1);
INSERT INTO `t_log` VALUES (4057, '查询所有角色信息', '查询操作', '2018-10-23 21:13:01', 1);
INSERT INTO `t_log` VALUES (4058, '保存角色权限设置', '添加操作', '2018-10-23 21:13:19', 1);
INSERT INTO `t_log` VALUES (4059, '用户注销', '注销操作', '2018-10-23 21:13:23', 1);
INSERT INTO `t_log` VALUES (4060, '用户登录', '登录操作', '2018-10-23 21:13:47', 2);
INSERT INTO `t_log` VALUES (4061, '用户登录', '登录操作', '2018-10-23 21:15:44', 1);
INSERT INTO `t_log` VALUES (4062, '查询商品库存信息', '查询操作', '2018-10-23 21:15:44', 1);
INSERT INTO `t_log` VALUES (4063, '查询商品类别信息', '查询操作', '2018-10-23 21:15:57', 1);
INSERT INTO `t_log` VALUES (4064, '查询商品信息', '查询操作', '2018-10-23 21:15:57', 1);
INSERT INTO `t_log` VALUES (4065, '查询商品单位信息', '查询操作', '2018-10-23 21:15:57', 1);
INSERT INTO `t_log` VALUES (4066, '查询商品信息', '查询操作', '2018-10-23 21:15:57', 1);
INSERT INTO `t_log` VALUES (4067, '查询商品单位信息', '查询操作', '2018-10-23 21:15:57', 1);
INSERT INTO `t_log` VALUES (4068, '查询商品信息', '查询操作', '2018-10-23 21:16:01', 1);
INSERT INTO `t_log` VALUES (4069, '查询商品信息', '查询操作', '2018-10-23 21:16:03', 1);
INSERT INTO `t_log` VALUES (4070, '查询商品信息', '查询操作', '2018-10-23 21:16:16', 1);
INSERT INTO `t_log` VALUES (4071, '查询商品信息', '查询操作', '2018-10-23 21:16:18', 1);
INSERT INTO `t_log` VALUES (4072, '查询商品信息', '查询操作', '2018-10-23 21:16:23', 1);
INSERT INTO `t_log` VALUES (4073, '查询商品信息', '查询操作', '2018-10-23 21:16:30', 1);
INSERT INTO `t_log` VALUES (4074, '查询商品信息', '查询操作', '2018-10-23 21:16:35', 1);
INSERT INTO `t_log` VALUES (4075, '查询商品信息', '查询操作', '2018-10-23 21:16:36', 1);
INSERT INTO `t_log` VALUES (4076, '查询商品信息', '查询操作', '2018-10-23 21:16:37', 1);
INSERT INTO `t_log` VALUES (4077, '查询商品信息', '查询操作', '2018-10-23 21:16:39', 1);
INSERT INTO `t_log` VALUES (4078, '查询商品信息', '查询操作', '2018-10-23 21:16:41', 1);
INSERT INTO `t_log` VALUES (4079, '查询商品信息', '查询操作', '2018-10-23 21:16:56', 1);
INSERT INTO `t_log` VALUES (4080, '查询商品信息', '查询操作', '2018-10-23 21:17:12', 1);
INSERT INTO `t_log` VALUES (4081, '添加商品类别信息[id=null, name=hh, state=0, icon=icon-folder, pId=30]', '添加操作', '2018-10-23 21:17:25', 1);
INSERT INTO `t_log` VALUES (4082, '查询商品类别信息', '查询操作', '2018-10-23 21:17:25', 1);
INSERT INTO `t_log` VALUES (4083, '查询商品信息', '查询操作', '2018-10-23 21:17:27', 1);
INSERT INTO `t_log` VALUES (4084, '查询商品信息', '查询操作', '2018-10-23 21:29:16', 1);
INSERT INTO `t_log` VALUES (4085, '查询商品信息', '查询操作', '2018-10-23 21:29:18', 1);
INSERT INTO `t_log` VALUES (4086, '查询商品类别信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4087, '查询商品信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4088, '查询商品单位信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4089, '查询商品信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4090, '查询商品单位信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4091, '查询商品类别信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4092, '查询商品类别信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4093, '查询商品类别信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4094, '查询商品类别信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4095, '查询商品类别信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4096, '查询商品类别信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4097, '查询商品类别信息', '查询操作', '2018-10-23 21:29:22', 1);
INSERT INTO `t_log` VALUES (4098, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4099, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4100, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4101, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4102, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4103, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4104, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4105, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4106, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4107, '查询商品类别信息', '查询操作', '2018-10-23 21:29:23', 1);
INSERT INTO `t_log` VALUES (4108, '查询商品类别信息', '查询操作', '2018-10-23 21:29:24', 1);
INSERT INTO `t_log` VALUES (4109, '查询商品类别信息', '查询操作', '2018-10-23 21:29:24', 1);
INSERT INTO `t_log` VALUES (4110, '查询商品类别信息', '查询操作', '2018-10-23 21:29:24', 1);
INSERT INTO `t_log` VALUES (4111, '查询商品类别信息', '查询操作', '2018-10-23 21:29:24', 1);
INSERT INTO `t_log` VALUES (4112, '查询商品类别信息', '查询操作', '2018-10-23 21:29:24', 1);
INSERT INTO `t_log` VALUES (4113, '查询商品类别信息', '查询操作', '2018-10-23 21:29:24', 1);
INSERT INTO `t_log` VALUES (4114, '查询商品类别信息', '查询操作', '2018-10-23 21:29:25', 1);
INSERT INTO `t_log` VALUES (4115, '查询商品类别信息', '查询操作', '2018-10-23 21:29:25', 1);
INSERT INTO `t_log` VALUES (4116, '查询商品类别信息', '查询操作', '2018-10-23 21:29:25', 1);
INSERT INTO `t_log` VALUES (4117, '查询商品类别信息', '查询操作', '2018-10-23 21:29:26', 1);
INSERT INTO `t_log` VALUES (4118, '查询商品类别信息', '查询操作', '2018-10-23 21:29:26', 1);
INSERT INTO `t_log` VALUES (4119, '查询商品类别信息', '查询操作', '2018-10-23 21:29:26', 1);
INSERT INTO `t_log` VALUES (4120, '查询商品类别信息', '查询操作', '2018-10-23 21:29:27', 1);
INSERT INTO `t_log` VALUES (4121, '查询商品类别信息', '查询操作', '2018-10-23 21:29:27', 1);
INSERT INTO `t_log` VALUES (4122, '查询商品类别信息', '查询操作', '2018-10-23 21:29:27', 1);
INSERT INTO `t_log` VALUES (4123, '查询商品类别信息', '查询操作', '2018-10-23 21:29:28', 1);
INSERT INTO `t_log` VALUES (4124, '查询商品类别信息', '查询操作', '2018-10-23 21:29:28', 1);
INSERT INTO `t_log` VALUES (4125, '查询商品类别信息', '查询操作', '2018-10-23 21:29:28', 1);
INSERT INTO `t_log` VALUES (4126, '查询商品类别信息', '查询操作', '2018-10-23 21:29:29', 1);
INSERT INTO `t_log` VALUES (4127, '查询商品类别信息', '查询操作', '2018-10-23 21:29:29', 1);
INSERT INTO `t_log` VALUES (4128, '查询商品类别信息', '查询操作', '2018-10-23 21:29:30', 1);
INSERT INTO `t_log` VALUES (4129, '查询商品类别信息', '查询操作', '2018-10-23 21:29:30', 1);
INSERT INTO `t_log` VALUES (4130, '查询商品类别信息', '查询操作', '2018-10-23 21:29:31', 1);
INSERT INTO `t_log` VALUES (4131, '查询商品类别信息', '查询操作', '2018-10-23 21:29:31', 1);
INSERT INTO `t_log` VALUES (4132, '查询商品类别信息', '查询操作', '2018-10-23 21:29:32', 1);
INSERT INTO `t_log` VALUES (4133, '查询商品类别信息', '查询操作', '2018-10-23 21:29:32', 1);
INSERT INTO `t_log` VALUES (4134, '查询商品类别信息', '查询操作', '2018-10-23 21:29:33', 1);
INSERT INTO `t_log` VALUES (4135, '查询商品类别信息', '查询操作', '2018-10-23 21:29:34', 1);
INSERT INTO `t_log` VALUES (4136, '查询商品类别信息', '查询操作', '2018-10-23 21:29:34', 1);
INSERT INTO `t_log` VALUES (4137, '查询商品类别信息', '查询操作', '2018-10-23 21:29:35', 1);
INSERT INTO `t_log` VALUES (4138, '查询商品类别信息', '查询操作', '2018-10-23 21:29:36', 1);
INSERT INTO `t_log` VALUES (4139, '查询商品类别信息', '查询操作', '2018-10-23 21:29:36', 1);
INSERT INTO `t_log` VALUES (4140, '查询商品类别信息', '查询操作', '2018-10-23 21:29:37', 1);
INSERT INTO `t_log` VALUES (4141, '查询商品类别信息', '查询操作', '2018-10-23 21:29:38', 1);
INSERT INTO `t_log` VALUES (4142, '查询商品类别信息', '查询操作', '2018-10-23 21:29:39', 1);
INSERT INTO `t_log` VALUES (4143, '查询商品类别信息', '查询操作', '2018-10-23 21:29:39', 1);
INSERT INTO `t_log` VALUES (4144, '查询商品类别信息', '查询操作', '2018-10-23 21:29:40', 1);
INSERT INTO `t_log` VALUES (4145, '用户登录', '登录操作', '2018-10-23 21:31:50', 1);
INSERT INTO `t_log` VALUES (4146, '查询商品库存信息', '查询操作', '2018-10-23 21:31:51', 1);
INSERT INTO `t_log` VALUES (4147, '查询商品类别信息', '查询操作', '2018-10-23 21:31:57', 1);
INSERT INTO `t_log` VALUES (4148, '查询商品信息', '查询操作', '2018-10-23 21:31:57', 1);
INSERT INTO `t_log` VALUES (4149, '查询商品单位信息', '查询操作', '2018-10-23 21:31:57', 1);
INSERT INTO `t_log` VALUES (4150, '查询商品信息', '查询操作', '2018-10-23 21:31:57', 1);
INSERT INTO `t_log` VALUES (4151, '查询商品单位信息', '查询操作', '2018-10-23 21:31:57', 1);
INSERT INTO `t_log` VALUES (4152, '查询商品类别信息', '查询操作', '2018-10-23 21:31:57', 1);
INSERT INTO `t_log` VALUES (4153, '查询商品类别信息', '查询操作', '2018-10-23 21:31:58', 1);
INSERT INTO `t_log` VALUES (4154, '查询商品类别信息', '查询操作', '2018-10-23 21:31:58', 1);
INSERT INTO `t_log` VALUES (4155, '查询商品类别信息', '查询操作', '2018-10-23 21:31:58', 1);
INSERT INTO `t_log` VALUES (4156, '查询商品类别信息', '查询操作', '2018-10-23 21:31:58', 1);
INSERT INTO `t_log` VALUES (4157, '查询商品类别信息', '查询操作', '2018-10-23 21:31:58', 1);
INSERT INTO `t_log` VALUES (4158, '查询商品类别信息', '查询操作', '2018-10-23 21:31:58', 1);
INSERT INTO `t_log` VALUES (4159, '查询商品类别信息', '查询操作', '2018-10-23 21:31:58', 1);
INSERT INTO `t_log` VALUES (4160, '查询商品类别信息', '查询操作', '2018-10-23 21:31:58', 1);
INSERT INTO `t_log` VALUES (4161, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4162, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4163, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4164, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4165, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4166, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4167, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4168, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4169, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4170, '查询商品类别信息', '查询操作', '2018-10-23 21:31:59', 1);
INSERT INTO `t_log` VALUES (4171, '查询商品类别信息', '查询操作', '2018-10-23 21:32:00', 1);
INSERT INTO `t_log` VALUES (4172, '查询商品类别信息', '查询操作', '2018-10-23 21:32:00', 1);
INSERT INTO `t_log` VALUES (4173, '查询商品类别信息', '查询操作', '2018-10-23 21:32:00', 1);
INSERT INTO `t_log` VALUES (4174, '查询商品类别信息', '查询操作', '2018-10-23 21:32:00', 1);
INSERT INTO `t_log` VALUES (4175, '查询商品类别信息', '查询操作', '2018-10-23 21:32:00', 1);
INSERT INTO `t_log` VALUES (4176, '查询商品类别信息', '查询操作', '2018-10-23 21:32:00', 1);
INSERT INTO `t_log` VALUES (4177, '查询商品类别信息', '查询操作', '2018-10-23 21:32:01', 1);
INSERT INTO `t_log` VALUES (4178, '查询商品类别信息', '查询操作', '2018-10-23 21:32:01', 1);
INSERT INTO `t_log` VALUES (4179, '查询商品类别信息', '查询操作', '2018-10-23 21:32:01', 1);
INSERT INTO `t_log` VALUES (4180, '查询商品类别信息', '查询操作', '2018-10-23 21:32:01', 1);
INSERT INTO `t_log` VALUES (4181, '查询商品类别信息', '查询操作', '2018-10-23 21:32:02', 1);
INSERT INTO `t_log` VALUES (4182, '查询商品类别信息', '查询操作', '2018-10-23 21:32:02', 1);
INSERT INTO `t_log` VALUES (4183, '查询商品类别信息', '查询操作', '2018-10-23 21:32:02', 1);
INSERT INTO `t_log` VALUES (4184, '查询商品类别信息', '查询操作', '2018-10-23 21:32:02', 1);
INSERT INTO `t_log` VALUES (4185, '查询商品类别信息', '查询操作', '2018-10-23 21:32:03', 1);
INSERT INTO `t_log` VALUES (4186, '查询商品类别信息', '查询操作', '2018-10-23 21:32:03', 1);
INSERT INTO `t_log` VALUES (4187, '查询商品类别信息', '查询操作', '2018-10-23 21:32:03', 1);
INSERT INTO `t_log` VALUES (4188, '查询商品类别信息', '查询操作', '2018-10-23 21:32:04', 1);
INSERT INTO `t_log` VALUES (4189, '查询商品类别信息', '查询操作', '2018-10-23 21:32:04', 1);
INSERT INTO `t_log` VALUES (4190, '查询商品类别信息', '查询操作', '2018-10-23 21:32:04', 1);
INSERT INTO `t_log` VALUES (4191, '查询商品类别信息', '查询操作', '2018-10-23 21:32:05', 1);
INSERT INTO `t_log` VALUES (4192, '查询商品类别信息', '查询操作', '2018-10-23 21:32:05', 1);
INSERT INTO `t_log` VALUES (4193, '查询商品类别信息', '查询操作', '2018-10-23 21:32:05', 1);
INSERT INTO `t_log` VALUES (4194, '查询商品类别信息', '查询操作', '2018-10-23 21:32:06', 1);
INSERT INTO `t_log` VALUES (4195, '查询商品类别信息', '查询操作', '2018-10-23 21:32:06', 1);
INSERT INTO `t_log` VALUES (4196, '查询商品类别信息', '查询操作', '2018-10-23 21:32:07', 1);
INSERT INTO `t_log` VALUES (4197, '查询商品类别信息', '查询操作', '2018-10-23 21:32:08', 1);
INSERT INTO `t_log` VALUES (4198, '查询商品类别信息', '查询操作', '2018-10-23 21:32:09', 1);
INSERT INTO `t_log` VALUES (4199, '查询商品类别信息', '查询操作', '2018-10-23 21:35:14', 1);
INSERT INTO `t_log` VALUES (4200, '查询商品信息', '查询操作', '2018-10-23 21:35:14', 1);
INSERT INTO `t_log` VALUES (4201, '查询商品单位信息', '查询操作', '2018-10-23 21:35:14', 1);
INSERT INTO `t_log` VALUES (4202, '查询商品信息', '查询操作', '2018-10-23 21:35:14', 1);
INSERT INTO `t_log` VALUES (4203, '查询商品单位信息', '查询操作', '2018-10-23 21:35:14', 1);
INSERT INTO `t_log` VALUES (4204, '查询商品信息', '查询操作', '2018-10-23 21:35:16', 1);
INSERT INTO `t_log` VALUES (4205, '查询商品信息', '查询操作', '2018-10-23 21:35:17', 1);
INSERT INTO `t_log` VALUES (4206, '查询商品信息', '查询操作', '2018-10-23 21:35:17', 1);
INSERT INTO `t_log` VALUES (4207, '查询商品信息', '查询操作', '2018-10-23 21:35:18', 1);
INSERT INTO `t_log` VALUES (4208, '查询商品信息', '查询操作', '2018-10-23 21:35:18', 1);
INSERT INTO `t_log` VALUES (4209, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4210, '查询商品信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4211, '查询商品单位信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4212, '查询商品信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4213, '查询商品单位信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4214, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4215, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4216, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4217, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4218, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4219, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4220, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4221, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4222, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4223, '查询商品类别信息', '查询操作', '2018-10-23 21:37:12', 1);
INSERT INTO `t_log` VALUES (4224, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4225, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4226, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4227, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4228, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4229, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4230, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4231, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4232, '查询商品类别信息', '查询操作', '2018-10-23 21:37:13', 1);
INSERT INTO `t_log` VALUES (4233, '查询商品类别信息', '查询操作', '2018-10-23 21:37:14', 1);
INSERT INTO `t_log` VALUES (4234, '查询商品类别信息', '查询操作', '2018-10-23 21:37:14', 1);
INSERT INTO `t_log` VALUES (4235, '查询商品类别信息', '查询操作', '2018-10-23 21:37:14', 1);
INSERT INTO `t_log` VALUES (4236, '查询商品类别信息', '查询操作', '2018-10-23 21:37:14', 1);
INSERT INTO `t_log` VALUES (4237, '查询商品类别信息', '查询操作', '2018-10-23 21:37:14', 1);
INSERT INTO `t_log` VALUES (4238, '查询商品类别信息', '查询操作', '2018-10-23 21:37:15', 1);
INSERT INTO `t_log` VALUES (4239, '查询商品类别信息', '查询操作', '2018-10-23 21:37:15', 1);
INSERT INTO `t_log` VALUES (4240, '查询商品类别信息', '查询操作', '2018-10-23 21:37:15', 1);
INSERT INTO `t_log` VALUES (4241, '查询商品类别信息', '查询操作', '2018-10-23 21:37:16', 1);
INSERT INTO `t_log` VALUES (4242, '查询商品类别信息', '查询操作', '2018-10-23 21:37:16', 1);
INSERT INTO `t_log` VALUES (4243, '查询商品类别信息', '查询操作', '2018-10-23 21:37:16', 1);
INSERT INTO `t_log` VALUES (4244, '查询商品类别信息', '查询操作', '2018-10-23 21:37:16', 1);
INSERT INTO `t_log` VALUES (4245, '查询商品类别信息', '查询操作', '2018-10-23 21:37:17', 1);
INSERT INTO `t_log` VALUES (4246, '查询商品类别信息', '查询操作', '2018-10-23 21:37:17', 1);
INSERT INTO `t_log` VALUES (4247, '查询商品类别信息', '查询操作', '2018-10-23 21:37:17', 1);
INSERT INTO `t_log` VALUES (4248, '查询商品类别信息', '查询操作', '2018-10-23 21:37:18', 1);
INSERT INTO `t_log` VALUES (4249, '查询商品类别信息', '查询操作', '2018-10-23 21:37:18', 1);
INSERT INTO `t_log` VALUES (4250, '查询商品类别信息', '查询操作', '2018-10-23 21:37:19', 1);
INSERT INTO `t_log` VALUES (4251, '查询商品类别信息', '查询操作', '2018-10-23 21:37:19', 1);
INSERT INTO `t_log` VALUES (4252, '查询商品类别信息', '查询操作', '2018-10-23 21:37:20', 1);
INSERT INTO `t_log` VALUES (4253, '查询商品类别信息', '查询操作', '2018-10-23 21:37:20', 1);
INSERT INTO `t_log` VALUES (4254, '查询商品类别信息', '查询操作', '2018-10-23 21:37:21', 1);
INSERT INTO `t_log` VALUES (4255, '查询商品类别信息', '查询操作', '2018-10-23 21:37:21', 1);
INSERT INTO `t_log` VALUES (4256, '查询商品类别信息', '查询操作', '2018-10-23 21:37:22', 1);
INSERT INTO `t_log` VALUES (4257, '查询商品类别信息', '查询操作', '2018-10-23 21:37:22', 1);
INSERT INTO `t_log` VALUES (4258, '查询商品类别信息', '查询操作', '2018-10-23 21:37:23', 1);
INSERT INTO `t_log` VALUES (4259, '查询商品类别信息', '查询操作', '2018-10-23 21:37:24', 1);
INSERT INTO `t_log` VALUES (4260, '查询商品库存信息', '查询操作', '2018-10-23 21:56:57', 1);
INSERT INTO `t_log` VALUES (4261, '查询商品类别信息', '查询操作', '2018-10-23 22:18:57', 1);
INSERT INTO `t_log` VALUES (4262, '查询商品信息', '查询操作', '2018-10-23 22:18:57', 1);
INSERT INTO `t_log` VALUES (4263, '查询商品单位信息', '查询操作', '2018-10-23 22:18:57', 1);
INSERT INTO `t_log` VALUES (4264, '查询商品信息', '查询操作', '2018-10-23 22:18:57', 1);
INSERT INTO `t_log` VALUES (4265, '查询商品单位信息', '查询操作', '2018-10-23 22:18:57', 1);
INSERT INTO `t_log` VALUES (4266, '查询商品信息', '查询操作', '2018-10-23 22:19:01', 1);
INSERT INTO `t_log` VALUES (4267, '查询商品信息', '查询操作', '2018-10-23 22:19:06', 1);
INSERT INTO `t_log` VALUES (4268, '查询商品信息', '查询操作', '2018-10-23 22:19:20', 1);
INSERT INTO `t_log` VALUES (4269, '查询角色信息', '查询操作', '2018-10-23 22:20:03', 1);
INSERT INTO `t_log` VALUES (4270, '查询角色信息', '查询操作', '2018-10-23 22:20:03', 1);
INSERT INTO `t_log` VALUES (4271, '保存角色权限设置', '添加操作', '2018-10-23 22:20:17', 1);
INSERT INTO `t_log` VALUES (4272, '保存角色权限设置', '添加操作', '2018-10-23 22:20:26', 1);
INSERT INTO `t_log` VALUES (4273, '用户注销', '注销操作', '2018-10-23 22:20:31', 1);
INSERT INTO `t_log` VALUES (4274, '用户登录', '登录操作', '2018-10-23 22:20:56', 2);
INSERT INTO `t_log` VALUES (4275, '查询角色信息', '查询操作', '2018-10-23 22:21:12', 2);
INSERT INTO `t_log` VALUES (4276, '查询角色信息', '查询操作', '2018-10-23 22:21:12', 2);
INSERT INTO `t_log` VALUES (4277, '查询用户信息', '查询操作', '2018-10-23 22:21:15', 2);
INSERT INTO `t_log` VALUES (4278, '查询用户信息', '查询操作', '2018-10-23 22:21:15', 2);
INSERT INTO `t_log` VALUES (4279, '保存角色权限设置', '添加操作', '2018-10-23 22:21:42', 2);
INSERT INTO `t_log` VALUES (4280, '保存角色权限设置', '添加操作', '2018-10-23 22:22:29', 2);
INSERT INTO `t_log` VALUES (4281, '保存角色权限设置', '添加操作', '2018-10-23 22:23:19', 2);
INSERT INTO `t_log` VALUES (4282, '用户注销', '注销操作', '2018-10-23 22:24:58', 2);
INSERT INTO `t_log` VALUES (4283, '用户登录', '登录操作', '2018-10-23 22:25:16', 2);
INSERT INTO `t_log` VALUES (4284, '用户注销', '注销操作', '2018-10-23 22:25:38', 2);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `state` int(11) NULL DEFAULT NULL COMMENT '节点类型：1 有子节点，0 无子节点',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '父菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsni20f28wjqrmpp44uawa2ky4`(`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6051 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '系统菜单', 'menu-plugin', 1, NULL, -1);
INSERT INTO `t_menu` VALUES (10, '进货管理', 'menu-1', 1, NULL, 1);
INSERT INTO `t_menu` VALUES (20, '销售管理', 'menu-2', 1, NULL, 1);
INSERT INTO `t_menu` VALUES (30, '库存管理', 'menu-3', 1, NULL, 1);
INSERT INTO `t_menu` VALUES (40, '统计报表', 'menu-4', 1, NULL, 1);
INSERT INTO `t_menu` VALUES (50, '基础资料', 'menu-5', 1, NULL, 1);
INSERT INTO `t_menu` VALUES (60, '系统管理', 'menu-6', 1, NULL, 1);
INSERT INTO `t_menu` VALUES (1010, '进货入库', 'menu-11', 0, '/purchase/purchase.html', 10);
INSERT INTO `t_menu` VALUES (1020, '退货出库', 'menu-12', 0, '/purchase/return.html', 10);
INSERT INTO `t_menu` VALUES (1030, '进货单据查询', 'menu-13', 0, '/purchase/purchaseSearch.html', 10);
INSERT INTO `t_menu` VALUES (1040, '退货单据查询', 'menu-14', 0, '/purchase/returnSearch.html', 10);
INSERT INTO `t_menu` VALUES (1050, '当前库存查询', 'menu-15', 0, '/common/stockSearch.html', 10);
INSERT INTO `t_menu` VALUES (2010, '销售出库', 'menu-21', 0, '/sale/saleout.html', 20);
INSERT INTO `t_menu` VALUES (2020, '客户退货', 'menu-22', 0, '/sale/salereturn.html', 20);
INSERT INTO `t_menu` VALUES (2030, '销售单据查询', 'menu-23', 0, '/sale/saleSearch.html', 20);
INSERT INTO `t_menu` VALUES (2040, '客户退货查询', 'menu-24', 0, '/sale/returnSearch.html', 20);
INSERT INTO `t_menu` VALUES (2050, '当前库存查询', 'menu-25', 0, '/common/stockSearch.html', 20);
INSERT INTO `t_menu` VALUES (3010, '商品报损', 'menu-31', 0, '/stock/damage.html', 30);
INSERT INTO `t_menu` VALUES (3020, '商品报溢', 'menu-32', 0, '/stock/overflow.html', 30);
INSERT INTO `t_menu` VALUES (3030, '库存报警', 'menu-33', 0, '/stock/alarm.html', 30);
INSERT INTO `t_menu` VALUES (3040, '报损报溢查询', 'menu-34', 0, '/stock/damageOverflowSearch.html', 30);
INSERT INTO `t_menu` VALUES (3050, '当前库存查询', 'menu-35', 0, '/common/stockSearch.html', 30);
INSERT INTO `t_menu` VALUES (4010, '供应商统计', 'menu-41', 0, '/count/supplier.html', 40);
INSERT INTO `t_menu` VALUES (4020, '客户统计', 'menu-42', 0, '/count/customer.html', 40);
INSERT INTO `t_menu` VALUES (4030, '商品采购统计', 'menu-43', 0, '/count/purchase.html', 40);
INSERT INTO `t_menu` VALUES (4040, '商品销售统计', 'menu-44', 0, '/count/sale.html', 40);
INSERT INTO `t_menu` VALUES (4050, '按日统计分析', 'menu-45', 0, '/count/saleDay.html', 40);
INSERT INTO `t_menu` VALUES (4060, '按月统计分析', 'menu-46', 0, '/count/saleMonth.html', 40);
INSERT INTO `t_menu` VALUES (5010, '供应商管理', 'menu-51', 0, '/basicData/supplier.html', 50);
INSERT INTO `t_menu` VALUES (5020, '客户管理', 'menu-52', 0, '/basicData/customer.html', 50);
INSERT INTO `t_menu` VALUES (5030, '商品管理', 'menu-53', 0, '/basicData/goods.html', 50);
INSERT INTO `t_menu` VALUES (5040, '期初库存', 'menu-54', 0, '/basicData/stock.html', 50);
INSERT INTO `t_menu` VALUES (6010, '角色管理', 'menu-61', 0, '/power/role.html', 60);
INSERT INTO `t_menu` VALUES (6020, '用户管理', 'menu-62', 0, '/power/user.html', 60);
INSERT INTO `t_menu` VALUES (6030, '系统日志', 'menu-65', 0, '/power/log.html', 60);
INSERT INTO `t_menu` VALUES (6040, '修改密码', 'menu-63', 0, NULL, 60);
INSERT INTO `t_menu` VALUES (6050, '安全退出', 'menu-64', 0, NULL, 60);

-- ----------------------------
-- Table structure for t_overflow_list
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list`;
CREATE TABLE `t_overflow_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `overflow_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报溢单单号',
  `overflow_date` datetime(0) NULL DEFAULT NULL COMMENT '报溢日期',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK3bu8hj2xniqwbrtg6ls6b8ej2`(`user_id`) USING BTREE,
  CONSTRAINT `FK3bu8hj2xniqwbrtg6ls6b8ej2` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报溢单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_overflow_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_overflow_list_goods`;
CREATE TABLE `t_overflow_list_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总价',
  `overflow_list_id` int(11) NULL DEFAULT NULL COMMENT '对应报溢单表id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类别id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKd3s9761mgl456tn2xb0d164h7`(`overflow_list_id`) USING BTREE,
  INDEX `FK8t46iik5kpciki8fnqtiuq5q3`(`type_id`) USING BTREE,
  CONSTRAINT `FK8t46iik5kpciki8fnqtiuq5q3` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKd3s9761mgl456tn2xb0d164h7` FOREIGN KEY (`overflow_list_id`) REFERENCES `t_overflow_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报溢单商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_purchase_list
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list`;
CREATE TABLE `t_purchase_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `purchase_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '进货单单号',
  `amount_paid` float NOT NULL COMMENT '实付金额',
  `amount_payable` float NOT NULL COMMENT '应付金额',
  `purchase_date` datetime(0) NULL DEFAULT NULL COMMENT '进货日期',
  `state` int(11) NOT NULL COMMENT '交易状态：1 已付，2 未付',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5j2dev8b2b5d0l69nb8vtr4yb`(`supplier_id`) USING BTREE,
  INDEX `FK69s6eyxr4wwvsywe9hbthef1h`(`user_id`) USING BTREE,
  CONSTRAINT `FK5j2dev8b2b5d0l69nb8vtr4yb` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK69s6eyxr4wwvsywe9hbthef1h` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进货单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_purchase_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_list_goods`;
CREATE TABLE `t_purchase_list_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总价',
  `purchase_list_id` int(11) NULL DEFAULT NULL COMMENT '对应进货单表id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类别id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKfvdvgcebqkkokyn0o00idqnpy`(`purchase_list_id`) USING BTREE,
  INDEX `FK83ikbi2x3epn49fwcco8jlfwu`(`type_id`) USING BTREE,
  CONSTRAINT `FK83ikbi2x3epn49fwcco8jlfwu` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKfvdvgcebqkkokyn0o00idqnpy` FOREIGN KEY (`purchase_list_id`) REFERENCES `t_purchase_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进货单商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_return_list
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list`;
CREATE TABLE `t_return_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `return_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货单单号',
  `state` int(11) NOT NULL COMMENT '交易状态：1 已付，2 未付',
  `amount_paid` float NOT NULL COMMENT '实付金额',
  `amount_payable` float NOT NULL COMMENT '应付金额',
  `return_date` datetime(0) NULL DEFAULT NULL COMMENT '退货日期',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `supplier_id` int(11) NULL DEFAULT NULL COMMENT '供应商id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK4qxjj8bvj2etne243xluni0vn`(`supplier_id`) USING BTREE,
  INDEX `FK904juw2v1hm2av0ig26gae9jb`(`user_id`) USING BTREE,
  CONSTRAINT `FK4qxjj8bvj2etne243xluni0vn` FOREIGN KEY (`supplier_id`) REFERENCES `t_supplier` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK904juw2v1hm2av0ig26gae9jb` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_return_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_return_list_goods`;
CREATE TABLE `t_return_list_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总价',
  `return_list_id` int(11) NULL DEFAULT NULL COMMENT '对应退货单表id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类别id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKemclu281vyvyk063c3foafq1w`(`return_list_id`) USING BTREE,
  INDEX `FKa1prpd96fcs0x2oe0omny9vio`(`type_id`) USING BTREE,
  CONSTRAINT `FKa1prpd96fcs0x2oe0omny9vio` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKemclu281vyvyk063c3foafq1w` FOREIGN KEY (`return_list_id`) REFERENCES `t_return_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货单商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', '拥有系统所有权限');
INSERT INTO `t_role` VALUES (2, '主管', NULL);
INSERT INTO `t_role` VALUES (4, '采购员', NULL);
INSERT INTO `t_role` VALUES (5, '销售经理', '');
INSERT INTO `t_role` VALUES (7, '仓库管理员', NULL);
INSERT INTO `t_role` VALUES (9, '总经理', NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单表id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsonb0rbt2u99hbrqqvv3r0wse`(`role_id`) USING BTREE,
  INDEX `FKhayg4ib6v7h1wyeyxhq6xlddq`(`menu_id`) USING BTREE,
  CONSTRAINT `FKhayg4ib6v7h1wyeyxhq6xlddq` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKsonb0rbt2u99hbrqqvv3r0wse` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (2, 1, 1);
INSERT INTO `t_role_menu` VALUES (3, 10, 1);
INSERT INTO `t_role_menu` VALUES (4, 20, 1);
INSERT INTO `t_role_menu` VALUES (5, 30, 1);
INSERT INTO `t_role_menu` VALUES (6, 40, 1);
INSERT INTO `t_role_menu` VALUES (7, 50, 1);
INSERT INTO `t_role_menu` VALUES (8, 60, 1);
INSERT INTO `t_role_menu` VALUES (9, 1010, 1);
INSERT INTO `t_role_menu` VALUES (10, 1020, 1);
INSERT INTO `t_role_menu` VALUES (11, 1030, 1);
INSERT INTO `t_role_menu` VALUES (12, 1040, 1);
INSERT INTO `t_role_menu` VALUES (13, 1050, 1);
INSERT INTO `t_role_menu` VALUES (14, 2010, 1);
INSERT INTO `t_role_menu` VALUES (15, 2020, 1);
INSERT INTO `t_role_menu` VALUES (16, 2030, 1);
INSERT INTO `t_role_menu` VALUES (17, 2040, 1);
INSERT INTO `t_role_menu` VALUES (18, 2050, 1);
INSERT INTO `t_role_menu` VALUES (19, 3010, 1);
INSERT INTO `t_role_menu` VALUES (20, 3020, 1);
INSERT INTO `t_role_menu` VALUES (21, 3030, 1);
INSERT INTO `t_role_menu` VALUES (22, 3040, 1);
INSERT INTO `t_role_menu` VALUES (23, 3050, 1);
INSERT INTO `t_role_menu` VALUES (24, 4010, 1);
INSERT INTO `t_role_menu` VALUES (25, 4020, 1);
INSERT INTO `t_role_menu` VALUES (26, 4030, 1);
INSERT INTO `t_role_menu` VALUES (27, 4040, 1);
INSERT INTO `t_role_menu` VALUES (28, 4050, 1);
INSERT INTO `t_role_menu` VALUES (29, 4060, 1);
INSERT INTO `t_role_menu` VALUES (30, 5010, 1);
INSERT INTO `t_role_menu` VALUES (31, 5020, 1);
INSERT INTO `t_role_menu` VALUES (32, 5030, 1);
INSERT INTO `t_role_menu` VALUES (33, 5040, 1);
INSERT INTO `t_role_menu` VALUES (34, 6010, 1);
INSERT INTO `t_role_menu` VALUES (35, 6020, 1);
INSERT INTO `t_role_menu` VALUES (43, 6030, 1);
INSERT INTO `t_role_menu` VALUES (44, 6040, 1);
INSERT INTO `t_role_menu` VALUES (48, 1, 5);
INSERT INTO `t_role_menu` VALUES (49, 30, 5);
INSERT INTO `t_role_menu` VALUES (50, 3010, 5);
INSERT INTO `t_role_menu` VALUES (64, 6050, 1);
INSERT INTO `t_role_menu` VALUES (65, 1, 7);
INSERT INTO `t_role_menu` VALUES (66, 10, 7);
INSERT INTO `t_role_menu` VALUES (67, 1010, 7);
INSERT INTO `t_role_menu` VALUES (68, 1020, 7);
INSERT INTO `t_role_menu` VALUES (69, 1030, 7);
INSERT INTO `t_role_menu` VALUES (70, 1040, 7);
INSERT INTO `t_role_menu` VALUES (71, 1050, 7);
INSERT INTO `t_role_menu` VALUES (72, 20, 7);
INSERT INTO `t_role_menu` VALUES (73, 2010, 7);
INSERT INTO `t_role_menu` VALUES (74, 2020, 7);
INSERT INTO `t_role_menu` VALUES (75, 2030, 7);
INSERT INTO `t_role_menu` VALUES (76, 40, 7);
INSERT INTO `t_role_menu` VALUES (77, 4010, 7);
INSERT INTO `t_role_menu` VALUES (78, 4020, 7);
INSERT INTO `t_role_menu` VALUES (79, 1, 2);
INSERT INTO `t_role_menu` VALUES (80, 10, 2);
INSERT INTO `t_role_menu` VALUES (81, 1010, 2);
INSERT INTO `t_role_menu` VALUES (82, 1020, 2);
INSERT INTO `t_role_menu` VALUES (83, 1030, 2);
INSERT INTO `t_role_menu` VALUES (84, 1040, 2);
INSERT INTO `t_role_menu` VALUES (85, 1050, 2);
INSERT INTO `t_role_menu` VALUES (86, 60, 2);
INSERT INTO `t_role_menu` VALUES (87, 6010, 2);
INSERT INTO `t_role_menu` VALUES (88, 6020, 2);
INSERT INTO `t_role_menu` VALUES (89, 6030, 2);
INSERT INTO `t_role_menu` VALUES (90, 6040, 2);
INSERT INTO `t_role_menu` VALUES (91, 6050, 2);
INSERT INTO `t_role_menu` VALUES (130, 1, 9);
INSERT INTO `t_role_menu` VALUES (131, 30, 9);
INSERT INTO `t_role_menu` VALUES (132, 3040, 9);
INSERT INTO `t_role_menu` VALUES (133, 3050, 9);
INSERT INTO `t_role_menu` VALUES (134, 50, 9);
INSERT INTO `t_role_menu` VALUES (135, 5010, 9);
INSERT INTO `t_role_menu` VALUES (136, 5020, 9);
INSERT INTO `t_role_menu` VALUES (137, 5030, 9);
INSERT INTO `t_role_menu` VALUES (138, 5040, 9);
INSERT INTO `t_role_menu` VALUES (139, 1, 4);
INSERT INTO `t_role_menu` VALUES (140, 20, 4);
INSERT INTO `t_role_menu` VALUES (141, 2010, 4);
INSERT INTO `t_role_menu` VALUES (142, 40, 4);
INSERT INTO `t_role_menu` VALUES (143, 60, 4);
INSERT INTO `t_role_menu` VALUES (144, 6010, 4);
INSERT INTO `t_role_menu` VALUES (145, 6020, 4);
INSERT INTO `t_role_menu` VALUES (146, 6030, 4);
INSERT INTO `t_role_menu` VALUES (147, 6040, 4);
INSERT INTO `t_role_menu` VALUES (148, 6050, 4);

-- ----------------------------
-- Table structure for t_sale_list
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list`;
CREATE TABLE `t_sale_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sale_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售单单号',
  `state` int(11) NULL DEFAULT NULL COMMENT '交易状态：1 已付，2 未付',
  `amount_paid` float NOT NULL COMMENT '实付金额',
  `amount_payable` float NOT NULL COMMENT '应付金额',
  `sale_date` datetime(0) NULL DEFAULT NULL COMMENT '销售日期',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作用户id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK34bnujemrdqimbhg133enp8k8`(`user_id`) USING BTREE,
  INDEX `FKox4qfs87eu3fvwdmrvelqhi8e`(`customer_id`) USING BTREE,
  CONSTRAINT `FK34bnujemrdqimbhg133enp8k8` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKox4qfs87eu3fvwdmrvelqhi8e` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sale_list_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_sale_list_goods`;
CREATE TABLE `t_sale_list_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品型号',
  `num` int(11) NOT NULL COMMENT '商品数量',
  `price` float NOT NULL COMMENT '商品单价',
  `total` float NOT NULL COMMENT '总价',
  `sale_list_id` int(11) NULL DEFAULT NULL COMMENT '对应销售单表id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '商品类别id',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK20ehd6ta9geyql4hxtdsnhbox`(`sale_list_id`) USING BTREE,
  INDEX `FKn9i5p1d8f0gek5x7q45cq8ibw`(`type_id`) USING BTREE,
  CONSTRAINT `FK20ehd6ta9geyql4hxtdsnhbox` FOREIGN KEY (`sale_list_id`) REFERENCES `t_sale_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKn9i5p1d8f0gek5x7q45cq8ibw` FOREIGN KEY (`type_id`) REFERENCES `t_goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售单商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_supplier
-- ----------------------------
DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE `t_supplier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_supplier
-- ----------------------------
INSERT INTO `t_supplier` VALUES (1, '淘宝', '马云', '18811111111', '浙江省杭州市阿里巴巴集团', '浙江省杭州市阿里巴巴集团  马老板是个教师');
INSERT INTO `t_supplier` VALUES (2, '腾讯', '马化腾', '18588888888', '广东省深圳市', '充Q币不咯');
INSERT INTO `t_supplier` VALUES (3, '江西省井冈黄菊花茶有限公司', '林之一', '15785269512', '江西省井冈山市', '上等花茶');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `true_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `remarks` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', '管理员', '管理员');
INSERT INTO `t_user` VALUES (2, 'lin', 'lin', '林总', '采购经理');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKa9c8iiy6ut0gnx491fqx4pxam`(`role_id`) USING BTREE,
  INDEX `FKq5un6x7ecoef5w1n39cop66kl`(`user_id`) USING BTREE,
  CONSTRAINT `FKa9c8iiy6ut0gnx491fqx4pxam` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKq5un6x7ecoef5w1n39cop66kl` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1, 1);
INSERT INTO `t_user_role` VALUES (2, 4, 2);

SET FOREIGN_KEY_CHECKS = 1;
