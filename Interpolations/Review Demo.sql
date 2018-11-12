USE BasicDemos;
GO

SELECT *
FROM [dbo].[Orders];

SELECT *
FROM [dbo].[OrderItems];

-- Show each customer's order totals, with a running total to Date

/*
OrderID		OrderDate	Customer	OrderTotal	Orders Total to Date
--------------------------------------------------------------
1			2018-01-01	Dave		3.75		3.75
2			2018-01-02	John		9			9
3			2018-01-03	Gerald		4.5			4.5
4			2018-01-09	John		14.5		23.50
*/

  
;WITH [Order Totals]
AS
(
	SELECT	O.OrderID,
			SUM(OD.Quantity * OD.Price) AS OrderTotal
	FROM	Orders AS O
			INNER JOIN
			[OrderItems] AS OD
			ON OD.OrderID = O.OrderID
	GROUP BY	O.OrderID
)
, [Order Totals with Order Attributes]
AS
(
	SELECT	OT.OrderID, 
			OT.OrderTotal,
			O.OrderDate,
			O.Customer
	FROM	[Order Totals] AS OT
			INNER JOIN
			Orders AS O
			ON OT.OrderID = O.OrderID
)
SELECT	*,
		(
			SELECT	SUM(OTA1.OrderTotal) 
			FROM	[Order Totals with Order Attributes] AS OTA1
			WHERE	OTA.Customer = OTA1.Customer
					AND
					OTA1.OrderDate <= OTA.OrderDate
		)
		AS [Total to Date],
		SUM(OTA.OrderTotal)
		OVER	(	PARTITION BY OTA.Customer
					ORDER BY OTA.OrderDate ASC
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
				) AS [Total to Date 2]
FROM	[Order Totals with Order Attributes] AS OTA;

