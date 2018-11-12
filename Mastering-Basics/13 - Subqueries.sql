-- O'reilly Online Training
-- Mastering Relational SQL Querying
-- Subqueries
--------------------------------------

-----------------------------------
-- CLASS EXAMPLES -----------------
-----------------------------------

-- Derived table
SELECT	*
FROM	Orders AS O
		INNER JOIN
		(
			SELECT	Customer, Country
			FROM	Customers
			WHERE	Country IN ('USA', 'Canada')
		) AS AmericanCustomers
		ON O.Customer = AmericanCustomers.Customer;
GO

-- Nested aggregates

SELECT	O.Customer, MAX(TQPO.OrderTotalItems)
FROM	(
			SELECT	OrderID, SUM(Quantity) AS OrderTotalItems
			FROM	OrderItems
			GROUP BY OrderID
		)		 AS TQPO
		INNER JOIN
		Orders AS O
		ON O.OrderID = TQPO.OrderID
GROUP BY O.Customer

-- IN

SELECT *
FROM  Orders
WHERE Customer IN (SELECT Customer FROM Customers WHERE Country = 'USA') 

-- Expression sub query

SELECT	OrderID, Item, Quantity, 
		(SELECT MAX(Quantity) FROM OrderItems)  AS HigestQuantityEverSold
FROM	OrderItems;







-- Correlated

SELECT	*
FROM	OrderItems AS OI
		INNER JOIN
		(
			SELECT	Item, SUM(Quantity) AS TotalSoldForItem
			FROM	OrderITems
			GROUP BY Item
		) AS ItemTotals
		ON OI.Item = ItemTotals.Item


SELECT 	*,
		(	
			SELECT	SUM(Quantity) AS TotalQuantityForItemEver
			FROM	OrderItems AS OI2
			WHERE	OI1.Item = OI2.Item
		) AS TotalOrderedForItem
FROM	OrderItems AS OI1


-- EXISTS
SELECT	DISTINCT country
FROM	Customers AS C
WHERE	EXISTS (	
					SELECT	*
					FROM	Orders AS O
					WHERE   O.Customer = C.Customer
				);




-- NOT EXISTS 
SELECT	Country
FROM	Customers AS C
WHERE	NOT EXISTS (	
						SELECT	NULL
						FROM	Orders AS O
						WHERE   O.Customer = C.Customer
					);

-----------------------------------
-- EXERCISES ----------------------
-----------------------------------

-- Exercise 1:	Write a query that shows items that were never ordered using EXISTS

-- Exercise 2:	Write a query that shows all items ever ordered,
--				the quantity they were ordered, 
--				and the % they consist of the total of all items ordered	 

-- Exercise 3 (Optional):	Modify the previous query to add a column for the maximum quantity this item 
--							was ever ordered, but only by the same customer who made the order

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

-- Exercise 1:	Write a query that shows items that were never ordered using EXISTS

SELECT	Item 
FROM	Items AS I
WHERE NOT EXISTS (	SELECT	NULL 
					FROM	OrderItems AS OI 
					WHERE	OI.Item = I.Item
				 );

-- Exercise 2:	Write a query that shows all items ordered for each customer,
--				the total quantity they were ordered by that customer, 
--				and the % of that item quantity out of the total quantity of all items ever ordered by all customers		 

SELECT	O.Customer, OI.Item, SUM(OI.Quantity) AS TotalSoldForItem, 
		1.0 * SUM(OI.Quantity) / (SELECT SUM(Quantity) FROM OrderItems) * 100 AS PercentOfTotalItems
		-- The 1.0 is needed to make the expression decimal instead of integer
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
		ON OI.OrderID = O.OrderID
GROUP BY O.Customer, OI.Item

-- Exercise 3:	Modify the previous query to add a column for the maximum quantity this item 
--				was ever ordered, but only by the same customer who made the order

SELECT	O1.Customer, OI1.Item, 
		SUM(OI1.Quantity) AS TotalSoldForItem, 
		1.0 * SUM(OI1.Quantity) / (SELECT SUM(Quantity) FROM OrderItems) * 100 AS PercentOfTotalItems,
		-- The 1.0 is needed to make the expression decimal instead of integer
		(	SELECT	MAX(OI2.Quantity) 
			FROM	OrderItems AS OI2
					INNER JOIN
					Orders AS O2
					ON OI2.OrderID = O2.OrderID
			WHERE	O2.Customer = O1.Customer
					AND
					OI2.Item = OI1.Item
		) AS MaxItemOrderedByCustomer
FROM	OrderItems AS OI1
		INNER JOIN
		Orders AS O1
		ON OI1.OrderID = O1.OrderID
GROUP BY O1.Customer, OI1.Item

