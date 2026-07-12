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

	constraint pk_emp_ssn primary key (SSN),
	constraint pk_emp_superssn primary key (SUPERSSN),
	constraint pk_emp_dno primary key (DNO)
);

create table DEPARTMENT (
	DNUMBER	number(2,0),
	DNAME	varchar2(30),
	MGRSSN	number(9,0),
	MGRSTARTDATE date,

	constraint pk_dept_dnumber primary key (DNUMBER),
	constraint fk_dept_mgrssn foreign key (MGRSSN) references EMPLOYEE (SSN)
);

create table DEPT_LOCATIONS (
	DNUMBER	number(2,0),
	DLOCATION varchar2(15),

	constraint fk_dept_loc_dnumber foreign key (DNUMBER) references DEPARTMENT (DNUMBER),
	constraint   
);

create table PROJECT (
	PNUMBER	number(2,0),
	PNAME	varchar2(20),
	PLOCATION	varchar(15),
	DNUM	number(2,0)
);

create table WORKS_ON (
	ESSN,
	PNO,
	HOURS	number(2,1)
);

create table DEPENDENT (
	ESSN,
	DEPENDENT_NAME,
	SEX,
	BDATE,
	RELATIONSHIP
);
