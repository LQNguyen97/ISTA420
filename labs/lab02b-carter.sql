.echo on
.headers on

--Name : Linh Nguyen
--File: ab02b-carter.sql
--Date:July 09, 2020

--1. Who are our customers in North America?
select customerid, companyname, country from customers where country in ('USA','Mexico','Canada');

--2. What orders were placed in April, 1998?
select orderid, orderdate from orders where orderdate like "1998-04-%";

--3. What sauces do we sell?
select productid, productname from products where productname like "%sauc%";

--4. You sell some kind of dried fruit that I liked very much. What is its name?
select productid, productname from products where productname like "%dried%";

--10. ‘I need a report telling me the most common pairing of customers and employees with the greatest
--order volume (by the number of orders placed). Exclude pairings with minimal orders.
select customerid, employeeid, count(orderid) as volume from orders group by customerid, employeeid having count(orderid) > 3;

--11. I need a report listing the highest average selling product by product id. The average is determined by
--the total sales of each product id divided by the quantity of the product sold. Include only the highest
--20 products.
select productid, sum(unitprice * quantity) as total_price, sum(quantity) as total_quantity, (sum(unitprice * quantity) / sum(quantity)) as average from order_details group by productid limit 15;


