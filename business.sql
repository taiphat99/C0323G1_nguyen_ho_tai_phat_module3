create database business;

use business;
create table import_order(
import_order_id int not null auto_increment primary key,
import_date date not null
);

create table export_order(
export_order_id int not null auto_increment primary key,
export_date date not null
);

create table product(
product_id int not null auto_increment primary key,
product_name varchar(40) not null
);

create table order_info(
order_id int not null auto_increment primary key,
order_date date not null,
supplier_id int,
foreign key(supplier_id) references supplier(supplier_id)
);


create table export_order_detail(
export_id int,
product_id int,
primary key (export_id, product_id),
foreign key(export_id) references export_order(export_order_id),
foreign key(product_id) references product(product_id),
price int default null check(price >0),
quantity int not null
);

create table import_order_detail(
import_order_id int,
product_id int,
primary key (import_order_id, product_id),
foreign key(import_order_id) references import_order(import_order_id),
foreign key(product_id) references product(product_id),
price int default null check (price>0),
quantity int not null
);

create table supplier(
supplier_id int not null auto_increment primary key,
supplier_name varchar(40) not null,
supplier_address varchar(255)
);

create table phone_number_info(
phone_number bigint not null primary key,
supplier_id int,
foreign key (supplier_id) references supplier(supplier_id)
);

create table order_detail(
product_id int,
order_id int,
primary key (product_id,order_id),
foreign key (product_id) references product(product_id),
foreign key (order_id) references order_info(order_id)
);


