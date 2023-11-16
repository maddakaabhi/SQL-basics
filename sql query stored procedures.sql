--stored procedure
--using database basicdb
--creating procedure simple example
create procedure getemployee
as
begin
select * from employee
end;


--executing procedure
execute getemployee


--with single parameter

create procedure getemployeebyid
@id int
as
begin
select * from employee where id=@id
end

exec getemployeebyid 3;
exec getemployeebyid 2;
exec getemployeebyid 4;

--multiple parameters
create procedure getemployeebyidandname(
@id int,
@name varchar(200)
)
as
begin
select * from employee where id=@id and name=@name
end

exec getemployeebyidandname 1,'john';

alter procedure getemployeebyidandname
@id int,
@name varchar(200)

as
begin
select id,name from employee where id=@id and name=@name
end

exec getemployeebyidandname 1,'john'


create proc getnoofemployee1
@gender varchar(200),
@no_of_employee int output
as
begin
select @no_of_employee=count(firstname) from Persons 
end

declare @total_employee int
exec getnoofemployee1 'Bangalore',@total_employee output;
select @total_employee


create proc getnoofemployee
@gender varchar(200),
@no_of_employee int output
as
begin
select @no_of_employee=count(firstname) from Persons 
end


alter proc getnoofemployee
@city varchar(200)
as
begin
select count(firstname) no_of_employees from Persons where city=@city
end

exec getnoofemployee 'Bangalore'

--inserting data using stored procedure
create proc insertdata
@id int,@name varchar(200),@address varchar(200),@city varchar(200), @salary money,@age int
as 
begin
insert into persons values (@id,@name,@address,@city,@salary,@age)
end

exec insertdata 11,'iyer','pune','mumbai',50000,28

--deleting a row using stored procedure
create proc deletearow
@id int
as 
begin
delete from persons where id=@id
end

exec deletearow 7


select * from persons

select * from employee

select * from department

select a.name,b.dep_name from employee a inner join department b on b.dep_id=a.departmentid 
select a.name,b.dep_name from employee a,department b where b.dep_id=a.departmentid

select a.dep_name,count(a.dep_name) no_of_employees from department a,employee b where a.dep_id=b.departmentid group by dep_name

alter proc get_no_ofemployees
@dep1_id int,
@no_of_employee int output
as
begin
select @no_of_employee=count(a.departmentid) from employee a,department b where a.departmentid=@dep1_id  group by b.dep_name
end

declare @total_employees int
exec get_no_ofemployees 3,@total_employees output
select @total_employees


select sum(salary) from persons
--if and else in stored procedure

--creating procedure to know how many employees salary greater than avg salary
create proc if_else
as
 declare @no_of_employees int
begin
select @no_of_employees=sum(salary) from persons
if @no_of_employees>400000
begin
print 'sum of salary is greater than 400000'
end
else
begin
print 'sum of salary is not greater than 400000'
end
end

alter proc if_else
as
 declare @no_of_employees int
begin
select @no_of_employees=sum(salary) from persons
if @no_of_employees>300000
begin
print 'sum of salary is greater than 300000'
end
else
begin
print 'sum of salary is not greater than 300000'
end
end

exec if_else

alter proc comparingnumbers
@x int,
@y int
as
begin
if @x>@y
begin
print 'x is greater than y'
end
else
begin
print 'x is less than y'
end
end

exec comparingnumbers 10,5

--while
create proc while_loop
@x int
as
declare @counter int=1
while @counter<=@x
begin
print @counter
set @counter=@counter+1
end

exec while_loop 10


--try and catch
alter proc try_catch
@a int,
@b int,
@c int output
as
begin
begin try
set @c=@a/@b
end try
begin catch
select ERROR_NUMBER() errornumber,ERROR_LINE() errorline,ERROR_SEVERITY() severity,ERROR_PROCEDURE() procname,ERROR_STATE() errorstate,ERROR_MESSAGE() errormessage
end catch
end

declare @result int
exec try_catch 10,0,@result output
select @result

declare @result int
exec try_catch 10,5,@result output
select @result












