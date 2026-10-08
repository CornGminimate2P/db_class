select fname,salary from EMPLOYEE
where salary > 30000;

select * from EMPLOYEE
where sex = 'F';

select DEPENDENT_NAME,RELATIONSHIP from DEPENDENT
where RELATIONSHIP = 'SON' or RELATIONSHIP = 'Daughter';

select DEPENDENT_NAME,RELATIONSHIP from DEPENDENT
where RELATIONSHIP in ('SON', 'Daughter');

select DEPENDENT_NAME,RELATIONSHIP,BDATE from DEPENDENT
where RELATIONSHIP = 'SON' and bdate > date '1970-12-31';

select fname from EMPLOYEE
where fname like 'J%';

select fname,dno from EMPLOYEE
where dno in(1,4);

select fname,dno from EMPLOYEE
where dno not in(5);

select * from EMPLOYEE
where bdate between date'1950-01-01' and date'1960-12-31';

select * from EMPLOYEE
where SUPERSSN is null;

select DEPENDENT_NAME,RELATIONSHIP from DEPENDENT
where RELATIONSHIP not in ('SON', 'Daughter');

select fname from EMPLOYEE
where fname < 'N' ;

select * from PROJECT
where PLOCATION not in('Sugarland','Bellaire');

select * from WORKS_ON
where hours not between 10 and 30;

select * from WORKS_ON
where hours < 10 or hours > 30;
