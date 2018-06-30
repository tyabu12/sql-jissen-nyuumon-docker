CREATE DATABASE chapter_06;
USE chapter_06;

-- ■「リスト6.1::クロス結合を行うサンプルテーブル」を作成

CREATE TABLE Employees
(emp_id CHAR(8),
 emp_name VARCHAR(32),
 dept_id CHAR(2),
     CONSTRAINT pk_emp PRIMARY KEY(emp_id));

CREATE TABLE Departments
(dept_id CHAR(2),
 dept_name VARCHAR(32),
     CONSTRAINT pk_dep PRIMARY KEY(dept_id));

CREATE INDEX idx_dept_id ON Employees(dept_id);

INSERT INTO Employees VALUES('001',	'石田',	  '10');
INSERT INTO Employees VALUES('002',	'小笠原', '11');
INSERT INTO Employees VALUES('003',	'夏目',	  '11');
INSERT INTO Employees VALUES('004',	'米田',	  '12');
INSERT INTO Employees VALUES('005',	'釜本',	  '12');
INSERT INTO Employees VALUES('006',	'岩瀬',	  '12');

INSERT INTO Departments VALUES('10',	'総務');
INSERT INTO Departments VALUES('11',	'人事');
INSERT INTO Departments VALUES('12',	'開発');
INSERT INTO Departments VALUES('13',	'営業');


-- ■「図6.5::自己結合を解説するための数字テーブル」を作成

CREATE TABLE Digits
(digit INTEGER PRIMARY KEY);

INSERT INTO Digits VALUES(0);
INSERT INTO Digits VALUES(1);
INSERT INTO Digits VALUES(2);
INSERT INTO Digits VALUES(3);
INSERT INTO Digits VALUES(4);
INSERT INTO Digits VALUES(5);
INSERT INTO Digits VALUES(6);
INSERT INTO Digits VALUES(7);
INSERT INTO Digits VALUES(8);
INSERT INTO Digits VALUES(9);


-- ■「三角結合を解説するためのテーブル」を作成

CREATE TABLE Table_A
(col_a CHAR(1));

CREATE TABLE Table_B
(col_b CHAR(1));

CREATE TABLE Table_C
(col_c CHAR(1));
