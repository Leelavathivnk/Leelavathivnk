-- NUMERIC FUNCTIONS
select round(95.5);
select ceil(98.9);
select floor(78.6);
select abs(-765);
select mod(10,3);
select power(3,2);
select truncate(956.6756,3);
select sqrt(169);

-- DATE & TIME FUNCTIONS 
select now();
select curdate();
select curtime();
select datediff('2022-01-05','2020-02-10');
select date_format(JOINing_DATE,' %d-%m-%Y') from employee;
select *, year(joining_date ) from employee where emp_name='priya';
select emp_name ,month(joining_date) from employee  ;
select emp_name,day(joining_date) from employee;
select emp_name,dayname(joining_date)from employee;
select emp_name,monthname(joining_date)from employee;
select date_add('2026-09-19', interval 10 day);
select date_sub('2026-09-19', interval 30 day);