CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS department;

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO department VALUES
(1,'IT','Chennai'),(2,'HR','Bangalore'),(3,'Finance','Chennai'),
(4,'Marketing','Hyderabad'),(5,'Sales','Mumbai'),(6,'Operations','Pune'),
(7,'Admin','Delhi'),(8,'Research','Coimbatore');

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

INSERT INTO employee
(emp_id,emp_name,department_id,manager_id,job_role,salary,city,gender,joining_date,email)
VALUES
(101,'Arun',1,NULL,'IT Manager',80000,'Chennai','Male','2020-04-01','arun101@company.com'),
(102,'Priya',2,NULL,'HR Manager',41000,'Bangalore','Female','2022-01-31','priya102@company.com'),
(103,'Karthik',3,NULL,'Finance Manager',55000,'Hyderabad','Male','2021-07-03','karthik103@company.com'),
(104,'Divya',4,NULL,'Marketing Manager',48000,'Mumbai','Female','2020-02-24','divya104@company.com'),
(105,'Rahul',5,NULL,'Sales Manager',83000,'Pune','Male','2019-12-23','rahul105@company.com'),
(106,'Sneha',6,NULL,'Operations Manager',77000,'Delhi','Female','2023-09-25','sneha106@company.com'),
(107,'Vijay',1,1,'Developer',42000,'Coimbatore','Male','2019-05-03','vijay107@company.com'),
(108,'Meena',2,2,'Tester',45000,'Kochi','Female','2021-06-14','meena108@company.com'),
(109,'Suresh',3,3,'Senior Developer',54000,'Chennai','Male','2024-08-31','suresh109@company.com'),
(110,'Anitha',4,4,'Automation Tester',78000,'Bangalore','Female','2019-04-19','anitha110@company.com'),
(111,'Manoj',5,5,'Business Analyst',75000,'Hyderabad','Male','2021-03-25','manoj111@company.com'),
(112,'Pooja',6,6,'HR Executive',85000,'Mumbai','Female','2023-09-15','pooja112@company.com'),
(113,'Ravi',1,1,'Recruiter',54000,'Pune','Male','2024-01-14','ravi113@company.com'),
(114,'Lakshmi',2,2,'Accountant',77000,'Delhi','Female','2022-02-13','lakshmi114@company.com'),
(115,'Ajay',3,3,'Senior Accountant',40000,'Coimbatore','Male','2020-10-15','ajay115@company.com'),
(116,'Swetha',4,4,'Marketing Executive',84000,'Kochi','Female','2023-09-28','swetha116@company.com'),
(117,'Dinesh',5,5,'Content Writer',61000,'Chennai','Male','2022-02-12','dinesh117@company.com'),
(118,'Naveen',6,6,'Sales Executive',49000,'Bangalore','Female','2021-05-31','naveen118@company.com'),
(119,'Aishwarya',1,1,'Operations Executive',88000,'Hyderabad','Male','2022-10-10','aishwarya119@company.com'),
(120,'Gokul',2,2,'Support Engineer',46000,'Mumbai','Female','2020-01-15','gokul120@company.com'),
(121,'Keerthi',3,3,'Data Analyst',64000,'Pune','Male','2020-02-01','keerthi121@company.com'),
(122,'Mohan',4,4,'Developer',62000,'Delhi','Female','2022-11-09','mohan122@company.com'),
(123,'Harini',5,5,'Tester',78000,'Coimbatore','Male','2021-12-19','harini123@company.com'),
(124,'Sanjay',6,6,'Senior Developer',42000,'Kochi','Female','2024-02-25','sanjay124@company.com'),
(125,'Deepa',1,1,'Automation Tester',74000,'Chennai','Male','2020-05-26','deepa125@company.com'),
(126,'Vikram',2,2,'Business Analyst',64000,'Bangalore','Female','2019-11-19','vikram126@company.com'),
(127,'Nithya',3,3,'HR Executive',75000,'Hyderabad','Male','2022-04-15','nithya127@company.com'),
(128,'Ramesh',4,4,'Recruiter',80000,'Mumbai','Female','2023-01-21','ramesh128@company.com'),
(129,'Kavya',5,5,'Accountant',76000,'Pune','Male','2021-02-26','kavya129@company.com'),
(130,'Prakash',6,6,'Senior Accountant',85000,'Delhi','Female','2019-10-12','prakash130@company.com'),
(131,'Shruthi',1,1,'Marketing Executive',42000,'Coimbatore','Male','2021-07-22','shruthi131@company.com'),
(132,'Bala',2,2,'Content Writer',89000,'Kochi','Female','2022-03-31','bala132@company.com'),
(133,'Monika',3,3,'Sales Executive',45000,'Chennai','Male','2021-08-11','monika133@company.com'),
(134,'Ganesh',4,4,'Operations Executive',46000,'Bangalore','Female','2023-04-06','ganesh134@company.com'),
(135,'Ramya',5,5,'Support Engineer',57000,'Hyderabad','Male','2024-02-01','ramya135@company.com'),
(136,'Surya',6,6,'Data Analyst',80000,'Mumbai','Female','2023-02-03','surya136@company.com'),
(137,'Preethi',1,1,'Developer',50000,'Pune','Male','2023-02-25','preethi137@company.com'),
(138,'Sathish',2,2,'Tester',62000,'Delhi','Female','2021-05-08','sathish138@company.com'),
(139,'Janani',3,3,'Senior Developer',82000,'Coimbatore','Male','2021-12-29','janani139@company.com'),
(140,'Lokesh',4,4,'Automation Tester',84000,'Kochi','Female','2019-10-20','lokesh140@company.com'),
(141,'Anu',5,5,'Business Analyst',78000,'Chennai','Male','2020-12-01','anu141@company.com'),
(142,'Dharani',6,6,'HR Executive',74000,'Bangalore','Female','2021-09-29','dharani142@company.com'),
(143,'Vimal',1,1,'Recruiter',50000,'Hyderabad','Male','2024-03-08','vimal143@company.com'),
(144,'Reshma',2,2,'Accountant',64000,'Mumbai','Female','2022-01-10','reshma144@company.com'),
(145,'Ashok',3,3,'Senior Accountant',80000,'Pune','Male','2021-06-18','ashok145@company.com'),
(146,'Hema',4,4,'Marketing Executive',83000,'Delhi','Female','2022-08-21','hema146@company.com'),
(147,'Yogesh',5,5,'Content Writer',89000,'Coimbatore','Male','2019-08-18','yogesh147@company.com'),
(148,'Sowmya',6,6,'Sales Executive',54000,'Kochi','Female','2019-05-12','sowmya148@company.com'),
(149,'Hari',1,1,'Operations Executive',60000,'Chennai','Male','2023-07-02','hari149@company.com'),
(150,'Vaishnavi',2,2,'Support Engineer',57000,'Bangalore','Female','2019-09-29','vaishnavi150@company.com'),
(151,'Magesh',3,3,'Data Analyst',53000,'Hyderabad','Male','2022-07-12','magesh151@company.com'),
(152,'Swathi',4,4,'Developer',53000,'Mumbai','Female','2024-08-06','swathi152@company.com'),
(153,'Rohit',5,5,'Tester',65000,'Pune','Male','2024-02-23','rohit153@company.com'),
(154,'Ishwarya',6,6,'Senior Developer',49000,'Delhi','Female','2021-12-20','ishwarya154@company.com'),
(155,'Naveena',1,1,'Automation Tester',48000,'Coimbatore','Male','2021-10-07','naveena155@company.com'),
(156,'Kiran',2,2,'Business Analyst',87000,'Kochi','Female','2021-12-12','kiran156@company.com'),
(157,'Bhavya',3,3,'HR Executive',87000,'Chennai','Male','2023-10-21','bhavya157@company.com'),
(158,'Tarun',4,4,'Recruiter',77000,'Bangalore','Female','2023-06-24','tarun158@company.com'),
(159,'Neha',5,5,'Accountant',63000,'Hyderabad','Male','2021-06-17','neha159@company.com'),
(160,'Rakesh',6,6,'Senior Accountant',48000,'Mumbai','Female','2024-09-18','rakesh160@company.com'),
(161,'Aarthi',1,1,'Marketing Executive',71000,'Pune','Male','2020-01-08','aarthi161@company.com'),
(162,'Siva',2,2,'Content Writer',88000,'Delhi','Female','2019-07-12','siva162@company.com'),
(163,'Pavithra',3,3,'Sales Executive',47000,'Coimbatore','Male','2020-09-18','pavithra163@company.com'),
(164,'Kumar',4,4,'Operations Executive',80000,'Kochi','Female','2020-10-17','kumar164@company.com'),
(165,'Shalini',5,5,'Support Engineer',90000,'Chennai','Male','2023-09-26','shalini165@company.com'),
(166,'Vasanth',6,6,'Data Analyst',78000,'Bangalore','Female','2019-09-18','vasanth166@company.com'),
(167,'Mahalakshmi',1,1,'Developer',64000,'Hyderabad','Male','2023-04-13','mahalakshmi167@company.com'),
(168,'Aditya',2,2,'Tester',78000,'Mumbai','Female','2024-04-01','aditya168@company.com'),
(169,'Renu',3,3,'Senior Developer',73000,'Pune','Male','2021-10-26','renu169@company.com'),
(170,'Bharath',4,4,'Automation Tester',75000,'Delhi','Female','2019-02-17','bharath170@company.com'),
(171,'Sangeetha',5,5,'Business Analyst',83000,'Coimbatore','Male','2020-04-14','sangeetha171@company.com'),
(172,'Mithun',6,6,'HR Executive',83000,'Kochi','Female','2025-01-08','mithun172@company.com'),
(173,'Sandhya',1,1,'Recruiter',88000,'Chennai','Male','2021-12-28','sandhya173@company.com'),
(174,'Aravind',2,2,'Accountant',89000,'Bangalore','Female','2022-10-25','aravind174@company.com'),
(175,'Nandhini',3,3,'Senior Accountant',47000,'Hyderabad','Male','2022-04-17','nandhini175@company.com'),
(176,'Vignesh',4,4,'Marketing Executive',67000,'Mumbai','Female','2020-10-09','vignesh176@company.com'),
(177,'Gayathri',5,5,'Content Writer',69000,'Pune','Male','2019-01-14','gayathri177@company.com'),
(178,'Suraj',6,6,'Sales Executive',86000,'Delhi','Female','2021-12-14','suraj178@company.com'),
(179,'Megha',1,1,'Operations Executive',72000,'Coimbatore','Male','2021-01-01','megha179@company.com'),
(180,'Deepak',2,2,'Support Engineer',72000,'Kochi','Female','2020-03-11','deepak180@company.com'),
(181,'Varun',3,3,'Data Analyst',80000,'Chennai','Male','2022-05-07','varun181@company.com'),
(182,'Chandru',4,4,'Developer',80000,'Bangalore','Female','2024-09-10','chandru182@company.com'),
(183,'Padmini',5,5,'Tester',78000,'Hyderabad','Male','2021-03-25','padmini183@company.com'),
(184,'Abhishek',6,6,'Senior Developer',49000,'Mumbai','Female','2023-03-12','abhishek184@company.com'),
(185,'Riya',1,1,'Automation Tester',88000,'Pune','Male','2020-10-23','riya185@company.com'),
(186,'Srinivas',2,2,'Business Analyst',74000,'Delhi','Female','2024-12-12','srinivas186@company.com'),
(187,'Anjali',3,3,'HR Executive',40000,'Coimbatore','Male','2022-08-20','anjali187@company.com'),
(188,'Kishore',4,4,'Recruiter',71000,'Kochi','Female','2019-03-21','kishore188@company.com'),
(189,'Nisha',5,5,'Accountant',47000,'Chennai','Male','2023-01-26','nisha189@company.com'),
(190,'Mani',6,6,'Senior Accountant',59000,'Bangalore','Female','2021-09-07','mani190@company.com'),
(191,'Lavanya',1,1,'Marketing Executive',43000,'Hyderabad','Male','2021-09-13','lavanya191@company.com'),
(192,'Gautham',2,2,'Content Writer',76000,'Mumbai','Female','2019-11-19','gautham192@company.com'),
(193,'Rohini',3,3,'Sales Executive',45000,'Pune','Male','2024-06-13','rohini193@company.com'),
(194,'Karthika',4,4,'Operations Executive',44000,'Delhi','Female','2024-12-21','karthika194@company.com'),
(195,'Sanjay',5,5,'Support Engineer',89000,'Coimbatore','Male','2020-05-30','sanjay195@company.com'),
(196,'Rakesh',6,6,'Data Analyst',48000,'Kochi','Female','2024-04-30','rakesh196@company.com'),
(197,'Divya',1,1,'Developer',75000,'Chennai','Male','2020-11-07','divya197@company.com'),
(198,'Vimal',2,2,'Tester',56000,'Bangalore','Female','2024-12-01','vimal198@company.com'),
(199,'Anu',NULL,NULL,'Senior Developer',78000,'Hyderabad','Male','2023-09-30','anu199@company.com'),
(200,'Kiran',NULL,NULL,'Automation Tester',53000,'Mumbai','Female','2021-04-03','kiran200@company.com');

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT
);

