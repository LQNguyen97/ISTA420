# Linh Nguyen
## Homework TSQL 05

1.What is a table expression? Can you give a technical definition of a table expression?

	Table expressions are named query expressions that represent a valid relational table.
	You can use them in data manipulation statements similar to other tables. 
	Expression that return a table.

2.In what SQL clause are derived tables (table valued subqueries) located?

	FROM clause of an outer query

3.Why can you refer to column aliases in an outer query that you defined in an inner table valued
subquery?

	Table value query is execute first before, FROM is before SELECT.

4.What SQL key word defines a common table expression?

	WITH statements

5.When using common table expressions, can a subsequent derived table use a table alias declared in a
preceding table expression?

	Yes, because the FROM clause executed first

6.Can a main query refer to a previously defined common table expression by multiple aliases?

	Yes, it can refer to multiple instances of the same CTE in table operators

7.In SQL, is a view a durable object?

	Views and inline table-valued functions (inline TVFs) are two types of table expressions whose
	definitions are stored as permanent objects in the database, making them reusable.

8.In a view, what does WITH CHECK OPTION do? Why is this important?

	Prevent modifications that conflict with the view’s filter.

9.In a view, what does SCHEMABINDING do? Why is this important?

	Binds the schema of referenced objects and columns to the schema of the referencing object. 
	It indicates that referenced objects cannot be dropped and that referenced columns cannot
	be dropped or altered that would make the VIEW non-operative. 

10.What is a table valued function?

	Reusable table expressions that support input parameters.
	A user-defined function that returns a table data type and also it can accept parameters.

11.What does the APPLY operator do?

	It allows joining between two table expressions


12.What are the two forms of the APPLY operator? Give an example of each.

	CROSS APPLY: 
	SELECT C.custid, A.orderid, A.orderdate
	FROM Sales.Customers AS C
	CROSS APPLY
	(SELECT TOP (3) orderid, empid, orderdate, requireddate
	FROM Sales.Orders AS O
	WHERE O.custid = C.custid
	ORDER BY orderdate DESC, orderid DESC) AS A;
	
	OUTER APPLY:
	SELECT C.custid, A.orderid, A.orderdate
	FROM Sales.Customers AS C
	OUTER APPLY
	(SELECT TOP (3) orderid, empid, orderdate, requireddate
	FROM Sales.Orders AS O
	WHERE O.custid = C.custid
	ORDER BY orderdate DESC, orderid DESC) AS A;

