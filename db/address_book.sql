CREATE DATABASE mypage;

USE mypage;

CREATE TABLE `address_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'テーブルのキー',
  `full_name` varchar(20) NOT NULL COMMENT '氏名(姓名)',
  `birthday` date NOT NULL COMMENT '生年月日',
  `sex_code` tinyint(2) NOT NULL COMMENT '1:男、2:女',
  `postal_code` char(8) NOT NULL COMMENT '郵便番号(XXX-YYYY)',
  `prefecture_id` int(11) NOT NULL COMMENT '都道府県番号(1:北海道～47:沖縄)',
  `city` text NOT NULL COMMENT '住所(市区町村)',
  `address` text NOT NULL COMMENT '住所(番地・建物)',
  `created` datetime NOT NULL COMMENT '作成日時',
  `modified` datetime NOT NULL COMMENT '更新日時',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
