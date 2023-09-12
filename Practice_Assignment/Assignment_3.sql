-- Aggregate functions in sql--

SELECT SUM(AMOUNT)AS TOTAL_AMOUNT FROM SALES;

SELECT count(Gender)AS FINAL_COUNT FROM SALES;

SELECT AVG(Age)AS AVG_AGE FROM SALES;

SELECT MAX(Amount)AS MAXSALES FROM SALES;

SELECT AVG(Age)AS AVG_AGE FROM SALES;


SELECT * FROM SALES;


-- GROUP BY--

SELECT * FROM SALES;

SELECT GENDER, SUM(AMOUNT) AS SUMSALES FROM SALES GROUP BY GENDER;

SELECT SHIP_STATE, SUM(Amount) AS STATEWISESALES FROM SALES GROUP BY SHIP_STATE;

SELECT SHIP_STATE, count(Amount) AS STATEWISESALES FROM SALES GROUP BY SHIP_STATE;

SELECT age, sum(Amount) AS agewisesales FROM SALES GROUP BY age;

SELECT age, max(Amount) AS agewisesales FROM SALES GROUP BY age;

SELECT ship_city, max(age) AS citywisesale FROM SALES GROUP BY ship_city;

SELECT ship_city, min(age) AS citywisesale FROM SALES GROUP BY ship_city;

-- Having clause--

SELECT * FROM SALES;

select Gender, sum(amount) as genderwisesales from SALES group by Gender having SUM(Amount)>10000;

select age, max(Amount) as agewisesales from SALES group by age having SUM(Amount)>1500;

select Age_Group, count(Amount) as grpwisesales from SALES group by Age_Group having SUM(Amount)>15;

select Age_Group, avg(Amount) as grpwisesales from SALES group by Age_Group having SUM(Amount)>1500;

select Sales_ID, sum(Amount) as grpwisesales from SALES group by Sales_ID having SUM(Amount)>500;


-- Scaler functions--

select * from SALES;

create table emp1(
Id int,
First_name varchar(20),
Last_name varchar(20),
address varchar(20),
salary float);

insert into emp1 values(1, 'paul', 'walker', 'pune', 50000), (2, 'shaw', 'rodies', 'CALIFORNIA', 70000), (3, 'RAW', 'MOSA', 'NY', 75000);

SELECT * FROM emp1;

EXEC sp_rename 'EMP1.FN''COLUMN', 'FN';

EXEC sp_rename 'EMP1.LN''COLUMN', 'LN';

--UPPER CASE--

SELECT UPPER(FN) AS FIRST_NAME FROM emp1;

--BOTH NAME AT A TIME--

SELECT UPPER(FN), UPPER(LN) FROM emp1;

SELECT UPPER(LN) FIRST_NAME FROM emp1;

--CONCATE--

SELECT CONCAT(FN,' ',LN) AS FULL_NAME FROM EMP1;

SELECT UPPER(CONCAT(FN,' ',LN)) AS FULL_NAME FROM EMP1;

--SUBSTRING FUNCTIONS

SELECT SUBSTRING (FN,2,4) AS NAME FROM emp1
SELECT SUBSTRING (FN,3,4) AS NAME FROM emp1

--TRIM FUNCTION

SELECT LTRIM(FN) AS NAME FROM emp1

SELECT RTRIM(FN) AS NAME FROM emp1

SELECT SUBSTRING(LTRIM(FN),2,3) AS NAME FROM EMP1

--USE THREE AT A TIME [Qestion- when using three functions together specially LTRIM whether use or not getting same results. Do we need to give number overhere]

	SELECT (UPPER(CONCAT(FN,' ',LN))) AS FULL_NAME FROM emp1;

SELECT LTRIM(UPPER(CONCAT(FN,' ',LN))) AS FULL_NAME FROM emp1;

--LENTH
SELECT LEN(FN) AS LENTH FROM emp1

SELECT * FROM emp1;

--REPLACE

SELECT REPLACE(FN,'PAUL','POAL')AS REPLACE_NAME FROM emp1

-- ROUND 

SELECT ROUND(3.67,0) AS ROUNDVALUE FROM emp1

SELECT * FROM emp1;

--DATA & TIME
SELECT GETDATE (), REPLACE(FN,'PAUL', 'SAM') AS TIMEDATA FROM emp1

