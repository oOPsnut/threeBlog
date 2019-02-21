

SET FOREIGN_KEY_CHECKS=0;
/*--------------------------------- 
	t_user 表
-----------------------------------*/
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` VARCHAR(32) NOT NULL,
  `username` VARCHAR(20) DEFAULT NULL,
  `password` VARCHAR(40) NOT NULL,
  `age` INT(10) UNSIGNED DEFAULT NULL,
  `sex` CHAR(2) DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `introduction` VARCHAR(512) DEFAULT NULL,
  `head` VARCHAR(128) DEFAULT '/ThreeBlog_V1.0/image/head.png',
  `album` VARCHAR(2048) DEFAULT NULL,
  `province` VARCHAR(12) DEFAULT NULL,
  `city` VARCHAR(12) DEFAULT NULL,
  `register_time` DATE NOT NULL,
  `last_login_time` DATE DEFAULT NULL,
  `ban_time` DATE DEFAULT '2000-01-01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_admin表
-----------------------------------*/
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` VARCHAR(32) NOT NULL,
  `username` VARCHAR(20) DEFAULT NULL,
  `password` VARCHAR(40) DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `license_code` VARCHAR(40) NOT NULL,
  `register_time` DATE DEFAULT NULL,
  `last_login_time` DATE DEFAULT NULL, 
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_article 表
-----------------------------------*/
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` VARCHAR(32) NOT NULL,
  `author_id` VARCHAR(32) NOT NULL,
  `author` VARCHAR(20) NOT NULL,
  `cover` VARCHAR(128) DEFAULT NULL,
  `title` VARCHAR(64) NOT NULL,
  `introduction` VARCHAR(320) NOT NULL,
  `label` VARCHAR(32) DEFAULT NULL,
  `text` MEDIUMTEXT,
  `allpic` TEXT,
  `publish_date` DATETIME DEFAULT NULL,
  `click_num` INT(11) DEFAULT NULL,
  `liked_num` INT(11) UNSIGNED DEFAULT NULL,
  `collect_num` INT(11) UNSIGNED DEFAULT NULL,
  `comment_num` INT(11) UNSIGNED DEFAULT NULL,
  `status` VARCHAR(3) DEFAULT '正常',
  PRIMARY KEY (`id`),
  KEY `t_article_ibfk_1` (`author_id`),
  CONSTRAINT `t_article_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_comment 表
-----------------------------------*/
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` VARCHAR(32) NOT NULL,
  `article_id` VARCHAR(32) NOT NULL,
  `author_id` VARCHAR(32) NOT NULL,
  `text` VARCHAR(512) NOT NULL,
  `add_time` DATETIME NOT NULL,
  `zan` INT(10) UNSIGNED DEFAULT NULL,
  `status` VARCHAR(3) DEFAULT '正常',
  PRIMARY KEY (`id`),
  KEY `t_comment_ibfk_1` (`article_id`),
  KEY `t_comment_ibfk_2` (`author_id`),
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_answer 表
-----------------------------------*/

DROP TABLE IF EXISTS `t_answer`;
CREATE TABLE `t_answer` (
  `id` VARCHAR(32) NOT NULL,
  `comment_id` VARCHAR(32) NOT NULL,
  `author_id` VARCHAR(32) NOT NULL,
  `text` TEXT NOT NULL,
  `add_time` DATETIME NOT NULL,
  `zan` INT(10) UNSIGNED DEFAULT NULL,
  `status` VARCHAR(3) DEFAULT '正常',
  PRIMARY KEY (`id`),
  KEY `t_answer_ibfk_1` (`comment_id`),
  KEY `t_answer_ibfk_2` (`author_id`),
  CONSTRAINT `t_answer_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `t_comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `t_answer_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `t_user` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


