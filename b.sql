/*
SQLyog Ultimate v8.32 
MySQL - 5.0.16 : Database - stryppedwechat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`stryppedwechat` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `stryppedwechat`;

/*Table structure for table `article` */

CREATE TABLE `article` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `abstractinfo` varchar(1000) default NULL,
  `imagepath` varchar(255) default NULL,
  `content` blob,
  `date` datetime default NULL,
  `userId` int(11) default NULL,
  `pv` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (12,'æˆ‘æ˜¯æ ‡é¢˜','éƒ½æ˜¯èŒƒå¾·è¨èŒƒå¾·è¨','/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','<p>\r\n	<img src=\"/image/20180604/20180604210621_103.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	°®µÏÉúÈö¶à\r\n</p>\r\n<p>\r\n	Èö´ó´óËµ\r\n</p>\r\n<p>\r\n	asd´óÈı´óÈı´óÈıµÄ°¡Êµ´òÊµ\r\n</p>\r\n<p>\r\n	°®µÏÉú´óËùasd\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<ol>\r\n	<li style=\"text-align:center;\">\r\n		<br />\r\n	</li>\r\n	<li style=\"text-align:center;\">\r\n		<em><u>°ÂÊ¿´ï´óÏÃ</u></em> \r\n	</li>\r\n	<li style=\"text-align:center;\">\r\n		<em><u>°ÂÊ¿´ï´óÏÃ</u></em> \r\n	</li>\r\n	<li style=\"text-align:center;\">\r\n		<em><u>ÇëÎÊÎÒÈ¥¶î</u></em> \r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n</p>','2018-06-04 21:48:41',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (13,'æˆ‘æ˜¯å°¼ç›','éƒ½æ˜¯èŒƒå¾·è¨èŒƒå¾·è¨','/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','<p style=\"text-align:center;\">\r\n	<img src=\"/image/20180604/20180604214315_806.png\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	s<strong><em>ad°ÂÊ¿´ï´óÏÃµÚÈı·½µç·çÉÈµÄ·İÉÏ</em></strong> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<strong><em>¶«·½Ê±¿Õ¼õ·ÊµÄÄÇ¿Å¾üÂÌÉ«¸°ÈÕ¶øË«·½¸÷</em></strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<strong><em>É«·ÅµÄµØ·½ÊÇµÄ·ÛÉ«·¢ËÍµ½</em></strong> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color:#E53333;\">Ë®µç·Ñ·¶µÂÈø·ÖÊÖ</span> \r\n</p>','2018-06-04 21:44:12',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (14,'ç”·å¤§å­¦ç”Ÿç«Ÿç„¶xx','éƒ½æ˜¯èŒƒå¾·è¨èŒƒå¾·è¨','/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','<p>\r\n	<img src=\"/image/20180605/20180605141903_992.png\" alt=\"\" />\r\n</p>\r\n<p>\r\n	dasefsrewfe dsfdfs&nbsp;\r\n</p>\r\n<p>\r\n	<strong><u>fds×Ü·Ö¶àÉÙË®µç·ÑÈö</u></strong>\r\n</p>','2018-06-05 14:19:13',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (15,'123','asddas','/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','dsafasdfdsa fa fd','2018-06-05 14:58:44',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (17,'xx',NULL,'/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','xxx','2018-06-05 14:38:33',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (18,'ç¾å¥³ç›´æ’­','ç›´æ’­è¯·çœ‹99re','/resources/942d4086-7978-4827-9169-6608b4786500.jpg','<h1 style=\"text-align:center;\">\r\n	<span style=\"color:#E53333;background-color:#E56600;\"><strong><em>¸ü¶à¾«²Ê£¬Çë·ÃÎÊ</em></strong></span><span style=\"background-color:#E56600;\"></span> \r\n</h1>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/image/20180605/20180605150544_19.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/image/20180605/20180605150553_919.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	ºÃ¿´°É ĞÖµÜ\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>','2018-06-05 15:10:32',7,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (19,'å•†ä¸šåˆä½œ','è¯·åŠ v:123dsfakjhdsfa','/resources/d08cf921-8c9c-4362-b72c-f5178a61fdfe.jpg','<h1 style=\"text-align:center;\">\r\n	<strong><u><em>Çë¼Óv:123dsfakjhdsfa</em></u></strong> \r\n</h1>','2018-06-05 15:11:00',7,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (20,'å›¢è´­ä¼˜æƒ ','','/resources/86076150-10d4-44bf-9f1a-b16560790173.jpg','<p>\r\n	¼ÓÎÒÓ´ v:123asddas\r\n</p>\r\n<p>\r\n	<img src=\"/image/20180605/20180605150757_261.jpg\" alt=\"\" /> \r\n</p>','2018-06-05 15:10:48',7,NULL);

/*Table structure for table `category` */

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) default NULL COMMENT 'åç§°',
  `type` varchar(50) default NULL COMMENT 'ç±»å‹ï¼šè·³è½¬urlï¼Œæ¨é€æ–‡ç« ï¼Œè§†å›¾',
  `pid` bigint(20) default NULL COMMENT 'çˆ¶id',
  `level` int(11) default NULL COMMENT 'å±‚çº§ 1æˆ–2',
  `articleId` bigint(20) default NULL COMMENT 'æ–‡ç« id',
  `url` varchar(500) default NULL COMMENT 'è·³è½¬çš„url',
  `userId` int(11) default NULL COMMENT 'ç”¨æˆ·id',
  `orderNumber` int(11) default NULL COMMENT 'é¡ºåº',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (152,'èœå•5','ARTICLE',0,1,13,NULL,1,5);
insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (153,'ç¾å¥³ç›´æ’­','ARTICLE',0,1,18,NULL,7,1);
insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (154,'åˆä½œ','VIEW',0,1,0,NULL,7,2);
insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (155,'å•†åŠ¡','ARTICLE',154,2,19,NULL,7,1);
insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (156,'å›¢è´­','ARTICLE',154,2,20,NULL,7,2);

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `profession` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `publicName` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (1,'576506402@qq.com','éƒä¸–æƒ','999999','å­¦ç”Ÿ','ç”·','521598','åˆå¤œæ¿€æƒ…2');
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (3,'213123','123','123','123','ç”·','123',NULL);
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (5,'1231321','123','312132','123','ç”·','123213',NULL);
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (6,'123','123','321','132','ç”·','132','123');
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (7,'576506402@qq.com','ç‹æ£‹','123123','å­¦ç”Ÿ','ç”·','123123','åˆå¤œæ¿€æƒ…èŠå¤©');
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (8,'576506402@qq.com','123','123123','å­¦ç”Ÿ','å¥³','123123123','ç‹è€…è£è€€');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
