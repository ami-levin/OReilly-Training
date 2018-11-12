--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Exercise 3 - Offset Functions -----------
--------------------------------------------

USE BasicDemos;
GO

-- Write a query that returns all orders with details, include their total value,
-- and also include the total of the customer's previous order based on date
-- If it's the customer's first order, show 0 for previous order
-- Scroll down for solution *

-- Expected result set
/*
OrderID	OrderDate	Customer	OrderTotal	CustomersPreviousOrder
-------	---------	--------	----------	-----------------------
1		2018-01-01	Dave		3.75		0.00
3		2018-01-03	Gerald		4.50		0.00
2		2018-01-02	John		9.00		0.00
4		2018-01-09	John		14.50		9.00
*/





















WITH OrderTotals
AS
(
SELECT	O.OrderID,
		SUM(OI.Quantity * OI.Price) AS OrderTotal
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
			ON O.OrderID = OI.OrderID
GROUP BY O.OrderID
)
SELECT	O.*,
		OT.OrderTotal,
		LAG(OT.OrderTotal, 1, 0)
			OVER	(	PARTITION BY O.Customer
						ORDER BY O.OrderDate
					) AS CustomersPreviousOrder
FROM	Orders AS O
		INNER JOIN
		OrderTotals AS OT
		ON OT.OrderID = O.OrderID;


