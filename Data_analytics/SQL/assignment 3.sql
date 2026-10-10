use company_db;
show tables;

select * from employee;

-- WINDOWS FUNCTION
-- Find the rank of each employee based on salary, from highest to lowest.
select emp_name,salary,job_role,
rank() over (
partition  by job_role
order by salary desc) as emp_rank
from employee;

-- Find the ROW_NUMBER() of employees ordered by salary descending
select emp_name,salary,job_role,
row_number() over (
partition  by job_role
order by salary desc) as emp_rank
from employee;

-- Find the DENSE_RANK() of employees based on salary within the entire company.
select emp_name,salary,job_role,
dense_rank() over (
partition  by job_role
order by salary desc) as emp_rank
from employee;

-- Find the second-highest salary using a window function
select emp_name,salary 
from (
select emp_name, salary,
dense_rank() over(
order by salary desc) as salary_rank
from employee)
as ranked
where salary_rank=2;

-- Find the third-highest salary using DENSE_RANK()
select emp_name,salary 
from (
select emp_name, salary,
dense_rank() over(
order by salary desc) as salary_rank
from employee)
as ranked
where salary_rank=3;

-- Find the highest-paid employee from each department using a window function
SELECT emp_name,salary,job_role
from (
select emp_name,salary,job_role,
rank() over (
partition  by department_id
order by salary desc) as emp_rank
from employee) as high_paid
where emp_rank=1
order by salary desc;

-- Find the top 3 highest-paid employees from each department.
SELECT emp_name,salary,job_role
from (
select emp_name,salary,job_role,department_id,
rank() over (
partition  by department_id
order by salary desc) as emp_rank
from employee) as top_paid
where emp_rank <= 3
order by salary desc ;

-- Find employees whose salary is greater than the average salary of their department using a window function.
 select emp_name,salary,job_role
 from  (select emp_name,salary,job_role,
avg(salary)  over (
partition  by department_id) as dept_avg
from employee) as emp_data
where salary > dept_avg ;

-- Display each employee's salary along with the average salary of their department.
select emp_name,salary,department_id,
avg(salary) over (
partition by department_id)
as dept_avg
from employee;

-- Display:Employee Name,Department ID,Salary ,Department Average Salary
select emp_name,department_id,salary,
avg(salary) over (
partition by department_id)
as department_avg_salary
from employee;

-- Find the salary difference between each employee and their department's average salary
 select emp_name,salary,department_id,
 salary - dept_avg_salary AS salary_difference
 from(
 select emp_name,department_id,salary,
avg(salary) over (
partition by department_id)
as dept_avg_salary
from employee ) as salary_difference ;

-- Find the employee with the highest salary in each city 
 select emp_name,salary,city
 from (select emp_name,salary,city,
max(salary) over (
partition by city)
as max_salary
from employee) as high_salary
where salary=max_salary;

-- Find the second-highest-paid employee in each department.
select emp_name,salary 
from (
select emp_name, salary,
dense_rank() over(
partition by department_id
order by salary desc) as salary_rank
from employee)
as ranked
where salary_rank=2;

-- Display each employee's salary along with the previous employee's salary using LAG().
select emp_name,salary,
lag(salary) over (
order by emp_name) as previous_emp_salary
from employee;

-- Display each employee's salary along with the next employee's salary using LEAD().
select emp_name,salary,
lead(salary) over (
order by emp_name) as next_emp_salary
from employee;

-- Find employees whose salary is higher than the previous employee's salary when employees are ordered by salary.
select emp_name,salary
from (select emp_name,salary,
lag(salary) over (
order by salary) as previous_emp_salary
from employee) as high_salary
where salary > previous_emp_salary;

-- Calculate a running total of salaries ordered by employee ID
select emp_name,salary,
sum(salary) over (
order by emp_id
rows between unbounded preceding
and current row) as running_total
from employee;

-- Calculate the running average salary ordered by joining date
select emp_name,salary,
avg(salary) over (
order by joining_date
rows between unbounded preceding
and current row) as running_average
from employee;

-- CTE COMMON TABLE EXPRESSIONS
-- Create a CTE to calculate the average salary of each department, then display departments whose average salary is greater than 60000.
with dept_avg as(
select department_id,
avg(salary) as avg_salary
from employee
group by department_id),
high_dept as(
select department_id 
from dept_avg
where avg_salary > 60000)
select * from high_dept;

-- Create a CTE to find the highest-paid employee in each department 
with high_paid as(
select department_id,
max(salary) as high_sal
from employee 
group by department_id)
select e.emp_name,e.salary,e.department_id
from employee e
join high_paid h
on h.department_id=e.department_id
where e.salary=h.high_sal;

-- Create a CTE to find employees whose salary is greater than the overall company average salary.
with avg_salary as (
select  avg(salary) As company_avg
from employee
) select emp_name,salary from employee
join avg_salary
where salary> company_avg;

-- Create a CTE to calculate the number of employees in each department, then display departments having more than 5 employees.
WITH dept_count AS (
SELECT department_id,
COUNT(*) AS employee_count
FROM employee
GROUP BY department_id
) 
 select department_id, employee_count from dept_count
where employee_count > 5;
 