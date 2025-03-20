create table customers(customers_id int primary key, name varchar(100), email varchar(100));

insert into customers values(2001,'zkon','zkon@gmail.com'),
(2002,'ykon','ykon@gmail.com'),
(2003,'xkon','xkon@gmail.com');

create table orders(order_id int primary key, customers_id int, product varchar(100), amount int, foreign key (customers_id) references customers(customers_id));

insert into orders values(3001,2001,'Laptop', 50000),
(3002,2002,'Mobile', 20000),
(3003,2003,'Tablet', 30000),
(3004,2001,'Laptop', 50000);

select customers.name, customers.email, orders.product, orders.amount from customers inner join orders on custome
rs.customers_id = orders.customers_id;

select customers.name, customers.email, orders.product, orders.amount from customers left join orders on customers.customers_id = orders.customers_id;