INSERT INTO project VALUES
(201,'Automation Framework',1),
(202,'Employee Recruitment',2),
(203,'Financial Reporting',3),
(204,'Digital Marketing',4),
(205,'Sales Management',5),
(206,'Operations Tracking',6),
(207,'Company Website',1),
(208,'Customer Analytics',5),
(209,'HR Portal',2),
(210,'Research Dashboard',8);

select * from employee;
select * from department;
select * from project;

-- DATE FUNCTIONS 
select emp_name , joining_date
from employee 
where joining_date > '2022-01-01'  ;

select emp_name , joining_date 
from employee 
where joining_date <'2021-01-01' ;

select emp_name, joining_date
from employee
 where year(joining_date)=2023; 
 
 select emp_name, YEAR(joining_date) as joining_year
 from employee ;
 select emp_name ,year(curdate()) - year(joining_date) as working_years
from employee;
 -- [or]
 SELECT emp_name,
TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS years_working
FROM employee;
 
-- STRING FUNCTIONS
select upper(emp_name) as capital_letters from employee;
select lower(emp_name) as small_letters from employee;
select emp_name,length(emp_name) as length_of_name from employee;
select concat(emp_name,' - ', job_role) as empname_job from employee;
select substring(emp_name,1,3) as only_3_char from employee;

