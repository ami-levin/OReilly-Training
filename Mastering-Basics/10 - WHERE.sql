-- O'reilly Online Training
-- Mastering Relational SQL Querying
-- WHERE
--------------------------------------

-----------------------------------
-- CLASS EXAMPLES -----------------
-----------------------------------

-- Simple Filter
SELECT	*
FROM	Customers
WHERE	Country = 'USA';

-- NULL
ALTER TABLE Items
ADD TipSize INT NULL;

UPDATE Items SET TipSize = 1 WHERE Item = 'Pencil';
UPDATE Items SET TipSize = 1 WHERE Item = 'Pen';
UPDATE Items SET TipSize = 3 WHERE Item = 'Marker';

SELECT	*
FROM	Items;

SELECT	*
FROM	Items
WHERE	TipSize = NULL;

SELECT	*
FROM	Items
WHERE	TipSize IS NULL;

-- Composite Filter
SELECT	*
FROM	Customers AS C
		INNER JOIN 
		Orders AS O
		ON O.Customer = C.Customer
WHERE	C.Country <> 'USA' 
		AND
		O.OrderDate BETWEEN '20180101' AND '20180131';
 
 -- IN

 SELECT * 
 FROM Customers
 WHERE Country IN ('USA', 'Canada');


-- Items that were never ordered
SELECT	I.Item
FROM	Items AS I
		LEFT OUTER JOIN
		OrderItems AS OI
		ON I.Item = OI.Item
WHERE	OI.OrderID IS NULL;

-----------------------------------
-- EXERCISES ----------------------
-----------------------------------
-- Execute the ALTER TABLE and INSERTs to add the TipSize column to Items

-- Exercise 1 - Write a query to show customers that have no orders
 
-- Exercise 2 - Write a query to show customers that ordered pencils
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-----------------------------------
-- EXERCISE ANSWERS ---------------
-----------------------------------
 
-- Exercise 1 - Write a query to show customers that have no orders

SELECT	C.Customer
FROM	Customers AS C
		LEFT OUTER JOIN
		Orders AS O
		ON C.Customer = O.Customer
WHERE	O.OrderID IS NULL;

-- Exercise 2 - Write a query to show customers that ordered pencils  

SELECT	DISTINCT O.Customer
FROM	Orders AS O
		INNER JOIN
		OrderItems AS OI
		ON OI.OrderID = O.OrderID
WHERE	OI.Item = 'Pencil';
