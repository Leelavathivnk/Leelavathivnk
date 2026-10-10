CREATE TABLE student (
    student_id INT,
    name VARCHAR(50),
    age INT,
    marks INT
);

INSERT INTO student (student_id, name, age, marks)
VALUES
(1, 'Arun', 20, 85),
(2, 'Anu', 21, 72),
(3, 'Ravi', 20, 90),
(4, 'Kavi', 22, 65),
(5, 'Arun', 21, 78);

select * from student;

set sql_safe_updates = 0;

update student set age=30 where student_id=1;

delete from student where marks=65;

update student set name = null where student_id=1;

select *from student where name is null;

select name ,age from student;

select distinct name from student;

select * from student limit 3;
select *from student limit 3 offset 1;
select *from student limit 1,2;

select name as nickname from student;

select 1+1 as addition;
select 2*2 as multiply;

select * from student where marks>=80;
select *from student where name ="arun" or marks>90;

select *from student where marks between 80 and 90;

select * from student where student_id in (1,2);

select name from student where name like 'a%';
select name from student where name like "__u%" ;

alter table student add DOB varchar(50) after student_id;
alter table student add serial_no int first ;

select*from student;
