/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : rcs

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-03-14 08:18:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth_group`;
CREATE TABLE `tb_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `description` varchar(80) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of tb_auth_group
-- ----------------------------
INSERT INTO `tb_auth_group` VALUES ('1', '超级管理员', null, '1', '1,2,3');
INSERT INTO `tb_auth_group` VALUES ('2', '高级管理员', null, '1', '2,3');
INSERT INTO `tb_auth_group` VALUES ('3', '普通管理员', null, '1', '3');

-- ----------------------------
-- Table structure for `tb_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth_group_access`;
CREATE TABLE `tb_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明显表';

-- ----------------------------
-- Records of tb_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `tb_auth_rule`;
CREATE TABLE `tb_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(20) DEFAULT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='规则权限表';

-- ----------------------------
-- Records of tb_auth_rule
-- ----------------------------
INSERT INTO `tb_auth_rule` VALUES ('1', 'admin', 'show_button', '显示登录按钮', '1', '1', '');
INSERT INTO `tb_auth_rule` VALUES ('2', 'admin', 'create_case', '创建案件', '1', '1', '');
INSERT INTO `tb_auth_rule` VALUES ('3', 'admin', 'edit_case', '修改案件', '1', '1', '');

-- ----------------------------
-- Table structure for `tb_company`
-- ----------------------------
DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE `tb_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comcode` varchar(15) DEFAULT NULL,
  `comname` varchar(50) DEFAULT NULL,
  `fullname` varchar(120) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=633 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_company
