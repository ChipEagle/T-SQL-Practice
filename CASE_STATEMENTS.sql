
USE AdventureWorks2012;

SELECT ProductID
	 , ListPrice
	 , CASE 
			WHEN ListPrice > 100 THEN 'Expensive Product'
			ELSE 'Inexpensive Product'
		END AS ProductPriceClass
  FROM Production.Product
 WHERE ListPrice != 0;

 SELECT ProductID
	 , ListPrice
	 , CASE 
			WHEN ListPrice  > 100 THEN 'Expensive Product'
			WHEN ListPrice <= 100 THEN 'Inexpensive Product'
		END AS ProductPriceClass
  FROM Production.Product
 WHERE ListPrice != 0;


 WITH CustomerAges AS
 (
	SELECT P.FirstName
		 , P.LastName
		 , FLOOR(DATEDIFF(DAY, PD.BirthDate, GETDATE())/365.25) AS Age
	  FROM Sales.vPersonDemographics PD
	INNER JOIN Person.Person P
	ON P.BusinessEntityID = PD.BusinessEntityID
), 	
CustomerAgeRanges AS
(
	SELECT *
	  , CASE 
			WHEN Age IS NULL THEN 'Unknown Age'
			WHEN Age BETWEEN 0 AND 17 THEN 'Under 18'
			WHEN Age BETWEEN 18 AND 24 THEN '18 to 24'
			WHEN Age BETWEEN 25 AND 34 THEN '25 to 34'
			WHEN Age BETWEEN 35 AND 49 THEN '35 to 49'
			WHEN Age BETWEEN 50 AND 64 THEN '50 to 64'
			ELSE 'Over 65'
		END AS AgeRange
	  FROM CustomerAges
)
SELECT 
		AgeRange
	  , COUNT(*) AS CustomerCount
  FROM CustomerAgeRanges
 GROUP BY AgeRange
 ORDER BY 1;


SELECT
	PD.BusinessEntityID
  , P.FirstName
  , P.LastName
  , PD.Gender
  , CASE 
		WHEN PD.Gender = 'M' THEN 'Male'
		WHEN PD.Gender = 'F' THEN 'Female'
		ELSE 'No Gender Specified'
	END AS GenderSpecification
  FROM Sales.vPersonDemographics PD
INNER JOIN Person.Person P
ON P.BusinessEntityID = PD.BusinessEntityID;


/* COALESCE */

SELECT 
	P.MiddleName
  , COALESCE(p.MiddleName, ' ') AS CoalesceMiddleName
  , CASE
		WHEN P.MiddleName IS NULL THEN ' '
		ELSE P.MiddleName
		END AS CasedMiddleName
  FROM Person.Person P;


