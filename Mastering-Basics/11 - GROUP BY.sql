-- O'reilly Online Training
-- Mastering Relational SQL Querying
-- GROUP BY
--------------------------------------

-----------------------------------
-- CLASS EXAMPLES -----------------
-----------------------------------

-- BEWARE!
SELECT		*
FROM		Orders
GROUP BY	Customer;

-- Aggregate functions
SELECT		Customer, COUNT(*) AS NumOrders
FROM		Orders
GROUP BY	Customer;

SELECT		OrderID, SUM(Price * Quantity) AS Total
FROM		OrderItems
GROUP BY	OrderID;

-- Aggregates with no GROUP BY
SELECT	COUNT(*) 
FROM	Items;

-- Multiple aggregates
SELECT		C.Country, 
			OI.Item, 
			SUM(OI.Quantity) AS NumItems, 
			MAX(OI.Price) AS MostExpensive
FROM		Customers AS C
			INNER JOIN
			Orders AS O
			ON O.Customer = C.Customer
			INNER JOIN 
			OrderItems AS OI
			ON OI.OrderID = O.OrderID
GROUP BY	C.Country, OI.Item
HAVING		SUM(OI.Quantity) > 1;


-- NULL
SELECT	TipSize, 
		COUNT(*) AS NumItems
FROM	Items
GROUP BY TipSize;

SELECT	OI.OrderID, 
		COUNT(*) AS NumItems, 
		COUNT(I.TipSize) AS NumberOfItemsWithATip, 
		COUNT(DISTINCT I.TipSize) AS NumberOfUniqueTipSizes
FROM	OrderItems AS OI
		RIGHT OUTER JOIN
		Items AS I
		ON I.Item = OI.Item
GROUP BY OI.OrderID



-----------------------------------
-- EXERCISES ----------------------
-----------------------------------

-- Exercise 1: Write a query that shows how many customers per country we have

-- Exercise 2: Write a query that shows how many distinct items every customer bought

-- Exercise 3: Modify the above query to exclude customers that bought more than 2 distinct items

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

-- Exercise 1: Write a query that shows how many customers per country we have

SELECT	Country, COUNT(*) AS NumCustomers
FROM	Customers
GROUP BY Country;

-- Exercise 2: Write a query that shows how many distinct items every customer bought

SELECT	O.Customer, COUNT(DISTINCT OI.Item) AS NumItems
FROM	Orders AS O
		INNER JOIN
		OrderItems AS OI
		ON O.OrderID = OI.OrderID
GROUP BY O.Customer;

-- Exercise 3: Modify the above query to exclude customers that bought more than 2 distinct items

SELECT	O.Customer, COUNT(DISTINCT OI.Item) AS NumItems
FROM	Orders AS O
		INNER JOIN
		OrderItems AS OI
		ON O.OrderID = OI.OrderID
GROUP BY O.Customer
HAVING COUNT(DISTINCT OI.Item) <= 2;
