
USE AdventureWorks2012;

SELECT GETDATE(), CAST(GETDATE() AS DATE) AS Casted_Date;

SELECT GETDATE(), CONVERT(DATE, GETDATE()) AS Casted_Date;

SELECT TOP 100 FirstName
  FROM Person.Person;

SELECT  CAST(FirstName AS VARCHAR) 
  FROM Person.Person;

SELECT   11/4
	   , CAST(11 AS FLOAT)/CAST(4 AS FLOAT)
	   , 11.0/4.0;

SELECT    FirstName
		, CAST(FirstName AS VARCHAR(3)) 
  FROM Person.Person;

SELECT   Size 
  FROM Production.Product;

SELECT   CAST(Size AS INT) 
  FROM Production.Product;

SELECT   CAST(Size AS INT) 
  FROM   Production.Product 
 WHERE ISNUMERIC(Size) = 1;


