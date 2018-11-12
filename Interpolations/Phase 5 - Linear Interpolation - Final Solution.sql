----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
----------------------------------------
-- Phase V - Final Solution --
-- Linear Interpolation ------
------------------------------

USE [Interpolation];
GO

SELECT	[Sensor],
		[Date],
		CAST(
				ISNULL ([Measurement],	[Last Non Null Measurement]
										+	( 
												( 
													( [Next Non Null Measurement] - [Last Non Null Measurement])
													/	MAX([Sequence Within Group])
														OVER	( 
																	PARTITION BY [Sensor], [Count Backwards] 
																) 
												) 
												* ([Sequence Within Group] - 1) -- Offset Group Starting Point
											)
						)
				AS DECIMAL(7,2)
			) AS [Measurement],
        CASE	WHEN [Measurement] IS NULL
				THEN N'Interpolated'
				ELSE N'Measured'
		END AS [Measurement Type]
FROM     [Measurements With Previous and Next Non Null Values Using COUNT]
ORDER BY [Sensor], [Date];
GO
