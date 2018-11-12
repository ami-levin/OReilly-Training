----------------------------------------
-- O'Reilly Online Training ------------
-- Advanced SQL Series -----------------
-- Linear and Proximal Interpolations --
----------------------------------------
-- Phase I - Original Data --
-----------------------------
USE [master];
GO

-- DROP DATABASE /*IF EXISTS*/ [Interpolation]; -- SQL 2016
-- GO

CREATE DATABASE [Interpolation];
GO

USE [Interpolation];
GO

-- Sensors
CREATE TABLE [Sensors]
(
	[Sensor]	NVARCHAR(10) NOT NULL,
	CONSTRAINT [PK_Sensors]
	PRIMARY KEY CLUSTERED ([Sensor])
);
GO

INSERT INTO	[Sensors] 
(
	[Sensor]
)
VALUES  (N'Sensor A'),
		(N'Sensor B'),
		(N'Sensor C');
GO

-- Measurements
CREATE TABLE [Measurements]
(
	[Sensor]		NVARCHAR(10) NOT NULL,
	[Measure Date]	DATETIME2(0) NOT NULL,
	[Measurement]	DECIMAL(7,2) NOT NULL,
	CONSTRAINT [PK_Measurements]
	PRIMARY KEY CLUSTERED([Sensor], [Measure Date]),
	CONSTRAINT [FK_Measurements_Sensors]
	FOREIGN KEY ([Sensor])
	REFERENCES [Sensors]([Sensor])
);
GO

INSERT INTO [Measurements]
VALUES	(N'Sensor A', N'20160101', 10.00),
		(N'Sensor A', N'20160105', 12.00),
		(N'Sensor A', N'20160111', 14.00),
		(N'Sensor A', N'20160121', 12.00), 
		(N'Sensor A', N'20160127', 08.00),
		(N'Sensor A', N'20160127 01:30:00', 08.00), -- Duplicate Entry due to bad data type choice - DATETIME2 instead of DATE
		(N'Sensor B', N'20160110', 09.00),
		(N'Sensor B', N'20160111', 22.00),
		(N'Sensor B', N'20160123', 10.00),
 		(N'Sensor C', N'20160101', 16.00), 
		(N'Sensor C', N'20160103', 14.00), 	
		(N'Sensor C', N'20160121', 19.00);
GO

SELECT	* 
FROM	[Measurements];
GO
