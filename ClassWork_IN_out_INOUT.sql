create user 'ram'@'localhost' identified by 'ram';
grant all on class.department to 'ram'@'localhost';

create view emp12 as select dept_id,dept_name from department where dept_name like "f%" with check option;
insert into emp12 value(20,"finance");

-- example of IN 
delimiter $$ 
create procedure get_emp_details(IN var1 int)
begin select 
emp_id, concat(first_name,last_name)as name ,salary,e.dept_id, dept_name 
from employees e,department d where e.dept_id=var1 and e.dept_id=d.dept_id;
end $$
delimiter ;
call get_emp_details(103);
select*from employees where emp_id ='103';

-- example of OUT
delimiter $$ 
create procedure get_sum(OUT var1 int)
begin select 
sum(salary) into var1 from employees group by dept_id having dept_id=20;
end $$
delimiter ;

call get_sum(@m);
select @m;

-- Example of INOUT
delimiter $$
create procedure get_sum_sal(INOUT var1 int)
begin select 
sum(salary) into var1 from employees group by dept_id having dept_id= var1;
end $$
delimiter ;
set @m=60;
call get_sum_sal(@m);
select @m;


delimiter $$

create procedure get_max_sal(OUT var1 int)
begin select 
max(salary) into var1 from employees group by dept_id having dept_id= 20;
end $$
delimiter ;

call get_max_sal(@m);
select @m;

