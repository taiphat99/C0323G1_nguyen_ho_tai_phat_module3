create database men_in_black_data;
use men_in_black_data;
    CREATE TABLE `role` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(40) UNIQUE NOT NULL
);
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role_id INT,
    name VARCHAR(50),
    dob DATE,
    identity VARCHAR(20) UNIQUE,
    address VARCHAR(250),
    phone VARCHAR(20),
    FOREIGN KEY (role_id) REFERENCES role (id)
);
CREATE TABLE `product` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(120) NOT NULL UNIQUE,
    name VARCHAR(255),
    price FLOAT,
    quantity INT,
    abv VARCHAR(5),
    img TEXT,
    description TEXT
);
​
delimiter //
create procedure insert_new_product(new_code varchar(120),new_name varchar(255), new_price float, new_quantity int,new_abv varchar(5), new_img text,new_description text)
begin
insert into product(code,name,price,quantity,abv,img,description) values(new_code,new_name,new_price,new_quantity,new_abv,new_img,new_description);
end //
delimiter ;
​
delimiter //
create procedure find_by_code(find_code varchar(120))
begin
select * from product where code = find_code;
end //
delimiter ;
​
delimiter //
create procedure get_all()
begin
select * from product;
end //
delimiter ;
​
delimiter //
create procedure delete_product(delete_code varchar(120))
begin
delete from product where code = delete_code;
end //
delimiter ;
​
delimiter //
create procedure find_by_name_or_code(find_name_or_code varchar(120))
begin
select * from product where name like find_name_or_code or code like find_name_or_code;
end //
delimiter ;
​
delimiter //
create procedure edit_product(new_code varchar(120),new_name varchar(255), new_price float, new_quantity int,new_abv varchar(5), new_img text,new_description text)
begin
update product set name = new_name, price = new_price, quantity = new_quantity, abv = new_abv,img = new_img, description = new_description where code like new_code;
end //
delimiter ;
CREATE TABLE `order` (
  id INT auto_increment PRIMARY KEY,
  product_id INT NOT NULL,
  user_id INT,
  order_date DATE,
  quantity INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (user_id) REFERENCES user (id),
  status INT
);
insert into `role`(role)
values("admin"),("customer");
insert into user (username, email, password, role_id, name, dob, identity, address, phone)
values ('admin', 'admin@gmail.com', 123, 1, 'Dam Tin', '2023-07-12', '12345689', 'da nang', '0905111111'),
('phatnht', 'phatnht@gmail.com', 123, 2, 'Phat Danny', '2021-01-12', '12345681', 'da nang', '0905111112'),
('huyl', 'huyl@gmail.com', 123, 2, 'Huy Le', '2020-07-12', '12345683', 'da nang', '0905111113');
insert into product(code,name,price,quantity,abv,img,description)
values
('P01','Danny',600000,100,'4.2%','https://firebasestorage.googleapis.com/v0/b/userimage-6d398.appspot.com/o/danny.png?alt=media&token=f7e4edd6-9d71-450b-b4ca-0e44b9800163',''),
('P02','Louis',1000000,68,'8.0%','https://firebasestorage.googleapis.com/v0/b/userimage-6d398.appspot.com/o/louis.png?alt=media&token=a18c5f5d-7079-4493-8929-b16aee6f81b4',''),
('P03','Chunky',420000,122,'4.6%','https://firebasestorage.googleapis.com/v0/b/userimage-6d398.appspot.com/o/chunky.png?alt=media&token=4c10ebcb-501e-4800-ac36-b570a051a296',''),
('P04','Bully',500000,55,'5.2%','https://firebasestorage.googleapis.com/v0/b/userimage-6d398.appspot.com/o/bully.png?alt=media&token=ca9fc3e9-eb23-4ff0-ac09-17b73a4c49d2',''),
('P05','Jackie',300000,77,'4.5%','https://firebasestorage.googleapis.com/v0/b/userimage-6d398.appspot.com/o/jackie.png?alt=media&token=3bae6c0e-003a-46e8-a846-1a9e21979c8b','');