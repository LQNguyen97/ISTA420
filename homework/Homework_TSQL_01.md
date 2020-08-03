# Linh Nguyen
## Homework TSQL 01

1. How does the book describe the difference between imperative and declarative languages?  

	Imperative languages specify how to get it, while declarative languages specify what you want to get. 

2. List three categories of command statements in SQL. 

	Data Definition Language, Data Manipulation Language, and Data Control Language. 

3. Give an informal definition of database as used in the expression "relational database management system." Give an informal definition of database as used in the expression "Human Resources database." 

	Relational Database is database that store data using structured format and values in each table are related to one another.  Database refer to 2 things, 1st is a piece of software/ computer application. Human Resources database is a collection of database, doesn't matter how data is contain. 

4. The book states that, "(t)he goal of the relational model is to enable consistent representation of data with minimal or no redundancy and without sacrificing completeness..." Briefly state your understanding of minimal or no redundancy and completeness. Why do you think that these values are important? 

	Minimal or no redundancy mean that the data information should try to not repeat itself in order not to corrupt the data, and completeness mean that there are enough information for the data to be comprehensive. These values are important because you want to minimize the amount of information being process and making it easier to store, manage, enforce the integrity of, and query data. While completeness is important because the database need to have enough information for it to be comprehensible.  

5. What is the difference between two-valued logic, three-valued logic, and four-valued logic? How does SQL implement three-valued predicate logic? 

	Two-valued logic is either True or False. Three-valued logic can be true, false, and unknown. Four-valued logic can be True, False, missing but applicable values, and missing but inapplicable values.  SQL implements three-valued logic by supporting the NULL marker to signify the generic concept of a missing value. 

6. How does SQL enforce entity integrity? What is entity integrity? 

	To enforce entity integrity SQL let you define candidate key (candidate key is a key defined on one or more attributes) that prevents more than one occurrence of the same row. Entity integrity is a predicate based on a candidate key can uniquely identify a row. Every item in the table refer to a different item (unique/one of a kind), and cannot be duplicate.  

7. How does SQL enforce referential integrity? What is referential integrity? 

	Foreign keys are used to enforce referential integrity. Referential integrity restricts the values in the referencing relation's foreign key attributes to the values that appear in the referenced relation's candidate-key attributes.  
	Referential Integrity if you have 2 items (A and B), and B depend on A then rule state that if there are any change to A then B have to be change as well.  

8. What is relation as defined in the textbook? A one word answer to this question is sufficient. 

	Representation of a set/table.  

9. Is this table in the first normal form? Why or why not? If it is not, how would you change it? 

	The table is NOT in first normal form, as some table cells contain more than a single value.  To change this table I would change "facCreds" and separate it into different cells. 

10. Is this table in second normal form? Why or why not? If it is not, how would you change it? 

	The table is NOT in second normal form, as it need to be split into different relations/tables, and each table can only contain data about only 1 type of thing. To change this I would create Table 1 with OwnerID, ownerFirstName, ownerLastName. Then create Table 2 with petID, petName, petType. Finally create a Primary Key table with ownerID and petID. 

11. Is this table in third normal form? Why or why not? If it is not, how would you change it? 

	The table is NOT in 3NF, as there is a transitive dependency on Zipcode->State->City. To change this I would create table 1 with ID, Firstname, LastName, Street, and Zipcode. Table 2 would have City, State and Zip. 

12. List the components of a four-part object name. 

	Server name, Database Name, Schema Name, Object Name. 

13. What is the difference between declarative data integrity and procedural data integrity? 

	Declarative data integrity is Data integrity enforced as part of the model-namely, as part of the table. Procedural data integrity is Data integrity enforced with code-such as with store procedures or triggers. 

 