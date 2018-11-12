--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Offset Functions ------------------------
--------------------------------------------

-- Row offset functions

SELECT	*,
		LEAD(Price, 1) 
			OVER ( ORDER BY OrderID) AS LEAD1,
		LEAD (Quantity) 
			OVER (	PARTITION BY OrderID	
					ORDER BY Price DESC ) AS LEAD2,
		LAG (Item, 1, 'N/A') 
			OVER (	PARTITION BY OrderID 
					ORDER BY Quantity ) AS LAG1
FROM	OrderItems;



-- Frame offset functions

SELECT	*,
		FIRST_VALUE(Price) 
			OVER (	ORDER BY OrderID 
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS First1,
		LAST_VALUE (Quantity) 
			OVER (	PARTITION BY Item 
					ORDER BY Price DESC 
					ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING ) AS Last1
FROM	OrderItems;

-- SQL Alternatives

-- This is a take home exercise
-- Tip: It will require assigning row numbers, which we will cover later

-- PostgreSQL / Oracle / MySQL 8 NTH_VALUE

SELECT	*,
		NTH_VALUE(Item, 2) /*FROM FIRST - not supported in PosgreSQL, always default*/
			OVER (	PARTITION BY OrderID
					ORDER BY PRICE DESC 
					ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING 
							-- Must specify frame or else the default kicks in...
                 ) AS SecondMostExpensiveItemInOrder
FROM	OrderItems;

-- Offset ordered set functions, not supported with popular engines

SELECT	OrderID,
		LAST_VALUE(Item) 
			WITHIN GROUP(ORDER BY Price ASC) AS MostExpensiveItemInOrder,
		FIRST_VALUE(Item)
			 WITHIN GROUP(ORDER BY Price ASC) AS CheapestItemInOrder
FROM	OrderItems
GROUP BY	OrderID;

