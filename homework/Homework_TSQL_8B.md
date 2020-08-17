# Linh Nguyen
## Homework TSQL 8B

1.The sales tax rate for a state just changed. How would you update the state sales tax table to reflect
the changes? Assume that this table has an ID column, an RATE column, and a STATE column.

	Update dbo.SalesTax
		set @Rate = LATax * 1.08
	Where State = Louisiana

2.The Revenue Division has requested that you provide a report on what the actual sales taxes would
have been for all orders in the past year, assuming the retroactivity of the new sales tax rate. How
would you calculate this?

	UPDATE OD
	SET StatteTax += 8
	From dbo.orderdetails as od
	inner join dbo.orders as o
	On od.statetax = o.statetax
	Where date > datadd(year, -1, getadd);

3.Explain how the proprietary assignment update command works.

	updates both data in a table and assigns values to variables at the same time. 

4.What is one very important purpose of the MERGE SQL statement? What is ETL (not in book)?

	Use to merge data from a source into a target, applying different actions (INSERT, UPDATE, and DELETE) based
	on conditional logic.
	ETL stand for EXTRACT, TRANSFORM AND LOAD. which is a process used to collect data from various sources,
	transform the data depending on business rules/needs and load the data into a destination database. 

5.What are the semantics of MERGE?

	1.You specify the target table name in the MERGE clause and the source table name in the USING clause.
	2.You define a merge condition by specifying a predicate in the ON clause.	

6.Write a typical INSERT OUTPUT statement.

	When you need to insert a row set into a table with an identity column, and you need to get back all identity values that
	were generated.
			INSERT INTO dbo.T1(datacol)
			OUTPUT inserted.keycol, inserted.datacol
			SELECT lastname
			FROM HR.Employees
			WHERE country = N'USA';

7.Write a typical UPDATE OUTPUT statement.

			UPDATE dbo.OrderDetails
			SET discount += 0.05
			OUTPUT
			inserted.orderid,
			inserted.productid,
			deleted.discount AS olddiscount,
			inserted.discount AS newdiscount
			WHERE productid = 51;

8.Write a typical DELETE OUTPUT statement.

			DELETE FROM dbo.Orders
			OUTPUT
			deleted.orderid,
			deleted.orderdate,
			deleted.empid,
			deleted.custid
			WHERE orderdate < '20160101';

9.Write a typical MERGE OUTPUT statement.

			MERGE INTO dbo.Customers AS TGT
			USING dbo.CustomersStage AS SRC
			ON TGT.custid = SRC.custid
			WHEN MATCHED THEN
			UPDATE SET
			TGT.companyname = SRC.companyname,
			WHEN NOT MATCHED THEN 
			INSERT (custid, companyname, phone, address)
			VALUES (SRC.custid, SRC.companyname, SRC.phone, SRC.address)
			OUTPUT $action AS theaction, inserted.custid,
			deleted.companyname AS oldcompanyname,
			inserted.companyname AS newcompanyname;

10.What is nested DML?
	
	DATA MANIPULATION LANGUAGE (DML)
	A Nested query that modify data. 

11.(Not in book) Write a query adding a new column to a table named PERSON. The new column name
is DayOfBirth and the data type is string. Use ANSI SQL syntax.

	Alter Table PERSON
	Add DayOfBirth Varchar(20) Not Null;

12.(Not in book) Write a query adding a DEFAULT constraint to the column DayOfBirth. The constraint
is that the value matches one of SUN, MON, TUE, WED, THU, FRI, or SAT.

	Alter Table PERSON
	Add DayOfBirth Varchar(20) Not Null,
	Constraint CHK_DayOfBirth CHECK (DayOfBirth like '[SUN], [MON], [TUE], [WED], [THU]. [FRI], [SAT]'); 

13.(Not in book) Write a query adding a foreign key to the column DayOfBirth. The referenced table is
named WEEK and the referenced column is ValidDay.

	Alter Table PERSON
	Add foreign key (DayOfBirth) not null
	reference Week(ValidDay);
