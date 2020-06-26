
USE AdventureWorks2012;

/*  Derived Table  */

SELECT *
  FROM (
		SELECT BusinessEntityID
			 , FirstName
			 , LastName
		  FROM Person.Person
		) AS PersonName;



SELECT YEAR(OrderDate) AS OrderYear
	 , COUNT(*) AS SalesCount
  FROM Sales.SalesOrderHeader
 WHERE YEAR(OrderDate) = '2011'
 GROUP BY YEAR(OrderDate);


 SELECT OrderYear
	  , COUNT(*) AS SalesCount
   FROM (
		SELECT YEAR(OrderDate) AS OrderYear
			 , SalesOrderID
		  FROM Sales.SalesOrderHeader
		) AS SalesDetails
 WHERE OrderYear = '2011'
 GROUP BY OrderYear;


/*  Use a derived table to get BusinessEntityID and, NationalIDNumber
    from the HumanResources.Employee table
	for a range of BirthYear
*/

 SELECT *
   FROM (
		SELECT BusinessEntityID
			 , NationalIDNumber
			 , YEAR(BirthDate) AS BirthYear
			 , YEAR(HireDate) AS HireYear 
		  FROM HumanResources.Employee
		 ) AS HR_Employee
WHERE BirthYear < 1960;

 SELECT *
   FROM (
		SELECT BusinessEntityID
			 , NationalIDNumber
			 , YEAR(BirthDate) AS BirthYear
			 , YEAR(HireDate) AS HireYear 
		  FROM HumanResources.Employee
		 ) AS HR_Employee
WHERE HireYear >= 2004;


/* Nested Derived Tables */

SELECT *
  FROM (
		SELECT BusinessEntityID
			 , NationalIDNumber
			 , BirthYear
			 , YEAR(HireDate) AS HireYear
		  FROM (
				SELECT BusinessEntityID
					 , NationalIDNumber
					 , YEAR(BirthDate) AS BirthYear
					 , HireDate
				  FROM HumanResources.Employee
				) AS InnerNested
		) AS OuterNested;


SELECT *
  FROM (
		SELECT BusinessEntityID
			 , NationalIDNumber
			 , BirthYear
			 , YEAR(HireDate) AS HireYear
		  FROM (
				SELECT BusinessEntityID
					 , NationalIDNumber
					 , YEAR(BirthDate) AS BirthYear
					 , HireDate
				  FROM HumanResources.Employee
				) AS InnerNested
		 WHERE BirthYear < 1960
	      ) AS OuterNested
 WHERE HireYear > 2009;


 SELECT Sales_by_year.SalesYear
	  , Sales_by_Year.TotalRevenue
	  , COALESCE(Hires_by_year.NewHireCount, 0) AS NewHireCount
   FROM (
		SELECT SalesYear
			 , SUM(TotalDue) AS TotalRevenue
		  FROM (
				SELECT YEAR(OrderDate) AS SalesYear
					 , TotalDue
				  FROM Sales.SalesOrderHeader
				) AS SalesDetails
		GROUP BY SalesYear
		) AS Sales_by_Year
LEFT OUTER JOIN (
		SELECT HireYear
			 , COUNT(BusinessEntityID) AS NewHireCount
		  FROM (
				SELECT YEAR(HireDate) AS HireYear
					 , BusinessEntityID
				  FROM HumanResources.Employee
				  ) AS EmployeeDetails
		GROUP BY HireYear 
		) AS Hires_by_Year
ON Hires_by_Year.HireYear = Sales_by_Year.SalesYear
ORDER BY 1;






