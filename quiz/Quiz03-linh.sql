.echo on
.headers on

--Name : Linh Nguyen
--File: Quiz03-linh.sql
--Date: July 16, 2020

--1. Write a report giving the employee id, first name, last name, and the average amount of all orders by
--that employee. Use the SQL 92 syntax. Do not use a group by clause. 
select distinct e.employeeid, e.firstname, e.lastname, avg(od.quantity * od.unitprice) as average_sale from (employees e join orders o on e.employeeid like o.employeeid) join order_details od on od.orderid like o.orderid where od.orderid = o.orderid group by e.employeeid order by average_sale desc limit 10;

--2. In some cities, we have customers, suppliers, and employees. Write a report that lists the customer’s
--contact name, the supplier’s contact name, the employee’s name, and the city in which all three are
--located. Use the SQL 92 syntax. Do not use a group by clause. 
select c.contactname, s.contactname, e.firstname, e.lastname, c.city from customers c join suppliers s on c.city = s.city join employees e on e.city = c.city;
