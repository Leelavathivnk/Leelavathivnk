CREATE DATABASE company_db;
USE company_db; 
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    manager_id INT,
    job_role VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    gender VARCHAR(10),
    joining_date DATE,
    email VARCHAR(100)
);

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT
);


INSERT INTO department VALUES
(1, 'IT', 'Chennai'),
(2, 'HR', 'Bangalore'),
(3, 'Finance', 'Chennai'),
(4, 'Marketing', 'Hyderabad'),
(5, 'Sales', 'Mumbai'),
(6, 'Operations', 'Pune'),
(7, 'Admin', 'Delhi');

INSERT INTO employee VALUES
(101, 'Arun', 1, NULL, 'Manager', 85000, 'Chennai', 'Male', '2020-01-15', 'arun@gmail.com'),
(102, 'Priya', 1, 101, 'Developer', 65000, 'Chennai', 'Female', '2021-03-10', 'priya@gmail.com'),
(103, 'Karthik', 1, 101, 'Tester', 55000, 'Bangalore', 'Male', '2022-05-20', 'karthik@gmail.com'),
(104, 'Divya', 1, 101, 'Developer', 70000, 'Chennai', 'Female', '2021-07-12', 'divya@gmail.com'),
(105, 'Rahul', 2, NULL, 'HR Manager', 75000, 'Bangalore', 'Male', '2019-06-18', 'rahul@gmail.com'),
(106, 'Sneha', 2, 105, 'HR Executive', 45000, 'Bangalore', 'Female', '2022-02-11', 'sneha@gmail.com'),
(107, 'Vijay', 2, 105, 'Recruiter', 42000, 'Chennai', 'Male', '2023-01-25', 'vijay@gmail.com'),
(108, 'Meena', 3, NULL, 'Finance Manager', 80000, 'Chennai', 'Female', '2019-09-05', 'meena@gmail.com'),
(109, 'Suresh', 3, 108, 'Accountant', 50000, 'Chennai', 'Male', '2021-11-15', 'suresh@gmail.com'),
(110, 'Anitha', 3, 108, 'Accountant', 52000, 'Bangalore', 'Female', '2022-08-19', 'anitha@gmail.com'),
(111, 'Manoj', 4, NULL, 'Marketing Manager', 78000, 'Hyderabad', 'Male', '2020-04-22', 'manoj@gmail.com'),
(112, 'Pooja', 4, 111, 'Marketing Executive', 48000, 'Hyderabad', 'Female', '2022-06-14', 'pooja@gmail.com'),
(113, 'Ravi', 5, NULL, 'Sales Manager', 72000, 'Mumbai', 'Male', '2020-10-10', 'ravi@gmail.com'),
(114, 'Lakshmi', 5, 113, 'Sales Executive', 46000, 'Mumbai', 'Female', '2023-03-01', 'lakshmi@gmail.com'),
(115, 'Ajay', 5, 113, 'Sales Executive', 44000, 'Pune', 'Male', '2022-12-12', 'ajay@gmail.com'),
(116, 'Swetha', 6, NULL, 'Operations Manager', 68000, 'Pune', 'Female', '2020-02-17', 'swetha@gmail.com'),
(117, 'Dinesh', 6, 116, 'Operations Executive', 43000, 'Pune', 'Male', '2023-05-10', 'dinesh@gmail.com'),
(118, 'Naveen', 1, 101, 'Developer', 62000, 'Delhi', 'Male', '2023-07-20', 'naveen@gmail.com'),
(119, 'Aishwarya', 1, 101, 'Tester', 57000, 'Chennai', 'Female', '2022-09-09', 'aishwarya@gmail.com'),
(120, 'Gokul', 3, 108, 'Senior Accountant', 60000, 'Mumbai', 'Male', '2021-04-16', 'gokul@gmail.com'),
(121, 'Keerthi', 4, 111, 'Content Writer', 40000, 'Hyderabad', 'Female', '2023-08-21', 'keerthi@gmail.com'),
(122, 'Mohan', 5, 113, 'Sales Executive', 47000, 'Chennai', 'Male', '2022-10-18', 'mohan@gmail.com'),
(123, 'Harini', 6, 116, 'Operations Executive', 45000, 'Bangalore', 'Female', '2021-12-05', 'harini@gmail.com'),
(124, 'Sanjay', NULL, NULL, 'Consultant', 55000, 'Chennai', 'Male', '2024-01-10', 'sanjay@gmail.com'),
(125, 'Deepa', NULL, NULL, 'Analyst', 50000, 'Delhi', 'Female', '2024-02-15', 'deepa@gmail.com');


