create database class;
use class;
create table employees (emp_id int, first_name varchar(10), last_name varchar(10), hiring_date date, salary float, commission float, job_id varchar(20), manager_id int, dept_id int);
insert into employees value(100, 'kirthi', 'ram', '2010-05-10', 24000, 0.1, 'AD_VP', 100, 90),
(101, 'Sai', 'krish', '2001-02-09', 70000, 0.1, 'AD_VP', 100, 90),
(102, 'Steven', 'S', '2019-02-09', 47000, 0.1, 'AD_VP', 102, 90),
(103, 'Kairg', 'Kim', '2019-02-09', 39000, 0.1, 'IT_PROG', 103, 60),
(104, 'Truvi', 'kevi', '2019-02-09', 30000, 0.1, 'IT_PROG', 103, 60),
(105, 'Kennady', 'Jack', '2019-02-09', 34800, 0.1, 'IT_PROG', 103, 60),
(106, 'Laxman', 'Vikram', '2019-02-09', 25000, 0.1, 'FI_ACCOUNT', 102, 100),
(107, 'Raj', 'Kumar', '2019-02-09', 20000, 600, 'FI_ACCOUNT', 102, 100),
(108, 'Pankaj', 'Mohan', '2020-08-19', 15000, 0.2, 'FI_ACCOUNT', 102, 20),
(109, 'kirubha', 'mani', '2010-05-10', 24000, 0.1, 'AD_VP', 102, 20);
select*from employees;

create table department (dept_id int, dept_name varchar(40), manager_id int, location_id int);
insert into department values(10, 'Administration',  200 , 1700 ),
( 20, 'Marketing',  201,  1800),
( 30, 'Purchasing', 114,   1700 ),
(  40,'Human_Resources' ,203,  2400),
(  50, 'Shipping',  121,  1500),
(  60,'IT',    103 ,   1400),
(  70, 'Public_Relations', 204,2700),
(  80, 'Sales',  145, 2500);
select*from department;

 create table location (location_id int, street_address varchar(50), postal_code varchar(10), 
 city varchar(20), country_id varchar(5));
insert into location values(1000, "1297 Gandhi Road", "989",  "Delhi",   "INDIA"),
(1100, "93091 Cathedral Road", "10934", "Chennai", "India"),
(1300, "9450 Kamiya-cho",  "6823",   "Hiroshima",  "JP"),
(1400, "2014 Jabberwocky Rd",   "26192" ,   "Southlake" , "US"),
(1500 , "2011 Interiors Blvd" ,  "99236",   "South San",   "US"),
(1600,  "2007 Zagora St",   "50090", "South Brun",    "US"),
(1700,  "2004 Charade Rd",  "98199",  "Seattle",   "US"),
(1800,  "147 Spadina Ave",   "M5V 2L7", "Toronto",   "CA");
select*from location;
-- Qno1
select first_name, last_name , salary from employees where salary > (select salary from employees where last_name='kevi');

-- Qno2
select first_name,last_name from employees 
where dept_id=(select dept_id from department where dept_name='IT');

-- Qno3
select first_name, last_name from employees where manager_id in 
(select emp_id from department where location_id in 
(select location_id from location where country_id ='US'));

-- Qno 4
select first_name, last_name from employees where manager_id in
(select manager_id from department);

-- Qno5
select first_name,last_name from employees 
where salary>(select avg(salary) from employees);

-- finding the less saly emp
select first_name,last_name,salary,dept_id from employees oq where
 salary < (select avg(salary) from employees iq where iq.dept_id = oq.dept_id);
 
 -- using a exits (the yes/no or 1/0 output)
 select exists (select * from location where country_id="US");
 
 -- coping the stracture of one table to other
 create table if not exists copy_table select*from employees where dept_id=60;
 select*from copy_table;
 
 -- commit, rollback, savepoint examples
 -- we can write auto commit= 0/1 or off /on