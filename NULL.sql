
USE AdventureWorks2012;

SELECT TOP 100
	  FirstName
	, COALESCE(MiddleName, '') AS MiddleName
	, LastName
  FROM Person.Person;


SELECT TOP 100 
       SOH.BillToAddressID
	 , SOH.ShipToAddressID
	 , NULLIF(SOH.BillToAddressID, SOH.ShipToAddressID) 
  FROM Sales.SalesOrderHeader SOH;
;



SELECT TOP 100 
       SOH.BillToAddressID
	 , SOH.ShipToAddressID
	 , COALESCE(NULLIF(SOH.BillToAddressID, SOH.ShipToAddressID), 1) 
  FROM Sales.SalesOrderHeader SOH;
;


SELECT   COALESCE(MiddleName, 'No Middle Name Listed') AS MiddleName 
  FROM   Person.Person;

SELECT    FirstName
		, MiddleName
		, LastName
		, COALESCE(FirstName + ' ' + MiddleName + ' ' + LastName,    FirstName + ' ' + LastName) AS FullName 
  FROM   Person.Person;


/* Return the first non-null value in a list: */

SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com');

SELECT COALESCE(NULL, 1, 2, 'W3Schools.com'); 



