
DROP TABLE IF EXISTS dbo.TestTable;

CREATE TABLE dbo.TestTable(
	ColumnA VARCHAR(100) 
  , ColumnB INT
  , ColumnC DATETIME
  , ColumnD VARCHAR(10)
);


/* Inserting Data */

INSERT INTO dbo.TestTable
(ColumnA, ColumnB, ColumnC, ColumnD)
VALUES
('Test Value', 10, GETDATE(), 'Test Val'),
('Test Value 2', 7, DATEADD(DAY, -1, GETDATE()), 'Test Val 2');


SELECT * 
  FROM TestTable;

INSERT INTO TestTable
SELECT FirstName, BusinessEntityID, GETDATE(), PhoneNumberType
  FROM HumanResources.vEmployee;


SELECT * 
  FROM TestTable;


/* Updating Data */

UPDATE TestTable
   SET ColumnB = 1234
 WHERE ColumnA = 'Test Value';


