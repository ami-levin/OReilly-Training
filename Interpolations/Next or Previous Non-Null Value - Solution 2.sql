----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
----------------------------------------
-- Next / Previous Non-Null Value --
-- Solution 2 Using COUNT ----------
------------------------------------

USE [tempdb];
GO

-- DROP TABLE IF EXISTS [Example2]; -- SQL 2016
-- GO

CREATE TABLE [Example2]
(
	[ID]	INT IDENTITY NOT NULL PRIMARY KEY,
	[Value]	INT	NULL
);

INSERT INTO  [Example2]
        ( [Value] )
VALUES  (10), (8), (NULL), (NULL), (7), (NULL), (2), (4), (NULL), (0);

SELECT	*
FROM	 [Example2];
GO

;WITH
[Value_Counts]
    AS ( 
		SELECT	* ,
				COUNT([Value]) 
					OVER	(	
								ORDER BY [ID] ASC 
								ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 
							) AS [Count_Backwards] 
        FROM	[Example2]
        )
		--SELECT * FROM Value_Counts ORDER BY ID
SELECT   * ,
        MAX([Value]) 
			OVER (PARTITION BY [Count_Backwards]) AS [Last_Non_Null_Value]
FROM	[Value_Counts]
ORDER BY ID;

-- With next non null as well

;WITH
[Value_Counts]
    AS ( 
		SELECT	* ,
				COUNT([Value]) 
					OVER	(	
								ORDER BY [ID] ASC 
								ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 
							) AS [Count_Backwards] ,
                COUNT([Value]) 
					OVER	(	
								ORDER BY [ID] DESC 
								ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 
							) AS [Count_Forward]
        FROM	[Example2]
        )
		--SELECT * FROM Value_Counts ORDER BY ID
SELECT   * ,
        MAX([Value]) 
			OVER (PARTITION BY [Count_Backwards]) AS [Last_Non_Null_Value] ,
        MAX([Value]) 
			OVER (PARTITION BY [Count_Forward])	AS [Next_Non_Null_Value]
FROM	[Value_Counts]
ORDER BY ID;