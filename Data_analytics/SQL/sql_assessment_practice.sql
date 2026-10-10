CREATE DATABASE sql_assessment;
USE sql_assessment;
show tables;
drop table employee;
CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO department (department_id, department_name, location)
VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Chennai'),
(4, 'Marketing', 'Mumbai'),
(5, 'Sales', 'Bangalore'),
(6, 'Operations', 'Hyderabad'),
(7, 'Legal', 'Chennai');

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    joining_date DATE,
    gender VARCHAR(10),
    email VARCHAR(100),
    manager_id INT,
    city VARCHAR(50),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO employee
(emp_id, emp_name, department_id, salary, joining_date, gender, email, manager_id, city)
VALUES
(101, 'Arun', 1, 75000, '2022-01-15', 'Male', 'arun@company.com', NULL, 'Chennai'),
(102, 'Priya', 1, 60000, '2023-03-20', 'Female', 'priya@company.com', 101, 'Chennai'),
(103, 'Karthik', 1, 55000, '2023-07-10', 'Male', 'karthik@company.com', 101, 'Chennai'),
(104, 'Divya', 2, 50000, '2021-11-05', 'Female', 'divya@company.com', NULL, 'Bangalore'),
(105, 'Rahul', 2, 45000, '2024-01-12', 'Male', 'rahul@company.com', 104, 'Bangalore'),
(106, 'Sneha', 3, 80000, '2020-06-18', 'Female', 'sneha@company.com', NULL, 'Chennai'),
(107, 'Vikram', 3, 65000, '2022-09-25', 'Male', 'vikram@company.com', 106, 'Chennai'),
(108, 'Meena', 3, 65000, '2023-12-01', 'Female', 'meena@company.com', 106, 'Chennai'),
(109, 'Ravi', 4, 55000, '2021-04-22', 'Male', 'ravi@company.com', NULL, 'Mumbai'),
(110, 'Anitha', 4, 48000, '2024-02-15', 'Female', 'anitha@company.com', 109, 'Mumbai'),
(111, 'Suresh', 5, 70000, '2019-08-30', 'Male', 'suresh@company.com', NULL, 'Bangalore'),
(112, 'Lakshmi', 5, 52000, '2022-05-14', 'Female', 'lakshmi@company.com', 111, 'Bangalore'),
(113, 'Manoj', 5, 52000, '2023-10-09', 'Male', 'manoj@company.com', 111, 'Bangalore'),
(114, 'Pooja', 6, 58000, '2021-02-28', 'Female', 'pooja@company.com', NULL, 'Hyderabad'),
(115, 'Naveen', 6, 42000, '2024-03-05', 'Male', 'naveen@company.com', 114, 'Hyderabad');


select * from employee;
-- Q1 
select emp_name,salary,city from employee where 
salary>60000;

-- Q2
select emp_name,salary from employee 
where department_id=3 AND salary>60000;

-- Q3 *
select distinct city from employee order by city asc;

-- Q4 *
select count(emp_id) from employee;

-- Q5 *
select max(salary) from employee;

-- Q6
select avg(salary) from employee;

-- Q7 *
select department_id,count(emp_id) as employee_count from employee
group by department_id;

-- Q8 *
select department_id,avg(salary) as avg_salary from employee
group by department_id;

-- Q9 *
Select department_id,avg(salary) as avg_salary from employee
 group by department_id having avg_salary>60000 ;

-- Q10 *
select e.emp_name ,d.department_name from employee e
join department d
on e.department_id=d.department_id;

-- Q11 
select e.emp_name,d.department_name 
from department d
left join employee e 
on d.department_id=e.department_id;

-- Q12
select emp_name,salary,
CASE 
when salary>=70000 then 'high'
when salary>=50000 then 'medium'
else  'low'
END  as salary_category
from employee;

-- Q13
select emp_name,salary from employee 
where salary> (
select avg(salary) from employee) ;

