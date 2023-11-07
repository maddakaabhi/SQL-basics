--Creating another table
--create table Customer_order(
--orderId int, productname varchar(200) not null)

--drop table Customer_order


--constraints
--Not null constraint
alter table customer_order
alter column orderId int not null

--unique constraint  unique constraint makes column must contain unique values
alter table customer_order
add unique(orderId)

--Adding primary constraint
--Adding key while creating table


create table Persons1(
id int,
name varchar(200))

alter table Persons1
alter column id  int not null


alter table Persons1
add constraint pk_person primary key(id)

--deleting  named primary key
alter table Persons1
drop constraint pk_person



--adding pk by alter
alter table Persons
add primary key(id)

--adding Foreign key 
--By creating a table 

create table customer_order(
orderid int primary key identity(1,1),
productname varchar(200) not null,
personid int foreign key references Persons(id))

--adding foreign key by alter
alter table  Persons1
add foreign key(id) references persons(id)

--adding foreign key name by alter
alter table Persons1
add constraint fk_id foreign key(id) references persons(id)

--deleting named foreign key
alter table Persons1
drop CONSTRAINT fk_id

--CHECK constraint is used to limit the value range that can be placed in a column.
--while creating a table
--CREATE TABLE Persons (
--    ID int NOT NULL,
--    LastName varchar(255) NOT NULL,
--    FirstName varchar(255),
--    Age int CHECK (Age>=18)
--);



alter table Persons
add age int check(age>20)

update Persons set age=21 where id=1
update Persons set age=23 where id=2
update Persons set age=25 where id=3

select * from Persons

--adding constraint with name
alter table Persons 
add constraint ck_age check(age>20)

--removing named check constraint
alter table Persons
drop constraint ck_age

--adding default into a table

--create table person2(id int not null, city varchar(200) default 'sadness')
create table person2(id int not null, city varchar(200))
drop  table person2

alter table person2
add constraint df_city default 'sadness' for city

alter table person2
drop constraint df_city











