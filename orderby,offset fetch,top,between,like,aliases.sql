--sql server select
select * from Persons 
--order by
select * from Persons order by firstname
select * from Persons order by firstname desc

select * from Persons order by city,firstname   --sorting on multiple columns

select * from Persons order by City,firstname desc  --sorting on multiple columns and different orders

--Sort a result set by a column that is not in the select list
select firstname 
from Persons
order by age 

--Sort a result set by an expression
select firstname from Persons order by len(firstname),firstname

--Sort by ordinal positions of columns
select firstname,city from Persons order by 1,2

--offset used to skip the no of rows before starting
create table Products(
productname varchar(200),
price money)

insert into Products values('Hero',2000),('splender',4000),('honda',3000),('Bajaj',5000),('bmw',6000),('tvs',1000),('scooty',3000),('electricbike',10000),('ktm',29900)

select * from Products

select * from Products order by productname offset 5 rows  --here we are skipping 5 rows from starting
 
--here we are skipping 10 rows and getting next 4 rows only
select * from products order by productname offset 10 rows fetch next 4 rows only

select * from products order by productname offset 0 rows fetch next 10 rows only

--Top,percent and ties
select top 10* from Products

select top 10 * from products order by productname

select top 10 percent * from products 

select top 5 productname from products

select top 5 with ties * from products order by productname


--distinct
select city from Persons

select distinct city from Persons   --returns different cities in the table

select * from Persons1
insert into persons1 (id,name) values(1,'ramesh'),(2,'mahesh'),(4,'siraj'),(6,'rahul')
insert into persons1 (id,name) values(4,'ramesh'),(2,'siraj')

--where clause
select * from persons where id=2

select * from persons where id>2

select * from persons where salary between 20000 and 70000   --both limits are inclusive
select * from persons where salary not between 20000 and 70000   --both limits are inclusive

select * from persons where firstname like 'r%'   --firstname starts with letter 'r'

select * from persons where id in(1,2,5)

select c.id,c.name from persons1 c    --giving another name to table and utilising that name for columns

select id as personid,name as personname from persons1   --giving another names to the columns





