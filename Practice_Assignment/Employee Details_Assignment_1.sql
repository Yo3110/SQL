
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

-- 1. Write a SQL query to fetch project-wise count of employees sorted by project�s count in descending order.

SELECT PROJECT, COUNT(EMPID) AS PROJECTWISECOUNT FROM EmployeeSalary GROUP BY project ORDER BY project ASC;

-- 2. Write a query to fetch only the first name(string before space) from the FullName column of EmployeeDetails table.
EmployeeDetails E, EmployeeDetails E1  WHERE E.EmpId=E1.ManagerId;
EmployeeDetails E JOIN EmployeeSalary P ON E.EmpId=P.EmpId;
FROM EmployeeDetails
GROUP BY EmpId
HAVING COUNT(EmpId)>1;
    (SELECT Salary FROM EmployeeSalary);
select * from EmployeeSalary