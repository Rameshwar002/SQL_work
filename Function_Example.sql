set global log_bin_trust_function_creators=1;
delimiter $$
create function calincome(start_value float)
returns float
begin
	declare income float;
    set income =0;
    while income < 5000 do
		set income = income + start_value;
	end while;
    return income;
    end $$
delimiter ;
select calincome(1000);

drop function credit_limit;
delimiter $$

create function credit_limit(credit float)
returns varchar(20)
begin
	declare card varchar(20);
    if credit_limit > 100000 then
		set card='platinum';
	ELSEIF (credit_limit <= 50000 and credit_limit >=30000) then
		set card='gold';
	elseif credit_limit <=30000 then
		set card='silver';
	end if;
    return card;
    end $$
    delimiter ;
    select credit_limit(40000);
    