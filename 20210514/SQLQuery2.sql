--시스템함수
SELECT MIN(price) FROM buyTbl;
SELECT MAX(price) FROM buyTbl;

SELECT AVG(CAST(amount AS float)) FROM buyTbl;
SELECT CAST(AVG(CAST(amount AS float)) AS DECIMAL(4,3)) FROM buyTbl;

SELECT AVG(CONVERT(FLOAT,amount)) FROM buyTbl;
SELECT AVG(TRY_CONVERT(FLOAT,amount)) FROM buyTbl;

--SELECT PARSE('3.14' AS INT);--예외 발생시 쿼리 비정상 종료
SELECT TRY_PARSE('3.14' AS INT);--값 변환 안될 경우 NULL값 대체 -> 정상 수행

SELECT name,height FROM userTbl
WHERE height IS NULL;


SELECT name,height FROM userTbl
WHERE height IS NOT NULL;

--HEIGHT ==SMALL INT --> VARCHAR, CHAR CAST가능
SELECT name,CAST(height AS varchar)+'CM' FROM userTbl
WHERE height IS NOT NULL;

SELECT PARSE('2021년 5월 14일 10시 27분' AS DATETIME);
SELECT PARSE('2021-05-04 10:28:10' AS DATETIME);

SELECT GETDATE();--ORACLE에는 없음 -- INSERT 현재 년월일시분초 제일 많이 사용

SELECT @@SERVERNAME;
SELECT @@SERVICENAME;
SELECT @@VERSION;

--날짜 및 시간함수
SELECT YEAR(GETDATE()) AS '현재년도';
SELECT MONTH(GETDATE()) AS '현재월';
SELECT DAY(GETDATE()) AS '오늘';

--수치함수
SELECT ABS(-100);
SELECT ROUND(3.141592,2);
SELECT FLOOR(RAND()*100);--내림

-- 논리함수 
SELECT IIF(100 > 200, '참', '거짓');
WITH CTE_SUMMARY(GRP,SUMM,DIV)
AS
(
	--GROUP BY ROLLUP
	(SELECT groupName AS GRP
		,SUM(price*amount) AS SUMM
		,GROUPING_ID(groupName) AS DIV -- 기존에 존재했던 DATA(0)인지 유추되어 나온 합계 DATA(1)인지 파악 위한 구분자
	FROM buyTbl
	GROUP BY ROLLUP(groupName))
)
SELECT
IIF(DIV =0,GRP,'총합계') AS [상품그룹]
	FROM CTE_SUMMARY;