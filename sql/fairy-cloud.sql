/*
 Navicat Premium Data Transfer

 Source Server         : node01-mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : node01:33306
 Source Schema         : fairy-cloud

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 01/08/2022 21:13:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `client_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_token_validity` int(0) NULL DEFAULT NULL,
  `refresh_token_validity` int(0) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('fairy-cloud-gateway', 'order-service,product-service,member-service', '$2a$10$otcOPV8Tl6N0Q6HbsPAQcOg2spzNJxOs62gGW1dgAcpbgkvTqsu.e', 'read,write', 'password,authorization_code,refresh_token', NULL, NULL, 86400, 3600, NULL, 'true');

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `factory_status` int(0) NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(0) NULL DEFAULT NULL COMMENT '状态',
  `product_count` int(0) NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(0) NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, '万和', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', NULL, '三星的故事');
INSERT INTO `pms_brand` VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (6, '小米', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/1e34aef2a409119018a4c6258e39ecfb_222_222.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事');
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string');
INSERT INTO `pms_brand` VALUES (49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/18d8bc3eb13533fab466d702a0d3fd1f40345bcd.jpg', NULL, 'BOOB的故事');
INSERT INTO `pms_brand` VALUES (50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/99d3279f1029d32b929343b09d3c72de_222_222.jpg', '', '海澜之家的故事');
INSERT INTO `pms_brand` VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '苹果的故事');
INSERT INTO `pms_brand` VALUES (58, 'NIKE', 'N', 0, 1, 1, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事');
INSERT INTO `pms_brand` VALUES (59, '朵唯', 'duowei', 0, 1, 1, NULL, NULL, 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2b84746650fc122d67749a876c453619.png', 'http://tuling-mall.oss-cn-shenzhen.aliyuncs.com/tulingmall/images/20200311/2b84746650fc122d67749a876c453619.png', '朵唯');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(0) NULL DEFAULT NULL COMMENT '品牌id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `delete_status` int(0) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(0) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(0) NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(0) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(0) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `sale` int(0) NULL DEFAULT NULL COMMENT '销量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(0) NULL DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端网页详情',
  `promotion_start_time` datetime(0) NULL DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime(0) NULL DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(0) NULL DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(0) NULL DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 49, '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 1, 1, 1, 1, 100, 0, 100.00, NULL, '111', '111', 120.00, 100, 1000.00, 0, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '七匹狼');
INSERT INTO `pms_product` VALUES (2, 49, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 0, 1, 1, 1, 1, 1, 0, 100.00, NULL, '111', '111', 120.00, 100, 1000.00, 0, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼');
INSERT INTO `pms_product` VALUES (3, 1, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 0, 1, 1, 1, 1, 1, 0, 100.00, NULL, '111', '111', 120.00, 100, 1000.00, 0, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和');
INSERT INTO `pms_product` VALUES (4, 1, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 0, 1, 1, 1, 1, 1, 0, 100.00, NULL, '111', '111', 120.00, 100, 1000.00, 0, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和');
INSERT INTO `pms_product` VALUES (5, 1, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 0, 0, 1, 1, 1, 1, 0, 100.00, NULL, '111', '111', 120.00, 100, 1000.00, 0, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和');
INSERT INTO `pms_product` VALUES (6, 1, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 0, 1, 1, 1, 1, 1, 0, 100.00, NULL, '111', '111', 120.00, 100, 1000.00, 0, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和');
INSERT INTO `pms_product` VALUES (7, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 0, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (8, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 0, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (9, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 0, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (10, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 0, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (11, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 1, 0, 1, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (12, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 1, 0, 1, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (13, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 1, 0, 1, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (14, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 1, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (18, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 0, 0, 1, 0, 0, 0, 249.00, 0.00, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0.00, 0, '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和');
INSERT INTO `pms_product` VALUES (23, 6, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 0, 1, 1, 1, 0, 0, 0, 99.00, NULL, '毛衫测试11', 'xxx', 109.00, 100, 1000.00, 1, '毛衫测试', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, '小米');
INSERT INTO `pms_product` VALUES (24, 6, '华为 HUAWEI P30', '', '', 0, 0, 0, 0, 0, 0, 0, 0.00, NULL, 'xxx', '', 0.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 0, '小米');
INSERT INTO `pms_product` VALUES (26, 6, '小米 11', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 0, 0, 0, 100, 0, 3788.00, NULL, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0.00, 1, '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', NULL, NULL, 0, 1, '小米');
INSERT INTO `pms_product` VALUES (27, 6, '小米8 全面屏游戏智能手机 12GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 0, 0, 0, 0, 0, 2699.00, NULL, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0.00, 0, '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', NULL, NULL, 0, 3, '小米');
INSERT INTO `pms_product` VALUES (28, 6, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 0, 0, 0, 0, 0, 649.00, NULL, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 4, '小米');
INSERT INTO `pms_product` VALUES (29, 51, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 1, 0, 0, 0, 0, 0, 5499.00, NULL, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 0, '苹果');
INSERT INTO `pms_product` VALUES (31, 50, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家');
INSERT INTO `pms_product` VALUES (32, 50, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家');
INSERT INTO `pms_product` VALUES (33, 6, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 0, 0, 0, 0, 0, 2499.00, NULL, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 0, '小米');
INSERT INTO `pms_product` VALUES (34, 6, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 0, 0, 0, 0, 0, 3999.00, NULL, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 0, '小米');
INSERT INTO `pms_product` VALUES (35, 58, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE');
INSERT INTO `pms_product` VALUES (36, 58, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 100, 0.00, 0, '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE');
INSERT INTO `pms_product` VALUES (42, 59, '朵唯智能手机 4G全网通 老人学生双卡双待手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '3333', 0, 1, 1, 1, 0, 0, 0, 527.00, NULL, '后置双摄，国产虎贲芯片！优化散热结构！浅薄机身！朵唯4月特惠！', '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 4G全网通 老人学生双卡双待手机', 599.00, 100, 350.00, 0, '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 ', '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 ', '朵唯（DOOV）D11Pro 6GB+64GB 冰海兰 智能手机 ', '<p><img src=\"http://img30.360buyimg.com/sku/jfs/t1/159458/8/366/274699/5feade9bE29f47d46/0bec91c539721422.jpg\" width=\"790\" height=\"1191\" /></p>', '', NULL, NULL, 0, 0, '朵唯');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `status` int(0) NULL DEFAULT NULL COMMENT '上下线状态,1上线、0下线',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES (3, '秒杀专场', '2020-02-15', '2021-06-10', 1, '2018-11-16 11:11:31');
INSERT INTO `sms_flash_promotion` VALUES (7, '春季家电家具疯狂秒杀6', '2021-11-04', '2021-11-25', 0, '2018-11-16 11:12:35');

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(0) NULL DEFAULT NULL COMMENT '秒杀活动ID->关联sms_flash_promotion表',
  `flash_promotion_session_id` bigint(0) NULL DEFAULT NULL COMMENT '当前日期活动场次编号',
  `product_id` bigint(0) NULL DEFAULT NULL COMMENT '产品ID',
  `flash_promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(0) NULL DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(0) NULL DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品限时购与商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES (26, 3, 2, 32, 60.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (40, 3, 5, 29, 4999.00, 10, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (41, 3, 1, 42, 499.00, 100, 1, 1);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (42, 3, 3, 26, 3700.00, 123, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (43, 3, 4, 26, 3699.00, 89, 11, 1);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场次名称',
  `start_time` time(0) NULL DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time(0) NULL DEFAULT NULL COMMENT '每日结束时间',
  `status` int(0) NULL DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购场次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES (1, '16:00场', '08:00:00', '10:00:33', 1, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES (2, '18:00场', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES (3, '20:00场', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES (4, '10:00场', '02:00:00', '04:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES (5, '13:00场', '05:00:00', '07:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '20:00:00', 0, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '20:00:33', '21:00:33', 0, '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` int(0) NULL DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` int(0) NULL DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `source_type` int(0) NULL DEFAULT NULL COMMENT '用户来源',
  `integration` int(0) NULL DEFAULT NULL COMMENT '积分',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1012 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 'test', '$2a$10$iqi1A/3sam.6je3Kfj4RdutIKBdWvUAnd507z2PeZzAZjCmD9f0m.', 'windir', '18061581849', 1, '2018-08-02 10:35:44', NULL, 1, '2009-06-01', '上海', '学生', 'test', NULL, 6000);
INSERT INTO `ums_member` VALUES (3, 'admin', '$2a$10$9vKfm2u.omZgLehUdyhg..slFEnK059uyzAspjxI4jdnFMB1pUMRW', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (4, 'zhengsan', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (5, 'lisi', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (6, 'wangwu', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (7, 'lion', '$2a$10$cEQUIgXzz3V95.WipbS8m.6rV1Rprylw.HLg.7.L0s0GlLTbTYzrK', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (8, 'monkey', '$2a$10$Ab5VsAaD.uvoXuKCSzTP0.tBXnJ1aoX08u77tUT7yuu/MFjG59NU2', 'monkey', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (9, 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (10, 'yg', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'yangguo', '13829022921', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (11, 'xiaolongnv', '$2a$10$t7uC4Cj/V7KPARHJQw8Js.WqV4iiAr.dmEiV4kQNRteu33GK.0gyq', 'xiaolongnv', '18061581859', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (12, 'yangguo1', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo1', '173739601', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (13, 'yangguo2', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo2', '173739602', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (14, 'yangguo3', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo3', '173739603', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (15, 'yangguo4', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo4', '173739604', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (16, 'yangguo5', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo5', '173739605', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (17, 'yangguo6', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo6', '173739606', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (18, 'yangguo7', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo7', '173739607', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (19, 'yangguo8', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo8', '173739608', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (20, 'yangguo9', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo9', '173739609', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (21, 'yangguo10', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo10', '1737396010', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (22, 'yangguo11', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo11', '1737396011', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (23, 'yangguo12', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo12', '1737396012', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (24, 'yangguo13', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo13', '1737396013', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (25, 'yangguo14', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo14', '1737396014', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (26, 'yangguo15', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo15', '1737396015', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (27, 'yangguo16', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo16', '1737396016', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (28, 'yangguo17', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo17', '1737396017', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (29, 'yangguo18', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo18', '1737396018', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (30, 'yangguo19', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo19', '1737396019', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (31, 'yangguo20', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo20', '1737396020', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (32, 'yangguo21', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo21', '1737396021', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (33, 'yangguo22', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo22', '1737396022', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (34, 'yangguo23', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo23', '1737396023', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (35, 'yangguo24', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo24', '1737396024', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (36, 'yangguo25', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo25', '1737396025', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (37, 'yangguo26', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo26', '1737396026', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (38, 'yangguo27', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo27', '1737396027', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (39, 'yangguo28', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo28', '1737396028', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (40, 'yangguo29', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo29', '1737396029', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (41, 'yangguo30', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo30', '1737396030', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (42, 'yangguo31', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo31', '1737396031', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (43, 'yangguo32', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo32', '1737396032', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (44, 'yangguo33', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo33', '1737396033', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (45, 'yangguo34', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo34', '1737396034', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (46, 'yangguo35', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo35', '1737396035', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (47, 'yangguo36', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo36', '1737396036', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (48, 'yangguo37', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo37', '1737396037', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (49, 'yangguo38', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo38', '1737396038', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (50, 'yangguo39', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo39', '1737396039', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (51, 'yangguo40', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo40', '1737396040', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (52, 'yangguo41', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo41', '1737396041', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (53, 'yangguo42', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo42', '1737396042', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (54, 'yangguo43', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo43', '1737396043', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (55, 'yangguo44', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo44', '1737396044', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (56, 'yangguo45', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo45', '1737396045', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (57, 'yangguo46', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo46', '1737396046', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (58, 'yangguo47', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo47', '1737396047', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (59, 'yangguo48', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo48', '1737396048', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (60, 'yangguo49', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo49', '1737396049', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (61, 'yangguo50', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo50', '1737396050', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (62, 'yangguo51', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo51', '1737396051', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (63, 'yangguo52', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo52', '1737396052', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (64, 'yangguo53', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo53', '1737396053', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (65, 'yangguo54', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo54', '1737396054', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (66, 'yangguo55', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo55', '1737396055', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (67, 'yangguo56', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo56', '1737396056', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (68, 'yangguo57', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo57', '1737396057', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (69, 'yangguo58', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo58', '1737396058', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (70, 'yangguo59', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo59', '1737396059', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (71, 'yangguo60', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo60', '1737396060', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (72, 'yangguo61', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo61', '1737396061', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (73, 'yangguo62', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo62', '1737396062', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (74, 'yangguo63', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo63', '1737396063', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (75, 'yangguo64', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo64', '1737396064', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (76, 'yangguo65', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo65', '1737396065', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (77, 'yangguo66', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo66', '1737396066', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (78, 'yangguo67', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo67', '1737396067', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (79, 'yangguo68', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo68', '1737396068', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (80, 'yangguo69', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo69', '1737396069', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (81, 'yangguo70', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo70', '1737396070', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (82, 'yangguo71', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo71', '1737396071', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (83, 'yangguo72', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo72', '1737396072', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (84, 'yangguo73', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo73', '1737396073', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (85, 'yangguo74', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo74', '1737396074', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (86, 'yangguo75', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo75', '1737396075', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (87, 'yangguo76', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo76', '1737396076', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (88, 'yangguo77', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo77', '1737396077', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (89, 'yangguo78', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo78', '1737396078', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (90, 'yangguo79', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo79', '1737396079', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (91, 'yangguo80', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo80', '1737396080', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (92, 'yangguo81', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo81', '1737396081', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (93, 'yangguo82', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo82', '1737396082', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (94, 'yangguo83', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo83', '1737396083', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (95, 'yangguo84', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo84', '1737396084', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (96, 'yangguo85', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo85', '1737396085', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (97, 'yangguo86', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo86', '1737396086', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (98, 'yangguo87', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo87', '1737396087', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (99, 'yangguo88', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo88', '1737396088', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (100, 'yangguo89', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo89', '1737396089', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (101, 'yangguo90', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo90', '1737396090', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (102, 'yangguo91', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo91', '1737396091', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (103, 'yangguo92', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo92', '1737396092', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (104, 'yangguo93', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo93', '1737396093', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (105, 'yangguo94', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo94', '1737396094', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (106, 'yangguo95', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo95', '1737396095', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (107, 'yangguo96', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo96', '1737396096', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (108, 'yangguo97', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo97', '1737396097', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (109, 'yangguo98', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo98', '1737396098', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (110, 'yangguo99', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo99', '1737396099', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (111, 'yangguo100', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo100', '17373960100', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (112, 'yangguo101', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo101', '17373960101', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (113, 'yangguo102', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo102', '17373960102', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (114, 'yangguo103', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo103', '17373960103', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (115, 'yangguo104', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo104', '17373960104', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (116, 'yangguo105', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo105', '17373960105', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (117, 'yangguo106', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo106', '17373960106', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (118, 'yangguo107', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo107', '17373960107', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (119, 'yangguo108', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo108', '17373960108', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (120, 'yangguo109', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo109', '17373960109', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (121, 'yangguo110', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo110', '17373960110', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (122, 'yangguo111', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo111', '17373960111', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (123, 'yangguo112', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo112', '17373960112', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (124, 'yangguo113', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo113', '17373960113', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (125, 'yangguo114', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo114', '17373960114', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (126, 'yangguo115', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo115', '17373960115', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (127, 'yangguo116', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo116', '17373960116', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (128, 'yangguo117', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo117', '17373960117', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (129, 'yangguo118', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo118', '17373960118', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (130, 'yangguo119', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo119', '17373960119', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (131, 'yangguo120', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo120', '17373960120', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (132, 'yangguo121', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo121', '17373960121', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (133, 'yangguo122', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo122', '17373960122', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (134, 'yangguo123', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo123', '17373960123', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (135, 'yangguo124', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo124', '17373960124', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (136, 'yangguo125', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo125', '17373960125', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (137, 'yangguo126', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo126', '17373960126', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (138, 'yangguo127', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo127', '17373960127', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (139, 'yangguo128', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo128', '17373960128', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (140, 'yangguo129', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo129', '17373960129', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (141, 'yangguo130', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo130', '17373960130', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (142, 'yangguo131', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo131', '17373960131', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (143, 'yangguo132', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo132', '17373960132', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (144, 'yangguo133', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo133', '17373960133', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (145, 'yangguo134', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo134', '17373960134', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (146, 'yangguo135', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo135', '17373960135', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (147, 'yangguo136', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo136', '17373960136', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (148, 'yangguo137', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo137', '17373960137', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (149, 'yangguo138', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo138', '17373960138', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (150, 'yangguo139', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo139', '17373960139', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (151, 'yangguo140', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo140', '17373960140', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (152, 'yangguo141', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo141', '17373960141', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (153, 'yangguo142', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo142', '17373960142', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (154, 'yangguo143', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo143', '17373960143', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (155, 'yangguo144', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo144', '17373960144', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (156, 'yangguo145', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo145', '17373960145', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (157, 'yangguo146', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo146', '17373960146', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (158, 'yangguo147', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo147', '17373960147', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (159, 'yangguo148', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo148', '17373960148', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (160, 'yangguo149', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo149', '17373960149', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (161, 'yangguo150', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo150', '17373960150', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (162, 'yangguo151', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo151', '17373960151', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (163, 'yangguo152', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo152', '17373960152', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (164, 'yangguo153', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo153', '17373960153', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (165, 'yangguo154', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo154', '17373960154', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (166, 'yangguo155', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo155', '17373960155', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (167, 'yangguo156', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo156', '17373960156', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (168, 'yangguo157', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo157', '17373960157', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (169, 'yangguo158', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo158', '17373960158', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (170, 'yangguo159', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo159', '17373960159', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (171, 'yangguo160', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo160', '17373960160', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (172, 'yangguo161', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo161', '17373960161', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (173, 'yangguo162', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo162', '17373960162', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (174, 'yangguo163', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo163', '17373960163', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (175, 'yangguo164', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo164', '17373960164', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (176, 'yangguo165', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo165', '17373960165', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (177, 'yangguo166', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo166', '17373960166', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (178, 'yangguo167', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo167', '17373960167', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (179, 'yangguo168', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo168', '17373960168', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (180, 'yangguo169', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo169', '17373960169', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (181, 'yangguo170', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo170', '17373960170', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (182, 'yangguo171', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo171', '17373960171', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (183, 'yangguo172', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo172', '17373960172', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (184, 'yangguo173', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo173', '17373960173', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (185, 'yangguo174', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo174', '17373960174', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (186, 'yangguo175', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo175', '17373960175', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (187, 'yangguo176', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo176', '17373960176', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (188, 'yangguo177', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo177', '17373960177', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (189, 'yangguo178', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo178', '17373960178', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (190, 'yangguo179', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo179', '17373960179', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (191, 'yangguo180', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo180', '17373960180', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (192, 'yangguo181', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo181', '17373960181', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (193, 'yangguo182', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo182', '17373960182', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (194, 'yangguo183', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo183', '17373960183', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (195, 'yangguo184', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo184', '17373960184', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (196, 'yangguo185', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo185', '17373960185', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (197, 'yangguo186', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo186', '17373960186', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (198, 'yangguo187', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo187', '17373960187', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (199, 'yangguo188', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo188', '17373960188', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (200, 'yangguo189', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo189', '17373960189', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (201, 'yangguo190', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo190', '17373960190', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (202, 'yangguo191', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo191', '17373960191', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (203, 'yangguo192', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo192', '17373960192', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (204, 'yangguo193', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo193', '17373960193', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (205, 'yangguo194', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo194', '17373960194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (206, 'yangguo195', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo195', '17373960195', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (207, 'yangguo196', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo196', '17373960196', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (208, 'yangguo197', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo197', '17373960197', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (209, 'yangguo198', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo198', '17373960198', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (210, 'yangguo199', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo199', '17373960199', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (211, 'yangguo200', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo200', '17373960200', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (212, 'yangguo201', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo201', '17373960201', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (213, 'yangguo202', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo202', '17373960202', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (214, 'yangguo203', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo203', '17373960203', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (215, 'yangguo204', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo204', '17373960204', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (216, 'yangguo205', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo205', '17373960205', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (217, 'yangguo206', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo206', '17373960206', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (218, 'yangguo207', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo207', '17373960207', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (219, 'yangguo208', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo208', '17373960208', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (220, 'yangguo209', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo209', '17373960209', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (221, 'yangguo210', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo210', '17373960210', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (222, 'yangguo211', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo211', '17373960211', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (223, 'yangguo212', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo212', '17373960212', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (224, 'yangguo213', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo213', '17373960213', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (225, 'yangguo214', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo214', '17373960214', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (226, 'yangguo215', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo215', '17373960215', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (227, 'yangguo216', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo216', '17373960216', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (228, 'yangguo217', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo217', '17373960217', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (229, 'yangguo218', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo218', '17373960218', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (230, 'yangguo219', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo219', '17373960219', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (231, 'yangguo220', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo220', '17373960220', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (232, 'yangguo221', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo221', '17373960221', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (233, 'yangguo222', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo222', '17373960222', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (234, 'yangguo223', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo223', '17373960223', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (235, 'yangguo224', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo224', '17373960224', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (236, 'yangguo225', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo225', '17373960225', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (237, 'yangguo226', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo226', '17373960226', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (238, 'yangguo227', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo227', '17373960227', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (239, 'yangguo228', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo228', '17373960228', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (240, 'yangguo229', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo229', '17373960229', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (241, 'yangguo230', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo230', '17373960230', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (242, 'yangguo231', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo231', '17373960231', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (243, 'yangguo232', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo232', '17373960232', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (244, 'yangguo233', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo233', '17373960233', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (245, 'yangguo234', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo234', '17373960234', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (246, 'yangguo235', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo235', '17373960235', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (247, 'yangguo236', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo236', '17373960236', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (248, 'yangguo237', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo237', '17373960237', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (249, 'yangguo238', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo238', '17373960238', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (250, 'yangguo239', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo239', '17373960239', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (251, 'yangguo240', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo240', '17373960240', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (252, 'yangguo241', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo241', '17373960241', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (253, 'yangguo242', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo242', '17373960242', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (254, 'yangguo243', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo243', '17373960243', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (255, 'yangguo244', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo244', '17373960244', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (256, 'yangguo245', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo245', '17373960245', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (257, 'yangguo246', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo246', '17373960246', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (258, 'yangguo247', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo247', '17373960247', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (259, 'yangguo248', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo248', '17373960248', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (260, 'yangguo249', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo249', '17373960249', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (261, 'yangguo250', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo250', '17373960250', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (262, 'yangguo251', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo251', '17373960251', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (263, 'yangguo252', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo252', '17373960252', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (264, 'yangguo253', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo253', '17373960253', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (265, 'yangguo254', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo254', '17373960254', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (266, 'yangguo255', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo255', '17373960255', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (267, 'yangguo256', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo256', '17373960256', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (268, 'yangguo257', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo257', '17373960257', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (269, 'yangguo258', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo258', '17373960258', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (270, 'yangguo259', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo259', '17373960259', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (271, 'yangguo260', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo260', '17373960260', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (272, 'yangguo261', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo261', '17373960261', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (273, 'yangguo262', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo262', '17373960262', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (274, 'yangguo263', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo263', '17373960263', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (275, 'yangguo264', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo264', '17373960264', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (276, 'yangguo265', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo265', '17373960265', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (277, 'yangguo266', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo266', '17373960266', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (278, 'yangguo267', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo267', '17373960267', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (279, 'yangguo268', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo268', '17373960268', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (280, 'yangguo269', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo269', '17373960269', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (281, 'yangguo270', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo270', '17373960270', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (282, 'yangguo271', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo271', '17373960271', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (283, 'yangguo272', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo272', '17373960272', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (284, 'yangguo273', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo273', '17373960273', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (285, 'yangguo274', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo274', '17373960274', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (286, 'yangguo275', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo275', '17373960275', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (287, 'yangguo276', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo276', '17373960276', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (288, 'yangguo277', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo277', '17373960277', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (289, 'yangguo278', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo278', '17373960278', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (290, 'yangguo279', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo279', '17373960279', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (291, 'yangguo280', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo280', '17373960280', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (292, 'yangguo281', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo281', '17373960281', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (293, 'yangguo282', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo282', '17373960282', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (294, 'yangguo283', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo283', '17373960283', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (295, 'yangguo284', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo284', '17373960284', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (296, 'yangguo285', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo285', '17373960285', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (297, 'yangguo286', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo286', '17373960286', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (298, 'yangguo287', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo287', '17373960287', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (299, 'yangguo288', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo288', '17373960288', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (300, 'yangguo289', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo289', '17373960289', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (301, 'yangguo290', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo290', '17373960290', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (302, 'yangguo291', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo291', '17373960291', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (303, 'yangguo292', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo292', '17373960292', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (304, 'yangguo293', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo293', '17373960293', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (305, 'yangguo294', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo294', '17373960294', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (306, 'yangguo295', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo295', '17373960295', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (307, 'yangguo296', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo296', '17373960296', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (308, 'yangguo297', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo297', '17373960297', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (309, 'yangguo298', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo298', '17373960298', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (310, 'yangguo299', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo299', '17373960299', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (311, 'yangguo300', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo300', '17373960300', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (312, 'yangguo301', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo301', '17373960301', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (313, 'yangguo302', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo302', '17373960302', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (314, 'yangguo303', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo303', '17373960303', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (315, 'yangguo304', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo304', '17373960304', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (316, 'yangguo305', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo305', '17373960305', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (317, 'yangguo306', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo306', '17373960306', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (318, 'yangguo307', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo307', '17373960307', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (319, 'yangguo308', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo308', '17373960308', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (320, 'yangguo309', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo309', '17373960309', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (321, 'yangguo310', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo310', '17373960310', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (322, 'yangguo311', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo311', '17373960311', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (323, 'yangguo312', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo312', '17373960312', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (324, 'yangguo313', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo313', '17373960313', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (325, 'yangguo314', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo314', '17373960314', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (326, 'yangguo315', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo315', '17373960315', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (327, 'yangguo316', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo316', '17373960316', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (328, 'yangguo317', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo317', '17373960317', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (329, 'yangguo318', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo318', '17373960318', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (330, 'yangguo319', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo319', '17373960319', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (331, 'yangguo320', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo320', '17373960320', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (332, 'yangguo321', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo321', '17373960321', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (333, 'yangguo322', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo322', '17373960322', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (334, 'yangguo323', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo323', '17373960323', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (335, 'yangguo324', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo324', '17373960324', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (336, 'yangguo325', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo325', '17373960325', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (337, 'yangguo326', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo326', '17373960326', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (338, 'yangguo327', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo327', '17373960327', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (339, 'yangguo328', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo328', '17373960328', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (340, 'yangguo329', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo329', '17373960329', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (341, 'yangguo330', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo330', '17373960330', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (342, 'yangguo331', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo331', '17373960331', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (343, 'yangguo332', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo332', '17373960332', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (344, 'yangguo333', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo333', '17373960333', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (345, 'yangguo334', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo334', '17373960334', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (346, 'yangguo335', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo335', '17373960335', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (347, 'yangguo336', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo336', '17373960336', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (348, 'yangguo337', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo337', '17373960337', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (349, 'yangguo338', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo338', '17373960338', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (350, 'yangguo339', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo339', '17373960339', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (351, 'yangguo340', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo340', '17373960340', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (352, 'yangguo341', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo341', '17373960341', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (353, 'yangguo342', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo342', '17373960342', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (354, 'yangguo343', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo343', '17373960343', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (355, 'yangguo344', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo344', '17373960344', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (356, 'yangguo345', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo345', '17373960345', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (357, 'yangguo346', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo346', '17373960346', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (358, 'yangguo347', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo347', '17373960347', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (359, 'yangguo348', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo348', '17373960348', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (360, 'yangguo349', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo349', '17373960349', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (361, 'yangguo350', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo350', '17373960350', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (362, 'yangguo351', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo351', '17373960351', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (363, 'yangguo352', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo352', '17373960352', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (364, 'yangguo353', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo353', '17373960353', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (365, 'yangguo354', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo354', '17373960354', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (366, 'yangguo355', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo355', '17373960355', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (367, 'yangguo356', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo356', '17373960356', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (368, 'yangguo357', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo357', '17373960357', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (369, 'yangguo358', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo358', '17373960358', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (370, 'yangguo359', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo359', '17373960359', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (371, 'yangguo360', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo360', '17373960360', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (372, 'yangguo361', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo361', '17373960361', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (373, 'yangguo362', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo362', '17373960362', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (374, 'yangguo363', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo363', '17373960363', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (375, 'yangguo364', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo364', '17373960364', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (376, 'yangguo365', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo365', '17373960365', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (377, 'yangguo366', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo366', '17373960366', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (378, 'yangguo367', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo367', '17373960367', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (379, 'yangguo368', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo368', '17373960368', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (380, 'yangguo369', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo369', '17373960369', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (381, 'yangguo370', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo370', '17373960370', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (382, 'yangguo371', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo371', '17373960371', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (383, 'yangguo372', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo372', '17373960372', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (384, 'yangguo373', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo373', '17373960373', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (385, 'yangguo374', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo374', '17373960374', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (386, 'yangguo375', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo375', '17373960375', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (387, 'yangguo376', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo376', '17373960376', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (388, 'yangguo377', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo377', '17373960377', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (389, 'yangguo378', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo378', '17373960378', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (390, 'yangguo379', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo379', '17373960379', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (391, 'yangguo380', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo380', '17373960380', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (392, 'yangguo381', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo381', '17373960381', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (393, 'yangguo382', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo382', '17373960382', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (394, 'yangguo383', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo383', '17373960383', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (395, 'yangguo384', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo384', '17373960384', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (396, 'yangguo385', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo385', '17373960385', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (397, 'yangguo386', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo386', '17373960386', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (398, 'yangguo387', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo387', '17373960387', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (399, 'yangguo388', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo388', '17373960388', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (400, 'yangguo389', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo389', '17373960389', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (401, 'yangguo390', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo390', '17373960390', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (402, 'yangguo391', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo391', '17373960391', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (403, 'yangguo392', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo392', '17373960392', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (404, 'yangguo393', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo393', '17373960393', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (405, 'yangguo394', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo394', '17373960394', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (406, 'yangguo395', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo395', '17373960395', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (407, 'yangguo396', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo396', '17373960396', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (408, 'yangguo397', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo397', '17373960397', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (409, 'yangguo398', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo398', '17373960398', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (410, 'yangguo399', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo399', '17373960399', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (411, 'yangguo400', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo400', '17373960400', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (412, 'yangguo401', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo401', '17373960401', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (413, 'yangguo402', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo402', '17373960402', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (414, 'yangguo403', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo403', '17373960403', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (415, 'yangguo404', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo404', '17373960404', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (416, 'yangguo405', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo405', '17373960405', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (417, 'yangguo406', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo406', '17373960406', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (418, 'yangguo407', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo407', '17373960407', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (419, 'yangguo408', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo408', '17373960408', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (420, 'yangguo409', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo409', '17373960409', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (421, 'yangguo410', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo410', '17373960410', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (422, 'yangguo411', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo411', '17373960411', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (423, 'yangguo412', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo412', '17373960412', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (424, 'yangguo413', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo413', '17373960413', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (425, 'yangguo414', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo414', '17373960414', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (426, 'yangguo415', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo415', '17373960415', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (427, 'yangguo416', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo416', '17373960416', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (428, 'yangguo417', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo417', '17373960417', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (429, 'yangguo418', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo418', '17373960418', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (430, 'yangguo419', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo419', '17373960419', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (431, 'yangguo420', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo420', '17373960420', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (432, 'yangguo421', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo421', '17373960421', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (433, 'yangguo422', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo422', '17373960422', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (434, 'yangguo423', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo423', '17373960423', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (435, 'yangguo424', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo424', '17373960424', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (436, 'yangguo425', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo425', '17373960425', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (437, 'yangguo426', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo426', '17373960426', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (438, 'yangguo427', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo427', '17373960427', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (439, 'yangguo428', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo428', '17373960428', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (440, 'yangguo429', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo429', '17373960429', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (441, 'yangguo430', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo430', '17373960430', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (442, 'yangguo431', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo431', '17373960431', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (443, 'yangguo432', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo432', '17373960432', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (444, 'yangguo433', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo433', '17373960433', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (445, 'yangguo434', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo434', '17373960434', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (446, 'yangguo435', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo435', '17373960435', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (447, 'yangguo436', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo436', '17373960436', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (448, 'yangguo437', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo437', '17373960437', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (449, 'yangguo438', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo438', '17373960438', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (450, 'yangguo439', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo439', '17373960439', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (451, 'yangguo440', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo440', '17373960440', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (452, 'yangguo441', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo441', '17373960441', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (453, 'yangguo442', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo442', '17373960442', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (454, 'yangguo443', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo443', '17373960443', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (455, 'yangguo444', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo444', '17373960444', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (456, 'yangguo445', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo445', '17373960445', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (457, 'yangguo446', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo446', '17373960446', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (458, 'yangguo447', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo447', '17373960447', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (459, 'yangguo448', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo448', '17373960448', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (460, 'yangguo449', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo449', '17373960449', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (461, 'yangguo450', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo450', '17373960450', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (462, 'yangguo451', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo451', '17373960451', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (463, 'yangguo452', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo452', '17373960452', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (464, 'yangguo453', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo453', '17373960453', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (465, 'yangguo454', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo454', '17373960454', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (466, 'yangguo455', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo455', '17373960455', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (467, 'yangguo456', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo456', '17373960456', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (468, 'yangguo457', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo457', '17373960457', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (469, 'yangguo458', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo458', '17373960458', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (470, 'yangguo459', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo459', '17373960459', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (471, 'yangguo460', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo460', '17373960460', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (472, 'yangguo461', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo461', '17373960461', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (473, 'yangguo462', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo462', '17373960462', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (474, 'yangguo463', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo463', '17373960463', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (475, 'yangguo464', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo464', '17373960464', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (476, 'yangguo465', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo465', '17373960465', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (477, 'yangguo466', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo466', '17373960466', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (478, 'yangguo467', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo467', '17373960467', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (479, 'yangguo468', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo468', '17373960468', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (480, 'yangguo469', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo469', '17373960469', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (481, 'yangguo470', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo470', '17373960470', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (482, 'yangguo471', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo471', '17373960471', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (483, 'yangguo472', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo472', '17373960472', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (484, 'yangguo473', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo473', '17373960473', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (485, 'yangguo474', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo474', '17373960474', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (486, 'yangguo475', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo475', '17373960475', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (487, 'yangguo476', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo476', '17373960476', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (488, 'yangguo477', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo477', '17373960477', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (489, 'yangguo478', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo478', '17373960478', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (490, 'yangguo479', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo479', '17373960479', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (491, 'yangguo480', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo480', '17373960480', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (492, 'yangguo481', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo481', '17373960481', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (493, 'yangguo482', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo482', '17373960482', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (494, 'yangguo483', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo483', '17373960483', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (495, 'yangguo484', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo484', '17373960484', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (496, 'yangguo485', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo485', '17373960485', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (497, 'yangguo486', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo486', '17373960486', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (498, 'yangguo487', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo487', '17373960487', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (499, 'yangguo488', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo488', '17373960488', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (500, 'yangguo489', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo489', '17373960489', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (501, 'yangguo490', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo490', '17373960490', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (502, 'yangguo491', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo491', '17373960491', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (503, 'yangguo492', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo492', '17373960492', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (504, 'yangguo493', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo493', '17373960493', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (505, 'yangguo494', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo494', '17373960494', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (506, 'yangguo495', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo495', '17373960495', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (507, 'yangguo496', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo496', '17373960496', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (508, 'yangguo497', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo497', '17373960497', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (509, 'yangguo498', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo498', '17373960498', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (510, 'yangguo499', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo499', '17373960499', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (511, 'yangguo500', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo500', '17373960500', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (512, 'yangguo501', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo501', '17373960501', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (513, 'yangguo502', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo502', '17373960502', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (514, 'yangguo503', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo503', '17373960503', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (515, 'yangguo504', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo504', '17373960504', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (516, 'yangguo505', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo505', '17373960505', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (517, 'yangguo506', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo506', '17373960506', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (518, 'yangguo507', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo507', '17373960507', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (519, 'yangguo508', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo508', '17373960508', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (520, 'yangguo509', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo509', '17373960509', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (521, 'yangguo510', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo510', '17373960510', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (522, 'yangguo511', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo511', '17373960511', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (523, 'yangguo512', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo512', '17373960512', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (524, 'yangguo513', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo513', '17373960513', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (525, 'yangguo514', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo514', '17373960514', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (526, 'yangguo515', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo515', '17373960515', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (527, 'yangguo516', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo516', '17373960516', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (528, 'yangguo517', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo517', '17373960517', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (529, 'yangguo518', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo518', '17373960518', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (530, 'yangguo519', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo519', '17373960519', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (531, 'yangguo520', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo520', '17373960520', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (532, 'yangguo521', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo521', '17373960521', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (533, 'yangguo522', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo522', '17373960522', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (534, 'yangguo523', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo523', '17373960523', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (535, 'yangguo524', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo524', '17373960524', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (536, 'yangguo525', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo525', '17373960525', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (537, 'yangguo526', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo526', '17373960526', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (538, 'yangguo527', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo527', '17373960527', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (539, 'yangguo528', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo528', '17373960528', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (540, 'yangguo529', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo529', '17373960529', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (541, 'yangguo530', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo530', '17373960530', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (542, 'yangguo531', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo531', '17373960531', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (543, 'yangguo532', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo532', '17373960532', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (544, 'yangguo533', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo533', '17373960533', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (545, 'yangguo534', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo534', '17373960534', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (546, 'yangguo535', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo535', '17373960535', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (547, 'yangguo536', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo536', '17373960536', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (548, 'yangguo537', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo537', '17373960537', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (549, 'yangguo538', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo538', '17373960538', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (550, 'yangguo539', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo539', '17373960539', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (551, 'yangguo540', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo540', '17373960540', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (552, 'yangguo541', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo541', '17373960541', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (553, 'yangguo542', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo542', '17373960542', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (554, 'yangguo543', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo543', '17373960543', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (555, 'yangguo544', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo544', '17373960544', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (556, 'yangguo545', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo545', '17373960545', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (557, 'yangguo546', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo546', '17373960546', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (558, 'yangguo547', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo547', '17373960547', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (559, 'yangguo548', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo548', '17373960548', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (560, 'yangguo549', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo549', '17373960549', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (561, 'yangguo550', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo550', '17373960550', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (562, 'yangguo551', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo551', '17373960551', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (563, 'yangguo552', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo552', '17373960552', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (564, 'yangguo553', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo553', '17373960553', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (565, 'yangguo554', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo554', '17373960554', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (566, 'yangguo555', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo555', '17373960555', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (567, 'yangguo556', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo556', '17373960556', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (568, 'yangguo557', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo557', '17373960557', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (569, 'yangguo558', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo558', '17373960558', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (570, 'yangguo559', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo559', '17373960559', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (571, 'yangguo560', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo560', '17373960560', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (572, 'yangguo561', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo561', '17373960561', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (573, 'yangguo562', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo562', '17373960562', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (574, 'yangguo563', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo563', '17373960563', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (575, 'yangguo564', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo564', '17373960564', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (576, 'yangguo565', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo565', '17373960565', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (577, 'yangguo566', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo566', '17373960566', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (578, 'yangguo567', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo567', '17373960567', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (579, 'yangguo568', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo568', '17373960568', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (580, 'yangguo569', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo569', '17373960569', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (581, 'yangguo570', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo570', '17373960570', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (582, 'yangguo571', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo571', '17373960571', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (583, 'yangguo572', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo572', '17373960572', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (584, 'yangguo573', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo573', '17373960573', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (585, 'yangguo574', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo574', '17373960574', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (586, 'yangguo575', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo575', '17373960575', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (587, 'yangguo576', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo576', '17373960576', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (588, 'yangguo577', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo577', '17373960577', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (589, 'yangguo578', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo578', '17373960578', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (590, 'yangguo579', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo579', '17373960579', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (591, 'yangguo580', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo580', '17373960580', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (592, 'yangguo581', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo581', '17373960581', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (593, 'yangguo582', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo582', '17373960582', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (594, 'yangguo583', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo583', '17373960583', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (595, 'yangguo584', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo584', '17373960584', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (596, 'yangguo585', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo585', '17373960585', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (597, 'yangguo586', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo586', '17373960586', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (598, 'yangguo587', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo587', '17373960587', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (599, 'yangguo588', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo588', '17373960588', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (600, 'yangguo589', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo589', '17373960589', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (601, 'yangguo590', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo590', '17373960590', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (602, 'yangguo591', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo591', '17373960591', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (603, 'yangguo592', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo592', '17373960592', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (604, 'yangguo593', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo593', '17373960593', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (605, 'yangguo594', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo594', '17373960594', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (606, 'yangguo595', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo595', '17373960595', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (607, 'yangguo596', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo596', '17373960596', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (608, 'yangguo597', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo597', '17373960597', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (609, 'yangguo598', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo598', '17373960598', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (610, 'yangguo599', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo599', '17373960599', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (611, 'yangguo600', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo600', '17373960600', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (612, 'yangguo601', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo601', '17373960601', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (613, 'yangguo602', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo602', '17373960602', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (614, 'yangguo603', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo603', '17373960603', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (615, 'yangguo604', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo604', '17373960604', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (616, 'yangguo605', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo605', '17373960605', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (617, 'yangguo606', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo606', '17373960606', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (618, 'yangguo607', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo607', '17373960607', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (619, 'yangguo608', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo608', '17373960608', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (620, 'yangguo609', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo609', '17373960609', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (621, 'yangguo610', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo610', '17373960610', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (622, 'yangguo611', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo611', '17373960611', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (623, 'yangguo612', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo612', '17373960612', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (624, 'yangguo613', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo613', '17373960613', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (625, 'yangguo614', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo614', '17373960614', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (626, 'yangguo615', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo615', '17373960615', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (627, 'yangguo616', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo616', '17373960616', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (628, 'yangguo617', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo617', '17373960617', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (629, 'yangguo618', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo618', '17373960618', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (630, 'yangguo619', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo619', '17373960619', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (631, 'yangguo620', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo620', '17373960620', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (632, 'yangguo621', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo621', '17373960621', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (633, 'yangguo622', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo622', '17373960622', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (634, 'yangguo623', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo623', '17373960623', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (635, 'yangguo624', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo624', '17373960624', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (636, 'yangguo625', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo625', '17373960625', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (637, 'yangguo626', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo626', '17373960626', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (638, 'yangguo627', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo627', '17373960627', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (639, 'yangguo628', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo628', '17373960628', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (640, 'yangguo629', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo629', '17373960629', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (641, 'yangguo630', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo630', '17373960630', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (642, 'yangguo631', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo631', '17373960631', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (643, 'yangguo632', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo632', '17373960632', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (644, 'yangguo633', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo633', '17373960633', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (645, 'yangguo634', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo634', '17373960634', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (646, 'yangguo635', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo635', '17373960635', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (647, 'yangguo636', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo636', '17373960636', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (648, 'yangguo637', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo637', '17373960637', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (649, 'yangguo638', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo638', '17373960638', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (650, 'yangguo639', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo639', '17373960639', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (651, 'yangguo640', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo640', '17373960640', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (652, 'yangguo641', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo641', '17373960641', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (653, 'yangguo642', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo642', '17373960642', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (654, 'yangguo643', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo643', '17373960643', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (655, 'yangguo644', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo644', '17373960644', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (656, 'yangguo645', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo645', '17373960645', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (657, 'yangguo646', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo646', '17373960646', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (658, 'yangguo647', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo647', '17373960647', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (659, 'yangguo648', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo648', '17373960648', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (660, 'yangguo649', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo649', '17373960649', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (661, 'yangguo650', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo650', '17373960650', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (662, 'yangguo651', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo651', '17373960651', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (663, 'yangguo652', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo652', '17373960652', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (664, 'yangguo653', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo653', '17373960653', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (665, 'yangguo654', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo654', '17373960654', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (666, 'yangguo655', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo655', '17373960655', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (667, 'yangguo656', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo656', '17373960656', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (668, 'yangguo657', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo657', '17373960657', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (669, 'yangguo658', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo658', '17373960658', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (670, 'yangguo659', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo659', '17373960659', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (671, 'yangguo660', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo660', '17373960660', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (672, 'yangguo661', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo661', '17373960661', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (673, 'yangguo662', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo662', '17373960662', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (674, 'yangguo663', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo663', '17373960663', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (675, 'yangguo664', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo664', '17373960664', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (676, 'yangguo665', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo665', '17373960665', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (677, 'yangguo666', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo666', '17373960666', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (678, 'yangguo667', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo667', '17373960667', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (679, 'yangguo668', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo668', '17373960668', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (680, 'yangguo669', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo669', '17373960669', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (681, 'yangguo670', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo670', '17373960670', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (682, 'yangguo671', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo671', '17373960671', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (683, 'yangguo672', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo672', '17373960672', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (684, 'yangguo673', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo673', '17373960673', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (685, 'yangguo674', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo674', '17373960674', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (686, 'yangguo675', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo675', '17373960675', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (687, 'yangguo676', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo676', '17373960676', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (688, 'yangguo677', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo677', '17373960677', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (689, 'yangguo678', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo678', '17373960678', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (690, 'yangguo679', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo679', '17373960679', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (691, 'yangguo680', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo680', '17373960680', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (692, 'yangguo681', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo681', '17373960681', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (693, 'yangguo682', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo682', '17373960682', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (694, 'yangguo683', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo683', '17373960683', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (695, 'yangguo684', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo684', '17373960684', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (696, 'yangguo685', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo685', '17373960685', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (697, 'yangguo686', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo686', '17373960686', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (698, 'yangguo687', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo687', '17373960687', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (699, 'yangguo688', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo688', '17373960688', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (700, 'yangguo689', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo689', '17373960689', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (701, 'yangguo690', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo690', '17373960690', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (702, 'yangguo691', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo691', '17373960691', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (703, 'yangguo692', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo692', '17373960692', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (704, 'yangguo693', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo693', '17373960693', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (705, 'yangguo694', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo694', '17373960694', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (706, 'yangguo695', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo695', '17373960695', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (707, 'yangguo696', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo696', '17373960696', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (708, 'yangguo697', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo697', '17373960697', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (709, 'yangguo698', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo698', '17373960698', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (710, 'yangguo699', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo699', '17373960699', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (711, 'yangguo700', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo700', '17373960700', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (712, 'yangguo701', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo701', '17373960701', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (713, 'yangguo702', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo702', '17373960702', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (714, 'yangguo703', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo703', '17373960703', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (715, 'yangguo704', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo704', '17373960704', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (716, 'yangguo705', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo705', '17373960705', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (717, 'yangguo706', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo706', '17373960706', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (718, 'yangguo707', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo707', '17373960707', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (719, 'yangguo708', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo708', '17373960708', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (720, 'yangguo709', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo709', '17373960709', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (721, 'yangguo710', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo710', '17373960710', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (722, 'yangguo711', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo711', '17373960711', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (723, 'yangguo712', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo712', '17373960712', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (724, 'yangguo713', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo713', '17373960713', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (725, 'yangguo714', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo714', '17373960714', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (726, 'yangguo715', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo715', '17373960715', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (727, 'yangguo716', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo716', '17373960716', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (728, 'yangguo717', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo717', '17373960717', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (729, 'yangguo718', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo718', '17373960718', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (730, 'yangguo719', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo719', '17373960719', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (731, 'yangguo720', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo720', '17373960720', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (732, 'yangguo721', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo721', '17373960721', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (733, 'yangguo722', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo722', '17373960722', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (734, 'yangguo723', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo723', '17373960723', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (735, 'yangguo724', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo724', '17373960724', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (736, 'yangguo725', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo725', '17373960725', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (737, 'yangguo726', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo726', '17373960726', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (738, 'yangguo727', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo727', '17373960727', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (739, 'yangguo728', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo728', '17373960728', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (740, 'yangguo729', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo729', '17373960729', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (741, 'yangguo730', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo730', '17373960730', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (742, 'yangguo731', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo731', '17373960731', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (743, 'yangguo732', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo732', '17373960732', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (744, 'yangguo733', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo733', '17373960733', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (745, 'yangguo734', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo734', '17373960734', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (746, 'yangguo735', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo735', '17373960735', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (747, 'yangguo736', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo736', '17373960736', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (748, 'yangguo737', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo737', '17373960737', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (749, 'yangguo738', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo738', '17373960738', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (750, 'yangguo739', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo739', '17373960739', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (751, 'yangguo740', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo740', '17373960740', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (752, 'yangguo741', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo741', '17373960741', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (753, 'yangguo742', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo742', '17373960742', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (754, 'yangguo743', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo743', '17373960743', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (755, 'yangguo744', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo744', '17373960744', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (756, 'yangguo745', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo745', '17373960745', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (757, 'yangguo746', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo746', '17373960746', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (758, 'yangguo747', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo747', '17373960747', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (759, 'yangguo748', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo748', '17373960748', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (760, 'yangguo749', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo749', '17373960749', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (761, 'yangguo750', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo750', '17373960750', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (762, 'yangguo751', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo751', '17373960751', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (763, 'yangguo752', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo752', '17373960752', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (764, 'yangguo753', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo753', '17373960753', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (765, 'yangguo754', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo754', '17373960754', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (766, 'yangguo755', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo755', '17373960755', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (767, 'yangguo756', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo756', '17373960756', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (768, 'yangguo757', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo757', '17373960757', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (769, 'yangguo758', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo758', '17373960758', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (770, 'yangguo759', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo759', '17373960759', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (771, 'yangguo760', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo760', '17373960760', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (772, 'yangguo761', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo761', '17373960761', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (773, 'yangguo762', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo762', '17373960762', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (774, 'yangguo763', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo763', '17373960763', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (775, 'yangguo764', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo764', '17373960764', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (776, 'yangguo765', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo765', '17373960765', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (777, 'yangguo766', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo766', '17373960766', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (778, 'yangguo767', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo767', '17373960767', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (779, 'yangguo768', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo768', '17373960768', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (780, 'yangguo769', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo769', '17373960769', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (781, 'yangguo770', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo770', '17373960770', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (782, 'yangguo771', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo771', '17373960771', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (783, 'yangguo772', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo772', '17373960772', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (784, 'yangguo773', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo773', '17373960773', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (785, 'yangguo774', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo774', '17373960774', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (786, 'yangguo775', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo775', '17373960775', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (787, 'yangguo776', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo776', '17373960776', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (788, 'yangguo777', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo777', '17373960777', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (789, 'yangguo778', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo778', '17373960778', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (790, 'yangguo779', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo779', '17373960779', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (791, 'yangguo780', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo780', '17373960780', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (792, 'yangguo781', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo781', '17373960781', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (793, 'yangguo782', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo782', '17373960782', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (794, 'yangguo783', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo783', '17373960783', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (795, 'yangguo784', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo784', '17373960784', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (796, 'yangguo785', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo785', '17373960785', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (797, 'yangguo786', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo786', '17373960786', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (798, 'yangguo787', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo787', '17373960787', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (799, 'yangguo788', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo788', '17373960788', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (800, 'yangguo789', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo789', '17373960789', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (801, 'yangguo790', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo790', '17373960790', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (802, 'yangguo791', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo791', '17373960791', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (803, 'yangguo792', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo792', '17373960792', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (804, 'yangguo793', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo793', '17373960793', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (805, 'yangguo794', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo794', '17373960794', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (806, 'yangguo795', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo795', '17373960795', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (807, 'yangguo796', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo796', '17373960796', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (808, 'yangguo797', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo797', '17373960797', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (809, 'yangguo798', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo798', '17373960798', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (810, 'yangguo799', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo799', '17373960799', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (811, 'yangguo800', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo800', '17373960800', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (812, 'yangguo801', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo801', '17373960801', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (813, 'yangguo802', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo802', '17373960802', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (814, 'yangguo803', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo803', '17373960803', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (815, 'yangguo804', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo804', '17373960804', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (816, 'yangguo805', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo805', '17373960805', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (817, 'yangguo806', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo806', '17373960806', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (818, 'yangguo807', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo807', '17373960807', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (819, 'yangguo808', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo808', '17373960808', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (820, 'yangguo809', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo809', '17373960809', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (821, 'yangguo810', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo810', '17373960810', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (822, 'yangguo811', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo811', '17373960811', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (823, 'yangguo812', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo812', '17373960812', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (824, 'yangguo813', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo813', '17373960813', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (825, 'yangguo814', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo814', '17373960814', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (826, 'yangguo815', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo815', '17373960815', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (827, 'yangguo816', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo816', '17373960816', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (828, 'yangguo817', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo817', '17373960817', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (829, 'yangguo818', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo818', '17373960818', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (830, 'yangguo819', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo819', '17373960819', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (831, 'yangguo820', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo820', '17373960820', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (832, 'yangguo821', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo821', '17373960821', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (833, 'yangguo822', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo822', '17373960822', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (834, 'yangguo823', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo823', '17373960823', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (835, 'yangguo824', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo824', '17373960824', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (836, 'yangguo825', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo825', '17373960825', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (837, 'yangguo826', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo826', '17373960826', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (838, 'yangguo827', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo827', '17373960827', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (839, 'yangguo828', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo828', '17373960828', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (840, 'yangguo829', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo829', '17373960829', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (841, 'yangguo830', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo830', '17373960830', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (842, 'yangguo831', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo831', '17373960831', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (843, 'yangguo832', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo832', '17373960832', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (844, 'yangguo833', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo833', '17373960833', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (845, 'yangguo834', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo834', '17373960834', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (846, 'yangguo835', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo835', '17373960835', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (847, 'yangguo836', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo836', '17373960836', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (848, 'yangguo837', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo837', '17373960837', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (849, 'yangguo838', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo838', '17373960838', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (850, 'yangguo839', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo839', '17373960839', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (851, 'yangguo840', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo840', '17373960840', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (852, 'yangguo841', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo841', '17373960841', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (853, 'yangguo842', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo842', '17373960842', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (854, 'yangguo843', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo843', '17373960843', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (855, 'yangguo844', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo844', '17373960844', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (856, 'yangguo845', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo845', '17373960845', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (857, 'yangguo846', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo846', '17373960846', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (858, 'yangguo847', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo847', '17373960847', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (859, 'yangguo848', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo848', '17373960848', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (860, 'yangguo849', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo849', '17373960849', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (861, 'yangguo850', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo850', '17373960850', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (862, 'yangguo851', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo851', '17373960851', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (863, 'yangguo852', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo852', '17373960852', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (864, 'yangguo853', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo853', '17373960853', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (865, 'yangguo854', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo854', '17373960854', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (866, 'yangguo855', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo855', '17373960855', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (867, 'yangguo856', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo856', '17373960856', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (868, 'yangguo857', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo857', '17373960857', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (869, 'yangguo858', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo858', '17373960858', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (870, 'yangguo859', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo859', '17373960859', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (871, 'yangguo860', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo860', '17373960860', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (872, 'yangguo861', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo861', '17373960861', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (873, 'yangguo862', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo862', '17373960862', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (874, 'yangguo863', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo863', '17373960863', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (875, 'yangguo864', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo864', '17373960864', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (876, 'yangguo865', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo865', '17373960865', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (877, 'yangguo866', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo866', '17373960866', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (878, 'yangguo867', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo867', '17373960867', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (879, 'yangguo868', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo868', '17373960868', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (880, 'yangguo869', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo869', '17373960869', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (881, 'yangguo870', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo870', '17373960870', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (882, 'yangguo871', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo871', '17373960871', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (883, 'yangguo872', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo872', '17373960872', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (884, 'yangguo873', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo873', '17373960873', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (885, 'yangguo874', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo874', '17373960874', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (886, 'yangguo875', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo875', '17373960875', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (887, 'yangguo876', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo876', '17373960876', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (888, 'yangguo877', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo877', '17373960877', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (889, 'yangguo878', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo878', '17373960878', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (890, 'yangguo879', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo879', '17373960879', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (891, 'yangguo880', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo880', '17373960880', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (892, 'yangguo881', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo881', '17373960881', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (893, 'yangguo882', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo882', '17373960882', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (894, 'yangguo883', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo883', '17373960883', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (895, 'yangguo884', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo884', '17373960884', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (896, 'yangguo885', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo885', '17373960885', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (897, 'yangguo886', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo886', '17373960886', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (898, 'yangguo887', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo887', '17373960887', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (899, 'yangguo888', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo888', '17373960888', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (900, 'yangguo889', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo889', '17373960889', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (901, 'yangguo890', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo890', '17373960890', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (902, 'yangguo891', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo891', '17373960891', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (903, 'yangguo892', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo892', '17373960892', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (904, 'yangguo893', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo893', '17373960893', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (905, 'yangguo894', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo894', '17373960894', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (906, 'yangguo895', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo895', '17373960895', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (907, 'yangguo896', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo896', '17373960896', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (908, 'yangguo897', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo897', '17373960897', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (909, 'yangguo898', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo898', '17373960898', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (910, 'yangguo899', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo899', '17373960899', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (911, 'yangguo900', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo900', '17373960900', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (912, 'yangguo901', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo901', '17373960901', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (913, 'yangguo902', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo902', '17373960902', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (914, 'yangguo903', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo903', '17373960903', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (915, 'yangguo904', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo904', '17373960904', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (916, 'yangguo905', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo905', '17373960905', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (917, 'yangguo906', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo906', '17373960906', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (918, 'yangguo907', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo907', '17373960907', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (919, 'yangguo908', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo908', '17373960908', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (920, 'yangguo909', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo909', '17373960909', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (921, 'yangguo910', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo910', '17373960910', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (922, 'yangguo911', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo911', '17373960911', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (923, 'yangguo912', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo912', '17373960912', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (924, 'yangguo913', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo913', '17373960913', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (925, 'yangguo914', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo914', '17373960914', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (926, 'yangguo915', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo915', '17373960915', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (927, 'yangguo916', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo916', '17373960916', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (928, 'yangguo917', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo917', '17373960917', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (929, 'yangguo918', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo918', '17373960918', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (930, 'yangguo919', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo919', '17373960919', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (931, 'yangguo920', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo920', '17373960920', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (932, 'yangguo921', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo921', '17373960921', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (933, 'yangguo922', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo922', '17373960922', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (934, 'yangguo923', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo923', '17373960923', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (935, 'yangguo924', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo924', '17373960924', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (936, 'yangguo925', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo925', '17373960925', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (937, 'yangguo926', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo926', '17373960926', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (938, 'yangguo927', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo927', '17373960927', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (939, 'yangguo928', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo928', '17373960928', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (940, 'yangguo929', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo929', '17373960929', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (941, 'yangguo930', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo930', '17373960930', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (942, 'yangguo931', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo931', '17373960931', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (943, 'yangguo932', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo932', '17373960932', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (944, 'yangguo933', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo933', '17373960933', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (945, 'yangguo934', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo934', '17373960934', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (946, 'yangguo935', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo935', '17373960935', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (947, 'yangguo936', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo936', '17373960936', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (948, 'yangguo937', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo937', '17373960937', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (949, 'yangguo938', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo938', '17373960938', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (950, 'yangguo939', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo939', '17373960939', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (951, 'yangguo940', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo940', '17373960940', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (952, 'yangguo941', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo941', '17373960941', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (953, 'yangguo942', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo942', '17373960942', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (954, 'yangguo943', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo943', '17373960943', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (955, 'yangguo944', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo944', '17373960944', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (956, 'yangguo945', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo945', '17373960945', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (957, 'yangguo946', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo946', '17373960946', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (958, 'yangguo947', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo947', '17373960947', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (959, 'yangguo948', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo948', '17373960948', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (960, 'yangguo949', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo949', '17373960949', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (961, 'yangguo950', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo950', '17373960950', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (962, 'yangguo951', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo951', '17373960951', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (963, 'yangguo952', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo952', '17373960952', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (964, 'yangguo953', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo953', '17373960953', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (965, 'yangguo954', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo954', '17373960954', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (966, 'yangguo955', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo955', '17373960955', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (967, 'yangguo956', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo956', '17373960956', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (968, 'yangguo957', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo957', '17373960957', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (969, 'yangguo958', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo958', '17373960958', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (970, 'yangguo959', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo959', '17373960959', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (971, 'yangguo960', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo960', '17373960960', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (972, 'yangguo961', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo961', '17373960961', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (973, 'yangguo962', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo962', '17373960962', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (974, 'yangguo963', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo963', '17373960963', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (975, 'yangguo964', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo964', '17373960964', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (976, 'yangguo965', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo965', '17373960965', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (977, 'yangguo966', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo966', '17373960966', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (978, 'yangguo967', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo967', '17373960967', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (979, 'yangguo968', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo968', '17373960968', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (980, 'yangguo969', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo969', '17373960969', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (981, 'yangguo970', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo970', '17373960970', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (982, 'yangguo971', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo971', '17373960971', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (983, 'yangguo972', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo972', '17373960972', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (984, 'yangguo973', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo973', '17373960973', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (985, 'yangguo974', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo974', '17373960974', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (986, 'yangguo975', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo975', '17373960975', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (987, 'yangguo976', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo976', '17373960976', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (988, 'yangguo977', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo977', '17373960977', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (989, 'yangguo978', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo978', '17373960978', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (990, 'yangguo979', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo979', '17373960979', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (991, 'yangguo980', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo980', '17373960980', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (992, 'yangguo981', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo981', '17373960981', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (993, 'yangguo982', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo982', '17373960982', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (994, 'yangguo983', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo983', '17373960983', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (995, 'yangguo984', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo984', '17373960984', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (996, 'yangguo985', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo985', '17373960985', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (997, 'yangguo986', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo986', '17373960986', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (998, 'yangguo987', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo987', '17373960987', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (999, 'yangguo988', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo988', '17373960988', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1000, 'yangguo989', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo989', '17373960989', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1001, 'yangguo990', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo990', '17373960990', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1002, 'yangguo991', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo991', '17373960991', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1003, 'yangguo992', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo992', '17373960992', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1004, 'yangguo993', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo993', '17373960993', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1005, 'yangguo994', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo994', '17373960994', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1006, 'yangguo995', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo995', '17373960995', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1007, 'yangguo996', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo996', '17373960996', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1008, 'yangguo997', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo997', '17373960997', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1009, 'yangguo998', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo998', '17373960998', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1010, 'yangguo999', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo999', '17373960999', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);
INSERT INTO `ums_member` VALUES (1011, 'yangguo1000', '$2a$10$Wlyn2c1IZ5woHllbF23pJudiVzMNeAbVviXuwynSU1SKWw12iU/Cm', 'yangguo1000', '173739601000', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `member_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '登陆时间',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆ip',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆城市',
  `login_type` int(0) NULL DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆省份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `member_id` int(0) NULL DEFAULT NULL COMMENT '客户id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收人电话号码',
  `default_status` int(0) NULL DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES (1, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` VALUES (3, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` VALUES (4, 1, '大梨', '18033441849', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');
INSERT INTO `ums_member_receive_address` VALUES (5, 8, 'Monkey', '13131313131', NULL, '110110', '北京', '北京', '北京', '我家住在黄土高坡哦');

-- ----------------------------
-- Table structure for ums_member_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_role_relation`;
CREATE TABLE `ums_member_role_relation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `memeber_id` int(0) NULL DEFAULT NULL COMMENT '用户Id',
  `role_id` int(0) NULL DEFAULT NULL COMMENT '角色Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_role_relation
-- ----------------------------
INSERT INTO `ums_member_role_relation` VALUES (1, 1, 1);
INSERT INTO `ums_member_role_relation` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `type` int(0) NULL DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `status` int(0) NULL DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES (2, '商品列表', 'pms:product:read', 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` VALUES (3, '添加商品', 'pms:product:create', 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` VALUES (4, '商品分类', 'pms:productCategory:read', 1, '/pms/productInfo/**', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` VALUES (5, '商品类型', 'pms:productAttribute:read', 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` VALUES (6, '品牌管理', 'pms:brand:read', 1, '/pms/productInfo/**', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` VALUES (7, '编辑商品', 'pms:product:update', 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` VALUES (8, '删除商品', 'pms:product:delete', 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` VALUES (9, '添加商品分类', 'pms:productCategory:create', 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` VALUES (10, '修改商品分类', 'pms:productCategory:update', 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` VALUES (11, '删除商品分类', 'pms:productCategory:delete', 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` VALUES (12, '添加商品类型', 'pms:productAttribute:create', 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` VALUES (13, '修改商品类型', 'pms:productAttribute:update', 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` VALUES (14, '删除商品类型', 'pms:productAttribute:delete', 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` VALUES (15, '添加品牌', 'pms:brand:create', 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` VALUES (16, '修改品牌', 'pms:brand:update', 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` VALUES (17, '删除品牌', 'pms:brand:delete', 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(0) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(0) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, 'product_admin', '商品管理员', '2018-09-30 15:46:11', 1, 0);
INSERT INTO `ums_role` VALUES (2, 'product_catory_admin', '商品分类管理员', '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` VALUES (3, 'product_type_admin', '商品类型管理员', '2018-09-30 15:53:56', 1, 0);
INSERT INTO `ums_role` VALUES (4, 'brand_admin', '品牌管理员', '2018-09-30 15:54:12', 1, 0);

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` int(0) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色和权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 6);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17);

SET FOREIGN_KEY_CHECKS = 1;
