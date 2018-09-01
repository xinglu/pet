-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(20)  NOT NULL COMMENT 'user_name',
  `password` varchar(20)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '����',
  `userImage` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `address` varchar(80)  NOT NULL COMMENT '��ͥ��ַ',
  `createTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `noticeTitle` varchar(80)  NOT NULL COMMENT '����',
  `noticeClass` varchar(40)  NOT NULL COMMENT '�������',
  `noticeContent` varchar(5000)  NOT NULL COMMENT '��������',
  `addDate` varchar(20)  NULL COMMENT '��������',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_leaveword` (
  `leaveWordId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `leaveTitle` varchar(80)  NOT NULL COMMENT '���Ա���',
  `leaveContent` varchar(2000)  NOT NULL COMMENT '��������',
  `userObj` varchar(20)  NOT NULL COMMENT '������',
  `leaveTime` varchar(20)  NULL COMMENT '����ʱ��',
  `replyContent` varchar(1000)  NULL COMMENT '����ظ�',
  `replyTime` varchar(20)  NULL COMMENT '�ظ�ʱ��',
  PRIMARY KEY (`leaveWordId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_pet` (
  `petId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `petClassObj` int(11) NOT NULL COMMENT '�������',
  `petName` varchar(80)  NOT NULL COMMENT '��������',
  `petPhoto` varchar(60)  NOT NULL COMMENT '������Ƭ',
  `petDesc` varchar(5000)  NOT NULL COMMENT '�������',
  `petRequest` varchar(1000)  NOT NULL COMMENT '����Ҫ��',
  `petState` varchar(20)  NOT NULL COMMENT '����״̬',
  `addTime` varchar(20)  NULL COMMENT '�Ǽ�ʱ��',
  PRIMARY KEY (`petId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_petClass` (
  `petClassId` int(11) NOT NULL AUTO_INCREMENT COMMENT '�������id',
  `petClassName` varchar(20)  NOT NULL COMMENT '�����������',
  PRIMARY KEY (`petClassId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_food` (
  `foodId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `foodName` varchar(80)  NOT NULL COMMENT '��������',
  `foodPhoto` varchar(60)  NOT NULL COMMENT '������Ƭ',
  `foodDesc` varchar(5000)  NOT NULL COMMENT '��������',
  `foodNum` int(11) NOT NULL COMMENT '�������',
  `addDate` varchar(20)  NULL COMMENT '�ϼ�����',
  PRIMARY KEY (`foodId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_foodOrder` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `foodObj` int(11) NOT NULL COMMENT '��������',
  `userObj` varchar(20)  NOT NULL COMMENT 'Ԥ���û�',
  `orderNumber` int(11) NOT NULL COMMENT 'Ԥ������',
  `orderState` varchar(20)  NOT NULL COMMENT '����״̬',
  `orderTime` varchar(20)  NULL COMMENT 'Ԥ��ʱ��',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_adopt` (
  `adoptId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `petObj` int(11) NOT NULL COMMENT '����������',
  `userObj` varchar(20)  NOT NULL COMMENT '������',
  `addTime` varchar(20)  NULL COMMENT '��������ʱ��',
  `shenHe` varchar(20)  NOT NULL COMMENT '���״̬',
  PRIMARY KEY (`adoptId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_leaveword ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_pet ADD CONSTRAINT FOREIGN KEY (petClassObj) REFERENCES t_petClass(petClassId);
ALTER TABLE t_foodOrder ADD CONSTRAINT FOREIGN KEY (foodObj) REFERENCES t_food(foodId);
ALTER TABLE t_foodOrder ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_adopt ADD CONSTRAINT FOREIGN KEY (petObj) REFERENCES t_pet(petId);
ALTER TABLE t_adopt ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


