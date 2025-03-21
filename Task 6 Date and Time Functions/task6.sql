create table employees (Employee_id int primary key, Name varchar(100) Not null, age int, department varchar(50), salary int);
insert into employees values(1001,'akon', 28, 'HR', 55000),
(1002,'bkon', 35, 'Development', 75000),
(1003,'ckon', 40, 'Testing', 68000);
select * from employees;
INSERT INTO Employees (Employee_id, Name, Age, Department, Salary) VALUES
(1004, 'dkon', 30, 'Marketing', 60000),
(1005, 'ekon', 26, 'Development', 72000),
(1006, 'fkon', 32, 'HR', 58000),
(1007, 'gkon', 29, 'Testing', 65000),
(1008, 'hkon', 37, 'Development', 80000);

alter table employees add joining_date date;
update employees set joining_date = '2020-01-01' where employee_id = 1001;
update employees set joining_date = '2020-02-01' where employee_id = 1002; 
update employees set joining_date = '2018-03-10' where employee_id = 1003;
update employees set joining_date = '2022-06-15' where employee_id = 1004;
update employees set joining_date = '2017-11-20' where employee_id = 1005;
update employees set joining_date = '2019-08-05' where employee_id = 1006;
update employees set joining_date = '2023-01-10' where employee_id = 1007;
update employees set joining_date = '2021-07-25' where employee_id = 1008;

--to find the employees who have joined the company before 5 years
 select name,joining_date, datediff(curdate(),joining_date)/365 as Years from employees where datediff(curdate(),joining_date)/365>=5;

select * from orders where order_date < date_sub(curdate(),interval 30 day);
--to find the orders which are placed before 30 days i.e, older than a month

select order_id date_format(order_date,"%d-%m-%y") as formatted_date from orders;\

select order_id, date_format(order_date,'%d-%m-%y') from orders;



 