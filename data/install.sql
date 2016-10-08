DROP TABLE IF EXISTS `hd_article`;

CREATE TABLE `hd_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `content` text COMMENT '内容',
  `cid` int(10) unsigned NOT NULL COMMENT '分类编号',
  `thumb` varchar(300) NOT NULL DEFAULT '' COMMENT '缩略图',
  `click` mediumint(9) unsigned NOT NULL COMMENT '阅读次数',
  `createtime` int(10) unsigned NOT NULL COMMENT '发表时间',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '跳转链接',
  `template` varchar(200) NOT NULL DEFAULT '' COMMENT '模板文件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table hd_article_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_article_category`;

CREATE TABLE `hd_article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `orderby` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `template` varchar(200) NOT NULL DEFAULT '' COMMENT '模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章栏目';



# Dump of table hd_balance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_balance`;

CREATE TABLE `hd_balance` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL COMMENT '会员编号',
  `tid` varchar(80) NOT NULL,
  `fee` decimal(10,2) NOT NULL COMMENT '金额',
  `status` tinyint(1) NOT NULL COMMENT '状态 0 等待支付 1 支付成功',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`bid`),
  KEY `siteid` (`siteid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员余额充值';



# Dump of table hd_button
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_button`;

CREATE TABLE `hd_button` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `data` varchar(2000) NOT NULL DEFAULT '' COMMENT '菜单数据',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '1 在微信生效 0 不在微信生效',
  `siteid` int(11) NOT NULL COMMENT '站点编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信菜单';



# Dump of table hd_cloud
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_cloud`;

CREATE TABLE `hd_cloud` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '云帐号用户编号',
  `username` varchar(30) NOT NULL COMMENT '帐号',
  `webname` varchar(200) NOT NULL DEFAULT '' COMMENT '网站名称',
  `AppSecret` varchar(50) NOT NULL DEFAULT '' COMMENT '应用密钥',
  `versionCode` char(30) NOT NULL DEFAULT '' COMMENT '版本',
  `releaseCode` char(16) NOT NULL DEFAULT '' COMMENT '发行版本，补丁版本',
  `createtime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '与云平台绑定状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='HDCMS版本信息';



# Dump of table hd_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_config`;

CREATE TABLE `hd_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site` text NOT NULL COMMENT '网站开启/登录等设置',
  `register` text NOT NULL COMMENT '注册配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置';

LOCK TABLES `hd_config` WRITE;
/*!40000 ALTER TABLE `hd_config` DISABLE KEYS */;

INSERT INTO `hd_config` (`id`, `site`, `register`)
VALUES
  (1,'{\"is_open\":\"1\",\"enable_code\":\"0\",\"close_message\":\"网站维护中,请稍候访问\",\"upload\":{\"size\":20000,\"type\":\"jpg,jpeg,gif,png,zip,rar,doc,txt,pem\"}}','{\"is_open\":\"0\",\"audit\":\"1\",\"enable_code\":\"0\",\"groupid\":\"1\"}');

/*!40000 ALTER TABLE `hd_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_core_attachment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_core_attachment`;

CREATE TABLE `hd_core_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `siteid` int(11) NOT NULL COMMENT '站点编号',
  `name` varchar(80) NOT NULL,
  `filename` varchar(300) NOT NULL COMMENT '文件名',
  `path` varchar(300) NOT NULL COMMENT '相对路径',
  `extension` varchar(10) NOT NULL DEFAULT '' COMMENT '类型',
  `createtime` int(10) NOT NULL COMMENT '上传时间',
  `size` mediumint(9) NOT NULL COMMENT '文件大小',
  `user_type` char(10) NOT NULL DEFAULT '' COMMENT '用户类型',
  `data` varchar(100) NOT NULL DEFAULT '' COMMENT '辅助信息',
  `hash` char(50) NOT NULL DEFAULT '' COMMENT '标识用于区分资源',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `data` (`data`),
  KEY `extension` (`extension`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件';



# Dump of table hd_core_cache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_core_cache`;

CREATE TABLE `hd_core_cache` (
  `key` varchar(100) NOT NULL COMMENT '缓存名称',
  `value` mediumtext NOT NULL COMMENT '缓存数据',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='缓存';

LOCK TABLES `hd_core_cache` WRITE;
/*!40000 ALTER TABLE `hd_core_cache` DISABLE KEYS */;

INSERT INTO `hd_core_cache` (`key`, `value`)
VALUES
  ('modules:1','a:22:{i:0;a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:24:\"和您进行简单对话\";s:6:\"detail\";s:156:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:1;a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:33:\"为你提供生动的图文资讯\";s:6:\"detail\";s:156:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:2;a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:7:\"article\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"文章系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:33:\"发布文章与会员中心管理\";s:6:\"detail\";s:105:\"支持桌面、移动、微信三网的文章系统，同时具有移动、桌面会员中心管理功能\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:3;a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"setting\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"网站配置\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:24:\"网站运行整体配置\";s:6:\"detail\";s:81:\"网站运行配置项，如支付、邮箱、登录等等的全局配置项管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:4;a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:6:\"member\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"会员粉丝\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:12:\"会员管理\";s:6:\"detail\";s:75:\"会员与会员组管理，如会员字段，粉丝管理、会员卡设置\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:5;a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:7:\"special\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:18:\"微信默认消息\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"微信默认消息\";s:6:\"detail\";s:45:\"系统默认消息与关注微信消息处理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:6;a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"ticket\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"卡券管理\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"会员卡券管理\";s:6:\"detail\";s:45:\"会员优惠券、代金券、实物券管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:7;a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"cover\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"封面回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"封面消息回复\";s:6:\"detail\";s:33:\"用来处理模块的封面消息\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.png\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:8;a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:2:\"uc\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"会员中心\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:27:\"会员中心的管理操作\";s:6:\"detail\";s:81:\"会员信息的管理，包括收货地址、个人资料、会员卡券等管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.png\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:9;a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:6:\"button\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"微信菜单\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"微信菜单管理\";s:6:\"detail\";s:102:\"用于添加微信菜单，更新菜单后需要取消关注再关注或等微信更新缓存后有效\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:10;a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:8:\"material\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"微信素材\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:12:\"微信素材\";s:6:\"detail\";s:186:\"公众号经常有需要用到一些临时性的多媒体素材的场景，例如在使用接口特别是发送消息时，对多媒体文件、多媒体消息的获取和调用等操作\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:11;a:19:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:24:\"和您进行简单对话\";s:6:\"detail\";s:156:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:12;a:19:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:33:\"为你提供生动的图文资讯\";s:6:\"detail\";s:156:\"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:13;a:19:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:7:\"article\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"文章系统\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:33:\"发布文章与会员中心管理\";s:6:\"detail\";s:105:\"支持桌面、移动、微信三网的文章系统，同时具有移动、桌面会员中心管理功能\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:14;a:19:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"setting\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"网站配置\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:24:\"网站运行整体配置\";s:6:\"detail\";s:81:\"网站运行配置项，如支付、邮箱、登录等等的全局配置项管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:15;a:19:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:6:\"member\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"会员粉丝\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:12:\"会员管理\";s:6:\"detail\";s:75:\"会员与会员组管理，如会员字段，粉丝管理、会员卡设置\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:16;a:19:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:7:\"special\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:18:\"微信默认消息\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"微信默认消息\";s:6:\"detail\";s:45:\"系统默认消息与关注微信消息处理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:17;a:19:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"ticket\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"卡券管理\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"会员卡券管理\";s:6:\"detail\";s:45:\"会员优惠券、代金券、实物券管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:18;a:19:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"cover\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"封面回复\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"封面消息回复\";s:6:\"detail\";s:33:\"用来处理模块的封面消息\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:1:{i:0;s:4:\"text\";}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.png\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:19;a:19:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:2:\"uc\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"会员中心\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:27:\"会员中心的管理操作\";s:6:\"detail\";s:81:\"会员信息的管理，包括收货地址、个人资料、会员卡券等管理\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.png\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:20;a:19:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:6:\"button\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"微信菜单\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:18:\"微信菜单管理\";s:6:\"detail\";s:102:\"用于添加微信菜单，更新菜单后需要取消关注再关注或等微信更新缓存后有效\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}i:21;a:19:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:8:\"material\";s:8:\"industry\";s:8:\"business\";s:5:\"title\";s:12:\"微信素材\";s:7:\"version\";s:3:\"1.0\";s:6:\"resume\";s:12:\"微信素材\";s:6:\"detail\";s:186:\"公众号经常有需要用到一些临时性的多媒体素材的场景，例如在使用接口特别是发送消息时，对多媒体文件、多媒体消息的获取和调用等操作\";s:6:\"author\";s:6:\"后盾\";s:3:\"url\";s:21:\"http://open.hdcms.com\";s:9:\"is_system\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:10:\"processors\";a:0:{}s:7:\"setting\";s:1:\"0\";s:4:\"rule\";s:1:\"0\";s:11:\"permissions\";a:0:{}s:5:\"thumb\";s:9:\"thumb.jpg\";s:5:\"cover\";s:9:\"cover.jpg\";s:8:\"locality\";s:1:\"1\";s:11:\"releaseCode\";s:0:\"\";}}'),
  ('setting:1','a:5:{s:11:\"creditnames\";b:0;s:15:\"creditbehaviors\";b:0;s:8:\"register\";b:0;s:4:\"smtp\";b:0;s:3:\"pay\";b:0;}'),
  ('site:1','a:8:{s:6:\"siteid\";s:1:\"1\";s:4:\"name\";s:12:\"测试站点\";s:4:\"weid\";s:1:\"9\";s:11:\"allfilesize\";s:3:\"200\";s:10:\"createtime\";s:10:\"1469001908\";s:11:\"description\";s:0:\"\";s:6:\"domain\";s:0:\"\";s:6:\"module\";s:0:\"\";}'),
  ('wechat:1','a:13:{s:4:\"weid\";s:1:\"1\";s:6:\"siteid\";s:1:\"1\";s:6:\"wename\";s:6:\"后盾\";s:7:\"account\";s:8:\"aihoudun\";s:8:\"original\";s:15:\"gh_65598c47b2b9\";s:5:\"level\";s:1:\"4\";s:5:\"appid\";s:18:\"wxc47243ed572e273d\";s:9:\"appsecret\";s:32:\"1c72ad236f72c70e347343653410934b\";s:6:\"qrcode\";s:40:\"attachment/2016/10/07/13311475772067.jpg\";s:4:\"icon\";s:22:\"resource/images/hd.png\";s:10:\"is_connect\";s:1:\"1\";s:5:\"token\";s:30:\"d5cd6efca1ddb64ad5a264495270c3\";s:14:\"encodingaeskey\";s:43:\"73af4a950da79a735f763be1d26ec35e049453adfbc\";}');

/*!40000 ALTER TABLE `hd_core_cache` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_core_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_core_config`;

CREATE TABLE `hd_core_config` (
  `key` varchar(100) NOT NULL COMMENT '配置名称',
  `value` text NOT NULL COMMENT '配置项',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置  todo';



# Dump of table hd_core_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_core_session`;

CREATE TABLE `hd_core_session` (
  `sessid` char(50) NOT NULL,
  `data` mediumtext COMMENT 'session数据',
  `atime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`sessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='session';

LOCK TABLES `hd_core_session` WRITE;
/*!40000 ALTER TABLE `hd_core_session` DISABLE KEYS */;

INSERT INTO `hd_core_session` (`sessid`, `data`, `atime`)
VALUES
  ('dta64ofh8fqhgmgm8a75fmjlf1','admin_uid|s:1:\"1\";',1475964912);

/*!40000 ALTER TABLE `hd_core_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_credits_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_credits_record`;

CREATE TABLE `hd_credits_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `uid` int(11) NOT NULL COMMENT '用户编号',
  `credittype` varchar(45) NOT NULL COMMENT '积分类型',
  `num` decimal(10,2) NOT NULL COMMENT '数量',
  `operator` int(10) unsigned NOT NULL COMMENT '操作者编号',
  `module` varchar(45) NOT NULL COMMENT '模块名',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `uid` (`uid`),
  KEY `operator` (`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='积分变动记录';



# Dump of table hd_material
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_material`;

CREATE TABLE `hd_material` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(10) NOT NULL DEFAULT '' COMMENT '图片（image）、语音（voice）、视频（video）news (图文)',
  `file` varchar(300) NOT NULL DEFAULT '' COMMENT '文件',
  `media_id` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '微信url',
  `siteid` int(11) NOT NULL COMMENT '站点编号',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL COMMENT '是否推送到微信',
  `data` text NOT NULL COMMENT '图文等JSON数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材';



# Dump of table hd_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_member`;

CREATE TABLE `hd_member` (
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `email` varchar(45) NOT NULL COMMENT '邮箱',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `openid` varchar(80) NOT NULL DEFAULT '' COMMENT '微信openid',
  `security` varchar(15) NOT NULL COMMENT '安装密钥',
  `access_token` char(100) NOT NULL DEFAULT '' COMMENT '登录授权的access_token',
  `group_id` int(10) unsigned NOT NULL COMMENT '会员组编号',
  `icon` varchar(300) NOT NULL DEFAULT '' COMMENT '头像',
  `credit1` decimal(10,2) NOT NULL COMMENT '积分',
  `credit2` decimal(10,2) NOT NULL COMMENT '余额',
  `credit3` decimal(10,2) NOT NULL,
  `credit4` decimal(10,2) NOT NULL,
  `credit5` decimal(10,2) NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `qq` varchar(15) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `realname` varchar(15) NOT NULL COMMENT '真实姓名',
  `nickname` varchar(45) NOT NULL COMMENT '昵称',
  `telephone` varchar(15) NOT NULL COMMENT '固定电话',
  `vip` tinyint(3) unsigned NOT NULL COMMENT 'VIP级别',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `alipay` varchar(45) NOT NULL COMMENT '阿里帐号',
  `msn` varchar(45) NOT NULL COMMENT 'msn帐号',
  `taobao` varchar(45) NOT NULL COMMENT '淘宝帐号',
  `site` varchar(45) NOT NULL COMMENT '个人站点',
  `nationality` varchar(45) NOT NULL COMMENT '国籍',
  `introduce` varchar(200) NOT NULL COMMENT '自我介绍',
  `gender` tinyint(1) NOT NULL COMMENT '性别',
  `graduateschool` varchar(45) NOT NULL COMMENT '毕业学校',
  `height` varchar(10) NOT NULL COMMENT '身高',
  `weight` varchar(10) NOT NULL COMMENT '体重',
  `bloodtype` varchar(5) NOT NULL COMMENT '血型',
  `birthyear` int(10) unsigned NOT NULL COMMENT '出生年',
  `birthmonth` tinyint(3) unsigned NOT NULL COMMENT '出生月',
  `birthday` tinyint(3) unsigned NOT NULL COMMENT '出生日',
  `resideprovince` varchar(30) NOT NULL DEFAULT '' COMMENT '户籍省',
  `residecity` varchar(30) NOT NULL DEFAULT '' COMMENT '户籍市',
  `residedist` varchar(30) NOT NULL DEFAULT '' COMMENT '户籍区',
  PRIMARY KEY (`uid`),
  KEY `group_id` (`group_id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';



# Dump of table hd_member_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_member_address`;

CREATE TABLE `hd_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `uid` int(11) NOT NULL COMMENT '用户编号',
  `username` varchar(20) NOT NULL COMMENT '姓名',
  `mobile` varchar(11) NOT NULL COMMENT '手机号',
  `zipcode` varchar(6) NOT NULL COMMENT '邮编',
  `province` varchar(45) NOT NULL COMMENT '省',
  `city` varchar(45) NOT NULL COMMENT '市',
  `district` varchar(45) NOT NULL COMMENT '区/县',
  `address` varchar(45) NOT NULL COMMENT '街道名称',
  `isdefault` tinyint(1) unsigned NOT NULL COMMENT '默认',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员收货地址';



# Dump of table hd_member_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_member_fields`;

CREATE TABLE `hd_member_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `field` varchar(45) NOT NULL COMMENT '字段名',
  `title` varchar(45) NOT NULL COMMENT '中文标题',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '启用',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员字段信息中文名称与状态';



# Dump of table hd_member_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_member_group`;

CREATE TABLE `hd_member_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `title` varchar(45) NOT NULL COMMENT '组名',
  `credit` int(10) unsigned NOT NULL COMMENT '积分',
  `rank` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `isdefault` tinyint(1) unsigned NOT NULL COMMENT '默认会员组',
  `is_system` tinyint(1) unsigned NOT NULL COMMENT '系统组',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



# Dump of table hd_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_menu`;

CREATE TABLE `hd_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级',
  `title` varchar(50) NOT NULL COMMENT '中文标题',
  `permission` varchar(100) NOT NULL DEFAULT '' COMMENT '权限标识',
  `url` varchar(100) DEFAULT NULL COMMENT '菜单链接',
  `append_url` varchar(100) NOT NULL COMMENT '右侧图标链接',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '右侧菜单图标',
  `orderby` tinyint(1) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '系统菜单',
  `mark` varchar(45) DEFAULT NULL COMMENT '标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单';

LOCK TABLES `hd_menu` WRITE;
/*!40000 ALTER TABLE `hd_menu` DISABLE KEYS */;

INSERT INTO `hd_menu` (`id`, `pid`, `title`, `permission`, `url`, `append_url`, `icon`, `orderby`, `is_display`, `is_system`, `mark`)
VALUES
  (1,0,'基础设置','','?s=site/entry/home&p=platform','','fa fa-comments-o',0,1,1,'platform'),
  (2,1,'基本功能','','','','',0,1,1,'platform'),
  (3,2,'文字回复','reply_basic','?s=site/reply/lists&m=basic','?s=site/reply/post&m=basic','fa fa-plus',0,1,1,'platform'),
  (21,0,'扩展模块','','?s=site/entry/home&p=package','','fa fa-arrows',100,1,1,'package'),
  (27,21,'管理','','','','',0,1,1,'package'),
  (30,2,'图文回复','reply_news','?s=site/reply/lists&m=news','?s=site/reply/post&m=news','fa fa-plus',0,1,1,'platform'),
  (31,0,'功能选项','','?s=site/entry/home&p=feature','','fa fa-comments-o',20,1,1,'feature'),
  (32,0,'会员粉丝','','?s=site/entry/home&p=member','','fa fa-cubes',10,1,1,'member'),
  (33,32,'会员中心','','','','fa fa-cubes',0,1,1,'member'),
  (35,33,'会员','users','?a=site/MemberLists&t=site&m=member','?a=site/MemberPost&t=site&m=member','fa fa-cubes',0,1,1,'member'),
  (36,33,'会员组','member_groups','?a=site/GroupLists&t=site&m=member','?a=site/GroupPost&t=site&m=member','fa fa-cubes',0,1,1,'member'),
  (38,32,'积分兑换','','','','fa fa-cubes',0,1,1,'member'),
  (39,38,'折扣券','member_coupons','?a=site/lists&t=site&type=1&m=ticket','?a=site/post&t=site&type=1&m=ticket','fa fa-cubes',0,1,1,'member'),
  (40,38,'折扣券核销','member_coupons_charge','?a=site/charge&t=site&type=1&m=ticket','','fa fa-cubes',0,1,1,'member'),
  (41,38,'代金券','member_cash','?a=site/lists&t=site&type=2&m=ticket','?a=site/post&t=site&type=2&m=ticket','fa fa-cubes',0,1,1,'member'),
  (42,38,'代金券核销','member_cash_charge','?a=site/charge&t=site&type=2&m=ticket','','fa fa-cubes',0,1,1,'member'),
  (55,2,'系统回复','reply_special','?a=site/post&t=site&m=special','','fa fa-cubes',0,1,1,'platform'),
  (63,31,'公众号选项','','','','fa fa-cubes',0,1,1,'feature'),
  (64,63,'支付参数','setting_pay','?a=site/pay&t=site&m=setting','','fa fa-cubes',0,1,1,'feature'),
  (66,31,'会员与粉丝选项','','','','fa fa-cubes',0,1,1,'feature'),
  (67,66,'积分设置','setting_credit','?a=site/credit&t=site&m=setting','','fa fa-cubes',0,1,1,'feature'),
  (68,66,'注册设置','setting_register','?a=site/register&t=site&m=setting','','fa fa-cubes',0,1,1,'feature'),
  (70,66,'邮件通知设置','setting_mail','?a=site/mail&t=site&m=setting','','fa fa-cubes',0,1,1,'feature'),
  (71,0,'文章系统','','?s=site/entry/home&p=article','','fa fa-cubes',0,1,1,'article'),
  (72,71,'官网管理','','?s=article/home/welcome','','fa fa-cubes',0,1,1,'article'),
  (73,72,'官网模板','article_manage_template','?a=manage/template&t=site&m=article','','fa fa-cubes',0,1,1,'article'),
  (74,71,'内容管理','','','','fa fa-cubes',0,1,1,'article'),
  (75,74,'分类管理','article_content_category','?a=content/category&t=site&m=article','?a=content/categoryPost&t=site&m=article','fa fa-cubes',0,1,1,'article'),
  (76,74,'文章管理','article_content_article','?a=content/article&t=site&m=article','?a=content/articlePost&t=site&m=article','fa fa-cubes',0,1,1,'article'),
  (77,72,'站点管理','article_manage_site','?a=manage/site&t=site&m=article','?a=manage/SitePost&t=site&m=article','fa fa-cubes',0,1,1,'article'),
  (78,71,'特殊页面管理','','','','fa fa-cubes',0,1,1,'article'),
  (80,78,'会员中心','article_ucenter_post','?a=ucenter/post&t=site&m=article','','fa fa-cubes',0,1,1,'article'),
  (81,27,'扩展功能管理','package_managa','?s=site/entry/package','','fa fa-cubes',0,1,1,'package'),
  (82,1,'高级功能','','','','fa fa-cubes',0,1,1,'platform'),
  (84,33,'会员字段管理','member_fields','?a=site/Fieldlists&t=site&m=member','','fa fa-cubes',0,1,1,'member'),
  (85,78,'微站快捷导航','article_quick_menu','?a=quickmenu/post&t=site&m=article','','fa fa-cubes',0,1,1,'article'),
  (86,82,'微信菜单','menus_lists','?a=site/lists&t=site&m=button','','fa fa-cubes',0,1,1,'platform'),
  (87,1,'微信素材','','','','fa fa-cubes',0,1,1,'platform'),
  (88,87,'素材&群发','material','?a=site/image&t=site&m=material','','fa fa-cubes',0,1,1,'platform');

/*!40000 ALTER TABLE `hd_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_module_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_module_setting`;

CREATE TABLE `hd_module_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点名称',
  `module` varchar(45) NOT NULL COMMENT '模块名称',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `setting` text NOT NULL COMMENT '配置',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块配置';



# Dump of table hd_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_modules`;

CREATE TABLE `hd_modules` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '英文标识',
  `industry` varchar(45) NOT NULL COMMENT '行业类型 business(主要业务)customer(客户关系)marketing(营销与活动)tools(常用服务与工具)industry(行业解决方案)other(其他)',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '模块名称(中文标题)',
  `version` varchar(45) NOT NULL COMMENT '版本号',
  `resume` varchar(1000) NOT NULL COMMENT '模块简述',
  `detail` varchar(500) NOT NULL DEFAULT '' COMMENT '详细介绍',
  `author` varchar(45) NOT NULL COMMENT '作者',
  `url` varchar(255) NOT NULL COMMENT '发布url',
  `is_system` varchar(45) NOT NULL DEFAULT '' COMMENT '系统模块',
  `subscribes` varchar(500) NOT NULL COMMENT '订阅信息',
  `processors` varchar(500) NOT NULL DEFAULT '' COMMENT '处理消息',
  `setting` tinyint(1) unsigned NOT NULL COMMENT '存在全局设置项',
  `rule` tinyint(1) unsigned NOT NULL COMMENT '需要嵌入规则',
  `permissions` varchar(5000) NOT NULL DEFAULT '' COMMENT '业务规则权限验证标识',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '模块缩略图',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '模块封面图',
  `locality` tinyint(1) unsigned NOT NULL COMMENT '本地应用',
  `releaseCode` varchar(50) NOT NULL DEFAULT '' COMMENT '发行版本号',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `name` (`name`),
  KEY `is_system` (`is_system`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块列表';

LOCK TABLES `hd_modules` WRITE;
/*!40000 ALTER TABLE `hd_modules` DISABLE KEYS */;

INSERT INTO `hd_modules` (`mid`, `name`, `industry`, `title`, `version`, `resume`, `detail`, `author`, `url`, `is_system`, `subscribes`, `processors`, `setting`, `rule`, `permissions`, `thumb`, `cover`, `locality`, `releaseCode`)
VALUES
  (1,'basic','business','基本文字回复','1.0','和您进行简单对话','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户','后盾','http://open.hdcms.com','1','','a:1:{i:0;s:4:\"text\";}',0,0,'','thumb.jpg','cover.jpg',1,''),
  (2,'news','business','基本混合图文回复','1.0','为你提供生动的图文资讯','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 将回复文字或链接给用户','后盾','http://open.hdcms.com','1','','a:1:{i:0;s:4:\"text\";}',0,0,'','thumb.jpg','cover.jpg',1,''),
  (3,'article','business','文章系统','1.0','发布文章与会员中心管理','支持桌面、移动、微信三网的文章系统，同时具有移动、桌面会员中心管理功能','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (4,'setting','business','网站配置','1.0','网站运行整体配置','网站运行配置项，如支付、邮箱、登录等等的全局配置项管理','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (5,'member','business','会员粉丝','1.0','会员管理','会员与会员组管理，如会员字段，粉丝管理、会员卡设置','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (6,'special','business','微信默认消息','1.0','微信默认消息','系统默认消息与关注微信消息处理','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (7,'ticket','business','卡券管理','1.0','会员卡券管理','会员优惠券、代金券、实物券管理','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (8,'cover','business','封面回复','1.0','封面消息回复','用来处理模块的封面消息','后盾','http://open.hdcms.com','1','','a:1:{i:0;s:4:\"text\";}',0,0,'','thumb.png','cover.jpg',1,''),
  (9,'uc','business','会员中心','1.0','会员中心的管理操作','会员信息的管理，包括收货地址、个人资料、会员卡券等管理','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.png','cover.jpg',1,''),
  (10,'button','business','微信菜单','1.0','微信菜单管理','用于添加微信菜单，更新菜单后需要取消关注再关注或等微信更新缓存后有效','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,''),
  (11,'material','business','微信素材','1.0','微信素材','公众号经常有需要用到一些临时性的多媒体素材的场景，例如在使用接口特别是发送消息时，对多媒体文件、多媒体消息的获取和调用等操作','后盾','http://open.hdcms.com','1','','',0,0,'','thumb.jpg','cover.jpg',1,'');

/*!40000 ALTER TABLE `hd_modules` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_modules_bindings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_modules_bindings`;

CREATE TABLE `hd_modules_bindings` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(45) NOT NULL DEFAULT '' COMMENT '模块名称',
  `entry` varchar(45) NOT NULL DEFAULT '' COMMENT '类型 封面、回复规则列表、业务菜单',
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '中文标题',
  `do` varchar(45) NOT NULL DEFAULT '' COMMENT '动作方法',
  `data` varchar(255) NOT NULL DEFAULT '' COMMENT '附加参数',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '自定义菜单的url',
  `icon` varchar(80) NOT NULL DEFAULT '' COMMENT '自定义菜单的图标图标',
  `orderby` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `directly` tinyint(11) unsigned NOT NULL COMMENT '无需登陆直接展示',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块动作';



# Dump of table hd_package
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_package`;

CREATE TABLE `hd_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '套餐名称',
  `modules` varchar(5000) NOT NULL COMMENT '允许使用的套餐',
  `template` varchar(5000) NOT NULL COMMENT '允许使用的模板',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='套餐';



# Dump of table hd_pay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_pay`;

CREATE TABLE `hd_pay` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员编号',
  `tid` varchar(80) NOT NULL COMMENT '定单编号',
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `type` varchar(45) NOT NULL COMMENT '支付类型，alipay wechat',
  `fee` decimal(10,2) NOT NULL COMMENT '支付金额',
  `status` tinyint(4) unsigned NOT NULL COMMENT '状态 0 未支付 1 已支付',
  `module` varchar(45) NOT NULL COMMENT '模块名称',
  `use_card` tinyint(3) unsigned NOT NULL COMMENT '使用卡券',
  `card_type` tinyint(3) unsigned NOT NULL COMMENT '卡券类型',
  `card_id` int(10) unsigned NOT NULL COMMENT '卡券编号',
  `card_fee` decimal(10,2) NOT NULL COMMENT '卡券金额',
  `goods_name` varchar(300) NOT NULL COMMENT '商品名称',
  `attach` varchar(300) NOT NULL COMMENT '附加数据',
  `body` varchar(300) NOT NULL COMMENT '商品描述',
  PRIMARY KEY (`pid`),
  KEY `siteid` (`siteid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='支付记录';



# Dump of table hd_profile_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_profile_fields`;

CREATE TABLE `hd_profile_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(45) NOT NULL COMMENT '字段名',
  `title` varchar(45) NOT NULL COMMENT '中文标题',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `required` tinyint(1) NOT NULL COMMENT '必须填写',
  `showinregister` tinyint(1) NOT NULL COMMENT '注册时显示',
  `status` tinyint(1) NOT NULL COMMENT '使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='个人信息中文名称与状态';

LOCK TABLES `hd_profile_fields` WRITE;
/*!40000 ALTER TABLE `hd_profile_fields` DISABLE KEYS */;

INSERT INTO `hd_profile_fields` (`id`, `field`, `title`, `orderby`, `required`, `showinregister`, `status`)
VALUES
  (1,'qq','QQ号',0,1,1,0),
  (2,'realname','真实姓名',0,1,1,0),
  (3,'nickname','昵称',0,1,1,1),
  (4,'mobile','手机号码',0,1,1,1),
  (5,'telephone','固定电话',0,0,0,1),
  (6,'vip','VIP级别',0,0,0,1),
  (7,'address','居住地址',0,0,0,1),
  (8,'zipcode','邮编',0,0,0,1),
  (9,'alipay','阿里帐号',0,0,0,1),
  (10,'msn','msn帐号',0,0,0,1),
  (11,'taobao','淘宝帐号',0,0,0,1),
  (12,'email','邮箱',0,1,1,1),
  (13,'site','个人站点',0,0,0,1),
  (14,'nationality','国籍',0,0,0,1),
  (15,'introduce','自我介绍',0,0,0,1),
  (16,'gender','性别',0,0,0,1),
  (17,'graduateschool','毕业学校',0,0,0,1),
  (18,'height','身高',0,0,0,1),
  (19,'weight','体重',0,0,0,1),
  (20,'bloodtype','血型',0,0,0,1),
  (21,'birthyear','出生日期',0,0,0,1);

/*!40000 ALTER TABLE `hd_profile_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_reply_basic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_reply_basic`;

CREATE TABLE `hd_reply_basic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `content` varchar(500) NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='普通文本回复';



# Dump of table hd_reply_cover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_reply_cover`;

CREATE TABLE `hd_reply_cover` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `web_id` int(11) unsigned NOT NULL COMMENT '微站编号',
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `module` varchar(45) NOT NULL COMMENT '模块名称',
  `do` varchar(45) NOT NULL COMMENT '模块动作',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块封面关键词回复内容';



# Dump of table hd_reply_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_reply_image`;

CREATE TABLE `hd_reply_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `mediaid` varchar(255) NOT NULL COMMENT '微信medicaid',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;



# Dump of table hd_reply_news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_reply_news`;

CREATE TABLE `hd_reply_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `pid` int(10) unsigned NOT NULL COMMENT '父级',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `author` varchar(45) DEFAULT NULL COMMENT '作者',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `content` mediumtext NOT NULL COMMENT '内容',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `rank` tinyint(255) unsigned NOT NULL COMMENT '排序',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图文回复';



# Dump of table hd_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_rule`;

CREATE TABLE `hd_rule` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '规则名称',
  `module` varchar(80) NOT NULL DEFAULT '' COMMENT '模块名称',
  `rank` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '是否禁用',
  PRIMARY KEY (`rid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回复规则';



# Dump of table hd_rule_keyword
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_rule_keyword`;

CREATE TABLE `hd_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL COMMENT '规则编号',
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `content` varchar(200) NOT NULL COMMENT '关键词内容',
  `type` varchar(45) NOT NULL COMMENT '关键词类型 1: 完全匹配  2:包含  3:正则 4:直接托管',
  `rank` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL COMMENT '是否开启',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='回复规则关键词';



# Dump of table hd_site
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_site`;

CREATE TABLE `hd_site` (
  `siteid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '站点名称',
  `weid` int(10) unsigned NOT NULL COMMENT '微信编号',
  `allfilesize` int(11) NOT NULL COMMENT '服务器可使用的空间大小',
  `createtime` int(10) unsigned NOT NULL COMMENT '站点创建时间',
  `description` varchar(300) NOT NULL DEFAULT '' COMMENT '描述',
  `domain` varchar(100) NOT NULL DEFAULT '' COMMENT '域名',
  `module` char(20) NOT NULL DEFAULT '' COMMENT '通过域名访问时的默认模块',
  PRIMARY KEY (`siteid`),
  KEY `weid` (`weid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点信息';

LOCK TABLES `hd_site` WRITE;
/*!40000 ALTER TABLE `hd_site` DISABLE KEYS */;

INSERT INTO `hd_site` (`siteid`, `name`, `weid`, `allfilesize`, `createtime`, `description`, `domain`, `module`)
VALUES
  (1,'测试站点',9,200,1469001908,'','','');

/*!40000 ALTER TABLE `hd_site` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_site_modules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_site_modules`;

CREATE TABLE `hd_site_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `module` varchar(45) DEFAULT NULL COMMENT '模块名称',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点扩展模块';



# Dump of table hd_site_package
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_site_package`;

CREATE TABLE `hd_site_package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `package_id` int(10) NOT NULL COMMENT '套餐编号',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点可以使用的套餐';



# Dump of table hd_site_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_site_setting`;

CREATE TABLE `hd_site_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `grouplevel` tinyint(1) unsigned NOT NULL COMMENT '会员组变更设置 1 不自动变更   2根据总积分多少自动升降   3 根据总积分多少只升不降',
  `default_template` tinyint(1) unsigned NOT NULL COMMENT '默认网站模板',
  `creditnames` varchar(1000) NOT NULL COMMENT '积分名称',
  `creditbehaviors` varchar(1000) NOT NULL COMMENT '积分策略',
  `welcome` varchar(60) NOT NULL COMMENT '用户添加公众帐号时发送的欢迎信息',
  `default_message` varchar(60) NOT NULL COMMENT '系统不知道该如何回复粉丝的消息时默认发送的内容',
  `register` varchar(2000) NOT NULL DEFAULT '' COMMENT '注册设置',
  `smtp` varchar(2000) NOT NULL DEFAULT '' COMMENT '邮件通知',
  `pay` varchar(2000) NOT NULL DEFAULT '' COMMENT '支付设置',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点设置';



# Dump of table hd_site_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_site_template`;

CREATE TABLE `hd_site_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `template` varchar(45) NOT NULL DEFAULT '' COMMENT '模块名称',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点扩展模板';



# Dump of table hd_site_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_site_user`;

CREATE TABLE `hd_site_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `siteid` int(10) unsigned DEFAULT NULL COMMENT '站点id',
  `role` varchar(20) DEFAULT NULL COMMENT '角色类型：owner: 所有者 manage: 管理员  operate: 操作员',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点管理员';



# Dump of table hd_site_wechat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_site_wechat`;

CREATE TABLE `hd_site_wechat` (
  `weid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `wename` varchar(45) NOT NULL COMMENT '微信名称',
  `account` varchar(45) NOT NULL COMMENT '公众号帐号',
  `original` varchar(45) NOT NULL COMMENT '原始ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '级别 1:普通订阅号 2:普通服务号 3:认证订阅号 4:认证服务号/认证媒体/政府订阅号',
  `appid` varchar(100) NOT NULL COMMENT 'AppId',
  `appsecret` varchar(100) NOT NULL COMMENT 'AppSecret',
  `qrcode` varchar(200) NOT NULL COMMENT '二维码图片',
  `icon` varchar(200) NOT NULL COMMENT '头像',
  `is_connect` tinyint(1) NOT NULL COMMENT '公众号接入状态',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT '微信平台token',
  `encodingaeskey` varchar(50) NOT NULL DEFAULT '' COMMENT '微信平台encodingaeskey',
  PRIMARY KEY (`weid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信帐号';

LOCK TABLES `hd_site_wechat` WRITE;
/*!40000 ALTER TABLE `hd_site_wechat` DISABLE KEYS */;

INSERT INTO `hd_site_wechat` (`weid`, `siteid`, `wename`, `account`, `original`, `level`, `appid`, `appsecret`, `qrcode`, `icon`, `is_connect`, `token`, `encodingaeskey`)
VALUES
  (1,1,'后盾','aihoudun','gh_65598c47b2b9',4,'wxc47243ed572e273d','1c72ad236f72c70e347343653410934b','attachment/2016/10/07/13311475772067.jpg','resource/images/hd.png',1,'d5cd6efca1ddb64ad5a264495270c3','73af4a950da79a735f763be1d26ec35e049453adfbc');

/*!40000 ALTER TABLE `hd_site_wechat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_template`;

CREATE TABLE `hd_template` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '模板名称',
  `title` varchar(200) NOT NULL COMMENT '中文标题',
  `version` varchar(45) NOT NULL COMMENT '版本号',
  `resume` varchar(500) NOT NULL DEFAULT '' COMMENT '模板描述',
  `author` varchar(45) NOT NULL COMMENT '作者',
  `url` varchar(300) NOT NULL COMMENT '发布页URL地址',
  `industry` varchar(45) NOT NULL DEFAULT '' COMMENT '行业类型 hotel(酒店) car(汽车) tour(旅游) real(房地产) medical(医疗) 教育(edu) beauty(美容健身) photography(婚纱摄影) other(其他行业)',
  `position` tinyint(4) unsigned NOT NULL COMMENT '位置 ',
  `is_system` tinyint(1) unsigned NOT NULL COMMENT '系统模板',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '模板缩略图',
  `is_default` tinyint(1) unsigned NOT NULL COMMENT '默认模板',
  `locality` tinyint(1) unsigned NOT NULL COMMENT '本地模板',
  `module` char(20) DEFAULT NULL COMMENT '模块名称,只为指定模块指定',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点模板';

LOCK TABLES `hd_template` WRITE;
/*!40000 ALTER TABLE `hd_template` DISABLE KEYS */;

INSERT INTO `hd_template` (`tid`, `name`, `title`, `version`, `resume`, `author`, `url`, `industry`, `position`, `is_system`, `thumb`, `is_default`, `locality`, `module`)
VALUES
  (1,'default','默认模板','1.9','HDCMS 默认模板','后盾人','http://open.hdcms.com','other',10,1,'thumb.jpg',0,1,'article');

/*!40000 ALTER TABLE `hd_template` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_ticket
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_ticket`;

CREATE TABLE `hd_ticket` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `sn` varchar(45) NOT NULL COMMENT 'SN',
  `type` tinyint(1) unsigned NOT NULL COMMENT '1 代金券 2 折扣券',
  `condition` decimal(10,2) NOT NULL COMMENT '满多少钱可以使用',
  `discount` decimal(10,2) NOT NULL COMMENT '可享受的折扣或现金优惠',
  `thumb` varchar(300) NOT NULL COMMENT '缩略图',
  `description` text NOT NULL COMMENT '文字描述',
  `credittype` varchar(20) NOT NULL COMMENT '积分类型',
  `credit` int(10) unsigned NOT NULL COMMENT '积分数量',
  `starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `limit` int(10) unsigned NOT NULL COMMENT '每人可使用的数量',
  `amount` int(10) unsigned NOT NULL COMMENT '券的总数量',
  PRIMARY KEY (`tid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='折扣券';



# Dump of table hd_ticket_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_ticket_groups`;

CREATE TABLE `hd_ticket_groups` (
  `tgid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点id',
  `tid` int(10) unsigned NOT NULL COMMENT '优惠券或代金券编号',
  `group_id` int(10) unsigned NOT NULL COMMENT '会员组编号',
  PRIMARY KEY (`tgid`),
  KEY `siteid` (`siteid`),
  KEY `tid` (`tid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代金券和优惠券可使用的会员组';



# Dump of table hd_ticket_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_ticket_module`;

CREATE TABLE `hd_ticket_module` (
  `tmid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL COMMENT '券编号',
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `module` varchar(100) NOT NULL DEFAULT '' COMMENT '模块名称',
  PRIMARY KEY (`tmid`),
  KEY `tid` (`tid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代金券或优惠券可使用的模块';



# Dump of table hd_ticket_record
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_ticket_record`;

CREATE TABLE `hd_ticket_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `tid` int(10) unsigned NOT NULL COMMENT '卡券编号',
  `uid` int(11) NOT NULL COMMENT '会员编号',
  `createtime` int(10) NOT NULL COMMENT '兑换卡券时间',
  `usetime` int(10) NOT NULL COMMENT '使用时间',
  `module` varchar(45) NOT NULL COMMENT '使用模块 system 为系统核销',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL COMMENT '状态 1 未使用 2 使用',
  `manage` int(10) unsigned NOT NULL COMMENT '核销员编号',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  KEY `siteid` (`siteid`),
  KEY `manage` (`manage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='折扣券与代金券使用记录';



# Dump of table hd_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_user`;

CREATE TABLE `hd_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `groupid` int(11) NOT NULL,
  `username` char(30) NOT NULL COMMENT '用户名',
  `password` char(50) NOT NULL COMMENT '密码',
  `security` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `regtime` int(10) NOT NULL COMMENT '注册时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `lasttime` int(10) NOT NULL COMMENT '最后登录时间',
  `lastip` varchar(15) NOT NULL COMMENT '最后登录ip',
  `starttime` int(10) NOT NULL COMMENT '会员开始时间',
  `endtime` int(10) NOT NULL COMMENT '会员到期时间',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ号',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(20) NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile_valid` tinyint(1) NOT NULL COMMENT '手机验证',
  `email_valid` tinyint(1) NOT NULL COMMENT '邮箱验证',
  `remark` varchar(300) NOT NULL COMMENT '备注',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

LOCK TABLES `hd_user` WRITE;
/*!40000 ALTER TABLE `hd_user` DISABLE KEYS */;

INSERT INTO `hd_user` (`uid`, `groupid`, `username`, `password`, `security`, `status`, `regtime`, `regip`, `lasttime`, `lastip`, `starttime`, `endtime`, `qq`, `mobile`, `email`, `mobile_valid`, `email_valid`, `remark`)
VALUES
  (1,0,'admin','ef434868e24e53c7e078b623b8dcc546','a7f6d04db8',1,1465771582,'123.119.83.235',1475964351,'221.220.18.45',0,0,'232323','','',0,0,'');

/*!40000 ALTER TABLE `hd_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_user_group`;

CREATE TABLE `hd_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '组名',
  `maxsite` int(11) DEFAULT NULL COMMENT '站点数量',
  `daylimit` int(11) DEFAULT NULL COMMENT '有效期限',
  `package` varchar(2000) DEFAULT NULL COMMENT '可使用的公众服务套餐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员组';

LOCK TABLES `hd_user_group` WRITE;
/*!40000 ALTER TABLE `hd_user_group` DISABLE KEYS */;

INSERT INTO `hd_user_group` (`id`, `name`, `maxsite`, `daylimit`, `package`)
VALUES
  (1,'体验用户组',5,7,'s:0:\"\";');

/*!40000 ALTER TABLE `hd_user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_user_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_user_permission`;

CREATE TABLE `hd_user_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `siteid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'system 系统  具体模块名如houdun guaguaka',
  `permission` varchar(1000) NOT NULL COMMENT '权限内容以|分隔',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `siteid` (`siteid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户权限分配';



# Dump of table hd_user_profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_user_profile`;

CREATE TABLE `hd_user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `qq` varchar(15) NOT NULL DEFAULT '',
  `realname` varchar(15) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `nickname` varchar(45) NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `telephone` varchar(15) NOT NULL DEFAULT '' COMMENT '固定电话',
  `vip` tinyint(3) unsigned NOT NULL COMMENT 'VIP级别',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '邮寄地址',
  `zipcode` varchar(10) NOT NULL DEFAULT '' COMMENT '邮编',
  `alipay` varchar(45) NOT NULL DEFAULT '' COMMENT '阿里帐号',
  `msn` varchar(45) NOT NULL DEFAULT '' COMMENT 'msn帐号',
  `taobao` varchar(45) NOT NULL DEFAULT '' COMMENT '淘宝帐号',
  `email` varchar(45) NOT NULL DEFAULT '' COMMENT '邮箱',
  `site` varchar(45) NOT NULL DEFAULT '' COMMENT '个人站点',
  `nationality` varchar(45) NOT NULL DEFAULT '' COMMENT '国籍',
  `introduce` varchar(200) NOT NULL DEFAULT '' COMMENT '自我介绍',
  `gender` varchar(10) NOT NULL DEFAULT '' COMMENT '性别',
  `graduateschool` varchar(45) NOT NULL DEFAULT '' COMMENT '毕业学校',
  `height` varchar(10) NOT NULL DEFAULT '' COMMENT '身高',
  `weight` varchar(10) NOT NULL DEFAULT '' COMMENT '体重',
  `bloodtype` varchar(5) NOT NULL DEFAULT '' COMMENT '血型',
  `birthyear` smallint(6) NOT NULL COMMENT '出生年',
  `birthmonth` tinyint(3) unsigned NOT NULL COMMENT '出生月',
  `birthday` tinyint(3) unsigned NOT NULL COMMENT '出生日',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';



# Dump of table hd_web
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_web`;

CREATE TABLE `hd_web` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `site_info` text NOT NULL COMMENT '序列化的数据',
  `is_default` tinyint(1) NOT NULL COMMENT '默认站点',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点设置';

LOCK TABLES `hd_web` WRITE;
/*!40000 ALTER TABLE `hd_web` DISABLE KEYS */;

INSERT INTO `hd_web` (`id`, `siteid`, `title`, `template_name`, `status`, `site_info`, `is_default`)
VALUES
  (1,1,'默认站点','default',1,'{\"rid\":0,\"status\":1,\"is_default\":0,\"title\":\"默认站点\",\"template_tid\":\"1\",\"template_title\":\"默认模板\",\"template_name\":\"default\",\"template_thumb\":\"thumb.jpg\",\"keyword\":\"a\",\"thumb\":\"attachment/2016/10/07/85811475772462.png\",\"description\":\"页面描述\"}',1);

/*!40000 ALTER TABLE `hd_web` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hd_web_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_web_article`;

CREATE TABLE `hd_web_article` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '微信规则编号',
  `keyword` varchar(30) NOT NULL COMMENT '微信回复关键词',
  `iscommend` tinyint(1) unsigned NOT NULL COMMENT '推荐',
  `ishot` tinyint(1) unsigned NOT NULL COMMENT '头条',
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `title` varchar(145) NOT NULL COMMENT '标题',
  `category_cid` int(10) unsigned NOT NULL COMMENT '栏目编号',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `content` mediumtext NOT NULL,
  `source` varchar(45) NOT NULL COMMENT '来源',
  `author` varchar(45) NOT NULL COMMENT '作者',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `linkurl` varchar(145) NOT NULL COMMENT '外部链接地址',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  `click` mediumint(8) unsigned NOT NULL COMMENT '点击数',
  `thumb` varchar(300) NOT NULL COMMENT '缩略图',
  `web_id` int(10) NOT NULL COMMENT '站点编号',
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`),
  KEY `category_cid` (`category_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点文章';



# Dump of table hd_web_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_web_category`;

CREATE TABLE `hd_web_category` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '栏目标题',
  `pid` int(10) unsigned NOT NULL COMMENT '父级编号',
  `orderby` tinyint(3) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `icontype` tinyint(1) NOT NULL COMMENT '1 图标 2 图片',
  `description` varchar(255) NOT NULL COMMENT '栏目描述',
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板',
  `linkurl` varchar(300) NOT NULL COMMENT '外部链接',
  `ishomepage` tinyint(1) unsigned NOT NULL COMMENT '封面栏目',
  `css` varchar(500) NOT NULL COMMENT 'css样式',
  `web_id` int(11) NOT NULL COMMENT '选择添加到站点首页导航时的站点编号，只对微站首页导航有效',
  PRIMARY KEY (`cid`),
  KEY `siteid` (`siteid`),
  KEY `template_name` (`template_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章分类';



# Dump of table hd_web_nav
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_web_nav`;

CREATE TABLE `hd_web_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `web_id` int(10) unsigned NOT NULL COMMENT '微站编号',
  `module` varchar(100) NOT NULL COMMENT '模块',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(100) NOT NULL COMMENT '链接',
  `css` text NOT NULL COMMENT '样式',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `category_cid` int(10) unsigned NOT NULL COMMENT '栏目编号',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `position` tinyint(4) unsigned NOT NULL COMMENT '位置',
  `orderby` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `icontype` tinyint(3) unsigned NOT NULL COMMENT '图标类型 1字体 2 图片',
  `entry` varchar(10) NOT NULL DEFAULT '' COMMENT 'home 微站首页导航  profile 手机会员中心导航 member 桌面会员中心导航',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `web_id` (`web_id`),
  KEY `category_cid` (`category_cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='导航';



# Dump of table hd_web_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_web_page`;

CREATE TABLE `hd_web_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `web_id` int(10) unsigned NOT NULL COMMENT '官网编号',
  `title` varchar(150) NOT NULL COMMENT '各称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `params` longtext NOT NULL COMMENT '参数',
  `html` longtext NOT NULL COMMENT 'html页面代码 ',
  `type` tinyint(1) NOT NULL COMMENT '1 快捷导航 2专题页面 3 会员中心',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `web_id` (`web_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微官网页面(快捷导航/专题页面)';



# Dump of table hd_web_slide
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hd_web_slide`;

CREATE TABLE `hd_web_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` int(10) unsigned NOT NULL COMMENT '站点编号',
  `web_id` int(10) unsigned NOT NULL COMMENT '官网编号',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `displayorder` tinyint(4) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `web_id` (`web_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='幻灯图片';