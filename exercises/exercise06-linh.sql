-- Name: Linh Nguyen
-- File: TSQL-EX06-Linh.sql
-- Date: August 5, 2020

create database ClassicCars;

Use ClassicCars;

-- Question #1
-- Create an appropriate table schema for all data files (the text files). Include primary and 
-- foreign keys, plus any other constraints that you feel necessary.

--ProductLines Table
drop table if exists ProductLines 

create table ProductLines
(
	productLine varchar(200)
		constraint PK_ProductLines primary key,
	textDescription varchar(300),
	htmlDescription varchar(500),
	image varchar(1000)
);

BULK INSERT ProductLines 
FROM "C:\Users\nguye\quantico06\ISTA420\exercises\Exercise6_Data\ProductLines.csv"
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);


--Products
drop table if exists Products

create table Products
(
	productCode varchar(300)
		constraint PK_Products primary key,
	productName varchar(300),
	productLine varchar(300),
	productScale varchar(300),
	productVendor varchar(300),
	productDescription varchar(500),
	quantityInStock varchar(300),
	buyPrice varchar(300),
	MSRP varchar(1000)
);

BULK INSERT	 Products
FROM "C:\Users\nguye\quantico06\ISTA420\exercises\Exercise6_Data\Products.csv"
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);


--OrderDetails
drop table if exists OrderDetails 

create table OrderDetails
(
	orderNumber varchar(300),
		constraint FK_Orders
		foreign key (orderNumber)
		references Orders(orderNumber),
	productCode varchar(300),
		constraint FK_Products
		foreign key (productCode) 
		references Products(productCode),
	quantityOrdered varchar(300),
	priceEach varchar(300),
	orderLineNumber varchar(300)
);

BULK INSERT	 OrderDetails
FROM "C:\Users\nguye\quantico06\ISTA420\exercises\Exercise6_Data\OrderDetails.csv"
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

--Orders
drop table if exists Orders;

create table Orders
(
	orderNumber varchar(300)
		constraint PK_Orders primary key,
	orderDate varchar(300),
	requiredDate varchar(300),
	shippedDate varchar(300),
	status varchar(300),
	comments varchar(300),
	customerNumber varchar(300)
);

BULK INSERT	 Orders
FROM "C:\Users\nguye\quantico06\ISTA420\exercises\Exercise6_Data\Orders.csv"
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);


--Customers
drop table if exists Customers;

create table Customers
(
	customerNumber varchar(300)
		constraint PK_Customers primary key,
	customerName varchar(300),
	contactLastName varchar(300),
	contactFirstName varchar(300),
	phone varchar(300),
	addressLine1 varchar(300),
	addressLine2 varchar(300),
	city varchar(300),
	state varchar(300),
	postalCode varchar(300),
	country varchar(300),
	saleRepEmployeeNumber varchar(300),
	creditLimit varchar(300)
);

BULK INSERT	 Customers
FROM "C:\Users\nguye\quantico06\ISTA420\exercises\Exercise6_Data\Customer.csv"
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);


--Employees
drop table if exists Employees 

create table Employees
(
	employeeNumber int
		constraint PK_Employees primary key,
	lastName varchar(300),
	firstName varchar(300),
	extension varchar(300),
	email varchar(300),
	officeCode varchar(300),
	reportTo varchar(300),
	jobTitle varchar(300)
);

BULK INSERT	 Employees
FROM "C:\Users\nguye\quantico06\ISTA420\exercises\Exercise6_Data\Employees.csv"
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

--Offices
drop table if exists Offices;

create table Offices
(
	officeCode varchar(300)
		constraint PK_Offices primary key,
	city varchar(300),
	phone varchar(300),
	addressLine1 varchar(300),
	addressLine2 varchar(300),
	state varchar(300),
	country varchar(300),
	postalCode varchar(300),
	territory varchar(300)
);

BULK INSERT	 Offices
FROM "C:\Users\nguye\quantico06\ISTA420\exercises\Exercise6_Data\Offices.csv"
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

--Payments
drop table if exists Payments;

