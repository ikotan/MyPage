--  CREATE DATABASE mypage;

USE mypage;

DROP TABLE `address_books`;
CREATE TABLE `address_books` (
  `address_books_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'テーブルのキー',
  `full_name` varchar(20) NOT NULL COMMENT '氏名(姓名)',
  `birthday` date NOT NULL COMMENT '生年月日',
  `sex_code` tinyint(2) NOT NULL COMMENT '1:男、2:女',
  `postal_code` char(8) NOT NULL COMMENT '郵便番号(XXX-YYYY)',
  `prefecture_id` int(11) NOT NULL COMMENT '都道府県番号(1:北海道～47:沖縄)',
  `city` text NOT NULL COMMENT '住所(市区町村)',
  `address` text NOT NULL COMMENT '住所(番地・建物)',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '作成日時',
  `last_update` timestamp DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '削除フラグ',
  PRIMARY KEY (`address_books_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE `prefectures`;
CREATE TABLE `prefectures` (
  `prefecture_id` int(11) NOT NULL COMMENT '都道府県番号(1:北海道～47:沖縄)',
  `name` varchar(20) NOT NULL COMMENT '都道府県名',
  PRIMARY KEY (`prefecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO prefectures VALUES (1, '北海道');
INSERT INTO prefectures VALUES (2, '青森県');
INSERT INTO prefectures VALUES (3, '岩手県');
INSERT INTO prefectures VALUES (4, '宮城県');
INSERT INTO prefectures VALUES (5, '秋田県');
INSERT INTO prefectures VALUES (6, '山形県');
INSERT INTO prefectures VALUES (7, '福島県');
INSERT INTO prefectures VALUES (8, '茨城県');
INSERT INTO prefectures VALUES (9, '栃木県');
INSERT INTO prefectures VALUES (10, '群馬県');
INSERT INTO prefectures VALUES (11, '埼玉県');
INSERT INTO prefectures VALUES (12, '千葉県');
INSERT INTO prefectures VALUES (13, '東京都');
INSERT INTO prefectures VALUES (14, '神奈川県');
INSERT INTO prefectures VALUES (15, '新潟県');
INSERT INTO prefectures VALUES (16, '富山県');
INSERT INTO prefectures VALUES (17, '石川県');
INSERT INTO prefectures VALUES (18, '福井県');
INSERT INTO prefectures VALUES (19, '山梨県');
INSERT INTO prefectures VALUES (20, '長野県');
INSERT INTO prefectures VALUES (21, '岐阜県');
INSERT INTO prefectures VALUES (22, '静岡県');
INSERT INTO prefectures VALUES (23, '愛知県');
INSERT INTO prefectures VALUES (24, '三重県');
INSERT INTO prefectures VALUES (25, '滋賀県');
INSERT INTO prefectures VALUES (26, '京都府');
INSERT INTO prefectures VALUES (27, '大阪府');
INSERT INTO prefectures VALUES (28, '兵庫県');
INSERT INTO prefectures VALUES (29, '奈良県');
INSERT INTO prefectures VALUES (30, '和歌山県');
INSERT INTO prefectures VALUES (31, '鳥取県');
INSERT INTO prefectures VALUES (32, '島根県');
INSERT INTO prefectures VALUES (33, '岡山県');
INSERT INTO prefectures VALUES (34, '広島県');
INSERT INTO prefectures VALUES (35, '山口県');
INSERT INTO prefectures VALUES (36, '徳島県');
INSERT INTO prefectures VALUES (37, '香川県');
INSERT INTO prefectures VALUES (38, '愛媛県');
INSERT INTO prefectures VALUES (39, '高知県');
INSERT INTO prefectures VALUES (40, '福岡県');
INSERT INTO prefectures VALUES (41, '佐賀県');
INSERT INTO prefectures VALUES (42, '長崎県');
INSERT INTO prefectures VALUES (43, '熊本県');
INSERT INTO prefectures VALUES (44, '大分県');
INSERT INTO prefectures VALUES (45, '宮崎県');
INSERT INTO prefectures VALUES (46, '鹿児島県');
INSERT INTO prefectures VALUES (47, '沖縄県');
