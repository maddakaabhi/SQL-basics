create table vehicles( 
id int,name varchar(200),showroom_ln varchar(200))

insert into vehicles values(3,'honda','hsr'),(5,'hero','btm'),(6,'bajaj','hebbala'),(2,'tvs','chennai')

select * from vehicles where id=2

--creating clustered index
create clustered index in_vehicles_id
on vehicles (id asc)

drop index vehicles.in_vehicles_id

select * from vehicles

--creating non clustered index
create nonclustered index nix_vehicles_name
on vehicles (name asc)

drop index vehicles.nix_vehicles_name

select * from vehicles where name='bajaj'

delete from vehicles where name='bajaj' 

select * from vehicles 

sp_helpindex vehicles

insert into vehicles(name) values ('car'),('bus')

create nonclustered index nix_vehicles_showroom_ln
on vehicles (showroom_ln)

select * from vehicles where name='honda' and showroom_ln='hsr'

--renaming index name
exec sp_rename 'vehicles.nix_vehicles_name','vehicles_vehiclename'
