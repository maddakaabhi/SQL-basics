--creating function
create function fn_scalar()
returns varchar(200)
as
begin
return 'welcome to new world'
end

select dbo.fn_scalar()

--alter fuction
alter function fn_scalar()
returns varchar(200)
as
begin
return 'Hello world'
end

select dbo.fn_scalar() 

--deleting function
drop function dbo.fn_scalar

--multiple parameters
create function addition(@x int,@y int)
returns int
as
begin
return @x+@y
end

select dbo.addition(5,5) result

--one more function
create function checkvoteage(@age int)
returns varchar(200)
as
begin
declare @str varchar(200)
if @age>18
begin
set @str='You are eligible to vote'
end
else
begin
set @str='you are not eligible to vote'
end
return @str
end

select dbo.checkvoteage(20);

select dbo.checkvoteage(17);

--inline table valued function (we dont use begin and end blocks)

create function fn_getpersons()
returns table
as
return (select * from persons)

select * from dbo.fn_getpersons()


create function fn_getpersons1(@salary money)
returns table
as
return (
select * from persons where salary>@salary)

select * from dbo.fn_getpersons1(40000)

--multi table valued function
alter function fn_getpersonbyage(@age int)
returns @table table( name varchar(200),address varchar(200),city varchar(200),salary money)
as
begin
insert into @table
select firstname,address,city,salary from persons where age>@age
return
end

select * from dbo.fn_getpersonbyage(23)
select * from persons
