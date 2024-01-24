create database if not exists mystore;
use mystore;
create table users (
  id int auto_increment primary key,
  name varchar(120) not null,
  email varchar(120) not null,
  address varchar(120),
  department varchar(120),
  password varchar(120) not null
);

insert into users(name, email, address, department, password)
values ('Test User', 'test@testdomain.com', 'Kathmandu,Nepal', 'IT', 'test@123');