-- Q14
select d.department_name,count(emp_id) as employee_count
from  employee e
join department d
on e.department_id=d.department_id
group by d.department_name having count(emp_id)>2;

-- Q15
select emp_name,department_id ,salary
from (select emp_name,department_id,salary,
 rank() over(
partition by department_id
order by salary desc 
 ) as emp_salary
from employee) as highest  where emp_salary=1;

-- Q16
select emp_name,department_id,salary
from (select emp_name,salary,department_id,
dense_rank() over(
partition by department_id
order by salary desc 
)as  emp_sal
from employee) as second_highest where emp_sal=2;

-- Q17

select emp_name,salary,
lag(salary) over (
order by joining_date asc) as previous_salary 
from employee;

-- Q18
select emp_name,salary,
salary-lag(salary) over (
order by joining_date asc) as salary_diffrence 
from employee;

-- Q19
WITH dept_avg AS (
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM employee
    GROUP BY department_id
),
company_avg AS (
    SELECT AVG(salary) AS overall_avg
    FROM employee
)
SELECT d.department_id,
       d.avg_salary
FROM dept_avg AS d
CROSS JOIN company_avg AS c
WHERE d.avg_salary > c.overall_avg;

-- 9|10|26
-- Q1
select emp_name,salary,joining_date
from employee
where year(joining_date)>='2023' and salary<60000 
order by salary desc;

-- Q2
select department_id,count(gender) as female_count
from employee where gender='female'
group by department_id  having count(gender)>1
order by female_count desc;

-- Q3
select d.department_id,d.department_name,d.location
from department d
left join employee e
on d.department_id=e.department_id
where emp_id  is null;

-- Q4
select category,count(*) as emp_count
from (
select emp_name,salary ,
case
when salary>=70000 then 'high'
when salary >=50000 and salary<70000 then 'medium'
else 'low' 
end as category
from employee) as categorised_emp
group by category
order by emp_count desc;

-- level:1
-- Q1
select emp_name,salary,city from employee 
where emp_name like 'A%';

-- Q2
select emp_name,department_id,salary 
from employee 
where department_id in (1,3,5);

-- Q3
select emp_name, department_id, salary
from employee 
where department_id not in (1,3,5);

-- Q4
select emp_name, salary 
from employee where salary between 50000 and 70000
order by salary asc;

-- Q5
select emp_name, emp_id, manager_id
from employee where manager_id is null;

-- Q7
select emp_name,city
from employee where emp_name not like 'A%' ;

-- Q8
select distinct city from employee 
order by city asc;

-- Q9
select department_id,count(emp_id) 
from employee
group by department_id;

-- Q10
select department_id,count(emp_id) as emp_count
from employee 
group by department_id having emp_count>2;

-- Q11
select emp_name, salary,
case
when salary >=70000 then 'High'
when salary >= 50000 and salary < 70000 then 'Medium'
else 'low'
end as salary_category
from employee;

-- Q12
select upper(emp_name) as emp_name_upper ,city 
from employee;

-- Q13
select count(distinct city) as unique_city_count
from employee where gender='female'
group by city;

-- Q14
select emp_name, 
ifnull(manager_id,'No Manager') as manager_id
from employee; 

-- Q15
select concat(emp_name,' - ',city) as employee_location
from employee;

-- Q16
select e.emp_name,e.department_id
from employee e 
where exists
( select 1
from department d
where e.department_id=d.department_id);

-- Q17
select d.department_id,d.department_name
from department d
where not exists 
( select 1 
from employee e 
where d.department_id=e.department_id);

-- Q18
select emp_name,department_id
from employee where department_id in
(select department_id 
from department where location='chennai');

-- Q19
select emp_name,department_id
from employee where department_id not  in
(select department_id 
from department where location='chennai');

-- Q20
update employee 
set city='Coimbatore'
where emp_name='Arun';

SET SQL_SAFE_UPDATES = 0;
select * from employee;

 

