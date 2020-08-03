# Linh Nguyen
## Homework TSQL 04

1.In your own words, what is a subquery?

	Query within a query, can appear in the Select clause using Aggregate function
	and in the Where clause.

2.In your own words, what is a self contained subquery?

	A self contained subquery are queries that are independent of the outer query. 
	A stand alone query can be execute by itself without any input from outside.

3.In your own words, what is a correlated subquery?

	A correlated subquery are queries that are dependent on the outer query

4.Give an example of a subquery that returns a single value. When would you use this kind of subquery?

	A scalar subquery, if you want to see the highest buying customer.

5.Give an example of a subquery that returns multiple values. When would you use this kind of subquery?

	SELECT custid, orderid, orderdate, empid
	
	FROM Sales.Orders
	
	WHERE custid IN
	
	(SELECT C.custid
	
	FROM Sales.Customers AS C
	
	WHERE C.country = N'USA');
	
	Use this query for listing.

6.Give an example of a subquery that returns table values. When would you use this kind of subquery?

	Return more than 1 column. Select * from orders. Use this subquery for collecting all information from orders.

7.What does the exists predicate do? Give an example.

	Use to check existence of specifics rows inside tables. Where country = N'Spain' AND EXISTS. It either
	exists or not exists, either true or false.

8.What happens if we use the not operator before a predicate? Give an example.

	It would return data that is FALSE. Where country = N'Spain' AND NOT EXISTS. Return customers 
	NOT from Spain.

9.When you use exists or not exists with respect to a row in a database, does it return two or three
values? Explain your answer.

	2-valued logic. Since it can only return TRUE or FALSE queries.

10.How would you use a subquery to calculate aggregates? For example, you want to calculate yearly
sales of a product, and you also want to keep a running sum of total sales. Explain how you would use
a subquery to do this.

	SELECT orderyear, qty,
	
	(SELECT SUM(O2.qty)
	
	FROM Sales.OrderTotalsByYear AS O2
	
	WHERE O2.orderyear <= O1.orderyear) AS runqty
	
	FROM Sales.OrderTotalsByYear AS O1
	
	ORDER BY orderyear;
