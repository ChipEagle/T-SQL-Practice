SELECT SalesPersonID, SUM(TotalDue) AS [Total Sales]
  FROM Sales.SalesOrderHeader
GROUP BY SalesPersonID;

SELECT *
  FROM Production.ProductInventory;


SELECT 
	  ProductID
	, SUM(Quantity) AS [Total in Stock]
	, COUNT(*) AS [Total Location]
  FROM Production.ProductInventory
GROUP BY ProductID;


SELECT ST.Name AS [Territory Name]
     , P.FirstName + ' ' + P.LastName AS SalesPersonName
     , Sum(TotalDue) AS [Total Sales]
  FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.SalesPerson SP
ON SP.BusinessEntityID = SOH.SalesPersonID
INNER JOIN Person.Person P
ON P.BusinessEntityID = SP.BusinessEntityID
INNER JOIN Sales.SalesTerritory ST
ON ST.TerritoryID = SOH.TerritoryID
 WHERE OrderDate BETWEEN '1/1/2011' AND '12/31/2011'
GROUP BY ST.Name, P.FirstName + ' ' + P.LastName
ORDER BY 1, 2;

