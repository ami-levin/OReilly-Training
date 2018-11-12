-- O'reilly Online Training
-- Mastering Relational SQL Querying
-- ORDER BY
--------------------------------------

-----------------------------------
-- CLASS EXAMPLES -----------------
-----------------------------------

-- Simple ordering
SELECT	*
FROM	OrderItems
ORDER BY Quantity DESC

-- Order by non selected column
SELECT	distinct Item, Price --distinct - another mortal sin
FROM	OrderItems 
ORDER BY Quantity DESC;

-- Order by expression
SELECT	*
FROM	OrderItems
ORDER BY (Price * Quantity) DESC;

-- Use SELECT list alias for ORDER BY
SELECT	*, Price * Quantity AS ItemTotal 
FROM	OrderItems 
ORDER BY ItemTotal DESC;

-- Multiple expressions order
SELECT	OrderID, SUM(Price * Quantity) AS OrderTotal, SUM(Quantity) AS TotalQuantity
FROM	OrderItems
GROUP BY OrderID
ORDER BY OrderTotal DESC, TotalQuantity DESC;

-- Paging
-- SQL Server syntax
SELECT * 
FROM Orders AS O
ORDER BY OrderDate
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY; 

-- SQLite syntax
--SELECT	* 
--FROM	Orders AS O
--ORDER BY OrderDate
--LIMIT 3 OFFSET 0; 

-----------------------------------
-- EXERCISES ----------------------
-----------------------------------

-- Exercise 1: Write a query that returns customers, ordered by their total number of orders

-- Exercise 2: Write a query that returns all items, ordered by the date they were last ordered

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

-- Exercise 1: Write a query that returns customers, ordered by their total number of orders

SELECT	Customer, COUNT(*) AS NumOrders
FROM	Orders 
GROUP BY Customer
ORDER BY NumOrders;


-- Exercise 2: Write a query that returns all items, ordered by the date they were last ordered

SELECT	OI.Item, MAX(O.OrderDate) AS LastOrdered
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
		ON OI.OrderID = O.OrderID
GROUP BY OI.Item
ORDER BY LastOrdered;


