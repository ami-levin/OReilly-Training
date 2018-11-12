--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Logical Processing Order ----------------
--------------------------------------------

USE BasicDemos;
GO

-- What is the expected result of this query?
SELECT	*
FROM	OrderItems
WHERE	Item <> 'Pen' 
		AND 
		MAX(Price) 
			OVER (PARTITION BY OrderID) > 2;

-- Better:
WITH OrdersWithMaxPriceOver2
AS
(
	SELECT	OrderID, MAX(Price) AS MaxOrderPrice
	FROM	OrderItems
	GROUP BY OrderID
	HAVING MAX(Price) > 2 
)
SELECT	OI.*, 
		OWM.MaxOrderPrice
FROM	OrderItems AS OI
		INNER JOIN
		OrdersWithMaxPriceOver2 AS OWM
		ON OWM.OrderID = OI.OrderID
WHERE	Item <> 'Pen';

-- What is the expected result of this query?
SELECT	OrderID,
		SUM(Quantity * Price) AS OrderTotal,
		100.00 * SUM(Quantity * Price) / SUM(Quantity * Price) OVER () AS PercentOfGrandTotal
FROM	OrderItems
GROUP BY OrderID;

-- Alternative 1
SELECT	OrderID,
		SUM(Quantity * Price) AS OrderTotal,
		SUM(Quantity * Price) / SUM(SUM(Quantity * Price)) OVER () AS PercentOfGrandTotal
FROM	OrderItems
GROUP BY OrderID;

-- Alternative 2
SELECT	OrderID,
		SUM(Quantity * Price) AS OrderTotal,
		SUM(Quantity * Price) / X.GrandTotal AS PercentOfGrandTotal
FROM	OrderItems
		CROSS APPLY
		(SELECT SUM(Quantity * Price) FROM OrderItems) AS X(GrandTotal) -- What if we add OVER() ?
GROUP BY OrderID, X.GrandTotal;

-- What is the expected result of this query?
SELECT	Item,
		MAX(Price) 
			OVER (PARTITION BY Item, OrderID) 
FROM	OrderItems
GROUP BY Item;

-- Better:
SELECT	Item,
		OrderID, 
		MAX(MAX(Price)) 
			OVER (PARTITION BY Item, OrderID) AS MaxPricePerOrderPerItem
FROM	OrderItems
GROUP BY	Item, 
			OrderID;