-- SUB STRING
select emp_name,salary as higher_avg_salary
from employee
where salary > (
select avg(salary) 
from employee);

select * from employee
where salary=(
select max(salary) 
from employee ) ;

select emp_name,SALARY from employee 
where salary IN  (
select salary from employee
group by salary having count(*)> 1);

select emp_name,department_id
from employee 
where department_id in 
(select department_id 
from employee 
where emp_name='priya');

select emp_name,salary 
from employee 
where salary > 
(select salary 
from employee 
where emp_name='arun');

-- ADVANCE COMBINATIONS
select max(salary) as 2nd_highest_salary
from employee
where salary <
( select max(salary) 
from employee );

-- {nested sub query method}
select max(salary) as 3rd_highest_salary
from employee 
where salary < (
select max(salary) 
from employee
where salary < (
select max(salary) 
from employee )
);

select e.emp_name,e.department_id, e.salary
from employee e
where salary =
( select max(salary) 
from employee e2
where e2.department_id =e.department_id);


 select department_id, avg_salary
 from (
 select department_id,avg(salary) as avg_salary
 from employee
 group by department_id) as dept_avg
 where avg_salary=( 
 select max(avg_salary)
 from (  
 select department_id ,avg(salary) as avg_salary
 from employee
 group by department_id) as averages);
 
