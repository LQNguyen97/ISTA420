# Linh Nguyen
## Homework TSQL 02B

1. What is a data type? Why do we have data types?  

	Defines what value the column can hold, guideline for SQL to understand what type of data is expected inside of each column, and it also identifies how SQL will interact with the stored data. Type turn 1 and 0 into a meaningful language that human can understand.  

2. What is a collation? Name four elements of a collation. 

	Collation is a property of character data that encapsulates (express) several aspects: language support, sort order, case sensitivity, accent sensitivity, and more.  Instance, database, column, and expression. 

 3. How would you strip whitespace from a string? For example, suppose you had “ Dave ” but wanted only “Dave”.  

	The RTRIM and LTRIM 

4. Suppose you wanted to make a list of every college and university that was called an Institute from the college table. Write the query. 

	Select * from college where name like "%instit%" ; 

 

5. How would you find the number of the index of the first space in a string? For example, the index of the first space in “Barack Hussein Obama” would be 7.  

Charindex 

	Select instr("Barack Obama", " "); 

6. How would you select just the first name in a list of the presidents. Each record looks like the: ”George Washington”, ”John Adams”, ”Thomas Jefferson”. First names can be an arbitrary length, from “Cal” to “Benjamin.” (e.g., Cal College, Benjamin Harrison) 

	Select substr("George Washington", 1, instr("George Washington", " ")); 

 7. What is the order of precedence for the logical operators?  

	NOT 
	AND 
	OR 

8. What is the order of precedence for the math operators?  

	1. ( ) (Parentheses) 
	2. * (Multiplication), / (Division), % (Modulo)  
	3. + (Positive), – (Negative), + (Addition), + (Concatenation), – (Subtraction)  

9. What is the difference between a simple and a searched CASE expression?;  

	simple form to compare one value or scalar expression with a list of possible values and return a value for the first match. If no value in the list is equal to the tested value, the CASE expression returns the value that appears in the ELSE clause (if one exists). If the CASE expression doesn’t have an ELSE clause, it defaults to ELSE NULL. 

10. How would you turn a list of names like this :"LASTNAME, FIRSTNAME", to a list like this:"FIRSTNAME LASTNAME"? 

	Select substr((name_lf, instr(name_lf, " ") + 1) from hw02 || " " || subtr(name_lf, 1, intr(name_lf, " ") - 2) from hw02; 

11. How would you turn a list of names like this: “FIRSTNAME LASTNAME”, to a list like this: “LASTNAME, FIRSTNAME”? 

	Select substr(contactname, intr(contactname, " ")+1) || ", " || (substr(contactname, 1, intr(contactname, " ")) from customers limit 4; 