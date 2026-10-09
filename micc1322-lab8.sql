drop table DEPT cascade constraints;

create table DEPT (
	DNum	int not null,
	DName	varchar2(15) not null,
	Location varchar2(30),

	constraint pk_dept primary key (DNum)
);

create table EMP (
	EmpNo	int not null,
	EName	varchar2(15) not null,
	Job	varchar2(15),
	HireDate	date not null,
	Mgr	int,
	Sal decimal(10,2) not null,
	Commission decimal(10,2),
	DeptNo	int,

	constraint pk_emp primary key (EmpNo)
);

alter table EMP 
	add constraint fk_emp_mgr foreign key (Mgr) references EMP (EmpNo);

alter table EMP 
	add constraint fk_emp_deptno foreign key (DeptNo) references DEPT (DNum);

-- DEPT ก่อนเสมอ (EMP.DeptNo อ้างอิงมาที่นี่)
insert into DEPT (DNum, DName, Location) values (10, 'Accounting', 'New York');
insert into DEPT (DNum, DName, Location) values (20, 'Research',   'Dallas');
insert into DEPT (DNum, DName, Location) values (30, 'Sales',      'Chicago');
insert into DEPT (DNum, DName, Location) values (40, 'Operation',  'Boston');

-- EMP: เรียงตามลำดับสายบังคับบัญชา (หัวหน้าก่อนลูกน้อง)
-- ระดับ 0: King (Mgr = NULL)
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7839, 'King', 'President', NULL, DATE '1981-11-17', 5000, NULL, 10);

-- ระดับ 1: ลูกน้อง King
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7566, 'Jones', 'Manager', 7839, DATE '1981-04-02', 2975, NULL, 20);
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7698, 'Blake', 'Manager', 7839, DATE '1981-05-01', 2850, NULL, 30);
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7782, 'Clark', 'Manager', 7839, DATE '1981-06-09', 2450, NULL, 10);

-- ระดับ 2: ลูกน้อง Jones / Blake / Clark
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7788, 'Scott', 'Analyst', 7566, DATE '1982-12-09', 3000, NULL, 20);
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7902, 'Ford', 'Analyst', 7566, DATE '1981-12-04', 3000, NULL, 20);
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7521, 'Ward', 'Salesman', 7698, DATE '1981-02-22', 1250, 500, 30);
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7654, 'Martin', 'Salesman', 7698, DATE '1981-09-28', 1250, 1400, 30);
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7844, 'Turner', 'Salesman', 7698, DATE '1981-09-08', 1500, 0, 30);
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7900, 'James', 'Clerk', 7698, DATE '1981-12-03', 950, NULL, 30);
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7934, 'Miller', 'Clerk', 7782, DATE '1982-01-23', 1300, NULL, 10);

-- ระดับ 3: ลูกน้อง Scott
insert into EMP (EmpNo, EName, Job, Mgr, HireDate, Sal, Commission, DeptNo)
values (7876, 'Adams', 'Clerk', 7788, DATE '1983-01-12', 1100, NULL, 20);

commit;

select * from emp;
select * from dept;

--1 แสดงชื่อ (EName) และตำแหน่ง (Job) ของพนักงานที่มีตำแหน่งเป็น “Analyst”
select EName, Job from EMP
where Job = 'Analyst';

--2 แสดงชื่อ (EName) และค่าคอมมิสชั่น (Commission) ของพนักงานที่มีตำแหน่งเป็น “Salesman”
select EName, Sal, Job from EMP
where Job = 'Salesman';

--3 แสดงข้อมูลทั้งหมดของพนักงานที่เริ่มเข้าทำงานก่อน 30 กันยายน 1981
select * from emp
where hiredate < date '1981-09-30';

--4 แสดงชื่อ (EName) และตำแหน่ง (Job) ของพนักงานที่ไม่ได้เป็น Manager
select EName, Job from emp
where job != 'Manager';

--5 แสดงชื่อ (EName) และรหัส (EmpNo) ของพนักงานที่มี EmpNo = 7369, 7521, 7839
select EName, EmpNo from emp
where EmpNo in (7369, 7521, 7839);

--6 แสดงชื่อ (EName) ของพนักงานที่ไม่ได้อยู่ในแผนก “Research” กับ “Accounting”
select emp.EName, dept.DName from emp
join dept on dept.dnum = emp.DEPTNO
where dept.dname not in ('Research', 'Accounting');

--7 แสดงชื่อ (EName) ของพนักงานที่เข้าร่วมงาน (HireDate) ตั้งแต่ 1981-06-30 จนถึง 1981-12-31
select EName, hiredate from emp
where hiredate between date '1981-06-30' and date '1981-12-31';

--8 แสดงชื่อพนักงานที่ไม่ได้รับ Commission
select EName , Commission from emp
where commission is null;

--9 แสดงชื่อของพนักงาน (EName) และชื่อแผนก DName ที่พนักงานคนนั้นสังกัดอยู่ โดยชื่อของพนักงานคนนั้นขึ้นต้นด้วย “S”
select emp.EName, dept.DName from emp
join dept on dept.dnum = emp.DEPTNO
where EName like 'S%';

--10 แสดงชื่อของพนักงาน (EName) ที่มีอักษร “I” อยู่ตัวที่สองของชื่อพนักงาน
select EName from emp
where EName like '_i%';

--11 แสดงชื่อ และเงินเดือนของพนักงานที่เมื่อปรับขึ้นเงินเดือนให้ 10% และเงินที่ปรับแล้วจะมากกว่า 5000
select EName, Sal, Sal * 1.1 as UpSal from emp
where Sal * 1.1 > 5000;

--12 แสดงชื่อ และนามสกุลของพนักงาน พร้อมกับชื่อ และนามสกุลของผู้จัดการของพนักงานคนนั้นๆ
select emp1.EName as emp_name, emp2.EName as mgr_name from emp emp1
join emp emp2 on emp2.empno = emp1.mgr;

select emp1.EmpNo, emp1.EName as emp_name, emp1.mgr, emp2.EName as mgr_name, emp2.empno as mgr_empno from emp emp1
join emp emp2 on emp2.empno = emp1.mgr;

select * from emp;

--13 แสดงชื่อ นามสกุลพนักงาน แผนก และตำแหน่ง ของพนักงานที่ทำงานในแผนก “Accounting” และมีตำแหน่งเป็น manager
select emp.EName, dept.DName, emp.Job from emp
join dept on dept.DNUM = emp.DEPTNO
where dept.DNAME = 'Accounting' and emp.job = 'Manager';

--14 แสดงชื่อ เงินเดือน และตำแหน่ง ของพนักงานที่ทำงานตำแหน่ง “Clerk” และมีเงินเดือนมากกว่า 1000
select ename, sal, job from emp
where job = 'Clerk' and Sal > 1000;
