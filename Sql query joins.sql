select * from customer_order

insert into customer_order(productname,personid) values('atta',2),
                                                       ('dhall',1),
													   ('spices',5)
Insert into customer_order(productname,personid) values('vegetables',2),
													   ('nuts',1)

--joins
--Inner join ( it results matching records into two tables)

select Persons.firstname,Persons.City,customer_order.productname
from Persons
inner join customer_order on customer_order.personid=Persons.id


--LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table

select Persons.firstname,Persons.City,Customer_order.productname
from customer_order
left join Persons on Persons.id=customer_order.personid

--Right (OUTER) JOIN Returns all records from right table, and the matched records from the left table
select Persons.firstname,Persons.City,Customer_order.productname
from customer_order
right join Persons on customer_order.personid=persons.id


--full join Returns all records from two tables

select Persons.firstname,Persons.City,Customer_order.productname
from Persons
full outer join customer_order on Persons.id=customer_order.personid

----Joins practice
select * from Persons

insert into persons (id,address,city,salary,age) values (10,'hosur','chennai',10000,27),(7,'peta','mumbai',90000,29)

select * from persons1

sp_rename 'persons1.id', 'Person1_id', 'COLUMN'  --renaming a column name

alter table persons1
add p_id int 

alter table persons1
add constraint fk_id foreign key(p_id) references persons(id)

update persons1 set p_id=3 where person1_id=2

update persons1 set p_id=1 where person1_id=4
update persons1 set p_id=5 where person1_id=6
update persons1 set p_id=2 where person1_id=7
update persons1 set p_id=2 where person1_id=1

select p.id, p.address,p.city,p1.name from Persons p
inner join persons1 p1 on p.id=p1.p_id

select p.id, p.address,p.city,p1.name from Persons p
left join persons1 p1 on p.id=p1.p_id

select p.id, p.address,p.city,p1.name from Persons p
right join persons1 p1 on p.id=p1.p_id

select p.id,p.firstname, p.address,p.city,p1.name from Persons p
full outer join persons1 p1 on p.id=p1.p_id

insert into persons1(person1_id,name) values (7,'lokesh'),(3,'reddy')


--self join
select* from persons1
select e1.Person1_id,e1.name,e1.p_id from Persons1 e1,persons1 e2 
where e1.person1_id=e2.person1_id and e1.name='ramesh'

select * from Persons1 e1,persons1 e2 
where e1.person1_id=e2.person1_id and e1.name='ramesh' and e2.name='ramesh'


create table newtable( new_id int, name varchar(200))
drop table newtable

alter table newtable 
add constraint fk1_id foreign key(new_id) references Persons(id)

select * from persons
 
insert into newtable values(3,'atta'),(5,'mango')

alter table newtable
drop constraint fk1_id






