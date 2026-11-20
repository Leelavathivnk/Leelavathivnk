-- E-commerce Return & Refund

create database ecommerce_analysis;
use ecommerce_analysis;
show tables;

create table customers(
	customer_id INT PRIMARY KEY,
	customer_name varchar(100),
	city varchar(50)
);
INSERT INTO customers (customer_id, customer_name, city)
VALUES
(1, 'Arun', 'Chennai'),
(2, 'Priya', 'Coimbatore'),
(3, 'Rahul', 'Chennai'),
(4, 'Divya', 'Madurai'),
(5, 'Karthik', 'Salem'),
(6, 'Meena', 'Chennai'),
(7, 'Sneha', 'Trichy'),
(8, 'Vikram', 'Coimbatore');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
INSERT INTO orders (order_id, customer_id, order_date, order_status)
VALUES
(101, 1, '2026-01-05', 'Completed'),
(102, 2, '2026-01-10', 'Completed'),
(103, 1, '2026-01-15', 'Completed'),
(104, 3, '2026-02-01', 'Completed'),
(105, 4, '2026-02-05', 'Cancelled'),
(106, 5, '2026-02-10', 'Completed'),
(107, 6, '2026-02-15', 'Completed'),
(108, 2, '2026-03-01', 'Completed'),
(109, 7, '2026-03-05', 'Completed'),
(110, 3, '2026-03-10', 'Completed'),
(111, 1, '2026-03-15', 'Completed'),
(112, 8, '2026-03-20', 'Completed');


CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 101, 201, 2, 500.00),
(2, 101, 202, 1, 1200.00),
(3, 102, 203, 3, 300.00),
(4, 103, 201, 1, 500.00),
(5, 103, 204, 2, 800.00),
(6, 104, 202, 2, 1200.00),
(7, 105, 205, 1, 2000.00),
(8, 106, 203, 5, 300.00),
(9, 107, 204, 1, 800.00),
(10, 108, 201, 4, 500.00),
(11, 109, 205, 2, 2000.00),
(12, 110, 203, 2, 300.00),
(13, 111, 202, 1, 1200.00),
(14, 112, 204, 3, 800.00);


CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_item_id INT,
    return_quantity INT,
    return_reason VARCHAR(100),
    refund_amount DECIMAL(10,2),
    FOREIGN KEY (order_item_id)
        REFERENCES order_items(order_item_id)
);
INSERT INTO returns
(return_id, order_item_id, return_quantity, return_reason, refund_amount)
VALUES
(1, 1, 1, 'Damaged product', 500.00),
(2, 3, 1, 'Wrong item', 300.00),
(3, 5, 1, 'Quality issue', 800.00),
(4, 6, 1, 'Damaged product', 1200.00),
(5, 8, 2, 'Wrong item', 600.00),
(6, 9, 1, 'Quality issue', 800.00),
(7, 10, 1, 'Changed mind', 500.00),
(8, 11, 1, 'Damaged product', 2000.00),
(9, 13, 1, 'Wrong item', 1200.00);

DESCRIBE customers;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE returns;

select order_id,customer_name,order_date,order_status
from customers c
inner join orders o
on c.customer_id=o.customer_id;

select order_id,customer_name,order_date,order_status
from customers c
inner join orders o
on c.customer_id=o.customer_id 
where order_status='completed';

select order_id,customer_name,order_date,city
from customers c
inner join orders o
on c.customer_id=o.customer_id 
where order_status='completed' and city='chennai';

select order_id,customer_name,order_date
from customers c
inner join orders o
on c.customer_id=o.customer_id 
order by order_date desc;

select c.customer_id,c.customer_name,count(order_id) as total_orders
from customers c
inner join orders o
on c.customer_id=o.customer_id 
group by c.customer_id,c.customer_name
order by total_orders desc;

select c.customer_id,c.customer_name,count(order_id) as total_orders
from customers c
inner join orders o
on c.customer_id=o.customer_id 
group by c.customer_id,c.customer_name
having total_orders >=2
order by total_orders desc;

select product_id,sum(quantity * unit_price ) as total_sales
from order_items
group by product_id
order by total_sales desc;

select * from customers;
select * from orders;
select * from order_items;
select * from returns;


select o.product_id,sum(r.refund_amount) as total_refund_amt
from order_items o 
inner join returns r 
on o.order_item_id=r.order_item_id 
group by o.product_id
order by total_refund_amt desc;

select return_reason,count(*) as total_returns,
sum(refund_amount) as total_refund_amount
from returns 
group by return_reason
order by total_returns desc;

select c.customer_id,c.customer_name,
count(r.return_id) as return_count 
from customers c
left join orders o
on c.customer_id=o.customer_id
left join order_items oi
on o.order_id=oi.order_id
left join returns r
on oi.order_item_id=r.order_item_id
group by c.customer_id,c.customer_name 
having count(r.return_id)=0
order by c.customer_id asc;


