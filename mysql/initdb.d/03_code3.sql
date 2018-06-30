CREATE DATABASE chapter_03;
USE chapter_03;

-- ■「図3.1::商品テーブルのサンプル」を作成

CREATE TABLE Items
(   item_id     INTEGER  NOT NULL,
       year     INTEGER  NOT NULL,
  item_name     CHAR(32) NOT NULL,
  price_tax_ex  INTEGER  NOT NULL,
  price_tax_in  INTEGER  NOT NULL,
  PRIMARY KEY (item_id, year));

INSERT INTO Items VALUES(100,	2000,	'カップ'	,500,	525);
INSERT INTO Items VALUES(100,	2001,	'カップ'	,520,	546);
INSERT INTO Items VALUES(100,	2002,	'カップ'	,600,	630);
INSERT INTO Items VALUES(100,	2003,	'カップ'	,600,	630);
INSERT INTO Items VALUES(101,	2000,	'スプーン'	,500,	525);
INSERT INTO Items VALUES(101,	2001,	'スプーン'	,500,	525);
INSERT INTO Items VALUES(101,	2002,	'スプーン'	,500,	525);
INSERT INTO Items VALUES(101,	2003,	'スプーン'	,500,	525);
INSERT INTO Items VALUES(102,	2000,	'ナイフ'	,600,	630);
INSERT INTO Items VALUES(102,	2001,	'ナイフ'	,550,	577);
INSERT INTO Items VALUES(102,	2002,	'ナイフ'	,550,	577);
INSERT INTO Items VALUES(102,	2003,	'ナイフ'	,400,	420);


-- ■「図3.7::人口テーブルのサンプル」を作成

CREATE TABLE Population
(prefecture VARCHAR(32),
 sex        CHAR(1),
 pop        INTEGER,
     CONSTRAINT pk_pop PRIMARY KEY(prefecture, sex));

INSERT INTO Population VALUES('徳島', '1', 60);
INSERT INTO Population VALUES('徳島', '2', 40);
INSERT INTO Population VALUES('香川', '1', 90);
INSERT INTO Population VALUES('香川', '2',100);
INSERT INTO Population VALUES('愛媛', '1',100);
INSERT INTO Population VALUES('愛媛', '2', 50);
INSERT INTO Population VALUES('高知', '1',100);
INSERT INTO Population VALUES('高知', '2',100);
INSERT INTO Population VALUES('福岡', '1', 20);
INSERT INTO Population VALUES('福岡', '2',200);


-- ■「図3.12::社員テーブルのサンプル」を作成

CREATE TABLE Employees
(emp_id    CHAR(3)  NOT NULL,
 team_id   INTEGER  NOT NULL,
 emp_name  CHAR(16) NOT NULL,
 team      CHAR(16) NOT NULL,
    PRIMARY KEY(emp_id, team_id));

INSERT INTO Employees VALUES('201',	1,	'Joe',	'商品企画');
INSERT INTO Employees VALUES('201',	2,	'Joe',	'開発');
INSERT INTO Employees VALUES('201',	3,	'Joe',	'営業');
INSERT INTO Employees VALUES('202',	2,	'Jim',	'開発');
INSERT INTO Employees VALUES('203',	3,	'Carl',	'営業');
INSERT INTO Employees VALUES('204',	1,	'Bree',	'商品企画');
INSERT INTO Employees VALUES('204',	2,	'Bree',	'開発');
INSERT INTO Employees VALUES('204',	3,	'Bree',	'営業');
INSERT INTO Employees VALUES('204',	4,	'Bree',	'管理');
INSERT INTO Employees VALUES('205',	1,	'Kim',	'商品企画');
INSERT INTO Employees VALUES('205',	2,	'Kim',	'開発');

-- ■「図3.16::ThreeElementsテーブルのサンプル」を作成

CREATE TABLE ThreeElements
(`key`    CHAR(8),
 name   VARCHAR(32),
 date_1 DATE,
 flg_1  CHAR(1),
 date_2 DATE,
 flg_2  CHAR(1),
 date_3 DATE,
 flg_3  CHAR(1),
    PRIMARY KEY(`key`));

INSERT INTO ThreeElements VALUES ('1', 'a', '2013-11-01', 'T', NULL, NULL, NULL, NULL);
INSERT INTO ThreeElements VALUES ('2', 'b', NULL, NULL, '2013-11-01', 'T', NULL, NULL);
INSERT INTO ThreeElements VALUES ('3', 'c', NULL, NULL, '2013-11-01', 'F', NULL, NULL);
INSERT INTO ThreeElements VALUES ('4', 'd', NULL, NULL, '2013-12-30', 'T', NULL, NULL);
INSERT INTO ThreeElements VALUES ('5', 'e', NULL, NULL, NULL, NULL, '2013-11-01', 'T');
INSERT INTO ThreeElements VALUES ('6', 'f', NULL, NULL, NULL, NULL, '2013-12-01', 'F');

CREATE INDEX IDX_1 ON ThreeElements (date_1, flg_1);
CREATE INDEX IDX_2 ON ThreeElements (date_2, flg_2);
CREATE INDEX IDX_3 ON ThreeElements (date_3, flg_3);

-- ■演習問題3で追加するデータ

-- INSERT INTO ThreeElements VALUES ('7', 'g', '2013-11-01', 'F', NULL, NULL, '2013-11-01', 'T');

