---Script to drop and create data requierd to run queries from SQL Questions

BEGIN
  FOR c IN ( SELECT table_name FROM user_tables)
  LOOP
    EXECUTE IMMEDIATE 'DROP TABLE ' || c.table_name;
  END LOOP;
END;
/

CREATE TABLE runners(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100)
);
INSERT INTO runners
            SELECT 1, 'John Doe'    FROM dual
UNION ALL   SELECT 2, 'Jane Doe'    FROM dual
UNION ALL   SELECT 3, 'Alice Jones' FROM dual
UNION ALL   SELECT 4, 'Bobby Louis' FROM dual
UNION ALL   SELECT 5, 'Lisa Romero' FROM dual;
--------------------------------------------------------------------------------

CREATE TABLE races(
    id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    event VARCHAR(100),
    winner_id NUMBER
);
INSERT INTO races
            SELECT 1, '100 meter dash', 2 FROM dual
UNION ALL   SELECT 2, '500 meter dash', 3 FROM dual
UNION ALL   SELECT 3, 'cross-country',  2 FROM dual
UNION ALL   SELECT 4, 'triathalon',  null FROM dual;
--------------------------------------------------------------------------------

CREATE TABLE Customers(
    id NUMBER,
    name VARCHAR(100),
    referred_by NUMBER
);
INSERT INTO Customers
            SELECT 1, 'John Doe',     null FROM dual
UNION ALL   SELECT 2, 'Jane Smith',   null FROM dual
UNION ALL   SELECT 3, 'Anne Jenkins', 2    FROM dual
UNION ALL   SELECT 4, 'Eric Branford',null FROM dual
UNION ALL   SELECT 5, 'Pat Richards', 1    FROM dual
UNION ALL   SELECT 6, 'Alice Barnes', 2    FROM dual;
--------------------------------------------------------------------------------

CREATE TABLE Invoices(
  Id NUMBER,
  billing_date DATE,
  custoemr_id NUMBER
);

INSERT INTO Invoices
          SELECT 1, TO_DATE('01-01-2020','dd-mm-yyyy'), 2 FROM dual
UNION ALL SELECT 2, TO_DATE('31-12-2019','dd-mm-yyyy'), 1 FROM dual
UNION ALL SELECT 3, TO_DATE('05-01-2020','dd-mm-yyyy'), 5 FROM dual
UNION ALL SELECT 4, TO_DATE('01-01-2020','dd-mm-yyyy'), 3 FROM dual
UNION ALL SELECT 5, TO_DATE('10-01-2020','dd-mm-yyyy'), 1 FROM dual
UNION ALL SELECT 6, TO_DATE('15-12-2019','dd-mm-yyyy'), 4 FROM dual
UNION ALL SELECT 7, TO_DATE('02-01-2020','dd-mm-yyyy'), 7 FROM dual;
--------------------------------------------------------------------------------

CREATE TABLE Binary_Values(
  val NUMERIC
);
INSERT INTO Binary_Values
          SELECT 1 FROM dual
UNION ALL SELECT 0 FROM dual
UNION ALL SELECT 0 FROM dual
UNION ALL SELECT 1 FROM dual
UNION ALL SELECT 1 FROM dual
UNION ALL SELECT 1 FROM dual
UNION ALL SELECT 1 FROM dual
UNION ALL SELECT 0 FROM dual
UNION ALL SELECT 0 FROM dual
UNION ALL SELECT 1 FROM dual
UNION ALL SELECT 0 FROM dual
UNION ALL SELECT 1 FROM dual
UNION ALL SELECT 0 FROM dual
UNION ALL SELECT 1 FROM dual;
--------------------------------------------------------------------------------

CREATE TABLE Employees(
  id NUMBER,
  emp_name VARCHAR(100),
  salary NUMBER
);

INSERT INTO Employees
          SELECT 1, 'Bernadette Rostenkowski', 100000 FROM dual
UNION ALL SELECT 2, 'Leonard Hofstadter',      120000 FROM dual
UNION ALL SELECT 3, 'Sheldon Cooper',          200000 FROM dual
UNION ALL SELECT 4, 'Raj Kuthrapally',         90000  FROM dual
UNION ALL SELECT 5, 'Penny Hofstadter',        150000 FROM dual
UNION ALL SELECT 6, 'Howard Wolowitz',         135000 FROM dual
UNION ALL SELECT 2, 'Jane Smith',              52000  FROM dual;
--------------------------------------------------------------------------------

CREATE TABLE Training_Details(
    emp_training_id NUMBER,
    emp_id NUMBER,
    training_id NUMBER,
    training_date DATE
);

INSERT INTO Training_Details
          SELECT  1, 1, 1, TO_DATE('2015-08-02','yyyy-mm-dd') FROM dual
UNION ALL SELECT  2, 2, 1, TO_DATE('2015-08-03','yyyy-mm-dd') FROM dual
UNION ALL SELECT  3, 3, 2, TO_DATE('2015-08-02','yyyy-mm-dd') FROM dual
UNION ALL SELECT  4, 4, 2, TO_DATE('2015-08-04','yyyy-mm-dd') FROM dual
UNION ALL SELECT  5, 2, 2, TO_DATE('2015-08-03','yyyy-mm-dd') FROM dual
UNION ALL SELECT  6, 1, 1, TO_DATE('2015-08-02','yyyy-mm-dd') FROM dual
UNION ALL SELECT  7, 3, 2, TO_DATE('2015-08-04','yyyy-mm-dd') FROM dual
UNION ALL SELECT  8, 4, 3, TO_DATE('2015-08-03','yyyy-mm-dd') FROM dual
UNION ALL SELECT  9, 1, 4, TO_DATE('2015-08-03','yyyy-mm-dd') FROM dual
UNION ALL SELECT 10, 3, 1, TO_DATE('2015-08-02','yyyy-mm-dd') FROM dual
UNION ALL SELECT 11, 4, 2, TO_DATE('2015-08-04','yyyy-mm-dd') FROM dual
UNION ALL SELECT 12, 3, 2, TO_DATE('2015-08-02','yyyy-mm-dd') FROM dual
UNION ALL SELECT 13, 1, 1, TO_DATE('2015-08-02','yyyy-mm-dd') FROM dual
UNION ALL SELECT 14, 4, 3, TO_DATE('2015-08-03','yyyy-mm-dd') FROM dual;
--------------------------------------------------------------------------------


