--------------------------------------------
-- O'reilly Online Training ----------------
-- Advanced SQL Series - Window Functions --
-- Analytic Functions ----------------------
--------------------------------------------

USE TempDB;
GO

CREATE TABLE Students 
(
	Student VARCHAR(20) NOT NULL PRIMARY KEY
);

CREATE TABLE Exams
(
	Exam	VARCHAR(20) NOT NULL PRIMARY KEY
);

CREATE TABLE ExamScores
(
	Student VARCHAR(20) NOT NULL
		REFERENCES Students(Student),
	Exam	VARCHAR(20) NOT NULL
		REFERENCES Exams(Exam),
	Score	TINYINT NOT NULL
		CHECK (Score BETWEEN 0 AND 100),
	PRIMARY KEY (Student, Exam)
);

INSERT INTO Students (Student)
VALUES ('James'), ('Cindy'), ('Sandra'), ('Donald');

INSERT INTO Exams (Exam)
VALUES ('Statistics'), ('SQL'), ('C++'), ('Geography');

-- TRUNCATE TABLE ExamScores
INSERT INTO ExamScores (Student, Exam, Score)
VALUES	('James', 'Statistics', 68), ('Cindy', 'Statistics', 77), ('Sandra', 'Statistics', 80),
		('James', 'SQL', 100), ('Cindy', 'SQL', 90), ('Sandra', 'SQL', 76), ('Donald', 'SQL', 70),
		('James', 'C++', 96), ('Cindy', 'C++', 100), ('Sandra', 'C++', 88), 
		('James', 'Geography', 100), ('Cindy', 'Geography', 85)

SELECT	* 
FROM	ExamScores
ORDER BY Exam, Score DESC;

-- Distribution Functions
SELECT	Student, 
		Exam,
		Score,
		PERCENT_RANK() 
			OVER(	PARTITION BY Exam 
					ORDER BY Score) AS PercentRank,
		CUME_DIST() 
			OVER(	PARTITION BY Exam 
					ORDER BY Score) AS CummulativeDistribution
FROM ExamScores;

-- Inverse distribution functions SQL Server
SELECT	Student, 
		Exam,
		Score,
		PERCENT_RANK() 
			OVER(	PARTITION BY Exam 
					ORDER BY Score) AS PercentRank, -- For reference
		CUME_DIST() 
			OVER(	PARTITION BY Exam 
					ORDER BY Score) AS CummulativeDistribution, -- For reference
		PERCENTILE_CONT(0.5)
			WITHIN GROUP (ORDER BY Score)
			OVER (PARTITION BY Exam) AS MedianContinous,
		PERCENTILE_DISC(0.5)
			WITHIN GROUP (ORDER BY Score)
			OVER (PARTITION BY Exam) AS MedianDiscrete
FROM ExamScores;

-- PostgreSQL Aggregate ordered set inverse distribution functions
-- * Oracle supports both as either window functions, or ordered set aggregate functions

SELECT	Exam,
		PERCENTILE_CONT(0.5)
			WITHIN GROUP (ORDER BY Score) AS MedianContinous,
		PERCENTILE_DISC(0.5)
			WITHIN GROUP (ORDER BY Score) AS MedianDiscrete
FROM	ExamScores
GROUP BY Exam;

