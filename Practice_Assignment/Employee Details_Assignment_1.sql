
create table EmployeeDetails(
EmpId int,
FullName varchar(20),
ManagerId int,
DateOfJoining date);

insert into EmployeeDetails values(121,'Priya Batra', 321, '2012/01/31');
insert into EmployeeDetails values(321,'Salman Khan', 986, '2016/01/30');
insert into EmployeeDetails values(421,'Kuldeep Rana', 876, '2019/11/27');

select * from EmployeeDetails

create table EmployeeSalary(
EmpId int,
Project varchar(20),
Salary int);

insert into EmployeeSalary values (121,'P1', 9000);
insert into EmployeeSalary values (321,'P2', 7000);
insert into EmployeeSalary values (421,'P1', 15000);

select * from EmployeeDetails
select * from EmployeeSalary

-- 1. Write a SQL query to fetch project-wise count of employees sorted by project’s count in descending order.

SELECT PROJECT, COUNT(EMPID) AS PROJECTWISECOUNT FROM EmployeeSalary GROUP BY project ORDER BY project ASC;

-- 2. Write a query to fetch only the first name(string before space) from the FullName column of EmployeeDetails table.

SELECT SUBSTRING (FULLNAME ,1, CHARINDEX(' ',FULLNAME)) FROM EmployeeDetails

-- 3. Write a query to fetch employee names and salary records. Return employee details even if the salary record is not present for the employee.

SELECT E.FULLNAME, P.SALARY FROM EmployeeDetails E, EmployeeSalary P WHERE E.EMPID=P.EMPID;

-- 4. Write a SQL query to fetch all the Employees who are also managers from EmployeeDetails table

SELECT E.EmpId, E.FULLNAME FROM 
EmployeeDetails E, EmployeeDetails E1  WHERE E.EmpId=E1.ManagerId;

-- 5. Write a SQL query to fetch all employee records from EmployeeDetails table who have a salary record in EmployeeSalarytable.

SELECT E.EmpId, E.FULLNAME, E.ManagerId, E.DateOfJoining, P.Salary FROM 
EmployeeDetails E JOIN EmployeeSalary P ON E.EmpId=P.EmpId;

--6.Write a SQL query to fetch duplicate records from a table.

SELECT EmpId, COUNT(*) AS Duplicaterecords
FROM EmployeeDetails
GROUP BY EmpId
HAVING COUNT(EmpId)>1;

--7. Write a SQL query to create a new table with data and structure copied from another table

-- SELECT * INTO SALES2 FROM Datagyan.dbo.sales;

SELECT * INTO EmployeeDetails_2 FROM EmployeeDetails;

--8. Write a SQL query to fetch common records between two tables

SELECT * FROM EmployeeDetails E JOIN EmployeeSalary E1 ON E.EMPID=E1.EMPID;

-- 9. Write a SQL query to fetch records that present in one table but not in another table (not able to understand the question)

SELECT EmpId FROM EmployeeDetails WHERE EmpId NOT IN
    (SELECT Salary FROM EmployeeSalary);

--10. Write a SQL query to fetch all the Employees details from EmployeeDetails table who joined in the Year2016.

SELECT * FROM EmployeeDetails WHERE DateOfJoining LIKE '2016%';

-- 11. Write SQL query to find the 3rd highest salary from table without using TOP/limit keyword.

WITH highest AS
(SELECT SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS denserank FROM EmployeeSalary)
SELECT * FROM highest where highest.denserank=3;


select * from EmployeeDetails
select * from EmployeeSalary
