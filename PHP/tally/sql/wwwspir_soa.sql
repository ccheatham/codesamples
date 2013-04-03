# MySQL-Front 3.2  (Build 4.21)

# Host: spirit-of-america.com    Database: wwwspir_soa
# ------------------------------------------------------
# Server version 4.0.25-standard

CREATE DATABASE `wwwspir_soa`;

USE `wwwspir_soa`;

#
# Table Objects for table ordertaker
#

CREATE TABLE `ordertaker` (
  `ordertakerid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default 'New Order Taker',
  `fk_sectionid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ordertakerid`),
  KEY `section_index` (`fk_sectionid`)
) TYPE=MyISAM;

#
# Dumping data for table ordertaker
#

INSERT INTO `ordertaker` (`ordertakerid`,`name`,`fk_sectionid`) VALUES (1,'Noah Cheatham',2);

#
# Table Objects for table ordertaker_product
#

CREATE TABLE `ordertaker_product` (
  `fk_productid` int(11) NOT NULL default '0',
  `fk_ordertakerid` int(11) NOT NULL default '0',
  `unitcount` int(11) NOT NULL default '0',
  KEY `product_index` (`fk_productid`),
  KEY `ordertaker_index` (`fk_ordertakerid`),
  KEY `ordertaker_product_index` (`fk_ordertakerid`,`fk_productid`)
) TYPE=MyISAM;

#
# Dumping data for table ordertaker_product
#

INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (1,1,0);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (2,1,0);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (3,1,0);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (4,1,1);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (5,1,0);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (6,1,0);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (7,1,2);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (8,1,3);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (9,1,4);
INSERT INTO `ordertaker_product` (`fk_productid`,`fk_ordertakerid`,`unitcount`) VALUES (10,1,5);

#
# Table Objects for table organization
#

CREATE TABLE `organization` (
  `organizationid` int(11) NOT NULL auto_increment,
  `firstname` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `company` varchar(255) default 'Your Company Name (click to change)',
  `addr` varchar(255) default NULL,
  `addr2` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `zipcode` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `primaryemail` varchar(255) default NULL,
  `custnum` int(10) default NULL,
  `phone` varchar(255) default NULL,
  `last_ad` varchar(255) default NULL,
  `odr_date` timestamp(19) NOT NULL,
  `ctype` varchar(255) default NULL,
  `ord_freq` int(10) default NULL,
  `gross` int(10) default NULL,
  `entrydate` timestamp(19) NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`organizationid`),
  KEY `auth_lookup_index` (`custnum`,`zipcode`)
) TYPE=MyISAM ROW_FORMAT=DYNAMIC;

#
# Dumping data for table organization
#

INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (1,'Ms Jacquline','Singletary','Mega Force Ministries','','312 Eugene St','Lake City','SC','29560','',NULL,132964,'(843) 394-9862','2MSCE59','0000-00-00 00:00:00','H',0,0,'0000-00-00 00:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (2,'Ms Jeanette','Thomas','Gospel Temple Cong','','513 Summitt St','Blytheville','AR','72315','',NULL,132211,'(870) 763-2301','22FRN5W','0000-00-00 00:00:00','H',0,0,'2009-09-20 05:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (3,'Ms Mary','Watson','American Legion Unit #121','','3336 Hwy 4','Jay','FL','32565','',NULL,132965,'(850) 549-7514','2MALE59','0000-00-00 00:00:00','9',0,0,'0000-00-00 00:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (4,'Ms Michelle','Nash','Hancock Childcare Ctr','','22 Henderson Grove Rd','Lewisport','KY','42351','',NULL,132962,'(270) 295-3785','2MKYE58','0000-00-00 00:00:00','U',0,0,'0000-00-00 00:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (5,'Ms Nadean','Searcy','Simon Chapel Cong','','528 Old Newson Rd','Whiteville','TN','38075','',NULL,132961,'(731) 254-9035','2MTNE59','0000-00-00 00:00:00','H',0,0,'0000-00-00 00:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (6,'Ms Nancy','Pearce','1st Baptist Children\'s Center','','50 E Main St','Maiden','NC','28650','',NULL,118333,'(828) 428-9888','2TPBE5W','0000-00-00 00:00:00','B',1,1260,'0000-00-00 00:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (7,'Ms Shannon','Smith','C S A Pack #340','','110 El Monte Cir','West Columbia','SC','29170','',NULL,117088,'(803) 206-8765','2231557','0000-00-00 00:00:00','Y',1,1536,'0000-00-00 00:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (8,'Ms Summer','Centers','','','1108 Hammond Lane','Lawrenceburg','KY','40342','',NULL,132967,'(502) 418-5070','2MKYE59','0000-00-00 00:00:00','9',0,0,'0000-00-00 00:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (9,'Ms Tammy','Brown','New Life Outreach Youth','','1118 Waren Chapel Rd','Sparta','GA','31087','',NULL,132963,'(706) 816-9129','2MGAE59','0000-00-00 00:00:00','H',0,0,'0000-00-00 00:00:00');
INSERT INTO `organization` (`organizationid`,`firstname`,`lastname`,`company`,`addr`,`addr2`,`city`,`state`,`zipcode`,`country`,`primaryemail`,`custnum`,`phone`,`last_ad`,`odr_date`,`ctype`,`ord_freq`,`gross`,`entrydate`) VALUES (10,'Ms Victoria','Barton','','','4971 C R 30','Ethelsville','AL','35461-3316','',NULL,132220,'(205) 658-2507','22FRN5W','0000-00-00 00:00:00','B',0,0,'2009-09-20 05:00:00');

#
# Table Objects for table organization_product
#

CREATE TABLE `organization_product` (
  `fk_organizationid` int(11) NOT NULL default '0',
  `fk_productid` int(11) NOT NULL default '0',
  `productprice` double(6,2) NOT NULL default '0.00',
  KEY `organizationid_productid_index` (`fk_productid`,`fk_organizationid`),
  KEY `organization_index` (`fk_organizationid`),
  KEY `product_index` (`fk_productid`)
) TYPE=MyISAM;

#
# Dumping data for table organization_product
#

INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (1,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (2,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (3,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (4,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (5,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (6,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (7,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (8,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (9,10,20);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,1,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,2,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,3,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,4,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,5,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,6,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,7,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,8,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,9,12);
INSERT INTO `organization_product` (`fk_organizationid`,`fk_productid`,`productprice`) VALUES (10,10,20);

#
# Table Objects for table organization_productset
#

CREATE TABLE `organization_productset` (
  `fk_productsetid` int(11) default '0',
  `fk_organizationid` int(11) NOT NULL default '0',
  KEY `productkey_organizationkey_index` (`fk_productsetid`,`fk_organizationid`),
  KEY `productset_index` (`fk_productsetid`),
  KEY `organization_index` (`fk_organizationid`)
) TYPE=MyISAM;

#
# Dumping data for table organization_productset
#

INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,1);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,2);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,3);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,4);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,5);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,6);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,7);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,8);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,9);
INSERT INTO `organization_productset` (`fk_productsetid`,`fk_organizationid`) VALUES (2,10);

#
# Table Objects for table product
#

CREATE TABLE `product` (
  `productid` int(11) NOT NULL auto_increment,
  `fk_productsetid` int(11) NOT NULL default '0',
  `name` varchar(255) default 'New Product',
  `sku` varchar(100) default NULL,
  `casecount` int(11) NOT NULL default '1',
  `defaultprice` double(6,2) NOT NULL default '0.00',
  `columncolorcssclass` varchar(30) default NULL,
  PRIMARY KEY  (`productid`),
  KEY `product_set_index` (`fk_productsetid`)
) TYPE=MyISAM;

#
# Dumping data for table product
#

INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (1,2,'Chocolate Chunk','43482',8,12,'prodA');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (2,2,'Peanut Butter','43472',8,12,'prodB');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (3,2,'Oatmeal Raisin','43462',8,12,'prodC');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (4,2,'Sugar Cookie','43452',8,12,'prodD');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (5,2,'White Chunk Macadamia Nut','43442',8,12,'prodE');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (6,2,'Chocolate Chip','43432',8,12,'prodF');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (7,2,'Mint Chocolate Chip','43422',8,12,'prodA');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (8,2,'Cookie with M & M’s','43412',8,12,'prodB');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (9,2,'Snicker-Doodle','43392',8,12,'prodC');
INSERT INTO `product` (`productid`,`fk_productsetid`,`name`,`sku`,`casecount`,`defaultprice`,`columncolorcssclass`) VALUES (10,2,'Sugar Free Chocolate Chip (2lb. tub)','43482',12,20,'prodD');

#
# Table Objects for table productset
#

CREATE TABLE `productset` (
  `productsetid` int(11) NOT NULL auto_increment,
  `code` varchar(25) NOT NULL default '',
  `name` varchar(255) NOT NULL default 'New Product Set',
  `bdefault` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`productsetid`)
) TYPE=MyISAM;

#
# Dumping data for table productset
#

INSERT INTO `productset` (`productsetid`,`code`,`name`,`bdefault`) VALUES (2,'05-FALL-CD','Chippery Cookie Dough',1);

#
# Table Objects for table section
#

CREATE TABLE `section` (
  `sectionid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default 'New Group',
  `fk_organizationid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`sectionid`),
  KEY `organizationid_index` (`fk_organizationid`)
) TYPE=MyISAM;

#
# Dumping data for table section
#

INSERT INTO `section` (`sectionid`,`name`,`fk_organizationid`) VALUES (1,'K-4B Whittles, Heather',9);
INSERT INTO `section` (`sectionid`,`name`,`fk_organizationid`) VALUES (2,'test',9);
