-------------------------------------------------
-- O'reilly Online Training ---------------------
-- Advanded SQL Querying - Relational Division --
-- Relationa Division with Set Operators --------
-------------------------------------------------
-- https://1drv.ms/u/s!ArtNt2j9rxvUyAejEq7HwxNnePxr

USE HR;
GO

-- Candidates that have all skills 
-- (Divisor = Skills, Dividend = Candidate Skills)

SELECT	C.Candidate
FROM	Candidates AS C
WHERE	NOT EXISTS	(
						SELECT	S.Skill
						FROM	Skills AS S
						EXCEPT
						SELECT	CS.Skill
						FROM	CandidateSkills AS CS
						WHERE	CS.Candidate = C.Candidate
					);


-- Candidates that fit the DB Architect job
-- (Divisor = DB Architect Skills, Dividend = Candidates)

SELECT	C.Candidate
FROM	Candidates AS C
WHERE	NOT EXISTS	(
						SELECT	JS.Skill 
						FROM	JobSkills AS JS
						WHERE	JS.Job = 'DB Architect'
						EXCEPT
						SELECT	CS.Skill
						FROM	CandidateSkills AS CS
						WHERE	CS.Candidate = C.Candidate
					)

-- EXERCISE: Modify the query to include only exact fits = no remainder (no additional skills)

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


























		AND NOT EXISTS	(
							SELECT	CS1.Skill
							FROM	CandidateSkills AS CS1
							WHERE	CS1.Candidate = C.Candidate
							EXCEPT
							SELECT	JS1.Skill
							FROM	JobSkills AS JS1
							WHERE	JS1.Job = 'DB Architect'
						);


