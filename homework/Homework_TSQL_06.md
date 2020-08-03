# Linh Nguyen
## Homework TSQL 06

1.What does a set operator do?

	Operators that combine rows from 2 query result sets (or multisets)

2.What are the general requirements of a set operator

	the two queries involved cannot have ORDER BY clauses
	The two input queries must produce results with the same number of columns, and corresponding
	columns must have compatible data types. 

3.What is a Venn Diagram? This is not in the book.

	A Venn diagram uses overlapping circles or other shapes to illustrate the 
	logical relationships between two or more sets of items.

4.Draw a Venn Diagram of the UNION operator. What does it do?

	The UNION operator unifies the results of two input queries. If a row appears in any of the input sets,
	it will appear in the result of the UNION operator.

5.Draw a Venn Diagram of the UNION ALL operator. What does it do?

	The UNION ALL operator unifies the two input query results without attempting to remove duplicates
	from the result.

6.Draw a Venn Diagram of the INTERSECT operator. What does it do?

	The INTERSECT operator returns only the rows that are common to the results of the two input queries. 

7.If SQL Server supported the INTERSECT ALL operator, what would it do?

	INTERSECT ALL returns the number of duplicate rows matching the lower of the
	counts in both input multisets.
	It’s as if this operator looks for matches for each occurrence of each row. 

8.Draw a Venn Diagram of the EXCEPT operator. What does it do?

	It operates on the results of two input queries and returns rows that appear in the first input but not the second.

9.If SQL Server supported the EXCEPT ALL operator, what would it do?

	EXCEPT ALL returns only occurrences of a row from the first multiset that do not have a corresponding occurrence in the second.


10.What is the precedence of the set operators?

	INTERSECT
	UNION and EXCEPT (evaluate in order od appearance)
	first INTERSECT operators are evaluated, and then operators with the same precedence are evaluated based 
	on their order of appearance.


11.The symmetric difference of two sets A and B is all elements in A that are also not in A and B, and all
elements of B that are also not in A and B. For example, if set A consisted of all integers between 1 and
100 that are divisible by 2, and set B consisted of all integers between 1 and 100 that are divisible by
3, the symmetric difference of A and B would include all integers in A and B except integers divisible
by both 2 and 3, e.g., 6, 12, 18, etc. Write a SQL query that computes the symmetric difference of two
tables A and B.

	(A union B)
	Except
	(A intersect B)