create database selling_management;

use selling_management;
create table customer_info(
customer_id int not null auto_increment primary key,
customer_name varchar(40),
customer_age int check (customer_age >0)
);

create table order_info(
order_id int not null auto_increment primary key,
customer_id int,
order_date datetime,
order_total_price decimal(12,2),
foreign key (customer_id) references customer_info(customer_id)
);

create table product_info(
product_id int not null auto_increment primary key,
product_name varchar(50),
product_price int
);

create table order_detail(
order_id int,
product_id int,
order_detail_quantity int not null,
primary key(order_id,product_id),
foreign key (order_id) references order_info(order_id),
foreign key (product_id) references product_info(product_id)
);
