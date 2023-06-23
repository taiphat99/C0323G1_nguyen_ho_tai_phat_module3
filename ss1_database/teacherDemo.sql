-- display
select * from teacher_management.teacher;

select id,name,age,email from teacher_management.teacher
where gender = 1;

-- check safe update mode
SHOW VARIABLES LIKE 'SQL_SAFE_UPDATES';
set sql_safe_updates = 0;

-- add
insert into teacher_management.teacher(name,age,email,gender)
values("Hulk",32,"hulk@gmail.com",1);

-- update
update teacher_management.teacher 
set name = "Kellie", gender = false, email = "kellie@gmail.com"
where id = 3;


update teacher_management.teacher 
set salary = 20000000
where gender = 0;

update teacher_management.teacher 
set salary = 35000000
where age >= 30;

alter table teacher_management.teacher 
add column salary decimal(12,2);

-- delete
alter table teacher_management.teacher 
drop column email;




