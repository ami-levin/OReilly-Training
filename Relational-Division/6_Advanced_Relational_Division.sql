-------------------------------------------------
-- O'reilly Online Training ---------------------
-- Advanded SQL Querying - Relational Division --
-- Advanced Relationa Divisions -----------------
-------------------------------------------------
-- https://1drv.ms/u/s!ArtNt2j9rxvUyAt99JqZ_63fVdMV

-- Todd's Division

-- Show all candidate and jobs, where the candidate meets the job requirements 
-- (Divisor = (multiple sets of) Job Skills, Dividend = Candidate Skills)

-- Using SET operator
SELECT	DISTINCT	C.Candidate, 
					J.Job
FROM	Candidates AS C
		CROSS JOIN		-- Assuming all candidates may be a fit for all jobs 
						-- Replace with CandidateSkills AS CS INNER JOIN JobSkills As JS ON CS.Skill = JS.Skill to eliminate rows without at least one skill match
		Jobs AS J
WHERE	NOT EXISTS	(
						SELECT	JS.Skill
						FROM	JobSkills AS JS
						WHERE	JS.Job = J.Job
						EXCEPT
						SELECT	CS.Skill
						FROM	CandidateSkills AS CS
						WHERE	C.Candidate = CS.Candidate
					)

-- And to include only exact fits = no remainder (no additional skills), just add
		AND NOT EXISTS	(
							SELECT	CS1.Skill
							FROM	CandidateSkills AS CS1
							WHERE	CS1.Candidate = C.Candidate
							EXCEPT
							SELECT	JS1.Skill
							FROM	JobSkills AS JS1
							WHERE	JS1.Job = J.Job
						);


-- Using Counts
WITH JobSkillCounts AS
(
	SELECT	JS1.Job, 
			COUNT(*) AS NumSkills
	FROM	JobSkills AS JS1
	GROUP BY JS1.Job
)
SELECT	CS.Candidate, 
		JS.Job
FROM	JobSkills AS JS
		INNER JOIN
		CandidateSkills AS CS
			ON JS.Skill = CS.Skill -- optimize the cross join
		INNER JOIN
		JobSkillCounts
			ON JobSkillCounts.Job = JS.Job
GROUP BY CS.Candidate, JS.Job
HAVING	COUNT(*) = MAX(JobSkillCounts.NumSkills)
ORDER BY	Job, 
			Candidate;

-- Another option with NOT EXISTS and NOT IN
SELECT	DISTINCT	JS.Job, 
					CS.Candidate
FROM	JobSkills AS JS	
		INNER JOIN
		CandidateSkills AS CS
			ON JS.Skill = CS.Skill
WHERE	NOT EXISTS	(
						SELECT	NULL
						FROM	JobSkills AS JS2
						WHERE	JS2.Job = JS.Job
								AND 
								JS2.Skill
								NOT IN (	-- Can replace with NOT EXISTS 
										SELECT	Skill
										FROM	CandidateSkills AS CS2
										WHERE	CS2.Candidate = CS.Candidate
										))
ORDER BY	Job, 
			Candidate;


-- Another option
WITH MatchedSkillCounts
AS
(
SELECT	CS.Candidate, 
		JS.Job, 
		COUNT(*) AS NumMatchedSkills
FROM	CandidateSkills AS CS
		INNER JOIN
		JobSkills AS JS
		ON CS.Skill = JS.Skill
GROUP BY	CS.Candidate, JS.Job
),
JobSkillCounts
AS
(
	SELECT	JS.Job,
			COUNT(*) AS NumSkills
	FROM	JobSkills AS JS
	GROUP BY JS.Job
)
SELECT	MSC.Candidate,
		JSC.Job
FROM	MatchedSkillCounts AS MSC
		INNER JOIN
		JobSkillCounts AS JSC
			ON MSC.Job = JSC.Job
WHERE	MSC.NumMatchedSkills = JSC.NumSkills


-- Romley's Division
-- For each candidate and each job, show whether the candidate fits none, some, all, or more than the job requirements.

-- Add some test data - a candidate with no skills
INSERT INTO Candidates(Candidate) VALUES ('Inco M. Petent');

WITH CandidateJobMatch
AS
(
SELECT	CS.Candidate,
		JS.Job,
		COUNT(*) AS CandidateJobSkillMatchCount
FROM	CandidateSkills AS CS
		INNER JOIN
		JobSkills AS JS
		ON CS.Skill = JS.Skill
GROUP BY	CS.Candidate, 
			JS.Job
),
JobSkillCounts
AS
(
	SELECT	JS.Job,
			COUNT(*) AS JobSkillCount
	FROM	JobSkills AS JS
	GROUP BY JS.Job
),
CandidateSkillCounts
AS
(
	SELECT	CS.Candidate,
			COUNT(*) AS CandidateSkillCount
	FROM	CandidateSkills AS CS
	GROUP BY	CS.Candidate
)
SELECT	DISTINCT	C.Candidate,
					ISNULL(CJM.Job, 'All Jobs') AS Job,
					CASE
						WHEN	CandidateJobSkillMatchCount = JobSkillCount
								AND
								CandidateSkillCount > CandidateJobSkillMatchCount
							THEN 'Over Qualified'
						WHEN	CandidateJobSkillMatchCount = JobSkillCount 
								AND
								CandidateJobSkillMatchCount = CandidateSkillCount 
							THEN 'Perfect Fit'
						WHEN CandidateJobSkillMatchCount < JobSkillCount
							THEN 'Partial Fit'
						ELSE 'None'
					END AS FitLevel
