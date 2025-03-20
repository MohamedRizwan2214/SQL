use sql_pretraining;
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

select sum(salary) as totalSalary from employees;

 select avg(age) as Average_Age_of_employees from employees;
 
 select count(Employee_id) from employees;
 
  select count(department) as d_count,department from employees group by department having d_count>1;