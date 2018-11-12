-------------------------------------------------
-- O'reilly Online Training ---------------------
-- Advanded SQL Querying - Relational Division --
-- HR Demo Database Setup -----------------------
-------------------------------------------------
-- https://1drv.ms/u/s!ArtNt2j9rxvUyAaTUi75_Bm0q5cK

-- 1 - Get SQL Server
-- https://www.microsoft.com/en-us/sql-server/sql-server-editions-express
-- https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms
-- https://docs.microsoft.com/en-us/sql/azure-data-studio/download

-- 2 - Use SQLFiddle
-- http://sqlfiddle.com/


-- For local SQL only uncomment
-- USE master
-- GO
-- IF DB_ID('HR') IS NOT NULL DROP DATABASE HR WITH ROLLBACK_IMMEDIATE;
-- CREATE DATABASE HR;
-- GO

USE HR;
GO

CREATE TABLE Candidates (
						Candidate 
							VARCHAR(30) NOT NULL 
							PRIMARY KEY
						);

CREATE TABLE Jobs	(
					Job 
						VARCHAR(30) NOT NULL
						PRIMARY KEY
					);

CREATE TABLE SkillCategories	(
								Category
									VARCHAR(30) NOT NULL
									PRIMARY KEY
								);

CREATE TABLE Skills	(
					Skill
						VARCHAR(30) NOT NULL
						PRIMARY KEY,
					Category
						VARCHAR(30) NOT NULL
						REFERENCES SkillCategories(Category)
					);

CREATE TABLE CandidateSkills	(
								Candidate
									VARCHAR(30) NOT NULL
									REFERENCES Candidates(Candidate),
								Skill
									VARCHAR(30) NOT NULL
									REFERENCES Skills(Skill),
								PRIMARY KEY (Candidate, Skill)
								);

CREATE TABLE JobSkills	(
						Job
							VARCHAR(30) NOT NULL
							REFERENCES Jobs(Job),
						Skill
							VARCHAR(30) NOT NULL
							REFERENCES Skills(Skill),
						PRIMARY KEY (Job, Skill)
						);

INSERT INTO Candidates(Candidate)
VALUES ('Ami'),('Xi'),('DJ'),('Steve'), ('Darrin');

INSERT INTO Jobs(Job)
VALUES ('DB Architect'), ('Front End Developer'), ('Office Manager');

INSERT INTO SkillCategories(Category)
VALUES ('Professional'), ('Personal');

INSERT INTO Skills(Skill, Category)
VALUES	('SQL','Professional'), ('DB Design','Professional'), ('C#','Professional'), ('Python','Professional'), ('Java','Professional'), ('Office','Professional'),
		('Team Player','Personal'), ('Leader','Personal'), ('Passionate','Personal');

INSERT INTO JobSkills(Job, Skill)
VALUES	('DB Architect','SQL'), ('DB Architect','DB Design'), ('DB Architect','Python'), ('DB Architect','Team Player'), ('DB Architect','Passionate'),
		('Front End Developer','Java'), ('Front End Developer','C#'), ('Front End Developer','Team Player'), ('Front End Developer','Passionate'),
		('Office Manager','Passionate'), ('Office Manager','Office');

INSERT INTO CandidateSkills(Candidate, Skill)
VALUES	('Ami','SQL'), ('Ami','DB Design'), ('Ami','Team Player'), ('Ami','Passionate'), 
		-- Partial match for DB Architect professional, match for personal skills
		('Xi','SQL'), ('Xi','DB Design'), ('Xi','Python'), ('Xi','Team Player'), ('Xi','Passionate'), 
		-- Xi is a perfect match for DB Architect
		('DJ','Java'), ('DJ','C#'), ('DJ','Team Player'), ('DJ','Passionate'), ('DJ','Python'), 
		-- DJ is over qualified for Front End Developer (has extra skills)
		('Steve','Passionate'), ('Steve','Leader'), 
		-- Steve has no professional skills
		('Darrin','SQL'), ('Darrin','DB Design'), ('Darrin','C#'), ('Darrin','Python'), ('Darrin','Java'), ('Darrin','Office'), ('Darrin','Team Player'), ('Darrin','Leader'), ('Darrin','Passionate'); 
		-- Darrin Has it all
		-- And of course, all candidates are passionate...

SELECT	*
FROM	Skills;

SELECT	*
FROM	CandidateSkills;

SELECT	* 
FROM	JobSkills;

-- Cleanup
/*
DROP TABLE CandidateSkills, JobSkills;
DROP TABLE Skills, Jobs;
DROP TABLE SkillCategories, Candidates;
GO
*/
