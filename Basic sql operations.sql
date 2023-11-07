create database Basicdb   --create database
use Basicdb               --using database

drop database Testdb      --deleting a database  --we cannot drop sys and information schema databases


--creating a new table
create table Persons(
id int not null,
firstname varchar(200),
address varchar(200),
city varchar(200))


--creating a One more table
CREATE TABLE TestPersons( 
firstname varchar(200), lastname varchar(200));

drop table TestPersons  --deleting a table

select * from Persons   --to display all data

select firstname from Persons  --displaying specified columns

select distinct city from Persons   --display only distinct(different) cities from City column
select city from Persons   ---display all entries in the column city

--Inserting values into the table
insert into Persons(id,firstname,address,city) values (1,'mahesh','BTM','Bangalore'),
                                                      (2,'suresh','Hsr','Bangalore'),
													  (3,'rahul','kukatpally','Hyderabad')

--Another way of adding data into table
insert into persons values(4,'ravi','oldcity','hyderabad')

--using where clause
select * from Persons where City='Bangalore'

--Orderby to sort the result in ascending order
select * from Persons order by firstname
--Orderby to sort the result in descending order
select * from Persons order by firstname desc

--using AND and OR in where clause

select * from Persons 
where city Like 'B%' and address='Hsr'

select * from Persons 
where city Like 'B%' or address='Hsr'

--updating values in the table
update Persons set id=5 where firstname='rahul'

select * from Persons

--Deleting a row from the table
delete from Persons where id=4

Insert into persons values(3,'Romeo','Mysore','Bangalore')


--SELECT TOP clause is used to specify the number of records to return

select top 2 * from Persons
select top 70 Percent * from Persons

--alter table 
--adding a column into a table
alter table Persons 
add salary money

update Persons set salary=100000 where id=1
update Persons set salary=30000 where id=2
update Persons set salary=40000 where id=3
update Persons set salary=70000 where id=5

--deleting a column
alter table Persons 
drop column salary

--updating type of a column
alter table Persons
alter column salary bigint

select * from Persons

--Aggregate functions
select max(salary) from Persons  

select min(salary) from Persons

select count(firstname) as numberofemployees from Persons where city='Bangalore'

select Avg(salary) as averagesalary from Persons

select sum(salary) from Persons

--in operator
select * from Persons 
where City in('mumbai','Bangalore')

--not in operator
select * from Persons 
where city not in ('mumbai','bangalore');

--Between operator
select * from Persons 
where salary between 30000 and 80000

select * from Persons 
where salary not between 30000 and 80000

--concatenating columns

select firstname, address+','+city+',' as Address
from Persons

