--3개 테이블 내부조인
SELECT s.StdID,s.StdName,s.Region,r.ClubName,c.ClubName,r.RegiDate
FROM stdTbl AS s 
INNER JOIN regiInfoTbl AS r 
ON s.StdID = r.StdID
INNER JOIN clubTbl AS c 
ON c.ClubName = r.ClubName;

SELECT s.StdID,s.StdName,s.Region,r.ClubName,c.ClubName,r.RegiDate
FROM stdTbl AS s 
INNER JOIN regiInfoTbl AS r 
ON s.StdID = r.StdID
INNER JOIN clubTbl AS c 
ON c.ClubName = r.ClubName
WHERE s.StdID = 'KBS';