CREATE DATABASE chapter_05;
USE chapter_05;

-- ■「図5.1::売り上げ計算を行うテーブルのサンプル」を作成

CREATE TABLE Sales
(company CHAR(1) NOT NULL,
 year    INTEGER NOT NULL,
 sale    INTEGER NOT NULL,
   CONSTRAINT pk_sales PRIMARY KEY (company, year));

INSERT INTO Sales VALUES ('A', 2002, 50);
INSERT INTO Sales VALUES ('A', 2003, 52);
INSERT INTO Sales VALUES ('A', 2004, 55);
INSERT INTO Sales VALUES ('A', 2007, 55);
INSERT INTO Sales VALUES ('B', 2001, 27);
INSERT INTO Sales VALUES ('B', 2005, 28);
INSERT INTO Sales VALUES ('B', 2006, 28);
INSERT INTO Sales VALUES ('B', 2009, 30);
INSERT INTO Sales VALUES ('C', 2001, 40);
INSERT INTO Sales VALUES ('C', 2005, 39);
INSERT INTO Sales VALUES ('C', 2006, 38);
INSERT INTO Sales VALUES ('C', 2010, 35);

CREATE TABLE Sales2
(company CHAR(1) NOT NULL,
 year    INTEGER NOT NULL,
 sale    INTEGER NOT NULL,
 var     CHAR(1),
   CONSTRAINT pk_sales2 PRIMARY KEY (company, year));


-- ■リスト5.1 ぐるぐる系のコード
/*
CREATE OR REPLACE PROCEDURE PROC_INSERT_VAR
IS

  -- カーソル宣言
  CURSOR c_sales IS
       SELECT company, year, sale
         FROM Sales
        ORDER BY company, year;

  -- レコードタイプ宣言
  rec_sales c_sales%ROWTYPE;

  -- カウンタ
  i_pre_sale INTEGER := 0;
  c_company CHAR(1) := '*';
  c_var CHAR(1) := '*';

BEGIN

OPEN c_sales;

  LOOP
    -- レコードをフェッチして変数に代入
    fetch c_sales into rec_sales;
    -- レコードがなくなったらループ終了
    exit when c_sales%notfound;

    IF (c_company = rec_sales.company) THEN
        -- 直前のレコードが同じ会社のレコードの場合
        -- 直前のレコードと売り上げを比較
        IF (i_pre_sale < rec_sales.sale) THEN
            c_var := '+';
        ELSIF (i_pre_sale > rec_sales.sale) THEN
            c_var := '-';
        ELSE
            c_var := '=';
        END IF;

    ELSE
        c_var := NULL;
    END IF;

    -- 登録先テーブルにデータを登録
    INSERT INTO Sales2 (company, year, sale, var) 
      VALUES (rec_sales.company, rec_sales.year, rec_sales.sale, c_var);

    c_company := rec_sales.company;
    i_pre_sale := rec_sales.sale;

  END LOOP;

  CLOSE c_sales;
  commit;
END;
*/


--  ■リスト5.2 これ以上ないぐらい単純なSQL文

CREATE TABLE Foo
( p_key INTEGER PRIMARY KEY,
  col_a INTEGER );



-- ■リスト5.3 ウィンドウ関数を使った解
/*
INSERT INTO Sales2
SELECT company,
       year,
       sale,
       CASE SIGN(sale - MAX(sale)
                         OVER ( PARTITION BY company
                                    ORDER BY year
                                     ROWS BETWEEN 1 PRECEDING
                                              AND 1 PRECEDING) )
       WHEN 0 THEN '='
       WHEN 1 THEN '+'
       WHEN -1 THEN '-'
       ELSE NULL END AS var
  FROM Sales;
*/


-- ■リスト5.5 郵便番号テーブルの定義

CREATE TABLE PostalCode
(pcode CHAR(7),
 district_name VARCHAR(256),
     CONSTRAINT pk_pcode PRIMARY KEY(pcode));

INSERT INTO PostalCode VALUES ('4130001',  '静岡県熱海市泉');
INSERT INTO PostalCode VALUES ('4130002',  '静岡県熱海市伊豆山');
INSERT INTO PostalCode VALUES ('4130103',  '静岡県熱海市網代');
INSERT INTO PostalCode VALUES ('4130041',  '静岡県熱海市青葉町');
INSERT INTO PostalCode VALUES ('4103213',  '静岡県伊豆市青羽根');
INSERT INTO PostalCode VALUES ('4380824',  '静岡県磐田市赤池');

-- ■リスト5.9 郵便番号の履歴テーブルの定義

CREATE TABLE PostalHistory
(name  CHAR(1),
 pcode CHAR(7),
 new_pcode CHAR(7),
     CONSTRAINT pk_name_pcode PRIMARY KEY(name, pcode));

INSERT INTO PostalHistory VALUES ('A', '4130001', '4130002');
INSERT INTO PostalHistory VALUES ('A', '4130002', '4130103');
INSERT INTO PostalHistory VALUES ('A', '4130103', NULL     );
INSERT INTO PostalHistory VALUES ('B', '4130041', NULL     );
INSERT INTO PostalHistory VALUES ('C', '4103213', '4380824');
INSERT INTO PostalHistory VALUES ('C', '4380824', NULL     );


-- ■リスト5.12 郵便番号の履歴テーブル2の定義

CREATE TABLE PostalHistory2
(name  CHAR(1),
 pcode CHAR(7),
 lft   REAL NOT NULL,
 rgt   REAL NOT NULL,
     CONSTRAINT pk_name_pcode2 PRIMARY KEY(name, pcode),
     CONSTRAINT uq_name_lft UNIQUE (name, lft),
     CONSTRAINT uq_name_rgt UNIQUE (name, rgt),
     CHECK(lft < rgt));

INSERT INTO PostalHistory2 VALUES ('A', '4130001', 0,   27);
INSERT INTO PostalHistory2 VALUES ('A', '4130002', 9,   18);
INSERT INTO PostalHistory2 VALUES ('A', '4130103', 12,  15);
INSERT INTO PostalHistory2 VALUES ('B', '4130041', 0,   27);
INSERT INTO PostalHistory2 VALUES ('C', '4103213', 0,   27);
INSERT INTO PostalHistory2 VALUES ('C', '4380824', 9,   18);

