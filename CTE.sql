
USE AdventureWorks2012;

/* Derived Table Expression   */

SELECT OrderYear
	 , COUNT(*) AS SalesCount
  FROM (
		SELECT YEAR(OrderDate) AS OrderYear
			 , SalesOrderID
		  FROM Sales.SalesOrderHeader
		  ) AS SalesDetails
  WHERE OrderYear = '2011'
  GROUP BY OrderYear;

/*  Common Table Expression (CTE) */

WITH SalesDetails AS
(
	SELECT YEAR(OrderDate) AS OrderYear
		 , SalesOrderID
	  FROM Sales.SalesOrderHeader
)
SELECT OrderYear
	 , COUNT(*) AS SalesCount
  FROM SalesDetails
 WHERE OrderYear = '2011'
GROUP BY OrderYear;

/* Derived Table Expression */

SELECT *
  FROM (
		SELECT BusinessEntityID
			 , NationalIDNumber
			 , YEAR(BirthDate) as BirthYear
			 , YEAR(HireDate) AS HiredYear
		  FROM HumanResources.Employee
		) AS HR_Emp
 WHERE	HiredYear >= 2004;

EXCEPT

/* Common Table Expression */

WITH HR_Emp AS
(
	SELECT BusinessEntityID
		 , NationalIDNumber
		 , YEAR(BirthDate) as BirthYear
		 , YEAR(HireDate) AS HiredYear
	  FROM HumanResources.Employee
)
SELECT *
  FROM HR_Emp
 WHERE HiredYear > 2004
;


/* Derived Table Expression */

SELECT
		SalesCurrentYear.SalesYear
	  , SalesCurrentYear.TotalSales AS AnnualSales
	  , SalesPriorYear.TotalSales AS PriorYearSales
  FROM (
		SELECT YEAR(OrderDate) AS SalesYear
			 , SUM(TotalDue) AS TotalSales
		  FROM Sales.SalesOrderHeader
		GROUP BY YEAR(OrderDate)
		) AS SalesCurrentYear
LEFT OUTER JOIN (
		SELECT YEAR(OrderDate) AS SalesYear
			 , SUM(TotalDue) AS TotalSales
		  FROM Sales.SalesOrderHeader
		GROUP BY YEAR(OrderDate)
		) AS SalesPriorYear
ON SalesCurrentYear.SalesYear - 1 = SalesPriorYear.SalesYear
ORDER BY 1
GO


/* Common Table Expression (CTE) */

WITH SalesByYear AS
(
	SELECT YEAR(OrderDate) AS SalesYear
		 , SUM(TotalDue) AS TotalSales
		  FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate)
)
SELECT
	SalesCurrentYear.SalesYear
  , SalesCurrentYear.TotalSales As AnnualSales
  , SalesPriorYear.TotalSales AS PriorYearSales
  FROM SalesByYear AS SalesCurrentYear
LEFT OUTER JOIN SalesByYear AS SalesPriorYear
ON SalesCurrentYear.SalesYear - 1 = SalesPriorYear.SalesYear
ORDER BY 1;


/* Nested CTEs, Referencing another CTE */

WITH S1 AS
(
	SELECT YEAR(Orderdate) AS SalesYear
		 , SalesOrderID
		 , TotalDue
	  FROM Sales.SalesOrderHeader
),
S2 AS
(
	SELECT SalesYear
		 , COUNT(SalesOrderID) AS SalesCount
		 , SUM(TotalDue) AS AnnualSales
	  FROM S1
	GROUP BY SalesYear
)
SELECT SalesYear
	 , SalesCount
	 , AnnualSales
  FROM S2
 WHERE SalesCount > 5000
 ORDER BY 1;


 /* Exercise */

 WITH Sales  AS 
(  SELECT 
		YEAR(OrderDate) AS OrderDateYear
	  , TotalDue  
	  FROM Sales.SalesOrderHeader 
) 
 
SELECT * FROM Sales;


SELECT TOP 100 *
  FROM HumanResources.Employee;



WITH Hires AS 
(	SELECT    
		YEAR(HireDate) AS HireYear
	  , BusinessEntityID  
	FROM HumanResources.Employee 
), 
HireByYear AS 
(	SELECT    
		HireYear
	  , COUNT(*) AS HireCount  
	FROM Hires  
	GROUP BY HireYear 
) 
SELECT   H1.HireYear
	   , H1.HireCount AS CurrentYearHireCount
	   , H2.HireCount AS PriorYearHireCount 
FROM HireByYear H1 
LEFT OUTER JOIN HireByYear H2 
ON H1.HireYear = H2.HireYear + 1;


WITH Products AS 
(  
	SELECT    
		YEAR(SellStartDate) AS ProductSellStartYear
	  , ProductID  
	FROM Production.Product 
) 
SELECT  
	ProductSellStartYear
  , COUNT(*) AS ProductCount 
FROM Products 
GROUP BY ProductSellStartYear;


WITH SalesMonth AS 
(  
	SELECT   MONTH(OrderDate) AS OrderMonth
  , TotalDue  
FROM Sales.SalesOrderHeader 
WHERE YEAR(OrderDate) = 2011
) 
SELECT   
	OrderMonth
  , SUM(TotalDue) AS MonthlySales 
  FROM SalesMonth 
GROUP BY OrderMonth 
ORDER BY 1;


