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

insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (12,'我是标题','都是范德萨范德萨','/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','<p>\r\n	<img src=\"/image/20180604/20180604210621_103.png\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	����������\r\n</p>\r\n<p>\r\n	�����˵\r\n</p>\r\n<p>\r\n	asd�������������İ�ʵ��ʵ\r\n</p>\r\n<p>\r\n	����������asd\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<ol>\r\n	<li style=\"text-align:center;\">\r\n		<br />\r\n	</li>\r\n	<li style=\"text-align:center;\">\r\n		<em><u>��ʿ�����</u></em> \r\n	</li>\r\n	<li style=\"text-align:center;\">\r\n		<em><u>��ʿ�����</u></em> \r\n	</li>\r\n	<li style=\"text-align:center;\">\r\n		<em><u>������ȥ��</u></em> \r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n</p>','2018-06-04 21:48:41',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (13,'我是尼玛','都是范德萨范德萨','/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','<p style=\"text-align:center;\">\r\n	<img src=\"/image/20180604/20180604214315_806.png\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	s<strong><em>ad��ʿ����õ���������ȵķ���</em></strong> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<strong><em>����ʱ�ռ��ʵ��ǿž���ɫ���ն�˫����</em></strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<strong><em>ɫ�ŵĵط��ǵķ�ɫ���͵�</em></strong> \r\n</div>\r\n<div style=\"text-align:center;\">\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color:#E53333;\">ˮ��ѷ���������</span> \r\n</p>','2018-06-04 21:44:12',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (14,'男大学生竟然xx','都是范德萨范德萨','/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','<p>\r\n	<img src=\"/image/20180605/20180605141903_992.png\" alt=\"\" />\r\n</p>\r\n<p>\r\n	dasefsrewfe dsfdfs&nbsp;\r\n</p>\r\n<p>\r\n	<strong><u>fds�ֶܷ���ˮ�����</u></strong>\r\n</p>','2018-06-05 14:19:13',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (15,'123','asddas','/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','dsafasdfdsa fa fd','2018-06-05 14:58:44',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (17,'xx',NULL,'/resources/171c1911-5320-47fa-9217-398f5dff0e12.png','xxx','2018-06-05 14:38:33',1,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (18,'美女直播','直播请看99re','/resources/942d4086-7978-4827-9169-6608b4786500.jpg','<h1 style=\"text-align:center;\">\r\n	<span style=\"color:#E53333;background-color:#E56600;\"><strong><em>���ྫ�ʣ������</em></strong></span><span style=\"background-color:#E56600;\"></span> \r\n</h1>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/image/20180605/20180605150544_19.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/image/20180605/20180605150553_919.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	�ÿ��� �ֵ�\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>','2018-06-05 15:10:32',7,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (19,'商业合作','请加v:123dsfakjhdsfa','/resources/d08cf921-8c9c-4362-b72c-f5178a61fdfe.jpg','<h1 style=\"text-align:center;\">\r\n	<strong><u><em>���v:123dsfakjhdsfa</em></u></strong> \r\n</h1>','2018-06-05 15:11:00',7,NULL);
insert  into `article`(`id`,`name`,`abstractinfo`,`imagepath`,`content`,`date`,`userId`,`pv`) values (20,'团购优惠','','/resources/86076150-10d4-44bf-9f1a-b16560790173.jpg','<p>\r\n	����Ӵ v:123asddas\r\n</p>\r\n<p>\r\n	<img src=\"/image/20180605/20180605150757_261.jpg\" alt=\"\" /> \r\n</p>','2018-06-05 15:10:48',7,NULL);

/*Table structure for table `category` */

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(50) default NULL COMMENT '名称',
  `type` varchar(50) default NULL COMMENT '类型：跳转url，推送文章，视图',
  `pid` bigint(20) default NULL COMMENT '父id',
  `level` int(11) default NULL COMMENT '层级 1或2',
  `articleId` bigint(20) default NULL COMMENT '文章id',
  `url` varchar(500) default NULL COMMENT '跳转的url',
  `userId` int(11) default NULL COMMENT '用户id',
  `orderNumber` int(11) default NULL COMMENT '顺序',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (152,'菜单5','ARTICLE',0,1,13,NULL,1,5);
insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (153,'美女直播','ARTICLE',0,1,18,NULL,7,1);
insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (154,'合作','VIEW',0,1,0,NULL,7,2);
insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (155,'商务','ARTICLE',154,2,19,NULL,7,1);
insert  into `category`(`id`,`name`,`type`,`pid`,`level`,`articleId`,`url`,`userId`,`orderNumber`) values (156,'团购','ARTICLE',154,2,20,NULL,7,2);

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

insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (1,'576506402@qq.com','郎世权','999999','学生','男','521598','午夜激情2');
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (3,'213123','123','123','123','男','123',NULL);
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (5,'1231321','123','312132','123','男','123213',NULL);
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (6,'123','123','321','132','男','132','123');
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (7,'576506402@qq.com','王棋','123123','学生','男','123123','午夜激情聊天');
insert  into `user`(`id`,`email`,`name`,`password`,`profession`,`sex`,`username`,`publicName`) values (8,'576506402@qq.com','123','123123','学生','女','123123123','王者荣耀');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
