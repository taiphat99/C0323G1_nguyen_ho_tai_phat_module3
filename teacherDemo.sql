SELECT * FROM teacher_management.teacher;

insert into teacher(name,age,email,gender)
values("Jenny",18,"jenny@gmail.com",0);

update teacher 
set name = "Kellie", gender = false, email = "kellie@gmail.com"
where id = 3;

select name,id,age,email from teacher 
where gender = 1;

