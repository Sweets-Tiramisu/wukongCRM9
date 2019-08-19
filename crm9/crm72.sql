/*
SQLyog Ultimate v8.32 
MySQL - 5.5.27 : Database - crm9
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm9` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crm9`;

/*Table structure for table `72crm_admin_config` */

DROP TABLE IF EXISTS `72crm_admin_config`;

CREATE TABLE `72crm_admin_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级ID',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` varchar(1000) NOT NULL COMMENT '值',
  `description` varchar(255) NOT NULL COMMENT '描述',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_id` (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统配置';

/*Data for the table `72crm_admin_config` */

LOCK TABLES `72crm_admin_config` WRITE;

insert  into `72crm_admin_config`(`config_id`,`pid`,`name`,`value`,`description`) values (1,0,'oa','1','工作台');
insert  into `72crm_admin_config`(`config_id`,`pid`,`name`,`value`,`description`) values (2,0,'crm','1','客户管理');
insert  into `72crm_admin_config`(`config_id`,`pid`,`name`,`value`,`description`) values (3,0,'hrm','1','人力资源管理');
insert  into `72crm_admin_config`(`config_id`,`pid`,`name`,`value`,`description`) values (4,0,'work','1','项目管理');
insert  into `72crm_admin_config`(`config_id`,`pid`,`name`,`value`,`description`) values (5,0,'finance','1','财务管理');

UNLOCK TABLES;

/*Table structure for table `72crm_admin_customer_setting` */

DROP TABLE IF EXISTS `72crm_admin_customer_setting`;

CREATE TABLE `72crm_admin_customer_setting` (
  `setting_id` int(9) NOT NULL AUTO_INCREMENT,
  `type` int(1) NOT NULL DEFAULT '0' COMMENT '0:不启用 1 ： 启用',
  `followup_day` int(3) DEFAULT NULL COMMENT '跟进天数',
  `deal_day` int(3) DEFAULT NULL COMMENT '成交天数',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='客户规则';

/*Data for the table `72crm_admin_customer_setting` */

LOCK TABLES `72crm_admin_customer_setting` WRITE;

insert  into `72crm_admin_customer_setting`(`setting_id`,`type`,`followup_day`,`deal_day`) values (3,0,0,0);

UNLOCK TABLES;

/*Table structure for table `72crm_admin_dept` */

DROP TABLE IF EXISTS `72crm_admin_dept`;

CREATE TABLE `72crm_admin_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父级ID 顶级部门为0',
  `name` varchar(64) NOT NULL COMMENT '部门名称',
  `num` int(4) DEFAULT NULL COMMENT '排序 越大越靠后',
  `remark` varchar(64) DEFAULT '' COMMENT '部门备注',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `72crm_admin_dept` */

LOCK TABLES `72crm_admin_dept` WRITE;

insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (1,0,'办公室',NULL,NULL);
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (2,0,'研发部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (39,1,'人事部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (40,1,'财务部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (41,1,'法务部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (42,1,'行政部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (43,1,'销售部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (44,1,'仓储部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (45,1,'市场部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (46,2,'Java研发一部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (47,2,'Java研发二部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (48,2,'IOS研发部',NULL,'');
insert  into `72crm_admin_dept`(`dept_id`,`pid`,`name`,`num`,`remark`) values (49,2,'云服务研发部',NULL,'');

UNLOCK TABLES;

/*Table structure for table `72crm_admin_examine` */

DROP TABLE IF EXISTS `72crm_admin_examine`;

CREATE TABLE `72crm_admin_examine` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_type` int(1) NOT NULL DEFAULT '1' COMMENT '1 合同 2 回款',
  `examine_type` int(1) DEFAULT NULL COMMENT '审核类型 1 固定审批 2 授权审批',
  `name` varchar(255) DEFAULT NULL COMMENT '审批流名称',
  `dept_ids` varchar(500) DEFAULT '0' COMMENT '部门ID（0为全部）',
  `user_ids` varchar(500) DEFAULT '0' COMMENT '员工ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `status` int(1) DEFAULT NULL COMMENT '状态 1 启用 0 禁用 2 删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '流程说明',
  PRIMARY KEY (`examine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COMMENT='审批流程表';

/*Data for the table `72crm_admin_examine` */

LOCK TABLES `72crm_admin_examine` WRITE;

insert  into `72crm_admin_examine`(`examine_id`,`category_type`,`examine_type`,`name`,`dept_ids`,`user_ids`,`create_time`,`create_user_id`,`update_time`,`update_user_id`,`status`,`remarks`) values (42,1,1,'合同默认审批流',NULL,NULL,'2019-05-11 16:27:11',3,'2019-05-11 16:27:43',3,2,'说明');
insert  into `72crm_admin_examine`(`examine_id`,`category_type`,`examine_type`,`name`,`dept_ids`,`user_ids`,`create_time`,`create_user_id`,`update_time`,`update_user_id`,`status`,`remarks`) values (43,2,1,'回款审批流程',NULL,NULL,'2019-05-11 16:27:35',3,'2019-05-11 16:27:35',3,1,'');
insert  into `72crm_admin_examine`(`examine_id`,`category_type`,`examine_type`,`name`,`dept_ids`,`user_ids`,`create_time`,`create_user_id`,`update_time`,`update_user_id`,`status`,`remarks`) values (44,1,1,'合同审批流程',NULL,NULL,'2019-05-11 16:27:11',3,'2019-05-11 16:27:44',3,1,'说明');

UNLOCK TABLES;

/*Table structure for table `72crm_admin_examine_log` */

DROP TABLE IF EXISTS `72crm_admin_examine_log`;

CREATE TABLE `72crm_admin_examine_log` (
  `log_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `record_id` int(11) DEFAULT NULL COMMENT '审批记录ID',
  `examine_step_id` bigint(20) DEFAULT NULL COMMENT '审核步骤ID',
  `examine_status` int(1) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝3 撤回审核',
  `create_user` bigint(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `examine_user` bigint(20) DEFAULT NULL COMMENT '审核人',
  `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `is_recheck` int(1) DEFAULT '0' COMMENT '是否是撤回之前的日志 0或者null为新数据 1：撤回之前的数据',
  `order_id` int(30) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COMMENT='审核日志表';

/*Data for the table `72crm_admin_examine_log` */

LOCK TABLES `72crm_admin_examine_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_admin_examine_record` */

DROP TABLE IF EXISTS `72crm_admin_examine_record`;

CREATE TABLE `72crm_admin_examine_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核记录ID',
  `examine_id` int(11) DEFAULT NULL COMMENT '审批ID',
  `examine_step_id` bigint(20) DEFAULT NULL COMMENT '当前进行的审批步骤ID',
  `examine_status` int(1) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝 3 审核中 4 已撤回',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COMMENT='审核记录表';

/*Data for the table `72crm_admin_examine_record` */

LOCK TABLES `72crm_admin_examine_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_admin_examine_step` */

DROP TABLE IF EXISTS `72crm_admin_examine_step`;

CREATE TABLE `72crm_admin_examine_step` (
  `step_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `step_type` int(1) DEFAULT NULL COMMENT '步骤类型1、负责人主管，2、指定用户（任意一人），3、指定用户（多人会签）,4、上一级审批人主管',
  `examine_id` int(11) NOT NULL COMMENT '审批ID',
  `check_user_id` varchar(500) DEFAULT NULL COMMENT '审批人ID (使用逗号隔开) ,1,2,',
  `step_num` int(2) DEFAULT '1' COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`step_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COMMENT='审批步骤表';

/*Data for the table `72crm_admin_examine_step` */

LOCK TABLES `72crm_admin_examine_step` WRITE;

insert  into `72crm_admin_examine_step`(`step_id`,`step_type`,`examine_id`,`check_user_id`,`step_num`,`create_time`,`remarks`) values (68,1,42,NULL,1,'2019-05-11 16:27:11',NULL);
insert  into `72crm_admin_examine_step`(`step_id`,`step_type`,`examine_id`,`check_user_id`,`step_num`,`create_time`,`remarks`) values (69,1,43,NULL,1,'2019-05-11 16:27:35',NULL);
insert  into `72crm_admin_examine_step`(`step_id`,`step_type`,`examine_id`,`check_user_id`,`step_num`,`create_time`,`remarks`) values (70,1,44,NULL,1,'2019-05-11 16:27:44',NULL);

UNLOCK TABLES;

/*Table structure for table `72crm_admin_field` */

DROP TABLE IF EXISTS `72crm_admin_field`;

CREATE TABLE `72crm_admin_field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `field_name` varchar(30) DEFAULT NULL COMMENT '自定义字段英文标识',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名称',
  `type` int(2) NOT NULL DEFAULT '1' COMMENT '字段类型 1 单行文本 2 多行文本 3 单选 4日期 5 数字 6 小数 7 手机  8 文件 9 多选 10 人员 11 附件 12 部门 13 日期时间 14 邮箱',
  `label` int(2) NOT NULL COMMENT '标签 1 线索 2 客户 3 联系人 4 产品 5 商机 6 合同 7回款8.回款计划',
  `remark` varchar(60) DEFAULT NULL COMMENT '字段说明',
  `input_tips` varchar(255) DEFAULT NULL COMMENT '输入提示',
  `max_length` int(12) DEFAULT NULL COMMENT '最大长度',
  `default_value` varchar(255) DEFAULT '' COMMENT '默认值',
  `is_unique` int(1) DEFAULT '0' COMMENT '是否唯一 1 是 0 否',
  `is_null` int(1) DEFAULT '0' COMMENT '是否必填 1 是 0 否',
  `sorting` int(5) DEFAULT '1' COMMENT '排序 从小到大',
  `options` longtext COMMENT '如果类型是选项，此处不能为空，多个选项以，隔开',
  `value` longtext COMMENT '字段的值',
  `operating` int(1) DEFAULT '0' COMMENT '是否可以删除修改 0 改删 1 改 2 删 3 无',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '同一批次字段此值相同,为空代表初始字段',
  `examine_category_id` int(11) DEFAULT NULL COMMENT '审批ID label为10需要',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2534 DEFAULT CHARSET=utf8mb4 COMMENT='自定义字段表';

/*Data for the table `72crm_admin_field` */

LOCK TABLES `72crm_admin_field` WRITE;

insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (142,0,NULL,'是否上下架',3,4,NULL,NULL,255,NULL,0,0,0,'上架,下架',NULL,3,'2019-04-27 16:34:02',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (144,0,NULL,'单位',3,4,NULL,NULL,255,NULL,0,0,1,'个,块,只,把,枚,瓶,盒,台,吨,千克,米,箱,套',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (154,0,'客户级别','客户级别',3,2,NULL,NULL,255,' ',0,0,0,'A（重点客户）,B（普通客户）,C（非优先客户）',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (155,0,'客户行业','客户行业',3,2,NULL,NULL,255,' ',0,0,2,'IT,金融业,房地产,商业服务,运输/物流,生产,政府,文化传媒',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (156,0,'客户来源','客户来源',3,2,NULL,NULL,255,NULL,0,0,1,'促销,搜索引擎,广告,转介绍,线上注册,线上询价,预约上门,陌拜,电话咨询,邮件咨询',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (158,0,NULL,'线索来源',3,1,NULL,NULL,255,'',0,1,0,'促销,搜索引擎,广告,转介绍,线上注册,线上询价,预约上门,陌拜,电话咨询,邮件咨询',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (160,0,NULL,'客户行业',3,1,NULL,NULL,255,NULL,0,0,1,'IT,金融业,房地产,商业服务,运输/物流,生产,政府,文化传媒',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (161,0,NULL,'客户级别',3,1,NULL,NULL,255,NULL,0,0,2,'A（重点客户）,B（普通客户）,C（非优先客户）',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (162,0,NULL,'是否关键决策人',3,3,NULL,NULL,255,NULL,0,0,0,'是,否',NULL,3,'2019-04-27 16:34:02',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (163,0,NULL,'回款方式',3,7,NULL,NULL,255,NULL,0,1,0,'支票,现金,邮政汇款,电汇,网上转账,支付宝,微信支付,其他',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (164,0,NULL,'性别',3,3,NULL,NULL,255,NULL,0,0,1,'男,女',NULL,3,'2019-04-27 16:34:02',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (845,0,NULL,'计划回款方式',3,8,NULL,NULL,255,NULL,0,0,1,'支票,现金,邮政汇款,电汇,网上转账,支付宝,微信支付,其他',NULL,3,'2019-05-06 13:29:27',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (1788,0,NULL,'部门',12,1,NULL,'',NULL,'',0,0,3,NULL,'',3,'2019-05-06 13:42:52',NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (1975,0,NULL,'产品颜色',1,4,NULL,'',NULL,'',0,0,2,NULL,NULL,0,NULL,NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (2414,0,NULL,'部门',12,6,NULL,'',NULL,'',0,0,0,NULL,NULL,0,NULL,NULL,NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (2530,154,'客户级别','客户级别',3,2,NULL,NULL,255,' ',0,0,0,'A（重点客户）,B（普通客户）,C（非优先客户）','A（重点客户）',3,'2019-07-02 10:28:35','f4fa9230100c4616801c1ec4a876e8d8',NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (2531,156,'客户来源','客户来源',3,2,NULL,NULL,255,NULL,0,0,1,'促销,搜索引擎,广告,转介绍,线上注册,线上询价,预约上门,陌拜,电话咨询,邮件咨询','预约上门',3,NULL,'f4fa9230100c4616801c1ec4a876e8d8',NULL);
insert  into `72crm_admin_field`(`field_id`,`parent_id`,`field_name`,`name`,`type`,`label`,`remark`,`input_tips`,`max_length`,`default_value`,`is_unique`,`is_null`,`sorting`,`options`,`value`,`operating`,`update_time`,`batch_id`,`examine_category_id`) values (2532,155,'客户行业','客户行业',3,2,NULL,NULL,255,' ',0,0,2,'IT,金融业,房地产,商业服务,运输/物流,生产,政府,文化传媒','IT',3,'2019-07-02 10:28:35','f4fa9230100c4616801c1ec4a876e8d8',NULL);

UNLOCK TABLES;

/*Table structure for table `72crm_admin_field_sort` */

DROP TABLE IF EXISTS `72crm_admin_field_sort`;

CREATE TABLE `72crm_admin_field_sort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段id',
  `label` int(2) NOT NULL COMMENT '标签 1 线索 2 客户 3 联系人 4 产品 5 商机 6 合同 7回款 8公海',
  `field_name` varchar(255) NOT NULL COMMENT '字段名称',
  `name` varchar(255) NOT NULL COMMENT '字段中文名称',
  `sort` int(5) NOT NULL DEFAULT '0' COMMENT '字段排序',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `is_hide` int(1) NOT NULL DEFAULT '1' COMMENT '是否隐藏 0、不隐藏 1、隐藏',
  `field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1840 DEFAULT CHARSET=utf8mb4 COMMENT='字段排序表';

/*Data for the table `72crm_admin_field_sort` */

LOCK TABLES `72crm_admin_field_sort` WRITE;

insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1735,1,'leadsName','线索名称',0,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1736,1,'telephone','电话',1,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1737,1,'mobile','手机',2,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1738,1,'updateTime','更新时间',3,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1739,1,'createTime','创建时间',4,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1740,1,'ownerUserName','负责人',5,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1741,1,'address','地址',6,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1742,1,'nextTime','下次联系时间',7,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1743,1,'remark','备注',8,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1744,1,'createUserName','创建人',9,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1745,1,'线索来源','线索来源',10,3,0,158);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1746,1,'客户行业','客户行业',11,3,0,160);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1747,1,'客户级别','客户级别',12,3,0,161);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1749,1,'部门','部门',14,3,0,1788);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1750,2,'customerName','客户名称',0,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1751,2,'dealStatus','成交状态',1,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1752,2,'telephone','电话',2,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1753,2,'website','网址',3,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1754,2,'nextTime','下次联系时间',4,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1755,2,'createUserName','创建人',5,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1756,2,'updateTime','更新时间',6,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1757,2,'createTime','创建时间',7,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1758,2,'ownerUserName','负责人',8,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1759,2,'remark','备注',9,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1760,2,'客户级别','客户级别',10,3,0,154);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1761,2,'客户来源','客户来源',11,3,0,156);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1762,2,'客户行业','客户行业',12,3,0,155);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1763,8,'customerName','客户名称',0,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1764,8,'dealStatus','成交状态',1,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1765,8,'telephone','电话',2,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1766,8,'website','网址',3,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1767,8,'nextTime','下次联系时间',4,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1768,8,'createUserName','创建人',5,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1769,8,'updateTime','更新时间',6,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1770,8,'createTime','创建时间',7,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1771,8,'ownerUserName','负责人',8,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1772,8,'remark','备注',9,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1773,8,'计划回款方式','计划回款方式',10,3,0,845);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1774,5,'businessName','商机名称',0,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1775,5,'customerName','客户名称',1,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1776,5,'typeName','商机状态组',2,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1777,5,'statusName','商机阶段',3,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1778,5,'money','商机金额',4,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1779,5,'dealDate','预计成交日期',5,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1780,5,'remark','备注',6,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1781,5,'createUserName','创建人',7,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1782,5,'updateTime','更新时间',8,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1783,5,'createTime','创建时间',9,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1784,5,'createUserName','创建人',10,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1785,6,'num','合同编号',0,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1786,6,'name','合同名称',1,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1787,6,'customerName','客户名称',2,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1788,6,'businessName','商机名称',3,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1789,6,'orderDate','下单时间',4,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1790,6,'money','合同金额',5,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1791,6,'startTime','合同开始时间',6,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1792,6,'endTime','合同结束时间',7,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1793,6,'contactsName','客户签约人',8,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1794,6,'companyUserName','公司签约人',9,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1795,6,'remark','备注',10,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1796,6,'createUserName','创建人',11,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1797,6,'updateTime','更新时间',12,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1798,6,'createTime','创建时间',13,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1799,6,'ownerUserName','负责人',14,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1801,7,'number','回款编号',0,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1802,7,'customerName','客户名称',1,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1803,7,'contractNum','合同编号',2,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1804,7,'returnTime','回款日期',3,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1805,7,'money','回款金额',4,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1806,7,'planNum','期数',5,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1807,7,'remark','备注',6,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1808,7,'createUserName','创建人',7,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1809,7,'updateTime','更新时间',8,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1810,7,'createTime','创建时间',9,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1811,7,'ownerUserName','负责人',10,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1812,7,'回款方式','回款方式',11,3,0,163);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1813,4,'name','产品名称',0,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1814,4,'num','产品编码',1,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1815,4,'categoryName','产品类别',2,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1816,4,'price','标准价格',3,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1817,4,'description','产品描述',4,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1818,4,'createUserName','创建人',5,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1819,4,'updateTime','更新时间',6,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1820,4,'createTime','创建时间',7,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1821,4,'ownerUserName','负责人',8,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1822,4,'是否上下架','是否上下架',9,3,0,142);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1823,4,'单位','单位',10,3,0,144);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1824,4,'产品颜色','产品颜色',11,3,0,1975);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1825,3,'name','姓名',0,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1826,3,'customerName','客户名称',1,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1827,3,'mobile','手机',2,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1828,3,'telephone','电话',3,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1829,3,'email','电子邮箱',4,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1830,3,'post','职务',5,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1831,3,'address','地址',6,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1832,3,'nextTime','下次联系时间',7,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1833,3,'remark','备注',8,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1834,3,'createUserName','创建人',9,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1835,3,'updateTime','更新时间',10,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1836,3,'createTime','创建时间',11,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1837,3,'ownerUserName','负责人',12,3,0,NULL);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1838,3,'是否关键决策人','是否关键决策人',13,3,0,162);
insert  into `72crm_admin_field_sort`(`id`,`label`,`field_name`,`name`,`sort`,`user_id`,`is_hide`,`field_id`) values (1839,3,'性别','性别',14,3,0,164);

UNLOCK TABLES;

/*Table structure for table `72crm_admin_field_style` */

DROP TABLE IF EXISTS `72crm_admin_field_style`;

CREATE TABLE `72crm_admin_field_style` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '样式表id',
  `style` int(5) DEFAULT NULL COMMENT '字段宽度',
  `type` int(2) DEFAULT NULL COMMENT '字段类型 ''1 线索 2 客户 3 联系人 4 产品 5 商机 6 合同 7回款 8公海''',
  `field_name` varchar(50) DEFAULT NULL COMMENT '字段名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='字段样式表';

/*Data for the table `72crm_admin_field_style` */

LOCK TABLES `72crm_admin_field_style` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_admin_file` */

DROP TABLE IF EXISTS `72crm_admin_file`;

CREATE TABLE `72crm_admin_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '附件名称',
  `size` int(10) NOT NULL COMMENT '附件大小（字节）',
  `create_user_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `path` varchar(255) DEFAULT NULL COMMENT '文件真实路径',
  `file_path` varchar(200) NOT NULL COMMENT '文件路径',
  `file_type` varchar(10) DEFAULT 'file' COMMENT '文件类型',
  `batch_id` varchar(50) DEFAULT NULL COMMENT '批次id',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=576 DEFAULT CHARSET=utf8 COMMENT='附件表';

/*Data for the table `72crm_admin_file` */

LOCK TABLES `72crm_admin_file` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_admin_menu` */

DROP TABLE IF EXISTS `72crm_admin_menu`;

CREATE TABLE `72crm_admin_menu` (
  `menu_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '上级菜单ID',
  `menu_name` varchar(32) DEFAULT '' COMMENT '菜单名称',
  `realm` varchar(127) DEFAULT '' COMMENT '链接地址',
  `menu_type` int(1) DEFAULT NULL COMMENT '菜单类型  1目录 2 菜单 3 按钮 4特殊',
  `sort` int(4) unsigned DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `remarks` varchar(255) DEFAULT NULL COMMENT '菜单说明',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

/*Data for the table `72crm_admin_menu` */

LOCK TABLES `72crm_admin_menu` WRITE;

insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (1,0,'客户管理','crm',0,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (2,0,'商业智能','bi',0,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (3,0,'系统管理','manage',0,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (9,1,'线索管理','leads',1,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (10,1,'客户管理','customer',1,2,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (11,1,'联系人管理','contacts',1,3,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (12,1,'商机管理','business',1,4,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (13,1,'合同管理','contract',1,5,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (14,1,'回款管理','receivables',1,6,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (15,1,'产品管理','product',1,7,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (17,9,'新建','save',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (18,9,'编辑','update',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (19,9,'查看列表','index',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (20,9,'查看详情','read',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (21,9,'导入','excelimport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (22,9,'导出','excelexport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (23,9,'删除','delete',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (24,9,'转移','transfer',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (25,9,'转化','transform',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (26,10,'新建','save',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (27,10,'编辑','update',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (28,10,'查看列表','index',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (29,10,'查看详情','read',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (30,10,'导入','excelimport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (31,10,'导出','excelexport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (32,10,'删除','delete',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (33,10,'转移','transfer',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (34,10,'放入公海','putinpool',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (35,10,'锁定/解锁','lock',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (36,10,'编辑团队成员','teamsave',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (37,10,'放入','pool',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (38,10,'分配','distribute',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (39,10,'接收','receive',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (40,11,'新建','save',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (41,11,'编辑','update',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (42,11,'查看列表','index',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (43,11,'查看详情','read',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (44,11,'删除','delete',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (45,11,'转移','transfer',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (46,12,'新建','save',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (47,12,'编辑','update',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (48,12,'查看列表','index',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (49,12,'查看详情','read',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (50,12,'删除','delete',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (51,12,'转移','transfer',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (52,12,'编辑团队成员','teamsave',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (53,13,'新建','save',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (54,13,'编辑','update',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (55,13,'查看列表','index',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (56,13,'查看详情','read',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (57,13,'删除','delete',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (58,13,'转移','transfer',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (59,13,'编辑团队成员','teamsave',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (60,14,'新建','save',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (61,14,'编辑','update',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (62,14,'查看列表','index',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (63,14,'查看详情','read',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (64,14,'删除','delete',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (65,15,'新建','save',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (66,15,'编辑','update',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (67,15,'查看列表','index',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (68,15,'查看详情','read',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (69,15,'上架/下架','status',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (91,3,'CRM模块','crm',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (92,3,'审批流','examineFlow',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (93,3,'OA模块','oa',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (94,3,'角色权限','permission',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (95,3,'系统管理','system',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (96,3,'用户管理','user',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (97,2,'业绩目标完成情况','achievement',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (98,2,'销售漏斗','business',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (99,2,'员工客户分析','customer',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (100,2,'产品销售情况统计','product',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (101,2,'回款统计','receivables',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (102,97,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (103,98,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (104,99,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (105,100,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (106,101,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (107,11,'联系人导出','excelexport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (108,11,'联系人导入','excelimport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (109,15,'产品导入','excelimport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (110,15,'产品导出','excelexport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (111,2,'员工客户分析','customer',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (112,111,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (113,2,'销售漏斗','funnel',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (114,113,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (115,2,'回款统计','receivables',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (116,115,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (117,2,'产品分析','product',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (118,117,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (119,2,'业绩目标完成情况','performance',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (120,119,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (121,2,'员工业绩分析','employe',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (122,121,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (123,2,'客户画像分析','portrait',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (124,123,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (125,2,'排行榜','ranking',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (126,125,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (127,11,'联系人导出','excelexport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (128,11,'联系人导入','excelimport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (129,15,'产品导入','excelimport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (130,15,'产品导出','excelexport',3,1,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (131,2,'员工客户分析','customer',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (132,111,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (133,2,'销售漏斗','funnel',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (134,113,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (135,2,'回款统计','receivables',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (136,115,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (137,2,'产品分析','product',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (138,117,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (139,2,'业绩目标完成情况','performance',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (140,119,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (141,2,'员工业绩分析','employe',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (142,121,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (143,2,'客户画像分析','portrait',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (144,123,'查看','read',3,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (145,2,'排行榜','ranking',1,0,1,NULL);
insert  into `72crm_admin_menu`(`menu_id`,`parent_id`,`menu_name`,`realm`,`menu_type`,`sort`,`status`,`remarks`) values (146,125,'查看','read',3,0,1,NULL);

UNLOCK TABLES;

/*Table structure for table `72crm_admin_record` */

DROP TABLE IF EXISTS `72crm_admin_record`;

CREATE TABLE `72crm_admin_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(50) NOT NULL COMMENT '关联类型',
  `types_id` int(11) NOT NULL COMMENT '类型ID',
  `content` varchar(1000) NOT NULL COMMENT '跟进内容',
  `category` varchar(255) NOT NULL COMMENT '跟进类型',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `business_ids` varchar(255) DEFAULT NULL COMMENT '商机ID',
  `contacts_ids` varchar(255) DEFAULT NULL COMMENT '联系人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '批次 比如附件批次',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `record_id` (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COMMENT='跟进记录';

/*Data for the table `72crm_admin_record` */

LOCK TABLES `72crm_admin_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_admin_role` */

DROP TABLE IF EXISTS `72crm_admin_role`;

CREATE TABLE `72crm_admin_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) DEFAULT NULL COMMENT '名称',
  `role_type` int(1) DEFAULT NULL COMMENT '0、自定义角色1、管理角色 2、客户管理角色 3、人事角色 4、财务角色 5、项目角色',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` tinyint(3) DEFAULT '1' COMMENT '1 启用 0 禁用',
  `data_type` tinyint(1) NOT NULL DEFAULT '5' COMMENT '数据权限 1、本人，2、本人及下属，3、本部门，4、本部门及下属部门，5、全部 ',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `72crm_admin_role` */

LOCK TABLES `72crm_admin_role` WRITE;

insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (1,'超级管理员',1,'备注',1,5);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (2,'系统设置管理员',1,NULL,1,2);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (3,'部门与员工管理员',1,NULL,1,5);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (4,'审批流管理员',1,NULL,1,5);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (5,'工作台管理员',1,NULL,1,5);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (6,'客户管理员',1,NULL,1,5);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (7,'公告管理员',1,NULL,1,5);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (8,'销售经理角色',2,NULL,1,5);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (9,'行政管理',3,NULL,1,1);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (10,'财务角色',4,NULL,1,1);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (11,'技术研发',5,NULL,1,1);
insert  into `72crm_admin_role`(`role_id`,`role_name`,`role_type`,`remark`,`status`,`data_type`) values (12,'销售员角色',2,NULL,1,5);

UNLOCK TABLES;

/*Table structure for table `72crm_admin_role_menu` */

DROP TABLE IF EXISTS `72crm_admin_role_menu`;

CREATE TABLE `72crm_admin_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=905 DEFAULT CHARSET=utf8 COMMENT='角色菜单对应关系表';

/*Data for the table `72crm_admin_role_menu` */

LOCK TABLES `72crm_admin_role_menu` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_admin_scene` */

DROP TABLE IF EXISTS `72crm_admin_scene`;

CREATE TABLE `72crm_admin_scene` (
  `scene_id` int(10) NOT NULL AUTO_INCREMENT,
  `type` int(5) NOT NULL COMMENT '分类',
  `name` varchar(50) NOT NULL COMMENT '场景名称',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `sort` int(5) NOT NULL COMMENT '排序ID',
  `data` text NOT NULL COMMENT '属性值',
  `is_hide` tinyint(1) NOT NULL COMMENT '1隐藏',
  `is_system` tinyint(1) NOT NULL COMMENT '1系统0自定义',
  `bydata` varchar(50) DEFAULT NULL COMMENT '系统参数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 COMMENT='场景';

/*Data for the table `72crm_admin_scene` */

LOCK TABLES `72crm_admin_scene` WRITE;

insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (340,1,'全部线索',3,0,'{\"is_transform\":{\"condition\":\"is\",\"name\":\"is_transform\",\"value\":0}}',0,1,NULL,'2019-05-11 16:20:11',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (341,1,'我负责的线索',3,0,'{\"owner_user_id\":{\"condition\":\"is\",\"name\":\"owner_user_id\",\"value\":3},\"is_transform\":{\"condition\":\"is\",\"name\":\"is_transform\",\"value\":0}}',0,1,NULL,'2019-05-11 16:20:11',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (342,1,'下属负责的线索',3,0,'{\"owner_user_id\":{\"condition\":\"in\",\"name\":\"owner_user_id\",\"value\":\"\"},\"is_transform\":{\"condition\":\"is\",\"name\":\"is_transform\",\"value\":0}}',0,1,NULL,'2019-05-11 16:20:11',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (343,1,'已转化的线索',3,0,'{\"is_transform\":{\"condition\":\"is\",\"name\":\"is_transform\",\"value\":\"1\"}}',0,1,'transform','2019-05-11 16:20:11',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (344,2,'全部客户',3,0,'',0,1,NULL,'2019-05-11 16:20:11',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (345,2,'我负责的客户',3,0,'{\"owner_user_id\":{\"condition\":\"is\",\"name\":\"owner_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:11',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (346,2,'下属负责的客户',3,0,'{\"owner_user_id\":{\"condition\":\"in\",\"name\":\"owner_user_id\",\"value\":\"\"}}',0,1,NULL,'2019-05-11 16:20:11',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (347,2,'我参与的客户',3,0,'{\"ro_user_id\":{\"condition\":\"takePart\",\"name\":\"ro_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:11',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (348,3,'全部联系人',3,0,'',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (349,3,'我负责的联系人',3,0,'{\"owner_user_id\":{\"condition\":\"is\",\"name\":\"owner_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (350,3,'下属负责的联系人',3,0,'{\"owner_user_id\":{\"condition\":\"in\",\"name\":\"owner_user_id\",\"value\":\"\"}}',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (351,5,'全部商机',3,0,'',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (352,5,'我负责的商机',3,0,'{\"owner_user_id\":{\"condition\":\"is\",\"name\":\"owner_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (353,5,'下属负责的商机',3,0,'{\"owner_user_id\":{\"condition\":\"in\",\"name\":\"owner_user_id\",\"value\":\"\"}}',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (354,5,'我参与的商机',3,0,'{\"ro_user_id\":{\"condition\":\"takePart\",\"name\":\"ro_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (355,6,'全部合同',3,0,'',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (356,6,'我负责的合同',3,0,'{\"owner_user_id\":{\"condition\":\"is\",\"name\":\"owner_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (357,6,'下属负责的合同',3,0,'{\"owner_user_id\":{\"condition\":\"in\",\"name\":\"owner_user_id\",\"value\":\"\"}}',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (358,6,'我参与的合同',3,0,'{\"ro_user_id\":{\"condition\":\"takePart\",\"name\":\"ro_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:12',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (359,7,'全部回款',3,0,'',0,1,NULL,'2019-05-11 16:20:13',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (360,7,'我负责的回款',3,0,'{\"owner_user_id\":{\"condition\":\"is\",\"name\":\"owner_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:13',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (361,7,'下属负责的回款',3,0,'{\"owner_user_id\":{\"condition\":\"in\",\"name\":\"owner_user_id\",\"value\":\"\"}}',0,1,NULL,'2019-05-11 16:20:13',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (362,7,'我参与的回款',3,0,'{\"ro_user_id\":{\"condition\":\"takePart\",\"name\":\"ro_user_id\",\"value\":3}}',0,1,NULL,'2019-05-11 16:20:13',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (363,4,'全部产品',3,0,'{\"status\":{\"condition\":\"is\",\"name\":\"status\",\"value\":\"1\"}}',0,1,NULL,'2019-05-11 16:20:13',NULL);
insert  into `72crm_admin_scene`(`scene_id`,`type`,`name`,`user_id`,`sort`,`data`,`is_hide`,`is_system`,`bydata`,`create_time`,`update_time`) values (364,4,'下架的产品',3,0,'{\"status\":{\"condition\":\"is\",\"name\":\"status\",\"value\":\"0\"}}',0,1,NULL,'2019-05-11 16:20:13',NULL);

UNLOCK TABLES;

/*Table structure for table `72crm_admin_scene_default` */

DROP TABLE IF EXISTS `72crm_admin_scene_default`;

CREATE TABLE `72crm_admin_scene_default` (
  `default_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(5) NOT NULL COMMENT '类型',
  `user_id` bigint(20) NOT NULL COMMENT '人员ID',
  `scene_id` int(11) NOT NULL COMMENT '场景ID',
  PRIMARY KEY (`default_id`),
  UNIQUE KEY `default_id` (`default_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='场景默认关系表';

/*Data for the table `72crm_admin_scene_default` */

LOCK TABLES `72crm_admin_scene_default` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_admin_user` */

DROP TABLE IF EXISTS `72crm_admin_user`;

CREATE TABLE `72crm_admin_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '安全符',
  `img` varchar(200) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `num` varchar(100) DEFAULT NULL COMMENT '员工编号',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` tinyint(1) DEFAULT NULL COMMENT '0 未选择 1 男 2 女 ',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门',
  `post` varchar(50) DEFAULT NULL COMMENT '岗位',
  `status` tinyint(3) DEFAULT '2' COMMENT '状态,0禁用,1正常,2未激活',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '直属上级ID',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(30) DEFAULT NULL COMMENT '最后登录IP 注意兼容IPV6',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `72crm_admin_user` */

LOCK TABLES `72crm_admin_user` WRITE;

insert  into `72crm_admin_user`(`user_id`,`username`,`password`,`salt`,`img`,`create_time`,`realname`,`num`,`mobile`,`email`,`sex`,`dept_id`,`post`,`status`,`parent_id`,`last_login_time`,`last_login_ip`) values (3,'admin','51a10f3b4724642d6987d90510e6edf5','7d65f7cbc0ce4a259d741ae0ef33730c','','2019-02-13 15:43:26','admin','390823685766627','12312341234',NULL,NULL,1,'1',1,0,'2019-07-02 09:46:56','0:0:0:0:0:0:0:1');
insert  into `72crm_admin_user`(`user_id`,`username`,`password`,`salt`,`img`,`create_time`,`realname`,`num`,`mobile`,`email`,`sex`,`dept_id`,`post`,`status`,`parent_id`,`last_login_time`,`last_login_ip`) values (4,'zhuan','302ca47ff961ebb3890194b38c2a25be','7d65f7cbc0ce4a259d741ae0ef33730c',NULL,'0000-00-00 00:00:00','zhuan','390823685766627','13122334455',NULL,NULL,2,'1',2,0,'2019-07-02 09:46:56','0:0:0:0:0:0:0:1');

UNLOCK TABLES;

/*Table structure for table `72crm_admin_user_role` */

DROP TABLE IF EXISTS `72crm_admin_user_role`;

CREATE TABLE `72crm_admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='用户角色对应关系表';

/*Data for the table `72crm_admin_user_role` */

LOCK TABLES `72crm_admin_user_role` WRITE;

insert  into `72crm_admin_user_role`(`id`,`user_id`,`role_id`) values (169,3,1);
insert  into `72crm_admin_user_role`(`id`,`user_id`,`role_id`) values (172,4,1);
insert  into `72crm_admin_user_role`(`id`,`user_id`,`role_id`) values (173,4,11);

UNLOCK TABLES;

/*Table structure for table `72crm_crm_achievement` */

DROP TABLE IF EXISTS `72crm_crm_achievement`;

CREATE TABLE `72crm_crm_achievement` (
  `achievement_id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) DEFAULT NULL COMMENT '对象ID',
  `type` tinyint(2) DEFAULT '0' COMMENT '1公司2部门3员工',
  `year` varchar(20) DEFAULT NULL COMMENT '年',
  `january` decimal(18,2) DEFAULT '0.00' COMMENT '一月',
  `february` decimal(18,2) DEFAULT '0.00' COMMENT '二月',
  `march` decimal(18,2) DEFAULT '0.00' COMMENT '三月',
  `april` decimal(18,2) DEFAULT '0.00' COMMENT '四月',
  `may` decimal(18,2) DEFAULT '0.00' COMMENT '五月',
  `june` decimal(18,2) DEFAULT '0.00' COMMENT '六月',
  `july` decimal(18,2) DEFAULT '0.00' COMMENT '七月',
  `august` decimal(18,2) DEFAULT '0.00' COMMENT '八月',
  `september` decimal(18,2) DEFAULT '0.00' COMMENT '九月',
  `october` decimal(18,2) DEFAULT '0.00' COMMENT '十月',
  `november` decimal(18,2) DEFAULT '0.00' COMMENT '十一月',
  `december` decimal(18,2) DEFAULT '0.00' COMMENT '十二月',
  `status` tinyint(2) DEFAULT NULL COMMENT '1销售（目标）2回款（目标）',
  `yeartarget` decimal(18,2) DEFAULT '0.00' COMMENT '年目标',
  PRIMARY KEY (`achievement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='业绩目标';

/*Data for the table `72crm_crm_achievement` */

LOCK TABLES `72crm_crm_achievement` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_action_record` */

DROP TABLE IF EXISTS `72crm_crm_action_record`;

CREATE TABLE `72crm_crm_action_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_user_id` int(10) NOT NULL COMMENT '操作人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `types` varchar(20) NOT NULL COMMENT '类型',
  `action_id` int(11) NOT NULL COMMENT '被操作对象ID',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 COMMENT='字段操作记录表';

/*Data for the table `72crm_crm_action_record` */

LOCK TABLES `72crm_crm_action_record` WRITE;

insert  into `72crm_crm_action_record`(`id`,`create_user_id`,`create_time`,`types`,`action_id`,`content`) values (295,3,'2019-07-02 10:14:28','2',89,'[\"新建了客户\"]');
insert  into `72crm_crm_action_record`(`id`,`create_user_id`,`create_time`,`types`,`action_id`,`content`) values (296,3,'2019-07-02 10:16:02','2',89,'[\"将客户级别 由 修改为A（重点客户）。\",\"将客户来源 由修改为预约上门。\",\"将客户行业 由 修改为IT。\",\"将省市区 由[]修改为山东省,济南市,历下区。\"]');

UNLOCK TABLES;

/*Table structure for table `72crm_crm_business` */

DROP TABLE IF EXISTS `72crm_crm_business`;

CREATE TABLE `72crm_crm_business` (
  `business_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL COMMENT '商机状态组',
  `status_id` int(11) DEFAULT NULL COMMENT '销售阶段',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `deal_date` datetime DEFAULT NULL COMMENT '预计成交日期',
  `business_name` varchar(50) NOT NULL COMMENT '商机名称',
  `money` decimal(18,2) DEFAULT NULL COMMENT '商机金额',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '整单折扣',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `create_user_id` int(10) NOT NULL COMMENT '创建人ID',
  `owner_user_id` int(10) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '批次 比如附件批次',
  `ro_user_id` longtext CHARACTER SET utf8mb4 NOT NULL COMMENT '只读权限',
  `rw_user_id` longtext NOT NULL COMMENT '读写权限',
  `is_end` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1赢单2输单3无效',
  `status_remark` varchar(500) DEFAULT '',
  PRIMARY KEY (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='商机表';

/*Data for the table `72crm_crm_business` */

LOCK TABLES `72crm_crm_business` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_business_change` */

DROP TABLE IF EXISTS `72crm_crm_business_change`;

CREATE TABLE `72crm_crm_business_change` (
  `change_id` int(10) NOT NULL AUTO_INCREMENT,
  `business_id` int(10) NOT NULL COMMENT '商机ID',
  `status_id` int(10) NOT NULL COMMENT '阶段ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_user_id` int(10) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商机阶段变化表';

/*Data for the table `72crm_crm_business_change` */

LOCK TABLES `72crm_crm_business_change` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_business_product` */

DROP TABLE IF EXISTS `72crm_crm_business_product`;

CREATE TABLE `72crm_crm_business_product` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '商机ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `price` decimal(18,2) NOT NULL COMMENT '产品单价',
  `sales_price` decimal(18,2) NOT NULL COMMENT '销售价格',
  `num` int(10) NOT NULL COMMENT '数量',
  `discount` int(10) NOT NULL COMMENT '折扣',
  `subtotal` decimal(18,2) NOT NULL COMMENT '小计（折扣后价格）',
  `unit` varchar(50) DEFAULT '' COMMENT '单位',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='商机产品关系表';

/*Data for the table `72crm_crm_business_product` */

LOCK TABLES `72crm_crm_business_product` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_business_status` */

DROP TABLE IF EXISTS `72crm_crm_business_status`;

CREATE TABLE `72crm_crm_business_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL COMMENT '商机状态类别ID',
  `name` varchar(50) NOT NULL COMMENT '标识',
  `rate` varchar(20) DEFAULT NULL COMMENT '赢单率',
  `order_num` tinyint(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='商机状态';

/*Data for the table `72crm_crm_business_status` */

LOCK TABLES `72crm_crm_business_status` WRITE;

insert  into `72crm_crm_business_status`(`status_id`,`type_id`,`name`,`rate`,`order_num`) values (29,9,'验证客户','20',1);
insert  into `72crm_crm_business_status`(`status_id`,`type_id`,`name`,`rate`,`order_num`) values (30,9,'需求分析','30',2);
insert  into `72crm_crm_business_status`(`status_id`,`type_id`,`name`,`rate`,`order_num`) values (31,9,'方案/报价','80',3);

UNLOCK TABLES;

/*Table structure for table `72crm_crm_business_type` */

DROP TABLE IF EXISTS `72crm_crm_business_type`;

CREATE TABLE `72crm_crm_business_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '标识',
  `dept_ids` varchar(255) NOT NULL COMMENT '部门ID',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1启用0禁用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商机状态组类别';

/*Data for the table `72crm_crm_business_type` */

LOCK TABLES `72crm_crm_business_type` WRITE;

insert  into `72crm_crm_business_type`(`type_id`,`name`,`dept_ids`,`create_user_id`,`create_time`,`update_time`,`status`) values (9,'默认商机组','',3,'2019-05-11 16:25:09',NULL,1);

UNLOCK TABLES;

/*Table structure for table `72crm_crm_contacts` */

DROP TABLE IF EXISTS `72crm_crm_contacts`;

CREATE TABLE `72crm_crm_contacts` (
  `contacts_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '联系人名称',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `mobile` varchar(255) DEFAULT '' COMMENT '手机',
  `telephone` varchar(255) DEFAULT '' COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `post` varchar(255) DEFAULT NULL COMMENT '职务',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `address` varchar(500) DEFAULT '' COMMENT '地址',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `create_user_id` int(10) DEFAULT NULL COMMENT '创建人ID',
  `owner_user_id` int(11) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次',
  PRIMARY KEY (`contacts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='联系人表';

/*Data for the table `72crm_crm_contacts` */

LOCK TABLES `72crm_crm_contacts` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_contacts_business` */

DROP TABLE IF EXISTS `72crm_crm_contacts_business`;

CREATE TABLE `72crm_crm_contacts_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `contacts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商机联系人关联表';

/*Data for the table `72crm_crm_contacts_business` */

LOCK TABLES `72crm_crm_contacts_business` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_contract` */

DROP TABLE IF EXISTS `72crm_crm_contract`;

CREATE TABLE `72crm_crm_contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '合同名称',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `business_id` int(11) DEFAULT NULL COMMENT '商机ID',
  `check_status` int(4) DEFAULT '0' COMMENT '0待审核、1审核中、2审核通过、3审核未通过 4:已撤回',
  `examine_record_id` int(11) DEFAULT NULL COMMENT '审核记录ID',
  `order_date` datetime DEFAULT NULL COMMENT '下单日期',
  `create_user_id` int(10) NOT NULL COMMENT '创建人ID',
  `owner_user_id` int(10) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `num` varchar(255) DEFAULT NULL COMMENT '合同编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `money` decimal(18,2) DEFAULT NULL COMMENT '合同金额',
  `discount_rate` decimal(10,2) DEFAULT NULL COMMENT '整单折扣',
  `types` varchar(255) DEFAULT NULL COMMENT '合同类型',
  `payment_type` varchar(255) DEFAULT NULL COMMENT '付款方式',
  `batch_id` varchar(32) NOT NULL COMMENT '批次 比如附件批次',
  `ro_user_id` longtext COMMENT '只读权限',
  `rw_user_id` longtext COMMENT '读写权限',
  `contacts_id` int(11) DEFAULT NULL COMMENT '客户签约人（联系人id）',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `company_user_id` int(11) DEFAULT NULL COMMENT '公司签约人',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='合同表';

/*Data for the table `72crm_crm_contract` */

LOCK TABLES `72crm_crm_contract` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_contract_product` */

DROP TABLE IF EXISTS `72crm_crm_contract_product`;

CREATE TABLE `72crm_crm_contract_product` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `price` decimal(18,2) NOT NULL COMMENT '产品单价',
  `sales_price` decimal(18,2) NOT NULL COMMENT '销售价格',
  `num` int(10) NOT NULL COMMENT '数量',
  `discount` decimal(10,4) NOT NULL COMMENT '折扣',
  `subtotal` decimal(18,2) NOT NULL COMMENT '小计（折扣后价格）',
  `unit` varchar(50) DEFAULT '' COMMENT '单位',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='合同产品关系表';

/*Data for the table `72crm_crm_contract_product` */

LOCK TABLES `72crm_crm_contract_product` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_customer` */

DROP TABLE IF EXISTS `72crm_crm_customer`;

CREATE TABLE `72crm_crm_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL COMMENT '客户名称',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1锁定',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `deal_status` varchar(100) DEFAULT '未成交' COMMENT '成交状态',
  `telephone` varchar(255) DEFAULT '' COMMENT '电话',
  `website` varchar(500) DEFAULT '' COMMENT '网址',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `create_user_id` int(10) DEFAULT NULL COMMENT '创建人ID',
  `owner_user_id` int(10) DEFAULT NULL COMMENT '负责人ID',
  `ro_user_id` longtext COMMENT '只读权限',
  `rw_user_id` longtext COMMENT '读写权限',
  `address` varchar(255) DEFAULT '' COMMENT '省市区',
  `location` varchar(255) DEFAULT '' COMMENT '定位信息',
  `detail_address` varchar(255) DEFAULT '' COMMENT '详细地址',
  `lng` varchar(255) DEFAULT '' COMMENT '地理位置经度',
  `lat` varchar(255) DEFAULT '' COMMENT '地理位置维度',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次 比如附件批次',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='客户表';

/*Data for the table `72crm_crm_customer` */

LOCK TABLES `72crm_crm_customer` WRITE;

insert  into `72crm_crm_customer`(`customer_id`,`customer_name`,`is_lock`,`next_time`,`deal_status`,`telephone`,`website`,`remark`,`create_user_id`,`owner_user_id`,`ro_user_id`,`rw_user_id`,`address`,`location`,`detail_address`,`lng`,`lat`,`create_time`,`update_time`,`batch_id`) values (89,'李帅',0,'2019-07-02 10:14:12','未成交','13133445566','','重要客户',3,3,',',',','山东省,济南市,历下区','','','','','2019-07-02 10:14:28','2019-07-02 10:16:02','f4fa9230100c4616801c1ec4a876e8d8');

UNLOCK TABLES;

/*Table structure for table `72crm_crm_customer_stats` */

DROP TABLE IF EXISTS `72crm_crm_customer_stats`;

CREATE TABLE `72crm_crm_customer_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL COMMENT '用户id',
  `customer_num` int(10) NOT NULL DEFAULT '0' COMMENT '客户总数',
  `create_time` datetime NOT NULL COMMENT '统计时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='每日客户统计';

/*Data for the table `72crm_crm_customer_stats` */

LOCK TABLES `72crm_crm_customer_stats` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_leads` */

DROP TABLE IF EXISTS `72crm_crm_leads`;

CREATE TABLE `72crm_crm_leads` (
  `leads_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_transform` tinyint(1) DEFAULT '0' COMMENT '1已转化 0 未转化',
  `leads_name` varchar(255) NOT NULL COMMENT '线索名称',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `next_time` datetime DEFAULT NULL COMMENT '下次联系时间',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `address` varchar(500) DEFAULT '' COMMENT '地址',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  `owner_user_id` int(11) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次 比如附件批次',
  PRIMARY KEY (`leads_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='线索表';

/*Data for the table `72crm_crm_leads` */

LOCK TABLES `72crm_crm_leads` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_owner_record` */

DROP TABLE IF EXISTS `72crm_crm_owner_record`;

CREATE TABLE `72crm_crm_owner_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL COMMENT '对象id',
  `type` int(4) NOT NULL COMMENT '对象类型',
  `pre_owner_user_id` int(20) DEFAULT NULL COMMENT '上一负责人',
  `post_owner_user_id` int(20) DEFAULT NULL COMMENT '接手负责人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='负责人变更记录表';

/*Data for the table `72crm_crm_owner_record` */

LOCK TABLES `72crm_crm_owner_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_product` */

DROP TABLE IF EXISTS `72crm_crm_product`;

CREATE TABLE `72crm_crm_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '产品名称',
  `num` varchar(255) DEFAULT NULL COMMENT '产品编码',
  `unit` varchar(255) DEFAULT NULL COMMENT '单位',
  `price` decimal(18,2) DEFAULT NULL COMMENT '价格',
  `status` int(1) DEFAULT NULL COMMENT '状态 1 上架 0 下架',
  `category_id` int(11) DEFAULT NULL COMMENT '产品分类ID',
  `description` text COMMENT '产品描述',
  `create_user_id` int(10) NOT NULL COMMENT '创建人ID',
  `owner_user_id` int(10) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) NOT NULL COMMENT '批次',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='产品表';

/*Data for the table `72crm_crm_product` */

LOCK TABLES `72crm_crm_product` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_product_category` */

DROP TABLE IF EXISTS `72crm_crm_product_category`;

CREATE TABLE `72crm_crm_product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='产品分类表';

/*Data for the table `72crm_crm_product_category` */

LOCK TABLES `72crm_crm_product_category` WRITE;

insert  into `72crm_crm_product_category`(`category_id`,`name`,`pid`) values (23,'默认',0);

UNLOCK TABLES;

/*Table structure for table `72crm_crm_receivables` */

DROP TABLE IF EXISTS `72crm_crm_receivables`;

CREATE TABLE `72crm_crm_receivables` (
  `receivables_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回款ID',
  `number` varchar(100) DEFAULT NULL COMMENT '回款编号',
  `plan_id` int(11) DEFAULT NULL COMMENT '回款计划ID',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `contract_id` int(11) DEFAULT NULL COMMENT '合同ID',
  `check_status` int(4) DEFAULT NULL COMMENT '0待审核、1审核中、2审核通过、3审核未通过 4:已撤回',
  `examine_record_id` int(11) DEFAULT NULL COMMENT '审核记录ID',
  `return_time` date DEFAULT NULL COMMENT '回款日期',
  `return_type` varchar(100) DEFAULT NULL COMMENT '回款方式',
  `money` decimal(18,2) DEFAULT NULL COMMENT '回款金额',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  `owner_user_id` int(11) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `batch_id` varchar(32) NOT NULL COMMENT '批次',
  PRIMARY KEY (`receivables_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='回款表';

/*Data for the table `72crm_crm_receivables` */

LOCK TABLES `72crm_crm_receivables` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_crm_receivables_plan` */

DROP TABLE IF EXISTS `72crm_crm_receivables_plan`;

CREATE TABLE `72crm_crm_receivables_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(100) DEFAULT NULL COMMENT '期数',
  `receivables_id` int(11) DEFAULT NULL COMMENT '回款ID',
  `status` tinyint(4) DEFAULT NULL COMMENT '1完成 0 未完成',
  `money` decimal(18,2) DEFAULT NULL COMMENT '计划回款金额',
  `return_date` datetime DEFAULT NULL COMMENT '计划回款日期',
  `return_type` varchar(255) DEFAULT NULL COMMENT '计划回款方式',
  `remind` tinyint(4) DEFAULT NULL COMMENT '提前几天提醒',
  `remind_date` datetime DEFAULT NULL COMMENT '提醒日期',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  `owner_user_id` int(11) DEFAULT NULL COMMENT '负责人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `file_batch` varchar(32) DEFAULT NULL COMMENT '附件批次ID',
  `contract_id` int(11) NOT NULL COMMENT '合同ID',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='回款计划表';

/*Data for the table `72crm_crm_receivables_plan` */

LOCK TABLES `72crm_crm_receivables_plan` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_action_record` */

DROP TABLE IF EXISTS `72crm_oa_action_record`;

CREATE TABLE `72crm_oa_action_record` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '操作人ID',
  `type` int(1) NOT NULL COMMENT '操作类型',
  `action_id` int(10) DEFAULT NULL COMMENT '操作对象id',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  `join_user_ids` varchar(100) DEFAULT NULL COMMENT '抄送人IDs',
  `dept_ids` varchar(100) DEFAULT NULL COMMENT '抄送部门IDs',
  `content` varchar(500) NOT NULL COMMENT '操作内容',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8 COMMENT='oa操作记录表';

/*Data for the table `72crm_oa_action_record` */

LOCK TABLES `72crm_oa_action_record` WRITE;

insert  into `72crm_oa_action_record`(`log_id`,`user_id`,`type`,`action_id`,`create_time`,`join_user_ids`,`dept_ids`,`content`) values (610,3,3,53,'2019-07-02 09:48:30',',3,3,',',1,','添加了公告');

UNLOCK TABLES;

/*Table structure for table `72crm_oa_announcement` */

DROP TABLE IF EXISTS `72crm_oa_announcement`;

CREATE TABLE `72crm_oa_announcement` (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `create_user_id` int(10) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `dept_ids` varchar(100) DEFAULT NULL COMMENT '通知部门',
  `owner_user_ids` varchar(100) DEFAULT NULL COMMENT '通知人',
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='公告表';

/*Data for the table `72crm_oa_announcement` */

LOCK TABLES `72crm_oa_announcement` WRITE;

insert  into `72crm_oa_announcement`(`announcement_id`,`title`,`content`,`create_user_id`,`create_time`,`update_time`,`start_time`,`end_time`,`dept_ids`,`owner_user_ids`) values (53,'10周年表彰大会','所有员工都必须参加',3,'2019-07-02 09:48:30',NULL,'2019-07-02 00:00:00','2019-07-04 00:00:00','',',3,');

UNLOCK TABLES;

/*Table structure for table `72crm_oa_event` */

DROP TABLE IF EXISTS `72crm_oa_event`;

CREATE TABLE `72crm_oa_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `type` int(2) DEFAULT NULL COMMENT '0不提醒1每天2每周3每月4每年',
  `owner_user_ids` varchar(100) DEFAULT NULL COMMENT '参与人',
  `address` varchar(100) DEFAULT NULL COMMENT '地点',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '颜色',
  `remind_type` tinyint(11) DEFAULT NULL COMMENT '提醒时间0准时提醒 1：5分钟前 2：15分钟前 3：30分钟前 4：一个小时前 5：两个小时前 6：一天前 7：两天前 8：一周前',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='日程表';

/*Data for the table `72crm_oa_event` */

LOCK TABLES `72crm_oa_event` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_event_notice` */

DROP TABLE IF EXISTS `72crm_oa_event_notice`;

CREATE TABLE `72crm_oa_event_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL COMMENT '日程ID',
  `noticetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '1天 2周 3月 4年 0不提醒',
  `repeat` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `stop_time` int(11) NOT NULL COMMENT '介绍时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='日程提醒设置表';

/*Data for the table `72crm_oa_event_notice` */

LOCK TABLES `72crm_oa_event_notice` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_event_relation` */

DROP TABLE IF EXISTS `72crm_oa_event_relation`;

CREATE TABLE `72crm_oa_event_relation` (
  `eventrelation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日程关联业务表',
  `event_id` int(11) NOT NULL COMMENT '日程ID',
  `customer_ids` varchar(200) DEFAULT NULL COMMENT '客户IDs',
  `contacts_ids` varchar(200) DEFAULT NULL COMMENT '联系人IDs',
  `business_ids` varchar(200) DEFAULT NULL COMMENT '商机IDs',
  `contract_ids` varchar(200) DEFAULT NULL COMMENT '合同IDs',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态1可用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`eventrelation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='日程关联业务表';

/*Data for the table `72crm_oa_event_relation` */

LOCK TABLES `72crm_oa_event_relation` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_examine` */

DROP TABLE IF EXISTS `72crm_oa_examine`;

CREATE TABLE `72crm_oa_examine` (
  `examine_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '1' COMMENT '审批类型',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `type_id` varchar(32) DEFAULT NULL COMMENT '请假类型',
  `money` decimal(18,2) DEFAULT NULL COMMENT '差旅、报销总金额',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `duration` decimal(4,1) DEFAULT NULL COMMENT '时长',
  `create_user_id` int(10) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '附件批次id',
  PRIMARY KEY (`examine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='审批表';

/*Data for the table `72crm_oa_examine` */

LOCK TABLES `72crm_oa_examine` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_examine_category` */

DROP TABLE IF EXISTS `72crm_oa_examine_category`;

CREATE TABLE `72crm_oa_examine_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '名称',
  `remarks` varchar(500) DEFAULT NULL COMMENT '描述',
  `create_user_id` int(10) DEFAULT NULL COMMENT '创建人ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '1启用，0禁用',
  `is_sys` tinyint(1) DEFAULT NULL COMMENT '1为系统类型，不能删除',
  `examine_type` tinyint(1) DEFAULT NULL COMMENT '1固定2自选',
  `user_ids` varchar(500) DEFAULT NULL COMMENT '可见范围（员工）',
  `dept_ids` varchar(500) DEFAULT NULL COMMENT '可见范围（部门）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '1已删除',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_user_id` int(11) DEFAULT NULL COMMENT '删除人ID',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='审批类型表';

/*Data for the table `72crm_oa_examine_category` */

LOCK TABLES `72crm_oa_examine_category` WRITE;

insert  into `72crm_oa_examine_category`(`category_id`,`title`,`remarks`,`create_user_id`,`status`,`is_sys`,`examine_type`,`user_ids`,`dept_ids`,`create_time`,`update_time`,`is_deleted`,`delete_time`,`delete_user_id`) values (1,'普通审批','普通审批',3,1,1,2,'','','2019-04-26 15:06:34','2019-04-26 15:06:34',0,NULL,NULL);
insert  into `72crm_oa_examine_category`(`category_id`,`title`,`remarks`,`create_user_id`,`status`,`is_sys`,`examine_type`,`user_ids`,`dept_ids`,`create_time`,`update_time`,`is_deleted`,`delete_time`,`delete_user_id`) values (2,'请假审批','请假审批',3,1,1,2,'','','2019-04-17 18:52:44','2019-04-17 18:52:44',0,NULL,NULL);
insert  into `72crm_oa_examine_category`(`category_id`,`title`,`remarks`,`create_user_id`,`status`,`is_sys`,`examine_type`,`user_ids`,`dept_ids`,`create_time`,`update_time`,`is_deleted`,`delete_time`,`delete_user_id`) values (3,'出差审批','出差审批',3,1,1,2,'','','2019-04-17 18:52:50','2019-04-17 18:52:50',0,NULL,NULL);
insert  into `72crm_oa_examine_category`(`category_id`,`title`,`remarks`,`create_user_id`,`status`,`is_sys`,`examine_type`,`user_ids`,`dept_ids`,`create_time`,`update_time`,`is_deleted`,`delete_time`,`delete_user_id`) values (4,'加班审批','加班审批',3,1,1,2,'','','2019-04-17 18:52:59','2019-04-17 18:52:59',0,NULL,NULL);
insert  into `72crm_oa_examine_category`(`category_id`,`title`,`remarks`,`create_user_id`,`status`,`is_sys`,`examine_type`,`user_ids`,`dept_ids`,`create_time`,`update_time`,`is_deleted`,`delete_time`,`delete_user_id`) values (5,'差旅报销','差旅报销',3,1,1,2,'','','2019-04-17 18:53:13','2019-04-17 18:53:13',0,NULL,NULL);
insert  into `72crm_oa_examine_category`(`category_id`,`title`,`remarks`,`create_user_id`,`status`,`is_sys`,`examine_type`,`user_ids`,`dept_ids`,`create_time`,`update_time`,`is_deleted`,`delete_time`,`delete_user_id`) values (6,'借款申请','借款申请',3,1,1,2,'','','2019-04-17 18:54:44','2019-04-17 18:54:44',0,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `72crm_oa_examine_log` */

DROP TABLE IF EXISTS `72crm_oa_examine_log`;

CREATE TABLE `72crm_oa_examine_log` (
  `log_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `record_id` int(11) DEFAULT NULL COMMENT '审批记录ID',
  `examine_step_id` bigint(20) DEFAULT NULL COMMENT '审核步骤ID',
  `examine_status` int(1) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝4 撤回审核',
  `create_user` bigint(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `examine_user` bigint(20) DEFAULT NULL COMMENT '审核人',
  `examine_time` datetime DEFAULT NULL COMMENT '审核时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `is_recheck` int(1) DEFAULT '0' COMMENT '是否是撤回之前的日志 0或者null为新数据 1：撤回之前的数据',
  `order_id` int(30) DEFAULT NULL COMMENT '排序id',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COMMENT='审核日志表';

/*Data for the table `72crm_oa_examine_log` */

LOCK TABLES `72crm_oa_examine_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_examine_record` */

DROP TABLE IF EXISTS `72crm_oa_examine_record`;

CREATE TABLE `72crm_oa_examine_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审核记录ID',
  `examine_id` int(11) DEFAULT NULL COMMENT '审批ID',
  `examine_step_id` bigint(20) DEFAULT NULL COMMENT '当前进行的审批步骤ID',
  `examine_status` int(1) DEFAULT NULL COMMENT '审核状态 0 未审核 1 审核通过 2 审核拒绝 3 审核中 4 已撤回',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审核备注',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COMMENT='审核记录表';

/*Data for the table `72crm_oa_examine_record` */

LOCK TABLES `72crm_oa_examine_record` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_examine_relation` */

DROP TABLE IF EXISTS `72crm_oa_examine_relation`;

CREATE TABLE `72crm_oa_examine_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审批关联业务表',
  `examine_id` int(11) DEFAULT NULL COMMENT '审批ID',
  `customer_ids` varchar(20) DEFAULT NULL COMMENT '客户IDs',
  `contacts_ids` varchar(20) DEFAULT NULL COMMENT '联系人IDs',
  `business_ids` varchar(20) DEFAULT NULL COMMENT '商机IDs',
  `contract_ids` varchar(20) DEFAULT NULL COMMENT '合同IDs',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态1可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='审批关联业务表';

/*Data for the table `72crm_oa_examine_relation` */

LOCK TABLES `72crm_oa_examine_relation` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_examine_step` */

DROP TABLE IF EXISTS `72crm_oa_examine_step`;

CREATE TABLE `72crm_oa_examine_step` (
  `step_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `step_type` int(1) DEFAULT NULL COMMENT '步骤类型1、负责人主管，2、指定用户（任意一人），3、指定用户（多人会签）,4、上一级审批人主管',
  `category_id` int(11) NOT NULL COMMENT '审批ID',
  `check_user_id` varchar(500) DEFAULT NULL COMMENT '审批人ID (使用逗号隔开) ,1,2,',
  `step_num` int(2) DEFAULT '1' COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`step_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='审批步骤表';

/*Data for the table `72crm_oa_examine_step` */

LOCK TABLES `72crm_oa_examine_step` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_examine_travel` */

DROP TABLE IF EXISTS `72crm_oa_examine_travel`;

CREATE TABLE `72crm_oa_examine_travel` (
  `travel_id` int(11) NOT NULL AUTO_INCREMENT,
  `examine_id` int(11) NOT NULL COMMENT '审批ID',
  `start_address` varchar(100) DEFAULT NULL COMMENT '出发地',
  `start_time` datetime DEFAULT NULL COMMENT '出发时间',
  `end_address` varchar(100) DEFAULT NULL COMMENT '目的地',
  `end_time` datetime DEFAULT NULL COMMENT '到达时间',
  `traffic` decimal(18,2) DEFAULT NULL COMMENT '交通费',
  `stay` decimal(18,2) DEFAULT NULL COMMENT '住宿费',
  `diet` decimal(18,2) DEFAULT NULL COMMENT '餐饮费',
  `other` decimal(18,2) DEFAULT NULL COMMENT '其他费用',
  `money` decimal(18,2) DEFAULT NULL COMMENT '金额',
  `vehicle` varchar(255) DEFAULT NULL COMMENT '交通工具',
  `trip` varchar(50) DEFAULT NULL COMMENT '单程往返（单程、往返）',
  `duration` decimal(4,1) DEFAULT NULL COMMENT '时长',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `batch_id` varchar(32) DEFAULT NULL COMMENT '批次id',
  PRIMARY KEY (`travel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='差旅行程表';

/*Data for the table `72crm_oa_examine_travel` */

LOCK TABLES `72crm_oa_examine_travel` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_oa_log` */

DROP TABLE IF EXISTS `72crm_oa_log`;

CREATE TABLE `72crm_oa_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` tinyint(2) NOT NULL DEFAULT '1' COMMENT '日志类型（1日报，2周报，3月报）',
  `title` varchar(50) DEFAULT NULL COMMENT '日志标题',
  `content` text COMMENT '日志内容',
  `tomorrow` varchar(1000) DEFAULT NULL COMMENT '明日工作内容',
  `question` varchar(1000) DEFAULT NULL COMMENT '遇到问题',
  `create_user_id` int(11) NOT NULL COMMENT '创建人ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `send_user_ids` varchar(100) DEFAULT NULL COMMENT '通知人',
  `send_dept_ids` varchar(100) DEFAULT NULL COMMENT '通知部门',
  `read_user_ids` varchar(255) DEFAULT NULL COMMENT '已读人',
  `batch_id` varchar(50) DEFAULT NULL COMMENT '文件批次ID',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='工作日志表';

/*Data for the table `72crm_oa_log` */

LOCK TABLES `72crm_oa_log` WRITE;

insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (50,1,NULL,'哈哈哈哈','你好呀',NULL,3,'2019-05-06 15:09:07','2019-05-08 13:45:34','','',',3,7,31,','addb9ac3f2343eb412489a0ccbfe2e0a');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (52,1,NULL,'二分','而奋斗过的','的给别人发',3,'2019-05-08 13:44:08','2019-05-08 13:54:26','','',',3,7,31,','f4da45082a872d6346ebb99d6271d6f4');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (53,1,NULL,'测试','测试','测试',31,'2019-05-08 13:46:52','2019-05-08 13:54:26','','',',3,7,31,','cff010acdb875f8541220ae79a3e052c');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (54,1,NULL,'sad','happy','no',31,'2019-05-08 14:02:10','2019-05-08 14:05:40','','',',3,7,31,','d12f7f3d3060734f0fa6d1ad400b5162');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (55,1,NULL,'no ','no','no',31,'2019-05-08 14:04:49','2019-05-08 14:05:40','3','',',3,7,31,','c03c0a7dc6e7283a82c9fbd7905f4e57');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (56,1,NULL,'hahahaha','hahahaha','hahahaha',3,'2019-05-08 14:08:41','2019-05-08 16:35:06','','',',3,25,7,31,','6f677e1cc136930d88e947fe7080c778');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (57,1,NULL,'大家好，我是渣渣辉','贪玩蓝月，真特么好玩',NULL,7,'2019-05-08 14:06:08','2019-05-08 16:35:06','','',',3,25,7,31,','56217c507a94634d2c62fbdaca86f828');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (58,1,NULL,'哦豁',NULL,NULL,7,'2019-05-08 14:09:32','2019-05-08 16:35:06','7','',',3,25,7,31,','4068c3467463f9a14213b0136395653e');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (60,1,NULL,'意外',NULL,NULL,7,'2019-05-08 14:16:21','2019-05-08 16:35:06',',1,2,7,',',16,34,',',3,25,7,31,','876d08cbd00adcb4f0bd8ff4d87a1740');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (61,1,NULL,'撒打算打打','多少度','大萨达撒啊',25,'2019-05-08 16:35:46','2019-05-08 18:10:04','','',',25,3,7,','aba43d52a999d7de57d81198525b3413');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (62,1,NULL,'222','333','444',3,'2019-05-08 16:37:16','2019-05-08 18:10:04','','',',25,3,7,','c4fad7d460b99e5e03a51f90753c7b1a');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (63,1,NULL,'312','321','321',3,'2019-05-09 14:05:58','2019-05-09 16:07:10',',,',',,',',3,7,','818855c59b06834249b289bb66f3bee0');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (64,1,NULL,'1231231321123',NULL,NULL,3,'2019-05-09 14:09:52','2019-05-09 16:07:09',',,',',,',',3,7,','940711a58fe410bd7ea51aded273a637');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (65,1,NULL,'132','213','123',3,'2019-05-09 14:45:21','2019-05-09 14:46:44',',,',',,',',3,','34cfc8af01225e98feeb5e23af5a4a80');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (66,1,NULL,'111','222','111',3,'2019-05-09 15:30:24','2019-05-09 15:40:26',',,',',,',',3,','ddae0bd93f0bc1b553a6495a74b383a2');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (67,1,NULL,'哦豁','天气晴朗',NULL,7,'2019-05-09 16:26:32','2019-05-09 16:30:06',',7,6,',',,',',3,7,','89a9a42a581c9f78cefa5714dc320a2c');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (68,1,NULL,'111','222','111',31,'2019-05-09 16:32:37','2019-05-10 13:51:29',',3,',',,',',3,31,','6de4f44f282f572fe616cc0f86efe561');
insert  into `72crm_oa_log`(`log_id`,`category_id`,`title`,`content`,`tomorrow`,`question`,`create_user_id`,`create_time`,`update_time`,`send_user_ids`,`send_dept_ids`,`read_user_ids`,`batch_id`) values (69,1,NULL,'今天主要测试java版本F3啦啦啦','今天主要测试java版本F3','暂无',3,'2019-05-11 11:39:24','2019-05-11 13:48:40',',,',',,',',3,','975d6ba402d65d00f487c1eb1b057761');

UNLOCK TABLES;

/*Table structure for table `72crm_oa_log_relation` */

DROP TABLE IF EXISTS `72crm_oa_log_relation`;

CREATE TABLE `72crm_oa_log_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志关联业务表',
  `log_id` int(11) DEFAULT NULL COMMENT '日志ID',
  `customer_ids` varchar(512) DEFAULT NULL COMMENT '客户IDs',
  `contacts_ids` varchar(512) DEFAULT NULL COMMENT '联系人IDs',
  `business_ids` varchar(512) DEFAULT NULL COMMENT '商机IDs',
  `contract_ids` varchar(512) DEFAULT NULL COMMENT '合同IDs',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态1可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='日志关联业务表';

/*Data for the table `72crm_oa_log_relation` */

LOCK TABLES `72crm_oa_log_relation` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_task` */

DROP TABLE IF EXISTS `72crm_task`;

CREATE TABLE `72crm_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务表',
  `name` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `main_user_id` int(11) DEFAULT NULL COMMENT '负责人ID',
  `owner_user_id` varchar(255) DEFAULT NULL COMMENT '团队成员ID',
  `create_time` datetime DEFAULT NULL COMMENT '新建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '完成状态 1正在进行2延期3归档 5结束',
  `class_id` int(5) DEFAULT '0' COMMENT '分类id',
  `lable_id` varchar(255) DEFAULT NULL COMMENT '标签 ,号拼接',
  `description` text COMMENT '描述',
  `pid` int(11) DEFAULT '0' COMMENT '上级ID',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `stop_time` datetime DEFAULT NULL COMMENT '结束时间',
  `priority` tinyint(2) DEFAULT NULL COMMENT '优先级 从大到小 3高 2中 1低',
  `work_id` int(11) DEFAULT '0' COMMENT '项目ID',
  `is_top` tinyint(2) DEFAULT '0' COMMENT '工作台展示 0收件箱 1今天要做，2下一步要做，3以后要做',
  `is_open` tinyint(2) DEFAULT '1' COMMENT '是否公开',
  `order_num` tinyint(4) DEFAULT NULL COMMENT '排序ID',
  `top_order_num` tinyint(4) DEFAULT NULL COMMENT '我的任务排序ID',
  `archive_time` datetime DEFAULT NULL COMMENT '归档时间',
  `ishidden` tinyint(2) DEFAULT '0' COMMENT '是否删除 0 未删除 1 删除',
  `hidden_time` datetime DEFAULT NULL COMMENT '删除时间',
  `batch_id` varchar(50) DEFAULT NULL COMMENT '批次',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='任务表';

/*Data for the table `72crm_task` */

LOCK TABLES `72crm_task` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_task_comment` */

DROP TABLE IF EXISTS `72crm_task_comment`;

CREATE TABLE `72crm_task_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表',
  `user_id` int(11) NOT NULL COMMENT '评论人ID',
  `content` varchar(255) DEFAULT NULL COMMENT '内容(答案)',
  `create_time` datetime DEFAULT NULL COMMENT '新建时间',
  `main_id` int(11) DEFAULT '0' COMMENT '主评论的id',
  `pid` int(11) DEFAULT '0' COMMENT '回复对象ID',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 ',
  `type_id` int(11) DEFAULT '0' COMMENT '评论项目任务ID 或评论其他模块ID',
  `favour` int(7) DEFAULT '0' COMMENT '赞',
  `type` tinyint(2) DEFAULT '0' COMMENT '评论分类 1：任务评论  2：日志评论',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='任务评论表';

/*Data for the table `72crm_task_comment` */

LOCK TABLES `72crm_task_comment` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_task_relation` */

DROP TABLE IF EXISTS `72crm_task_relation`;

CREATE TABLE `72crm_task_relation` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务关联业务表',
  `task_id` int(11) DEFAULT NULL COMMENT '任务ID',
  `customer_ids` varchar(50) DEFAULT NULL COMMENT '客户IDs',
  `contacts_ids` varchar(50) DEFAULT NULL COMMENT '联系人IDs',
  `business_ids` varchar(50) DEFAULT NULL COMMENT '商机IDs',
  `contract_ids` varchar(50) DEFAULT NULL COMMENT '合同IDs',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态1可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='任务关联业务表';

/*Data for the table `72crm_task_relation` */

LOCK TABLES `72crm_task_relation` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_work` */

DROP TABLE IF EXISTS `72crm_work`;

CREATE TABLE `72crm_work` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目ID',
  `name` varchar(50) DEFAULT NULL COMMENT '项目名字',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1启用 3归档 2 删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `description` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '描述',
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '颜色',
  `is_open` tinyint(2) DEFAULT '1' COMMENT '是否所有人可见 1 是 0 否',
  `owner_user_id` varchar(50) DEFAULT NULL COMMENT '项目成员',
  `archive_time` datetime DEFAULT NULL COMMENT '归档时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `batch_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目表';

/*Data for the table `72crm_work` */

LOCK TABLES `72crm_work` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_work_relation` */

DROP TABLE IF EXISTS `72crm_work_relation`;

CREATE TABLE `72crm_work_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目关联业务表',
  `work_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `relation_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `relation_type` int(1) DEFAULT NULL COMMENT '关联类型  1 客户 2 联系人 3 商机 4 合同',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态 1 可用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='项目关联业务表';

/*Data for the table `72crm_work_relation` */

LOCK TABLES `72crm_work_relation` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_work_task_class` */

DROP TABLE IF EXISTS `72crm_work_task_class`;

CREATE TABLE `72crm_work_task_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务分类表',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态1正常',
  `work_id` int(11) DEFAULT NULL COMMENT '项目ID',
  `order_num` tinyint(4) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='任务分类表';

/*Data for the table `72crm_work_task_class` */

LOCK TABLES `72crm_work_task_class` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_work_task_lable` */

DROP TABLE IF EXISTS `72crm_work_task_lable`;

CREATE TABLE `72crm_work_task_lable` (
  `lable_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '标签名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建人ID',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态',
  `color` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '颜色',
  PRIMARY KEY (`lable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='任务标签表';

/*Data for the table `72crm_work_task_lable` */

LOCK TABLES `72crm_work_task_lable` WRITE;

UNLOCK TABLES;

/*Table structure for table `72crm_work_task_log` */

DROP TABLE IF EXISTS `72crm_work_task_log`;

CREATE TABLE `72crm_work_task_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目日志表',
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 4删除',
  `task_id` int(11) DEFAULT '0' COMMENT '任务ID',
  `work_id` int(11) DEFAULT '0' COMMENT '项目ID',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8 COMMENT='任务日志表';

/*Data for the table `72crm_work_task_log` */

LOCK TABLES `72crm_work_task_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `businessview` */

DROP TABLE IF EXISTS `businessview`;

/*!50001 DROP VIEW IF EXISTS `businessview` */;
/*!50001 DROP TABLE IF EXISTS `businessview` */;

/*!50001 CREATE TABLE  `businessview`(
 `business_id` int(11) ,
 `type_id` int(11) ,
 `status_id` int(11) ,
 `next_time` datetime ,
 `customer_id` int(11) ,
 `deal_date` datetime ,
 `business_name` varchar(50) ,
 `money` decimal(18,2) ,
 `discount_rate` decimal(10,2) ,
 `remark` varchar(500) ,
 `create_user_id` int(10) ,
 `owner_user_id` int(10) ,
 `create_time` datetime ,
 `update_time` datetime ,
 `batch_id` varchar(32) ,
 `ro_user_id` longtext ,
 `rw_user_id` longtext ,
 `is_end` tinyint(4) ,
 `status_remark` varchar(500) ,
 `create_user_name` varchar(100) ,
 `owner_user_name` varchar(100) ,
 `customer_name` varchar(255) ,
 `type_name` varchar(50) ,
 `status_name` varchar(50) 
)*/;

/*Table structure for table `contactsview` */

DROP TABLE IF EXISTS `contactsview`;

/*!50001 DROP VIEW IF EXISTS `contactsview` */;
/*!50001 DROP TABLE IF EXISTS `contactsview` */;

/*!50001 CREATE TABLE  `contactsview`(
 `contacts_id` int(11) ,
 `name` varchar(50) ,
 `next_time` datetime ,
 `mobile` varchar(255) ,
 `telephone` varchar(255) ,
 `email` varchar(255) ,
 `post` varchar(255) ,
 `customer_id` int(11) ,
 `address` varchar(500) ,
 `remark` varchar(500) ,
 `create_user_id` int(10) ,
 `owner_user_id` int(11) ,
 `create_time` datetime ,
 `update_time` datetime ,
 `batch_id` varchar(32) ,
 `contacts_name` varchar(50) ,
 `create_user_name` varchar(100) ,
 `owner_user_name` varchar(100) ,
 `customer_name` varchar(255) ,
 `是否关键决策人` longtext ,
 `性别` longtext 
)*/;

/*Table structure for table `contractview` */

DROP TABLE IF EXISTS `contractview`;

/*!50001 DROP VIEW IF EXISTS `contractview` */;
/*!50001 DROP TABLE IF EXISTS `contractview` */;

/*!50001 CREATE TABLE  `contractview`(
 `contract_id` int(11) ,
 `name` varchar(50) ,
 `customer_id` int(11) ,
 `business_id` int(11) ,
 `check_status` int(4) ,
 `examine_record_id` int(11) ,
 `order_date` datetime ,
 `create_user_id` int(10) ,
 `owner_user_id` int(10) ,
 `create_time` datetime ,
 `update_time` datetime ,
 `num` varchar(255) ,
 `start_time` datetime ,
 `end_time` datetime ,
 `money` decimal(18,2) ,
 `discount_rate` decimal(10,2) ,
 `types` varchar(255) ,
 `payment_type` varchar(255) ,
 `batch_id` varchar(32) ,
 `ro_user_id` longtext ,
 `rw_user_id` longtext ,
 `contacts_id` int(11) ,
 `remark` varchar(255) ,
 `company_user_id` int(11) ,
 `create_user_name` varchar(100) ,
 `owner_user_name` varchar(100) ,
 `customer_name` varchar(255) ,
 `business_name` varchar(50) ,
 `contacts_name` varchar(50) ,
 `company_user_name` varchar(100) ,
 `部门` varchar(64) 
)*/;

/*Table structure for table `customerview` */

DROP TABLE IF EXISTS `customerview`;

/*!50001 DROP VIEW IF EXISTS `customerview` */;
/*!50001 DROP TABLE IF EXISTS `customerview` */;

/*!50001 CREATE TABLE  `customerview`(
 `customer_id` int(11) ,
 `customer_name` varchar(255) ,
 `is_lock` tinyint(1) ,
 `next_time` datetime ,
 `deal_status` varchar(100) ,
 `telephone` varchar(255) ,
 `website` varchar(500) ,
 `remark` varchar(500) ,
 `create_user_id` int(10) ,
 `owner_user_id` int(10) ,
 `ro_user_id` longtext ,
 `rw_user_id` longtext ,
 `address` varchar(255) ,
 `location` varchar(255) ,
 `detail_address` varchar(255) ,
 `lng` varchar(255) ,
 `lat` varchar(255) ,
 `create_time` datetime ,
 `update_time` datetime ,
 `batch_id` varchar(32) ,
 `create_user_name` varchar(100) ,
 `owner_user_name` varchar(100) ,
 `客户级别` longtext ,
 `客户来源` longtext ,
 `客户行业` longtext 
)*/;

/*Table structure for table `leadsview` */

DROP TABLE IF EXISTS `leadsview`;

/*!50001 DROP VIEW IF EXISTS `leadsview` */;
/*!50001 DROP TABLE IF EXISTS `leadsview` */;

/*!50001 CREATE TABLE  `leadsview`(
 `leads_id` int(11) ,
 `is_transform` tinyint(1) ,
 `leads_name` varchar(255) ,
 `customer_id` int(11) ,
 `next_time` datetime ,
 `telephone` varchar(20) ,
 `mobile` varchar(50) ,
 `address` varchar(500) ,
 `remark` varchar(50) ,
 `create_user_id` int(11) ,
 `owner_user_id` int(11) ,
 `create_time` datetime ,
 `update_time` datetime ,
 `batch_id` varchar(32) ,
 `create_user_name` varchar(100) ,
 `owner_user_name` varchar(100) ,
 `线索来源` longtext ,
 `客户行业` longtext ,
 `客户级别` longtext ,
 `部门` varchar(64) 
)*/;

/*Table structure for table `productview` */

DROP TABLE IF EXISTS `productview`;

/*!50001 DROP VIEW IF EXISTS `productview` */;
/*!50001 DROP TABLE IF EXISTS `productview` */;

/*!50001 CREATE TABLE  `productview`(
 `product_id` int(11) ,
 `name` varchar(255) ,
 `num` varchar(255) ,
 `unit` varchar(255) ,
 `price` decimal(18,2) ,
 `status` int(1) ,
 `category_id` int(11) ,
 `description` text ,
 `create_user_id` int(10) ,
 `owner_user_id` int(10) ,
 `create_time` datetime ,
 `update_time` datetime ,
 `batch_id` varchar(32) ,
 `create_user_name` varchar(100) ,
 `owner_user_name` varchar(100) ,
 `category_name` varchar(200) ,
 `是否上下架` longtext ,
 `单位` longtext ,
 `产品颜色` longtext 
)*/;

/*Table structure for table `receivablesview` */

DROP TABLE IF EXISTS `receivablesview`;

/*!50001 DROP VIEW IF EXISTS `receivablesview` */;
/*!50001 DROP TABLE IF EXISTS `receivablesview` */;

/*!50001 CREATE TABLE  `receivablesview`(
 `receivables_id` int(11) ,
 `number` varchar(100) ,
 `plan_id` int(11) ,
 `customer_id` int(11) ,
 `contract_id` int(11) ,
 `check_status` int(4) ,
 `examine_record_id` int(11) ,
 `return_time` date ,
 `return_type` varchar(100) ,
 `money` decimal(18,2) ,
 `remark` varchar(500) ,
 `create_user_id` int(11) ,
 `owner_user_id` int(11) ,
 `create_time` datetime ,
 `update_time` datetime ,
 `remarks` varchar(255) ,
 `batch_id` varchar(32) ,
 `create_user_name` varchar(100) ,
 `owner_user_name` varchar(100) ,
 `customer_name` varchar(255) ,
 `contract_name` varchar(50) ,
 `contract_num` varchar(255) ,
 `plan_num` varchar(100) ,
 `回款方式` longtext 
)*/;

/*View structure for view businessview */

/*!50001 DROP TABLE IF EXISTS `businessview` */;
/*!50001 DROP VIEW IF EXISTS `businessview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `businessview` AS select `a`.`business_id` AS `business_id`,`a`.`type_id` AS `type_id`,`a`.`status_id` AS `status_id`,`a`.`next_time` AS `next_time`,`a`.`customer_id` AS `customer_id`,`a`.`deal_date` AS `deal_date`,`a`.`business_name` AS `business_name`,`a`.`money` AS `money`,`a`.`discount_rate` AS `discount_rate`,`a`.`remark` AS `remark`,`a`.`create_user_id` AS `create_user_id`,`a`.`owner_user_id` AS `owner_user_id`,`a`.`create_time` AS `create_time`,`a`.`update_time` AS `update_time`,`a`.`batch_id` AS `batch_id`,`a`.`ro_user_id` AS `ro_user_id`,`a`.`rw_user_id` AS `rw_user_id`,`a`.`is_end` AS `is_end`,`a`.`status_remark` AS `status_remark`,`b`.`realname` AS `create_user_name`,`c`.`realname` AS `owner_user_name`,`d`.`customer_name` AS `customer_name`,`e`.`name` AS `type_name`,`f`.`name` AS `status_name` from (((((`72crm_crm_business` `a` left join `72crm_admin_user` `b` on((`a`.`create_user_id` = `b`.`user_id`))) left join `72crm_admin_user` `c` on((`a`.`owner_user_id` = `c`.`user_id`))) left join `72crm_crm_customer` `d` on((`a`.`customer_id` = `d`.`customer_id`))) left join `72crm_crm_business_type` `e` on((`a`.`type_id` = `e`.`type_id`))) left join `72crm_crm_business_status` `f` on((`a`.`status_id` = `f`.`status_id`))) */;

/*View structure for view contactsview */

/*!50001 DROP TABLE IF EXISTS `contactsview` */;
/*!50001 DROP VIEW IF EXISTS `contactsview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `contactsview` AS select `a`.`contacts_id` AS `contacts_id`,`a`.`name` AS `name`,`a`.`next_time` AS `next_time`,`a`.`mobile` AS `mobile`,`a`.`telephone` AS `telephone`,`a`.`email` AS `email`,`a`.`post` AS `post`,`a`.`customer_id` AS `customer_id`,`a`.`address` AS `address`,`a`.`remark` AS `remark`,`a`.`create_user_id` AS `create_user_id`,`a`.`owner_user_id` AS `owner_user_id`,`a`.`create_time` AS `create_time`,`a`.`update_time` AS `update_time`,`a`.`batch_id` AS `batch_id`,`a`.`name` AS `contacts_name`,`b`.`realname` AS `create_user_name`,`c`.`realname` AS `owner_user_name`,`d`.`customer_name` AS `customer_name`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '是否关键决策人') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `是否关键决策人`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '性别') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `性别` from (((`72crm_crm_contacts` `a` left join `72crm_admin_user` `b` on((`a`.`create_user_id` = `b`.`user_id`))) left join `72crm_admin_user` `c` on((`a`.`owner_user_id` = `c`.`user_id`))) left join `72crm_crm_customer` `d` on((`a`.`customer_id` = `d`.`customer_id`))) */;

/*View structure for view contractview */

/*!50001 DROP TABLE IF EXISTS `contractview` */;
/*!50001 DROP VIEW IF EXISTS `contractview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `contractview` AS select `a`.`contract_id` AS `contract_id`,`a`.`name` AS `name`,`a`.`customer_id` AS `customer_id`,`a`.`business_id` AS `business_id`,`a`.`check_status` AS `check_status`,`a`.`examine_record_id` AS `examine_record_id`,`a`.`order_date` AS `order_date`,`a`.`create_user_id` AS `create_user_id`,`a`.`owner_user_id` AS `owner_user_id`,`a`.`create_time` AS `create_time`,`a`.`update_time` AS `update_time`,`a`.`num` AS `num`,`a`.`start_time` AS `start_time`,`a`.`end_time` AS `end_time`,`a`.`money` AS `money`,`a`.`discount_rate` AS `discount_rate`,`a`.`types` AS `types`,`a`.`payment_type` AS `payment_type`,`a`.`batch_id` AS `batch_id`,`a`.`ro_user_id` AS `ro_user_id`,`a`.`rw_user_id` AS `rw_user_id`,`a`.`contacts_id` AS `contacts_id`,`a`.`remark` AS `remark`,`a`.`company_user_id` AS `company_user_id`,`b`.`realname` AS `create_user_name`,`c`.`realname` AS `owner_user_name`,`d`.`customer_name` AS `customer_name`,`e`.`business_name` AS `business_name`,`f`.`name` AS `contacts_name`,`g`.`realname` AS `company_user_name`,(select `72crm_admin_dept`.`name` from `72crm_admin_dept` where (`72crm_admin_dept`.`dept_id` = (select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '部门') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1))) AS `部门` from ((((((`72crm_crm_contract` `a` left join `72crm_admin_user` `b` on((`a`.`create_user_id` = `b`.`user_id`))) left join `72crm_admin_user` `c` on((`a`.`owner_user_id` = `c`.`user_id`))) left join `72crm_crm_customer` `d` on((`a`.`customer_id` = `d`.`customer_id`))) left join `72crm_crm_business` `e` on((`a`.`business_id` = `e`.`business_id`))) left join `72crm_crm_contacts` `f` on((`a`.`contacts_id` = `f`.`contacts_id`))) left join `72crm_admin_user` `g` on((`a`.`company_user_id` = `g`.`user_id`))) */;

/*View structure for view customerview */

/*!50001 DROP TABLE IF EXISTS `customerview` */;
/*!50001 DROP VIEW IF EXISTS `customerview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customerview` AS select `a`.`customer_id` AS `customer_id`,`a`.`customer_name` AS `customer_name`,`a`.`is_lock` AS `is_lock`,`a`.`next_time` AS `next_time`,`a`.`deal_status` AS `deal_status`,`a`.`telephone` AS `telephone`,`a`.`website` AS `website`,`a`.`remark` AS `remark`,`a`.`create_user_id` AS `create_user_id`,`a`.`owner_user_id` AS `owner_user_id`,`a`.`ro_user_id` AS `ro_user_id`,`a`.`rw_user_id` AS `rw_user_id`,`a`.`address` AS `address`,`a`.`location` AS `location`,`a`.`detail_address` AS `detail_address`,`a`.`lng` AS `lng`,`a`.`lat` AS `lat`,`a`.`create_time` AS `create_time`,`a`.`update_time` AS `update_time`,`a`.`batch_id` AS `batch_id`,`b`.`realname` AS `create_user_name`,`c`.`realname` AS `owner_user_name`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '客户级别') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `客户级别`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '客户来源') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `客户来源`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '客户行业') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `客户行业` from ((`72crm_crm_customer` `a` left join `72crm_admin_user` `b` on((`a`.`create_user_id` = `b`.`user_id`))) left join `72crm_admin_user` `c` on((`a`.`owner_user_id` = `c`.`user_id`))) */;

/*View structure for view leadsview */

/*!50001 DROP TABLE IF EXISTS `leadsview` */;
/*!50001 DROP VIEW IF EXISTS `leadsview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leadsview` AS select `a`.`leads_id` AS `leads_id`,`a`.`is_transform` AS `is_transform`,`a`.`leads_name` AS `leads_name`,`a`.`customer_id` AS `customer_id`,`a`.`next_time` AS `next_time`,`a`.`telephone` AS `telephone`,`a`.`mobile` AS `mobile`,`a`.`address` AS `address`,`a`.`remark` AS `remark`,`a`.`create_user_id` AS `create_user_id`,`a`.`owner_user_id` AS `owner_user_id`,`a`.`create_time` AS `create_time`,`a`.`update_time` AS `update_time`,`a`.`batch_id` AS `batch_id`,`b`.`realname` AS `create_user_name`,`c`.`realname` AS `owner_user_name`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '线索来源') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `线索来源`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '客户行业') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `客户行业`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '客户级别') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `客户级别`,(select `72crm_admin_dept`.`name` from `72crm_admin_dept` where (`72crm_admin_dept`.`dept_id` = (select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '部门') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1))) AS `部门` from ((`72crm_crm_leads` `a` left join `72crm_admin_user` `b` on((`a`.`create_user_id` = `b`.`user_id`))) left join `72crm_admin_user` `c` on((`a`.`owner_user_id` = `c`.`user_id`))) */;

/*View structure for view productview */

/*!50001 DROP TABLE IF EXISTS `productview` */;
/*!50001 DROP VIEW IF EXISTS `productview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productview` AS select `a`.`product_id` AS `product_id`,`a`.`name` AS `name`,`a`.`num` AS `num`,`a`.`unit` AS `unit`,`a`.`price` AS `price`,`a`.`status` AS `status`,`a`.`category_id` AS `category_id`,`a`.`description` AS `description`,`a`.`create_user_id` AS `create_user_id`,`a`.`owner_user_id` AS `owner_user_id`,`a`.`create_time` AS `create_time`,`a`.`update_time` AS `update_time`,`a`.`batch_id` AS `batch_id`,`b`.`realname` AS `create_user_name`,`c`.`realname` AS `owner_user_name`,`d`.`name` AS `category_name`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '是否上下架') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `是否上下架`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '单位') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `单位`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '产品颜色') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `产品颜色` from (((`72crm_crm_product` `a` left join `72crm_admin_user` `b` on((`a`.`create_user_id` = `b`.`user_id`))) left join `72crm_admin_user` `c` on((`a`.`owner_user_id` = `c`.`user_id`))) left join `72crm_crm_product_category` `d` on((`a`.`category_id` = `d`.`category_id`))) */;

/*View structure for view receivablesview */

/*!50001 DROP TABLE IF EXISTS `receivablesview` */;
/*!50001 DROP VIEW IF EXISTS `receivablesview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `receivablesview` AS select `a`.`receivables_id` AS `receivables_id`,`a`.`number` AS `number`,`a`.`plan_id` AS `plan_id`,`a`.`customer_id` AS `customer_id`,`a`.`contract_id` AS `contract_id`,`a`.`check_status` AS `check_status`,`a`.`examine_record_id` AS `examine_record_id`,`a`.`return_time` AS `return_time`,`a`.`return_type` AS `return_type`,`a`.`money` AS `money`,`a`.`remark` AS `remark`,`a`.`create_user_id` AS `create_user_id`,`a`.`owner_user_id` AS `owner_user_id`,`a`.`create_time` AS `create_time`,`a`.`update_time` AS `update_time`,`a`.`remarks` AS `remarks`,`a`.`batch_id` AS `batch_id`,`b`.`realname` AS `create_user_name`,`c`.`realname` AS `owner_user_name`,`d`.`customer_name` AS `customer_name`,`e`.`name` AS `contract_name`,`e`.`num` AS `contract_num`,`f`.`num` AS `plan_num`,(select `72crm_admin_field`.`value` from `72crm_admin_field` where ((`72crm_admin_field`.`name` = '回款方式') and (`72crm_admin_field`.`batch_id` = convert(`a`.`batch_id` using utf8mb4))) limit 1) AS `回款方式` from (((((`72crm_crm_receivables` `a` left join `72crm_admin_user` `b` on((`a`.`create_user_id` = `b`.`user_id`))) left join `72crm_admin_user` `c` on((`a`.`owner_user_id` = `c`.`user_id`))) left join `72crm_crm_customer` `d` on((`a`.`customer_id` = `d`.`customer_id`))) left join `72crm_crm_contract` `e` on((`a`.`contract_id` = `e`.`contract_id`))) left join `72crm_crm_receivables_plan` `f` on((`a`.`plan_id` = `f`.`plan_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
