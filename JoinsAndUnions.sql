Insert into [SQL Tutorial].dbo.EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly','Flax', NULL, 'Male'),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

Insert into [SQL Tutorial].dbo.EmployeeSalary VALUES
(1010, NULL, 47000),
(NULL, 'Salesman', 43000)

Create Table [SQL Tutorial].dbo.WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

Insert into [SQL Tutorial].dbo.WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics;

SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary;

-- Inner Join -- only shows what is similar between the two tables.
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

--Full outer join -- Shows everything from both tables regardless if it has a match or not
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
full Outer Join [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Left outer join -- shows entire first table and with some data of the second table
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
LEFT OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Right outer join -- shows entire second table and with some data of the first table
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
RIGHT OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Here we have a coloumn in two tables so we must specify which one by including the table_name.column_name
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Here we use the EmployeeSalary ID
SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
RIGHT OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Here we use the employee demographics ID
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
RIGHT OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Here we use the employee demographics ID as well
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
LEFT OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- Here we use the employee salary ID as well
SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
LEFT OUTER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- HERE we join two tables with everything that they have in common, remove michael from the table then order the whole table by salary from highest to lowest.
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM [SQL Tutorial].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC;

-- Here we join both tables to everything that they have in common, then we filter it out to show only the salemans position, then we show the average salary of that position
SELECT JobTitle, AVG(Salary)
FROM [SQL Tutorial].dbo.EmployeeDemographics
INNER JOIN [SQL Tutorial].dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle;

-- Joins vs Unions
-- Joins -> use a common column in both tables to join them
-- Unions -> combines both tables regardless

-- Here we are showing all the data from both tables again, they both have the same column names but essentially is the data continues on a second table.
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
full Outer Join [SQL Tutorial].dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID;

-- So we use Union to combine both tables to into one. Union also takes out duplicate statements similar to 'Distinct'
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
UNION
SELECT *
FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics;

-- If you want to show the duplicate information, just add 'ALL' next to UNION. (ORDER BY EmployeeID is optional here, I was trying to emphasize the duplicates)
SELECT *
FROM [SQL Tutorial].dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM [SQL Tutorial].dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID;

-- This still works because it has the same datatypes for each column, but the data is obviously wrong. age and salary are not the same. So before you use UNION, make sure that the data and the datatype is the same.
SELECT EmployeeID, FirstName, Age
FROM [SQL Tutorial].dbo.EmployeeDemographics
UNION
SELECT EmployeeID, JobTitle, Salary
FROM [SQL Tutorial].dbo.EmployeeSalary
ORDER BY EmployeeID;