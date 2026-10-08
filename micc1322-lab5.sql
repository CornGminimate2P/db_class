select * from DEPT_LOCATIONS;
select * from DEPARTMENT;
select * from PROJECT;
select * from EMPLOYEE;
select * from WORKS_ON;

select FNAME,LNAME,SALARY from EMPLOYEE;

select PNAME,PLOCATION from PROJECT;

select Pro.PNAME , Wo.ESSN from PROJECT Pro
JOIN WORKS_ON Wo ON Pro.PNUMBER = Wo.PNO;

select (FNAME|| ' ' ||LNAME) as FULL_NAME from EMPLOYEE;

select SSN,SALARY as MONTHLY_SALARY from EMPLOYEE;

select distinct(DNO) from EMPLOYEE;

select fname, salary * 1.1 as INCREASED_SALARY from EMPLOYEE;

select fname, trunc(salary/30,2) as DAILY_SALARY from EMPLOYEE;
