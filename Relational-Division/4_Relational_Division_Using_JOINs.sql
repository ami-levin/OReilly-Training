-------------------------------------------------
-- O'reilly Online Training ---------------------
-- Advanded SQL Querying - Relational Division --
-- Relationa Division with JOINs ----------------
-------------------------------------------------
-- https://1drv.ms/u/s!ArtNt2j9rxvUyAip01wr05sifC_J

-- Who has the same skills as Ami?

WITH AmisSkills AS
(
	SELECT	Candidate, Skill
	FROM	CandidateSkills
	WHERE	Candidate = 'Ami'
),
AllSkills
AS
(
	SELECT	Skill
	FROM	Skills
	-- WHERE Category = 'Personal'
),
OtherCandidateSkills
AS
(
	SELECT	Candidate, Skill
	FROM	CandidateSkills
	WHERE	Candidate <> 'Ami'
)
SELECT	OCS.Candidate
FROM	AllSkills AS AllS
		INNER JOIN
		AmisSkills AS AmiS
			ON AmiS.Skill = AllS.Skill		
		INNER JOIN
		OtherCandidateSkills	AS OCS
			ON AllS.Skill = OCS.Skill
GROUP BY OCS.Candidate
HAVING COUNT(*) = (SELECT COUNT(*) FROM AmisSkills);

-- The short-cut version
WITH AmisSkills 
AS
(
	SELECT	CS.Skill 
	FROM	CandidateSkills AS CS 
	WHERE	Candidate = 'Ami'
)
	SELECT	Candidate
	FROM	AmisSkills AS ASK
			INNER JOIN
			CandidateSkills AS CS
			ON CS.Skill = ASK.Skill
	WHERE	CS.Candidate <> 'Ami'
GROUP BY Candidate
HAVING (COUNT(*) = (SELECT COUNT(*) FROM AmisSkills))

-- Exact match like we did previously in the COUNTs section


-- Exercise: Which jobs share the same personal skills as the DB Architect?

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


























-- A 'hybrid' (not the most efficient) solution with EXCEPT and COUNTs
-- Can you find a better one?

WITH DBArchitectSkills
AS
(
	SELECT	JS.Skill
	FROM	JobSkills AS JS
	WHERE	Job = 'DB Architect'
),
PersonalSkills
AS
(
	SELECT	S.Skill
	FROM	Skills AS S
	WHERE	S.Category = 'Personal'
),
AllOtherJobs
AS
(
	SELECT	JS.Job, 
			JS.Skill
	FROM	JobSkills AS JS
	WHERE	JS.Job <> 'DB Architect'
)
SELECT	AOJ.Job
FROM	AllOtherJobs AS AOJ
		INNER JOIN
		DBArchitectSkills AS DBAS
			ON AOJ.Skill = DBAS.Skill
		INNER JOIN
		PersonalSkills AS PS
			ON PS.Skill = DBAS.Skill
GROUP BY AOJ.Job
HAVING COUNT(*) = (	
					SELECT COUNT(*) 
					FROM	(
								SELECT	Skill 
								FROM	DBArchitectSkills 
								EXCEPT 
								SELECT	Skill 
								FROM	Skills 
								WHERE	Category <> 'Personal'
							) AS X
					) 



