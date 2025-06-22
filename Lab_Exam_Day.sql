
create table emp(empno int , emname varchar(20),job varchar(10), mgr int,
hiredate date, sal float, deptno int);
insert into emp value(111,'Saw kalayar','CLERK',115,'2003-12-17',800,20),
(112,'Anug Myst','SALESMAN',115,'2002-02-20',1600,30),
(113,'Wai Wai','SALESMAN',114,'2004-02-22',1250,30),
(114, "Ba Nyo", "Manager", Null,"1981-05-10",4850,30),
(115, "Myat Thu", "Clerk", 114,"1981-12-03",3000,20),
(116, "Cho Myint", "Clerk", 115,"1990-12-09",1500,20),
(117, "AAye Win", "Clerk", 114,"1993-01-23",1200,10);
select*from emp;

create table Dept(deptno int,dname varchar(15),Loc varchar(15));
insert into Dept values (10,"STORE","CHICAGO"),
(20,"RESEARCH","DALLAS"),(30,"SALES","NEWYARK"),
(40,"MARKETING","BOSTON");
select * from Dept;

create table Salgrade(grade int,low_sal float,hi_sal float);
insert into Salgrade values(1,700,1200),(2,1201,1400);
insert into Salgrade values(1,700,1200),(2,1201,1400),
(3,1401,2000),(4,2001,3000),(5,3001,9999);
select * from Salgrade;

-- Q1) List all employees whose name begins with ‘A’.
select * from emp where emname like 'A%';

-- Q2) List employee name, number and salary for those employees who earn in the range 1200 to 1400.
 select emname,empno,sal from emp where sal between 1200 and 1400;
 
-- Q3) Find the average salary for each job type and the number of people employed in each job.
 select avg(sal),job,count(job) from emp group by job;
 
-- Q4) List the employee names and their experiences which are greater than 10 years with alphabetical orders.
 SELECT emname,DATEDIFF( SYSDATE(), hiredate )/365 from emp 
where datediff(sysdate(), hiredate)/365 >10
order by emname;

-- Q5) Update the information of employee ‘Myat Thu’ who is transferred to the department 20 as a manager and his salary is increased by 1000.
update emp set job="MANAGER",sal=4000
where empno=115;
select*from emp;

-- Q6) Give all the employees in the RESEARCH department a10% pay rise. Verify that this has been done by listing all their details before and after the rise.
select emname, sal, (sal*1.10) as afterrise 
from emp where deptno=20 ;