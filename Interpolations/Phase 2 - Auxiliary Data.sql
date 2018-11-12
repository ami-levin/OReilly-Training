----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
----------------------------------------
-- Phase II - Auxiliary Data --
-------------------------------  

USE [Interpolation];
GO

-- Numbers Table

CREATE TABLE [Numbers]
(
	[Number] INT NOT NULL
);

-- Populate Numbers
; WITH
  [Level0]   AS	(SELECT 1 AS [constant] UNION ALL SELECT 1),
  [Level1]   AS	(SELECT 1 AS [constant] FROM [Level0] AS [A] CROSS JOIN [Level0] AS [B]),
  [Level2]   AS	(SELECT 1 AS [constant] FROM [Level1] AS [A] CROSS JOIN [Level1] AS [B]),
  [Level3]   AS	(SELECT 1 AS [constant] FROM [Level2] AS [A] CROSS JOIN [Level2] AS [B]),
  [Level4]   AS	(SELECT 1 AS [constant] FROM [Level3] AS [A] CROSS JOIN [Level3] AS [B]),
  [Sequential Numbers] AS (SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS [Number] FROM [Level4])
INSERT INTO [Numbers] ([Number])
SELECT	[Number] 
FROM	[Sequential Numbers];
GO

ALTER TABLE [dbo].[Numbers]
ADD		CONSTRAINT [PK_Numbers] 
		PRIMARY KEY CLUSTERED ([Number]);
GO

-- Calendar Table

CREATE TABLE [Calendar]
(
	[Date]					DATE NOT NULL,
	[Year]					SMALLINT NOT NULL,
	[Month]					TINYINT NOT NULL,
	[Month Name]			NVARCHAR(10) NOT NULL,
	[Day]					TINYINT NOT NULL,
	[Day Name]				NVARCHAR(10) NOT NULL,
	[Day Of Year]			SMALLINT NOT NULL,
	[Weekday]				NVARCHAR(10) NOT NULL,
	[Year Week]				TINYINT NOT NULL--,
	--[US Federal Holiday]	NVARCHAR(50) NULL,
	--[Other Holiday]		NVARCHAR(50) NULL
);
GO

-- https://catalog.data.gov/dataset/federal-holidays/resource/28f55f36-dbff-4b9b-9092-ad8b8d679ef7

-- Populate Calendar

INSERT [Calendar] 
(
	[Date],
	[Year],
	[Month],
	[Month Name],
	[Day],
	[Day Name],
	[Day Of Year],
	[Weekday],
	[Year Week]
) 
SELECT	DATEADD(DAY, [Number]-1, '19000101'),
		YEAR(DATEADD(DAY, [Number]-1, '19000101')),
		MONTH(DATEADD(DAY, [Number]-1, '19000101')),
		DATENAME(MONTH, (DATEADD(DAY, [Number]-1, '19000101'))),
		DAY((DATEADD(DAY, [Number]-1, '19000101'))),
		DATENAME(WEEKDAY, (DATEADD(DAY, [Number]-1, '19000101'))),
		DATEPART(DAYOFYEAR, (DATEADD(DAY, [Number]-1, '19000101'))),
		DATEPART(WEEKDAY, (DATEADD(DAY, [Number]-1, '19000101'))),
		DATEPART(WEEK, (DATEADD(DAY, [Number]-1, '19000101')))
FROM	[Numbers]
WHERE	[Number] <= 65536;
GO

ALTER TABLE [dbo].[Calendar]
ADD		CONSTRAINT [PK_Calendar]
		PRIMARY KEY CLUSTERED ([Date]);
GO

-- CREATE NONCLUSTERED INDEX Calendar_Year ON Calendar (Year);
-- CREATE NONCLUSTERED INDEX Calendar_Month ON Calendar (Month);
-- CREATE NONCLUSTERED INDEX Calendar_Day ON Calendar (Day);
-- ...

SELECT	TOP (100) * 
FROM	[Calendar];
GO
