----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
--------------------------------------------------
-- Phase IV - Add Last and Next Non Null Values --
-- Using solution 1 with CASE --------------------
--------------------------------------------------

USE [Interpolation];
GO

CREATE VIEW [Measurements With Previous and Next Non Null Values Using CASE]
AS
WITH
	[With Previous and Next Non Null Value Dates]
		AS
		(
			SELECT	*,
					MAX (CASE WHEN  [Measurement] IS NOT NULL THEN  [Date] ELSE NULL END) 
					OVER (PARTITION BY  [Sensor] ORDER BY  [Date] ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
					 AS [Last Date With Measurement Value],
					MIN (CASE WHEN  [Measurement] IS NOT NULL THEN  [Date] ELSE NULL END) 
					OVER (PARTITION BY  [Sensor] ORDER BY  [Date] ASC ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
					 AS [Next Date With Measurement Value]
			FROM	[Measurements With Sequential Date Ranges] 
		)
		--SELECT * FROM [With Previous and Next Non Null Value Dates] ORDER BY Sensor, [Date]
SELECT	*,
		MAX ([Measurement]) 
		OVER (PARTITION BY  [Sensor],  [Last Date With Measurement Value]) AS [Last Value],
		MAX ([Measurement]) 
		OVER (PARTITION BY  [Sensor],  [Next Date With Measurement Value]) AS [Next Value]
FROM	[With Previous and Next Non Null Value Dates];
GO

SELECT	*
FROM	[Measurements With Previous and Next Non Null Values Using CASE]
ORDER BY [Sensor], [Date];
GO