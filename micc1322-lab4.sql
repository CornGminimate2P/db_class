create table EMPLOYEE (
	SSN	number(9,0),
	FNAME	varchar2(15),
	MINIT	char(1),
	LNAME	varchar2(15),
	BDATE	date,
	ADDRESS	varchar2(50),
	SEX	char(1),
	SALARY	number(5,0),
	SUPERSSN number(9,0),
	DNO number(2,0),

	constraint pk_emp_ssn primary key (SSN)
);

create table DEPARTMENT (
	DNUMBER	number(2,0),
	DNAME	varchar2(30),
	MGRSSN	number(9,0),
	MGRSTARTDATE date,

	constraint pk_dept_dnumber primary key (DNUMBER)
);

create table DEPT_LOCATIONS (
	DNUMBER	number(2,0),
	DLOCATION varchar2(15),

	constraint pk_deptloc_loc primary key (DNUMBER,DLOCATION)
);

create table PROJECT (
	PNUMBER	number(2,0),
	PNAME	varchar2(20),
	PLOCATION	varchar(15),
	DNUM	number(2,0),

	constraint pk_project_pnum primary key (PNUMBER)
);

create table WORKS_ON (
	ESSN	number(9,0),
	PNO	number(2,0),
	HOURS	number(10,2),

	constraint pk_works_on primary key (ESSN,PNO)
);

alter table EMPLOYEE
	add constraint fk_emp_superssn foreign key (SUPERSSN) references EMPLOYEE (SSN);

alter table EMPLOYEE
	add constraint fk_emp_dno foreign key (DNO) references DEPARTMENT (DNUMBER);

alter table DEPARTMENT
	add constraint fk_dept_mgrssn foreign key (MGRSSN) references EMPLOYEE (SSN);

alter table DEPT_LOCATIONS
	add constraint fk_deptloc_dnumber foreign key (DNUMBER) references DEPARTMENT (DNUMBER);

alter table  WORKS_ON
	add constraint fk_works_on_emp foreign key (ESSN) references EMPLOYEE (SSN);

alter table  WORKS_ON
	add constraint fk_works_on_proj foreign key (PNO) references PROJECT (PNUMBER);

--select table_name, constraint_name, constraint_type from USER_CONSTRAINTS
--where table_name in ('EMPLOYEE','DEPARTMENT','PROJECT');

--drop table EMPLOYEE cascade constraints;
--drop table DEPARTMENT cascade constraints;
--drop table DEPT_LOCATIONS cascade constraints;
--drop table PROJECT cascade constraints;
--drop table WORKS_ON cascade constraints;
