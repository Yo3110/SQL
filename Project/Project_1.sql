Create table Employeeinfo
(EmpID INT,
EmpFname varchar(20),
EmpLname varchar(20),
Department varchar(20),
Project varchar(20),
Address varchar(20),
DOB DATETIME, 
GENDER varchar(20)
);

insert into EmployeeInfo values(1,'sanjay','Mehra','HR','P1','Hyderabad','1976/12/01','M');
insert into EmployeeInfo values(2,'Ananya','Mishra','Admin','P2','Delhi(DEL)','1968/05/02','F');
insert into EmployeeInfo values(3,'Rohan','Diwan','Account','P3','Mumbai(BOM)','1980/01/01','M');
insert into EmployeeInfo values(4,'Sonia','Kulkarni','HR','P1','Hyderabad(HYD)','1992/05/02','F');
insert into EmployeeInfo values(5,'Ankit','Kapoor','Admin','P2','Delhi(DEL)','1994/07/03','M');


Create table EmployeePositon 
(EmpID INT,
EmpPosition varchar(20),
DateofJoining DATETIME,
Salary int
);

insert into EmployeePositon values(1,'Manager','2022/05/01',500000);
insert into EmployeePositon values(2,'Executive','2022/05/02',75000);
insert into EmployeePositon values(3,'Manager','2022/05/01',90000);
insert into EmployeePositon values(2,'Lead','2022/05/02',85000);
insert into EmployeePositon values(1,'Executive','2022/05/01',300000);

select * from Employeeinfo
select * from EmployeePositon


-- 1.Write a query to get the current date.

select getdate() as customerdate

--2.Write a query to retrieve the first four characters of EmpLname from the EmployeeInfo table.

SELECT SUBSTRING (EmpLname,1,4) AS NAME FROM EmployeeInfo;

--3.Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.?

SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address)) FROM EmployeeInfo;

--4. Write a query to create a new table that consists of data and structure copied from the other table. 

SELECT * INTO Mysales FROM SALES 

--5. Write q query to find all the employees whose salary is between 50000 to 100000.?
select * from Employeeinfo where empid in (select empid from EmployeePositon where Salary between 50000 and 100000);
SELECT * FROM EmployeePositon where Salary between 50000 and 100000;
select * from Employeeinfo E join EmployeePositon P on e.EmpID=p.EmpID where Salary between 50000 and 100000;

--6. Write a query to find the names of employees that begin with ‘S’
SELECT * FROM EmployeeInfo WHERE EmpFname LIKE 'S%';

-- Q7. Write a query to fetch top N records.
SELECT TOP 2 * FROM EmployeePositon ORDER BY SALARY ASC ;

-- Q8. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
SELECT CONCAT (empfname,' ',EmpLname) as FULLNAME FROM EmployeeInfo;

select * from Employeeinfo
select * from EmployeePositon

-- Q9. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender

SELECT COUNT(*), GENDER FROM Employeeinfo WHERE DOB between '1968/05/02' AND '1992/05/02' group BY GENDER;

-- Q10. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.

SELECT * FROM Employeeinfo order by emplname desc, department asc;

-- Q11. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.

SELECT * FROM Employeeinfo WHERE (EmpLname) LIKE'%A';

-- Q12. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.

SELECT * FROM Employeeinfo WHERE EmpFname NOT IN ('SANJAY','SONIA');

-- Q13. Write a query to fetch details of employees with the address as “DELHI(DEL)”.

SELECT * FROM Employeeinfo WHERE Address='DELHI(DEL)';
SELECT * FROM Employeeinfo WHERE Address LIKE 'DELHI(DEL)%';

-- Q14. Write a query to fetch all employees who also hold the managerial position.

SELECT E.EMPFNAME, E.EMPLNAME, P.EmpPosition FROM  
Employeeinfo E INNER JOIN EmployeePositon P ON E.EmpID=P.EmpID WHERE EmpPosition IN ('MANAGER');

-- Q15. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.

SELECT DEPARTMENT, COUNT(EMPID) AS DEPTCOUNT FROM Employeeinfo GROUP BY Department ORDER BY Department ASC;

--Q16. Write a query to calculate the even and odd records from a table


--Q17. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.

SELECT * FROM Employeeinfo E WHERE EXISTS (SELECT * FROM EmployeePositon P  WHERE E.EMPID=P.EmpID);

SELECT E.EMPFNAME, E.EMPLNAME, E.Department, E.Project, E.Address, DateofJoining FROM  
Employeeinfo E JOIN EmployeePositon P ON E.EmpID=P.EmpID;

--Q18. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
SELECT MIN (SALARY) AS MINSAL FROM EmployeePositon GROUP BY Salary

SELECT DISTINCT Salary FROM EmployeePosition E1 WHERE 2 >= 
(SELECTCOUNT(DISTINCT Salary)FROM EmployeePosition E2 WHERE 
E1.Salary >= E2.Salary) ORDER BY E1.Salary DESC;

--19. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.

--SELECT TOP 3 * FROM EmployeePositon ORDER BY SALARY DESC;

SELECT SALARY FROM EmployeePositon P1 WHERE N-1 = 
(SELECT COUNT (DISTINCT(P1.Salary)) FROM EmployeePositon P2 WHERE P2.Salary>P1.Salary);

SELECT Salary FROM EmployeePosition E1 WHERE N-1 = ( SELECT 
COUNT( DISTINCT ( E2.Salary ) ) FROM EmployeePosition E2 WHERE E2.Salary > E1.Salary );-- Q20.What will be the output for this query : SELECT count(*) from table1, table2
SELECT COUNT(*) FROM Employeeinfo, EmployeePositon;
	

select * from Employeeinfo
select * from EmployeePositon