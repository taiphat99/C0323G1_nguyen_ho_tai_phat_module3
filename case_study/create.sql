create database case_study_module_3;
use case_study_module_3;

create table role(
id int not null primary key,
name varchar(45)
);

create table level(
id int not null primary key,
name varchar(45)
);

create table department(
id int not null primary key,
name varchar(45)
);

create table customer_type(
id int not null primary key,
name varchar(45)
);

create table renting_type(
id int not null primary key,
name varchar(45)
);

create table service_type(
id int not null primary key,
name varchar(45)
);

create table accompanied_service(
id int not null primary key,
name varchar(45) not null,
price double not null,
unit varchar(10),
status varchar(45)
);

create table staff(
id int not null primary key,
name varchar(45),
date_of_birth date not null,
identify_id varchar(45) unique not null,
salary double not null,
phone_number varchar(45),
email varchar(45),
address varchar(100),
role_id int,
level_id int,
department_id int,
foreign key(role_id) references role(id),
foreign key(level_id) references level(id),
foreign key(department_id) references department(id)
);

create table customer(
id int not null primary key,
customer_type_id int,
foreign key (customer_type_id) references customer_type(id),
name varchar(45),
date_of_birth date not null,
gender bit(1) not null,
identify_id varchar(45) unique not null,
phone_number varchar(45) not null,
email varchar(45),
address varchar(45)
);	

create table service(
id int not null primary key,
name varchar(45),
area int,
cost double,
maximum_people_number int,
renting_type_id int,
foreign key (renting_type_id) references renting_type(id),
service_type_id int,
foreign key (service_type_id) references service_type(id),
room_standard varchar(45),
amenities varchar(45),
pool_area double,
floor_number int
);

create table contract(
id int not null primary key,
begin_date datetime not null,
end_date datetime not null,
deposit double not null,
staff_id int,
customer_id int,
service_id int,
foreign key(staff_id) references staff(id),
foreign key(customer_id) references customer(id),
foreign key(service_id) references service(id)
);

create table contract_detail(
id int not null primary key,
contract_id int,
accompanied_service_id int,
quantity int not null,
foreign key(contract_id) references contract(id),
foreign key(accompanied_service_id) references accompanied_service(id)
);