/*--------------------------------- 
	t_collect 表
-----------------------------------*/
DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `id` VARCHAR(32) NOT NULL,
  `user_id` VARCHAR(32) NOT NULL,
  `article_id` VARCHAR(32) NOT NULL,
  `author_id` VARCHAR(32) NOT NULL,
  `collect_date` DATETIME NOT NULL,
  `status` VARCHAR(3) DEFAULT '未读',
  `cpic` VARCHAR(42)  DEFAULT '/ThreeBlog_V1.0/image/unfavor.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`article_id`),
  KEY `article_id` (`article_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `t_collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_collect_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_collect_ibfk_4` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_follow 表
-----------------------------------*/

DROP TABLE IF EXISTS `t_follow`;
CREATE TABLE `t_follow` (
  `id` VARCHAR(32) NOT NULL,
  `following_id` VARCHAR(32) NOT NULL,
  `follower_id` VARCHAR(32) NOT NULL,
  `follow_date` DATETIME DEFAULT NULL,
  `status` VARCHAR(3) DEFAULT '未读',
  PRIMARY KEY (`id`),
  UNIQUE KEY `following_id` (`following_id`,`follower_id`),
  KEY `follower_id` (`follower_id`),
  CONSTRAINT `t_follow_ibfk_1` FOREIGN KEY (`following_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_follow_ibfk_2` FOREIGN KEY (`follower_id`) REFERENCES `t_user` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;


/*--------------------------------- 
	t_zan 表
-----------------------------------*/
DROP TABLE IF EXISTS `t_zan`;
CREATE TABLE `t_zan` (
  `id` VARCHAR(32) NOT NULL,
  `type` VARCHAR(4) NOT NULL,
  `receiver_id` VARCHAR(32) NOT NULL,
  `sender_id` VARCHAR(32) NOT NULL,
  `article_id` VARCHAR(32) NOT NULL,
  `text` VARCHAR(512) NOT NULL,
  `add_time` DATETIME NOT NULL,
  `status` VARCHAR(3) DEFAULT '未读',
  `zpic` VARCHAR(32) DEFAULT '/ThreeBlog_V1.0/image/unlike.png',
  PRIMARY KEY (`id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `sender_id` (`sender_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `t_zan_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_zan_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_zan_ibfk_3` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_message表
-----------------------------------*/
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` VARCHAR(32) NOT NULL,
  `type` VARCHAR(4) NOT NULL,
  `receiver_id` VARCHAR(32) NOT NULL,
  `answer_id` VARCHAR(32) NOT NULL,
  `article_id` VARCHAR(32) NOT NULL,
  `text1` VARCHAR(512) NOT NULL,
  `text2` VARCHAR(512) DEFAULT NULL,
  `add_time` DATETIME NOT NULL,
  `status` VARCHAR(3) DEFAULT '未读',
  PRIMARY KEY (`id`),
  KEY `receiver_id` (`receiver_id`),
  KEY `answer_id` (`answer_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `t_message_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_message_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_message_ibfk_3` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`) ON DELETE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_report表
-----------------------------------*/
DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report` (
  `id` VARCHAR(32) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `type` VARCHAR(4) NOT NULL,
  `content` VARCHAR(512) DEFAULT NULL,
  `simple_reason` VARCHAR(20) NOT NULL,
  `all_reason` VARCHAR(512) DEFAULT NULL,
  `feedback_reason` VARCHAR(512) DEFAULT NULL, 
  `url` VARCHAR(100) DEFAULT NULL,
  `author_id` VARCHAR(32) DEFAULT NULL,
  `user_id` VARCHAR(32) NOT NULL,
  `content_id` VARCHAR(32) NOT NULL,
  `add_time` DATETIME NOT NULL , 
  `notice_time` DATETIME NULL,
  `status1` VARCHAR(6) DEFAULT '未处理',
  `status2` VARCHAR(6) DEFAULT '正常',
  `status3` VARCHAR(6) DEFAULT '未确定',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `author_id` (`author_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_report_ibfk_1` FOREIGN KEY (`username`) REFERENCES `t_user` (`username`),
  CONSTRAINT `t_report_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_report_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_articleType表
-----------------------------------*/
DROP TABLE IF EXISTS `t_articleType`;
CREATE TABLE `t_articleType` (
  `id` VARCHAR(32) NOT NULL,
  `author_id` VARCHAR(32) NOT NULL,
  `article_id` VARCHAR(32) NOT NULL,
  `article_type` VARCHAR(32) DEFAULT '默认分类',
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `t_articleType_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `t_article` (`id`),
  CONSTRAINT `t_articleType_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `t_user` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_ablum表
-----------------------------------*/
DROP TABLE IF EXISTS `t_ablum`;
CREATE TABLE `t_ablum` (
  `id` VARCHAR(32) NOT NULL,
  `user_id` VARCHAR(32) NOT NULL,
  `photo` VARCHAR(512) NOT NULL,
  `upload_date` DATETIME NOT NULL,
  `status` VARCHAR(6) DEFAULT '正常',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `t_ablum_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*--------------------------------- 
	t_notice表
-----------------------------------*/
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` VARCHAR(32) NOT NULL,
  `admin_id` VARCHAR(32) NOT NULL,
  `admin_username` VARCHAR(20) DEFAULT NULL,
  `photo` VARCHAR(512) DEFAULT NULL,
  `title` VARCHAR(20) NOT NULL,
  `type` VARCHAR(12) NOT NULL,
  `content` TEXT NOT NULL,
  `publish_date` DATETIME NOT NULL ,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `t_notice_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `t_admin` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;