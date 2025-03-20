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


select employee_id,name from employees where salary > (select avg(salary) from employees);

select employee_id,name from employees where salary > (select avg(salary) from employees); -- non correleated subquery

 select * from employees e1 where salary=(select max(salary) from employees e2 where e1.department = e2.department); -- correleated subquery
 --the above query is used to find the employee with maximum salary in each department

 