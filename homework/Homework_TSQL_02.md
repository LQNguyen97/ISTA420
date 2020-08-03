# Linh Nguyen
## Homework TSQL 02

1. What is a local variable? 

	Variables that exist only in a method or another small section of code. Created within a set of {}.  

2.What is a statement? 

	Command that performs an action, such as calculating a value and storing the result or displaying a message to a user. Always terminated by a semicolon.  

3. What is an identifier? 

	Names that you use to identify the elements in your programs. A Name:  Namespace, method, field. 

4. What is a keyword? 

	C# language reserves indentifier, and you cannot reuse these identifiers for your own purposes 

5. What is a variable? 

	A storage location that holds a value, doesn't necessary hold a value. Is a name location in the computer memory. 

6. How do you declare a variable? How do you assign a value to a variable? Can you have a variable that does not have a value? Can you declare and initialize a variable in a single statement? 

	Declaration statement. (=) is the assignment operator, which assigns the value on its right to the variable on its left. Yes, you can assign the value later .  Yes, statement in this method declares an int variable called lhs and initializes it  

7. What does Visual Studio when you open a project (a .csproj file) without opening the solution (a .sln file)? Why might this be a problem? 

	automatically creates a new solution file for it. This situation can be confusing if you are not aware of this feature because it can result in you accidentally generating multiple solutions for the same project. 

8. How are arithmetic operators and variable types related? 

	Operator have to be usable with the type. Operator that you use have to depend on the type of variable that you have. 

9. How do you turn an integer into a string? 

	value.Text = intVar.ToString(); ToString method 

10. How do you turn a string into an integer? 

	Int32.Parse use to convert a string value to an integer. int c = Int32.Parse(b); // c = 5 (an integer) 

11. What is the difference between precedence and associativity? Give an example where this makes a difference. 

	When expression contains different operators that have the same precedence – use associativity  

12. What is the definite assignment rule? 

	You must assign a value to a variable before you can use it; otherwise, your program will not compile. 

13. How are the prefix and postfix increment and decrement operators evaluated differently? 

	Prefix : Modify the variable then evaluate it 
	Postfix: Evaluate the variable then modify it 

14. What is string interpolation? 

	Where you can evaluate a variable within the context of a write command.  $. 

15. What does the var keyword do?  

	Instruct the computer to figure out on its own what the variable type is.  