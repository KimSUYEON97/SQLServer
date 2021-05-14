--순위함수
SELECT name,height,addr
FROM userTbl
WHERE height IS NOT NULL
ORDER BY height DESC;

SELECT ROW_NUMBER() OVER(ORDER BY height DESC)AS '키 순위',name,height,addr
FROM userTbl
WHERE height IS NOT NULL;

SELECT RANK() OVER(ORDER BY height DESC)AS '키 순위',name,height,addr
FROM userTbl
WHERE height IS NOT NULL;

SELECT DENSE_RANK() OVER(ORDER BY height DESC)AS '키 순위',name,height,addr
FROM userTbl
WHERE height IS NOT NULL;

SELECT ROW_NUMBER() OVER(PARTITION BY addr ORDER BY height DESC)AS '키 순위',name,height,addr
FROM userTbl
WHERE height IS NOT NULL;

SELECT userID,SUM(price*amount) AS [사용자별 구매금액]
FROM buyTbl
GROUP BY userID
ORDER BY SUM(price*amount) DESC;

SELECT userID,RANK() OVER(ORDER BY SUM(price*amount) DESC) AS [구매순위],SUM(price*amount) AS [사용자별 구매금액]
FROM buyTbl
GROUP BY userID;

SELECT userID,RANK() OVER(ORDER BY SUM(price*amount) DESC) AS [구매순위],SUM(price*amount) AS [사용자별 구매금액]
FROM buyTbl
GROUP BY userID
FOR XML AUTO; --FOR JSON AUTO --전달 형식 변형 INTO XML OR JSON