CREATE DATABASE chapter_04;;
USE chapter_04;;

-- ■「図4.1::非集約テーブルのサンプル」を作成

CREATE TABLE NonAggTbl
(id VARCHAR(32) NOT NULL,
 data_type CHAR(1) NOT NULL,
 data_1 INTEGER,
 data_2 INTEGER,
 data_3 INTEGER,
 data_4 INTEGER,
 data_5 INTEGER,
 data_6 INTEGER);

DELETE FROM NonAggTbl;
INSERT INTO NonAggTbl VALUES('Jim',    'A',  100,  10,     34,  346,   54,  NULL);
INSERT INTO NonAggTbl VALUES('Jim',    'B',  45,    2,    167,   77,   90,   157);
INSERT INTO NonAggTbl VALUES('Jim',    'C',  NULL,  3,    687, 1355,  324,   457);
INSERT INTO NonAggTbl VALUES('Ken',    'A',  78,    5,    724,  457, NULL,     1);
INSERT INTO NonAggTbl VALUES('Ken',    'B',  123,  12,    178,  346,   85,   235);
INSERT INTO NonAggTbl VALUES('Ken',    'C',  45, NULL,     23,   46,  687,    33);
INSERT INTO NonAggTbl VALUES('Beth',   'A',  75,    0,    190,   25,  356,  NULL);
INSERT INTO NonAggTbl VALUES('Beth',   'B',  435,   0,    183, NULL,    4,   325);
INSERT INTO NonAggTbl VALUES('Beth',   'C',  96,  128,   NULL,    0,    0,    12);


-- ■「図4.5::年齢別価格テーブルのサンプル」を作成

CREATE TABLE PriceByAge
(product_id VARCHAR(32) NOT NULL,
 low_age    INTEGER NOT NULL,
 high_age   INTEGER NOT NULL,
 price      INTEGER NOT NULL,
 PRIMARY KEY (product_id, low_age),
   CHECK (low_age < high_age));

INSERT INTO PriceByAge VALUES('製品1',  0 ,  50 ,  2000);
INSERT INTO PriceByAge VALUES('製品1',  51,  100,  3000);
INSERT INTO PriceByAge VALUES('製品2',  0 ,  100,  4200);
INSERT INTO PriceByAge VALUES('製品3',  0 ,  20 ,  500);
INSERT INTO PriceByAge VALUES('製品3',  31,  70 ,  800);
INSERT INTO PriceByAge VALUES('製品3',  71,  100,  1000);
INSERT INTO PriceByAge VALUES('製品4',  0 ,  99 ,  8900);


-- ■「図4.7::ホテルテーブルのサンプル」を作成

CREATE TABLE HotelRooms
(room_nbr	INTEGER,
 start_date DATE,
 end_date   DATE,
     PRIMARY KEY(room_nbr, start_date));

INSERT INTO HotelRooms VALUES(101,	'2008-02-01',	'2008-02-06');
INSERT INTO HotelRooms VALUES(101,	'2008-02-06',	'2008-02-08');
INSERT INTO HotelRooms VALUES(101,	'2008-02-10',	'2008-02-13');
INSERT INTO HotelRooms VALUES(202,	'2008-02-05',	'2008-02-08');
INSERT INTO HotelRooms VALUES(202,	'2008-02-08',	'2008-02-11');
INSERT INTO HotelRooms VALUES(202,	'2008-02-11',	'2008-02-12');
INSERT INTO HotelRooms VALUES(303,	'2008-02-03',	'2008-02-17');


-- ■「図4.8::人物テーブルのサンプル」を作成
CREATE TABLE Persons
(name   VARCHAR(8) NOT NULL,
 age    INTEGER NOT NULL,
 height FLOAT NOT NULL,
 weight FLOAT NOT NULL,
 PRIMARY KEY (name));

INSERT INTO Persons VALUES('Anderson', 30,  188,  90);
INSERT INTO Persons VALUES('Adela',    21,  167,  55);
INSERT INTO Persons VALUES('Bates',    87,  158,  48);
INSERT INTO Persons VALUES('Becky',    54,  187,  70);
INSERT INTO Persons VALUES('Bill',     39,  177,  120);
INSERT INTO Persons VALUES('Chris',    90,  175,  48);
INSERT INTO Persons VALUES('Darwin',   12,  160,  55);
INSERT INTO Persons VALUES('Dawson',   25,  182,  90);
INSERT INTO Persons VALUES('Donald',   30,  176,  53);

