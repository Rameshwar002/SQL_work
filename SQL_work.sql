create temporary table cradit_sal(empo int primary key,sal float);
insert into cradit_sal select emp_id,salary from employees where salary > 35000;
select*from cradit_sal;
delete from employees where emp_id = 210;

DELIMITER //
CREATE PROCEDURE check_table_exist(table_name VARCHAR(100)) 
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = table_name;
    SET @sql_query = CONCAT('SELECT 1 FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 1) THEN
        SET @table_exists = 0;
    ELSE
        SET @table_exists = 1;
        DEALLOCATE PREPARE stmt1;
    END IF;
END //
DELIMITER ;
CALL check_table_exist('cradit_sal');
SELECT @table_exists;


create index idx_fir on employees(first_name);
explain select*from employees where first_name = 'kirthi';






use empdb;
create table committees(committees_id int auto_increment,committees_name varchar(100),
primary key(committees_id));
insert into committees(committees_name) value('john'),('mary'),('amelia'),('joe');
create table members (member_id INT AUTO_INCREMENT,mamber_name varchar(100),
PRIMARY KEY (member_id));
-- insert into members(mamber_name) value('john'),('jane'),('mary'),('david'),('amelia');
alter table members add column mamber_saly varchar(20);
insert into members (mamber_name ,mamber_saly) value("john",25000),("jane",42000),("mary",60000),("david",40000),("amelia",10000);
select* from members;
select*from committees; 
committees

/* INNER JOIN EXAMPLE */

select 
m.member_id,
m.mamber_name as members,
c.committees_id,
c.committees_name as committees
from
members m 
inner join committees c on c.committees_name=m.mamber_name;
select* from emp1_table;
desc emp1_table;
insert into dept value('HR','Human Resourse');

/* LEFT JOIN EXAMPLE */

select 
m.member_id,
m.mamber_name as members,
c.committees_id,
c.committees_name as committees
from
members m 
left join committees c on c.committees_name=m.mamber_name;

/* RIGHT JOIN EXAMPLE */
select 
m.member_id,
m.mamber_name as members,
c.committees_id,
c.committees_name as committees
from
members m 
right join committees c on c.committees_name=m.mamber_name;
update members set member_id=3 where member_id=6;
select*from members;
-- subqueries 
-- max salary of each dept



create database rbs;


drop table employee1;
create table employee1(emp_name varchar(15),ssn int primary key not null,address varchar(30) ,salary float,superssn int, dob date);
insert into employee1 values('Myst Min',111,'Yangon',50000,114,'1995-02-03'),
('Aung Lin',112,'Phaan',40000,111,'1992-05-10')
,('Thein Than',113,'Yangon',25000,112,'1997-10-05')
,('Nyo Nyo',114,'Mawlamyine',43000,111,'1990-12-01'),
('Swe Zin',115,'Mandalay',38000,112,'2000-03-03'),
('Aye Myint',116,'Mandalay',25000,111,'1990-01-01');

drop table project;
create table project(pno int primary key not null ,pname varchar(15));
insert into project values(1,'projectX'),(2,'ProjectY'),(3,'ProjectZ');
select*from project;
/*
drop table works_on;
create table works_on(ssn int , pno int,hours int,
foreign key (pno) references project(pno),foreign key(ssn) references employee1(ssn));
insert into works_on values (111,1,11),(113,1,15),(116,1,13),
(111,2,9),(114,2,20),(112,3,20),(115,3,18);
select*from works_on;
*/
drop table works_on;
create table works_on(ssn int, pno int, Hours int);
insert into works_on values (111,1,11),(113,1,15),(116,1,13),
(111,2,9),(114,2,20),(112,3,20),(115,3,18);
select*from works_on;

-- Write a query to list the name of employees who stay in a city whose first letter is ‘M’.
select emp_name from employee1 where address like 'M%';

-- Find the names of employees that are directly supervised by ‘Myat Min’.
select emp_name from employee1 where superssn = 111;


create table old_employee
(name varchar(15),ssn int primary key,
address varchar(30),salary float,superssn int,DOB date);

drop trigger if exists delete_employee;
delimiter $$
create trigger delete_employee
after delete on employee1
for each row
	begin 
	insert into old_employee values(old.emp_name, old.ssn, old.address, old.salary, old.superssn, old.DOB);
end $$
delimiter ;
select * from employee1;
delete from employee1 where ssn=115;
select * from employee1;
select * from old_employee;



