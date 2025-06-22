-- loop_examples if_elseif

create table odd_num(num int);
drop procedure get_odd_num;
delimiter $$ 
create procedure get_odd_num()
begin
	declare i int;
    set i=0;
    loop1:loop
    set i=i+1;
    if i>=10 then
		leave loop1;
	elseif (i%2)!=0 then
		insert into odd_num values(i);
		select(i);
        iterate loop1;
	end if;
    end loop loop1;
end $$ 
delimiter ;
call get_odd_num();
select*from odd_num;


-- example_to_find_name-between_100_form_emptable

create table emp_data(first_name varchar(50));
delimiter $$ 
create procedure get_emp_num()
begin
	declare i int;
    set i=100;
    loop1:loop
    set i=i+1;
    if i>=110 then
		leave loop1;
	elseif i<109 then
		insert into emp_data values(( (select first_name from employees where emp_id = i)));
        iterate loop1;
	end if;
    end loop loop1;
end $$ 
delimiter ;
call get_emp_num();
select*from emp_data;


-- example_of_whileloop

create table emp_data_while(first_name varchar(50));
delimiter $$ 
create procedure get_emp_While()
begin
	declare i int;
    set i=100;
    loop1: while i>110 do 
		insert into emp_data_while values((select salary from employees where emp_id=i));
		set i=i+1;
		end while loop1;
end $$ 
delimiter ;
call get_emp_While();
select*from emp_data_while;




drop procedure get_name_sal;
create table get_namesal(first_name varchar (50));
delimiter $$
-- truncate table odd_num; 
-- drop procedure if exists get_name_sal;
create procedure get_name_sal()
begin 
	declare i int;
    set i =100;
		loop1: REPEAT
           	insert into get_namesal values((select first_name from employees where emp_id = i));
            set i =i+1;
		UNTIL i>=110
        end REPEAT;
end $$
delimiter ;
call get_name_sal();
select * from get_namesal;