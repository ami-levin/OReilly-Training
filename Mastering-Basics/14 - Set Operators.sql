-- O'reilly Online Training
-- Mastering Relational SQL Querying
-- Set Operators
--------------------------------------

-----------------------------------
-- CLASS EXAMPLES -----------------
-----------------------------------

-- Join / subquery alternative - show items that were never ordered
SELECT Item FROM Items
EXCEPT 
SELECT Item FROM OrderItems;

-- Show items that were ordered on both Order #1 and Order #2
SELECT Item FROM OrderItems WHERE OrderID = 1
INTERSECT
SELECT Item FROM OrderItems WHERE OrderID = 2;

-- Show items ordered by both USA and Canadian customers
SELECT	OD.Item
FROM	OrderItems AS OD
		INNER JOIN
		Orders AS O
		ON OD.OrderID = O.OrderID 
		INNER JOIN 
		Customers AS C 
		ON C.Customer = O.Customer
WHERE	C.Country = 'USA'
INTERSECT
SELECT	OD.Item
FROM	OrderItems AS OD
		INNER JOIN
		Orders AS O
		ON OD.OrderID = O.OrderID 
		INNER JOIN 
		Customers AS C 
		ON C.Customer = O.Customer
WHERE	C.Country = 'Canada';

-- Composing set operators 
-- Show Items that were ordered, and those that were never ordered, and tell them apart
SELECT	DISTINCT Item, 'Yes' AS Ordered 
FROM	OrderItems
UNION ALL
(
SELECT	Item, 'No' AS Ordered 
FROM	Items
EXCEPT
SELECT Item, 'No' FROM OrderItems
);

-----------------------------------
-- EXERCISES ----------------------
-----------------------------------

-- Exercise 1:	Write a query that shows customers that made no orders using set operators

-- Exercise 2:	Write a query that shows items that were bought by either canadian customers, 
--				or by any customer with a quantity of 2 or more

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
-- Exercise 1:	Write a query that shows customers that made no orders using set operators

SELECT	Customer 
FROM Customers
EXCEPT
SELECT Customer
FROM Orders;

-- Exercise 2:	Write a query that shows items that were bought by either canadian customers, 
--				or by any customer with a quantity of 2 or more total for that item in all their orders

SELECT	OI.Item
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
		ON O.OrderID = OI.OrderID
		INNER JOIN
		Customers AS C
		ON C.Customer = O.Customer
WHERE	C.Country = 'Canada'
UNION
SELECT	OI.Item
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
		ON O.OrderID = OI.OrderID
GROUP BY OI.Item, O.Customer
HAVING SUM(OI.Quantity) > 1
