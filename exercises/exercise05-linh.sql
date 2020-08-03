-- Name: Linh Nguyen
-- File: Exercise05-linh.sql
-- Date: August 1, 2020

Drop Table if Exists dbo.usp;

CREATE TABLE dbo.usp(
ID varchar(20),
Last_Name varchar(50), 
First_Name varchar(50),
Middle_Name varchar(50),
Order_of_Presidency varchar(50),
Date_of_Birth varchar(50),
Date_of_Death varchar(50),
Town_Or_County_of_Birth varchar(50),
State_of_Birth varchar(50),
Home_State varchar(50),
Party_Affliliation varchar(50),
Date_Took_Office varchar(50),
Date_Left_Office varchar(50),
Assassination_Attempt varchar(50),
Assassinated varchar(50),
Religous_Afflilation varchar(50),
Image_Path varchar(50)
);

BULK INSERT dbo.usp FROM 'C:\Users\nguye\quantico06\ISTA420\exercises\dbo.usp.csv'
WITH
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

ALTER TABLE dbo.usp DROP COLUMN image_path;
Delete Top(1) from dbo.usp;

Alter Table dbo.usp
Add IntColumn int Identity not null
	constraint PK_dbo Primary Key (IntColumn)

Update dbo.usp
	set Date_Left_Office = '1/20/2017', Assassination_Attempt = 'FALSE', Assassinated = 'FALSE'	where Last_Name= 'Obama';
	
insert into dbo.usp values
	(
	45, 'Trump', 'Donald', 'John', '45', '1946-06-14', 'NULL',
	'Queens', 'New York', 'New York', 'Republican', '2017-01-20', 'NULL','FALSE', 'FALSE',
	'Presbyterian'
	);

select Home_State, Party_Affliliation, count(*) as counttotal
from dbo.usp
group by Home_State, Party_Affliliation
order by Home_State

Alter table dbo.usp
Alter Column Date_Took_Office DATE;

Alter table dbo.usp
Alter Column Date_Left_Office DATE;

Alter Table dbo.usp
Alter Column Date_of_Birth DATE;

select Last_Name, First_Name, DATEDIFF(day, Date_Took_Office, Date_Left_Office) as NoOfDays from dbo.usp order by ID; 

select Last_Name, First_Name, DATEDIFF(Year, Date_of_Birth, Date_Took_Office) as Age from dbo.usp order by ID; 

select Religous_Afflilation, Party_Affliliation, count(*) as counttotal
from dbo.usp
group by Religous_Afflilation, Party_Affliliation
order by Party_Affliliation




