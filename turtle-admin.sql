/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : turtle-admin

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 25/01/2021 00:00:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for butler_account
-- ----------------------------
DROP TABLE IF EXISTS `butler_account`;
CREATE TABLE `butler_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称，默认为类型名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `properties` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `pictures` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `remark` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `is_favorite` int(11) DEFAULT NULL COMMENT '是否收藏',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_account_category_idx` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3814 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of butler_account
-- ----------------------------
BEGIN;
INSERT INTO `butler_account` VALUES (3659, 1013, '中信银行', 'upload/icon/bank/zhongxin.png', '[{\"name\":\"卡号\",\"value\":\"4033920008279269\"},{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"有效期\",\"value\":\"01/20\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"手机\",\"value\":\"15901097191\"},{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"签名码\",\"value\":\"584\"}]', '[{\"url\":\"upload/account_picture/b9/f26e28b6ccd1db869dc5d24fe77d9c.jpg\"},{\"url\":\"upload/account_picture/ee/ce2af481887301da4632a107d2ba87.jpg\"}]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:33', NULL);
INSERT INTO `butler_account` VALUES (3660, 1013, '广发银行', 'upload/icon/bank/guangfa.png', '[{\"name\":\"卡号\",\"value\":\"5201521373528604\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"有效期\",\"value\":\"11/16\"},{\"name\":\"签名码\",\"value\":\"672\"},{\"name\":\"私密问题\",\"value\":\"您妻子的名字\"},{\"name\":\"私密答案\",\"value\":\"HouHou\"},{\"name\":\"住宅电话\",\"value\":\"0379-61819988\"},{\"name\":\"手机\",\"value\":\"15901097191\"},{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"预留信息\",\"value\":\"kecoyo\"}]', '[{\"url\":\"upload/account_picture/b0/83d6d8174b8ac5867b9d9bb7129880.jpg\"},{\"url\":\"upload/account_picture/38/3732ec07cc89e3b91f8b555f27ad0f.jpg\"}]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:33', NULL);
INSERT INTO `butler_account` VALUES (3661, 1013, '招商银行', 'upload/icon/bank/zhaoshang.png', '[{\"name\":\"卡号\",\"value\":\"6225768706509088\"},{\"name\":\"登陆密码\",\"value\":\"Keco0911\"},{\"name\":\"查询密码\",\"value\":\"870911\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"住宅电话\",\"value\":\"52073878\"},{\"name\":\"公司电话\",\"value\":\"61819988\"},{\"name\":\"有效期\",\"value\":\"10/21\"},{\"name\":\"签名码\",\"value\":\"598\"},{\"name\":\"预留信息\",\"value\":\"kecoyo\"}]', '[{\"url\":\"upload/account_picture/e0/a87a65ea8a689d669423c7e68ada80.jpg\"},{\"url\":\"upload/account_picture/cb/e56f17faa1c9866242750add331653.jpg\"}]', NULL, NULL, '2018-08-12 01:26:37', '2020-11-06 09:07:23', NULL);
INSERT INTO `butler_account` VALUES (3662, 1014, '宽带通', 'upload/icon/web/154.png', '[{\"name\":\"账号\",\"value\":\"610146607\"},{\"name\":\"手机号\",\"value\":\"15901097191\"},{\"name\":\"密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:33', NULL);
INSERT INTO `butler_account` VALUES (3663, 1014, '太平洋', 'upload/icon/business/10.png', '[{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"安全问题\",\"value\":\"您的出生地是？\"},{\"name\":\"问题答案\",\"value\":\"LuoYang\"},{\"name\":\"问题1\",\"value\":\"您的配偶的姓名？\"},{\"name\":\"答案1\",\"value\":\"HouHou\"},{\"name\":\"问题2\",\"value\":\"您最爱的人的名字？\"},{\"name\":\"答案2\",\"value\":\"侯侯\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3664, 1014, '拉卡拉', 'upload/icon/business/19.png', '[{\"name\":\"账号\",\"value\":\"15901097191\"},{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3665, 1014, '跑跑', 'upload/icon/web/113.png', '[{\"name\":\"账号\",\"value\":\"kecoyo\"},{\"name\":\"密码\",\"value\":\"Keco0719\"},{\"name\":\"安全问题1\",\"value\":\"我的手机号码是什么？\"},{\"name\":\"问题答案1\",\"value\":\"15901097191\"},{\"name\":\"安全问题2\",\"value\":\"我妈妈的生日？\"},{\"name\":\"问题答案2\",\"value\":\"660310\"},{\"name\":\"安全码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3666, 1014, '路由器', 'upload/icon/web/019.png', '[{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3667, 1015, '手机支付', 'upload/icon/app/yidong.png', '[{\"name\":\"手机号\",\"value\":\"15210779312\"},{\"name\":\"登录密码\",\"value\":\"881120\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"绑定手机\",\"value\":\"15901097191\"},{\"name\":\"密保问题\",\"value\":\"我的出生地？\"},{\"name\":\"密保答案\",\"value\":\"PuYang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3668, 1015, '手机支付', 'upload/icon/app/yidong.png', '[{\"name\":\"手机号\",\"value\":\"15901097191\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"支付密码\",\"value\":\"881120\"},{\"name\":\"绑定手机\",\"value\":\"15210779312\"},{\"name\":\"密保问题\",\"value\":\"我的出生地？\"},{\"name\":\"密保答案\",\"value\":\"LuoYang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3669, 1015, '中国移动', 'upload/icon/app/yidong.png', '[{\"name\":\"手机号\",\"value\":\"15901097191\"},{\"name\":\"客服密码\",\"value\":\"Keco0911\"},{\"name\":\"电子邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"问题一\",\"value\":\"您的配偶的姓名是？\"},{\"name\":\"答案一\",\"value\":\"HouHou\"},{\"name\":\"答案二\",\"value\":\"1988年10月12日\"},{\"name\":\"问题二\",\"value\":\"您配偶的生日是？\"},{\"name\":\"问题三\",\"value\":\"您的出生地是？\"},{\"name\":\"答案三\",\"value\":\"luoyang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3670, 1015, '飞信', 'upload/icon/app/yidong.png', '[{\"name\":\"手机号码\",\"value\":\"15901097191\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"问题1\",\"value\":\"您母亲的姓名是？\"},{\"name\":\"答案1\",\"value\":\"姚小平\"},{\"name\":\"问题2\",\"value\":\"您父亲的姓名是？\"},{\"name\":\"答案2\",\"value\":\"杨金顶\"},{\"name\":\"问题3\",\"value\":\"您童年最好朋友的名字？\"},{\"name\":\"答案3\",\"value\":\"杨留伟\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3671, 1016, '163邮箱', 'upload/icon/app/wangyi.png', '[{\"name\":\"邮箱\",\"value\":\"kecoho@163.com\"},{\"name\":\"用户名\",\"value\":\"kecoho\"},{\"name\":\"密码\",\"value\":\"Keco&0911\"},{\"name\":\"保密邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"安全码\",\"value\":\"881012\"},{\"name\":\"QQ号码\",\"value\":\"497081433\"},{\"name\":\"手机号\",\"value\":\"15210779312\"},{\"name\":\"密保问题\",\"value\":\"您的出生地是？\"},{\"name\":\"问题答案\",\"value\":\"puyang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3672, 1016, '163邮箱', 'upload/icon/app/wangyi.png', '[{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"登录密码\",\"value\":\"Keco#0911\"},{\"name\":\"保密邮箱\",\"value\":\"kecoho@163.com\"},{\"name\":\"QQ号码\",\"value\":\"744387576\"},{\"name\":\"手机号\",\"value\":\"15901097191\"},{\"name\":\"密保问题\",\"value\":\"您的出生地是？\"},{\"name\":\"问题答案\",\"value\":\"luoyang\"},{\"name\":\"安全码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3673, 1016, '网易宝', 'upload/icon/app/wangyi.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"加密密码\",\"value\":\"881120\"},{\"name\":\"绑定卡号\",\"value\":\"6225880136418572\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3674, 1017, '360', 'upload/icon/app/360.png', '[{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"登录邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco0911\"},{\"name\":\"绑定手机\",\"value\":\"15901097191\"},{\"name\":\"密保邮箱\",\"value\":\"kecoyo@163.com\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', 0);
INSERT INTO `butler_account` VALUES (3675, 1016, '163邮箱', 'upload/icon/app/douban.png', '[{\"name\":\"邮箱\",\"value\":\"yank360@163.com\"},{\"name\":\"用户名\",\"value\":\"yank360\"},{\"name\":\"登录密码\",\"value\":\"Keco#0911\"},{\"name\":\"密保邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密保问题\",\"value\":\"您的出生地是？\"},{\"name\":\"问题答案\",\"value\":\"luoyang\"},{\"name\":\"安全码\",\"value\":\"198707198338\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', NULL);
INSERT INTO `butler_account` VALUES (3676, 1017, 'Google', 'upload/icon/app/google.png', '[{\"name\":\"账户\",\"value\":\"kecoho@163.com\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:34', 1);
INSERT INTO `butler_account` VALUES (3678, 1017, 'Microsoft', 'upload/icon/app/microsoft.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@hotmail.com\"},{\"name\":\"手机号\",\"value\":\"15901097191\"},{\"name\":\"安全邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"生日\",\"value\":\"1987年7月19日\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 2);
INSERT INTO `butler_account` VALUES (3679, 1017, 'MSN', 'upload/icon/app/microsoft.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@msn.com\"},{\"name\":\"密码\",\"value\":\"870911\"},{\"name\":\"出生年份\",\"value\":\"1987\"},{\"name\":\"备用邮箱\",\"value\":\"kecoyo@163.com\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 3);
INSERT INTO `butler_account` VALUES (3680, 1017, 'WPS', 'upload/icon/app/wps.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco0911\"},{\"name\":\"微信\",\"value\":\"744387576\"},{\"name\":\"手机号\",\"value\":\"15901097191\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 4);
INSERT INTO `butler_account` VALUES (3681, 1017, 'apple', 'upload/icon/app/apple.png', '[{\"name\":\"Apple ID\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco&09.11\"},{\"name\":\"姓氏\",\"value\":\"杨\"},{\"name\":\"名字\",\"value\":\"可可\"},{\"name\":\"出生日期\",\"value\":\"19870719\"},{\"name\":\"救援邮箱\",\"value\":\"kecoho@163.com\"},{\"name\":\"国家\",\"value\":\"中国\"},{\"name\":\"省份\",\"value\":\"北京\"},{\"name\":\"县市\",\"value\":\"北京\"},{\"name\":\"地址\",\"value\":\"北京市海淀区中关村东路66号世纪科贸大厦B座\"},{\"name\":\"公司\",\"value\":\"北京英富森软件股份有限公司\"},{\"name\":\"安全问题1\",\"value\":\"你拥有的第一辆车是什么型号？\"},{\"name\":\"答案1\",\"value\":\"别克凯越\"},{\"name\":\"安全问题2\",\"value\":\"你的第一个上司叫什么名字？\"},{\"name\":\"答案2\",\"value\":\"张海建\"},{\"name\":\"安全问题3\",\"value\":\"你少年时代最好的朋友叫什么名字？\"},{\"name\":\"答案3\",\"value\":\"杨留伟\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 5);
INSERT INTO `butler_account` VALUES (3682, 1017, 'sxsoft', 'upload/icon/app/dribbble.png', '[{\"name\":\"账号\",\"value\":\"kecoyo\"},{\"name\":\"密码\",\"value\":\"870911\"},{\"name\":\"真实姓名\",\"value\":\"杨可可\"},{\"name\":\"会员员\",\"value\":\"kecoyo\"},{\"name\":\"支付密码\",\"value\":\"881120\"},{\"name\":\"联系电话\",\"value\":\"15901097191\"},{\"name\":\"Email\",\"value\":\"kecoyo@163.com\"},{\"name\":\"所在地\",\"value\":\"北京市朝阳区\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 6);
INSERT INTO `butler_account` VALUES (3683, 1017, '优蛋115', 'upload/icon/app/dribbble.png', '[{\"name\":\"账号\",\"value\":\"kecoyo\"},{\"name\":\"密码\",\"value\":\"870911\"},{\"name\":\"通行证\",\"value\":\"2911781\"},{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"回收站密码\",\"value\":\"870719\"},{\"name\":\"密保问题\",\"value\":\"我儿时居住地的地址\"},{\"name\":\"问题答案\",\"value\":\"洛阳\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 7);
INSERT INTO `butler_account` VALUES (3684, 1017, '百度', 'upload/icon/app/baidu.png', '[{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"密保问题\",\"value\":\"您身份证号码的最后五位是什么？\"},{\"name\":\"密码\",\"value\":\"Keco&0911\"},{\"name\":\"关联手机\",\"value\":\"15901097191\"},{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"问题答案\",\"value\":\"98338\"},{\"name\":\"真实姓名\",\"value\":\"杨可可\"},{\"name\":\"证件号码\",\"value\":\"410322198707198338\"},{\"name\":\"证件类型\",\"value\":\"身份证\"},{\"name\":\"安全问题1\",\"value\":\"我妻子姓名是？\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"安全答案1\",\"value\":\"HouHou\"},{\"name\":\"安全问题2\",\"value\":\"我妻子生日是？\"},{\"name\":\"安全答案2\",\"value\":\"19881012\"},{\"name\":\"安全问题3\",\"value\":\"我妻子出生地是？\"},{\"name\":\"安全答案3\",\"value\":\"puyang\"},{\"name\":\"问题一\",\"value\":\"对您影响最大的人的姓名是？\"},{\"name\":\"答案一\",\"value\":\"清欢\"},{\"name\":\"问题二\",\"value\":\"您最喜欢的历史人物的姓名是？\"},{\"name\":\"答案二\",\"value\":\"利弗莫尔\"},{\"name\":\"问题三\",\"value\":\"您家的地址是？\"},{\"name\":\"答案三\",\"value\":\"LuoYang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 8);
INSERT INTO `butler_account` VALUES (3685, 1017, '迅雷', 'upload/icon/app/twitter.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"},{\"name\":\"帐号\",\"value\":\"792470699\"},{\"name\":\"密码\",\"value\":\"870911\"},{\"name\":\"密保问题1\",\"value\":\"您配偶的姓名？\"},{\"name\":\"密保答案1\",\"value\":\"HouHou\"},{\"name\":\"密保问题2\",\"value\":\"您配偶的生日？\"},{\"name\":\"密保答案2\",\"value\":\"881012\"},{\"name\":\"密保答案3\",\"value\":\"SOHO\"},{\"name\":\"密保问题3\",\"value\":\"您配偶的职业？\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 9);
INSERT INTO `butler_account` VALUES (3686, 1018, '凡客诚品', 'upload/icon/business/31.png', '[{\"name\":\"用户名\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco0911\"},{\"name\":\"支付密码\",\"value\":\"881120\"}]', '[]', '', NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 0);
INSERT INTO `butler_account` VALUES (3687, 1018, '我买网', 'upload/icon/app/womaiwang.png', '[{\"name\":\"用户名\",\"value\":\"kecoyo@163.com\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"支付密码\",\"value\":\"Keco1120\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 13);
INSERT INTO `butler_account` VALUES (3688, 1018, '京东', 'upload/icon/app/jingdong.png', '[{\"name\":\"账号\",\"value\":\"kecoyo\"},{\"name\":\"密码\",\"value\":\"Keco0911\"},{\"name\":\"支付密码\",\"value\":\"Keco1120\"},{\"name\":\"安全邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"安全手机\",\"value\":\"15901097191\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 12);
INSERT INTO `butler_account` VALUES (3689, 1018, '当当网', 'upload/icon/app/dangdang.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco0911\"},{\"name\":\"昵称\",\"value\":\"kecoyo\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:35', 11);
INSERT INTO `butler_account` VALUES (3690, 1018, '快钱', 'upload/icon/app/kuaiqian.png', '[{\"name\":\"用户名\",\"value\":\"kecoyo@163.com\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"姓名\",\"value\":\"杨可可\"},{\"name\":\"手机号码\",\"value\":\"15901097191\"},{\"name\":\"验证银行\",\"value\":\"北京工行天通苑支行\"},{\"name\":\"银行卡号\",\"value\":\"6212260200003300213\"},{\"name\":\"安全问题\",\"value\":\"您的幸运数字？\"},{\"name\":\"答案\",\"value\":\"0911\"},{\"name\":\"登录问候语\",\"value\":\"KECOYO!!!!\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 10);
INSERT INTO `butler_account` VALUES (3691, 1018, '支付宝', 'upload/icon/app/alipay.png', '[{\"name\":\"账号\",\"value\":\"15810683362\"},{\"name\":\"密码\",\"value\":\"zaizai0131\"},{\"name\":\"支付密码\",\"value\":\"1501031\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 9);
INSERT INTO `butler_account` VALUES (3692, 1018, '支付宝', 'upload/icon/app/alipay.png', '[{\"name\":\"登录名\",\"value\":\"kecoho@163.com\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"用户类型\",\"value\":\"个人\"},{\"name\":\"真实姓名\",\"value\":\"侯慧杰\"},{\"name\":\"支付密码\",\"value\":\"kecoyo\"},{\"name\":\"密保问题\",\"value\":\"我的出生地是？\"},{\"name\":\"密保答案\",\"value\":\"puyang\"},{\"name\":\"绑定手机\",\"value\":\"15210779312\"},{\"name\":\"身份证\",\"value\":\"410928198810121022\"},{\"name\":\"安全问题2\",\"value\":\"我丈夫的生日是\"},{\"name\":\"安全答案1\",\"value\":\"臭臭\"},{\"name\":\"安全问题1\",\"value\":\"我丈夫的名字是\"},{\"name\":\"安全答案2\",\"value\":\"19870719\"},{\"name\":\"安全问题3\",\"value\":\"我丈夫的出生地是\"},{\"name\":\"安全答案3\",\"value\":\"luoyang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 8);
INSERT INTO `butler_account` VALUES (3693, 1018, '支付宝', 'upload/icon/app/alipay.png', '[{\"name\":\"登录名\",\"value\":\"kecoyo@163.com\"},{\"name\":\"登录密码\",\"value\":\"Keco&0911\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"问答\",\"value\":\"您的出生地是？\"},{\"name\":\"答案\",\"value\":\"luoyang\"},{\"name\":\"绑定手机\",\"value\":\"15901097191\"},{\"name\":\"安全答案1\",\"value\":\"HouHou\"},{\"name\":\"安全问题1\",\"value\":\"我妻子的名字是\"},{\"name\":\"安全答案2\",\"value\":\"19881012\"},{\"name\":\"安全问题3\",\"value\":\"我妻子的出生地是\"},{\"name\":\"安全问题2\",\"value\":\"我妻子的生日是\"},{\"name\":\"安全答案3\",\"value\":\"puyang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 7);
INSERT INTO `butler_account` VALUES (3694, 1018, '易宝', 'upload/icon/app/yibao.png', '[{\"name\":\"账号\",\"value\":\"kecoho@163.com\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"交易密码\",\"value\":\"870911\"},{\"name\":\"密保问题\",\"value\":\"你爸爸的出生地？\"},{\"name\":\"密保答案\",\"value\":\"PuYang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 6);
INSERT INTO `butler_account` VALUES (3695, 1018, '新付通', 'upload/icon/app/weibo.png', '[{\"name\":\"安全邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密保答案\",\"value\":\"LuoYang\"},{\"name\":\"密保问题\",\"value\":\"你的出生地在哪里？\"},{\"name\":\"支付密码\",\"value\":\"kecoho\"},{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 5);
INSERT INTO `butler_account` VALUES (3696, 1018, '银联在线', 'upload/icon/app/yinlian.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco0911\"},{\"name\":\"客户号\",\"value\":\"000068935449\"},{\"name\":\"安全问题\",\"value\":\"您配偶的姓名\"},{\"name\":\"问题答案\",\"value\":\"HouHou\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 4);
INSERT INTO `butler_account` VALUES (3697, 1018, '易宝', 'upload/icon/app/wangyi.png', '[{\"name\":\"密保问题\",\"value\":\"你爸爸的出生地？\"},{\"name\":\"密保答案\",\"value\":\"LuoYang\"},{\"name\":\"交易密码\",\"value\":\"870911\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 3);
INSERT INTO `butler_account` VALUES (3698, 1018, '淘宝网', 'upload/icon/app/taobao.png', '[{\"name\":\"会员名\",\"value\":\"kecoho\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"电子邮箱\",\"value\":\"kecoho@163.com\"},{\"name\":\"安全问题1\",\"value\":\"您配偶的姓名是？\"},{\"name\":\"答案1\",\"value\":\"臭臭\"},{\"name\":\"安全问题2\",\"value\":\"您配偶的生日是？\"},{\"name\":\"答案2\",\"value\":\"19870719\"},{\"name\":\"安全问题3\",\"value\":\"您的出生地是？\"},{\"name\":\"答案3\",\"value\":\"puyang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 2);
INSERT INTO `butler_account` VALUES (3699, 1019, '东方财富证券', 'upload/icon/app/dongfangcaifu.png', '[{\"name\":\"深A股东号\",\"value\":\"0151140877\"},{\"name\":\"沪A股东号\",\"value\":\"A568466070\"},{\"name\":\"资金账号\",\"value\":\"540600252299\"},{\"name\":\"密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', NULL);
INSERT INTO `butler_account` VALUES (3700, 1019, '上海黄金交易所', 'upload/icon/web/017.png', '[{\"name\":\"交易账号\",\"value\":\"1079245435\"},{\"name\":\"交易密码\",\"value\":\"Keco0911\"},{\"name\":\"资金密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', NULL);
INSERT INTO `butler_account` VALUES (3701, 1018, '淘宝网', 'upload/icon/app/taobao.png', '[{\"name\":\"会员名\",\"value\":\"kecoyo\"},{\"name\":\"登录密码\",\"value\":\"Keco&0911\"},{\"name\":\"电子邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"安全问题1\",\"value\":\"您配偶的姓名是？\"},{\"name\":\"答案1\",\"value\":\"侯侯\"},{\"name\":\"安全问题2\",\"value\":\"您配偶的生日是？\"},{\"name\":\"答案2\",\"value\":\"19881012\"},{\"name\":\"安全问题3\",\"value\":\"您的出生地是？\"},{\"name\":\"答案3\",\"value\":\"luoyang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', 1);
INSERT INTO `butler_account` VALUES (3702, 1019, '中信证券', 'upload/icon/bank/zhongxin.png', '[{\"name\":\"资金账户\",\"value\":\"2800006363\"},{\"name\":\"深A股东号\",\"value\":\"0151140877\"},{\"name\":\"上A股东号\",\"value\":\"A384556900\"},{\"name\":\"交易密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:36', NULL);
INSERT INTO `butler_account` VALUES (3703, 1019, '同花顺', 'upload/icon/app/qzone.png', '[{\"name\":\"密码\",\"value\":\"Keco09111\"},{\"name\":\"账号\",\"value\":\"kecoyo\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3704, 1019, '广东省贵金属交易中心', 'upload/icon/app/dribbble.png', '[{\"name\":\"登录帐号\",\"value\":\"099000000197191\"},{\"name\":\"登录密码\",\"value\":\"93wqdy\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"资金密码\",\"value\":\"251983\"},{\"name\":\"银行签约账号\",\"value\":\"100221498\"},{\"name\":\"电话密码\",\"value\":\"870911\"},{\"name\":\"联系地址\",\"value\":\"北京市昌平区东小口镇太平家园3号楼101室\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3705, 1019, '南方稀贵金属交易所', 'upload/icon/app/dribbble.png', '[{\"name\":\"交易账户\",\"value\":\"16392785\"},{\"name\":\"网易账号\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"870911\"},{\"name\":\"资金密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3706, 1019, '齐鲁商品交易所', 'upload/icon/app/dribbble.png', '[{\"name\":\"交易账号\",\"value\":\"150666666125486\"},{\"name\":\"交易密码\",\"value\":\"870911\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3707, 1019, '天津电交所', 'upload/icon/app/dribbble.png', '[{\"name\":\"实盘账号\",\"value\":\"015000000001284\"},{\"name\":\"登陆密码\",\"value\":\"Keco0911\"},{\"name\":\"资金密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3708, 1019, '广东省贵金属交易中心（网易）', 'upload/icon/app/dribbble.png', '[{\"name\":\"交易账号\",\"value\":\"163000000062981\"},{\"name\":\"交易密码\",\"value\":\"Keco0911\"},{\"name\":\"资金密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3709, 1019, '易方达基金', 'upload/icon/app/dribbble.png', '[{\"name\":\"账号\",\"value\":\"410322198707198338\"},{\"name\":\"密码\",\"value\":\"20150131\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3710, 1020, 'QQ', 'upload/icon/app/qq.png', '[{\"name\":\"账户\",\"value\":\"497081433\"},{\"name\":\"密码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3711, 1020, '财付通', 'upload/icon/app/caifutong.png', '[{\"name\":\"账户\",\"value\":\"497081433\"},{\"name\":\"密保问题\",\"value\":\"我的出生地在哪？\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"密保答案\",\"value\":\"puyang\"},{\"name\":\"真实姓名\",\"value\":\"侯慧杰\"},{\"name\":\"Email\",\"value\":\"kecoho@163.com\"},{\"name\":\"手机服务\",\"value\":\"13733165453\"},{\"name\":\"身份证\",\"value\":\"410928198810121022\"},{\"name\":\"短信通知\",\"value\":\"13733165453\"},{\"name\":\"QQ通知\",\"value\":\"497081433\"},{\"name\":\"邮件通知\",\"value\":\"kecoho@163.com\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3712, 1020, 'QQ', 'upload/icon/app/qq.png', '[{\"name\":\"账号\",\"value\":\"744387576\"},{\"name\":\"密码\",\"value\":\"Keco&0911\"},{\"name\":\"昵称\",\"value\":\"木易王可\"},{\"name\":\"关联邮箱\",\"value\":\"yank360@163.com\"},{\"name\":\"年龄\",\"value\":\"20\"},{\"name\":\"性别\",\"value\":\"男\"},{\"name\":\"安全邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"真实姓名\",\"value\":\"杨可可\"},{\"name\":\"证件类型\",\"value\":\"身份证\"},{\"name\":\"证件号码\",\"value\":\"410322198707198338\"},{\"name\":\"支付密码\",\"value\":\"Keco0911\"},{\"name\":\"密保问题一\",\"value\":\"您的配偶的姓名是？\"},{\"name\":\"答案一\",\"value\":\"HouHou\"},{\"name\":\"密保问题三\",\"value\":\"您的出生地是？\"},{\"name\":\"密保问题二\",\"value\":\"您配偶的生日是？\"},{\"name\":\"答案二\",\"value\":\"19881012\"},{\"name\":\"答案三\",\"value\":\"luoyang\"},{\"name\":\"绑定手机\",\"value\":\"15901097191\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3713, 1020, '财付通', 'upload/icon/app/caifutong.png', '[{\"name\":\"账号\",\"value\":\"744387576\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"短信通知\",\"value\":\"13733165433\"},{\"name\":\"邮件通知\",\"value\":\"kecoyo@163.com\"},{\"name\":\"QQ通知\",\"value\":\"744387576\"},{\"name\":\"密保问题\",\"value\":\"我的出生地在哪？\"},{\"name\":\"密保答案\",\"value\":\"luoyang\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', NULL);
INSERT INTO `butler_account` VALUES (3714, 1021, '北京光大（侯）', 'upload/icon/bank/guangda.png', '[{\"name\":\"卡号\",\"value\":\"6226620206700254\"},{\"name\":\"登录名\",\"value\":\"kecoho\"},{\"name\":\"登录密码\",\"value\":\"Keco1120\"},{\"name\":\"取现密码\",\"value\":\"870911\"},{\"name\":\"防伪信息\",\"value\":\"kecoho\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', 13);
INSERT INTO `butler_account` VALUES (3715, 1021, '北京光大（新）', 'upload/icon/bank/guangda.png', '[{\"name\":\"卡号\",\"value\":\"6214920204675506\"},{\"name\":\"登录名\",\"value\":\"kecoyo\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"取现密码\",\"value\":\"870911\"},{\"name\":\"校验码\",\"value\":\"5506 053\"},{\"name\":\"有效期\",\"value\":\"12/22\"},{\"name\":\"防伪信息\",\"value\":\"hello kecoyo\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:37', 12);
INSERT INTO `butler_account` VALUES (3716, 1021, '北京光大（旧）', 'upload/icon/bank/guangda.png', '[{\"name\":\"卡号\",\"value\":\"6226660204808246\"},{\"name\":\"登录名\",\"value\":\"kecoyo\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"取现密码\",\"value\":\"870911\"},{\"name\":\"防伪信息\",\"value\":\"hello kecoyo\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 11);
INSERT INTO `butler_account` VALUES (3717, 1021, '北京农行', 'upload/icon/bank/nongye.png', '[{\"name\":\"卡号\",\"value\":\"6228480739116471072\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"查询密码\",\"value\":\"870911\"},{\"name\":\"支付密码\",\"value\":\"881120\"},{\"name\":\"U盾密码\",\"value\":\"881120\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 10);
INSERT INTO `butler_account` VALUES (3718, 1021, '北京工商', 'upload/icon/bank/gongshang.png', '[{\"name\":\"卡号\",\"value\":\"6212260200133390183\"},{\"name\":\"用户名\",\"value\":\"kecoyo7191\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"取款密码\",\"value\":\"870911\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"U盾密码\",\"value\":\"870911\"},{\"name\":\"安全问题3\",\"value\":\"我的生日\"},{\"name\":\"预留答案3\",\"value\":\"870911\"},{\"name\":\"安全问题1\",\"value\":\"我的出生地\"},{\"name\":\"预留答案2\",\"value\":\"HouHou\"},{\"name\":\"安全问题2\",\"value\":\"配偶的姓名\"},{\"name\":\"预留答案1\",\"value\":\"LuoYang\"},{\"name\":\"预留验证信息\",\"value\":\"kecoyo\"}]', '[{\"url\":\"upload/account_picture/9c/1c31e5e77f0b842e3efc66bbd9f52f.jpg\"},{\"url\":\"upload/account_picture/db/8c134a789b5b20148fefb672aee10c.jpg\"}]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 9);
INSERT INTO `butler_account` VALUES (3719, 1021, '北京招商（侯）', 'upload/icon/bank/zhaoshang.png', '[{\"name\":\"卡号\",\"value\":\"6225880141366311\"},{\"name\":\"登录密码\",\"value\":\"881120\"},{\"name\":\"查询密码\",\"value\":\"881120\"},{\"name\":\"取款密码\",\"value\":\"881120\"},{\"name\":\"支付密码\",\"value\":\"870911\"},{\"name\":\"用户密码\",\"value\":\"881120\"},{\"name\":\"姓名\",\"value\":\"侯慧杰\"},{\"name\":\"证件类型\",\"value\":\"身份证\"},{\"name\":\"证件号码\",\"value\":\"410928198810121022\"},{\"name\":\"手机号\",\"value\":\"15210779312\"},{\"name\":\"邮箱\",\"value\":\"kecoho@163.com\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 8);
INSERT INTO `butler_account` VALUES (3720, 1021, '北京招商（杨）', 'upload/icon/bank/zhaoshang.png', '[{\"name\":\"卡号\",\"value\":\"6225880136418572\"},{\"name\":\"登录密码\",\"value\":\"870911\"},{\"name\":\"取款密码\",\"value\":\"870911\"},{\"name\":\"查询密码\",\"value\":\"870911\"},{\"name\":\"支付密码\",\"value\":\"881120\"},{\"name\":\"姓名\",\"value\":\"杨可可\"},{\"name\":\"证件号码\",\"value\":\"410322198707198338\"},{\"name\":\"证件类型\",\"value\":\"身份证\"},{\"name\":\"用户密码\",\"value\":\"870911\"},{\"name\":\"手机号\",\"value\":\"15901097191\"},{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 7);
INSERT INTO `butler_account` VALUES (3721, 1021, '北京邮政（侯）', 'upload/icon/bank/youzheng.png', '[{\"name\":\"卡号\",\"value\":\"6221881000091923045\"},{\"name\":\"用户名\",\"value\":\"kecoho\"},{\"name\":\"登录密码\",\"value\":\"Keco1120\"},{\"name\":\"姓名\",\"value\":\"侯慧杰\"},{\"name\":\"手机号码\",\"value\":\"15210779312\"},{\"name\":\"预留信息\",\"value\":\"kecoho\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 6);
INSERT INTO `butler_account` VALUES (3722, 1021, '北京邮政（杨）', 'upload/icon/bank/youzheng.png', '[{\"name\":\"卡号\",\"value\":\"6217991000020195678\"},{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"姓名\",\"value\":\"杨可可\"},{\"name\":\"手机号码\",\"value\":\"15901097191\"},{\"name\":\"预留信息\",\"value\":\"海龟先生\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 5);
INSERT INTO `butler_account` VALUES (3723, 1021, '北京银行', 'upload/icon/bank/beijing.png', '[{\"name\":\"卡号\",\"value\":\"6214686001461206\"},{\"name\":\"取现密码\",\"value\":\"870911\"},{\"name\":\"用户名\",\"value\":\"kecoyo\"},{\"name\":\"有效期\",\"value\":\"12/23\"},{\"name\":\"预留信息\",\"value\":\"kecoyo\"}]', '[{\"url\":\"upload/account_picture/ca/919ba1f2ee8f0ed99343b24d07d95c.jpg\"},{\"url\":\"upload/account_picture/74/e4449eb64d585b8a81f259b5e068da.jpg\"}]', NULL, NULL, '2018-08-12 01:26:37', '2020-11-26 15:15:39', 4);
INSERT INTO `butler_account` VALUES (3724, 1021, '洛阳建行', 'upload/icon/bank/jianshe.png', '[{\"name\":\"卡号\",\"value\":\"6222802451581163697\"},{\"name\":\"登录密码\",\"value\":\"Keco0911\"},{\"name\":\"取款密码\",\"value\":\"870911\"},{\"name\":\"UKey密码\",\"value\":\"881120\"},{\"name\":\"手机号码\",\"value\":\"15901097191\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 3);
INSERT INTO `butler_account` VALUES (3725, 1021, '郑州中信', 'upload/icon/bank/zhongxin.png', '[{\"name\":\"卡号\",\"value\":\"6226901106083813\"},{\"name\":\"登录密码\",\"value\":\"Keco1120\"},{\"name\":\"取款密码\",\"value\":\"870911\"},{\"name\":\"UKey密码\",\"value\":\"870911\"},{\"name\":\"支付密码\",\"value\":\"881120\"},{\"name\":\"预留信息\",\"value\":\"kecoyo\"},{\"name\":\"私密问题1\",\"value\":\"您妻子的姓名?\"},{\"name\":\"私密问题2\",\"value\":\"您妻子生日?\"},{\"name\":\"问题答案1\",\"value\":\"HouHou\"},{\"name\":\"问题答案2\",\"value\":\"881012\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 2);
INSERT INTO `butler_account` VALUES (3726, 1021, '郑州招商（侯）', 'upload/icon/bank/zhaoshang.png', '[{\"name\":\"卡号\",\"value\":\"6225883718881522\"},{\"name\":\"姓名\",\"value\":\"侯慧杰\"},{\"name\":\"证件类型\",\"value\":\"身份证\"},{\"name\":\"用户密码\",\"value\":\"881120\"},{\"name\":\"证件号码\",\"value\":\"410928198810121022\"},{\"name\":\"手机号码\",\"value\":\"15210779312\"},{\"name\":\"电子邮箱\",\"value\":\"kecoho@163.com\"},{\"name\":\"取款密码\",\"value\":\"881120\"},{\"name\":\"登录密码\",\"value\":\"881120\"},{\"name\":\"查询密码\",\"value\":\"881120\"},{\"name\":\"支付密码\",\"value\":\"870911\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 1);
INSERT INTO `butler_account` VALUES (3727, 1021, '郑州招商（杨）', 'upload/icon/bank/zhaoshang.png', '[{\"name\":\"卡号\",\"value\":\"6225883718880946\"},{\"name\":\"姓名\",\"value\":\"杨可可\"},{\"name\":\"证件类型\",\"value\":\"身份证\"},{\"name\":\"证件号码\",\"value\":\"410322198707198338\"},{\"name\":\"用户密码\",\"value\":\"870911\"},{\"name\":\"手机号码\",\"value\":\"15901097191\"},{\"name\":\"登录密码\",\"value\":\"870911\"},{\"name\":\"电子邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"取款密码\",\"value\":\"870911\"},{\"name\":\"查询密码\",\"value\":\"870911\"},{\"name\":\"支付密码\",\"value\":\"881120\"}]', '[]', NULL, NULL, '2018-08-12 01:26:37', '2020-10-18 22:21:38', 0);
INSERT INTO `butler_account` VALUES (3728, NULL, '新建账号', 'upload/icon/app/360.png', '[]', '[]', NULL, NULL, '2018-09-16 01:11:21', '2020-10-18 22:21:38', NULL);
INSERT INTO `butler_account` VALUES (3729, NULL, '新建账号', 'upload/icon/app/360.png', '[]', '[]', NULL, NULL, '2018-09-16 01:12:21', '2020-10-18 22:21:38', NULL);
INSERT INTO `butler_account` VALUES (3730, NULL, '新建账号', 'upload/icon/app/360.png', '[]', '[]', NULL, NULL, '2018-09-16 01:14:05', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3731, NULL, '新建账号', 'upload/icon/app/360.png', '[{\"name\":\"账号\",\"value\":\"xxxx\"},{\"name\":\"密码\",\"value\":\"123456\"}]', '[]', NULL, NULL, '2018-09-16 01:16:09', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3748, 1014, '企通宽带', 'upload/icon/web/014.png', '[{\"name\":\"账号\",\"value\":\"G0315021802\"},{\"name\":\"WiFi名称\",\"value\":\"YouKu-E348\"},{\"name\":\"WiFi密码\",\"value\":\"15603760979\"},{\"name\":\"维修电话\",\"value\":\"18103361131\"}]', '[{\"url\":\"upload/account_picture/68/895c849bf59fa0e87d5ba128e04878.jpg\"}]', NULL, NULL, '2018-09-18 07:03:06', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3749, 1048, '身份证-杨可可', 'upload/icon/web/114.png', '[{\"name\":\"账号\",\"value\":\"410322198707198338\"}]', '[{\"url\":\"upload/account_picture/76/f614ef7483db504c558bc54a0202b0.jpg\"},{\"url\":\"upload/account_picture/b2/9422314195c549672a71286e05fce0.jpg\"},{\"url\":\"upload/account_picture/06/d63a84bd367e35ca429956c800b8fd.jpg\"},{\"url\":\"upload/account_picture/8a/a5f0ec28b07f03b2be09776978da7f.jpg\"}]', NULL, NULL, '2018-09-19 23:19:08', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3750, 1017, '小米', 'upload/icon/app/xiaomi.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2018-09-20 08:43:34', '2020-10-18 22:21:39', 10);
INSERT INTO `butler_account` VALUES (3751, 1018, '壹药网', 'upload/icon/web/139.png', '[{\"name\":\"账号\",\"value\":\"15901097191\"},{\"name\":\"密码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2018-09-25 20:46:02', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3752, 1017, '聚合数据', 'upload/icon/business/40.png', '[{\"name\":\"账号\",\"value\":\"kecoyo\"},{\"name\":\"密码\",\"value\":\"870911\"},{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"},{\"name\":\"绑定手机\",\"value\":\"15901097191\"},{\"name\":\"网址\",\"value\":\"https://www.juhe.cn\"}]', '[]', NULL, NULL, '2018-09-26 21:28:04', '2020-10-18 22:21:39', 11);
INSERT INTO `butler_account` VALUES (3753, 1020, '微信', 'upload/icon/app/wechat.png', '[{\"name\":\"账号\",\"value\":\"zaizaiyeye64\"},{\"name\":\"密码\",\"value\":\"zai20150131\"}]', '[]', NULL, NULL, '2018-10-07 20:47:01', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3754, 1017, '阿里云', 'upload/icon/app/alipay.png', '[]', '[]', NULL, NULL, '2018-10-17 09:14:18', '2020-10-18 22:21:39', 12);
INSERT INTO `butler_account` VALUES (3755, 1017, '北京一卡通', 'upload/icon/web/006.png', '[]', '[]', NULL, NULL, '2018-10-26 09:27:01', '2020-10-18 22:21:39', 13);
INSERT INTO `butler_account` VALUES (3756, 1017, 'CSDN', 'upload/icon/app/dribbble.png', '[{\"name\":\"账号\",\"value\":\"kecoyo@163.com\"},{\"name\":\"密码\",\"value\":\"Keco&0911!@#\"}]', '[]', NULL, NULL, '2018-11-28 14:10:04', '2020-10-18 22:21:39', 14);
INSERT INTO `butler_account` VALUES (3798, 1048, '身份证-侯慧杰', 'upload/icon/web/115.png', '[{\"name\":\"账号\",\"value\":\"410928198810121022\"}]', '[{\"url\":\"upload/account_picture/d5/bb61428b974904db60577845aa3bee.jpg\"},{\"url\":\"upload/account_picture/cc/5548c064d340c966e9d78663637a26.jpg\"},{\"url\":\"upload/account_picture/09/fb61c5d7e0bff18d6d15ee543631da.jpg\"}]', NULL, NULL, '2019-04-05 23:16:03', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3799, 1048, '身份证-杨修远', 'upload/icon/web/114.png', '[{\"name\":\"账号\",\"value\":\"410322201501310034\"}]', '[{\"url\":\"upload/account_picture/be/247f802a0e547b1d0dbac2e665d578.jpg\"},{\"url\":\"upload/account_picture/c4/b1e6bdcafa9903046d83674948b08e.jpg\"},{\"url\":\"upload/account_picture/78/7a1e6e5fb2b5f564c2a33c7dd5a5f9.jpg\"}]', NULL, NULL, '2019-04-05 23:19:15', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3800, 1048, '身份证-杨利弗', 'upload/icon/web/115.png', '[{\"name\":\"账号\",\"value\":\"410322201802260165\"}]', '[{\"url\":\"upload/account_picture/b2/2a8d37883d4c996dd2afcc18b5c9e2.jpg\"},{\"url\":\"upload/account_picture/d1/4644409e2c7c4acfd3ff072c2ce56c.jpg\"}]', NULL, NULL, '2019-04-05 23:21:22', '2020-10-18 22:21:39', NULL);
INSERT INTO `butler_account` VALUES (3801, 1048, '身份证-杨利莫', 'upload/icon/web/115.png', '[{\"name\":\"账号\",\"value\":\"410322201802260181\"}]', '[{\"url\":\"upload/account_picture/e7/247c8386d348758393a6f7b116a9e3.jpg\"},{\"url\":\"upload/account_picture/72/2ec441633f5998b24870a59e9ee698.jpg\"}]', NULL, NULL, '2019-04-05 23:22:02', '2020-10-18 22:21:40', NULL);
INSERT INTO `butler_account` VALUES (3802, 1048, '证件照', 'upload/icon/web/112.png', '[{\"name\":\"姓名\",\"value\":\"杨仔仔\"}]', '[{\"url\":\"upload/account_picture/79/b8c0ab867a69200021f36907f9e915.jpg\"}]', NULL, NULL, '2019-04-09 22:55:46', '2020-10-18 22:21:40', NULL);
INSERT INTO `butler_account` VALUES (3803, 1013, '中信银行-现金分期', 'upload/icon/bank/zhongxin.png', '[{\"name\":\"账号\",\"value\":\"6229180086526615\"}]', '[]', NULL, NULL, '2019-04-29 07:00:29', '2020-10-18 22:21:40', NULL);
INSERT INTO `butler_account` VALUES (3804, 1014, 'ShadowsocksX', 'upload/icon/web/124.png', '[{\"name\":\"地址\",\"value\":\"us.61bing.com\"}]', '[]', '服务器ip：us.61bing.com\n或 us-iplc.61bing.com\n或 jp.61bing.com\n或 kr.61bing.com\n或 sg.61bing.com\n或 hk-iplc.61bing.com\n\n端口号：8709\n密码：Keco8709\n加密方式：cha', NULL, '2019-05-10 07:48:49', '2020-12-06 10:24:35', NULL);
INSERT INTO `butler_account` VALUES (3805, 1048, '杨金顶', 'upload/icon/web/114.png', '[{\"name\":\"账号\",\"value\":\"410322196412038311\"}]', '[{\"url\":\"upload/account_picture/54/d6de10f34f5e318e0c9bd5505a03c1.jpg\"},{\"url\":\"upload/account_picture/be/7a4007b2077a678b50cf11bb169af6.jpg\"}]', NULL, NULL, '2019-05-25 22:20:54', '2020-10-18 22:21:40', NULL);
INSERT INTO `butler_account` VALUES (3806, 1048, '姚小平', 'upload/icon/web/115.png', '[{\"name\":\"账号\",\"value\":\"410322196603108327\"}]', '[{\"url\":\"upload/account_picture/5b/5357e34e7a9416ea9caedd85bc36cb.jpg\"},{\"url\":\"upload/account_picture/97/3dac6d8575fe577d29e5474eac6fb5.jpg\"}]', NULL, NULL, '2019-06-12 22:40:00', '2020-10-18 22:21:40', NULL);
INSERT INTO `butler_account` VALUES (3807, 1016, 'Gmail', 'upload/icon/app/gmail.png', '[{\"name\":\"账号\",\"value\":\"kecoho@gmail.com\"},{\"name\":\"密码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2019-06-19 08:27:17', '2020-10-18 22:21:40', NULL);
INSERT INTO `butler_account` VALUES (3808, 1017, '58同城', 'upload/icon/app/dribbble.png', '[{\"name\":\"账号\",\"value\":\"kecoyo\"},{\"name\":\"密码\",\"value\":\"Keco0911\"}]', '[]', NULL, NULL, '2019-08-01 07:42:40', '2020-10-18 22:21:40', NULL);
INSERT INTO `butler_account` VALUES (3809, 1048, '奶奶', 'upload/icon/web/115.png', '[{\"name\":\"账号\",\"value\":\"41032219390117832X\"}]', '[{\"url\":\"upload/account_picture/98/b3bc2fe8ca787814d670b15d0c85a2.jpg\"},{\"url\":\"upload/account_picture/c9/6268f6faaf9d52224a4deb10804e6a.jpg\"}]', NULL, NULL, '2020-05-27 19:50:58', '2020-10-18 22:21:40', NULL);
INSERT INTO `butler_account` VALUES (3813, 1014, '个人征信', 'upload/icon/web/002.png', '[{\"name\":\"账号\",\"value\":\"kecoyo\"},{\"name\":\"密码\",\"value\":\"Keco0911\"},{\"name\":\"手机号\",\"value\":\"15901097191\"},{\"name\":\"邮箱\",\"value\":\"kecoyo@163.com\"}]', '[]', NULL, NULL, '2020-11-06 09:03:11', '2020-11-06 09:03:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for butler_category
-- ----------------------------
DROP TABLE IF EXISTS `butler_category`;
CREATE TABLE `butler_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1050 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of butler_category
-- ----------------------------
BEGIN;
INSERT INTO `butler_category` VALUES (1013, '信用卡', 'upload/icon/web/087.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 5);
INSERT INTO `butler_category` VALUES (1014, '其他', 'upload/icon/web/155.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 9);
INSERT INTO `butler_category` VALUES (1015, '手机账户', 'upload/icon/web/112.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 6);
INSERT INTO `butler_category` VALUES (1016, '电子邮箱', 'upload/icon/web/024.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 2);
INSERT INTO `butler_category` VALUES (1017, '网站登录', 'upload/icon/web/023.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 3);
INSERT INTO `butler_category` VALUES (1018, '网购支付', 'upload/icon/web/004.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 1);
INSERT INTO `butler_category` VALUES (1019, '金融交易', 'upload/icon/web/148.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 7);
INSERT INTO `butler_category` VALUES (1020, '聊天娱乐', 'upload/icon/web/019.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 0);
INSERT INTO `butler_category` VALUES (1021, '银行卡', 'upload/icon/web/017.png', '2018-08-12 01:26:37', '2020-10-19 22:54:05', 4);
INSERT INTO `butler_category` VALUES (1048, '证件', 'upload/icon/web/035.png', '2018-09-19 00:08:01', '2020-10-19 22:54:05', 8);
COMMIT;

-- ----------------------------
-- Table structure for butler_icon
-- ----------------------------
DROP TABLE IF EXISTS `butler_icon`;
CREATE TABLE `butler_icon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type_id` bigint(20) unsigned DEFAULT '0' COMMENT '分类ID',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '图标URL',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管家-图标';

-- ----------------------------
-- Records of butler_icon
-- ----------------------------
BEGIN;
INSERT INTO `butler_icon` VALUES (1, 1, '//cdn.kecoyo.com/upload/butler_icon/c8/de7389a98521305778402ba8afec13.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (2, 1, '//cdn.kecoyo.com/upload/butler_icon/4c/4245273cdb770764f234164c83812e.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (3, 1, '//cdn.kecoyo.com/upload/butler_icon/88/1c1f12f6ce4d83a02b36ff95ddf16d.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (4, 1, '//cdn.kecoyo.com/upload/butler_icon/6b/30bca929b30cdf0eab4005700ae13c.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (5, 1, '//cdn.kecoyo.com/upload/butler_icon/dd/39fd0d3f8238ce5171e8237cbc4f13.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (6, 1, '//cdn.kecoyo.com/upload/butler_icon/6c/3b86dd5b4207ea720b5a340d5e2670.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (7, 1, '//cdn.kecoyo.com/upload/butler_icon/91/382e8dfc3eb4ef9b95e50d94551b36.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (8, 1, '//cdn.kecoyo.com/upload/butler_icon/68/873f8a04e85e503f2c57ddaf3c058b.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (9, 1, '//cdn.kecoyo.com/upload/butler_icon/ef/b97cdc2185e57202e349e43cb5e943.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (10, 1, '//cdn.kecoyo.com/upload/butler_icon/7d/56a48c878cec0f3c03809093566b85.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (11, 1, '//cdn.kecoyo.com/upload/butler_icon/ee/8985d8c6c5a3f9f022a56abd7cd4b9.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (12, 1, '//cdn.kecoyo.com/upload/butler_icon/09/cb8b2c41a64fd8fc0de04eada36073.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (13, 1, '//cdn.kecoyo.com/upload/butler_icon/b1/1f6b870628f91af7fcc303883591c3.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (14, 1, '//cdn.kecoyo.com/upload/butler_icon/31/bd2528eb0bfa205d95d9606a187162.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (15, 1, '//cdn.kecoyo.com/upload/butler_icon/4e/12ffc915e23925a158bd27a8b037b1.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (16, 1, '//cdn.kecoyo.com/upload/butler_icon/09/ce51525a7a1f2c04475d0f23469cac.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (17, 1, '//cdn.kecoyo.com/upload/butler_icon/97/f5a0712bdb99c7cd81d839a2f43478.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (18, 1, '//cdn.kecoyo.com/upload/butler_icon/b3/f9a09f4a6adbc5af9104c5512d5567.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (19, 1, '//cdn.kecoyo.com/upload/butler_icon/85/d05e462bf6202324178e0ac94b7557.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (20, 1, '//cdn.kecoyo.com/upload/butler_icon/e1/e6eb6cdf52b5871daeaea65ebe5fde.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (21, 1, '//cdn.kecoyo.com/upload/butler_icon/27/7de458b949e96335ca7e74213cfecb.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (22, 1, '//cdn.kecoyo.com/upload/butler_icon/fc/9e46e969e0bce3c875948ce410fb6d.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (23, 1, '//cdn.kecoyo.com/upload/butler_icon/b2/e422489583477f680633c082faf090.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (24, 1, '//cdn.kecoyo.com/upload/butler_icon/c0/d1c772ab87f9e6a32cfca346802cf9.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (25, 1, '//cdn.kecoyo.com/upload/butler_icon/de/35f8a0606b4ee19a4a8e10044de892.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (26, 1, '//cdn.kecoyo.com/upload/butler_icon/ab/859fae6acd6694433b8546361576d7.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (27, 1, '//cdn.kecoyo.com/upload/butler_icon/59/5a93927418236b889f81a9ad6f8cb8.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (28, 1, '//cdn.kecoyo.com/upload/butler_icon/fb/f0f82c2304556855c8259d2c765c71.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (29, 1, '//cdn.kecoyo.com/upload/butler_icon/c4/7648c9164f29713e2ef9be17b698d4.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (30, 1, '//cdn.kecoyo.com/upload/butler_icon/8a/42577422af82b3ea4861a363c3f69b.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (31, 1, '//cdn.kecoyo.com/upload/butler_icon/60/71b52e2deb5991f0003ab6bf2b3dd8.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (32, 1, '//cdn.kecoyo.com/upload/butler_icon/0b/dc063ed4334bea9367c8450e86f7c4.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (33, 1, '//cdn.kecoyo.com/upload/butler_icon/23/6ae5940abf9da23dd82ab01911e343.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (34, 1, '//cdn.kecoyo.com/upload/butler_icon/61/058cb431ff300f6c2792409f77084f.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (35, 1, '//cdn.kecoyo.com/upload/butler_icon/44/c4dcb58be01a7af0d496b1284e4425.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (36, 1, '//cdn.kecoyo.com/upload/butler_icon/3c/84f16345062bd35129efd330aa37a2.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (37, 1, '//cdn.kecoyo.com/upload/butler_icon/22/145ac3a3a097900d4b6566c641d469.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (38, 1, '//cdn.kecoyo.com/upload/butler_icon/6b/6d5dbde2b5e947142f739dc9bf78c5.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (39, 1, '//cdn.kecoyo.com/upload/butler_icon/0b/d1bab3659da27b5f09371e0e4d6889.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (40, 1, '//cdn.kecoyo.com/upload/butler_icon/5a/7de35e94738b0c5ecb812437c801e3.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (41, 1, '//cdn.kecoyo.com/upload/butler_icon/e6/0d850e9b40793bcb6e5c5856708a72.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (42, 1, '//cdn.kecoyo.com/upload/butler_icon/74/032196abbf4a9fcc7067a3ee0aa16a.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (43, 1, '//cdn.kecoyo.com/upload/butler_icon/5b/1f408393e5a99abb90dce225f1e627.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (44, 1, '//cdn.kecoyo.com/upload/butler_icon/29/c3b9795655e9e5b8145dab9541e449.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (45, 1, '//cdn.kecoyo.com/upload/butler_icon/97/003b62fcbbafe976cc0d7f9ca7c0f6.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (46, 1, '//cdn.kecoyo.com/upload/butler_icon/83/c6ca1d58d5c359f0082d506bc336a8.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (47, 1, '//cdn.kecoyo.com/upload/butler_icon/0b/ff2e5b5e946bf2ce56962b9d3c936e.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (48, 1, '//cdn.kecoyo.com/upload/butler_icon/c8/324ee57fb184e70e4ff03b8eba49fa.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (49, 1, '//cdn.kecoyo.com/upload/butler_icon/2e/21acea28873400865d476b581b3318.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (50, 1, '//cdn.kecoyo.com/upload/butler_icon/84/808deaa661a96eff75c9cc48bc7845.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (51, 1, '//cdn.kecoyo.com/upload/butler_icon/b3/2f4029aa28f452c1136151bbcc8b84.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (52, 1, '//cdn.kecoyo.com/upload/butler_icon/ad/daf1db887d7cdbe9f45c803c08b900.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (53, 1, '//cdn.kecoyo.com/upload/butler_icon/f8/b7976a3f36e4589ea38881acf35c46.png', 0, '2021-01-24 00:00:06', 1, 0);
INSERT INTO `butler_icon` VALUES (54, 2, '//cdn.kecoyo.com/upload/butler_icon/c2/e34c59576a98176589a90067435eb1.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (55, 2, '//cdn.kecoyo.com/upload/butler_icon/56/fe54122c02d2b5a70d36fa3dc807b7.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (56, 2, '//cdn.kecoyo.com/upload/butler_icon/45/1892eb41b6fc9bda8e51bd33c1c616.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (57, 2, '//cdn.kecoyo.com/upload/butler_icon/5d/e1c17e8ead4fa92e6ea5f37632e91f.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (58, 2, '//cdn.kecoyo.com/upload/butler_icon/4a/38c53168bdcef24d8dd18ec5cc224d.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (59, 2, '//cdn.kecoyo.com/upload/butler_icon/1c/c87e62b5b86acb1c2d30e2a3f5617a.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (60, 2, '//cdn.kecoyo.com/upload/butler_icon/18/50df786cebca2442b437047f17ab80.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (61, 2, '//cdn.kecoyo.com/upload/butler_icon/4a/40e617e99bcf7fea5f8fd808066cf9.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (62, 2, '//cdn.kecoyo.com/upload/butler_icon/fa/9f1aef73cdb35c590034778fe571f1.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (63, 2, '//cdn.kecoyo.com/upload/butler_icon/ee/a07a92c53cfc0eda62f50c35606070.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (64, 2, '//cdn.kecoyo.com/upload/butler_icon/25/80c15aac379bc3267f6c432a4704fe.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (65, 2, '//cdn.kecoyo.com/upload/butler_icon/25/f4160108aa2545546a2fd68ee63983.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (66, 2, '//cdn.kecoyo.com/upload/butler_icon/04/e5ce20dd4b37b91f8075236808d79f.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (67, 2, '//cdn.kecoyo.com/upload/butler_icon/ec/9ca0442ce47bf930be6b13d732fd81.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (68, 2, '//cdn.kecoyo.com/upload/butler_icon/3d/b4cc936b61e3e6f9f8dfbbf85513e3.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (69, 2, '//cdn.kecoyo.com/upload/butler_icon/1f/9d216a7caedad02df4095a51c61a53.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (70, 2, '//cdn.kecoyo.com/upload/butler_icon/2c/c65840fa80f9d54d8c9fe5ca56d60b.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (71, 2, '//cdn.kecoyo.com/upload/butler_icon/8a/1b91a709edd9f5b0c788dd1c396ed6.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (72, 2, '//cdn.kecoyo.com/upload/butler_icon/a0/f2dd903d71e01f4685c25825b9c81e.png', 0, '2021-01-24 00:00:59', 1, 0);
INSERT INTO `butler_icon` VALUES (73, 3, '//cdn.kecoyo.com/upload/butler_icon/f7/a3ef537408fd52744b170eb4ed2f67.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (74, 3, '//cdn.kecoyo.com/upload/butler_icon/96/1925db3910ffba609e8e200910a004.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (75, 3, '//cdn.kecoyo.com/upload/butler_icon/21/c6728668a5d75d2cf7d95e970780d0.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (76, 3, '//cdn.kecoyo.com/upload/butler_icon/50/c370f6b0307905688f93b6a8a294c8.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (77, 3, '//cdn.kecoyo.com/upload/butler_icon/a2/5061163f6ad277f7172a27c5da2686.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (78, 3, '//cdn.kecoyo.com/upload/butler_icon/3f/1901aa0eea566af84b13606985a937.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (79, 3, '//cdn.kecoyo.com/upload/butler_icon/be/7c1da0d0846cdcf6dc3453be19307d.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (80, 3, '//cdn.kecoyo.com/upload/butler_icon/c8/d850c8bfe62f2cba69a29168fbf543.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (81, 3, '//cdn.kecoyo.com/upload/butler_icon/a7/52ce5cb3e258119dadcf8bafda2f65.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (82, 3, '//cdn.kecoyo.com/upload/butler_icon/81/5da96c99a41154e092ba6d4690bc7a.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (83, 3, '//cdn.kecoyo.com/upload/butler_icon/22/608ae2daedb1f716a03a7e7593c193.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (84, 3, '//cdn.kecoyo.com/upload/butler_icon/a8/4a69671989efe87c80f7a0b5229954.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (85, 3, '//cdn.kecoyo.com/upload/butler_icon/4f/5f542d71e40f774434b3c5da3aa897.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (86, 3, '//cdn.kecoyo.com/upload/butler_icon/3a/2c4782b6f7b0b0fae60469df50d668.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (87, 3, '//cdn.kecoyo.com/upload/butler_icon/66/e33982cc310b11443d1a22b8911edd.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (88, 3, '//cdn.kecoyo.com/upload/butler_icon/8f/be71562fbf78901a05cf1a76dd96b2.png', 0, '2021-01-24 00:01:24', 1, 0);
INSERT INTO `butler_icon` VALUES (89, 3, '//cdn.kecoyo.com/upload/butler_icon/86/334ed47fe195dd1235e8b624154fd7.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (90, 3, '//cdn.kecoyo.com/upload/butler_icon/74/46521d0385df718558e2cd04259a4a.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (91, 3, '//cdn.kecoyo.com/upload/butler_icon/e7/9e83c9654cf64dba8b2715ed4fc797.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (92, 3, '//cdn.kecoyo.com/upload/butler_icon/95/536b44cf5f9d52cd8b0a78944d009a.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (93, 3, '//cdn.kecoyo.com/upload/butler_icon/6c/eadc54a9ee41ca3c38899b67cad8c0.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (94, 3, '//cdn.kecoyo.com/upload/butler_icon/24/e7e22096302a6a94459a53e18f7880.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (95, 3, '//cdn.kecoyo.com/upload/butler_icon/c9/ff55418e7aa3c6dbf9282b5caa0d98.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (96, 3, '//cdn.kecoyo.com/upload/butler_icon/c4/1dcdad15cf7c86542bb07c01b26f70.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (97, 3, '//cdn.kecoyo.com/upload/butler_icon/10/8565745829e56e46a72af9d4839c01.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (98, 3, '//cdn.kecoyo.com/upload/butler_icon/f7/0e03c61c99ec240dd66eb9b43e868b.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (99, 3, '//cdn.kecoyo.com/upload/butler_icon/5c/092b6edc9f52fca91f3ba451f4a569.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (100, 3, '//cdn.kecoyo.com/upload/butler_icon/49/59d7df7e6d4460284e2a56499df3d0.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (101, 3, '//cdn.kecoyo.com/upload/butler_icon/24/e9b420d9dfee2eeeb3c19541c86e34.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (102, 3, '//cdn.kecoyo.com/upload/butler_icon/88/fbe3aa10e17bb03efaf5a990553f41.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (103, 3, '//cdn.kecoyo.com/upload/butler_icon/e2/1c1c10128f37bf091add52e64e7e17.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (104, 3, '//cdn.kecoyo.com/upload/butler_icon/c2/feded43d1624bce810d1ec4739b9ce.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (105, 3, '//cdn.kecoyo.com/upload/butler_icon/95/ca99c9fc605737798c39f4e9bca1f7.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (106, 3, '//cdn.kecoyo.com/upload/butler_icon/bf/21ccd7038c452c759a77e1af4f10e3.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (107, 3, '//cdn.kecoyo.com/upload/butler_icon/e8/8cec4a6898c52b482e8dcede714807.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (108, 3, '//cdn.kecoyo.com/upload/butler_icon/59/d24670c12d41d18372c2bcdcbb1fbf.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (109, 3, '//cdn.kecoyo.com/upload/butler_icon/60/73c09bbc4f2b3c0bbef121c216bb96.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (110, 3, '//cdn.kecoyo.com/upload/butler_icon/cb/8db2d278e178f70f50a77a8a1d8a9f.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (111, 3, '//cdn.kecoyo.com/upload/butler_icon/2d/57c67baaa1bc617bc9cdceca5b42f5.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (112, 3, '//cdn.kecoyo.com/upload/butler_icon/3a/94e67878a903dbf0959a108694a998.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (113, 3, '//cdn.kecoyo.com/upload/butler_icon/41/535ff4f49abb65f79d6cdf283d9d27.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (114, 3, '//cdn.kecoyo.com/upload/butler_icon/4a/4d116b55b574cf2b5a034c7e70bf9f.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (115, 3, '//cdn.kecoyo.com/upload/butler_icon/50/1add5145dc5bb94fe9544efb0722b1.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (116, 3, '//cdn.kecoyo.com/upload/butler_icon/cc/6abeca226955490d3fc472b0d47f5f.png', 0, '2021-01-24 00:01:25', 1, 0);
INSERT INTO `butler_icon` VALUES (117, 4, '//cdn.kecoyo.com/upload/butler_icon/55/2f4c5b24624225c0983a9a9cf45502.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (118, 4, '//cdn.kecoyo.com/upload/butler_icon/86/1943822c88d2d42ee6dcee325f57e5.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (119, 4, '//cdn.kecoyo.com/upload/butler_icon/8f/b7357d1b642508672e438ed1affc3c.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (120, 4, '//cdn.kecoyo.com/upload/butler_icon/76/fef646350cf89d856732365c6bf7b1.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (121, 4, '//cdn.kecoyo.com/upload/butler_icon/34/4609228a56fa4f11d06225ef0fd3d3.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (122, 4, '//cdn.kecoyo.com/upload/butler_icon/6d/424a492bc3fb421b2f1dc5b8157d01.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (123, 4, '//cdn.kecoyo.com/upload/butler_icon/8c/2cf332f4e63dd893c64b448a5326ce.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (124, 4, '//cdn.kecoyo.com/upload/butler_icon/39/85cbcf1d0fb40a808639ebcdc81bcd.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (125, 4, '//cdn.kecoyo.com/upload/butler_icon/24/c74ba5f2a2e82ecdfab0f3da8a0893.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (126, 4, '//cdn.kecoyo.com/upload/butler_icon/55/f333f68b75cf025f4bff3f04a737ea.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (127, 4, '//cdn.kecoyo.com/upload/butler_icon/17/3785ec3e5443315c4afabf5f1e0514.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (128, 4, '//cdn.kecoyo.com/upload/butler_icon/63/89ea03a8e4322129d6846452ec1cdb.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (129, 4, '//cdn.kecoyo.com/upload/butler_icon/8c/70416f4073a37168df116756210e29.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (130, 4, '//cdn.kecoyo.com/upload/butler_icon/f6/3953cd551417e62771e006957cace0.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (131, 4, '//cdn.kecoyo.com/upload/butler_icon/ef/923e28cc083cba3333160a6fc7b333.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (132, 4, '//cdn.kecoyo.com/upload/butler_icon/26/bb03784c7c64b9d0ea91ed524618b2.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (133, 4, '//cdn.kecoyo.com/upload/butler_icon/cf/f362511d3c8adf4dd55d3293f05bca.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (134, 4, '//cdn.kecoyo.com/upload/butler_icon/55/1a67e4bcdb0a0da3701df601801340.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (135, 4, '//cdn.kecoyo.com/upload/butler_icon/de/1e796a57400dc9acfb4b231b10a1c1.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (136, 4, '//cdn.kecoyo.com/upload/butler_icon/0e/e1b19897a341dc8de863c8dadc03e8.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (137, 4, '//cdn.kecoyo.com/upload/butler_icon/04/3ba047c5bd530d7e90cc1e609f7be7.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (138, 4, '//cdn.kecoyo.com/upload/butler_icon/3e/a414a0efe0bf77c20faba4b0516d26.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (139, 4, '//cdn.kecoyo.com/upload/butler_icon/a3/f1671c4aa72a555f0daf590ae46785.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (140, 4, '//cdn.kecoyo.com/upload/butler_icon/06/21f44b56640ace6e1de4ed1f57e44d.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (141, 4, '//cdn.kecoyo.com/upload/butler_icon/00/5490ff38414610effd1f0123074cc4.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (142, 4, '//cdn.kecoyo.com/upload/butler_icon/0b/033ecbc7d739848871fc950ed867de.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (143, 4, '//cdn.kecoyo.com/upload/butler_icon/cc/42ff16c7e46a9e1f1b9495d4fdd2c6.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (144, 4, '//cdn.kecoyo.com/upload/butler_icon/0e/4b547d17910ed93176bd8200b4615f.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (145, 4, '//cdn.kecoyo.com/upload/butler_icon/bb/6d3771684f93e76a34cc936e4de431.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (146, 4, '//cdn.kecoyo.com/upload/butler_icon/98/689b0e6b8ef1072f88636829cafa32.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (147, 4, '//cdn.kecoyo.com/upload/butler_icon/c9/b80ed7a72f4781cdf8cb8c28315ee6.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (148, 4, '//cdn.kecoyo.com/upload/butler_icon/7c/55bbb9c1dd892e5bbebe46b222bf43.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (149, 4, '//cdn.kecoyo.com/upload/butler_icon/6c/46d4dc666cf3f213bf9a72bf9bb764.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (150, 4, '//cdn.kecoyo.com/upload/butler_icon/cf/62d98d1051a56a6380fc43d93c450a.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (151, 4, '//cdn.kecoyo.com/upload/butler_icon/5d/96999cf4174993f4c006f0b672a400.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (152, 4, '//cdn.kecoyo.com/upload/butler_icon/23/0e6b3c801cfd9ee29798b7b7828a5b.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (153, 4, '//cdn.kecoyo.com/upload/butler_icon/ee/3f647b3fe023a6f3b4b108f8aa63dd.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (154, 4, '//cdn.kecoyo.com/upload/butler_icon/64/465955bf87074ad308110703a34ce3.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (155, 4, '//cdn.kecoyo.com/upload/butler_icon/13/e7c8301823c62577c6db0e318cbea7.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (156, 4, '//cdn.kecoyo.com/upload/butler_icon/ad/1f58b53dc702c388276fe1ad7c1e17.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (157, 4, '//cdn.kecoyo.com/upload/butler_icon/b2/9ff4eeeeecb5c3253c9c1b2bd28b1f.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (158, 4, '//cdn.kecoyo.com/upload/butler_icon/ac/a0721ba12d704b714b4d2336c6f9a4.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (159, 4, '//cdn.kecoyo.com/upload/butler_icon/a1/346b51abfd676e7f780de00a103d63.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (160, 4, '//cdn.kecoyo.com/upload/butler_icon/0a/30912e119fdfb05c922fb98008eec8.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (161, 4, '//cdn.kecoyo.com/upload/butler_icon/61/b0f9007828b70117442cfc8a5ffba3.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (162, 4, '//cdn.kecoyo.com/upload/butler_icon/0d/c4fdadd9add4051f0506c36c97ea3a.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (163, 4, '//cdn.kecoyo.com/upload/butler_icon/20/738bac8e6ae8c07fa635924f399809.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (164, 4, '//cdn.kecoyo.com/upload/butler_icon/0b/0456dfc9e77057eb959ec200d6dc5b.png', 0, '2021-01-24 00:02:27', 1, 0);
INSERT INTO `butler_icon` VALUES (165, 4, '//cdn.kecoyo.com/upload/butler_icon/77/b6a10d089768a8b4f968653b99b3fc.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (166, 4, '//cdn.kecoyo.com/upload/butler_icon/e7/62bf854d70c7bd835c06adb431decb.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (167, 4, '//cdn.kecoyo.com/upload/butler_icon/f2/8fe47502687c7c2579e52638360617.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (168, 4, '//cdn.kecoyo.com/upload/butler_icon/49/2b456f3cad38201bd89a9557d30fc0.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (169, 4, '//cdn.kecoyo.com/upload/butler_icon/1e/8022f1b49664d2d9aa029ab1c491cb.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (170, 4, '//cdn.kecoyo.com/upload/butler_icon/85/a89b80d5689600c6e64f8ddd430489.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (171, 4, '//cdn.kecoyo.com/upload/butler_icon/36/f681239acfabaf6adab842cdbdc1a4.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (172, 4, '//cdn.kecoyo.com/upload/butler_icon/93/d9d1a108effa2b57e25112c141e084.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (173, 4, '//cdn.kecoyo.com/upload/butler_icon/c2/0a54e223300ce4c8b5d58316c6609c.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (174, 4, '//cdn.kecoyo.com/upload/butler_icon/5f/05523a87d890e2edb4e5b22a79a426.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (175, 4, '//cdn.kecoyo.com/upload/butler_icon/d7/8373e06229da12142bbcbeeeceae65.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (176, 4, '//cdn.kecoyo.com/upload/butler_icon/3c/c9d8a1e8a64827e2cb3b50c8058b5e.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (177, 4, '//cdn.kecoyo.com/upload/butler_icon/66/620eb26c50dc32a2577d328d8ee330.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (178, 4, '//cdn.kecoyo.com/upload/butler_icon/fa/553a8e0c0fd4dfb330bea2c1a9dc77.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (179, 4, '//cdn.kecoyo.com/upload/butler_icon/ef/10db9e57734cc086fd00467cf2cad1.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (180, 4, '//cdn.kecoyo.com/upload/butler_icon/65/8caa5b96f9a4c54817f46a5a56d2b9.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (181, 4, '//cdn.kecoyo.com/upload/butler_icon/4c/ce9696f034e7af72f405bc0d60d2d0.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (182, 4, '//cdn.kecoyo.com/upload/butler_icon/26/c7de338ca88365f2ddcf9a740f817a.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (183, 4, '//cdn.kecoyo.com/upload/butler_icon/d9/93909fe30c7e82ff25d80eaa2bfb7e.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (184, 4, '//cdn.kecoyo.com/upload/butler_icon/37/a975eb86effcf00c7b16da01ae64a0.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (185, 4, '//cdn.kecoyo.com/upload/butler_icon/09/3861ffc9de87fca0faa64cef457ef2.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (186, 4, '//cdn.kecoyo.com/upload/butler_icon/bc/4a0e4d535434ea8ea1ff85c286512a.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (187, 4, '//cdn.kecoyo.com/upload/butler_icon/60/c8a528bf216ae5ff4970bcc3b5c4e4.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (188, 4, '//cdn.kecoyo.com/upload/butler_icon/92/cb8323c14c78da0fee9b17947866ff.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (189, 4, '//cdn.kecoyo.com/upload/butler_icon/c2/5addb5f4200a4127eff07648416119.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (190, 4, '//cdn.kecoyo.com/upload/butler_icon/33/2043bb0195e47b95bf626d5d3c9191.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (191, 4, '//cdn.kecoyo.com/upload/butler_icon/06/1955a5900544da93e853d012bd0838.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (192, 4, '//cdn.kecoyo.com/upload/butler_icon/86/50500ac30c127d29fc7a9e0441b69f.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (193, 4, '//cdn.kecoyo.com/upload/butler_icon/d0/6626376fff9448e4f80e193f6bd594.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (194, 4, '//cdn.kecoyo.com/upload/butler_icon/d5/211f5d1cf814bcbabb42f8f5f2baeb.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (195, 4, '//cdn.kecoyo.com/upload/butler_icon/0b/9fbe4a1e366100ee0213411d8bdcdf.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (196, 4, '//cdn.kecoyo.com/upload/butler_icon/11/276951d077fa4df556c1c3f953ed6c.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (197, 4, '//cdn.kecoyo.com/upload/butler_icon/ff/d4fd223e7d70905d2309b9927d1152.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (198, 4, '//cdn.kecoyo.com/upload/butler_icon/2b/c9bad11c82f716a94279d4db31830b.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (199, 4, '//cdn.kecoyo.com/upload/butler_icon/27/0aa85b616869a5f685e1acbdacbed5.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (200, 4, '//cdn.kecoyo.com/upload/butler_icon/58/35c234ac1185a51625fc7f17e9aa7e.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (201, 4, '//cdn.kecoyo.com/upload/butler_icon/13/846b855069a7261a0fbad6cb841d0c.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (202, 4, '//cdn.kecoyo.com/upload/butler_icon/b4/8459304947170523d4f2a8638058be.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (203, 4, '//cdn.kecoyo.com/upload/butler_icon/f7/1f76043ffbeac2879241a27bf5db4a.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (204, 4, '//cdn.kecoyo.com/upload/butler_icon/ab/b298f6212e736195187df39edda71a.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (205, 4, '//cdn.kecoyo.com/upload/butler_icon/05/f836c8055d80f59405d5b8678f65f8.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (206, 4, '//cdn.kecoyo.com/upload/butler_icon/ab/2ad01eb13178aa154cb944c73b93e3.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (207, 4, '//cdn.kecoyo.com/upload/butler_icon/82/70b29b514dc7f492a7549aad9ed419.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (208, 4, '//cdn.kecoyo.com/upload/butler_icon/bf/f454bb8a4975a169f56a3d07ec51cf.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (209, 4, '//cdn.kecoyo.com/upload/butler_icon/59/1c7ccf607073234f30fbd0d515cc44.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (210, 4, '//cdn.kecoyo.com/upload/butler_icon/68/1390a1e1566521303dcc0743de0d1d.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (211, 4, '//cdn.kecoyo.com/upload/butler_icon/5d/7950a13e3c1070caa4bc1ee62a1cf5.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (212, 4, '//cdn.kecoyo.com/upload/butler_icon/1d/bf05465103efd2bbd4dc519f6342b1.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (213, 4, '//cdn.kecoyo.com/upload/butler_icon/c0/19a4828e03cb3fa934b28c5c206b1c.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (214, 4, '//cdn.kecoyo.com/upload/butler_icon/21/a170855a31720e87fca5ec258355e6.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (215, 4, '//cdn.kecoyo.com/upload/butler_icon/52/d62b6db9703b942c4e8ff4a64fa7db.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (216, 4, '//cdn.kecoyo.com/upload/butler_icon/11/f65d68dc9bce5d8893541eb99d3f11.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (217, 4, '//cdn.kecoyo.com/upload/butler_icon/5c/307111aad8204f8e6794b620a68540.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (218, 4, '//cdn.kecoyo.com/upload/butler_icon/a3/519a70d1e1437cc7122a8e1a46beab.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (219, 4, '//cdn.kecoyo.com/upload/butler_icon/47/a4f634651608e7cb367481f3740880.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (220, 4, '//cdn.kecoyo.com/upload/butler_icon/14/8e886fd495b85caf247c389f6254a1.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (221, 4, '//cdn.kecoyo.com/upload/butler_icon/2d/05d7a577c4676aa49cece52efe3c93.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (222, 4, '//cdn.kecoyo.com/upload/butler_icon/be/13bf32e3c139376318409cc1366711.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (223, 4, '//cdn.kecoyo.com/upload/butler_icon/5a/2075e0eaabe3119bbb123a75be206d.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (224, 4, '//cdn.kecoyo.com/upload/butler_icon/9c/3953c2ccec60e408ecafa3412e2b59.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (225, 4, '//cdn.kecoyo.com/upload/butler_icon/48/f65f79ede71368fc8d416a0846949b.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (226, 4, '//cdn.kecoyo.com/upload/butler_icon/f4/a00d593760b6e967b8cd72c38b7b44.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (227, 4, '//cdn.kecoyo.com/upload/butler_icon/f7/a29455554c43197c92389b6ba24366.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (228, 4, '//cdn.kecoyo.com/upload/butler_icon/82/2aa3982fc9ee81946cffb1e2b92596.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (229, 4, '//cdn.kecoyo.com/upload/butler_icon/c5/0b942a80c3561245ad85241921f188.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (230, 4, '//cdn.kecoyo.com/upload/butler_icon/d2/c62698849cd14b6014909b9d1bb790.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (231, 4, '//cdn.kecoyo.com/upload/butler_icon/3c/25ed54a91cdec720955acb9d839373.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (232, 4, '//cdn.kecoyo.com/upload/butler_icon/eb/845bcc8a1134f89d8e4bc6b7236862.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (233, 4, '//cdn.kecoyo.com/upload/butler_icon/65/cc8e88a8a03b15d30f6b734a5452fb.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (234, 4, '//cdn.kecoyo.com/upload/butler_icon/97/13643b38bdf0241a8fca2bbb4cab2f.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (235, 4, '//cdn.kecoyo.com/upload/butler_icon/cb/6679c720ee0df6cb1f38baa37ef512.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (236, 4, '//cdn.kecoyo.com/upload/butler_icon/2f/1fb149e400aabb1e19966f71d4ddf2.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (237, 4, '//cdn.kecoyo.com/upload/butler_icon/88/d00cddbf2400377748c69e5819d45f.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (238, 4, '//cdn.kecoyo.com/upload/butler_icon/8e/a89ea66e8a977b6b7cfe794c39a974.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (239, 4, '//cdn.kecoyo.com/upload/butler_icon/49/97afccf6ad2bc2e9a388171f1b0f85.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (240, 4, '//cdn.kecoyo.com/upload/butler_icon/2a/d32e4f9a6f578b233ffd61affdfbe6.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (241, 4, '//cdn.kecoyo.com/upload/butler_icon/9f/9de2929951387707923d16dd1b8b92.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (242, 4, '//cdn.kecoyo.com/upload/butler_icon/99/5f8cfa6f5fe7ae9249ab3732a8f582.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (243, 4, '//cdn.kecoyo.com/upload/butler_icon/bf/f62468924d2b4eae12351635a285c1.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (244, 4, '//cdn.kecoyo.com/upload/butler_icon/e0/080d8ed97e5ccaccd07ca35d3699c1.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (245, 4, '//cdn.kecoyo.com/upload/butler_icon/0e/3c6fa978af6c939c6e7bdc5dada06e.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (246, 4, '//cdn.kecoyo.com/upload/butler_icon/8a/5775fbd6b073bac57f7ddd6350eb6d.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (247, 4, '//cdn.kecoyo.com/upload/butler_icon/02/0653ed4174b369f5972873e10bdc74.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (248, 4, '//cdn.kecoyo.com/upload/butler_icon/ad/40403fded110aca076a37bf2b51e56.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (249, 4, '//cdn.kecoyo.com/upload/butler_icon/3a/db9fe9929e82235aec638aa04975f1.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (250, 4, '//cdn.kecoyo.com/upload/butler_icon/b8/5d0ef2157746f08aa586a5965ba825.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (251, 4, '//cdn.kecoyo.com/upload/butler_icon/00/c4cb243f0dc7135a84567d54dce668.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (252, 4, '//cdn.kecoyo.com/upload/butler_icon/38/de9e57d9c7930eb10107305b4c63a3.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (253, 4, '//cdn.kecoyo.com/upload/butler_icon/6e/8fdcac7a3f613e58b557d26bec161e.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (254, 4, '//cdn.kecoyo.com/upload/butler_icon/01/74fd89164b13d1af2b5ab8fb749d39.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (255, 4, '//cdn.kecoyo.com/upload/butler_icon/1d/936bb0bda2e1d962e4e09abbfe0bd1.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (256, 4, '//cdn.kecoyo.com/upload/butler_icon/bb/ebaa5e1ec4f49578731141313c4464.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (257, 4, '//cdn.kecoyo.com/upload/butler_icon/28/b7ebe0082e42114e5d0906bcccca19.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (258, 4, '//cdn.kecoyo.com/upload/butler_icon/c8/6d7f7e03ae90d03d80cdc0d0f13dbf.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (259, 4, '//cdn.kecoyo.com/upload/butler_icon/e9/4dc3bbeafb116d22f461135017895d.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (260, 4, '//cdn.kecoyo.com/upload/butler_icon/1e/855c36a0a64dab03ae9d1cdf1405b3.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (261, 4, '//cdn.kecoyo.com/upload/butler_icon/22/661e658f3af8ee5e3fb6683067fa7d.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (262, 4, '//cdn.kecoyo.com/upload/butler_icon/67/d952806fa5b03a608a879eb4f540fb.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (263, 4, '//cdn.kecoyo.com/upload/butler_icon/7f/4e15e23a942bf46cb2a0538aac695f.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (264, 4, '//cdn.kecoyo.com/upload/butler_icon/d1/d9076d20e827f0a14b77220ad6df05.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (265, 4, '//cdn.kecoyo.com/upload/butler_icon/d1/d24ba8c90a1616bdab763834618787.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (266, 4, '//cdn.kecoyo.com/upload/butler_icon/0a/f0463d93dec16b985f3ff6139a3615.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (267, 4, '//cdn.kecoyo.com/upload/butler_icon/ed/0f52c4d1536f2697dc97a3f74b4e02.png', 0, '2021-01-24 00:02:28', 1, 0);
INSERT INTO `butler_icon` VALUES (268, 4, '//cdn.kecoyo.com/upload/butler_icon/a2/babcbce212974bc1b3df83178b797d.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (269, 4, '//cdn.kecoyo.com/upload/butler_icon/cb/7c31c8f609733f180dd7b29e63ac3c.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (270, 4, '//cdn.kecoyo.com/upload/butler_icon/10/ec9a35bd891143e85a25f089f39642.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (271, 4, '//cdn.kecoyo.com/upload/butler_icon/3a/392d64c7d0cf94e9e06a411df9f952.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (272, 4, '//cdn.kecoyo.com/upload/butler_icon/9e/f0115ed5e1f476f9df899fa290000d.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (273, 4, '//cdn.kecoyo.com/upload/butler_icon/32/b20a4944f1cd65d68dfb1f72bc25cd.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (274, 4, '//cdn.kecoyo.com/upload/butler_icon/46/4fcbb14fe79460597500b2b9330fb7.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (275, 4, '//cdn.kecoyo.com/upload/butler_icon/ae/5884ca328c3e5c7eb3df7e4c55525a.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (276, 4, '//cdn.kecoyo.com/upload/butler_icon/72/935a9abafa63eb4aa807fb9f60757b.png', 0, '2021-01-24 00:02:29', 1, 0);
INSERT INTO `butler_icon` VALUES (277, 5, '//cdn.kecoyo.com/upload/butler_icon/7d/4ddce1ecc65282c236b1cca7cb7aff.jpg', 0, '2021-01-24 17:37:49', 1, 1);
INSERT INTO `butler_icon` VALUES (278, 5, '//cdn.kecoyo.com/upload/butler_icon/7d/4ddce1ecc65282c236b1cca7cb7aff.jpg', 0, '2021-01-24 17:42:57', 1, 1);
INSERT INTO `butler_icon` VALUES (279, 5, '//cdn.kecoyo.com/upload/butler_icon/7d/4ddce1ecc65282c236b1cca7cb7aff.jpg', 0, '2021-01-24 23:39:36', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for butler_icon_type
-- ----------------------------
DROP TABLE IF EXISTS `butler_icon_type`;
CREATE TABLE `butler_icon_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分类名称',
  `remark` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分类描述',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_user_status` (`status`) USING BTREE,
  KEY `idx_system_user_username` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='管家-图标类型';

-- ----------------------------
-- Records of butler_icon_type
-- ----------------------------
BEGIN;
INSERT INTO `butler_icon_type` VALUES (1, '应用类', '', 5, '2021-01-17 18:37:00', 1, 0);
INSERT INTO `butler_icon_type` VALUES (2, '银行类', '', 4, '2021-01-17 18:52:46', 1, 0);
INSERT INTO `butler_icon_type` VALUES (3, '业务类', '', 3, '2021-01-17 19:02:09', 1, 0);
INSERT INTO `butler_icon_type` VALUES (4, '网页类', '', 2, '2021-01-17 19:02:51', 1, 0);
INSERT INTO `butler_icon_type` VALUES (5, '其它类', '', 1, '2021-01-17 19:02:58', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '权限名称',
  `desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注说明',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '权限状态(1使用,0禁用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_auth_title` (`title`) USING BTREE,
  KEY `idx_system_auth_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统-权限';

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT '0' COMMENT '角色',
  `node` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_auth_auth` (`auth`) USING BTREE,
  KEY `idx_system_auth_node` (`node`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统-授权';

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分类',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置名',
  `value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置值',
  KEY `idx_system_config_type` (`type`) USING BTREE,
  KEY `idx_system_config_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统-配置';

-- ----------------------------
-- Records of system_config
-- ----------------------------
BEGIN;
INSERT INTO `system_config` VALUES ('base', 'app_name', '海龟管家');
INSERT INTO `system_config` VALUES ('base', 'app_version', 'v1');
INSERT INTO `system_config` VALUES ('base', 'beian', '');
INSERT INTO `system_config` VALUES ('base', 'miitbeian', '京ICP备18042918号-1');
INSERT INTO `system_config` VALUES ('base', 'site_copy', '©版权所有 2018-2021 海龟管家');
INSERT INTO `system_config` VALUES ('base', 'site_icon', 'http://cdn.kecoyo.com/favicon.png');
INSERT INTO `system_config` VALUES ('base', 'site_name', '海龟管家');
INSERT INTO `system_config` VALUES ('base', 'xpath', 'admin');
INSERT INTO `system_config` VALUES ('storage', 'allow_exts', 'doc,gif,icon,jpg,mp3,mp4,p12,pem,png,rar,xls,xlsx');
INSERT INTO `system_config` VALUES ('storage', 'link_type', 'none');
INSERT INTO `system_config` VALUES ('storage', 'local_http_domain', '');
INSERT INTO `system_config` VALUES ('storage', 'local_http_protocol', 'auto');
INSERT INTO `system_config` VALUES ('storage', 'type', 'local');
INSERT INTO `system_config` VALUES ('wechat', 'type', 'thr');
INSERT INTO `system_config` VALUES ('wechat', 'thr_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('wechat', 'thr_appkey', '7d0e4a487c6258b2232294b6ef0adb9e');
INSERT INTO `system_config` VALUES ('storage', 'qiniu_http_protocol', 'auto');
INSERT INTO `system_config` VALUES ('storage', 'alioss_http_protocol', 'http');
INSERT INTO `system_config` VALUES ('storage', 'qiniu_region', '华北');
INSERT INTO `system_config` VALUES ('storage', 'qiniu_bucket', 'zaifumo');
INSERT INTO `system_config` VALUES ('storage', 'qiniu_http_domain', 'cdn.kecoyo.com');
INSERT INTO `system_config` VALUES ('storage', 'qiniu_access_key', 'R6qzlwVu3gfWY05dmxZKtTshgr5RWTjPbymx0-Lk');
INSERT INTO `system_config` VALUES ('storage', 'qiniu_secret_key', 'nxAedGNYipoqrVS4lI_1ofyZbr3N12b8re-_Duha');
COMMIT;

-- ----------------------------
-- Table structure for system_data
-- ----------------------------
DROP TABLE IF EXISTS `system_data`;
CREATE TABLE `system_data` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置名',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_data_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统-数据';

-- ----------------------------
-- Records of system_data
-- ----------------------------
BEGIN;
INSERT INTO `system_data` VALUES (1, 'about', 'a:1:{s:7:\"content\";s:141:\"<p>asdfasf<span><img alt=\"\" src=\"http://localhost/upload/49/232b58c81f6037c4c89b5eed2c8789.png\" style=\"max-width:100%;border:0\" /></span></p>\";}');
INSERT INTO `system_data` VALUES (2, 'agreement', 'a:1:{s:7:\"content\";s:10:\"<p>fff</p>\";}');
INSERT INTO `system_data` VALUES (3, 'slider', 'a:2:{i:0;a:3:{s:3:\"img\";s:61:\"http://localhost/upload/49/232b58c81f6037c4c89b5eed2c8789.png\";s:4:\"rule\";s:4:\"#fff\";s:4:\"name\";s:4:\"#fff\";}i:1;a:3:{s:3:\"img\";s:61:\"http://localhost/upload/49/232b58c81f6037c4c89b5eed2c8789.png\";s:4:\"rule\";s:4:\"#323\";s:4:\"name\";s:3:\"#32\";}}');
COMMIT;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '上级ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '菜单图标',
  `node` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '节点代码',
  `url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '链接节点',
  `params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_menu_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统-菜单';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_menu` VALUES (2, 0, '系统管理', '', '', '#', '', '_self', 100, 1, '2018-09-05 18:04:52');
INSERT INTO `system_menu` VALUES (3, 4, '系统菜单管理', 'layui-icon layui-icon-layouts', '', 'admin/menu/index', '', '_self', 1, 1, '2018-09-05 18:05:26');
INSERT INTO `system_menu` VALUES (4, 2, '系统配置', '', '', '#', '', '_self', 20, 1, '2018-09-05 18:07:17');
INSERT INTO `system_menu` VALUES (5, 12, '系统用户管理', 'layui-icon layui-icon-username', '', 'admin/user/index', '', '_self', 1, 1, '2018-09-06 11:10:42');
INSERT INTO `system_menu` VALUES (7, 12, '访问权限管理', 'layui-icon layui-icon-vercode', '', 'admin/auth/index', '', '_self', 2, 1, '2018-09-06 15:17:14');
INSERT INTO `system_menu` VALUES (11, 4, '系统参数配置', 'layui-icon layui-icon-set', '', 'admin/config/index', '', '_self', 4, 1, '2018-09-06 16:43:47');
INSERT INTO `system_menu` VALUES (12, 2, '权限管理', '', '', '#', '', '_self', 10, 1, '2018-09-06 18:01:31');
INSERT INTO `system_menu` VALUES (27, 4, '系统任务管理', 'layui-icon layui-icon-log', '', 'admin/queue/index', '', '_self', 3, 1, '2018-11-29 11:13:34');
INSERT INTO `system_menu` VALUES (49, 4, '系统日志管理', 'layui-icon layui-icon-form', '', 'admin/oplog/index', '', '_self', 2, 1, '2019-02-18 12:56:56');
INSERT INTO `system_menu` VALUES (67, 0, '控制台', '', '', '#', '', '_self', 300, 1, '2020-07-13 06:51:46');
INSERT INTO `system_menu` VALUES (68, 67, '海龟管家', '', '', '#', '', '_self', 0, 1, '2020-07-13 06:51:54');
INSERT INTO `system_menu` VALUES (70, 68, '账号管理', 'layui-icon layui-icon-template', '', 'data/news_item/index', '', '_self', 60, 1, '2020-07-13 06:52:26');
INSERT INTO `system_menu` VALUES (85, 68, '图标管理', 'layui-icon layui-icon-template-1', 'butler/icon/index', 'butler/icon/index', '', '_self', 40, 1, '2020-09-22 16:00:10');
INSERT INTO `system_menu` VALUES (88, 68, '图标分类管理', 'layui-icon layui-icon-app', 'butler/icon_type/index', 'butler/icon_type/index', '', '_self', 50, 1, '2021-01-17 18:04:15');
COMMIT;

-- ----------------------------
-- Table structure for system_oplog
-- ----------------------------
DROP TABLE IF EXISTS `system_oplog`;
CREATE TABLE `system_oplog` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统-日志';

-- ----------------------------
-- Records of system_oplog
-- ----------------------------
BEGIN;
INSERT INTO `system_oplog` VALUES (1, 'admin/login/index', '172.22.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-16 22:11:45');
INSERT INTO `system_oplog` VALUES (2, 'admin/login/index', '172.24.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-17 11:45:41');
INSERT INTO `system_oplog` VALUES (3, 'admin/api.plugs/debug', '172.24.0.1', '系统运维管理', '由开发模式切换为产品模式', 'admin', '2021-01-17 12:07:52');
INSERT INTO `system_oplog` VALUES (4, 'admin/api.plugs/debug', '172.24.0.1', '系统运维管理', '由产品模式切换为开发模式', 'admin', '2021-01-17 12:07:58');
INSERT INTO `system_oplog` VALUES (5, 'admin/login/index', '172.24.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-17 13:16:31');
INSERT INTO `system_oplog` VALUES (6, 'admin/menu/remove', '172.24.0.1', '系统菜单管理', '删除系统菜单[57,58,59]成功', 'admin', '2021-01-17 13:16:53');
INSERT INTO `system_oplog` VALUES (7, 'admin/menu/remove', '172.24.0.1', '系统菜单管理', '删除系统菜单[60,61,62,63,64,65,66]成功', 'admin', '2021-01-17 13:17:04');
INSERT INTO `system_oplog` VALUES (8, 'admin/menu/remove', '172.24.0.1', '系统菜单管理', '删除系统菜单[56]成功', 'admin', '2021-01-17 13:17:12');
INSERT INTO `system_oplog` VALUES (9, 'admin/menu/remove', '172.24.0.1', '系统菜单管理', '删除系统菜单[73,77,76,75,78,79,80,81,82,83]成功', 'admin', '2021-01-17 13:21:59');
INSERT INTO `system_oplog` VALUES (10, 'admin/menu/state', '172.24.0.1', '系统菜单管理', '禁用系统菜单[67,68,86,85,70,71,87,84]成功', 'admin', '2021-01-17 13:23:26');
INSERT INTO `system_oplog` VALUES (11, 'admin/menu/state', '172.24.0.1', '系统菜单管理', '激活系统菜单[67,68,86,85,70,71,87,84]成功', 'admin', '2021-01-17 13:32:21');
INSERT INTO `system_oplog` VALUES (12, 'admin/user/pass', '172.24.0.1', '系统用户管理', '修改用户[10000]密码成功', 'admin', '2021-01-17 13:47:03');
INSERT INTO `system_oplog` VALUES (13, 'admin/login/index', '172.24.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-17 13:47:18');
INSERT INTO `system_oplog` VALUES (14, 'admin/login/index', '172.24.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-17 17:08:17');
INSERT INTO `system_oplog` VALUES (15, 'admin/menu/edit', '172.24.0.1', '系统菜单管理', '修改系统菜单[68]成功', 'admin', '2021-01-17 17:17:35');
INSERT INTO `system_oplog` VALUES (16, 'admin/menu/edit', '172.24.0.1', '系统菜单管理', '修改系统菜单[70]成功', 'admin', '2021-01-17 17:18:29');
INSERT INTO `system_oplog` VALUES (17, 'admin/menu/edit', '172.24.0.1', '系统菜单管理', '修改系统菜单[85]成功', 'admin', '2021-01-17 17:18:50');
INSERT INTO `system_oplog` VALUES (18, 'admin/menu/remove', '172.24.0.1', '系统菜单管理', '删除系统菜单[86]成功', 'admin', '2021-01-17 17:18:59');
INSERT INTO `system_oplog` VALUES (19, 'admin/menu/remove', '172.24.0.1', '系统菜单管理', '删除系统菜单[71,87,84]成功', 'admin', '2021-01-17 17:19:06');
INSERT INTO `system_oplog` VALUES (20, 'admin/user/add', '172.24.0.1', '系统用户管理', '添加系统用户[10001]成功', 'admin', '2021-01-17 17:23:22');
INSERT INTO `system_oplog` VALUES (21, 'admin/user/edit', '172.24.0.1', '系统用户管理', '修改系统用户[10001]成功', 'admin', '2021-01-17 17:23:40');
INSERT INTO `system_oplog` VALUES (22, 'admin/auth/add', '172.24.0.1', '系统权限管理', '添加系统权限[1]成功', 'admin', '2021-01-17 17:24:08');
INSERT INTO `system_oplog` VALUES (23, 'admin/menu/add', '172.26.0.1', '系统菜单管理', '添加系统菜单[88]成功', 'admin', '2021-01-17 18:04:15');
INSERT INTO `system_oplog` VALUES (24, 'admin/menu/edit', '172.26.0.1', '系统菜单管理', '修改系统菜单[88]成功', 'admin', '2021-01-17 18:05:39');
INSERT INTO `system_oplog` VALUES (25, 'admin/menu/edit', '172.26.0.1', '系统菜单管理', '修改系统菜单[85]成功', 'admin', '2021-01-17 19:29:22');
INSERT INTO `system_oplog` VALUES (26, 'admin/menu/edit', '172.26.0.1', '系统菜单管理', '修改系统菜单[85]成功', 'admin', '2021-01-17 19:29:49');
INSERT INTO `system_oplog` VALUES (27, 'admin/login/index', '172.26.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-17 23:07:09');
INSERT INTO `system_oplog` VALUES (28, 'admin/login/index', '192.168.144.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-22 22:18:43');
INSERT INTO `system_oplog` VALUES (29, 'admin/user/state', '192.168.144.1', '系统用户管理', '禁用系统用户[10001]成功', 'admin', '2021-01-22 22:19:39');
INSERT INTO `system_oplog` VALUES (30, 'admin/auth/remove', '192.168.144.1', '系统权限管理', '删除系统权限[1]及授权配置', 'admin', '2021-01-22 22:21:12');
INSERT INTO `system_oplog` VALUES (31, 'admin/login/index', '192.168.160.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-22 23:27:45');
INSERT INTO `system_oplog` VALUES (32, 'admin/login/index', '192.168.160.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-23 00:06:49');
INSERT INTO `system_oplog` VALUES (33, 'admin/login/index', '192.168.160.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-23 08:09:07');
INSERT INTO `system_oplog` VALUES (34, 'admin/login/index', '192.168.160.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-23 09:26:15');
INSERT INTO `system_oplog` VALUES (35, 'admin/login/index', '172.18.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-23 11:16:37');
INSERT INTO `system_oplog` VALUES (36, 'admin/login/index', '172.18.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-23 12:13:56');
INSERT INTO `system_oplog` VALUES (37, 'admin/login/index', '172.18.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-23 12:17:14');
INSERT INTO `system_oplog` VALUES (38, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 12:45:27');
INSERT INTO `system_oplog` VALUES (39, 'admin/user/edit', '172.18.0.1', '系统用户管理', '修改系统用户[10000]成功', 'admin', '2021-01-23 12:47:09');
INSERT INTO `system_oplog` VALUES (40, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 12:49:38');
INSERT INTO `system_oplog` VALUES (41, 'admin/user/edit', '172.18.0.1', '系统用户管理', '修改系统用户[10000]成功', 'admin', '2021-01-23 12:50:34');
INSERT INTO `system_oplog` VALUES (42, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 12:56:50');
INSERT INTO `system_oplog` VALUES (43, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 13:19:29');
INSERT INTO `system_oplog` VALUES (44, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 13:20:56');
INSERT INTO `system_oplog` VALUES (45, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 13:22:04');
INSERT INTO `system_oplog` VALUES (46, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 13:24:49');
INSERT INTO `system_oplog` VALUES (47, 'admin/api.plugs/clearruntime', '172.18.0.1', '系统运维管理', '清理网站日志及缓存数据', 'admin', '2021-01-23 13:40:44');
INSERT INTO `system_oplog` VALUES (48, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 15:40:36');
INSERT INTO `system_oplog` VALUES (49, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 18:35:16');
INSERT INTO `system_oplog` VALUES (50, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 19:02:23');
INSERT INTO `system_oplog` VALUES (51, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 19:17:50');
INSERT INTO `system_oplog` VALUES (52, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 19:19:52');
INSERT INTO `system_oplog` VALUES (53, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 21:26:13');
INSERT INTO `system_oplog` VALUES (54, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 21:30:16');
INSERT INTO `system_oplog` VALUES (55, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 23:42:58');
INSERT INTO `system_oplog` VALUES (56, 'admin/config/storage', '172.18.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-23 23:56:57');
INSERT INTO `system_oplog` VALUES (57, 'admin/login/index', '223.72.74.2', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-24 17:34:04');
INSERT INTO `system_oplog` VALUES (58, 'admin/config/storage', '223.72.74.2', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-24 17:40:58');
INSERT INTO `system_oplog` VALUES (59, 'admin/login/index', '223.72.74.2', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-24 17:52:16');
INSERT INTO `system_oplog` VALUES (60, 'admin/login/index', '223.72.74.2', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-24 18:56:14');
INSERT INTO `system_oplog` VALUES (61, 'admin/api.plugs/debug', '223.72.74.2', '系统运维管理', '由开发模式切换为产品模式', 'admin', '2021-01-24 22:59:33');
INSERT INTO `system_oplog` VALUES (62, 'admin/config/storage', '223.72.74.2', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-24 22:59:45');
INSERT INTO `system_oplog` VALUES (63, 'admin/config/system', '223.72.74.2', '系统配置管理', '修改系统参数成功', 'admin', '2021-01-24 23:04:46');
INSERT INTO `system_oplog` VALUES (64, 'admin/login/index', '223.72.74.2', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-24 23:05:06');
INSERT INTO `system_oplog` VALUES (65, 'admin/config/system', '223.72.74.2', '系统配置管理', '修改系统参数成功', 'admin', '2021-01-24 23:07:56');
INSERT INTO `system_oplog` VALUES (66, 'admin/config/system', '223.72.74.2', '系统配置管理', '修改系统参数成功', 'admin', '2021-01-24 23:10:24');
INSERT INTO `system_oplog` VALUES (67, 'admin/login/index', '223.72.74.2', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-24 23:10:44');
INSERT INTO `system_oplog` VALUES (68, 'admin/login/index', '172.20.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2021-01-24 23:16:04');
INSERT INTO `system_oplog` VALUES (69, 'admin/api.plugs/clearruntime', '172.20.0.1', '系统运维管理', '清理网站日志及缓存数据', 'admin', '2021-01-24 23:17:22');
INSERT INTO `system_oplog` VALUES (70, 'admin/user/edit', '172.20.0.1', '系统用户管理', '修改系统用户[10000]成功', 'admin', '2021-01-24 23:29:49');
INSERT INTO `system_oplog` VALUES (71, 'admin/config/storage', '172.20.0.1', '系统配置管理', '修改系统存储参数', 'admin', '2021-01-24 23:31:12');
INSERT INTO `system_oplog` VALUES (72, 'admin/api.plugs/clearruntime', '172.20.0.1', '系统运维管理', '清理网站日志及缓存数据', 'admin', '2021-01-24 23:31:20');
INSERT INTO `system_oplog` VALUES (73, 'admin/user/edit', '172.20.0.1', '系统用户管理', '修改系统用户[10000]成功', 'admin', '2021-01-24 23:31:30');
INSERT INTO `system_oplog` VALUES (74, 'admin/user/edit', '172.20.0.1', '系统用户管理', '修改系统用户[10000]成功', 'admin', '2021-01-24 23:38:36');
COMMIT;

-- ----------------------------
-- Table structure for system_queue
-- ----------------------------
DROP TABLE IF EXISTS `system_queue`;
CREATE TABLE `system_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务编号',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `command` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '执行指令',
  `exec_pid` bigint(20) DEFAULT '0' COMMENT '执行进程',
  `exec_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '执行参数',
  `exec_time` bigint(20) DEFAULT '0' COMMENT '执行时间',
  `exec_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '执行描述',
  `enter_time` decimal(20,4) DEFAULT '0.0000' COMMENT '开始时间',
  `outer_time` decimal(20,4) DEFAULT '0.0000' COMMENT '结束时间',
  `loops_time` bigint(20) DEFAULT '0' COMMENT '循环时间',
  `attempts` bigint(20) DEFAULT '0' COMMENT '执行次数',
  `rscript` tinyint(1) DEFAULT '1' COMMENT '任务类型(0单例,1多例)',
  `status` tinyint(1) DEFAULT '1' COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_queue_code` (`code`) USING BTREE,
  KEY `idx_system_queue_title` (`title`) USING BTREE,
  KEY `idx_system_queue_status` (`status`) USING BTREE,
  KEY `idx_system_queue_rscript` (`rscript`) USING BTREE,
  KEY `idx_system_queue_create_at` (`create_at`) USING BTREE,
  KEY `idx_system_queue_exec_time` (`exec_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统-任务';

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户昵称',
  `headimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像地址',
  `authorize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '权限授权',
  `contact_qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系QQ',
  `contact_mail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系邮箱',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '联系手机',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录地址',
  `login_at` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录时间',
  `login_num` bigint(20) DEFAULT '0' COMMENT '登录次数',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `sort` bigint(20) DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_user_status` (`status`) USING BTREE,
  KEY `idx_system_user_username` (`username`) USING BTREE,
  KEY `idx_system_user_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='系统-用户';

-- ----------------------------
-- Records of system_user
-- ----------------------------
BEGIN;
INSERT INTO `system_user` VALUES (10000, 'admin', '7619c94232af48ce677257b85e17cb1f', '系统管理员', '//localhost/upload/user_headimg/7d/4ddce1ecc65282c236b1cca7cb7aff.jpg', ',,', '', '', '', '172.20.0.1', '2021-01-24 23:16:04', 76, '', 1, 0, 0, '2015-11-13 15:14:22');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