create table Payments
(
	customerNumber varchar(300),
		constraint FK_Customers
		foreign key (customerNumber) 
		references Customers(customerNumber),
	checkNumber varchar(300)
		constraint PK_Payments primary key,
	paymentDate varchar(300),
	amount varchar(300)
);

BULK INSERT	 Payments
FROM "C:\Users\nguye\quantico06\ISTA420\exercises\Exercise6_Data\Payments.csv"
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);


--(a) How many distinct products does ClassicModels sell?

	Select DISTINCT count(productLine) from Products p


--(b) Report the name and city of customers who don't have sales representatives?

	Select c.customerName, c.city, c.saleRepEmployeeNumber from Customers c
	where c.saleRepEmployeeNumber = 'NULL';

--(c) What are the names of executives with VP or Manager in their title? Use the CONCAT function
--to combine the employee's rst name and last name into a single eld for reporting.

	Select CONCAT(firstName, ' ', lastName) as Name, jobTitle from Employees e
	where jobTitle LIKE '%VP%' OR jobTitle LIKE '%Manager%';

--(d) Which orders have a value greater than $5,000?

	Select orderNumber, CONVERT(money, priceEach) * CONVERT(int, quantityOrdered) as total from OrderDetails od
	where (Select CONVERT(money, priceEach) * CONVERT(int, quantityOrdered)) > 5000 
	order by (Select CONVERT(money, priceEach) * CONVERT(int, quantityOrdered)) ASC;

--(e) Report the account representative for each customer.

	Select customerName, saleRepEmployeeNumber from Customers 

--(f) Report total payments for Atelier graphique.

	Select SUM((convert(money,amount))) from Payments
	JOIN Customers on Customers.customerNumber = Payments.customerNumber
	where customerName LIKE '%Atelier graphique%';

--(g) Report the total payments by date

	Select amount, convert(datetime, paymentDate) as dateConverted from Payments order by paymentDate ASC;

--(h) Report the products that have not been sold.

	select * from OrderDetails
	JOIN Products on Products.productCode=OrderDetails.productCode order by quantityOrdered ASC;

--(i) List the amount paid by each customer.

	Select orderNumber,  CONVERT(money, priceEach) * CONVERT(int, quantityOrdered) as TotalPrice from OrderDetails

--(j) List products sold by order date.

	select *, convert(datetime, orderdate) as dateConverted  from orders order by orderDate ASC;

--(k) List the order dates in descending order for orders for the 1940 Ford Pickup Truck.

	select *, convert(datetime, orderdate) from Orders 
	where Exists
	(Select productCode from Products where productName LIKE '%1940 Ford Pickup Truck%');

--(l) List the names of customers and their corresponding order number where a particular order from
--that customer has a value greater than $25,000?

	Select orderNumber, CONVERT(money, priceEach) * CONVERT(int, quantityOrdered) as total from OrderDetails
	where (Select CONVERT(money, priceEach) * CONVERT(int, quantityOrdered)) > 25000; 

--(m) Compute the commission for each sales representative, assuming the commission is 5% of the
--value of an order. Sort by employee last name and rst name.

	Select *, CONVERT(money, priceEach) * CONVERT(int, quantityOrdered) * 1.05 - CONVERT(money, priceEach) * CONVERT(int, quantityOrdered) as Commission
	from OrderDetails


--(n) What is the dierence in days between the most recent and oldest order date in the Orders le?

	Select datediff(day, (MIN(convert(datetime, orderdate))), (MAX(convert(datetime, orderdate)))) from orders 

--(o) Compute the average time between order date and ship date for each customer ordered by the
--largest dierence

	update Orders
 set  shippedDate = replace(shippedDate, 'NULL', '2003-01-06 00:00:00.000')
select orderNumber,
(datediff
(day, 
(ISNULL(convert(datetime, orderdate), ' ')) + convert(datetime, orderdate), 
(ISNULL(convert(datetime, shippedDate), ' ')) + convert(datetime, shippedDate)) / count(orderDate))
as diffdatebetween 
from orders 
group by shippedDate, orderDate, orderNumber
order by diffdatebetween desc