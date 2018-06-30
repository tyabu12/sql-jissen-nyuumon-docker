CREATE DATABASE chapter_02;
USE chapter_02;

-- ■「図2.1::住所テーブルのサンプル」を作成

CREATE TABLE Address
(name       VARCHAR(32) NOT NULL,
 phone_nbr  VARCHAR(32) ,
 address    VARCHAR(32) NOT NULL,
 sex        CHAR(4) NOT NULL,
 age        INTEGER NOT NULL,
 PRIMARY KEY (name));

INSERT INTO Address VALUES('小川',	'080-3333-XXXX',	'東京都',	'男',	30);
INSERT INTO Address VALUES('前田',	'090-0000-XXXX',	'東京都',	'女',	21);
INSERT INTO Address VALUES('森',	'090-2984-XXXX',	'東京都',	'男',	45);
INSERT INTO Address VALUES('林',	'080-3333-XXXX',	'福島県',	'男',	32);
INSERT INTO Address VALUES('井上',	NULL,	            	'福島県',	'女',	55);
INSERT INTO Address VALUES('佐々木',	'080-5848-XXXX',	'千葉県',	'女',	19);
INSERT INTO Address VALUES('松本',	NULL,	            	'千葉県',	'女',	20);
INSERT INTO Address VALUES('佐藤',	'090-1922-XXXX',	'三重県',	'女',	25);
INSERT INTO Address VALUES('鈴木',	'090-0001-XXXX',	'和歌山県',	'男',	32);


-- ■「図2.7::Address2テーブル」を作成

CREATE TABLE Address2
(name       VARCHAR(32) NOT NULL,
 phone_nbr  VARCHAR(32) ,
 address    VARCHAR(32) NOT NULL,
 sex        CHAR(4) NOT NULL,
 age        INTEGER NOT NULL,
 PRIMARY KEY (name));

INSERT INTO Address2 VALUES('小川',	'080-3333-XXXX',	'東京都',	'男',	30);
INSERT INTO Address2 VALUES('林',	'080-3333-XXXX',	'福島県',	'男',	32);
INSERT INTO Address2 VALUES('武田',	NULL,			'福島県',	'男',	18);
INSERT INTO Address2 VALUES('斉藤',	'080-2367-XXXX',	'千葉県',	'女',	19);
INSERT INTO Address2 VALUES('上野',	NULL,			'千葉県',	'女',	20);
INSERT INTO Address2 VALUES('広田',	'090-0205-XXXX',	'三重県',	'男',	25);