-- ----------------------------
INSERT INTO `tb_company` VALUES ('1', '35050000', '泉州市分公司', '中国人民财产保险股份有限公司泉州市分公司', '1');
INSERT INTO `tb_company` VALUES ('2', '35057700', '泉州市分公司电子商务业务部', '中国人民财产保险股份有限公司泉州市分公司电子商务业务部', '1');
INSERT INTO `tb_company` VALUES ('3', '35057500', '泉州市分公司船舶货运保险业务部', '中国人民财产保险股份有限公司泉州分公司船舶保险业务部', '1');
INSERT INTO `tb_company` VALUES ('4', '35057800', '泉州市分公司医疗行业保险业务部', '中国人民财产保险股份有限公司泉州分公司医疗行业保险业务部', '1');
INSERT INTO `tb_company` VALUES ('5', '35059500', '泉州市分公司第一营业部', '中国人民财产保险股份有限公司泉州市分公司第一营业部', '1');
INSERT INTO `tb_company` VALUES ('6', '35059700', '泉州市分公司第二营业部', '中国人民财产保险股份有限公司泉州市分公司第二营业部', '1');
INSERT INTO `tb_company` VALUES ('7', '35050400', '泉州市分公司第四营业部', '中国人民财产保险股份有限公司泉州市分公司第四营业部', '1');
INSERT INTO `tb_company` VALUES ('8', '35050200', '泉州市鲤城支公司', '中国人民财产保险股份有限公司泉州市鲤城支公司', '1');
INSERT INTO `tb_company` VALUES ('9', '35050300', '泉州市丰泽支公司', '中国人民财产保险股份有限公司泉州市丰泽支公司', '1');
INSERT INTO `tb_company` VALUES ('10', '35050500', '泉港支公司', '中国人民财产保险股份有限公司泉州市泉港支公司', '1');
INSERT INTO `tb_company` VALUES ('11', '35052100', '惠安支公司', '中国人民财产保险股份有限公司惠安支公司', '1');
INSERT INTO `tb_company` VALUES ('12', '35052200', '泉州市台商投资区营业部', '中国人民财产保险股份有限公司泉州市分公司台商投资区营业部', '1');
INSERT INTO `tb_company` VALUES ('13', '35052400', '安溪支公司', '中国人民财产保险股份有限公司安溪支公司', '1');
INSERT INTO `tb_company` VALUES ('14', '35052500', '永春支公司', '中国人民财产保险股份有限公司永春支公司', '1');
INSERT INTO `tb_company` VALUES ('15', '35052600', '德化支公司', '中国人民财产保险股份有限公司德化支公司', '1');
INSERT INTO `tb_company` VALUES ('16', '35058300', '南安支公司', '中国人民财产保险股份有限公司南安支公司', '1');
INSERT INTO `tb_company` VALUES ('17', '35058400', '泉州市分公司水头营业部', '中国人民财产保险股份有限公司泉州市分公司水头营业部', '1');
INSERT INTO `tb_company` VALUES ('18', '35058800', '泉州市分公司洪濑营业部', '中国人民财产保险股份有限公司泉州市分公司洪濑营业部', '1');
INSERT INTO `tb_company` VALUES ('19', '35057900', '泉州市分公司第六营业部', '中国人民财产保险股份有限公司泉州市分公司第六营业部', '1');
INSERT INTO `tb_company` VALUES ('20', '35057100', '出单中心', '出单中心', '1');
INSERT INTO `tb_company` VALUES ('21', '35050201', '鲤城支公司本部', '鲤城支公司本部', '1');
INSERT INTO `tb_company` VALUES ('22', '35050202', '鲤城支公司综合科', '鲤城支公司综合科', '1');
INSERT INTO `tb_company` VALUES ('23', '35050203', '鲤城区支公司业务一科', '鲤城区支公司业务一科', '1');
INSERT INTO `tb_company` VALUES ('24', '35050204', '城东营销服务部', '城东营销服务部', '1');
INSERT INTO `tb_company` VALUES ('25', '35050205', '泉州盈众汽车销售服务有限公司', '泉州盈众汽车销售服务有限公司', '1');
INSERT INTO `tb_company` VALUES ('26', '35050206', '泉州鑫达汽车销售服务有限公司', '泉州鑫达汽车销售服务有限公司', '1');
INSERT INTO `tb_company` VALUES ('27', '35050207', '泉州市大长江丰田汽车销售服务有限公司', '泉州市大长江丰田汽车销售服务有限公司', '1');
INSERT INTO `tb_company` VALUES ('28', '35050209', '泉州市鲤城支公司经理室', '泉州市鲤城支公司经理室', '1');
INSERT INTO `tb_company` VALUES ('29', '35050210', '泉州市鲤城支公司综合部', '泉州市鲤城支公司综合部', '1');
INSERT INTO `tb_company` VALUES ('30', '35050215', '鲤城支公司车行驻点', '鲤城支公司车行驻点', '1');
INSERT INTO `tb_company` VALUES ('31', '35050223', '泉州市鲤城支公司直销业务一部', '泉州市鲤城支公司直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('32', '35050271', '鲤城公司市保险大厦中介业务出单点', '鲤城公司市保险大厦中介业务出单点', '1');
INSERT INTO `tb_company` VALUES ('33', '35050272', '鲤城公司市保险大厦交叉业务出单点', '鲤城公司市保险大厦交叉业务出单点', '1');
INSERT INTO `tb_company` VALUES ('34', '35050275', '鲤城支公司车贷科', '鲤城支公司车贷科', '1');
INSERT INTO `tb_company` VALUES ('35', '35050301', '丰泽支公司本部', '丰泽支公司本部', '1');
INSERT INTO `tb_company` VALUES ('36', '35050302', '丰泽支公司业务一科', '丰泽支公司业务一科', '1');
INSERT INTO `tb_company` VALUES ('37', '35050303', '丰泽支公司业务二科', '丰泽支公司业务二科', '1');
INSERT INTO `tb_company` VALUES ('38', '35050304', '丰泽支公司业务拓展科', '丰泽支公司业务拓展科', '1');
INSERT INTO `tb_company` VALUES ('39', '35050306', '泉州市丰泽支公司综合部', '泉州市丰泽支公司综合部', '1');
INSERT INTO `tb_company` VALUES ('40', '35050315', '丰泽支公司车行驻点', '丰泽支公司车行驻点', '1');
INSERT INTO `tb_company` VALUES ('41', '35050371', '丰泽公司市保险大厦中介业务出单点', '丰泽公司市保险大厦中介业务出单点', '1');
INSERT INTO `tb_company` VALUES ('42', '35050372', '丰泽公司市保险大厦交叉业务出单点', '丰泽公司市保险大厦交叉业务出单点', '1');
INSERT INTO `tb_company` VALUES ('43', '35050375', '丰泽支公司车贷科', '丰泽支公司车贷科', '1');
INSERT INTO `tb_company` VALUES ('44', '35050380', '丰泽支公司驻晋江移动公司年检点', '丰泽支公司驻晋江移动公司年检点', '1');
INSERT INTO `tb_company` VALUES ('45', '35050401', '泉州市分公司第四营业部经理室', '泉州市分公司第四营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('46', '35050402', '第四营业部马甲营销服务部', '第四营业部马甲营销服务部', '1');
INSERT INTO `tb_company` VALUES ('47', '35050403', '泉州市分公司第四营业部综合部', '泉州市分公司第四营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('48', '35050405', '泉州市分公司第四营业部营销服务部', '中国人民财产保险股份有限公司泉州市分公司第四营业部营销服务部', '1');
INSERT INTO `tb_company` VALUES ('49', '35050406', '泉州市分公司第四营业部营销业务一部', '泉州市分公司第四营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('50', '35050410', '泉州市分公司第四营业部直销业务二部', '泉州市分公司第四营业部直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('51', '35050413', '泉州市分公司洛江营销服务部直销业务部', '泉州市分公司洛江营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('52', '35050414', '泉州市分公司洛江营销服务部营销业务部', '泉州市分公司洛江营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('53', '35050415', '泉州分公司第四营业部车行驻点', '泉州分公司第四营业部车行驻点', '1');
INSERT INTO `tb_company` VALUES ('54', '35050418', '泉州市分公司北峰营销服务部直销业务部', '泉州市分公司北峰营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('55', '35050419', '泉州市分公司北峰营销服务部营销业务部', '泉州市分公司北峰营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('56', '35050431', '泉州市分公司第四营业部马甲营销服务部', '中国人民财产保险股份有限公司泉州市分公司马甲营销服务部', '1');
INSERT INTO `tb_company` VALUES ('57', '35050475', '第四营业部车贷科', '第四营业部车贷科', '1');
INSERT INTO `tb_company` VALUES ('58', '35050501', '交警代办点', '交警代办点', '1');
INSERT INTO `tb_company` VALUES ('59', '35050502', '营业二部(泉州代办点)', '营业二部(泉州代办点)', '1');
INSERT INTO `tb_company` VALUES ('60', '35050503', '营业三部(惠安代办点)', '营业三部(惠安代办点)', '1');
INSERT INTO `tb_company` VALUES ('61', '35050504', '泉州市泉港支公司经理室', '泉州市泉港支公司经理室', '1');
INSERT INTO `tb_company` VALUES ('62', '35050505', '泉州市分公司泉港支公司营销服务部', '中国人民财产保险股份有限公司泉州市分公司泉港支公司营销服务部', '1');
INSERT INTO `tb_company` VALUES ('63', '35050506', '泉州市泉港支公司综合部', '泉州市泉港支公司综合部', '1');
INSERT INTO `tb_company` VALUES ('64', '35050511', '泉州市泉港支公司直销业务一部', '泉州市泉港支公司直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('65', '35050515', '泉州市泉港支公司营销服务部', '中国人民财产保险股份有限公司泉州市泉港支公司营销服务部', '1');
INSERT INTO `tb_company` VALUES ('66', '35050516', '泉州市泉港支公司界山营销服务部', '中国人民财产保险股份有限公司泉州市泉港支公司界山营销服务部', '1');
INSERT INTO `tb_company` VALUES ('67', '35050575', '泉港支公司车贷科', '泉港支公司车贷科', '1');
INSERT INTO `tb_company` VALUES ('68', '35050577', '泉港支公司电子商务销售部', '泉港支公司电子商务销售部', '1');
INSERT INTO `tb_company` VALUES ('69', '35050800', '泉州市分公司个人贷款保证保险业务部', '中国人民财产保险股份有限公司泉州市分公司个人贷款保证保险业务部', '1');
INSERT INTO `tb_company` VALUES ('70', '35052101', '惠安支公司', '中国人民财产保险股份有限公司惠安支公司', '1');
INSERT INTO `tb_company` VALUES ('71', '35052102', '惠安支公司崇武营销服务部', '中国人民财产保险股份有限公司惠安支公司崇武营销服务部', '1');
INSERT INTO `tb_company` VALUES ('72', '35052103', '惠安支公司螺城营销服务部', '中国人民财产保险股份有限公司惠安支公司螺城营销服务部', '1');
INSERT INTO `tb_company` VALUES ('73', '35052104', '惠安支公司经理室', '惠安支公司经理室', '1');
INSERT INTO `tb_company` VALUES ('74', '35052105', '洛阳分理处', '洛阳分理处', '1');
INSERT INTO `tb_company` VALUES ('75', '35052106', '涂寨分理处', '涂寨分理处', '1');
INSERT INTO `tb_company` VALUES ('76', '35052107', '惠安支公司东岭营销服务部', '中国人民财产保险股份有限公司惠安支公司东岭营销服务部', '1');
INSERT INTO `tb_company` VALUES ('77', '35052108', '惠安支公司黄塘营销服务部', '中国人民财产保险股份有限公司惠安支公司黄塘营销服务部', '1');
INSERT INTO `tb_company` VALUES ('78', '35052109', '摩托车承保中心', '摩托车承保中心', '1');
INSERT INTO `tb_company` VALUES ('79', '35052110', '惠安支公司东园营销服务部', '中国人民财产保险股份有限公司惠安支公司东园营销服务部', '1');
INSERT INTO `tb_company` VALUES ('80', '35052111', '惠安支公司综合部', '惠安支公司综合部', '1');
INSERT INTO `tb_company` VALUES ('81', '35052115', '泉州市分公司惠安支公司车行驻点', '泉州市分公司惠安支公司车行驻点', '1');
INSERT INTO `tb_company` VALUES ('82', '35052116', '信恒保险代理', '信恒保险代理', '1');
INSERT INTO `tb_company` VALUES ('83', '35052124', '惠安支公司直销业务二部', '惠安支公司直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('84', '35052131', '惠安支公司洛阳营销服务部', '中国人民财产保险股份有限公司惠安支公司洛阳营销服务部', '1');
INSERT INTO `tb_company` VALUES ('85', '35052138', '惠安支公司崇武营销服务部直销业务部', '惠安支公司崇武营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('86', '35052140', '惠安支公司东岭营销服务部直销业务部', '惠安支公司东岭营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('87', '35052142', '惠安支公司螺城营销服务部直销业务部', '惠安支公司螺城营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('88', '35052144', '惠安支公司黄塘营销服务部直销业务部', '惠安支公司黄塘营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('89', '35052175', '惠安支公司车贷科', '惠安支公司车贷科', '1');
INSERT INTO `tb_company` VALUES ('90', '35052177', '惠安支公司电子商务销售部', '惠安支公司电子商务销售部', '1');
INSERT INTO `tb_company` VALUES ('91', '35052201', '泉州分公司台商投资区营业部销售一部', '中国人民财产保险股份有限公司泉州分公司台商投资区营业部销售一部', '1');
INSERT INTO `tb_company` VALUES ('92', '35052202', '泉州分公司台商投资区营业部销售二部', '中国人民财产保险股份有限公司泉州分公司台商投资区营业部销售二部', '1');
INSERT INTO `tb_company` VALUES ('93', '35052203', '泉州分公司台商投资区营业部销售三部', '中国人民财产保险股份有限公司泉州分公司台商投资区营业部销售三部', '1');
INSERT INTO `tb_company` VALUES ('94', '35052204', '惠安支公司洛阳营销服务部', '中国人民财产保险股份有限公司惠安支公司洛阳营销服务部', '1');
INSERT INTO `tb_company` VALUES ('95', '35052205', '泉州分公司台商投资区营业部百崎销售部', '中国人民财产保险股份有限公司泉州分公司台商投资区营业部百崎销售部', '1');
INSERT INTO `tb_company` VALUES ('96', '35052206', '泉州分公司台商投资区营业部张坂销售部', '中国人民财产保险股份有限公司泉州分公司台商投资区营业部张坂销售部', '1');
INSERT INTO `tb_company` VALUES ('97', '35052207', '泉州台商投资区营业部经理室', '泉州台商投资区营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('98', '35052208', '泉州台商投资区营业部综合部', '泉州台商投资区营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('99', '35052277', '台商支公司电子商务销售部', '台商支公司电子商务销售部', '1');
INSERT INTO `tb_company` VALUES ('100', '35052401', '安溪县支公司', '安溪县支公司', '1');
INSERT INTO `tb_company` VALUES ('101', '35052402', '安溪县支公司', '安溪县支公司', '1');
INSERT INTO `tb_company` VALUES ('102', '35052403', '安溪支公司湖头营销服务部', '中国人民财产保险股份有限公司安溪支公司湖头营销服务部', '1');
INSERT INTO `tb_company` VALUES ('103', '35052404', '安溪支公司官桥营销服务部', '中国人民财产保险股份有限公司安溪支公司官桥营销服务部', '1');
INSERT INTO `tb_company` VALUES ('104', '35052405', '安溪支公司剑斗营销服务部', '中国人民财产保险股份有限公司安溪支公司剑斗营销服务部', '1');
INSERT INTO `tb_company` VALUES ('105', '35052406', '安溪支公司城厢营销服务部', '中国人民财产保险股份有限公司安溪支公司城厢营销服务部', '1');
INSERT INTO `tb_company` VALUES ('106', '35052407', '安溪支公司经理室', '安溪支公司经理室', '1');
INSERT INTO `tb_company` VALUES ('107', '35052408', '安溪支公司综合部', '安溪支公司综合部', '1');
INSERT INTO `tb_company` VALUES ('108', '35052421', '安溪支公司官桥营销服务部直销业务部', '安溪支公司官桥营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('109', '35052422', '安溪支公司官桥营销服务部营销业务部', '安溪支公司官桥营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('110', '35052423', '安溪支公司湖头营销服务部直销业务部', '安溪支公司湖头营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('111', '35052424', '安溪支公司湖头营销服务部营销业务部', '安溪支公司湖头营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('112', '35052425', '安溪支公司城厢营销服务部直销业务部', '安溪支公司城厢营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('113', '35052426', '安溪支公司城厢营销服务部营销业务部', '安溪支公司城厢营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('114', '35052427', '安溪支公司剑斗营销服务部直销业务部', '安溪支公司剑斗营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('115', '35052428', '安溪支公司剑斗营销服务部营销业务部', '安溪支公司剑斗营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('116', '35052475', '安溪支公司车贷科', '安溪支公司车贷科', '1');
INSERT INTO `tb_company` VALUES ('117', '35052477', '安溪支公司', '中国人民财产保险股份有限公司安溪支公司', '1');
INSERT INTO `tb_company` VALUES ('118', '35052501', '永春支公司达埔营销服务部', '中国人民财产保险股份有限公司永春支公司达埔营销服务部', '1');
INSERT INTO `tb_company` VALUES ('119', '35052502', '永春支公司锦斗营销服务部', '中国人民财产保险股份有限公司永春支公司锦斗营销服务部', '1');
INSERT INTO `tb_company` VALUES ('120', '35052503', '永春支公司下洋营销服务部', '中国人民财产保险股份有限公司永春支公司下洋营销服务部', '1');
INSERT INTO `tb_company` VALUES ('121', '35052504', '永春支公司经理室', '永春支公司经理室', '1');
INSERT INTO `tb_company` VALUES ('122', '35052505', '永春支公司综合部', '永春支公司综合部', '1');
INSERT INTO `tb_company` VALUES ('123', '35052514', '永春支公司直销业务一部', '永春支公司直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('124', '35052515', '永春支公司直销业务二部', '永春支公司直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('125', '35052516', '永春支公司直销业务三部', '永春支公司直销业务三部', '1');
INSERT INTO `tb_company` VALUES ('126', '35052517', '永春支公司直销业务四部', '永春支公司直销业务四部', '1');
INSERT INTO `tb_company` VALUES ('127', '35052521', '永春支公司达埔营销服务部直销业务部', '永春支公司达埔营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('128', '35052522', '永春支公司达埔营销服务部营销业务部', '永春支公司达埔营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('129', '35052523', '永春支公司锦斗营销服务部直销业务部', '永春支公司锦斗营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('130', '35052524', '永春支公司锦斗营销服务部营销业务部', '永春支公司锦斗营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('131', '35052525', '永春支公司下洋营销服务部直销业务部', '永春支公司下洋营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('132', '35052526', '永春支公司下洋营销服务部营销业务部', '永春支公司下洋营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('133', '35052575', '永春支公司车贷科', '永春支公司车贷科', '1');
INSERT INTO `tb_company` VALUES ('134', '35052577', '永春支公司电子商务销售部', '永春支公司电子商务销售部', '1');
INSERT INTO `tb_company` VALUES ('135', '35052601', '德化支公司交警代办点', '德化支公司交警代办点', '1');
INSERT INTO `tb_company` VALUES ('136', '35052602', '德化支公司三班镇营销服务部', '中国人民财产保险股份有限公司德化支公司三班镇营销服务部', '1');
INSERT INTO `tb_company` VALUES ('137', '35052603', '德化支公司经理室', '德化支公司经理室', '1');
INSERT INTO `tb_company` VALUES ('138', '35052604', '德化支公司综合部', '德化支公司综合部', '1');
INSERT INTO `tb_company` VALUES ('139', '35052611', '德化支公司直销业务一部', '德化支公司直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('140', '35052615', '德化支公司三班镇营销服务部直销业务部', '德化支公司三班镇营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('141', '35052616', '德化支公司三班镇营销服务部营销业务部', '德化支公司三班镇营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('142', '35052675', '德化支公司车贷科', '德化支公司车贷科', '1');
INSERT INTO `tb_company` VALUES ('143', '35052677', '德化支公司电子商务销售部', '德化支公司电子商务销售部', '1');
INSERT INTO `tb_company` VALUES ('144', '35057501', '泉州市分公司船舶货运保险业务部经理室', '泉州市分公司船舶货运保险业务部经理室', '1');
INSERT INTO `tb_company` VALUES ('145', '35057502', '泉州市分公司船舶保险业务部鲤城业务分部', '中国人民财产保险股份有限公司泉州市分公司船舶保险业务部鲤城业务分部', '1');
INSERT INTO `tb_company` VALUES ('146', '35057503', '泉州市分公司船舶货运保险业务部营销业务一部', '泉州市分公司船舶货运保险业务部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('147', '35057504', '泉州市分公司船舶货运保险业务部营销业务二部', '泉州市分公司船舶货运保险业务部营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('148', '35057505', '泉州市分公司船舶货运保险业务部营销业务三部', '泉州市分公司船舶货运保险业务部营销业务三部', '1');
INSERT INTO `tb_company` VALUES ('149', '35057506', '泉州市分公司船舶货运保险业务部综合部', '泉州市分公司船舶货运保险业务部综合部', '1');
INSERT INTO `tb_company` VALUES ('150', '35057507', '泉州市分公司船舶货运保险业务部营销部', '泉州市分公司船舶货运保险业务部营销部', '1');
INSERT INTO `tb_company` VALUES ('151', '35057521', '泉州市分公司船舶货运保险业务部营销业务四部', '泉州市分公司船舶货运保险业务部营销业务四部', '1');
INSERT INTO `tb_company` VALUES ('152', '35057522', '泉州市分公司船舶货运保险业务部营销业务五部', '泉州市分公司船舶货运保险业务部营销业务五部', '1');
INSERT INTO `tb_company` VALUES ('153', '35057576', '泉州市分公司船舶货运保险业务八部', '泉州市分公司船舶货运保险业务八部', '1');
INSERT INTO `tb_company` VALUES ('154', '35057578', '泉州市分公司船舶货运保险业务六部', '泉州市分公司船舶货运保险业务六部', '1');
INSERT INTO `tb_company` VALUES ('155', '35057587', '泉州市分公司船舶货运保险业务部营销业务六部', '泉州市分公司船舶货运保险业务部营销业务六部', '1');
INSERT INTO `tb_company` VALUES ('156', '35057589', '泉州市分公司船舶货运保险业务部营销业务七部', '泉州市分公司船舶货运保险业务部营销业务七部', '1');
INSERT INTO `tb_company` VALUES ('157', '35057594', '泉州市分公司船舶货运保险业务十部', '泉州市分公司船舶货运保险业务十部', '1');
INSERT INTO `tb_company` VALUES ('158', '35057595', '泉州市分公司船舶货运保险业务九部', '泉州市分公司船舶货运保险业务九部', '1');
INSERT INTO `tb_company` VALUES ('159', '35057598', '泉州市分公司船舶货运保险业务部经纪业务部', '泉州市分公司船舶货运保险业务部经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('160', '35057601', '泉州市分公司银行保险业务部经理室', '泉州市分公司银行保险业务部经理室', '1');
INSERT INTO `tb_company` VALUES ('161', '35057602', '泉州市分公司银行保险业务部综合部', '泉州市分公司银行保险业务部综合部', '1');
INSERT INTO `tb_company` VALUES ('162', '35057603', '泉州市分公司银行保险业务部业务部', '泉州市分公司银行保险业务部业务部', '1');
INSERT INTO `tb_company` VALUES ('163', '35057604', '泉州市分公司银行保险业务部直销业务部', '泉州市分公司银行保险业务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('164', '35057701', '泉州市分公司电子商务业务部经理室', '泉州市分公司电子商务业务部经理室', '1');
INSERT INTO `tb_company` VALUES ('165', '35057702', '泉州市分公司电子商务业务部综合部', '泉州市分公司电子商务业务部综合部', '1');
INSERT INTO `tb_company` VALUES ('166', '35057721', '泉州市分公司电子商务营业部惠安点', '泉州市分公司电子商务营业部惠安点', '1');
INSERT INTO `tb_company` VALUES ('167', '35057724', '泉州市分公司电子商务营业部安溪点', '泉州市分公司电子商务营业部安溪点', '1');
INSERT INTO `tb_company` VALUES ('168', '35057801', '泉州市分公司医疗行业保险业务部经理室', '泉州市分公司医疗行业保险业务部经理室', '1');
INSERT INTO `tb_company` VALUES ('169', '35057802', '泉州市分公司医疗行业保险业务部综合部', '泉州市分公司医疗行业保险业务部综合部', '1');
INSERT INTO `tb_company` VALUES ('170', '35057901', '泉州市分公司第六营业部车商业务七部', '泉州市分公司第六营业部车商业务七部', '1');
INSERT INTO `tb_company` VALUES ('171', '35057902', '泉州市分公司第六营业部营销业务一部', '泉州市分公司第六营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('172', '35057903', '泉州市分公司第六营业部经纪业务部', '泉州市分公司第六营业部经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('173', '35057904', '泉州市分公司车商业务洛江分部', '泉州市分公司车商业务洛江分部', '1');
INSERT INTO `tb_company` VALUES ('174', '35057905', '泉州市分公司车商业务泉港分部', '泉州市分公司车商业务泉港分部', '1');
INSERT INTO `tb_company` VALUES ('175', '35057906', '泉州市分公司第六营业部经理室', '泉州市分公司第六营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('176', '35057907', '泉州市分公司第六营业部综合部', '泉州市分公司第六营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('177', '35057921', '泉州市分公司车商业务惠安分部', '泉州市分公司车商业务惠安分部', '1');
INSERT INTO `tb_company` VALUES ('178', '35057922', '泉州市分公司车商业务台商分部', '泉州市分公司车商业务台商分部', '1');
INSERT INTO `tb_company` VALUES ('179', '35057924', '泉州市分公司车商业务安溪分部', '泉州市分公司车商业务安溪分部', '1');
INSERT INTO `tb_company` VALUES ('180', '35057925', '泉州市分公司车商业务永春分部', '泉州市分公司车商业务永春分部', '1');
INSERT INTO `tb_company` VALUES ('181', '35057926', '泉州市分公司车商业务德化分部', '泉州市分公司车商业务德化分部', '1');
INSERT INTO `tb_company` VALUES ('182', '35057976', '泉州市分公司第六营业部新五部业务分部', '中国人民财产保险股份有限公司泉州市分公司第六营业部新五部业务分部', '1');
INSERT INTO `tb_company` VALUES ('183', '35057983', '泉州市分公司车商业务南安分部', '泉州市分公司车商业务南安分部', '1');
INSERT INTO `tb_company` VALUES ('184', '35057984', '泉州第六营业部石井组', '中国人民财产保险股份有限公司泉州第六营业部石井组', '1');
INSERT INTO `tb_company` VALUES ('185', '35057986', '泉州市分公司车商业务官桥分部', '泉州市分公司车商业务官桥分部', '1');
INSERT INTO `tb_company` VALUES ('186', '35057987', '泉州市分公司车商业务南安二营分部', '泉州市分公司车商业务南安二营分部', '1');
INSERT INTO `tb_company` VALUES ('187', '35057988', '泉州市分公司车商业务洪濑分部', '泉州市分公司车商业务洪濑分部', '1');
INSERT INTO `tb_company` VALUES ('188', '35057989', '泉州市分公司车商业务南安大商分部', '泉州市分公司车商业务南安大商分部', '1');
INSERT INTO `tb_company` VALUES ('189', '35057994', '泉州市分公司车商业务五营分部', '泉州市分公司车商业务五营分部', '1');
INSERT INTO `tb_company` VALUES ('190', '35057995', '泉州市分公司车商业务一营分部', '泉州市分公司车商业务一营分部', '1');
INSERT INTO `tb_company` VALUES ('191', '35057998', '泉州市分公司车商业务三营分部', '泉州市分公司车商业务三营分部', '1');
INSERT INTO `tb_company` VALUES ('192', '35058301', '泉州南安公司第一营业部大客户部', '中国人民财产保险股份有限公司泉州南安公司第一营业部大客户部', '1');
INSERT INTO `tb_company` VALUES ('193', '35058302', '泉州南安公司业务八部', '中国人民财产保险股份有限公司泉州南安公司业务八部', '1');
INSERT INTO `tb_company` VALUES ('194', '35058303', '泉州南安公司第一营业部华旭代办点', '中国人民财产保险股份有限公司泉州南安公司第一营业部华旭代办点', '1');
INSERT INTO `tb_company` VALUES ('195', '35058304', '泉州南安公司水头分理处', '中国人民财产保险股份有限公司泉州南安公司水头分理处', '1');
INSERT INTO `tb_company` VALUES ('196', '35058305', '南安二级分公司营业一部营业五部', '南安二级分公司营业一部营业五部', '1');
INSERT INTO `tb_company` VALUES ('197', '35058306', '南安二级分公司营业一部营业二部', '南安二级分公司营业一部营业二部', '1');
INSERT INTO `tb_company` VALUES ('198', '35058307', '泉州南安公司第一营业部销售管理部', '中国人民财产保险股份有限公司泉州南安公司第一营业部销售管理部', '1');
INSERT INTO `tb_company` VALUES ('199', '35058308', '南安支公司仑苍营销服务部', '中国人民财产保险股份有限公司南安支公司仑苍营销服务部', '1');
INSERT INTO `tb_company` VALUES ('200', '35058309', '泉州南安支公司营业九部(石井)', '泉州南安支公司营业九部(石井)', '1');
INSERT INTO `tb_company` VALUES ('201', '35058310', '泉州南安公司第一营业部交警站', '中国人民财产保险股份有限公司泉州南安公司第一营业部交警站', '1');
INSERT INTO `tb_company` VALUES ('202', '35058311', '南安支公司经理室', '南安支公司经理室', '1');
INSERT INTO `tb_company` VALUES ('203', '35058312', '南安支公司综合部', '南安支公司综合部', '1');
INSERT INTO `tb_company` VALUES ('204', '35058314', '南安支公司直销业务二部', '南安支公司直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('205', '35058315', '南安支公司中介业务部', '南安支公司中介业务部', '1');
INSERT INTO `tb_company` VALUES ('206', '35058319', '南安支公司仑苍营销服务部直销业务部', '南安支公司仑苍营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('207', '35058325', '南安支公司交警营销服务部', '中国人民财产保险股份有限公司南安支公司交警营销服务部', '1');
INSERT INTO `tb_company` VALUES ('208', '35058331', '南安支公司丰州营销服务部', '中国人民财产保险股份有限公司南安支公司丰州营销服务部', '1');
INSERT INTO `tb_company` VALUES ('209', '35058332', '南安支公司山美营销服务部', '中国人民财产保险股份有限公司南安支公司山美营销服务部', '1');
INSERT INTO `tb_company` VALUES ('210', '35058375', '泉州南安公司第一营业部车贷科', '中国人民财产保险股份有限公司泉州南安公司第一营业部车贷科', '1');
INSERT INTO `tb_company` VALUES ('211', '35058377', '南安支公司电子商务销售部', '南安支公司电子商务销售部', '1');
INSERT INTO `tb_company` VALUES ('212', '35058380', '泉州南安公司第一营业部山美营销服务部', '中国人民财产保险股份有限公司泉州南安公司第一营业部山美营销服务部', '1');
INSERT INTO `tb_company` VALUES ('213', '35058401', '南安支公司水头营销服务部', '中国人民财产保险股份有限公司南安支公司水头营销服务部', '1');
INSERT INTO `tb_company` VALUES ('214', '35058402', '南安支公司营销服务部', '中国人民财产保险股份有限公司南安支公司支公司营销服务部', '1');
INSERT INTO `tb_company` VALUES ('215', '35058403', '泉州水头营业部销售三部(原有)', '中国人民财产保险股份有限公司泉州水头营业部销售三部(原有)', '1');
INSERT INTO `tb_company` VALUES ('216', '35058405', '泉州水头营业部销售五部(原有)', '中国人民财产保险股份有限公司泉州水头营业部销售五部(原有)', '1');
INSERT INTO `tb_company` VALUES ('217', '35058406', '泉州南安公司营业二部(原六部)', '中国人民财产保险股份有限公司泉州南安公司营业二部(原六部)', '1');
INSERT INTO `tb_company` VALUES ('218', '35058407', '泉州南安公司第一营业部销售管理部', '中国人民财产保险股份有限公司泉州南安公司第一营业部销售管理部', '1');
INSERT INTO `tb_company` VALUES ('219', '35058408', '泉州市分公司大盈营销服务部', '中国人民财产保险股份有限公司泉州市分公司大盈营销服务部', '1');
INSERT INTO `tb_company` VALUES ('220', '35058409', '泉州水头营业部销售三部', '中国人民财产保险股份有限公司泉州水头营业部销售三部', '1');
INSERT INTO `tb_company` VALUES ('221', '35058410', '泉州水头营业部销售五部', '中国人民财产保险股份有限公司泉州水头营业部销售五部', '1');
INSERT INTO `tb_company` VALUES ('222', '35058411', '泉州市分公司水头营业部综合部', '泉州市分公司水头营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('223', '35058422', '泉州市分公司水头营业部营销业务部', '泉州市分公司水头营业部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('224', '35058431', '南安支公司官桥营销服务部', '中国人民财产保险股份有限公司南安支公司官桥营销服务部', '1');
INSERT INTO `tb_company` VALUES ('225', '35058432', '泉州市分公司金桥营销服务部', '中国人民财产保险股份有限公司泉州市分公司金桥营销服务部', '1');
INSERT INTO `tb_company` VALUES ('226', '35058475', '泉州水头营业部车贷科', '中国人民财产保险股份有限公司泉州水头营业部车贷科', '1');
INSERT INTO `tb_company` VALUES ('227', '35058601', '泉州官桥营业部经理室', '中国人民财产保险股份有限公司泉州官桥营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('228', '35058602', '泉州官桥营业部综合科', '中国人民财产保险股份有限公司泉州官桥营业部综合科', '1');
INSERT INTO `tb_company` VALUES ('229', '35058603', '泉州官桥营业部销售一部', '中国人民财产保险股份有限公司泉州官桥营业部销售一部', '1');
INSERT INTO `tb_company` VALUES ('230', '35058604', '泉州官桥营业部客户服务部', '中国人民财产保险股份有限公司泉州官桥营业部客户服务部', '1');
INSERT INTO `tb_company` VALUES ('231', '35058605', '泉州官桥营业部渠道管理部', '中国人民财产保险股份有限公司泉州官桥营业部渠道管理部', '1');
INSERT INTO `tb_company` VALUES ('232', '35058606', '南安支公司官桥营销服务部', '中国人民财产保险股份有限公司南安支公司官桥营销服务部', '1');
INSERT INTO `tb_company` VALUES ('233', '35058607', '泉州市分公司金桥营销服务部', '中国人民财产保险股份有限公司泉州市分公司金桥营销服务部', '1');
INSERT INTO `tb_company` VALUES ('234', '35058608', '泉州市分公司官桥营业部经理室', '泉州市分公司官桥营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('235', '35058609', '泉州市分公司官桥营业部综合部', '泉州市分公司官桥营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('236', '35058610', '泉州市分公司官桥营业部营销管理部', '泉州市分公司官桥营业部营销管理部', '1');
INSERT INTO `tb_company` VALUES ('237', '35058611', '泉州市分公司官桥营业部客户服务部', '泉州市分公司官桥营业部客户服务部', '1');
INSERT INTO `tb_company` VALUES ('238', '35058612', '泉州市分公司官桥营业部销售部', '泉州市分公司官桥营业部销售部', '1');
INSERT INTO `tb_company` VALUES ('239', '35058613', '泉州市分公司官桥营业部直销业务部', '泉州市分公司官桥营业部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('240', '35058614', '泉州市分公司官桥营业部中介业务部', '泉州市分公司官桥营业部中介业务部', '1');
INSERT INTO `tb_company` VALUES ('241', '35058615', '泉州市分公司官桥营业部营销业务一部', '泉州市分公司官桥营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('242', '35058616', '泉州市分公司官桥营业部营销业务二部', '泉州市分公司官桥营业部营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('243', '35058617', '泉州市分公司官桥营业部营销业务三部', '泉州市分公司官桥营业部营销业务三部', '1');
INSERT INTO `tb_company` VALUES ('244', '35058701', '泉州南安公司第二营业部经理室', '中国人民财产保险股份有限公司泉州南安公司第二营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('245', '35058702', '南安支公司丰州营销服务部', '中国人民财产保险股份有限公司南安支公司丰州营销服务部', '1');
INSERT INTO `tb_company` VALUES ('246', '35058703', '泉州南安公司第二营业部业务科', '中国人民财产保险股份有限公司泉州南安公司第二营业部业务科', '1');
INSERT INTO `tb_company` VALUES ('247', '35058704', '泉州市南安二级分公司营业二部经理室', '泉州市南安二级分公司营业二部经理室', '1');
INSERT INTO `tb_company` VALUES ('248', '35058705', '南安支公司山美营销服务部', '中国人民财产保险股份有限公司南安支公司山美营销服务部', '1');
INSERT INTO `tb_company` VALUES ('249', '35058706', '泉州市南安二级分公司营业二部综合部', '泉州市南安二级分公司营业二部综合部', '1');
INSERT INTO `tb_company` VALUES ('250', '35058709', '泉州市南安二级分公司营业二部销售部', '泉州市南安二级分公司营业二部销售部', '1');
INSERT INTO `tb_company` VALUES ('251', '35058710', '泉州市南安二级分公司营业二部营销业务一部', '泉州市南安二级分公司营业二部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('252', '35058711', '泉州市南安二级分公司营业二部营销业务二部', '泉州市南安二级分公司营业二部营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('253', '35058712', '泉州市南安二级分公司营业二部营销业务三部', '泉州市南安二级分公司营业二部营销业务三部', '1');
INSERT INTO `tb_company` VALUES ('254', '35058713', '泉州市南安二级分公司营业二部营销业务四部', '泉州市南安二级分公司营业二部营销业务四部', '1');
INSERT INTO `tb_company` VALUES ('255', '35058714', '泉州市南安二级分公司营业二部营销业务五部', '泉州市南安二级分公司营业二部营销业务五部', '1');
INSERT INTO `tb_company` VALUES ('256', '35058715', '泉州市南安二级分公司营业二部直销业务部', '泉州市南安二级分公司营业二部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('257', '35058801', '泉州洪濑营业部经理室', '中国人民财产保险股份有限公司泉州洪濑营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('258', '35058802', '泉州洪濑营业部综合管理部', '中国人民财产保险股份有限公司泉州洪濑营业部综合管理部', '1');
INSERT INTO `tb_company` VALUES ('259', '35058803', '泉州洪濑营业部业务管理部', '中国人民财产保险股份有限公司泉州洪濑营业部业务管理部', '1');
INSERT INTO `tb_company` VALUES ('260', '35058804', '泉州洪濑营业部营销管理部', '中国人民财产保险股份有限公司泉州洪濑营业部营销管理部', '1');
INSERT INTO `tb_company` VALUES ('261', '35058805', '南安支公司洪濑营销服务部', '中国人民财产保险股份有限公司南安支公司洪濑营销服务部', '1');
INSERT INTO `tb_company` VALUES ('262', '35058806', '泉州市分公司梅山营销服务部', '中国人民财产保险股份有限公司泉州市分公司梅山营销服务部', '1');
INSERT INTO `tb_company` VALUES ('263', '35058807', '南安支公司诗山营销服务部', '中国人民财产保险股份有限公司南安支公司诗山营销服务部', '1');
INSERT INTO `tb_company` VALUES ('264', '35058808', '泉州洪濑营业部丰州销售部', '中国人民财产保险股份有限公司泉州洪濑营业部丰州销售部', '1');
INSERT INTO `tb_company` VALUES ('265', '35058809', '泉州市分公司洪濑营业部经理室', '泉州市分公司洪濑营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('266', '35058810', '泉州市分公司洪濑营业部综合部', '泉州市分公司洪濑营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('267', '35058817', '泉州市分公司洪濑营业部直销业务一部', '泉州市分公司洪濑营业部直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('268', '35058875', '泉州洪濑营业部车贷科', '中国人民财产保险股份有限公司泉州洪濑营业部车贷科', '1');
INSERT INTO `tb_company` VALUES ('269', '35058901', '泉州南安公司总经理室', '中国人民财产保险股份有限公司泉州南安公司总经理室', '1');
INSERT INTO `tb_company` VALUES ('270', '35058902', '泉州南安公司承保大商部', '中国人民财产保险股份有限公司泉州南安公司承保大商部', '1');
INSERT INTO `tb_company` VALUES ('271', '35058903', '泉州南安公司综合部', '中国人民财产保险股份有限公司泉州南安公司综合部', '1');
INSERT INTO `tb_company` VALUES ('272', '35058904', '泉州南安公司理赔部', '中国人民财产保险股份有限公司泉州南安公司理赔部', '1');
INSERT INTO `tb_company` VALUES ('273', '35058905', '泉州南安公司承保一部(水头)', '中国人民财产保险股份有限公司泉州南安公司承保一部(水头)', '1');
INSERT INTO `tb_company` VALUES ('274', '35058906', '泉州南安公司承保二部(官桥)', '中国人民财产保险股份有限公司泉州南安公司承保二部(官桥)', '1');
INSERT INTO `tb_company` VALUES ('275', '35058907', '泉州南安公司承保三部(二营)', '中国人民财产保险股份有限公司泉州南安公司承保三部(二营)', '1');
INSERT INTO `tb_company` VALUES ('276', '35058908', '泉州南安公司承保四部(洪濑)', '中国人民财产保险股份有限公司泉州南安公司承保四部(洪濑)', '1');
INSERT INTO `tb_company` VALUES ('277', '35058909', '泉州南安公司承保五部(一营)', '中国人民财产保险股份有限公司泉州南安公司承保五部(一营)', '1');
INSERT INTO `tb_company` VALUES ('278', '35058910', '泉州南安交警大队出单点(1)', '中国人民财产保险股份有限公司泉州南安交警大队出单点(1)', '1');
INSERT INTO `tb_company` VALUES ('279', '35058911', '泉州南安交警大队出单点(2)', '中国人民财产保险股份有限公司泉州南安交警大队出单点(2)', '1');
INSERT INTO `tb_company` VALUES ('280', '35058922', '南安二级分公司营业一部经理室', '南安二级分公司营业一部经理室', '1');
INSERT INTO `tb_company` VALUES ('281', '35058923', '南安二级分公司营业一部综合部', '南安二级分公司营业一部综合部', '1');
INSERT INTO `tb_company` VALUES ('282', '35058924', '南安二级分公司营业一部承保部', '南安二级分公司营业一部承保部', '1');
INSERT INTO `tb_company` VALUES ('283', '35058925', '南安二级分公司营业一部大商部', '南安二级分公司营业一部大商部', '1');
INSERT INTO `tb_company` VALUES ('284', '35058926', '南安二级分公司营业一部营业一部', '南安二级分公司营业一部营业一部', '1');
INSERT INTO `tb_company` VALUES ('285', '35058927', '南安二级分公司营业一部营业二部', '南安二级分公司营业一部营业二部', '1');
INSERT INTO `tb_company` VALUES ('286', '35058928', '南安二级分公司营业一部营业三部', '南安二级分公司营业一部营业三部', '1');
INSERT INTO `tb_company` VALUES ('287', '35058929', '南安二级分公司营业一部营业四部', '南安二级分公司营业一部营业四部', '1');
INSERT INTO `tb_company` VALUES ('288', '35058930', '南安二级分公司营业一部营业五部', '南安二级分公司营业一部营业五部', '1');
INSERT INTO `tb_company` VALUES ('289', '35058931', '南安二级分公司营业一部营业六部', '南安二级分公司营业一部营业六部', '1');
INSERT INTO `tb_company` VALUES ('290', '35058932', '南安二级分公司营业一部营业七部', '南安二级分公司营业一部营业七部', '1');
INSERT INTO `tb_company` VALUES ('291', '35058933', '南安二级分公司营业一部营业八部', '南安二级分公司营业一部营业八部', '1');
INSERT INTO `tb_company` VALUES ('292', '35058977', '南安二级分公司电子商务销售部', '南安二级分公司电子商务销售部', '1');
INSERT INTO `tb_company` VALUES ('293', '35059300', '泉州客户服务中心', '中国人民财产保险股份有限公司泉州客户服务中心', '1');
INSERT INTO `tb_company` VALUES ('294', '35059401', '泉州第五营业部车贷业务部', '中国人民财产保险股份有限公司泉州第五营业部车贷业务部', '1');
INSERT INTO `tb_company` VALUES ('295', '35059402', '泉州市分公司第五营业部车行营销业务部', '泉州市分公司第五营业部车行营销业务部', '1');
INSERT INTO `tb_company` VALUES ('296', '35059403', '泉州第五营业部业务二部', '中国人民财产保险股份有限公司泉州第五营业部业务二部', '1');
INSERT INTO `tb_company` VALUES ('297', '35059404', '泉州市分公司第五营业部经理室', '泉州市分公司第五营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('298', '35059405', '泉州市分公司第五营业部综合部', '泉州市分公司第五营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('299', '35059406', '泉州市分公司第五营业部中介业务一部', '泉州市分公司第五营业部中介业务一部', '1');
INSERT INTO `tb_company` VALUES ('300', '35059407', '泉州市分公司第五营业部中介业务二部', '泉州市分公司第五营业部中介业务二部', '1');
INSERT INTO `tb_company` VALUES ('301', '35059408', '泉州市分公司第五营业部营销业务一部', '泉州市分公司第五营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('302', '35059409', '泉州市分公司第五营业部营销业务二部', '泉州市分公司第五营业部营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('303', '35059410', '泉州市分公司第五营业部（车行营销业务部）', '泉州市分公司第五营业部（车行营销业务部）', '1');
INSERT INTO `tb_company` VALUES ('304', '35059501', '第一营业部业务一科', '第一营业部业务一科', '1');
INSERT INTO `tb_company` VALUES ('305', '35059502', '第一营业部业务二科', '第一营业部业务二科', '1');
INSERT INTO `tb_company` VALUES ('306', '35059503', '第一营业部业务三科', '第一营业部业务三科', '1');
INSERT INTO `tb_company` VALUES ('307', '35059504', '第一营业部业务四科', '第一营业部业务四科', '1');
INSERT INTO `tb_company` VALUES ('308', '35059505', '第一营业部业务五科', '第一营业部业务五科', '1');
INSERT INTO `tb_company` VALUES ('309', '35059506', '第一营业部业务六科', '第一营业部业务六科', '1');
INSERT INTO `tb_company` VALUES ('310', '35059507', '第一营业部拓展部', '第一营业部拓展部', '1');
INSERT INTO `tb_company` VALUES ('311', '35059508', '第一营业部营销二组', '第一营业部营销二组', '1');
INSERT INTO `tb_company` VALUES ('312', '35059509', '泉州市分公司马甲营销服务部', '中国人民财产保险股份有限公司泉州市分公司马甲营销服务部', '1');
INSERT INTO `tb_company` VALUES ('313', '35059510', '第一营业部业务七科', '第一营业部业务七科', '1');
INSERT INTO `tb_company` VALUES ('314', '35059511', '第一营业部两意险科', '第一营业部两意险科', '1');
INSERT INTO `tb_company` VALUES ('315', '35059512', '第一营业部货运险科', '第一营业部货运险科', '1');
INSERT INTO `tb_company` VALUES ('316', '35059513', '第一营业部电话营销', '第一营业部电话营销', '1');
INSERT INTO `tb_company` VALUES ('317', '35059514', '第一营业部车行驻点', '第一营业部车行驻点', '1');
INSERT INTO `tb_company` VALUES ('318', '35059515', '第一营业部车行驻点', '第一营业部车行驻点', '1');
INSERT INTO `tb_company` VALUES ('319', '35059516', '泉州市分公司第一营业部经理室', '泉州市分公司第一营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('320', '35059517', '泉州市分公司第一营业部综合部', '泉州市分公司第一营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('321', '35059533', '第一营业部fz', '第一营业部fz', '1');
INSERT INTO `tb_company` VALUES ('322', '35059537', '泉州市分公司第一营业部直销业务一部', '泉州市分公司第一营业部直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('323', '35059542', '泉州市分公司第一营业部中介业务部', '泉州市分公司第一营业部中介业务部', '1');
INSERT INTO `tb_company` VALUES ('324', '35059543', '泉州市分公司第一营业部营销业务一部', '泉州市分公司第一营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('325', '35059546', '泉州市分公司第一营业部直销业务五部', '泉州市分公司第一营业部直销业务五部', '1');
INSERT INTO `tb_company` VALUES ('326', '35059547', '泉州市分公司第一营业部银保业务部', '泉州市分公司第一营业部银保业务部', '1');
INSERT INTO `tb_company` VALUES ('327', '35059571', '第一营业部市保险大厦中介业务出单点', '第一营业部市保险大厦中介业务出单点', '1');
INSERT INTO `tb_company` VALUES ('328', '35059572', '第一营业部市保险大厦交叉业务出单点', '第一营业部市保险大厦交叉业务出单点', '1');
INSERT INTO `tb_company` VALUES ('329', '35059574', '第一营业部车贷科lj', '第一营业部车贷科lj', '1');
INSERT INTO `tb_company` VALUES ('330', '35059575', '第一营业部车贷科', '第一营业部车贷科', '1');
INSERT INTO `tb_company` VALUES ('331', '35059576', '第一营业部车贷科dh', '第一营业部车贷科dh', '1');
INSERT INTO `tb_company` VALUES ('332', '35059580', '第一营业部大霞美出单点', '第一营业部大霞美出单点', '1');
INSERT INTO `tb_company` VALUES ('333', '35059581', '第一营业部大霞美出单点', '第一营业部大霞美出单点', '1');
INSERT INTO `tb_company` VALUES ('334', '35059584', '第一营业部lj', '第一营业部lj', '1');
INSERT INTO `tb_company` VALUES ('335', '35059586', '第一营业部dh', '第一营业部dh', '1');
INSERT INTO `tb_company` VALUES ('336', '35059702', '泉州市分公司第二营业部营销业务一部', '泉州市分公司第二营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('337', '35059703', '泉州市分公司第二营业部经纪业务部', '泉州市分公司第二营业部经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('338', '35059704', '泉州市分公司第二营业部车商业务四部', '泉州市分公司第二营业部车商业务四部', '1');
INSERT INTO `tb_company` VALUES ('339', '35059705', '泉州分公司第二营业部中介业务部', '泉州分公司第二营业部中介业务部', '1');
INSERT INTO `tb_company` VALUES ('340', '35059706', '泉州市分公司第二营业部车商业务清鞣植?', '泉州市分公司第二营业部车商业务清鞣植?', '1');
INSERT INTO `tb_company` VALUES ('341', '35059717', '泉州市分公司第二营业部综合部', '泉州市分公司第二营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('342', '35059721', '泉州市分公司第二营业部车商业务惠安分部', '泉州市分公司第二营业部车商业务惠安分部', '1');
INSERT INTO `tb_company` VALUES ('343', '35059722', '泉州市分公司第二营业部车商业务台商分部', '泉州市分公司第二营业部车商业务台商分部', '1');
INSERT INTO `tb_company` VALUES ('344', '35059724', '泉州市分公司第二营业部车商业务安溪分部', '泉州市分公司第二营业部车商业务安溪分部', '1');
INSERT INTO `tb_company` VALUES ('345', '35059725', '泉州市分公司第二营业部车商业务永春分部', '泉州市分公司第二营业部车商业务永春分部', '1');
INSERT INTO `tb_company` VALUES ('346', '35059726', '泉州市分公司第二营业部车商业务德化分部', '泉州市分公司第二营业部车商业务德化分部', '1');
INSERT INTO `tb_company` VALUES ('347', '35059730', '泉州市分公司第二营业部中介业务一部', '泉州市分公司第二营业部中介业务一部', '1');
INSERT INTO `tb_company` VALUES ('348', '35059776', '泉州市分公司第二营业部新五部业务分部', '中国人民财产保险股份有限公司泉州市分公司第二营业部新五部业务分部', '1');
INSERT INTO `tb_company` VALUES ('349', '35059781', '泉州市分公司第二营业部车商业务石狮分部', '泉州市分公司第二营业部车商业务石狮分部', '1');
INSERT INTO `tb_company` VALUES ('350', '35059782', '泉州市分公司第二营业部车商业务晋江分部', '泉州市分公司第二营业部车商业务晋江分部', '1');
INSERT INTO `tb_company` VALUES ('351', '35059783', '泉州市分公司第二营业部车商业务南安分部', '泉州市分公司第二营业部车商业务南安分部', '1');
INSERT INTO `tb_company` VALUES ('352', '35059784', '泉州市分公司第二营业部车商业务水头分部', '泉州市分公司第二营业部车商业务水头分部', '1');
INSERT INTO `tb_company` VALUES ('353', '35059786', '泉州市分公司第二营业部车商业务官桥分部', '泉州市分公司第二营业部车商业务官桥分部', '1');
INSERT INTO `tb_company` VALUES ('354', '35059787', '泉州第二营业部南安二营组', '中国人民财产保险股份有限公司泉州第二营业部南安二营组', '1');
INSERT INTO `tb_company` VALUES ('355', '35059788', '第二营业部洪濑组', '第二营业部洪濑组', '1');
INSERT INTO `tb_company` VALUES ('356', '35059789', '泉州第二营业部南安大商组', '中国人民财产保险股份有限公司泉州第二营业部南安大商组', '1');
INSERT INTO `tb_company` VALUES ('357', '35059791', '泉州市分公司第二营业部车商业务二部', '泉州市分公司第二营业部车商业务二部', '1');
INSERT INTO `tb_company` VALUES ('358', '35059794', '泉州市分公司第二营业部车商业务五部', '泉州市分公司第二营业部车商业务五部', '1');
INSERT INTO `tb_company` VALUES ('359', '35059795', '泉州市分公司第二营业部车商业务一部', '泉州市分公司第二营业部车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('360', '35059798', '泉州市分公司第二营业部车商业务三部', '泉州市分公司第二营业部车商业务三部', '1');
INSERT INTO `tb_company` VALUES ('361', '35059801', '泉州市分公司第三营业部经理室', '泉州市分公司第三营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('362', '35059802', '泉州市分公司第三营业部综合部', '泉州市分公司第三营业部综合部', '1');
INSERT INTO `tb_company` VALUES ('363', '35059804', '泉州市分公司第三营业部销售一部', '泉州市分公司第三营业部销售一部', '1');
INSERT INTO `tb_company` VALUES ('364', '35059806', '泉州市分公司第三营业部直销业务部', '泉州市分公司第三营业部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('365', '35059807', '泉州市分公司第三营业部营销业务一部', '泉州市分公司第三营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('366', '35059808', '泉州市分公司第三营业部营销业务二部', '泉州市分公司第三营业部营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('367', '35059809', '泉州市分公司第三营业部营销业务三部', '泉州市分公司第三营业部营销业务三部', '1');
INSERT INTO `tb_company` VALUES ('368', '35059810', '泉州市分公司第三营业部营销业务四部', '泉州市分公司第三营业部营销业务四部', '1');
INSERT INTO `tb_company` VALUES ('369', '35059811', '泉州市分公司江南营销服务部', '中国人民财产保险股份有限公司泉州市分公司江南营销服务部', '1');
INSERT INTO `tb_company` VALUES ('370', '35059812', '泉州市分公司紫帽营销服务部', '中国人民财产保险股份有限公司泉州市分公司紫帽营销服务部', '1');
INSERT INTO `tb_company` VALUES ('371', '35059813', '泉州市分公司北峰营销服务部', '中国人民财产保险股份有限公司泉州市分公司北峰营销服务部', '1');
INSERT INTO `tb_company` VALUES ('372', '35059815', '泉州市分公司桥尾营销服务部', '中国人民财产保险股份有限公司泉州市分公司桥尾营销服务部', '1');
INSERT INTO `tb_company` VALUES ('373', '35059875', '第三营业部车贷科', '第三营业部车贷科', '1');
INSERT INTO `tb_company` VALUES ('374', '35058415', '泉州市分公司水头营业部直销业务二部', '泉州市分公司水头营业部直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('375', '35059539', '泉州市分公司第一营业部直销业务三部', '泉州市分公司第一营业部直销业务三部', '1');
INSERT INTO `tb_company` VALUES ('376', '35050222', '泉州市鲤城支公司经纪业务部', '泉州市鲤城支公司经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('377', '35050224', '泉州市鲤城支公司直销业务二部', '泉州市鲤城支公司直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('378', '35050229', '泉州市分公司紫帽营销服务部直销业务部', '泉州市分公司紫帽营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('379', '35050230', '泉州市分公司紫帽营销服务部营销业务部', '泉州市分公司紫帽营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('380', '35057300', '泉州市分公司社会医疗保险事业部', '中国人民财产保险股份有限公司泉州市分公司社会医疗保险服务中心', '1');
INSERT INTO `tb_company` VALUES ('381', '35057301', '本部', '本部', '1');
INSERT INTO `tb_company` VALUES ('382', '35058414', '泉州市分公司水头营业部直销业务一部', '泉州市分公司水头营业部直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('383', '35058416', '泉州市分公司水头营业部车商业务一部', '泉州市分公司水头营业部车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('384', '35058417', '泉州市分公司水头营业部车商业务二部', '泉州市分公司水头营业部车商业务二部', '1');
INSERT INTO `tb_company` VALUES ('385', '35058421', '泉州市分公司水头营业部银保业务部', '泉州市分公司水头营业部银保业务部', '1');
INSERT INTO `tb_company` VALUES ('386', '35059535', '泉州市分公司第一营业部营销业务五部', '泉州市分公司第一营业部营销业务五部', '1');
INSERT INTO `tb_company` VALUES ('387', '35059536', '泉州市分公司第一营业部营销业务四部', '泉州市分公司第一营业部营销业务四部', '1');
INSERT INTO `tb_company` VALUES ('388', '35059538', '泉州市分公司第一营业部直销业务二部', '泉州市分公司第一营业部直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('389', '35059541', '泉州市分公司第一营业部车商业务二部', '泉州市分公司第一营业部车商业务二部', '1');
INSERT INTO `tb_company` VALUES ('390', '35050211', '泉州市鲤城支公司营销业务一部', '泉州市鲤城支公司营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('391', '35050213', '泉州市鲤城支公司车商业务一部', '泉州市鲤城支公司车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('392', '35050309', '泉州市丰泽支公司直销业务二部', '泉州市丰泽支公司直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('393', '35050316', '泉州市丰泽支公司营销业务一部', '泉州市丰泽支公司营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('394', '35050514', '泉州市泉港支公司银保业务一部', '泉州市泉港支公司银保业务一部', '1');
INSERT INTO `tb_company` VALUES ('395', '35050517', '泉州市泉港支公司营销业务一部', '泉州市泉港支公司营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('396', '35050802', '泉州市分公司个人贷款保证保险业务部营销业务一部', '泉州市分公司个人贷款保证保险业务部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('397', '35052118', '惠安支公司营销业务一部', '惠安支公司营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('398', '35052119', '惠安支公司营销业务二部', '惠安支公司营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('399', '35052123', '惠安支公司直销业务一部', '惠安支公司直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('400', '35052127', '惠安支公司营销业务四部', '惠安支公司营销业务四部', '1');
INSERT INTO `tb_company` VALUES ('401', '35052128', '惠安支公司银保业务部', '惠安支公司银保业务部', '1');
INSERT INTO `tb_company` VALUES ('402', '35052129', '惠安支公司车商业务一部', '惠安支公司车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('403', '35052133', '惠安支公司营销业务六部', '惠安支公司营销业务六部', '1');
INSERT INTO `tb_company` VALUES ('404', '35052209', '泉州市分公司台商投资区营业部营销业务四部', '泉州市分公司台商投资区营业部营销业务四部', '1');
INSERT INTO `tb_company` VALUES ('405', '35052700', '泉州市泉港支公司', '中国人民财产保险股份有限公司泉州市泉港支公司', '1');
INSERT INTO `tb_company` VALUES ('406', '35059100', '泉州本部', '中国人民财产保险股份有限公司泉州本部', '1');
INSERT INTO `tb_company` VALUES ('407', '35059101', '总经理室', '总经理室', '1');
INSERT INTO `tb_company` VALUES ('408', '35059102', '理赔中心', '理赔中心', '1');
INSERT INTO `tb_company` VALUES ('409', '35059103', '财务会计部', '财务会计部', '1');
INSERT INTO `tb_company` VALUES ('410', '35059104', '泉州计统部', '中国人民财产保险股份有限公司泉州计统部', '1');
INSERT INTO `tb_company` VALUES ('411', '35059105', '信息技术部', '信息技术部', '1');
INSERT INTO `tb_company` VALUES ('412', '35059106', '泉州承保中心', '泉州承保中心', '1');
INSERT INTO `tb_company` VALUES ('413', '35059107', '理赔管理部', '理赔管理部', '1');
INSERT INTO `tb_company` VALUES ('414', '35059108', '销售管理部', '销售管理部', '1');
INSERT INTO `tb_company` VALUES ('415', '35059109', '泉州法律部', '泉州法律部', '1');
INSERT INTO `tb_company` VALUES ('416', '35059110', '办公室', '办公室', '1');
INSERT INTO `tb_company` VALUES ('417', '35059111', '人力资源部/教育培训部', '人力资源部/教育培训部', '1');
INSERT INTO `tb_company` VALUES ('418', '35059112', '泉州车贷办', '泉州车贷办', '1');
INSERT INTO `tb_company` VALUES ('419', '35059113', '商业非车险部', '商业非车险部', '1');
INSERT INTO `tb_company` VALUES ('420', '35059114', '车辆保险部', '车辆保险部', '1');
INSERT INTO `tb_company` VALUES ('421', '35059115', '船舶货运保险部', '船舶货运保险部', '1');
INSERT INTO `tb_company` VALUES ('422', '35059116', '客户服务部', '客户服务部', '1');
INSERT INTO `tb_company` VALUES ('423', '35059117', '银行保险部', '银行保险部', '1');
INSERT INTO `tb_company` VALUES ('424', '35059150', '泉州机关', '中国人民财产保险股份有限公司泉州机关', '1');
INSERT INTO `tb_company` VALUES ('425', '35059200', '泉州业务处理中心', '中国人民财产保险股份有限公司泉州业务处理中心', '1');
INSERT INTO `tb_company` VALUES ('426', '35059540', '泉州市分公司第一营业部车商业务一部', '泉州市分公司第一营业部车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('427', '35059544', '泉州市分公司第一营业部营销业务二部', '泉州市分公司第一营业部营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('428', '35059545', '泉州市分公司第一营业部直销业务四部', '泉州市分公司第一营业部直销业务四部', '1');
INSERT INTO `tb_company` VALUES ('429', '35059548', '泉州市分公司第一营业部营销业务三部', '泉州市分公司第一营业部营销业务三部', '1');
INSERT INTO `tb_company` VALUES ('430', '35059600', '泉州市丰泽消贷中心', '中国人民财产保险股份有限公司泉州市丰泽消贷中心', '1');
INSERT INTO `tb_company` VALUES ('431', '35059601', '消贷中心(营业部)', '消贷中心(营业部)', '1');
INSERT INTO `tb_company` VALUES ('432', '35059602', '消贷中心(鲤城)', '消贷中心(鲤城)', '1');
INSERT INTO `tb_company` VALUES ('433', '35059603', '消贷中心(丰泽)', '消贷中心(丰泽)', '1');
INSERT INTO `tb_company` VALUES ('434', '35059604', '消贷中心(泉港)', '消贷中心(泉港)', '1');
INSERT INTO `tb_company` VALUES ('435', '35059605', '消贷中心(晋江)', '消贷中心(晋江)', '1');
INSERT INTO `tb_company` VALUES ('436', '35059606', '消贷中心(石狮)', '消贷中心(石狮)', '1');
INSERT INTO `tb_company` VALUES ('437', '35059607', '消贷中心(南安)', '消贷中心(南安)', '1');
INSERT INTO `tb_company` VALUES ('438', '35059608', '消贷中心(安溪)', '消贷中心(安溪)', '1');
INSERT INTO `tb_company` VALUES ('439', '35059609', '消贷中心(永春)', '消贷中心(永春)', '1');
INSERT INTO `tb_company` VALUES ('440', '35059610', '消贷中心(德化)', '消贷中心(德化)', '1');
INSERT INTO `tb_company` VALUES ('441', '35059611', '消贷中心(惠安)', '消贷中心(惠安)', '1');
INSERT INTO `tb_company` VALUES ('442', '35059901', '意外责任保险部', '意外责任保险部', '1');
INSERT INTO `tb_company` VALUES ('443', '35059908', '理赔管理分部', '理赔管理分部', '1');
INSERT INTO `tb_company` VALUES ('444', '35059909', '理赔车险分部', '理赔车险分部', '1');
INSERT INTO `tb_company` VALUES ('445', '35059910', '理赔非车险分部', '理赔非车险分部', '1');
INSERT INTO `tb_company` VALUES ('446', '35059911', '理赔人伤分部', '理赔人伤分部', '1');
INSERT INTO `tb_company` VALUES ('447', '35059912', '理赔惠安分部', '理赔惠安分部', '1');
INSERT INTO `tb_company` VALUES ('448', '35059913', '理赔泉港分部', '理赔泉港分部', '1');
INSERT INTO `tb_company` VALUES ('449', '35059915', '理赔安溪分部', '理赔安溪分部', '1');
INSERT INTO `tb_company` VALUES ('450', '35059920', '南安理赔分中心车险组', '南安理赔分中心车险组', '1');
INSERT INTO `tb_company` VALUES ('451', '35050317', '泉州市丰泽支公司直销业务一部', '泉州市丰泽支公司直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('452', '35050318', '泉州市丰泽支公司直销业务三部', '泉州市丰泽支公司直销业务三部', '1');
INSERT INTO `tb_company` VALUES ('453', '35050320', '泉州市丰泽支公司直销业务四部', '泉州市丰泽支公司直销业务四部', '1');
INSERT INTO `tb_company` VALUES ('454', '35050308', '泉州市丰泽支公司经纪业务部', '泉州市丰泽支公司经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('455', '35050319', '泉州市丰泽支公司车商业务二部', '泉州市丰泽支公司车商业务二部', '1');
INSERT INTO `tb_company` VALUES ('456', '35050321', '泉州市丰泽支公司车商业务一部', '泉州市丰泽支公司车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('457', '35050404', '泉州市分公司第四营业部银保业务部', '泉州市分公司第四营业部银保业务部', '1');
INSERT INTO `tb_company` VALUES ('458', '35050409', '泉州市分公司第四营业部直销业务一部', '泉州市分公司第四营业部直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('459', '35050411', '泉州市分公司第四营业部直销业务三部', '泉州市分公司第四营业部直销业务三部', '1');
INSERT INTO `tb_company` VALUES ('460', '35050420', '泉州市分公司第四营业部直销业务四部', '泉州市分公司第四营业部直销业务四部', '1');
INSERT INTO `tb_company` VALUES ('461', '35050508', '泉州市泉港支公司营销业务二部', '泉州市泉港支公司营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('462', '35050512', '泉州市泉港支公司直销业务二部', '泉州市泉港支公司直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('463', '35050513', '泉州市泉港支公司车商业务一部', '泉州市泉港支公司车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('464', '35052132', '惠安支公司营销业务五部', '惠安支公司营销业务五部', '1');
INSERT INTO `tb_company` VALUES ('465', '35052210', '泉州市分公司台商投资区营业部营销业务三部', '泉州市分公司台商投资区营业部营销业务三部', '1');
INSERT INTO `tb_company` VALUES ('466', '35052214', '泉州市分公司台商投资区营业部直销业务一部', '泉州市分公司台商投资区营业部直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('467', '35052215', '泉州市分公司台商投资区营业部营销业务一部', '泉州市分公司台商投资区营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('468', '35052217', '泉州市分公司台商投资区营业部车商业务一部', '泉州市分公司台商投资区营业部车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('469', '35052411', '安溪支公司车商业务一部', '安溪支公司车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('470', '35052413', '安溪支公司营销业务二部', '安溪支公司营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('471', '35052415', '安溪支公司直销业务一部', '安溪支公司直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('472', '35052418', '安溪支公司直销业务二部', '安溪支公司直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('473', '35052419', '安溪支公司直销业务三部', '安溪支公司直销业务三部', '1');
INSERT INTO `tb_company` VALUES ('474', '35052420', '安溪支公司车商业务二部', '安溪支公司车商业务二部', '1');
INSERT INTO `tb_company` VALUES ('475', '35052508', '永春支公司车商业务一部', '永春支公司车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('476', '35052518', '永春支公司营销业务一部', '永春支公司营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('477', '35052520', '永春支公司银保业务部', '永春支公司银保业务部', '1');
INSERT INTO `tb_company` VALUES ('478', '35052605', '德化支公司直销业务二部', '德化支公司直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('479', '35052608', '德化支公司车商业务一部', '德化支公司车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('480', '35052613', '德化支公司营销业务一部', '德化支公司营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('481', '35052614', '德化支公司营销业务二部', '德化支公司营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('482', '35057704', '泉州市分公司电子商务业务部直销业务部', '泉州市分公司电子商务业务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('483', '35057803', '泉州市分公司医疗行业保险业务部直销业务部', '泉州市分公司医疗行业保险业务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('484', '35057908', '泉州市分公司第六营业部营销业务二部', '泉州市分公司第六营业部营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('485', '35057912', '泉州市分公司第六营业部车商业务二部', '泉州市分公司第六营业部车商业务二部', '1');
INSERT INTO `tb_company` VALUES ('486', '35057913', '泉州市分公司第六营业部车商业务三部', '泉州市分公司第六营业部车商业务三部', '1');
INSERT INTO `tb_company` VALUES ('487', '35057914', '泉州市分公司第六营业部车商业务四部', '泉州市分公司第六营业部车商业务四部', '1');
INSERT INTO `tb_company` VALUES ('488', '35057915', '泉州市分公司第六营业部车商业务五部', '泉州市分公司第六营业部车商业务五部', '1');
INSERT INTO `tb_company` VALUES ('489', '35058313', '南安支公司直销业务一部', '南安支公司直销业务一部', '1');
INSERT INTO `tb_company` VALUES ('490', '35058316', '南安支公司营销业务一部', '南安支公司营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('491', '35058317', '南安支公司营销业务二部', '南安支公司营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('492', '35058318', '南安支公司车商业务一部', '南安支公司车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('493', '35058333', '南安支公司经纪业务部', '南安支公司经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('494', '35050412', '泉州市分公司洛江营销服务部', '中国人民财产保险股份有限公司泉州市分公司洛江营销服务部', '1');
INSERT INTO `tb_company` VALUES ('495', '35050416', '泉州市分公司马甲营销服务部直销业务部', '泉州市分公司马甲营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('496', '35050417', '泉州市分公司马甲营销服务部营销业务部', '泉州市分公司马甲营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('497', '35052121', '惠安支公司洛阳营销服务部直销业务部', '惠安支公司洛阳营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('498', '35052122', '惠安支公司洛阳营销服务部营销业务部', '惠安支公司洛阳营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('499', '35052125', '惠安支公司营销业务三部', '惠安支公司营销业务三部', '1');
INSERT INTO `tb_company` VALUES ('500', '35052139', '惠安支公司崇武营销服务部营销业务部', '惠安支公司崇武营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('501', '35052141', '惠安支公司东岭营销服务部营销业务部', '惠安支公司东岭营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('502', '35052143', '惠安支公司螺城营销服务部营销业务部', '惠安支公司螺城营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('503', '35052145', '惠安支公司黄塘营销服务部营销业务部', '惠安支公司黄塘营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('504', '35052216', '泉州市分公司台商投资区营业部营销业务二部', '泉州市分公司台商投资区营业部营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('505', '35052412', '安溪支公司银保业务一部', '安溪支公司银保业务一部', '1');
INSERT INTO `tb_company` VALUES ('506', '35052416', '安溪支公司营销业务一部', '安溪支公司营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('507', '35052429', '安溪支公司经纪业务部', '安溪支公司经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('508', '35052509', '永春支公司营销业务二部', '永春支公司营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('509', '35057309', '泉州市分公司社会医疗保险服务中心直销业务部', '泉州市分公司社会医疗保险服务中心直销业务部', '1');
INSERT INTO `tb_company` VALUES ('510', '35058425', '南安支公司官桥营销服务部直销业务部', '南安支公司官桥营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('511', '35058426', '南安支公司官桥营销服务部营销业务部', '南安支公司官桥营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('512', '35058427', '南安支公司水头营销服务部直销业务部', '南安支公司水头营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('513', '35058428', '南安支公司水头营销服务部营销业务部', '南安支公司水头营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('514', '35058429', '泉州市分公司大盈营销服务部直销业务部', '泉州市分公司大盈营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('515', '35058430', '泉州市分公司大盈营销服务部营销业务部', '泉州市分公司大盈营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('516', '35058433', '泉州市分公司金桥营销服务部直销业务部', '泉州市分公司金桥营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('517', '35058434', '泉州市分公司金桥营销服务部营销业务部', '泉州市分公司金桥营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('518', '35058822', '泉州市分公司梅山营销服务部直销业务部', '泉州市分公司梅山营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('519', '35058823', '泉州市分公司梅山营销服务部营销业务部', '泉州市分公司梅山营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('520', '35058826', '南安支公司洪濑营销服务部直销业务部', '南安支公司洪濑营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('521', '35058827', '南安支公司洪濑营销服务部营销业务部', '南安支公司洪濑营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('522', '35058320', '南安支公司仑苍营销服务部营销业务部', '南安支公司仑苍营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('523', '35058322', '南安支公司山美营销服务部营销业务部', '南安支公司山美营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('524', '35058423', '南安支公司营销服务部直销业务部', '南安支公司支公司营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('525', '35058424', '南安支公司营销服务部营销业务部', '南安支公司支公司营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('526', '35058824', '南安支公司诗山营销服务部直销业务部', '泉州市分公司诗山营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('527', '35058825', '南安支公司诗山营销服务部营销业务部', '泉州市分公司诗山营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('528', '35058819', '泉州市分公司洪濑营业部营销业务一部', '泉州市分公司洪濑营业部营销业务一部', '1');
INSERT INTO `tb_company` VALUES ('529', '35050212', '泉州市鲤城支公司营销业务四部', '泉州市鲤城支公司营销业务四部', '1');
INSERT INTO `tb_company` VALUES ('530', '35050214', '泉州市鲤城支公司销售三部', '泉州市鲤城支公司销售三部', '1');
INSERT INTO `tb_company` VALUES ('531', '35050225', '泉州市鲤城支公司营销业务二部', '泉州市鲤城支公司营销业务二部', '1');
INSERT INTO `tb_company` VALUES ('532', '35050226', '泉州市鲤城支公司个险业务一部', '泉州市鲤城支公司个险业务一部', '1');
INSERT INTO `tb_company` VALUES ('533', '35050227', '泉州市鲤城支公司营销业务三部', '泉州市鲤城支公司营销业务三部', '1');
INSERT INTO `tb_company` VALUES ('534', '35050228', '泉州市鲤城支公司中介业务部', '泉州市鲤城支公司中介业务部', '1');
INSERT INTO `tb_company` VALUES ('535', '35050305', '泉州市丰泽支公司经理室', '泉州市丰泽支公司经理室', '1');
INSERT INTO `tb_company` VALUES ('536', '35050407', '泉州市分公司第四营业部非车险专业销售部', '泉州市分公司第四营业部非车险专业销售部', '1');
INSERT INTO `tb_company` VALUES ('537', '35050408', '泉州市分公司第四营业部直销业务五部', '泉州市分公司第四营业部直销业务五部', '1');
INSERT INTO `tb_company` VALUES ('538', '35050421', '泉州市分公司马甲营销服务部个险业务部', '泉州市分公司马甲营销服务部个险业务部', '1');
INSERT INTO `tb_company` VALUES ('539', '35050801', '泉州市分公司个人贷款保证保险业务部综合部', '泉州市分公司个人贷款保证保险业务部综合部', '1');
INSERT INTO `tb_company` VALUES ('540', '35052114', '惠安支公司直销业务四部', '惠安支公司直销业务四部', '1');
INSERT INTO `tb_company` VALUES ('541', '35052117', '惠安支公司个险业务六部', '惠安支公司个险业务六部', '1');
INSERT INTO `tb_company` VALUES ('542', '35052120', '惠安支公司农险业务部', '惠安支公司农险业务部', '1');
INSERT INTO `tb_company` VALUES ('543', '35052126', '惠安支公司续保团队', '惠安支公司续保团队', '1');
INSERT INTO `tb_company` VALUES ('544', '35052130', '惠安支公司经纪业务部', '惠安支公司经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('545', '35052134', '惠安支公司营销业务七部', '惠安支公司营销业务七部', '1');
INSERT INTO `tb_company` VALUES ('546', '35052135', '惠安支公司营销业务八部', '惠安支公司营销业务八部', '1');
INSERT INTO `tb_company` VALUES ('547', '35052136', '惠安支公司营销业务九部', '惠安支公司营销业务九部', '1');
INSERT INTO `tb_company` VALUES ('548', '35052218', '泉州台商投资区营业部东园营销业务四部', '泉州台商投资区营业部东园营销业务四部', '1');
INSERT INTO `tb_company` VALUES ('549', '35052409', '安溪支公司非车险专业销售部', '安溪支公司非车险专业销售部', '1');
INSERT INTO `tb_company` VALUES ('550', '35052414', '安溪支公司直销业务五部', '安溪支公司直销业务五部', '1');
INSERT INTO `tb_company` VALUES ('551', '35052417', '安溪支公司中介业务二部', '安溪支公司中介业务二部', '1');
INSERT INTO `tb_company` VALUES ('552', '35052519', '永春支公司中介业务部', '永春支公司中介业务部', '1');
INSERT INTO `tb_company` VALUES ('553', '35052606', '德化支公司直销业务三部', '德化支公司直销业务三部', '1');
INSERT INTO `tb_company` VALUES ('554', '35052607', '德化支公司营业一部', '德化支公司营业一部', '1');
INSERT INTO `tb_company` VALUES ('555', '35052612', '德化支公司个险业务三部', '德化支公司个险业务三部', '1');
INSERT INTO `tb_company` VALUES ('556', '35057307', '泉州市分公司社会医疗保险服务中心经理室', '泉州市分公司社会医疗保险服务中心经理室', '1');
INSERT INTO `tb_company` VALUES ('557', '35057308', '泉州市分公司社会医疗保险服务中心综合部', '泉州市分公司社会医疗保险服务中心综合部', '1');
INSERT INTO `tb_company` VALUES ('558', '35057508', '泉州市分公司船舶货运保险业务部丰泽业务分部', '泉州市分公司船舶货运保险业务部丰泽业务分部', '1');
INSERT INTO `tb_company` VALUES ('559', '35057509', '泉州市分公司船舶货运保险业务部洛江业务分部', '泉州市分公司船舶货运保险业务部洛江业务分部', '1');
INSERT INTO `tb_company` VALUES ('560', '35057510', '泉州市分公司船舶货运保险业务部泉港业务分部', '泉州市分公司船舶货运保险业务部泉港业务分部', '1');
INSERT INTO `tb_company` VALUES ('561', '35057511', '泉州市分公司船舶货运保险业务部惠安业务分部', '泉州市分公司船舶货运保险业务部惠安业务分部', '1');
INSERT INTO `tb_company` VALUES ('562', '35057512', '泉州市分公司船舶货运保险业务部台商业务分部', '泉州市分公司船舶货运保险业务部台商业务分部', '1');
INSERT INTO `tb_company` VALUES ('563', '35057513', '泉州市分公司船舶货运保险业务部南安二营业务分部', '泉州市分公司船舶货运保险业务部南安二营业务分部', '1');
INSERT INTO `tb_company` VALUES ('564', '35057514', '泉州市分公司船舶货运保险业务部南安大商业务分部', '泉州市分公司船舶货运保险业务部南安大商业务分部', '1');
INSERT INTO `tb_company` VALUES ('565', '35057515', '泉州市分公司船舶货运保险业务部五营业务分部', '泉州市分公司船舶货运保险业务部五营业务分部', '1');
INSERT INTO `tb_company` VALUES ('566', '35057516', '泉州市分公司船舶货运保险业务部一营业务分部', '泉州市分公司船舶货运保险业务部一营业务分部', '1');
INSERT INTO `tb_company` VALUES ('567', '35057517', '泉州市分公司船舶货运保险业务部银保业务分部', '泉州市分公司船舶货运保险业务部银保业务分部', '1');
INSERT INTO `tb_company` VALUES ('568', '35057518', '泉州市分公司船舶货运保险业务部三营业务分部', '泉州市分公司船舶货运保险业务部三营业务分部', '1');
INSERT INTO `tb_company` VALUES ('569', '35057703', '泉州市分公司电子商务业务部经纪业务部', '泉州市分公司电子商务业务部经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('570', '35057909', '泉州市分公司第六营业部车商业务八部', '泉州市分公司第六营业部车商业务八部', '1');
INSERT INTO `tb_company` VALUES ('571', '35057910', '泉州市分公司车商业务水头分部', '泉州市分公司车商业务水头分部', '1');
INSERT INTO `tb_company` VALUES ('572', '35057911', '泉州市分公司第六营业部车商业务一部', '泉州市分公司第六营业部车商业务一部', '1');
INSERT INTO `tb_company` VALUES ('573', '35058321', '南安支公司山美营销服务部直销业务部', '南安支公司山美营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('574', '35058323', '南安支公司丰州营销服务部直销业务部', '南安支公司丰州营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('575', '35058324', '南安支公司丰州营销服务部营销业务部', '南安支公司丰州营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('576', '35058326', '南安支公司交警营销服务部直销业务部', '南安支公司交警营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('577', '35058327', '南安支公司交警营销服务部营销业务部', '南安支公司交警营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('578', '35058328', '泉州市分公司桥尾营销服务部直销业务部', '泉州市分公司桥尾营销服务部直销业务部', '1');
INSERT INTO `tb_company` VALUES ('579', '35058329', '泉州市分公司桥尾营销服务部营销业务部', '泉州市分公司桥尾营销服务部营销业务部', '1');
INSERT INTO `tb_company` VALUES ('580', '35058330', '南安支公司其他部门', '南安支公司其他部门', '1');
INSERT INTO `tb_company` VALUES ('581', '35058404', '泉州市分公司水头营业部经理室', '泉州市分公司水头营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('582', '35058412', '泉州市分公司水头营业部非车险专业销售部', '泉州市分公司水头营业部非车险专业销售部', '1');
INSERT INTO `tb_company` VALUES ('583', '35058818', '泉州市分公司洪濑营业部直销业务二部', '泉州市分公司洪濑营业部直销业务二部', '1');
INSERT INTO `tb_company` VALUES ('584', '35058820', '泉州市分公司洪濑营业部梅山营销业务部', '泉州市分公司洪濑营业部梅山营销业务部', '1');
INSERT INTO `tb_company` VALUES ('585', '35058821', '泉州市分公司洪濑营业部诗山营销业务部', '泉州市分公司洪濑营业部诗山营销业务部', '1');
INSERT INTO `tb_company` VALUES ('586', '35059549', '泉州市分公司第一营业部营销业务七部', '泉州市分公司第一营业部营销业务七部', '1');
INSERT INTO `tb_company` VALUES ('587', '35059550', '泉州市分公司第一营业部营销业务八部', '泉州市分公司第一营业部营销业务八部', '1');
INSERT INTO `tb_company` VALUES ('588', '35059551', '泉州市分公司第一营业部营销业务九部', '泉州市分公司第一营业部营销业务九部', '1');
INSERT INTO `tb_company` VALUES ('589', '35059552', '泉州市分公司第一营业部营销业务十部', '泉州市分公司第一营业部营销业务十部', '1');
INSERT INTO `tb_company` VALUES ('590', '35059701', '泉州市分公司第二营业部经理室', '泉州市分公司第二营业部经理室', '1');
INSERT INTO `tb_company` VALUES ('591', '35059707', '泉州市分公司第二营业部车商服务团队', '泉州市分公司第二营业部车商服务团队', '1');
INSERT INTO `tb_company` VALUES ('592', '35059708', '泉州市分公司第二营业部车商业务南安二营分部', '泉州市分公司第二营业部车商业务南安二营分部', '1');
INSERT INTO `tb_company` VALUES ('593', '35059709', '泉州市分公司第二营业部车商业务洪濑分部', '泉州市分公司第二营业部车商业务洪濑分部', '1');
INSERT INTO `tb_company` VALUES ('594', '35059710', '泉州市分公司第二营业部车商业务南安大商分部', '泉州市分公司第二营业部车商业务南安大商分部', '1');
INSERT INTO `tb_company` VALUES ('595', '35059711', '泉州市分公司第二营业部中介业务二部', '泉州市分公司第二营业部中介业务二部', '1');
INSERT INTO `tb_company` VALUES ('596', '35059712', '泉州市分公司第二营业部中介业务三部', '泉州市分公司第二营业部中介业务三部', '1');
INSERT INTO `tb_company` VALUES ('597', '35059713', '泉州市分公司第二营业部中介业务四部', '泉州市分公司第二营业部中介业务四部', '1');
INSERT INTO `tb_company` VALUES ('598', '35059714', '泉州市分公司第二营业部中介业务五部', '泉州市分公司第二营业部中介业务五部', '1');
INSERT INTO `tb_company` VALUES ('599', '35059715', '泉州市分公司第二营业部中介业务六部', '泉州市分公司第二营业部中介业务六部', '1');
INSERT INTO `tb_company` VALUES ('600', '35059716', '泉州市分公司第二营业部中介业务七部', '泉州市分公司第二营业部中介业务七部', '1');
INSERT INTO `tb_company` VALUES ('601', '35059902', '健康保险部', '健康保险部', '1');
INSERT INTO `tb_company` VALUES ('602', '35059903', '监察部/法律部/合规部', '监察部/法律部/合规部', '1');
INSERT INTO `tb_company` VALUES ('603', '35059904', '电子商务管理部', '电子商务管理部', '1');
INSERT INTO `tb_company` VALUES ('604', '35059905', '农村保险事业部/农村普惠金融事业部', '农村保险事业部/农村普惠金融事业部', '1');
INSERT INTO `tb_company` VALUES ('605', '35059906', '理赔中心本部', '理赔中心本部', '1');
INSERT INTO `tb_company` VALUES ('606', '35059907', '理赔中心主任室', '理赔中心主任室', '1');
INSERT INTO `tb_company` VALUES ('607', '35059930', '车商业务部', '车商业务部', '1');
INSERT INTO `tb_company` VALUES ('608', '35059931', '金融保险部', '金融保险部', '1');
INSERT INTO `tb_company` VALUES ('609', '35059932', '泉州市分公司个人贷款保证保险业务部经理室', '泉州市分公司个人贷款保证保险业务部经理室', '1');
INSERT INTO `tb_company` VALUES ('610', '35059933', '泉州市分公司第四营业部经纪业务部', '泉州市分公司第四营业部经纪业务部', '1');
INSERT INTO `tb_company` VALUES ('611', '35050509', '泉州市泉港支公司非车险专业销售部', '泉州市泉港支公司非车险专业销售部', '1');
INSERT INTO `tb_company` VALUES ('612', '35052113', '惠安支公司非车险专业销售部', '惠安支公司非车险专业销售部', '1');
INSERT INTO `tb_company` VALUES ('613', '35052211', '泉州台商投资区营业部非车险专业团队', '泉州台商投资区营业部非车险专业团队', '1');
INSERT INTO `tb_company` VALUES ('614', '35052510', '永春支公司非车险专业销售部', '永春支公司非车险专业销售部', '1');
INSERT INTO `tb_company` VALUES ('615', '35052609', '德化支公司非车险专业销售部', '德化支公司非车险专业销售部', '1');
INSERT INTO `tb_company` VALUES ('616', '35058334', '南安支公司非车险专业销售部', '南安支公司非车险专业销售部', '1');
INSERT INTO `tb_company` VALUES ('617', '35058811', '泉州市分公司洪濑营业部非车险专业团队', '泉州市分公司洪濑营业部非车险专业团队', '1');
INSERT INTO `tb_company` VALUES ('618', '35059914', '理赔台商分部', '理赔台商分部', '1');
INSERT INTO `tb_company` VALUES ('619', '35059916', '理赔永春分部', '理赔永春分部', '1');
INSERT INTO `tb_company` VALUES ('620', '35059917', '理赔德化分部', '理赔德化分部', '1');
INSERT INTO `tb_company` VALUES ('621', '35059918', '南安理赔分中心', '南安理赔分中心', '1');
INSERT INTO `tb_company` VALUES ('622', '35059919', '南安理赔分中心主任室', '南安理赔分中心主任室', '1');
INSERT INTO `tb_company` VALUES ('623', '35059921', '南安理赔分中心非车险组', '南安理赔分中心非车险组', '1');
INSERT INTO `tb_company` VALUES ('624', '35059922', '南安理赔分中心综合组', '南安理赔分中心综合组', '1');
INSERT INTO `tb_company` VALUES ('625', '35059925', '高级业务主管室', '高级业务主管室', '1');
INSERT INTO `tb_company` VALUES ('626', '35052146', '惠安支公司非车险专业销售二部', '惠安支公司非车险专业销售二部', '1');
INSERT INTO `tb_company` VALUES ('627', '35052430', '安溪支公司非车险专业销售二部', '安溪支公司非车险专业销售二部', '1');
INSERT INTO `tb_company` VALUES ('628', '35058435', '泉州市分公司水头营业部非车险专业销售二部', '泉州市分公司水头营业部非车险专业销售二部', '1');
INSERT INTO `tb_company` VALUES ('629', '35052212', '台商投资区营业部营销业务五部', '泉州市分公司台商投资区营业部营销业务五部', '1');

-- ----------------------------
-- Table structure for `tb_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单名称',
  `pid` int(10) DEFAULT '0' COMMENT '上级菜单ID',
  `icon` char(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单图标',
  `sort` int(10) DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单url 控制器/方法',
  `hide` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  `status` tinyint(1) DEFAULT NULL COMMENT '菜单状态 1启用 0禁用',
  `remark` char(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `usercode` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `comname` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `comcode` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `face` varchar(100) DEFAULT NULL,
  `mobile` char(11) CHARACTER SET utf8 DEFAULT NULL,
  `tel` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `last_time` datetime DEFAULT NULL,
  `last_ip` varchar(20) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'nethuige', '10000', null, '出单中心', '35057100', 'picture/a.jpg', '15805960262', '22117115', '511205380@qq.com', '1', null, null, '2017-03-12 18:12:10', '2017-03-12 18:12:13', null);
INSERT INTO `tb_user` VALUES ('2', '张三', '10001', null, '信息技术部', '35051234', 'picture/default.jpg', '15895685655', '22117298', 'zhangsan@163.com', '1', null, null, '2017-03-12 18:12:57', '2017-03-12 18:13:00', null);
INSERT INTO `tb_user` VALUES ('3', '李四', '10002', null, '法律部', '35051245', 'picture/default.jpg', '1585965654', '22117412', '473010442@qq.com', '1', null, null, '2017-03-12 21:59:49', '2017-03-12 21:59:52', null);
INSERT INTO `tb_user` VALUES ('18', '77777', '1004445', 'e10adc3949ba59abbe56e057f20f883e', '泉州市分公司船舶货运保险业务部', '35057500', 'picture/8f69b32c237867e72a9894b2dc90db10.JPG', '15805960262', '12454', '4545@qq.com', '1', null, null, '2017-03-13 23:26:31', null, null);
INSERT INTO `tb_user` VALUES ('19', '范冰冰', '154555', '4607e782c4d86fd5364d7e4508bb10d9', '泉州市分公司电子商务业务部', '35057700', 'picture/default.jpg', '15859565856', '51515151', '5646545646@qq.com', '1', null, null, '2017-03-13 23:30:37', null, null);
INSERT INTO `tb_user` VALUES ('20', '54445', '454554', 'e10adc3949ba59abbe56e057f20f883e', '泉州市分公司船舶货运保险业务部', '35057500', 'picture/default.jpg', '15805960262', '5445', '454@qq.com', '1', null, null, '2017-03-13 23:37:29', null, null);
INSERT INTO `tb_user` VALUES ('21', '我去', '5454514', 'e10adc3949ba59abbe56e057f20f883e', '泉州市分公司电子商务业务部', '35057700', 'picture/default.jpg', '15805960262', '12454554', '4545@qq.com', '0', null, null, '2017-03-13 23:38:04', null, null);
INSERT INTO `tb_user` VALUES ('22', '2454', '2112211', 'e10adc3949ba59abbe56e057f20f883e', '泉州市分公司船舶货运保险业务部', '35057500', 'picture/fa8b65b5d7b1211c9db35d23e566d3df.jpg', '15805960262', '45545445', '45454545@qq.com', '1', null, null, '2017-03-13 23:38:52', null, null);
INSERT INTO `tb_user` VALUES ('23', '4454', '45455454', 'e10adc3949ba59abbe56e057f20f883e', '泉港支公司', '35050500', 'picture/default.jpg', '15805960262', '4544545', '4554@qq.scom', '1', null, null, '2017-03-13 23:39:38', null, null);
INSERT INTO `tb_user` VALUES ('24', '4454', '4545545445', 'e10adc3949ba59abbe56e057f20f883e', '泉州市分公司船舶货运保险业务部', '35057500', 'picture/484436ced51aafea3d751fe1a86a2380.JPG', '15805960262', '45545', '4545@qq.com', '1', null, null, '2017-03-13 23:40:05', null, null);
INSERT INTO `tb_user` VALUES ('25', '44', '445544', 'e10adc3949ba59abbe56e057f20f883e', '泉州市分公司医疗行业保险业务部', '35057800', 'picture/84957a62c7817d593e5719d5433f853f.jpg', '15805960262', '455454', '4545@qq.com', '0', null, null, '2017-03-13 23:41:03', null, null);
