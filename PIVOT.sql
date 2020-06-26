DECLARE @Columns as VARCHAR(MAX)
SELECT @Columns =
COALESCE(@Columns + ', ','') + QUOTENAME(Name)
FROM
   (SELECT DISTINCT L.Name
    FROM   Production.ProductInventory P
           INNER JOIN Production.Location L
           ON L.LocationID = P.LocationID
   ) AS B
   ORDER BY B.Name

DECLARE @SQL as VARCHAR(MAX)
SET @SQL = 'SELECT ProductLine, ' + @Columns + '
FROM
(
 SELECT I.ProductID,
        P.ProductLine as ProductLine,
        L.Name as LocationName
 FROM   Production.ProductInventory I
        INNER JOIN Production.Location L
        ON L.LocationID = I.LocationID
        INNER JOIN Production.Product P
        ON I.ProductID = P.ProductID
) as PivotData
PIVOT
(
   COUNT(ProductID)
   FOR LocationName IN (' + @Columns + ')
) AS PivotResult
ORDER BY ProductLine'


PRINT (@SQL)
--EXEC(@SQL)


-- Validate

 SELECT I.ProductID,
        P.ProductLine as ProductLine,
        L.Name as LocationName
 FROM   Production.ProductInventory I
        INNER JOIN Production.Location L
        ON L.LocationID = I.LocationID
        INNER JOIN Production.Product P
        ON I.ProductID = P.ProductID
WHERE   L.Name = 'Final Assembly'
  AND   P.ProductLine IS NULL
ORDER BY ProductLine DESC;

 SELECT I.ProductID,
        P.ProductLine as ProductLine,
        L.Name as LocationName
 FROM   Production.ProductInventory I
        INNER JOIN Production.Location L
        ON L.LocationID = I.LocationID
        INNER JOIN Production.Product P
        ON I.ProductID = P.ProductID
WHERE   L.Name = 'Finished Goods Storage'
  AND   P.ProductLine = 'R'
ORDER BY ProductLine DESC;


-- Dynamic SQL

DECLARE @SQL VARCHAR(MAX);
SET @SQL = 'SELECT FirstName AS [First Name], LastName AS [Last Name] FROM Person.Person';

PRINT (@SQL)


--EXEC(@SQL);