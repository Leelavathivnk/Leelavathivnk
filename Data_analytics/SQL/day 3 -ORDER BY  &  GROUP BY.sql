CREATE DATABASE BUSINESS;
USE BUSINESS;

CREATE TABLE SALES( order_id int,
product varchar(50),
category varchar(30),
city varchar(30),
quantity int, sales int);

INSERT INTO sales (order_id, product, category, city, quantity, sales)
VALUES
(101, 'Laptop', 'Electronics', 'Chennai', 1, 55000),
(102, 'Mouse', 'Electronics', 'Bangalore', 3, 1500),
(103, 'Keyboard', 'Electronics', 'Chennai', 2, 2400),
(104, 'Office Chair', 'Furniture', 'Mumbai', 2, 18000),
(105, 'Laptop', 'Electronics', 'Hyderabad', 1, 62000),
(106, 'Desk', 'Furniture', 'Chennai', 1, 12000),
(107, 'Headphones', 'Electronics', 'Bangalore', 4, 8000),
(108, 'Office Chair', 'Furniture', 'Chennai', 3, 27000),
(109, 'Notebook', 'Stationery', 'Mumbai', 10, 1500),
(110, 'Pen', 'Stationery', 'Chennai', 20, 1000),
(111, 'Laptop', 'Electronics', 'Mumbai', 2, 110000),
(112, 'Desk', 'Furniture', 'Bangalore', 2, 24000),
(113, 'Mouse', 'Electronics', 'Chennai', 5, 2500),
(114, 'Notebook', 'Stationery', 'Bangalore', 15, 2250),
(115, 'Headphones', 'Electronics', 'Hyderabad', 2, 4000),
(116, 'Office Chair', 'Furniture', 'Mumbai', 1, 9000),
(117, 'Pen', 'Stationery', 'Chennai', 30, 1500),
(118, 'Laptop', 'Electronics', 'Bangalore', 1, 58000),
(119, 'Desk', 'Furniture', 'Hyderabad', 1, 13000),
(120, 'Notebook', 'Stationery', 'Chennai', 25, 3750);

select * from sale order by sales desc;  #[HIGH--> LOW]
select * from sale order by sales asc;   #[LOW-->HIGH]

select * from sale order by product asc; #(A-->Z)
SELECT * FROM SALE ORDER BY SALES DESC LIMIT 5;

SELECT * FROM SALE ORDER BY SALES ASC LIMIT 3;

SELECT * FROM SALE  ORDER BY CITY ASC, SALES DESC; # ORDERBY-->MULTIPLE COL. 

SELECT*FROM SALE;

SELECT CITY ,SUM(SALES) AS TOTAL_SALES 
FROM SALE GROUP BY CITY;

SELECT CATEGORY, SUM(SALES) AS TOTAL_SALES 
FROM SALE GROUP BY CATEGORY;

SELECT CITY, COUNT(ORDER_ID) AS TOTAL_ORDERS 
FROM SALE GROUP  BY CITY ;  

SELECT CATEGORY, AVG(SALES) AS AVG_SALES 
FROM SALE GROUP BY CATEGORY;

SELECT CITY, MAX(SALES) AS HIGHEST_SALES 
FROM SALE GROUP BY CITY;

SELECT CATEGORY, MIN(SALES) AS LOWEST_SALES 
FROM SALE GROUP BY CATEGORY;

SELECT CITY ,SUM(SALES) AS TOTAL_SALES
FROM SALE GROUP BY CITY HAVING TOTAL_SALES> 50000 ;

SELECT CATEGORY, AVG(SALES) AS AVG_SALES 
FROM SALE GROUP BY CATEGORY HAVING AVG_SALES > 20000;

SELECT CITY, SUM(SALES) AS TOTAL_SALES 
FROM SALE GROUP BY CITY
ORDER BY TOTAL_SALES DESC LIMIT 3;



