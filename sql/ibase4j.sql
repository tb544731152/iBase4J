/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : ibase4j

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-04-27 17:59:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('iBase4J-Scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('iBase4J-Scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('iBase4J-Scheduler', 'SKY-20170110JTA1493192156083', '1493192223666', '20000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id_` bigint(20) NOT NULL COMMENT '部门编号',
  `unit_id` bigint(20) NOT NULL COMMENT '隶属单位',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门编号',
  `sort_no` int(3) DEFAULT NULL COMMENT '排序号',
  `leaf_` int(1) DEFAULT NULL COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '1', 'iBase4J', '0', '1', '0', '1', 'qw', '1', '2016-06-28 18:04:06', '1', '2017-04-25 16:31:37');
INSERT INTO `sys_dept` VALUES ('2', '1', '市场部', '1', '1', '1', '1', 't', '0', '2016-06-28 18:04:06', '0', '2016-06-28 18:04:06');
INSERT INTO `sys_dept` VALUES ('825363166504628224', '1', '技术部', '1', '2', null, null, null, '1', '2017-01-28 23:21:28', '1', '2017-01-28 23:50:51');

-- ----------------------------
-- Table structure for `sys_dic`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dic`;
CREATE TABLE `sys_dic` (
  `id_` bigint(20) NOT NULL,
  `type_` varchar(50) NOT NULL,
  `code_` varchar(50) NOT NULL,
  `code_text` varchar(100) NOT NULL,
  `sort_no` int(2) DEFAULT NULL,
  `editable_` tinyint(1) NOT NULL DEFAULT '1',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(500) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `field_id_code` (`type_`,`code_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典明细表';

-- ----------------------------
-- Records of sys_dic
-- ----------------------------
INSERT INTO `sys_dic` VALUES ('1', 'SEX', '0', '未知', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:13');
INSERT INTO `sys_dic` VALUES ('2', 'SEX', '1', '男', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:12');
INSERT INTO `sys_dic` VALUES ('3', 'SEX', '2', '女', '3', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:11');
INSERT INTO `sys_dic` VALUES ('4', 'LOCKED', '0', '激活', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:11');
INSERT INTO `sys_dic` VALUES ('5', 'LOCKED', '1', '锁定', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:10');
INSERT INTO `sys_dic` VALUES ('6', 'ROLETYPE', '1', '业务角色', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES ('7', 'ROLETYPE', '2', '管理角色', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:09');
INSERT INTO `sys_dic` VALUES ('8', 'ROLETYPE', '3', '系统内置角色', '3', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:08');
INSERT INTO `sys_dic` VALUES ('9', 'LEAF', '0', '树枝节点', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:07');
INSERT INTO `sys_dic` VALUES ('10', 'LEAF', '1', '叶子节点', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:07');
INSERT INTO `sys_dic` VALUES ('11', 'EDITABLE', '0', '只读', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES ('12', 'EDITABLE', '1', '可编辑', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:06');
INSERT INTO `sys_dic` VALUES ('13', 'ENABLE', '0', '禁用', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:05');
INSERT INTO `sys_dic` VALUES ('14', 'ENABLE', '1', '启用', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:04');
INSERT INTO `sys_dic` VALUES ('15', 'AUTHORIZELEVEL', '1', '访问权限', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES ('16', 'AUTHORIZELEVEL', '2', '管理权限', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:02');
INSERT INTO `sys_dic` VALUES ('17', 'MENUTYPE', '1', '系统菜单', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:03');
INSERT INTO `sys_dic` VALUES ('18', 'MENUTYPE', '2', '业务菜单', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('19', 'USERTYPE', '1', '经办员', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:50');
INSERT INTO `sys_dic` VALUES ('20', 'USERTYPE', '2', '管理员', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:48');
INSERT INTO `sys_dic` VALUES ('21', 'USERTYPE', '3', '系统内置用户', '3', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES ('22', 'EXPAND', '0', '收缩', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:47');
INSERT INTO `sys_dic` VALUES ('23', 'EXPAND', '1', '展开', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:46');
INSERT INTO `sys_dic` VALUES ('24', 'CRUD', 'add', '新增', '1', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:56');
INSERT INTO `sys_dic` VALUES ('25', 'CRUD', 'read', '查询', '2', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:58');
INSERT INTO `sys_dic` VALUES ('26', 'CRUD', 'update', '修改', '3', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES ('27', 'CRUD', 'delete', '删除', '4', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:03:59');
INSERT INTO `sys_dic` VALUES ('28', 'CRUD', 'open', '打开', '5', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:00');
INSERT INTO `sys_dic` VALUES ('29', 'CRUD', 'close', '关闭', '6', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('30', 'CRUD', 'run', '执行', '7', '0', '1', null, '1', '2016-06-28 18:04:06', '1', '2016-06-28 18:04:01');
INSERT INTO `sys_dic` VALUES ('31', 'NEWSTYPE', '1', '国内新闻', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('32', 'NEWSTYPE', '2', '国际新闻', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('33', 'NEWSTYPE', '3', '社会新闻', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('34', 'NEWSTYPE', '4', '体育新闻', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('35', 'NEWSTYPE', '5', '娱乐新闻', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('36', 'NEWSTYPE', '6', '科技新闻', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('37', 'NEWSTYPE', '7', '行业新闻', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('38', 'NEWSTYPE', '8', '其他新闻', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('39', 'NOTICETYPE', '1', '会议通知', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('40', 'NOTICETYPE', '2', '活动公告', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('41', 'NOTICETYPE', '3', '社会公告', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('42', 'NOTICETYPE', '4', '内部公告', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');
INSERT INTO `sys_dic` VALUES ('43', 'NOTICETYPE', '5', '其他公告', '1', '1', '1', null, '0', '2017-02-02 12:52:46', '0', '2017-02-02 12:52:46');

-- ----------------------------
-- Table structure for `sys_email`
-- ----------------------------
DROP TABLE IF EXISTS `sys_email`;
CREATE TABLE `sys_email` (
  `id_` bigint(20) NOT NULL COMMENT '邮件编号',
  `email_name` varchar(128) NOT NULL COMMENT '邮件名称',
  `sender_` varchar(32) NOT NULL COMMENT '使用发送',
  `email_title` varchar(256) NOT NULL COMMENT '发送标题',
  `email_content` text NOT NULL COMMENT '发送内容',
  `remark_` varchar(1024) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件表';

-- ----------------------------
-- Records of sys_email
-- ----------------------------
INSERT INTO `sys_email` VALUES ('1', 'test', 't', 'a', '并蒂芙蓉', null, '1', '1', '2017-02-02 16:37:54', '1', '2017-02-02 16:37:54');

-- ----------------------------
-- Table structure for `sys_email_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_email_config`;
CREATE TABLE `sys_email_config` (
  `id_` bigint(20) NOT NULL COMMENT '邮件配置编号',
  `smtp_host` varchar(32) NOT NULL COMMENT 'SMTP服务器',
  `smtp_port` varchar(8) NOT NULL COMMENT 'SMTP服务器端口',
  `send_method` varchar(16) NOT NULL COMMENT '发送方式',
  `sender_name` varchar(64) NOT NULL COMMENT '名称',
  `sender_account` varchar(32) NOT NULL COMMENT '发邮件邮箱账号',
  `sender_password` varchar(32) NOT NULL COMMENT '发邮件邮箱密码',
  `remark_` varchar(1024) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件配置表';

-- ----------------------------
-- Records of sys_email_config
-- ----------------------------
INSERT INTO `sys_email_config` VALUES ('828157583909109760', 'smtp.163.com', '101', '0', 'iBase4J', 'iBase4J@163.com', 'BK5sgjz5JOOsFuD4w0mbe7==', null, '1', '1', '2017-02-05 16:25:29', '1', '2017-02-05 16:37:50');

-- ----------------------------
-- Table structure for `sys_email_template`
-- ----------------------------
DROP TABLE IF EXISTS `sys_email_template`;
CREATE TABLE `sys_email_template` (
  `id_` bigint(20) NOT NULL COMMENT '邮件模版编号',
  `email_name` varchar(128) NOT NULL COMMENT '邮件名称',
  `email_account` varchar(32) DEFAULT NULL COMMENT '发送邮件帐号',
  `sort_` int(5) DEFAULT NULL COMMENT '排序号',
  `title_` varchar(512) DEFAULT NULL COMMENT '标题模版',
  `template_` text COMMENT '内容模板',
  `remark_` varchar(1024) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件模版表';

-- ----------------------------
-- Records of sys_email_template
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_event`
-- ----------------------------
DROP TABLE IF EXISTS `sys_event`;
CREATE TABLE `sys_event` (
  `id_` bigint(20) NOT NULL,
  `title_` varchar(50) DEFAULT NULL,
  `request_uri` varchar(50) DEFAULT NULL,
  `parameters_` varchar(500) DEFAULT NULL,
  `method_` varchar(20) DEFAULT NULL,
  `client_host` varchar(50) DEFAULT NULL,
  `user_agent` varchar(300) DEFAULT NULL,
  `status_` int(3) DEFAULT NULL,
  `enable_` tinyint(1) DEFAULT NULL,
  `remark_` text,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of sys_event
-- ----------------------------
INSERT INTO `sys_event` VALUES ('853876025484963840', '用户登录', '/login', '{}', 'POST', '192.168.19.1', 'Windows 8.1 Browser Firefox 52.0', '200', null, null, null, '2017-04-17 15:41:23', null, '2017-04-17 15:41:23');
INSERT INTO `sys_event` VALUES ('853876025484963841', '用户登录', '/login', '{}', 'POST', '192.168.19.1', 'Windows 8.1 Browser Firefox 52.0', '200', null, null, null, '2017-04-17 15:41:23', null, '2017-04-17 15:41:23');
INSERT INTO `sys_event` VALUES ('853890222470004736', '用户登录', '/login', '{}', 'POST', '0:0:0:0:0:0:0:1', 'Windows 8.1 Browser Firefox 52.0', '200', null, null, null, '2017-04-17 16:37:48', null, '2017-04-17 16:37:48');
INSERT INTO `sys_event` VALUES ('853890372215046145', '用户登录', '/login', '{}', 'POST', '0:0:0:0:0:0:0:1', 'Windows 8.1 Browser Firefox 52.0', '200', null, null, null, '2017-04-17 16:38:24', null, '2017-04-17 16:38:24');
INSERT INTO `sys_event` VALUES ('853890982259785728', '用户登录', '/login', '{}', 'POST', '0:0:0:0:0:0:0:1', 'Windows 8.1 Browser Firefox 52.0', '200', null, null, null, '2017-04-17 16:40:49', null, '2017-04-17 16:40:49');
INSERT INTO `sys_event` VALUES ('853895289327648768', '用户登录', '/login', '{}', 'POST', '192.168.19.1', 'Windows 8.1 Browser Firefox 52.0', '200', null, null, null, '2017-04-17 16:57:56', null, '2017-04-17 16:57:56');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id_` bigint(20) NOT NULL COMMENT '菜单编号',
  `menu_name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `menu_type` tinyint(1) DEFAULT '2' COMMENT '菜单类型(0:CURD;1:系统菜单;2:业务菜单;)',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级菜单编号',
  `iconcls_` varchar(50) DEFAULT NULL COMMENT '节点图标CSS类名',
  `request_` varchar(100) DEFAULT NULL COMMENT '请求地址',
  `expand_` tinyint(1) NOT NULL DEFAULT '0' COMMENT '展开状态(1:展开;0:收缩)',
  `sort_no` int(2) DEFAULT NULL COMMENT '排序号',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '叶子节点(0:树枝节点;1:叶子节点)',
  `permission_` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `remark_` varchar(1024) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '1', '0', 'glyphicon glyphicon-cog', '#', '0', '1', '1', 'sys', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 08:19:19');
INSERT INTO `sys_menu` VALUES ('2', '用户管理', '1', '1', 'glyphicon glyphicon-user', 'main.sys.user.list', '0', '1', '1', 'sys.base.user', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 08:38:35');
INSERT INTO `sys_menu` VALUES ('3', '部门管理', '1', '1', 'glyphicon glyphicon-flag', 'main.sys.dept.list', '0', '2', '1', 'sys.base.dept', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:43');
INSERT INTO `sys_menu` VALUES ('4', '菜单管理', '1', '1', 'glyphicon glyphicon-list', 'main.sys.menu.list', '0', '3', '1', 'sys.base.menu', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:45');
INSERT INTO `sys_menu` VALUES ('5', '角色管理', '1', '1', 'glyphicon glyphicon-tags', 'main.sys.role.list', '0', '4', '1', 'sys.base.role', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:47');
INSERT INTO `sys_menu` VALUES ('6', '会话管理', '1', '1', 'glyphicon glyphicon-earphone', 'main.sys.session.list', '0', '6', '1', 'sys.base.session', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:49');
INSERT INTO `sys_menu` VALUES ('7', '字典管理', '1', '1', 'glyphicon glyphicon-book', 'main.sys.dic.list', '0', '7', '1', 'sys.base.dic', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:50');
INSERT INTO `sys_menu` VALUES ('8', '参数管理', '1', '1', 'glyphicon glyphicon-wrench', 'main.sys.param.list', '0', '8', '1', 'sys.base.param', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:07:52');
INSERT INTO `sys_menu` VALUES ('9', '调度中心', '1', '0', 'glyphicon glyphicon-fire', '#', '0', '2', '1', 'sys.task', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-30 14:23:57');
INSERT INTO `sys_menu` VALUES ('10', '调度管理', '1', '9', 'glyphicon glyphicon-random', 'main.task.scheduled.list', '0', '3', '1', 'sys.task.scheduled', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-30 14:24:02');
INSERT INTO `sys_menu` VALUES ('11', '调度日志', '1', '9', 'glyphicon glyphicon-file', 'main.task.log.list', '0', '4', '1', 'sys.task.log', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-28 18:08:48');
INSERT INTO `sys_menu` VALUES ('14', '清除缓存', '1', '1', null, null, '0', '9', '0', 'sys.sys.cache', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 09:39:25');
INSERT INTO `sys_menu` VALUES ('15', '用户权限', '1', '1', null, null, '0', '10', '0', 'sys.permisson.roleMenu', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 09:39:27');
INSERT INTO `sys_menu` VALUES ('16', '用户角色', '1', '1', null, null, '0', '11', '0', 'sys.permisson.useRole', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 09:39:29');
INSERT INTO `sys_menu` VALUES ('17', '角色权限', '1', '1', null, null, '0', '12', '0', 'sys.permisson.userMenu', null, '1', '1', '2016-06-20 09:16:56', '1', '2016-06-29 09:39:33');

-- ----------------------------
-- Table structure for `sys_news`
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news` (
  `id_` bigint(20) NOT NULL COMMENT '新闻编号',
  `news_title` varchar(64) NOT NULL COMMENT '新闻标题',
  `news_type` varchar(8) NOT NULL COMMENT '新闻类型',
  `send_time` datetime NOT NULL COMMENT '发布时间',
  `author_` varchar(32) NOT NULL COMMENT '作者',
  `editor_` varchar(32) NOT NULL COMMENT '编辑',
  `tags_` varchar(128) DEFAULT NULL COMMENT 'Tag标签',
  `keys_` varchar(128) DEFAULT NULL COMMENT '关键字',
  `content_` text COMMENT '内容',
  `reader_times` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `status_` varchar(2) NOT NULL DEFAULT '1' COMMENT '发布状态',
  `remark_` varchar(1024) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of sys_news
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id_` bigint(20) NOT NULL COMMENT '公告编号',
  `notice_title` varchar(128) NOT NULL COMMENT '公告标题',
  `notice_type` varchar(8) NOT NULL COMMENT '公告类型',
  `send_time` datetime DEFAULT NULL COMMENT '发布时间',
  `info_sources` varchar(256) DEFAULT NULL COMMENT '信息来源',
  `sources_url` varchar(2048) DEFAULT NULL COMMENT '来源地址',
  `content_` text COMMENT '内容',
  `reader_times` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `status_` varchar(2) NOT NULL DEFAULT '1' COMMENT '发布状态',
  `remark_` varchar(1024) DEFAULT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_param`
-- ----------------------------
DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id_` bigint(20) NOT NULL COMMENT '参数编号',
  `param_key` varchar(50) DEFAULT NULL COMMENT '参数键名',
  `param_value` varchar(100) DEFAULT NULL COMMENT '参数键值',
  `remark_` varchar(1024) DEFAULT NULL COMMENT '备注',
  `enable_` tinyint(1) DEFAULT '1',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全局参数表';

-- ----------------------------
-- Records of sys_param
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id_` bigint(20) NOT NULL COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属部门编号',
  `role_type` int(1) NOT NULL DEFAULT '1' COMMENT '角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '1', '1', '1', null, '1', '2016-06-20 09:16:56', '1', '2017-01-29 10:11:20');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id_` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(50) NOT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_role_menu_key1` (`role_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色授权表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:04');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2', 'add', '1', null, '1', '2016-06-29 09:10:10', '1', '2016-06-29 09:10:10');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '2', 'delete', '1', null, '1', '2016-06-29 09:10:29', '1', '2016-06-29 09:10:29');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '2', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:07');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '2', 'update', '1', null, '1', '2016-06-29 09:10:20', '1', '2016-06-29 09:10:20');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '3', 'add', '1', null, '1', '2016-06-29 09:10:50', '1', '2016-06-29 09:10:50');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '3', 'delete', '1', null, '1', '2016-06-29 09:11:18', '1', '2016-06-29 09:11:18');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '3', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:08');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '3', 'update', '1', null, '1', '2016-06-29 09:11:01', '1', '2016-06-29 09:11:01');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '4', 'add', '1', null, '1', '2016-06-29 09:12:14', '1', '2016-06-29 09:12:14');
INSERT INTO `sys_role_menu` VALUES ('11', '1', '4', 'delete', '1', null, '1', '2016-06-29 09:18:43', '1', '2016-06-29 09:18:43');
INSERT INTO `sys_role_menu` VALUES ('12', '1', '4', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:08');
INSERT INTO `sys_role_menu` VALUES ('13', '1', '4', 'update', '1', null, '1', '2016-06-29 09:18:33', '1', '2016-06-29 09:18:33');
INSERT INTO `sys_role_menu` VALUES ('14', '1', '5', 'add', '1', null, '1', '2016-06-29 09:19:00', '1', '2016-06-29 09:19:00');
INSERT INTO `sys_role_menu` VALUES ('15', '1', '5', 'delete', '1', null, '1', '2016-06-29 09:19:24', '1', '2016-06-29 09:19:24');
INSERT INTO `sys_role_menu` VALUES ('16', '1', '5', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:09');
INSERT INTO `sys_role_menu` VALUES ('17', '1', '5', 'update', '1', null, '1', '2016-06-29 09:19:10', '1', '2016-06-29 09:19:10');
INSERT INTO `sys_role_menu` VALUES ('18', '1', '6', 'delete', '1', null, '1', '2016-06-29 09:19:35', '1', '2016-06-29 09:19:35');
INSERT INTO `sys_role_menu` VALUES ('19', '1', '6', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:09');
INSERT INTO `sys_role_menu` VALUES ('20', '1', '7', 'add', '1', null, '1', '2016-06-29 09:19:58', '1', '2016-06-29 09:19:58');
INSERT INTO `sys_role_menu` VALUES ('21', '1', '7', 'delete', '1', null, '1', '2016-06-29 09:20:18', '1', '2016-06-29 09:20:18');
INSERT INTO `sys_role_menu` VALUES ('22', '1', '7', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:10');
INSERT INTO `sys_role_menu` VALUES ('23', '1', '7', 'update', '1', null, '1', '2016-06-29 09:20:08', '1', '2016-06-29 09:20:08');
INSERT INTO `sys_role_menu` VALUES ('24', '1', '8', 'add', '1', null, '1', '2016-06-29 09:20:34', '1', '2016-06-29 09:20:34');
INSERT INTO `sys_role_menu` VALUES ('25', '1', '8', 'delete', '1', null, '1', '2016-06-29 09:20:53', '1', '2016-06-29 09:20:53');
INSERT INTO `sys_role_menu` VALUES ('26', '1', '8', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:11');
INSERT INTO `sys_role_menu` VALUES ('27', '1', '8', 'update', '1', null, '1', '2016-06-29 09:20:44', '1', '2016-06-29 09:20:44');
INSERT INTO `sys_role_menu` VALUES ('28', '1', '9', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:11');
INSERT INTO `sys_role_menu` VALUES ('29', '1', '10', 'add', '1', null, '1', '2016-06-29 09:21:55', '1', '2016-06-29 09:21:55');
INSERT INTO `sys_role_menu` VALUES ('30', '1', '10', 'delete', '1', null, '1', '2016-06-29 09:22:07', '1', '2016-06-29 09:22:32');
INSERT INTO `sys_role_menu` VALUES ('31', '1', '10', 'read', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:13');
INSERT INTO `sys_role_menu` VALUES ('32', '1', '10', 'update', '1', null, '1', '2016-06-29 09:22:49', '1', '2016-06-29 09:22:49');
INSERT INTO `sys_role_menu` VALUES ('33', '1', '10', 'close', '1', null, '1', '2016-06-29 08:45:21', '1', '2016-06-29 08:45:21');
INSERT INTO `sys_role_menu` VALUES ('34', '1', '10', 'open', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:13');
INSERT INTO `sys_role_menu` VALUES ('35', '1', '10', 'run', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:23:13');
INSERT INTO `sys_role_menu` VALUES ('36', '1', '14', 'update', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:43:18');
INSERT INTO `sys_role_menu` VALUES ('37', '1', '15', 'update', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:43:33');
INSERT INTO `sys_role_menu` VALUES ('38', '1', '16', 'update', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:43:34');
INSERT INTO `sys_role_menu` VALUES ('39', '1', '17', 'update', '1', null, '1', '2016-06-28 18:18:50', '1', '2016-06-29 08:43:35');

-- ----------------------------
-- Table structure for `sys_session`
-- ----------------------------
DROP TABLE IF EXISTS `sys_session`;
CREATE TABLE `sys_session` (
  `id_` bigint(20) NOT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  `account_` varchar(50) DEFAULT NULL,
  `ip_` varchar(50) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `enable_` tinyint(1) DEFAULT NULL,
  `remark_` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会话管理';

-- ----------------------------
-- Records of sys_session
-- ----------------------------
INSERT INTO `sys_session` VALUES ('857037377313460224', '46b9a43c-3960-4b6a-a5b2-3e6a9b5911d8', '123456', '192.168.19.1', '2017-04-26 09:03:16', null, null, '2017-04-26 09:03:28', null, '2017-04-26 09:03:28', null);

-- ----------------------------
-- Table structure for `sys_unit`
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit` (
  `id_` bigint(20) NOT NULL,
  `unit_name` varchar(128) NOT NULL COMMENT '单位名称',
  `principal_` varchar(32) DEFAULT NULL COMMENT '负责人',
  `phone_` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `address_` varchar(256) DEFAULT NULL COMMENT '地址',
  `sort_` int(5) DEFAULT NULL COMMENT '排序号',
  `enable_` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位表';

-- ----------------------------
-- Records of sys_unit
-- ----------------------------
INSERT INTO `sys_unit` VALUES ('1', 'iBase4J', '经理', '13945678911', '中国', '1', null, null, '2017-01-12 00:00:00', '1', '2017-01-28 23:51:57', '1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id_` bigint(20) NOT NULL,
  `account_` varchar(20) DEFAULT NULL COMMENT '登陆帐户',
  `password_` varchar(50) DEFAULT NULL COMMENT '密码',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  `name_pinyin` varchar(64) DEFAULT NULL COMMENT '姓名拼音',
  `sex_` int(1) NOT NULL DEFAULT '0' COMMENT '性别(0:未知;1:男;2:女)',
  `avatar_` varchar(500) DEFAULT NULL,
  `user_type` int(1) DEFAULT '1' COMMENT '人员类型(1:经办员;2:管理员;3:系统内置人员;)',
  `phone_` varchar(50) DEFAULT NULL COMMENT '电话',
  `email_` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `birth_day` date DEFAULT NULL COMMENT '出生日期',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门编号',
  `position_` varchar(64) DEFAULT NULL COMMENT '职位',
  `address_` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `staff_no` varchar(32) DEFAULT NULL COMMENT '工号',
  `locked_` tinyint(1) DEFAULT '0' COMMENT '锁定标志(1:锁定;0:激活)',
  `enable_` tinyint(1) DEFAULT '1',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `account` (`account_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户管理';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '123456', 'OyUHgt21gTP2/5uFgbKZtq==', '管理员', 'GUANLIYUAN', '0', '', '3', '15333821711', '12@12', '2017-01-27', '1', '213', null, null, '0', '1', '1', '2016-05-06 10:06:52', '1', '2017-01-27 15:45:31', '1');

-- ----------------------------
-- Table structure for `sys_user_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_menu`;
CREATE TABLE `sys_user_menu` (
  `id_` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  `permission_` varchar(50) NOT NULL COMMENT '权限标识',
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `sys_user_menu_key1` (`user_id`,`menu_id`,`permission_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of sys_user_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id_` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `enable_` tinyint(1) NOT NULL DEFAULT '1',
  `remark_` varchar(1024) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_id_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户授权表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '1', null, '1', '2016-06-16 15:59:56', '1', '2016-06-16 15:59:56');

-- ----------------------------
-- Table structure for `sys_user_thirdparty`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_thirdparty`;
CREATE TABLE `sys_user_thirdparty` (
  `id_` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `provider_` varchar(50) NOT NULL COMMENT '第三方类型',
  `open_id` varchar(50) NOT NULL COMMENT '第三方Id',
  `enable_` tinyint(1) DEFAULT NULL,
  `remark_` varchar(1024) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `user_id_provider__open_id` (`user_id`,`provider_`,`open_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方用户';

-- ----------------------------
-- Records of sys_user_thirdparty
-- ----------------------------

-- ----------------------------
-- Table structure for `task_fire_log`
-- ----------------------------
DROP TABLE IF EXISTS `task_fire_log`;
CREATE TABLE `task_fire_log` (
  `id_` bigint(20) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `task_name` varchar(50) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status_` varchar(1) NOT NULL DEFAULT 'I',
  `server_host` varchar(50) DEFAULT NULL COMMENT '服务器名',
  `server_duid` varchar(50) DEFAULT NULL COMMENT '服务器网卡序列号',
  `fire_info` text,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `group_name_task_name_start_time` (`group_name`,`task_name`,`start_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志表';

-- ----------------------------
-- Records of task_fire_log
-- ----------------------------
