USE sqlDB;
GO

SELECT * 
  FROM userTbl
    WHERE userID = 'kkh';

--사용자 테이블에서 출생년도 1970 ~1980년사이이면서, 키가 180이상인 사람 조회
SELECT *
  FROM userTbl
    WHERE birthYear > 1970 AND birthYear<=1980 AND HEIGHT>=180;

SELECT *
  FROM userTbl
    WHERE birthYear BETWEEN 1970 AND 1980 AND HEIGHT>=180;

--출생년도가 1970년도 이후이거나 키가 182이상인 사람 조회
SELECT *
  FROM userTbl
    WHERE birthYear >= 1970 OR height >= 182;

--사용자 중 지역이 경남,전남,경북인 사람만 조회
--[] = COLUMN 의미 , 굳이 사용할 필요는 없다
SELECT [name],userID,addr FROM userTbl
  WHERE addr ='경남' OR addr ='경북' OR addr ='전남';

SELECT [name],userID,addr FROM userTbl
  WHERE addr IN ('경남','전남','경북');

--LIKE절 = 문자열에서 속하는 문자열이 있는 튜플 검색(CONTAIN)
SELECT name,height,addr FROM userTbl
  WHERE name LIKE '김%';

SELECT name,height,addr FROM userTbl
  WHERE name LIKE '김______'; -- 빈칸도 한자리수로 여겨야함

 --subquery
 SELECT * FROM userTbl
 WHERE height >175;

 --김경호보다 키가 큰사람 조회 SUBQUERY
 SELECT * FROM userTbl
 WHERE height >(SELECT height FROM userTbl WHERE name='김경호');

 SELECT * FROM userTbl
 WHERE height > ANY (SELECT height FROM userTbl WHERE addr ='경남');

 --IN == =ANY
 SELECT * FROM userTbl
 WHERE height IN (SELECT height FROM userTbl WHERE addr ='경남');

 SELECT * FROM userTbl
 WHERE height = ANY (SELECT height FROM userTbl WHERE addr ='경남');

 --ORDERBY 전에 USERID(PK)는 자동 오름차순 정렬된다
 SELECT * FROM userTbl 
 ORDER BY userID DESC;

 SELECT * FROM userTbl 
 ORDER BY  height DESC , name ASC; -- HEIGHT 동일한 값이 나올 경우 NAME으로 정렬시킴

 SELECT * FROM userTbl
 ORDER BY mobile1 ASC, mobile2 DESC;

 SELECT COUNT(*) FROM userTbl;
 SELECT COUNT(*) FROM buyTbl;


 SELECT DISTINCT addr FROM userTbl;

--TOP
USE AdventureWorksLT2019;
GO

SELECT TOP 10 * FROM SalesLT.Customer;
SELECT TOP (10) * FROM SalesLT.Customer
WHERE Title = 'Ms.'
ORDER BY CustomerID DESC; 
--TOP에 SUBQUERY가능!

--10%SAMPLING
SELECT * FROM SalesLT.Customer 
TABLESAMPLE (10 PERCENT);

SELECT * FROM SalesLT.Customer 
ORDER BY FirstName
OFFSET 5 ROW --잘 안씀
FETCH NEXT 3 ROWS ONLY; -- 실제 프로시저/함수 할때 사용하게 된다.