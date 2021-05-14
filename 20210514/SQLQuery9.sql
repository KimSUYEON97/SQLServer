--CROSSJOIN

SELECT * FROM userTbl CROSS JOIN buyTbl;

--UNION집합
SELECT StdName,Region FROM stdTbl
UNION 
SELECT ClubName,ClubRoom FROM clubTbl;

--Data type 일치해야 union가능
SELECT CAST(ID AS VARCHAR),StdID FROM regiInfoTbl
UNION --중복제거
SELECT ClubName,ClubRoom FROM clubTbl;

SELECT StdName,Region  FROM stdTbl
UNION ALL --중복 허용
SELECT StdName,Region FROM stdTbl;

--except
SELECT name, CONCAT(mobile1,mobile2) as mobile FROM userTbl
EXCEPT
SELECT name, CONCAT(mobile1,mobile2) as mobile FROM userTbl
WHERE mobile1 is not null;

--뒷 테이블 기준 만족되는 데이터 추출 
SELECT name, CONCAT(mobile1,mobile2) as mobile FROM userTbl
INTERSECT
SELECT name, CONCAT(mobile1,mobile2) as mobile FROM userTbl
WHERE mobile1 is not null;