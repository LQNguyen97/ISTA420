.echo on
.headers on

--Name: myfamily.sql
--Author: Linh Nguyen
--Date: July 02, 2020

drop table if exists family;

create table family (
  id int,
  name text,
  sex int,
  role text,
  age int
  );
  
  insert into family values (1,"Thanh",0,"parent",58);
  insert into family values (2,"Hoa",1,"child",28);
  insert into family values (3,"Huy",1,"child",27);
  insert into family values (4,"Duong",0,"child",25);
  insert into family values (5,"Linh",0,"child",22);
  
  
  
  select * from family;
  select * from family where sex = 1;
  select * from family where role like "parent";
  select name from family;
  select avg(age) from family;
  select sum(age) from family;
  