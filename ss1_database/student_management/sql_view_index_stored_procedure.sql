create database ss5; 

create table product(
id int not null primary key,
code varchar(10),
name varchar(40),
price bigint,
amount int,
description varchar(250),
status int 
);

insert into product 
values (1,'P01','Instant Noodle',5000,23,'Ngon',1),
(2,'P02','Candy',50000,13,'Ngọt',1),
(3,'P03','Aquarina',10000,55,'Sạch',1);