----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
--------------------------------------------------
-- Phase IV - Add Last and Next Non Null Values --
-- Using solution 2 with counts ------------------
--------------------------------------------------

USE [Interpolation];
GO

CREATE VIEW [Measurements With Previous and Next Non Null Values Using COUNT]
AS
WITH
	[With Previous and Next Non Null Value Counts]
		AS
		(
			SELECT   * ,
                        COUNT([Measurement]) 
						OVER(	PARTITION BY [Sensor] 
								ORDER BY [Date] ASC 
								ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
							) AS [Count Backwards] ,
                        COUNT([Measurement]) 
						OVER(	PARTITION BY [Sensor] 
								ORDER BY [Date] DESC 
								ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
							) AS [Count Forward]
               FROM     [Measurements With Sequential Date Ranges]
		)
		--SELECT * FROM [With Previous and Next Non Null Value Counts]  ORDER BY Sensor, Date
SELECT	* ,
        MAX([Measurement]) 
		OVER (PARTITION BY [Sensor], [Count Backwards]) AS [Last Non Null Measurement] ,
        MAX([Measurement]) 
		OVER (PARTITION BY [Sensor], [Count Forward]) AS [Next Non Null Measurement],
        ROW_NUMBER() 
		OVER(PARTITION BY [Sensor], [Count Backwards] 
			 ORDER BY [Date] ASC 
			) AS [Sequence Within Group]
FROM     [With Previous and Next Non Null Value Counts];
GO

SELECT	*
FROM	[Measurements With Previous and Next Non Null Values Using COUNT]
ORDER BY [Sensor], [Date];
GO
