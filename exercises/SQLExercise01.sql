.echo on
.headers on

--Name: MyCar.sql
--Author: Linh Nguyen
--Date: July 03, 2020

drop table if exists mycar;

create table mycar (
  id int primary key,
  make text,
  model text,
  year int,
  color text
  );
  

insert into mycar values (1,"Toyota","Camry",2018,"Grey");
insert into mycar values (2,"Toyota","Camry",2015,"Blue");
insert into mycar values (3,"Ford","F-250",2019,"Grey");
insert into mycar values (4,"Subaru","Outback",2001,"White");
insert into mycar values (5,"Toyota","Camry",2008,"Red");


select * from mycar;
select * from mycar where make like "Toyota";
select * from mycar where year = 2015;
select model from mycar;
 
