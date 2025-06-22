-- createing a trigger
create table log_emp(empid int, salary float, edittimr datetime);
delimiter $$
create trigger before_insert_emp before insert on employees for each row 
begin 
	set new.first_name = trim(new.first_name);
    set new.last_name = trim(new.last_name);
    set new.job_id = trim(new.job_id);
    end $$
    delimiter ;
    
    insert into employees values(210,'rama','b','2020-02-02',50000,0.1,'developer',103,90);
    select*from employees;
    
    
    -- after ka example
    delimiter $$
create trigger after_insert_emp before insert on employees for each row 
begin 
insert into log_emp values(new.emp_id,new.salary,now());
    end $$
    delimiter ;
    
    
    
    -- before_update_example
        delimiter $$
create trigger before_update_emp before update on employees for each row 
begin 
insert into log_emp values(new.emp_id,new.salary,now());
    end $$
    delimiter ;
    insert into employees values(210,'rama','b','2020-02-02',50000,0.1,'developer',103,90);
    select*from employees;
    select*from log_emp;


-- after del_example
create table salaries(empid int, salary float);
insert into salaries values(100,20200),()
 delimiter $$ 
 create trigger after_delete_emp after delete on employees for each row
begin 

    end $$
    delimiter ;
 