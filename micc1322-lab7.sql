select fname,bdate,ADDRESS from EMPLOYEE
where fname = 'John';


select fname || ' ' || MINIT || ' ' || LNAME as fulname,bdate,ADDRESS from EMPLOYEE
where fname = 'John' and MINIT = 'B' and LNAME = 'Smith';

select fname,address, dname from EMPLOYEE , DEPARTMENT
where dno = DEPARTMENT.DNUMBER 
and dname = 'Research';

select pnumber, dnum, MGRSSN, fname ,PLOCATION
from project pro, employee emp, DEPARTMENT dept
where emp.ssn = dept.mgrssn 
and pro.DNUM = dept.DNUMBER 
and pro.PLOCATION = 'Stafford';

select emp1.fname || ' ' || emp1.lname as emp_full_name,
 emp2.fname || ' ' || emp2.lname as super_full_name from EMPLOYEE emp1
join employee emp2 on emp1.superssn = emp2.ssn;

select distinct(salary) from EMPLOYEE;

select * from project;
select * from DEPARTMENT;
select * from employee;

select pro.pnumber, pro.PNAME, emp.fname || ' ' || emp.lname as super_name
from project pro
join DEPARTMENT dept on dept.dnumber = pro.dnum
join EMPLOYEE emp on emp.ssn = dept.mgrssn
where fname = 'Jennifer' and lname = 'Walliance';

select pro.pnumber, wo.PNO, pro.PNAME, emp.fname || ' ' || emp.lname as full_name
from project pro
join WORKS_ON wo on wo.pno = pro.PNUMBER
join EMPLOYEE emp on emp.ssn = wo.essn
where fname = 'Jennifer' and lname = 'Walliance';

select * from EMPLOYEE
where ssn like '%44%';

select * from EMPLOYEE
where current_date - bdate >= 70;

select emp.fname, pro.pname, emp.salary from EMPLOYEE emp
join WORKS_ON wo on wo.essn = emp.ssn
join Project pro on pro.pnumber = wo.pno
where pname = 'Computerization';

select emp.fname, emp.salary, dept.DNAME from EMPLOYEE emp
join DEPARTMENT dept on dept.dnumber = emp.dno
where salary < 33000 and dept.DNAME = 'Research';

select emp.fname, emp.salary, dept.DNAME from EMPLOYEE emp
join DEPARTMENT dept on dept.dnumber = emp.dno
where salary between 33000 and 44000 and dept.DNAME = 'Research';

select emp.fname || ' ' || emp.lname as full_name, pro.PNAME,
 dept.dname from employee emp
join WORKS_ON wo on wo.essn = emp.ssn
join project pro on pro.pnumber = wo.pno
join department dept on dept.dnumber = emp.dno
order by dept.DNAME, emp.LNAME, pro.pname;

select fname from EMPLOYEE
where SUPERSSN is null;