INSERT INTO project VALUES
(201, 'Automation Framework', 1),
(202, 'Employee Recruitment', 2),
(203, 'Financial Reporting', 3),
(204, 'Digital Marketing', 4),
(205, 'Sales Management', 5),
(206, 'Operations Tracking', 6),
(207, 'Company Website', 1),
(208, 'Customer Analytics', 5);

select*from employee;
select*from department;
select *from project;


-- PART 1 [Basic SELECT ]
select emp_name,job_role,salary from employee;
select emp_name , city from employee;
select distinct city from employee;
SELECT distinct job_role from employee;
SELECT emp_name as employee_name , salary as monthly_salary from employee;

-- PART 2 [WHERE Conditions / Filtering ]
select *from employee where salary> 60000;
select* from employee where salary <50000;
select *from employee where salary BETWEEN  50000 and 70000 ;
select emp_name from employee where city="chennai";
select emp_name from employee where not city="chennai";
select emp_name,gender from employee where gender="female";
select emp_name,salary from employee where gender="male" AND salary> 50000;
select emp_name,city from employee where city in ("chennai" , "bangalore");
select * from employee where department_id in (1,3);

-- PART 3 [AND / OR / NOT ]
select * from employee where city="chennai" and gender="female";
select *from employee where salary>60000 and city="chennai";
select* from employee where salary> 70000 or city="banglore";
select *from employee where not city="chennai";
select* from employee where gender="male" and city="chennai" or "mumbai" ;

-- PART 4 [LIKE / Wildcards ]
select* from employee where emp_name like "A%";
select* from employee where emp_name like "%a";
select* from employee where emp_name like "%an%";
select *  from employee where email like "%gmail.com";
select *from employee where job_role like"%manager%";

-- PART 5 [ORDER BY ]
select *from employee order by salary asc;
select *from employee order by salary desc;
select emp_name from employee order by salary desc;
select * from employee order by emp_name asc;
select * from employee order by department_id asc , salary desc;

-- PART 6 [LIMIT ]
select * from employee order by salary desc limit 5;
select*from employee order by salary asc limit 3;
select * from employee limit 10;

-- PART 7 [Aggregate Functions ]
select count(emp_id) from employee ;
select sum(salary) from employee;
select avg(salary) from employee;
select max(salary) from employee;
select min(salary) from employee;
select  count(emp_id) from employee where gender="male";
select count(emp_id) from employee where gender ="female";

-- PART 8 [GROUP BY ]
select department_id  ,count(emp_id) from employee  group by department_id;
SELECT department_id, AVG(salary) AS average_salary FROM employee GROUP BY department_id;
select department_id, max(salary) as max_salary from employee group by department_id;
select department_id, min(salary) as min_salary from employee group by department_id;
select department_id,sum(salary) as total_salary from employee group by department_id;
select city, count(emp_id) as total_employees from employee group by city;
select gender,count(emp_id) as male_female_emp from employee group by gender;

-- PART 9 [HAVING]
select department_id,count(*) as employee_count 
from employee
group by department_id
having count(*)>3;

select department_id, avg(salary) as avg_salary 
from employee
group by department_id
having avg(salary) > 60000;

select department_id, sum(salary) as total_salary
from employee
group by department_id
having sum(salary) > 200000;

select city, count(*) as employee_count
from employee
group by city
having count(*) >3;

-- PART 10 [INNER JOIN ]
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

-- PART 11 [LEFT JOIN ]
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

-- PART 12 [RIGHT JOIN ]
select d.department_name ,e.emp_name 
from department d
right join employee e
on d.department_id= e.department_id;

select d.department_name ,e.emp_name
from employee e
right join department d
on d.department_id= e.department_id
where e.emp_name is  null ;

-- PART 13 [SELF JOIN ]
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

-- PART 14 [JOIN + GROUP BY] 
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

-- PART 15 [Multiple Table JOIN ]
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

















































