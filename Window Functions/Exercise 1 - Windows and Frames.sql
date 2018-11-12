--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Exercise 1 - Windows and Frames ---------
--------------------------------------------

USE BasicDemos;
GO

-- Write a query to return daily total quantities per item
-- and Include a running sum of quantities up-to-date
-- Order by Item and date
-- Bonus Question - how would you exclude current day's sales?
-- Scroll down for solution *

-- Expected Result Set
/*
Item	OrderDate	NumberOfItemsSoldOnThisDate	NumberOfItemsSoldUpToDate
----	---------	---------------------------	-------------------------
Marker	2018-01-02	3							3
Marker	2018-01-03	1							4
Pen		2018-01-01	2							2
Pen		2018-01-03	1							3
Pen		2018-01-09	4							7
Pencil	2018-01-01	1							1
Pencil	2018-01-09	2							3
Ruler	2018-01-09	2							2
*/




















SELECT	OI.Item,
		O.OrderDate,
		SUM(OI.Quantity) AS NumberOfItemsSoldOnThisDate,
		SUM(SUM(OI.Quantity))
			OVER (	PARTITION BY OI.Item
					ORDER BY O.OrderDate ASC
					ROWS BETWEEN	UNBOUNDED PRECEDING 
									AND 
									CURRENT ROW -- 1 PRECEDING will exclude today's sales
				) AS NumberOfItemsSoldUpToDate
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
			ON O.OrderID = OI.OrderID
GROUP BY		OI.Item,
				O.OrderDate
ORDER BY	OI.Item, 
			O.OrderDate;