FROM	Candidates AS C
		LEFT OUTER JOIN
		CandidateSkillCounts AS CSC
			ON C.Candidate = CSC.Candidate
		LEFT OUTER JOIN
			(
				CandidateJobMatch AS CJM
				INNER JOIN
				JobSkillCounts AS JSC
					ON CJM.Job = JSC.Job
			)
			ON CSC.Candidate = CJM.Candidate


-- Take home exercise:
-- Show all candidates and the associated jobs, 
-- where the candidate fits at least 2 jobs in terms of all personal skills, 
-- and at least 2 professional skills


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------



-- Ordered Division
-- Add Ranks to both JobSkills and CandidateSkills

ALTER TABLE JobSkills 
	ADD SkillRank TINYINT NULL;
ALTER TABLE CandidateSkills 
	ADD SkillRank TINYINT NULL;
GO

WITH JSkills
AS
(
	SELECT	Job, 
			Skill,
			SkillRank,
			ROW_NUMBER() OVER (PARTITION BY Job ORDER BY Skill) AS SRank
			FROM JobSkills
)
UPDATE	JSkills
SET		SkillRank = SRank;

-- Xi will have a perfect match to DB Architect job
UPDATE CandidateSkills
SET SkillRank =		(
						SELECT	SkillRank 
						FROM	JobSkills 
						WHERE	JobSkills.Job = 'DB Architect' 
								AND 
								Skill = CandidateSkills.Skill
					)
WHERE	Candidate = 'Xi';


-- All the other's wont, 
-- since the order for the ROW_NUMBER is DESC now

WITH CSkills
AS
(
	SELECT	Candidate,
			Skill,
			SkillRank,
			ROW_NUMBER () OVER (PARTITION BY Candidate ORDER BY Skill DESC) AS SRank
	FROM	CandidateSkills
)
UPDATE	CSkills
SET		SkillRank = SRank
WHERE	Candidate <> 'Xi'

SELECT	* 
FROM	CandidateSkills 
ORDER BY Candidate, SkillRank;

SELECT	* 
FROM	JobSkills 
ORDER BY Job, SkillRank;

-- Find 'perfect' matches (both no remainder division, and matching order) is easy - 
-- Just add AND CandidateSkills.SkillRank = JobSkills.SkillRank to the predicate.
-- It's logically the same as creating a skills 'SQL1', 'SQL2'... with the rank added. 

SELECT		DISTINCT CS.Candidate, JS.Job
FROM		CandidateSkills AS CS
			INNER JOIN
			JobSkills AS JS
			ON	CS.Skill = JS.Skill 
				AND
				CS.SkillRank = JS.SkillRank -----<<<--- Added predicate
WHERE		NOT EXISTS	(
							SELECT	NULL
							FROM	JobSkills AS JS1
							WHERE	JS1.Job = JS.Job
									AND
									NOT EXISTS	(
													SELECT	NULL
													FROM	CandidateSkills AS CS1
													WHERE	CS1.Candidate = CS.Candidate
															AND
															CS1.Skill = JS1.Skill 
															AND 
															CS1.SkillRank = JS1.SkillRank -----<<<--- Added predicate
												)
						);

-- Take home exercise:
-- Find candidates that are passionate and know Python, 
-- and also rated Python below Passionate, 
-- and not necessarily as the immediate neighbor. = Only Xi 

























WITH RequiredSkillsRanks
AS
(
SELECT	* 
FROM	(VALUES ('Passionate',1), ('Python',2)) AS RequiredSkills(Skill, SkillRank)
),
PotentialCandidates
AS
(
SELECT	CS.Candidate,
		Skill,
		SkillRank
FROM	CandidateSkills AS CS
WHERE	Skill IN (SELECT Skill FROM RequiredSkillsRanks)		
		AND 
		NOT EXISTS	(
						SELECT	NULL
						FROM	RequiredSkillsRanks AS RS
						WHERE	NOT EXISTS (
												SELECT	NULL
												FROM	CandidateSkills AS CS1
												WHERE	CS.Candidate = CS1.Candidate
														AND
														CS1.Skill = RS.Skill
											)
					)
),
-- SELECT * FROM PotentialCandidates
-- Assign ROW_NUMBER to relevant skills 
PotentialCandidateRanks
AS
(
SELECT	PC.Candidate,
		PC.Skill,
		RS.SkillRank,
		ROW_NUMBER () OVER (PARTITION BY Candidate ORDER BY PC.SkillRank) AS NewSkillRank
FROM	PotentialCandidates AS PC
		INNER JOIN
		RequiredSkillsRanks AS RS
		ON RS.Skill = PC.Skill
)
SELECT	DISTINCT Candidate 
FROM	PotentialCandidateRanks
WHERE	SkillRank = NewSkillRank