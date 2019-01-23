-- O'reilly Online Training
-- Mastering Relational SQL Querying
-- DML and DQL
--------------------------------------

-- Open the database created in the previous exercise 'set up the development environment'
-- Or use this script to create MyFirstTable

CREATE TABLE MyFirstTable
(
KeyColumn INT PRIMARY KEY,
AttributeColumn VARCHAR(10) NOT NULL
);

INSERT INTO MyFirstTable (KeyColumn,AttributeColumn)
VALUES (1,'A'), (2, 'C');

-- DQL
SELECT 	*
FROM 	MyFirstTable;

-- DML
INSERT INTO MyFirstTable
VALUES(3, 'C');
-- Execute the above SELECT statement again
-- Try to execute the INSERT again and read the error at the bottom pane

UPDATE 	MyFirstTable
SET 	AttributeColumn = 'CC'
WHERE 	KeyColumn = 3;
-- Execute the above SELECT statement again

DELETE 
FROM 	MyFirstTable
WHERE 	KeyColumn = 3;
-- Execute the above SELECT statement again

-- Click 'Revert Changes' or 'Write Changes' as you wish
