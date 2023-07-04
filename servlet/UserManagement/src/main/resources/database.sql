create database user_management;

CREATE TABLE account (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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

INSERT INTO user
values("kellie","kellie@gmail.com","Finland");