# Linh Nguyen
## Homework TSQL 3

1. In general, why would you even want to join two (or more) tables together? This is a good time to
think about the nature of relational algebra.

	To join 2 tables together and able to generate 1 result that can contain all information from
all the tables. To answer questions that require information from 2 tables.

2. Describe in your own words the output from an inner join.

	Returns values that have matching values in both tables. 
	
	Delete all rows that return FALSE from a row filter.

3. Describe in your own words the output from an outer join.

	It returns all matched rows between both tables specified in the JOIN operation 
in addition to all unmatched rows from the first and second tables. 
Returns all values from the right/left table, and the matched records from the left/right table

4. Describe in your own words the output from an cross join.

	Produces a result set which is the number of rows in the first table
 multiplied by the number of rows in the second table.
 
	Combine each row of the first table with each row of the second table. A cartesian join. 

5. A convenient mnemonic for remembering the various joins is “Ohio.” Why is this true?

	One type of cross join, 1 type of inner join, left outer join, right outer join, full join.

6. Give an example of a composite join.

	 a join where you need to match multiple attributes from each side.

7. What is the difference between the following two queries? The business problem is “How many orders
do we have from each customer?”

================first query===============

	SELECT C.custid, COUNT(*) AS numorders

	FROM Sales.Customers AS C

	LEFT OUTER JOIN Sales.Orders AS O

	ON C.custid = O.custid

	GROUP BY C.custid;

================second query===============

	SELECT C.custid, COUNT(O.orderid) AS numorders

	FROM Sales.Customers AS C

	LEFT OUTER JOIN Sales.Orders AS O

	ON C.custid = O.custid

	GROUP BY C.custid;

	FIRST: Customers who did not place orders, each have an outer row in the result of the
join; therefore, they show up in the output with a count of 1.

	SECOND: Ignores outer rows because they have a NULL in that column, and their numorders
show up as 0.


8. What might be one reason the following query does not return the column custID in this query?

	SELECT C.custid, C.companyname, O.orderid, O.orderdate
	
	FROM Sales.Customers AS C
	
	LEFT OUTER JOIN Sales.Orders AS O
	
	ON C.custid = O.custid
	
	WHERE O.orderdate >= ’20160101’;
	
	WHERE clause evaluates to UNKNOWN for all outer rows, and
All outer rows are eliminated by the WHERE filter.
