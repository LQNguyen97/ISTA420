.echo on
.headers on

--1. List the company name, the contact name and the country of all customers in Poland
select companyname, contactname, country from customers where country like "Poland";

--2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.
select orderid, orderdate, shipcity from orders where shipcity like "berlin";

--3. How many boxes of Filo Mix do we have in stock?
select productid, productname, unitsinstock from products where productname like "Filo Mix";

--4. List the telephone numbers of all of our shippers.
select shipperid, companyname, phone text from shippers;

--5. Who is our oldest employee? Who is our youngest employee?
--oldest :
select employeeid, lastname, firstname, min(birthdate) from employees;
--youngest:
select employeeid, lastname, firstname, max(birthdate) from employees;

--6. List the suppliers where the owner of the supplier is also the sales contact.
select supplierid, contactname, contacttitle from suppliers where contacttitle like "%Sales R%";

--7. Mailing Labels
select contacttitle || ' ' || contactname || '
' || companyname ||'
' ||address ||'
' || city || ' ' || region || ' ' || postalcode || ' ' || country || '
' || '
' from customers where contacttitle like "Sales Representative" and country like "USA";

--8. Telephone Book
select substr(contactname, 1, instr(contactname, " ")-1) || ', ' || substr(contactname, instr(contactname, " ")+1) || ' ' || substr(contactname, 1, instr(contactname, "_ ")) || '      ' || companyname || '   ' || phone from customers;