# Linh Nguyen
## Homework TSQL 2C

1. List the date/time types in T-SQL.

	 DATETIME and SMALLDATETIME,  DATE, TIME, DATETIME2, and DATETIMEOFFSET.
	 
2. How do you express a date/time literal in T-SQL?

	Literal(constant) of a date and time data type. (Where orderdate = "20200715")
	
3. What is the setting DATEFORMAT used for?

	 determines how SQL Server interprets the literals you enter when they are converted from a
 character-string type to a date and time type. Different language (EXAMPLE: US: mdy, British: dmy).

4. Write a T-SQL snippet changing the date format to German. Read the documentation on how to do
this.

	SET LANGUAGE German;
	SELECT CAST('07/15/2020' AS DATE); 

5. What is the difference between CAST(), CONVERT(), and PARSE()?

	CAST : convert specific an expression/object as DATE.
	
	CONVERT: explicitly convert the character-string literal to
			 the requested data type and, in the third argument, specify a number representing the style you used. 
			 
	PARSE: parse a value as a requested type and indicate the culture. "en-US"

6. What function returns the current date? This is very useful in a table that maintains a log of events,
such as user logins.

	SYSDATETIME, GETDATE, CURRENT_TIMESTAMP

7. How do you add one day to the current date? Add one week? Add one month? Add one year?

	DAY:SELECT DATEADD(day, 1, '20200714');
	
	WEEK:SELECT DATEADD(day, 7, '20200714');
	
	MONTH:SELECT DATEADD(month, 1, '20200714');
	
	YEAR: SELECT DATEADD(year, 1, '20200714');

8. Write a SQL snippet to return the number of years between your birth date and today’s date.

	SELECT DATEDIFF(year, '19971021', '20200714');

9. How do you check a string literal to see if it represents a valid date?

	The ISDATE function accepts a character string as input and returns 1 if it is convertible to a date and
time data type and 0 if it isn’t.

10. What does EOMONTH() do? Give an example of why this might be very useful.

	Display the last month of a given date.This function returns the last day of the month 
containing a specified date, with an optional offset. Help calculate how many day in a certain month,
and keep track of end of the month sales.

11. Payments are due exactly 30 days from the date of the last function. Write a select query that calculates
the date of the next payment. Pretend we want to update a column in a database that contains the
date of the next payment. We will do this when we write UPDATE queries.

	SELECT DATEADD(day, 30, '20200714');
	
12. Suppose your son or daughter wants to run a query every day that tells them the number of days until
their 16th birthday. Write a select query that does this.

	SELECT DATEDIFF(day, '20100714', '20260714');