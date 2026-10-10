use school;

-- VIEWS 
create view high_salary as
select emp_name,salary,city
from employee
where salary > 80000;

select * from high_salary;

show full tables where table_type='view';
describe high_salary;

create or replace view high_salary as
select emp_name ,salary
from employee 
where salary > 10000;

drop view high_salary;

-- STRING FUNCTIONS 
select upper(emp_name) as caps from employee;
select lower(emp_name) as small from employee;
select concat(emp_name,' - ',city) as add_str from employee;
select length(emp_name) len_name from employee;
select substring(city,1,3) 3_words from employee;
select trim(job_role)  from employee;
select replace(emp_name,'a','@') from employee;
select locate('a','leela');
select reverse('leela');
select left('chennai',3);
select right('panni',4);
select lpad('123',5,'0');
select rpad('1234',6,'0');
select char_length("hello");
