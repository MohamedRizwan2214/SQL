create database ecommerce;
use ecommerce;


create table users (user_id int auto_increment primary key , 
name varchar(100), email varchar(100) not null unique,
 password varchar(100), user_type ENUM('Customer', 'Employee') NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
 
 INSERT INTO Users (name, email, password, user_type) VALUES
('Akon', 'akon@example.com', '123456', 'Customer'),
('Bkon', 'bkon@example.com', '123456', 'Employee'),
('Ckon', 'ckon@example.com', '123456', 'Customer'),
('Dkon', 'dkon@example.com', '123456', 'Employee'),
('Ekon', 'ekon@example.com', '123456', 'Customer');

create table products(product_id int auto_increment primary key, name varchar(100) not null, price int not null,stock int default 0,category varchar(50));
INSERT INTO Products (name, price, stock, category) VALUES
('Laptop', 70000, 10, 'Electronics'),
('Smartphone', 30000, 25, 'Electronics'),
('Headphones', 5000, 50, 'Accessories'),
('Shoes', 2000, 30, 'Fashion'),
('Backpack', 1500, 20, 'Bags'),
('Keyboard', 2500, 15, 'Accessories'),
('Washing Machine', 25000, 5, 'Home Appliances'),
('Refrigerator', 40000, 8, 'Home Appliances'),
('Table', 5000, 12, 'Furniture'),
('Chair', 3000, 18, 'Furniture');


create table orders(order_id int auto_increment primary key, user_id int,   foreign key (user_id) references users
(user_id),total_price int , date TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

INSERT INTO Orders (user_id, total_price) VALUES
(1, 5000),
(2, 15000),
(3, 7500),
(1, 20000),
(4, 3500);


create table order_details(order_details_id int auto_increment primary key, order_id int,
foreign key (order_id) references orders (order_id), 
product_id int,foreign key(product_id) references products(product_id) , quantity int, price int );

INSERT INTO Order_Details (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 140000),  
(1, 3, 1, 5000),    
(2, 2, 1, 30000),   
(3, 5, 2, 3000),    
(4, 7, 1, 25000),   
(5, 10, 4, 12000);  

create table inventory(inventory_id int auto_increment primary key , product_id int unique,foreign key(product_id) references products(product_id) ,quantity 
int default 0, availability ENUM('Available', 'NA') NOT NULL);

INSERT INTO Inventory (product_id, quantity, availability) VALUES
(1, 10, 'Available'),   -- 10 Laptops in stock
(2, 5, 'Available'),    -- 5 Smartphones in stock
(3, 0, 'NA'),          -- No Headphones available
(4, 8, 'Available'),    -- 8 Keyboards in stock
(5, 12, 'Available'),   -- 12 Backpacks in stock
(6, 0, 'NA'),          -- No Monitors available
(7, 3, 'Available'),    -- 3 Washing Machines in stock
(8, 1, 'Available'),    -- 1 Refrigerator in stock
(9, 0, 'NA'),          -- No Air Conditioners available
(10, 6, 'Available');   -- 6 Chairs in stock



-- indexing
create index idx_orderdetails on order_details(order_id);

explain select * from products where name ='Keyboard';
create index idx_product_name on products(name);
explain select * from products where name ='Keyboard';

create index idx_order_details on order_details (order_id);
show index from order_details;

-- triggers 
show triggers;

DELIMITER //
create trigger update_availability before update on inventory
for each row 
begin 
if new.quantity>0 then 
	set new.availability='Available';
else 
	set new.availability='NA';
end if;
end //
DELIMITER ;

update inventory set  quantity=0 where product_id=1;
select * from inventory;

create table inventory_log(log_id int auto_increment primary key, product_id int,old_quantity int, new_quantity int, changed_at timestamp default current_timestamp);

DROP TRIGGER IF EXISTS update_log;
drop table inventory_log;


Delimiter //
create trigger update_log after update on inventory 
for each row
begin
  insert into inventory_log(product_id,old_quantity,new_quantity) values(old.product_id,old.quantity,new.quantity);
end // 
Delimiter ;

update inventory set quantity=4 where product_id=1;
update inventory set quantity=0 where product_id=2;
update inventory set quantity=2 where product_id=3;
update inventory set quantity=1 where product_id=4;
update inventory set quantity=9 where product_id=5;



-- transactions
select * from orders;
start transaction;

update inventory set quantity=quantity-1 where product_id=1;
insert into orders (user_id, total_price ) values(1,5000);
insert into order_details (order_id, product_id, quantity, price) 
VALUES (last_insert_id(), 1, 1, 5000);
select * from order_details;
commit;

-- view
create view order_summary as 
select o.order_id, u.name as customer_name, o.total_price from orders o join users u on o.user_id=u.user_id;

select * from order_summary where customer_name ='akon';


