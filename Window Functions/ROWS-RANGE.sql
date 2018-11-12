--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- ROWS vs, RANGE Framing ------------------
--------------------------------------------

USE BasicDemos;
GO

SELECT	*,
		SUM(Quantity)
			OVER (	PARTITION BY Item 
					ORDER BY Price 
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RowsSumQty,
		SUM(Quantity)
			OVER (	PARTITION BY Item 
					ORDER BY Price 
					RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RangeSumQty
FROM	OrderItems
ORDER BY Item, Price

-- What is the expected output of this query?
SELECT	SUM(Quantity) 
		OVER (	PARTITION BY Item
				ORDER BY Price	)
FROM	OrderItems;
-- Always specify frame EXPLICITLY!!!

-- Getting Immediate Neighbour Rows
SELECT	*,
		MAX(Item) 
			OVER	(	PARTITION BY O.Customer
						ORDER BY O.OrderID, OI.Item
						ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING
					) AS PreviousItem ,
		MAX(Item) 
			OVER	(	PARTITION BY O.Customer
						ORDER BY O.OrderID, OI.Item
						ROWS BETWEEN 1 FOLLOWING AND 1 FOLLOWING
					) AS NextItem,
		AVG(1.0 * OI.Quantity)
			OVER	(	PARTITION BY O.Customer
						ORDER BY O.OrderID, OI.Item
						ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
					) AS AverageQuantityForCurrentPreviousAndNextItemsPerOrder
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
		ON O.OrderID = OI.OrderID
ORDER BY O.Customer, O.OrderID, OI.Item

-- Frame using Intervals (Maybe in PostgreSQL 11 - It is still in Beta...)
SELECT	*,
		SUM(OI.Quantity) 
			OVER	(	PARTITION BY Item
						ORDER BY O.OrderDate
						RANGE BETWEEN '1 DAY' PRECEDING AND '1 DAY' PRECEDING
					) AS ItemSalesOnPreviousDay
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
		ON O.OrderID = OI.OrderID
ORDER BY	OI.Item, 
			O.OrderDate;

-- Current alternative
SELECT	*,
		(	SELECT	SUM(OI2.Quantity)
			FROM	OrderItems AS OI2
					INNER JOIN
					Orders AS O2
					ON O2.OrderID = OI2.OrderID
			WHERE	OI2.Item = OI.Item
					AND
					CAST(O2.OrderDate AS DATE) = DATEADD(DAY, -1, O.OrderDate)
		) AS ItemSalesOnPreviousDay 
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
		ON O.OrderID = OI.OrderID
ORDER BY	OI.Item, 
			O.OrderDate;
/*
-- FILTER clause in PostgreSQL
SELECT	*,
		MAX(Quantity)
			OVER (PARTITION BY OrderID) AS MaxQuantityForOrder,		
		MAX(Quantity)
			FILTER (WHERE Quantity < (SELECT MAX(Quantity) FROM OrderItems)) -- Remove highest 'outlier'
			OVER (PARTITION BY OrderID) AS AdjustedMaxQuantityForOrder
FROM	OrderItems;
*/

-- Alternative using CASE
SELECT	*,
		MAX(Quantity)
			OVER (PARTITION BY OrderID) AS MaxQuantityForOrder,		
		MAX(CASE WHEN Quantity < (SELECT MAX(Quantity) FROM OrderItems) THEN Quantity ELSE NULL END)
			OVER (PARTITION BY OrderID) AS AdjustedMaxQuantityForOrder
FROM	OrderItems;

