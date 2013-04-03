# MySQL-Front 3.2  (Build 4.21)

# Host: spirit-of-america.com    Database: wwwspir_soa
# ------------------------------------------------------
# Server version 4.0.25-standard

USE `wwwspir_soa`;

#
# Table Objects for table organization
#

CREATE TABLE `organization` (
`organizationid` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`organizationid`),
  `firstname` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `addr2` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `zipcode` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `custnum` int(10) default NULL,
  `phone` varchar(255) default NULL,
  `last_ad` varchar(255) default NULL,
  `odr_date` timestamp(19) NOT NULL,
  `ctype` varchar(255) default NULL,
  `ord_freq` int(10) default NULL,
  `gross` int(10) default NULL,
  `entrydate` timestamp(19) NOT NULL default '0000-00-00 00:00:00'
) TYPE=MyISAM ROW_FORMAT=DYNAMIC;
