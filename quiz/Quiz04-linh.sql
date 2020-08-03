-- Name: Linh Nguyen
-- File: Quiz04-linh.sql
-- Date: July 23, 2020

--1. Write a query that returns the company name, contact name, and city of all customers who made an
--order on the last date that orders were taken. Use nested self contained, list valued subqueries in the
--WHERE clause. Your output should be as follows:
Select c.companyname, c.contactname, c.city, o.orderdate from Sales.Customers c
join Sales.Orders o
on c.custid = o.custid where o.orderdate = (select Max(o.orderdate) as topDate from Sales.Orders o)
--2. Write a query that returns the company name, contact name, and city of all customers who made an
--order in July, 2014. Use nested self contained, list valued subqueries in the WHERE clause. Your
--output should be as follows:Select c.companyname, c.contactname, c.city, o.orderdate from Sales.Customers c
join Sales.Orders o
on c.custid = o.custid 
where exists (select o.orderdate from sales.orders where o.orderdate between '2014-07-01' AND '2014-07-31');
--3. Write a query that returns the customer ID, order ID, order date, and the unit price of the highest
--priced item in the order for all orders shipped to Norway. Use a self contained, scalar valued subquery
--in the SELECT clause. Your output should be as follows:select o.custid, od.orderid, o.orderdate, max(od.unitprice) as maxunitp from Sales.OrderDetails as od
inner join sales.Orders as o on od.orderid = o.orderid
group by o.custid, od.orderid, o.orderdate, o.shipcountry
having o.shipcountry =
(select distinct shipcountry from sales.Orders where shipcountry like 'Norway')