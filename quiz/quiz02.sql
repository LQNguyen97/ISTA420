.echo on
.headers on

--Name : Linh Nguyen
--File: quiz02.sql
--Date:July 09, 2020

--1. How many seafood products do we have?
select count(categoryid) as products from products where categoryid = 8;

--2. What are the names and IDs of our seafood products?
select productid, productname from products where categoryid = 8;

--3. What is the average price of our seafood products?
select AVG(unitprice) from products where categoryid = 8;

--4. What is our highest priced seafood product, and how much does it cost?
select productid, productname, max(unitprice) from products where categoryid = 8;

--5. What is our lowest priced seafood product, and how much does it cost?
select productid, productname, min(unitprice) from products where categoryid = 8;

--6. How many customers do we have in Denmark?
select count(customerid)from customers where country in ('Denmark');

--7. What are the customer names and IDs of our Danish customers?
select customerid, companyname, country from customers where country in ('Denmark');

--8. Which customers do NOT have a fax number? This one is very tricky!
select customerid, contactname, fax from customers where fax like "";
