SELECT TOP 100 *
  FROM Sales.SalesOrderHeader;

/* 187487.825 MAX(TotalDue) */

SELECT MAX(TotalDue)
  FROM Sales.SalesOrderHeader;

SELECT TotalDue
  FROM Sales.SalesOrderHeader
ORDER BY TotalDue DESC;

/* 1.5183 MIN(TotalDue) */

SELECT MIN(TotalDue)
  FROM Sales.SalesOrderHeader;


SELECT TotalDue
  FROM Sales.SalesOrderHeader
ORDER BY TotalDue ASC;

/* Number of Rows - 31465 */

SELECT COUNT(*)
  FROM Sales.SalesOrderHeader;


/* FirstName IS NOT NULL */

SELECT COUNT(FirstName)
  FROM Person.Person;

SELECT COUNT(*) 
  FROM Person.Person
 WHERE FirstName IS NOT NULL;

 /* Unique FirstName */

SELECT COUNT(DISTINCT FirstName)
  FROM Person.Person;


SELECT AVG(TotalDue)
  FROM Sales.SalesOrderHeader;

SELECT SUM(TotalDue)
  FROM Sales.SalesOrderHeader;


SELECT *
  FROM Sales.SalesOrderHeader
 WHERE OrderDate BETWEEN '1/1/2011' AND '12/31/2011';
 
SELECT SUM(TotalDue)
  FROM Sales.SalesOrderHeader
 WHERE OrderDate BETWEEN '1/1/2011' AND '12/31/2011';


SELECT *
  FROM Sales.SalesOrderHeader
 WHERE SalesOrderID = 45038;


/* Order in which SQL evaluates the clauses */

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY

