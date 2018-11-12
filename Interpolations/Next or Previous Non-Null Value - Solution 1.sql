----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
----------------------------------------
-- Next / Previous Non-Null Value --
-- Solution 1 Using CASE -----------
------------------------------------

USE [tempdb];
GO

CREATE TABLE [Example1]
(
	[ID]	INT IDENTITY NOT NULL PRIMARY KEY,
	[Value]	INT	NULL
);

INSERT INTO  [Example1] ( [Value] )
VALUES  (10), (8), (NULL), (NULL), (7), (NULL), (2), (4), (NULL), (0);

SELECT	*
FROM	 [Example1];
GO

WITH [CTE]
AS
(
SELECT	*,
		MAX	([NotNullID]) 
		OVER	(	
					ORDER BY [ID] 
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
				)	AS [LastNotNullID]
FROM	[Example1]
		CROSS APPLY (VALUES	(
								CASE 
									WHEN [Value] IS NOT NULL 
										THEN [ID] 
									ELSE NULL
								END
							) 
					) AS [NotNullIDs] ([NotNullID])
)
SELECT	[ID],
		[Value],
		MAX([Value])
		OVER	(
					PARTITION BY  [LastNotNullID]
				) AS [LastNotNullValue]
FROM	[CTE]
ORDER BY [ID];					
GO

-- Inline NotNullID

WITH [CTE]
AS
(
SELECT	*,
		MAX	(CASE 
				WHEN [Value] IS NOT NULL THEN [ID] ELSE NULL
			END
			) 
		OVER	(	
					ORDER BY [ID] 
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
				)	AS [LastNotNullID]
FROM	 [Example1]
)
SELECT	[ID],
		[Value],
		MAX([Value])
		OVER	(
					PARTITION BY [LastNotNullID]
				) AS [LastNotNullValue]
FROM	[CTE]
ORDER BY [ID];					
GO
