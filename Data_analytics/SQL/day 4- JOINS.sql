
select * from employee;
 -- [INNER JOIN ]
select e.emp_name,d.department_name 
from employee e
inner join department d 
on e.department_id= d.department_id;

select e.emp_name,e.job_role,d.department_name
from employee e 
inner join department d
on e.department_id = d.department_id;

select e.emp_name,d.department_name
from employee e 
inner join department d
on e.department_id=d.department_id
WHERE d.department_name="IT";

select e.emp_id,e.emp_name,d.department_name,d.location
from employee e
inner join department d
on e.department_id=d.department_id;

-- [LEFT JOIN ]
select e.emp_name ,d.department_name
from employee e 
left join department d
on e.department_id=d.department_id;

select e.emp_name,d.department_name
from employee e
left join department d
on e.department_id=d.department_id
where department_name  is null;

select d.department_name , count(e.emp_id ) as employee_count
from employee e
left join department d
on e.department_id =d.department_id
group by d.department_id;

--  [RIGHT JOIN ]
select d.department_name ,e.emp_name 
from department d
right join employee e
on d.department_id= e.department_id;

select d.department_name ,e.emp_name
from employee e
right join department d
on d.department_id= e.department_id
where e.emp_name is  null ;

--  [SELF JOIN ]
select e.emp_name as employee_name ,m.emp_name as manager_name 
from employee e
join employee m
on e.manager_id=m.emp_id;

select e.emp_name as employee_name ,m.emp_name as manager_name 
from employee e
join employee m
on e.manager_id=m.emp_id 
where m.emp_name is null;

select e.emp_name as employee_name ,m.emp_name as manager_name 
from employee e
join employee m
on e.manager_id=m.emp_id
where m.emp_name is not  null;

select e.emp_name AS employee_name,m.emp_name AS manager_name,
e.salary AS employee_salary 
from  employee e
join  employee m
on  e.manager_id = m.emp_id;

--  [JOIN + GROUP BY] 
select d.department_name ,count(emp_id) as employee_count
from employee e
inner join department d 
on e.department_id=d.department_id
group by d.department_name;


select d.department_name ,avg(salary) as avg_salary 
from employee e
inner join department d
on e.department_id = d.department_id
group by d.department_name;

select d.department_name ,max(salary) as highest_salary 
from employee e
inner join department d
on e.department_id = d.department_id
group by d.department_name;

select d.department_name ,sum(salary) as total_salary 
from employee e
inner join department d
on e.department_id = d.department_id
group by d.department_name;

--  [Multiple Table JOIN ]
select e.emp_name, d.department_name,p.project_name 
from employee e
join department d
on e.department_id=d.department_id 
join project p 
on d.department_id=p.department_id;

select p.project_name,d.department_name
from project p
join department d
on p.department_id= d.department_id;

select * from employee e
join department d 
on e.department_id=d.department_id
join project p 
on d.department_id=p.department_id;

select p.project_name, count(emp_id) as number_of_emp
from employee e
join project p
on e.department_id=p.department_id
group by p.project_name ;







