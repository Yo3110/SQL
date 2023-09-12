

-- WHERE CLAUSE - AND/BETWEEN/>/NOT IN/IN Operator

select * from sales;

SELECT gender, age FROM SALES where gender='Women' and age>30;

SELECT * FROM SALES where sales_id= 107;

SELECT * FROM SALES where sales_id between 117 and 125;

SELECT * FROM SALES where sales_id in (115,140,150);

SELECT * FROM SALES where amount > 500;

SELECT * FROM SALES where Gender not in ('WOMEN');

SELECT * FROM SALES where Gender in ('WOMEN');

 --  UPDATE/SET/ADD COLUMN 

  UPDATE SALES SET OTHER=50 WHERE SALES_ID=101; 

  UPDATE SALES SET OTHER=555 WHERE SALES_ID IN (102,103,104);

  UPDATE SALES SET OTHER=550 WHERE SALES_ID BETWEEN 105 AND 106;

  UPDATE SALES SET GENDER = 'MALE' WHERE GENDER = 'M';


  -- TOP CLAUSE 

  SELECT TOP 3 * FROM SALES;

  SELECT TOP 10 * FROM SALES ORDER BY CHANNEL DESC;

 CREATE TABLE ABC 
(UID INT PRIMARY KEY,
MOB bigint unique,
Email varchar(50) unique,
Name varchar(40) Not Null,
Age int check (age>18),
Address varchar(50) default 'BMC'
);

SELECT * FROM sales;

INSERT INTO ABC (UID, MOB, Email, Age, Address)
VALUES(108, 8888524220, 'xyz@gmail', 25, 'pune');

-- DELETE COLUMN
 
DELETE FROM SALES WHERE OTHER = 550;

DELETE FROM SALES WHERE SALES_ID BETWEEN 101 AND 104;

ALTER TABle SALES DROP COLUMN other;

-- ORDER BY

SELECT * FROM SALES ORDER BY MONTH;

SELECT * FROM SALES ORDER BY GENDER ASC;


-- ALTER 

ALTER TABLE SALES ADD OTHER VARCHAR(30);

ALTER TABLE INDIA DROP COLUMN CITY;

-- ALTER TABLE META RENAME COLUMN ADDRESS TO ADD;


SELECT * FROM SALES WHERE (AGE>30 AND GENDER='WOMEN') OR SHIP_STATE = 'KERALA';


SELECT * FROM sales;

SELECT * FROM CUSTOMER;

ALTER TABLE CUSTOMER ADD MODE VARCHAR(20);

UPDATE CUSTOMER SET MODE='COD' WHERE ID=100;

exec sp_rename 'CUSTOMER.phone','CONTACT', 'Column';

exec sp_rename 'CUSTOMER','CUSTOMER_INFO', 'Table';


-- AS ALIAS - 

SELECT * FROM CUSTOMER;

select * from customer as customer_info;

select name AS Emp_NAME, CONTACT AS EMP_CONTACT, 'MOD' AS PAYMENT_MODE FROM CUSTOMER;

-- NULL FUNCTION--

CREATE TABLE HR (
CUS_ID INT,
CUS_NAME VARCHAR(20),
SAL INT,
MOB INT
);

SELECT * FROM HR;

Insert into hr values (101, null, 700000, 889854567);
Insert into hr values (101, 'meena', 700000, 889854567);

select * from hr where cus_name is null;
select * from hr where sal is null;

-- SQL DISTINCT--

SELECT * FROM Customer;

SELECT DISTINCT ID FROM CUSTOMER;

SELECT DISTINCT NAME ID FROM CUSTOMER;

SELECT DISTINCT MODE ID FROM CUSTOMER;


-- AUTO INCREMENT--

create table person
(ID int IDENTITY (1, 1),
First_name varchar(20),
);

select * from person;

insert into person values ('sam');
insert into person values ('ram');
insert into person values ('kam');

-- DBO-- 

select * from Datagyan.dbo.SALES

-- INFORMATION DATA - 

SELECT * FROM INFORMATION_SCHEMA.TABLES

select COUNT(*) from INFORMATION_SCHEMA.TABLES

SP_HELP CUSTOMER;

-- CHANGING TABLE NAME --

exec sp_rename 'META','FACEBOOK'; 
exec sp_rename 'CUSTOMER','CUSTOMER_INFO', 'Table';

select * from facebook;

-- CHANGING COLUMN NAME --

exec sp_rename 'CUSTOMER.phone','CONTACT', 'Column';

exec sp_rename 'FACEBOOK.MOB', 'CONTACT', 'COLUMN';

select * from facebook;

SELECT * FROM sales;


SELECT GENDER, SUM(AMOUNT) AS SALES FROM SALES GROUP BY Gender;

SELECT * FROM [dbo].[emp1]

UPDATE emp1 SET FN='YOGESH' VARCHAR(20);

select * from [dbo].[emp1]


INSERT INTO emp1 (id, fn, LN, address, salary)

 VALUES (5, 'ram', 'sham', 'mh', 5000);