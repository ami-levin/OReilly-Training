----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
-----------------------------------------------
-- Phase III - Generate Source Data Set Rows --
-----------------------------------------------

USE [Interpolation];
GO

CREATE VIEW [Measurements With Sequential Date Ranges]
AS
WITH	[Daily Measurements] -- Clean source data to make sure we don't get 2 measurements per day --
		AS ( SELECT	[Sensor],
					CAST([Measure Date] AS DATE) AS [Measure Date],
                    AVG([Measurement]) AS [Measurement]
            FROM	[Measurements]
			GROUP BY	[Sensor],
						CAST([Measure Date] AS DATE)
            )
			  --SELECT * FROM [Daily Measurements] ORDER BY [Sensor], [Measure Date] 
		 ,
		[Date Ranges Per Sensor]
		AS	(
				SELECT	[Sensor], 
						MIN([Measure Date]) AS [Min Date],
						MAX([Measure Date]) AS [Max Date]
				FROM	[Daily Measurements]
				GROUP BY [Sensor]
			)
		--	 SELECT * FROM [Date Ranges Per Sensor] ORDER BY [Sensor], [Min Date]
-- Return all sequntial date ranges for all sensors 
SELECT	[DRPS].[Sensor],
		[C].[Date],
		[DM].[Measurement]
FROM  	(
			[Calendar] AS [C]
			INNER JOIN
			[Date Ranges Per Sensor] AS [DRPS]
			ON	[C].[Date] BETWEEN [DRPS].[Min Date] AND [DRPS].[Max Date]
		)
		LEFT OUTER JOIN	
		[Daily Measurements] AS [DM]
		ON	[DM].[Sensor] = [DRPS].[Sensor]
			AND
			[DM].[Measure Date] = [C].[Date]; 
GO

SELECT	* 
FROM	[Measurements With Sequential Date Ranges]
ORDER BY	[Sensor], 
			[Date];
GO
