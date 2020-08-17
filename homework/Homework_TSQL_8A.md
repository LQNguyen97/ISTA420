# Linh Nguyen
## Homework TSQL 8A

1.When using INSERT, is the list of columns necessary? Why or why not?

	Optional, but by doing so, you control the value-column associations instead of relying on the order of the columns
	in the CREATE TABLE statement.

2.When using INSERT SELECT, do you use a subquery (derived table)? Under what circumstances do
you not use a subquery?

	Yes.  The INSERT SELECT statement is performed as a transaction, so if any row fails to
	enter the target table, none of the rows enters the table.
	

3.What is the operand for the INSERT EXEC statement?

	The operand is a procedure.

4.How would you use the INSERT INTO statement?

	Add INTO <target_table_name> right before the FROM clause of the SELECT query you
	want to use to produce the result set.

5.What are the parameters to the BULK INSERT statement?

	Specify the target table, the source file, and options.
	DATAFILETYPE, FIELDTERMINATOR, ROWTERMINATOR.

6.Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness?

	No, provide your own explicit values after setting the IDENTITY_INSERT
	option to ON, and those values can be ones that already exist in rows in the table. 

7.How do you create a SEQUENCE object?

	Use the CREATE SEQUENCE command.

8.How do you use a SEQUENCE object?

	SELECT NEXT VALUE

9.How do you alter a SEQUENCE object?

	ALTER SEQUENCE command (MINVAL <val>, MAXVAL <val>, RESTART WITH <val>, INCREMENT BY <val>, CYCLE | NO
	CYCLE, or CACHE <val> | NO CACHE)

10.What is the difference between DELETE and TRUNCATE?

	Unlike the DELETE (Has optional filter predicate) statement, TRUNCATE has no filter
	Delete is a row by row deletion, Truncate delete all rows at the same time.

11.What is the difference between DELETE and DROP TABLE?

	Delete statement performs conditional based deletion, whereas Drop command deletes entire records in the table.
	Delete statement removes only the rows in the table and it preserves the table structure as same, and Drop command removes 
	all the data in the table and the table structure.
	(DROP REMOVE THE TABLE, TRUNCATE REMOVE ALL THE DATA.)