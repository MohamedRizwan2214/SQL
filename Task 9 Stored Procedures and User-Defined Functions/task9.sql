use sql_pretraining;
select * from employees;
DELIMITER //
create procedure get_employee_by_date(in d1 date, in d2 date)
begin
select * from employees   where joining_date between d1 AND d2;
end //
DELIMITER ;

call get_employee_by_date('2020-01-01','2021-07-25');

select * from orders;

DELIMITER //

delimiter //

create function calculate_discount(price int, discount_percentage int) 
returns int
deterministic
begin
    return price - (price * discount_percentage / 100);
end //

delimiter ;

select product, 
       amount as original_price, 
       calculate_discount(amount, 10) as discounted_price
from orders;
