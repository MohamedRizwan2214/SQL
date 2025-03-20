create database SQL_Pretraining;
use sql_pretraining;
create table employees (Employee_id int primary key, Name varchar(100) Not null, age int, department varchar(50), salary int);
insert into employees values(1001,'akon', 28, 'HR', 55000),
(1002,'bkon', 35, 'Development', 75000),
(1003,'ckon', 40, 'Testing', 68000);