SELECT 'Titus', SUBSTRING('Titus', 2, 4);

USE AdventureWorks2012;

SELECT SUBSTRING(LastName, 2, 5) AS SubstringLastComma2Comma4
	 , LastName
  FROM Person.Person P;

