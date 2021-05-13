--복습
USE sqlDB;
GO

SELECT * FROM userTbl;

SELECT *FROM userTbl
WHERE userID='BBK';

SELECT *FROM userTbl
WHERE name LIKE '김%';

-- ...

--SELECT INTO USERTBL_NEW TABLE새로 생성(PK내용 미생성)
--SELECT *INTO userTBL_NEW FROM userTbl;

--SELECT userID , name,addr INTO userTBL_Backup FROM userTbl;

--SELECT userID , name,addr INTO userTBL_Backup2 FROM userTbl WHERE addr ='서울';

--GROUP BY 아이디 별로 물건 얼마 샀는 지 조회
SELECT userID, SUM(amount) AS '총 구매 갯수' , SUM(amount*price) AS '총구매금액'
FROM buyTbl GROUP BY userID 
ORDER BY SUM(amount*price) DESC;

-- AS == []
SELECT AVG(price) AS [평균구매금액] FROM buyTbl;

--키큰 사람 작은사람
SELECT name,height FROM userTbl 
WHERE height = (SELECT MAX(height) FROM userTbl)
OR height = (SELECT MIN(height) FROM userTbl);

--HAVING 
--집계함수는 WHERE절에 절대 불가능 ONLY IN SELECT, HAVING만
SELECT userID AS '사용자ID' ,SUM(price*amount) AS [총 구매금액]
FROM buyTbl
GROUP BY userID
HAVING SUM(price*amount) >=1000;

--통계
--사용자가 각각의 그룹별로 얼마를 구매했는지 조회
SELECT userID,groupName,SUM(price*amount) AS [총 구매금액]
FROM buyTbl
GROUP BY groupName,userID; 

SELECT groupName,userID,SUM(price*amount) AS [총 구매금액]
FROM buyTbl
GROUP BY ROLLUP (groupName),userID; 

--A
SELECT groupName,userID,SUM(price*amount) AS [총 구매금액]
FROM buyTbl
GROUP BY ROLLUP (groupName,userID); --전체 구매금액이 도출됨

--B
SELECT groupName,SUM(price*amount) AS [총 구매금액]
FROM buyTbl
GROUP BY groupName; -- ROLLUP 사용시 전체 합계 도출됨

--A+B 결과 = CUBE
SELECT groupName,userID,SUM(price*amount) AS [총 구매금액]
FROM buyTbl
GROUP BY CUBE (groupName,userID);

SELECT groupName,SUM(price*amount) AS [총 구매금액], GROUPING_ID(groupName) AS 'SUM'
FROM buyTbl
GROUP BY ROLLUP (groupName);