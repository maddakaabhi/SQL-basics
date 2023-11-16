--sub queries
--Non - correlated sub query
--1 st highest salary
select * from Persons where salary=(select max(salary) from Persons)
--2 nd highest salary
select * from persons where salary=(select max(salary) from persons where salary<(select max(salary) from persons))

--3 rd highest salary
select * from persons where salary=(select max(salary) from persons where salary<(select max(salary) from persons where
 salary < (select max(salary) from persons)))

 --it will be difficult to write large queries for to find nth highest or lowest

-- to ovecome this problem we use co-related queries
 -- if N=1
--if we want to find nth number use n-1
 select * from persons p1 where 3=(select count(salary) from persons p2 where p2.salary>p1.salary)

 select  * from persons

 select * from objects

 alter table objects
 add object_id int

 update objects set order_id=2 where productname='heller'
 update objects set order_id=1 where productname='cooler'
update objects set order_id=5 where productname='drier'

alter table objects
add constraint fko_id foreign key(order_id) references persons(id)

select * from persons where  exists (select * from objects where objects.order_id=persons.id)

select * from objects where productprice > any (select productprice from objects where order_id>2)

select * from objects where productprice > all (select productprice from objects where order_id=2)


--cte(commom table expressions)
with new_person As( select * from persons where age>23)
select * from new_person 

--without cte
select * from persons where age>23

--cte with insertionn

with new_object as ( select productname,count(productname) no_of_products from objects group by productname )

select * from new_object

--without cte

select productname,count(productname) count_products from objects group by productname

create table employee(
id int primary key identity (1,1), name varchar(200),gender varchar(100),departmentid int)

insert into employee (name,gender,departmentid) values ('john','male',3),
                                                       ('mike','male',2),
													   ('todd','male',1),
													   ('sara','female',4),
													   ('ben','male',3)

create table department( dep_id int,dep_name varchar(200))

insert into department values(1,'it'),(2,'payroll'),(3,'hr'),(4,'admin')

alter table department
alter column  dep_id int not null

alter table department
add primary key(dep_id)

select dep_name,count(e.name) no_of_employees from department inner join employee e on e.departmentid=department.dep_id group by dep_name

with dep_cte (id,no_of_employees) as (
select departmentid, count(departmentid) from employee group by employee.departmentid
)
select dep_name , no_of_employees from department inner join dep_cte on department.dep_id = dep_cte.id

select * from employee




