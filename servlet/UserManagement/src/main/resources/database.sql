create database user_management;

CREATE TABLE user (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(120) NOT NULL,
    country VARCHAR(120)
);

insert into user 
values(1,"danny","danny@gmail.com","US"),
(2,"louis","louis@gmail.com","UK"),
(3,"jackie","jackie@gmail.com","Germany"),
(4,"bully","bully@gmail.com","Russia"),
(5,"chunky","chunky@gmail.com","Poland");

SELECT * FROM user ORDER BY name ASC;

SELECT * FROM user WHERE id = 2;

delete from user where id = 5;

insert into user 
values(5,"chunky","chunky@gmail.com","Poland");

UPDATE user SET name = "Yasuo", email = "yasuo@gmail.com", country = "League" WHERE id = 22;

DELIMITER //
CREATE procedure order_by_name()
BEGIN
SELECT * FROM user order by name asc;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE get_all()
BEGIN
SELECT * FROM user;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE find_by_Id(search_id int)
BEGIN
SELECT * FROM user WHERE id = search_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE search_by_country(search_country varchar(120))
BEGIN
SELECT * FROM user WHERE country like search_country;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE insert_new_user(new_id int, new_name varchar(120),new_email varchar(120),new_country varchar(120))
BEGIN
INSERT INTO user values(new_id,new_name,new_email,new_country);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE delete_user(delete_id int)
BEGIN
delete from user where id = delete_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE update_user(new_id int, new_name varchar(120),new_email varchar(120),new_country varchar(120))
BEGIN
UPDATE user SET name = new_name, email = new_email, country = new_country WHERE id = new_id;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE search_by_name(search_name varchar(120))
BEGIN
SELECT * FROM user WHERE name like search_name;
END //
DELIMITER ;
