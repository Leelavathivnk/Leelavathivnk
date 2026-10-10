
-- SUBQUERY
select *
 from employee
 where salary >(SELECT AVG(salary) from employee);
 
-- SUBQUERY[WHERE CLAUSE]
select * from employee
where  salary >
(select min(salary) 
from employee 
where job_role= 'developer' );

-- SUBQUERY WITH IN
select * from employee 
where department_id in 
( select department_id 
from department 
where location ='chennai');

-- SUBQUERY WITH FROM CLAUSE
select emp_name , avg(salary) as emp_avg
 from (select * from employee ) as temp_avg
group by emp_name  ;

select  department_id, avg(salary) as dept_avg
from  (select * from  employee) as emp_avg
group by  department_id ;

 select avg(salary) as avg_salary from 
(SELECT emp_name, salary
FROM employee
WHERE salary > 60000) as high_salary;

-- SCALAR SUBQUERY (USING SELECT CLAUSE)

select emp_name, salary ,
(select avg(salary) from employee) as avg_salary from employee;

select emp_name,salary,
(select max(salary) from employee) as max_salary from employee limit 5;

-- SUBQUERY WITH HAVING
select job_role, avg(salary) as higher_avg_salary
from employee 
group by job_role having avg(salary) >(select avg(salary) from employee); 

-- CORRELATED SUBQUERY 
select emp_name,department_id,salary
from employee 
where salary > (select avg(salary) from employee 
where department_id=1);

-- NON-CORRELATED SUBQUERY employee
select emp_name,salary from employee
where salary < (select avg(salary) from employee);

-- EXISTS 
 select  emp_name   from employee e
where exists (select 1 
from project p where e.department_id=p.department_id);

-- NOT EXISTS
select  emp_name   from employee e
where  NOT exists (select 1 
from project p where e.department_id=p.department_id);

-- ANY & ALL 
select  *   from employee 
where  salary >
all  (select max(salary) from employee where city='bangalore' );

SELECT *
FROM employee
WHERE salary > ALL
(
    SELECT salary
    FROM employee
    WHERE city = 'Bangalore'
);