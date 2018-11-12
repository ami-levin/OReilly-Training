--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Aggregate Functions ---------------------
--------------------------------------------

USE BasicDemos;
GO

-- COUNT DISTINCT, would be nice...
SELECT	*,
		COUNT(DISTINCT Item)
			OVER	(	ORDER BY O.OrderDate
						ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
					) AS NumOfDifferentItemsPurchasedToDate
FROM	Orders AS O
		INNER JOIN
		OrderItems AS OI
			ON O.OrderID = OI.OrderID
ORDER BY	O.Customer, 
			O.OrderDate;

-- Alternative
WITH OrdersWithSequencedItems
AS
(
SELECT	O.OrderID,
		O.OrderDate,
		O.Customer,
		OI.Item,
		ROW_NUMBER() 
			OVER	(
						PARTITION BY OI.Item
						ORDER BY O.OrderDate
					) AS ItemSequential
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
			ON O.OrderID = OI.OrderID
)
SELECT	OrderID,
		OrderDate,
		Customer,
		Item,
		COUNT(CASE WHEN ItemSequential = 1 THEN Item ELSE NULL END)
			OVER	(	ORDER BY OrderDate
						ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
					) AS NumOfDifferentItemsPurchasedToDate
FROM	OrdersWithSequencedItems;

