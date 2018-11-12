-------------------------------------------------
-- O'reilly Online Training ---------------------
-- Advanded SQL Querying - Relational Division --
-- Relationa Division with Nested NOT EXISTS ----
-------------------------------------------------
-- https://1drv.ms/u/s!ArtNt2j9rxvUyApISeBka9eGwWil

-- What skills are common to all jobs?
-- Divisor = All Jobs, Dividend - Job Skills

SELECT	S.Skill
FROM	Skills AS S
WHERE	NOT EXISTS	(
						SELECT	NULL
						FROM	Jobs AS J
						WHERE NOT EXISTS	(
												SELECT	NULL
												FROM	JobSkills AS JS
												WHERE	JS.Job = J.Job
														AND
														JS.Skill = S.Skill
											)
					);

-- Which candidate has all professional skills?
-- Divisor = Professional Skills, Dividend = Candidate Skills

WITH ProfessionalSkills 
AS
(
	SELECT	S.Skill
	FROM	Skills AS S
	WHERE	Category = 'Professional'
)
SELECT	C.Candidate
FROM	Candidates AS C
WHERE	NOT EXISTS	(
						SELECT	NULL
						FROM	ProfessionalSkills AS PS
						WHERE	NOT EXISTS	(
												SELECT	NULL
												FROM	CandidateSkills AS CS
												WHERE	CS.Skill = PS.Skill
														AND
														CS.Candidate = C.Candidate
											)
					);

-- Who shares skills with Ami?

WITH AmisSkills
AS
(
	SELECT	CS.Skill 
	FROM	CandidateSkills AS CS
	WHERE	Candidate = 'Ami'
)
SELECT	C.Candidate
FROM	Candidates AS C
WHERE	Candidate <> 'Ami'
		AND
		NOT EXISTS	(
						SELECT	NULL
						FROM	AmisSkills AS AMS
						WHERE	NOT EXISTS	(
												SELECT	NULL
												FROM	CandidateSkills AS CS
												WHERE	CS.Skill = AMS.Skill		
														AND
														CS.Candidate = C.Candidate
											)	
					);


-- Exact division with no remainder:
-- Show me all candidates for which there isn't a single skill that Ami has, that they don't,
-- AND that they don't have any skill, that ami doesn't have

WITH AmisSkills
AS
(
	SELECT	CS.Skill 
	FROM	CandidateSkills AS CS
	WHERE	Candidate = 'Ami'
)
SELECT	C.Candidate
FROM	Candidates AS C
WHERE	Candidate <> 'Ami'
		AND
		NOT EXISTS	(
						SELECT	NULL
						FROM	AmisSkills AS AMS
						WHERE	NOT EXISTS	(
												SELECT	NULL
												FROM	CandidateSkills AS CS
												WHERE	CS.Skill = AMS.Skill		
														AND
														CS.Candidate = C.Candidate
											)	
					)
		AND
		NOT EXISTS	(
						SELECT	NULL
						FROM	CandidateSkills AS CS1
						WHERE	CS1.Candidate = C.Candidate
								AND
								CS1.Skill NOT IN (SELECT Skill FROM AmisSkills)
					);

-- Exercise - Which jobs share personal skill requirements with the DB Architect job?

/*

                                                                                                                                 
 ad88888ba                             88  88                                    db         88                                   
d8"     "8b                            ""  88                                   d88b        88                            ,d     
Y8,                                        88                                  d8'`8b       88                            88     
`Y8aaaaa,    8b,dPPYba,    ,adPPYba,   88  88   ,adPPYba,  8b,dPPYba,         d8'  `8b      88   ,adPPYba,  8b,dPPYba,  MM88MMM  
  `"""""8b,  88P'    "8a  a8"     "8a  88  88  a8P_____88  88P'   "Y8        d8YaaaaY8b     88  a8P_____88  88P'   "Y8    88     
        `8b  88       d8  8b       d8  88  88  8PP"""""""  88               d8""""""""8b    88  8PP"""""""  88            88     
Y8a     a8P  88b,   ,a8"  "8a,   ,a8"  88  88  "8b,   ,aa  88              d8'        `8b   88  "8b,   ,aa  88            88,    
 "Y88888P"   88`YbbdP"'    `"YbbdP"'   88  88   `"Ybbd8"'  88             d8'          `8b  88   `"Ybbd8"'  88            "Y888  
             88                                                                                                                  
             88                                                                                                                  
                                           
*/

























WITH DBArchitectPersonalSkills
AS
(
	SELECT	Skill 
	FROM	JobSkills AS S
	WHERE	S.Skill IN		(
								SELECT	S.Skill 
								FROM	Skills AS S
								WHERE	S.Category = 'Personal'
							)
			AND
			Job = 'DB Architect'
)
SELECT	J.Job
FROM	Jobs AS J
WHERE	Job <> 'DB Architect'
		AND
		NOT EXISTS	(
						SELECT	NULL
						FROM	DBArchitectPersonalSkills AS DBPS
						WHERE	NOT EXISTS	(
												SELECT	NULL
												FROM	JobSkills AS JS1
												WHERE 	JS1.Job = J.Job
														AND
														JS1.Skill = DBPS.Skill
												)
					);

