----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
----------------------------------------
-- Phase V - Final Solution --
-- Proximal Interpolation ----
------------------------------

USE [Interpolation];
GO

SELECT	[Sensor],
		[Date],
		ISNULL	([Measurement],	
								CASE
									WHEN DATEDIFF(DAY, [Date], [Next Date With Measurement Value]) 
										 > DATEDIFF(DAY, [Last Date With Measurement Value], [Date])
									THEN [Last Value]
									ELSE [Next Value]
								END
				) AS [Measurement],
		CASE
			WHEN [Measurement] IS NULL 
				THEN N'Interpolated'
			ELSE N'Measured'
		END AS [Measurement Type]
FROM	[Measurements With Previous and Next Non Null Values Using CASE]
ORDER BY	[Sensor],
			[Date];
GO