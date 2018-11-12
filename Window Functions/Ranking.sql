--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Ranking Functions -----------------------
--------------------------------------------

-- Ordered set functions
-- SQL Server - Aggregate ordered set function

SELECT	OrderID,
		STRING_AGG(Item, ', ') WITHIN GROUP(ORDER BY Quantity DESC) AS ConcatenatedItems
FROM	OrderItems
GROUP BY OrderID

-- PostgreSQL / Oracle Hypothetical ordered set function
/*
SELECT	OrderID,
        COUNT(*) AS NumRows,
        MAX(Quantity) AS MaximalQuantity,
        MIN(Quantity) AS MinimalQuantity,
		RANK(2) WITHIN GROUP (ORDER BY Quantity DESC) AS hypotheticalRank
FROM	OrderItems
GROUP BY OrderID;
*/

-- Window Ranking Functions

-- RANK
SELECT	*,
		RANK() 
			OVER	(	ORDER BY OrderID ) AS RK1,
		RANK() 
			OVER	(	PARTITION BY OrderID 
						ORDER BY Price DESC	) AS RK2,
		RANK() 
			OVER	(	PARTITION BY Item 
						ORDER BY Quantity ASC ) AS RK3
FROM	OrderItems
ORDER BY	OrderID, 
			Item

-- Solution with sub queries
SELECT	OI.*,
		(	SELECT	COUNT(*) + 1
			FROM	OrderItems AS OI2
			WHERE	OI2.OrderID < OI.OrderID
		) AS RK1,
		(	SELECT	COUNT(*) + 1
			FROM	OrderItems AS OI2
			WHERE	OI2.OrderID = OI.OrderID
					AND
					OI.Price < OI2.Price 
		) AS RK2,
		(	SELECT	COUNT(*) + 1
			FROM	OrderItems AS OI2
			WHERE	OI2.Item = OI.Item
					AND
					OI.Quantity > OI2.Quantity 
		) AS RK3
FROM OrderItems AS OI
ORDER BY OI.OrderID, OI.Item

-- DENSE RANK
SELECT	*,
		DENSE_RANK() OVER (ORDER BY OrderID) AS DRK1,
		DENSE_RANK() OVER (PARTITION BY OrderID ORDER BY Price DESC) AS DRK2,
		DENSE_RANK() OVER (PARTITION BY Item ORDER BY Quantity ASC) AS DRK3
FROM OrderItems
ORDER BY OrderID, Item

-- Solution with sub queries
SELECT	OI.*,
		(	SELECT	COUNT(DISTINCT OI2.OrderID) + 1
			FROM	OrderItems AS OI2
			WHERE	OI2.OrderID < OI.OrderID
		) AS DRK1,
		(	SELECT	COUNT(DISTINCT OI2.Price) + 1
			FROM	OrderItems AS OI2
			WHERE	OI2.OrderID = OI.OrderID
					AND
					OI.Price < OI2.Price 
		) AS DRK2,
		(	SELECT	COUNT(DISTINCT OI2.Quantity) + 1
			FROM	OrderItems AS OI2
			WHERE	OI2.Item = OI.Item
					AND
					OI.Quantity > OI2.Quantity 
		) AS DRK3
FROM	OrderItems AS OI
ORDER BY	OI.OrderID, 
			OI.Item

			-- ROW_NUMBER
SELECT	*,
		ROW_NUMBER() 
			OVER (	ORDER BY OrderID) AS RN1,
		ROW_NUMBER() 
			OVER (	PARTITION BY OrderID 
					ORDER BY Price DESC) AS RN2,
		ROW_NUMBER() 
			OVER (	PARTITION BY Item 
					ORDER BY Quantity ASC) AS RN3
FROM	OrderItems
ORDER BY	OrderID, 
			Item

-- Solution with sub queries
SELECT	OI.*,
		(	SELECT	COUNT(*) 
			FROM	OrderItems AS OI2
			WHERE	OI2.OrderID < OI.OrderID
					OR  -- Must have tie breaker...
					(	OI2.OrderID = OI.OrderID 
						AND 
						OI.Item >= OI2.Item
					)
		) AS RN1,
		(	SELECT	COUNT(*)
			FROM	OrderItems AS OI2
			WHERE	OI2.OrderID = OI.OrderID
					AND
					(	OI.Price < OI2.Price
						OR	-- Must have tie breaker, even though our sample data happens to be unique...
						(	OI.Price = OI2.Price
							AND
							OI.Item >= OI2.Item
						)
					) 
		) AS RN2,
		(	SELECT	COUNT(*)
			FROM	OrderItems AS OI2
			WHERE	OI2.Item = OI.Item
					AND
					(	OI.Quantity > OI2.Quantity
						OR	-- Must have tie breaker, even though our sample data happens to be unique...
						(	OI.Quantity = OI2.Quantity
							AND
							OI.OrderID >= OI2.OrderID
						)
					)

		) AS RN3
FROM	OrderItems AS OI
ORDER BY	OI.OrderID, 
			OI.Item

-- NTILE
SELECT	*,
		NTILE (3) OVER (ORDER BY OrderID) AS NT1,
		NTILE (2) OVER (PARTITION BY OrderID ORDER BY Price DESC ) AS NT2,
		NTILE (4) OVER (PARTITION BY Item ORDER BY Quantity ASC) AS NT3
FROM	OrderItems
ORDER BY OrderID, Item;

-- Solution with sub queries

-- This is your take home challenge #1
-- If you give up after 1 week of trying, 
-- send me an Email to amilevin@gmail.com with what you got so far.
-- Alternatively, go to https://www.safaribooksonline.com/library/view/microsoft-sql-server/9780735671591/ch02.html#ntile
-- for Itzik Ben-Gan's solution 
