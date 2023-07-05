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

UPDATE user SET id = 8, name = "Jackie", email = "jackie@gmail.com", country = "Viet Nam" WHERE id = 8;
