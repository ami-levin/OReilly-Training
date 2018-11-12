-------------------------------------------------
-- O'reilly Online Training ---------------------
-- Advanded SQL Querying - Relational Division --
-- Relationa Division with COUNT ----------------
-------------------------------------------------
-- https://1drv.ms/u/s!ArtNt2j9rxvUyAmBwd_SseaQknHl

USE HR;
GO

-- Show all candidates that fit the DB Architect role 
-- (Divisor = DB Architect Skills, Dividend = Candidate Skills)

WITH DBArchitectSkills 
AS
(
	SELECT	JS.Skill
	FROM	JobSkills AS JS
	WHERE	JS.Job = 'DB Architect'
)
SELECT	CS.Candidate
FROM	CandidateSkills AS CS
		INNER JOIN
		DBArchitectSkills AS DBS
			ON DBS.Skill = CS.Skill
GROUP BY CS.Candidate
HAVING COUNT(*) = (SELECT COUNT(*) FROM DBArchitectSkills)

-- Note that Darrin shows up... 
-- how to limit results to an exact match = no remainder?

WITH DBArchitectSkills
AS
(
	SELECT	JS.Skill
	FROM	JobSkills AS JS
	WHERE	JS.Job = 'DB Architect'
)
SELECT	CS.Candidate, COUNT(*), COUNT(DBS.Skill)
FROM	CandidateSkills AS CS
		LEFT OUTER JOIN
		DBArchitectSkills AS DBS
		ON DBS.Skill = CS.Skill
GROUP BY CS.Candidate
HAVING	COUNT(DBS.Skill) = (SELECT COUNT(*) FROM DBArchitectSkills)
		AND
		COUNT(*) = COUNT(DBS.Skill)


-- Division by empty divisor with EXCEPT vs. COUNT
WITH EmptySkills 
AS
(
	SELECT	JS.Skill
	FROM	JobSkills AS JS
	WHERE	JS.Job = 'Empty'
)
SELECT	CS.Candidate
FROM	EmptySkills AS DBS
		INNER JOIN
		CandidateSkills AS CS
			ON DBS.Skill = CS.Skill
GROUP BY CS.Candidate
HAVING COUNT(*) = (SELECT COUNT(*) FROM EmptySkills)


WITH EmptySkills 
AS
(
	SELECT	JS.Skill
	FROM	JobSkills AS JS
	WHERE	JS.Job = 'Empty'
)
SELECT	C.Candidate
FROM	Candidates AS C
WHERE	NOT EXISTS	(
						SELECT	ES.Skill
						FROM	EmptySkills AS ES
						EXCEPT
						SELECT	CS.Skill
						FROM	CandidateSkills AS CS
						WHERE	CS.Candidate = C.Candidate
					);

-- Exercise - Show all candidates who are over-qualified (have more than the skills needed) for the Front End Developer job

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

























WITH FrontEndDeveloperSkills
AS
(
	SELECT	Job, Skill
	FROM	JobSkills
	WHERE	Job = 'Front End Developer'
)
SELECT	CS.Candidate
FROM	CandidateSkills AS CS
		LEFT OUTER JOIN
		FrontEndDeveloperSkills AS FEDS
		ON CS.Skill = FEDS.Skill
GROUP BY CS.Candidate
HAVING	COUNT(FEDS.Skill) = (SELECT COUNT(*) FROM FrontEndDeveloperSkills)
		AND
		COUNT(*) > COUNT(FEDS.Skill);