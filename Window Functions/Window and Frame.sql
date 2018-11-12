--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Window and Frame ------------------------
--------------------------------------------

USE BasicDemos;
GO

-- Show highest price ever
SELECT	*,
		(
           SELECT	MAX(OI2.Price) 
		   FROM		OrderItems AS OI2
		) AS HighestPriceEver
FROM	OrderItems AS OI;

SELECT	*,
		MAX(Price) 
			OVER () AS HighestPriceEver
FROM	OrderItems;

-- Show highest price for order
SELECT	*,
		(
           SELECT	MAX(OI2.Price) 
		   FROM		OrderItems AS OI2
		   WHERE	OI.OrderID = OI2.OrderID
		) AS HighestPriceForOrder
FROM	OrderItems AS OI
ORDER BY OI.OrderID;

SELECT	*,
		MAX(Price) 
			OVER (PARTITION BY OrderID) HigestPriceForOrder
FROM	OrderItems
ORDER BY OrderID;

-- Show highest price for item
SELECT *,
       (
           SELECT	MAX(OI2.Price) 
		   FROM		OrderItems AS OI2
		   WHERE	OI.Item = OI2.Item
       ) AS HighestPriceForItem
FROM	OrderItems AS OI
ORDER BY OI.Item;

SELECT	*,
		MAX(Price) 
			OVER (PARTITION BY Item) HighestPriceForItem
FROM	OrderItems
ORDER BY Item;

-- Show higest price for item for all previous orders up to and including the current one
SELECT *,
       (
           SELECT	MAX(OI2.Price) 
		   FROM		OrderItems AS OI2
		   WHERE	OI.Item = OI2.Item
					AND
					OI2.OrderID <= OI.OrderID
       ) AS HighestPriceSoFar
FROM	OrderItems AS OI
ORDER BY OI.Item, OI.OrderID;

SELECT	*,
		MAX(Price) 
			OVER(	PARTITION BY Item
					ORDER BY OrderID
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
				) AS HighestPriceSoFar
FROM	OrderItems
ORDER BY Item, OrderID

