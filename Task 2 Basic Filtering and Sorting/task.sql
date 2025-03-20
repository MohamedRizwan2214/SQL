create database SQL_Pretraining;
use sql_pretraining;
create table employees (Employee_id int primary key, Name varchar(100) Not null, age int, department varchar(50), salary int);
insert into employees values(1001,'akon', 28, 'HR', 55000),
(1002,'bkon', 35, 'Development', 75000),
(1003,'ckon', 40, 'Testing', 68000);
select * from employees;

select * from employees where department="HR";

select * from employees where salary>60000;

select * from employees order by salary desc;

select * from employees order by name asc;

SELECT * from employees where Department = 'HR' AND salary > 50000;

SELECT * from employees where Department = 'Testing' OR salary < 70000;

select * from employees where age > 18 and salary < 60000 order by name asc;