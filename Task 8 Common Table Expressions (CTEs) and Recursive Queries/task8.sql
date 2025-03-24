
--with cte 
with  avg_salary as(
    select department,avg(salary) as avg from employees group by department
) 

select e1.name, e1.department, e1.salary, a1.avg from employees e1  join avg_salary a1 on e1.department=a1.department where e1.salary>a1.avg;

--recursive cte

with recursive ns as (select 1 as num union all select num+1 from ns where num<10) select * from ns;

with recursive employee_hierarchy as (
    select employee_id, name, department, manager_id, 1 as level
    from employees
    where manager_id is null

    union all

    select e.employee_id, e.name, e.department, e.manager_id, eh.level + 1
    from employees e
    join employee_hierarchy eh on e.manager_id = eh.employee_id
    where eh.level < 10
)
select * from employee_hierarchy order by level, manager_id;
