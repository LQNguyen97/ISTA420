# Linh Nguyen
## Homework TSQL 07

1.What is a window function?

	A function that, for each *row*, computes a scalar result value based on a calculation
	against a subset of the rows from the underlying query. 
	The need to perform a calculation against a set and return a single value.
	
2.What does PARTITION do?

	Restricts the window to the subset of rows that have the same values in the partitioning (divide it into subset) 
	columns as in the current row

3.What does ORDER BY do?

	Define ordering, window ordering gives meaning to the rank. (Sorting)

4.What does ROWS BETWEEN do?

	Filters a frame, or a subset, of rows from the window partition between the two specified delimiters.

5.What is a ranking window function? Why would you use it? Give an example.

	You use ranking window functions to rank each row with respect to others in the window
	When you want to fetch specific rows and skip others. (An ordering from top to bottom)

6.What is an offset window function? Why would you use it? Give an example.

	(The offset window functions allow you to *shift* data from other rows based on their distance 
	away from the current row.) 
	We might want to return all of the purchases made today but in the same row return the value of the 
	previous purchase that the customer made.


7.What do LEAD and LAG DO

	To obtain an element from a row that is at a certain offset from the current row 
	within the partition, based on the indicated ordering.
	The LAG function looks before the current row, and the LEAD function looks ahead.
	
8.What do FIRST VALUE and LAST VALUE do?

	You use the FIRST_VALUE (of the PARTITION) and LAST_VALUE (of the PARTITION) functions to return an element from the first and last 
	rows in the window frame, respectively

9.What is an aggragate window function? Why would you use it? Give an example.

	You use aggregate window functions to aggregate the rows in the defined window.
	(Window functions operate on a set of rows and return a single value for each row from the
	underlying query.)
	uses the MAX() window function with the PARTITION BY clause to identify the employee with the maximum
	number of car sales in Q1 at each dealership.

10.What is a pivot table and what does it do?

	Rotates a table-valued expression. It turns the unique values in one column into multiple columns in 
	the output and performs aggregations on any remaining column values.

11.In mathematical theory, what is a power set? How does this definition of power set relate to grouping
sets?

	A Power Set is a set of all the subsets of a set.
	You can use it to define multiple grouping sets in the same query. (Grouping Sets)

12.What is a bit array? How can you implement a bit array to represent a set of flags? How does the
GROUPING ID() function implement a bit array?

	Is an array data structure that compactly stores bits (A list of 1 and 0). It can be used to
	implement a simple set data structure.
	You provide the function with all elements that participate in any grouping set as inputs

13.Read the documentation on the UNIX/Linux chmod command. How would interpret this command:
chmod 755 myscript.sql?

	You allow everyone to read and execute the file, the owner is allowed to write to the file as well.
	So, there should be no permission to everyone else other than the owner to write to the file