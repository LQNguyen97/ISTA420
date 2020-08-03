--Name: Linh Nguyen
--File: Exercise04-linh.sql
--Date: July 26, 2020

--1. Use a derived table to build a query that returns the number of distinct products per year that each
--customer ordered. Use internal aliasing. Use a variable to set the customer number. For example, if
--the customer ID is 1234, the query should report the number of distinct products ordered by customer
--1234 for the years 2014, 2015, and 2016.

declare @custid as int = 90;
WITH C AS


--2. Use multiple common table expressions to build a query that returns the number of distinct products
--per year that each country's customers ordered. Use external aliasing. Use a variable to set the country
--name. For example, if the country name is France, the query should report the number of distinct
--products ordered by French customers for the years 2014, 2015, and 2016.

Declare @country AS VARCHAR(20);



--3. Create a view that shows, for each year, the total dollar amount spent by customers in each country
--for all the years in the database.
GO
CREATE VIEW Sales.CountrySUM
AS with OD as
(
select o2.productid, o2.orderid, o.shipcountry, o2.qty, o2.unitprice,
year(orderdate) as orderyear, O.custid,
(select sum(O1.unitprice * O1.qty)
from sales.OrderDetails as O1
where O1.orderid = O2.orderid and o1.productid = o2.productid)
as totprice
from sales.orderdetails as O2
inner join sales.orders as O on o2.orderid = o.orderid )
SELECT  orderyear,  Od.shipcountry, sum(OD.totprice) as totspending
FROM OD
group by orderyear,  Od.shipcountry;
GO
--in each country. Your report should contain the name of the country, the product id, the product name,
--and the number of products shipped to customers in that country.
(
select od.productid, od.orderid, O.custid, p.productname, o.shipcountry
from sales.OrderDetails as od
inner join sales.Orders as O on o.orderid = od.orderid
inner join production.products as p on p.productid = od.productid
)
select count(OE.orderid) as totonum, OE.productname, Oe.shipcountry
from OE
group by oe.shipcountry, oe.productname
order by oe.shipcountry, totonum desc;