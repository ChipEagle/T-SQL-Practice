SELECT
	ST.Name AS [Territory Name],
	SUM(SOH.TotalDue) AS [Total Sales - 2011]
  FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SOH.TerritoryID
WHERE OrderDate BETWEEN '1/1/2011' AND '12/31/2011'
GROUP BY ST.Name
HAVING SUM(SOH.TotalDue) > 1000000
ORDER BY 1;

/* Exclude all of the NULL ProductSubcategories by using INNER JOIN */

SELECT PS.Name AS [SubCategory Name]
	, COUNT(*) AS [Product Count]
  FROM Production.Product P
INNER JOIN Production.ProductSubcategory PS
ON PS.ProductSubcategoryID = P.ProductSubcategoryID
GROUP BY PS.Name
HAVING COUNT(*) >= 15 -- Filtering Groups of Data
ORDER BY 1;

SELECT COUNT(*) AS [Count ProductID]
	 , P.Color
  FROM Production.Product P
WHERE P.Color IS NOT NULL
GROUP BY P.Color
HAVING COUNT(*) >= 20
ORDER BY [Count ProductID];

SELECT P.Name AS [Product Name]
	 , SUM(SOD.OrderQty) AS	ProductOrderCount
  FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesOrderDetail SOD
ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Production.Product P
ON P.ProductID = SOD.ProductID
WHERE SOH.OrderDate BETWEEN '1/1/2011' AND '12/31/2011'
GROUP BY P.Name
HAVING SUM(SOD.OrderQty) >= 200
ORDER BY 1;

SELECT P.FirstName
	 , P.LastName
	 , COUNT(*) AS OrdersPlaced
  FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.Customer C
ON C.CustomerID = SOH.CustomerID
INNER JOIN Person.Person P
ON P.BusinessEntityID = C.PersonID
WHERE SOH.OrderDate BETWEEN	 '7/1/2010' AND	'12/31/2015'
GROUP BY P.FirstName, P.LastName
HAVING COUNT(*) >= 6
ORDER BY OrdersPlaced DESC;

