--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Exercise 2 - Ranking Functions ----------
--------------------------------------------

USE BasicDemos;
GO

-- Write a query that ranks customers based on their total order values
-- Order so that the highest total order value shows first 
-- Scroll down for solution *

-- Expected result set
/*
Customer	TotalOrderValue	TotalOrderValueRank
--------	---------------	-------------------
John		23.50			1
Gerald		4.50			2
Dave		3.75			3
*/





















SELECT	Customer,
		SUM(OI.Quantity * OI.Price) AS TotalOrderValue,
		RANK() 
			OVER	(	ORDER BY SUM(OI.Quantity * OI.Price) DESC
					) AS TotalOrderValueRank
FROM	OrderItems AS OI
		INNER JOIN
		Orders AS O
			ON O.OrderID = OI.OrderID
GROUP BY O.Customer
ORDER BY TotalOrderValueRank