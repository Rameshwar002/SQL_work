-- 
use emp_DB;
drop table emp1_table;
create table emp1_table(emp_no int NOT NULL, emp_name varchar(20) NOT NULL,emp_age int NOT NULL,emp_city varchar(50) NOT NULL default "pune", emp_adm_date date NOT NULL default "2021-03-01");
desc emp1_table;
insert into emp1_table value(1,"ayj",20,"pune","2021-03-01");
insert into emp1_table (emp_no , emp_name, emp_age) value (1,"raja", 52);
select * from emp1_table;

/* linking main table and sub table (foreign key) EXAMPLE */
drop table emp1_table;
drop table dept;
create table dept(dept_id varchar(10)NOT NULL, dept_name varchar(50) NOT NULL, primary key(dept_id));
insert into dept value("IT","Informaction_Tech");
insert into dept value("Mech","mechinical");
select*from dept;
create table stu_table(stu_id int, stu_name varchar(20),stu_city varchar(20) NOT NULL default "nanded" , dept_id varchar(20) ,primary key(stu_id),
foreign key(dept_id) references dept(dept_id));

insert into stu_table value(1,"ram","nanded","Mech");
insert into stu_table(stu_id,stu_name) value(2,"vaibhav");
select*from stu_table;