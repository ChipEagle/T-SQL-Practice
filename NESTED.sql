
USE AdventureWorks2012;

SELECT '      T-SQL Class'
	, LTRIM('      T-SQL Class')
	, LEN(LTRIM('      T-SQL Class')) AS StringLength;


/* Substring, Upper, Replace */

SELECT Name
	 , SUBSTRING(P.Name, 3, 7) AS Step_1
	 , UPPER(SUBSTRING(P.Name, 3, 7)) AS Step_2	
	 , REPLACE(UPPER(SUBSTRING(P.Name, 3, 7)), 'E', 'x') AS Step_3
  FROM Production.Product P;

/* 
Challenge: 
Find the string that results from finding all characters to the left of and 
including the first "e" in each Firstname from Person.Person.  
Only return those results where the resulting string is not blank.
*/


-- SELECT LEFT('Sayed', CHARINDEX('e', 'Sayed', 0))

SELECT FirstName
  FROM Person.Person;

SELECT FirstName
	 , LEFT(FirstName, CHARINDEX('e', FirstName, 0)) 
  FROM Person.Person 
 WHERE LEFT(FirstName, CHARINDEX('e', FirstName, 0)) != '';

