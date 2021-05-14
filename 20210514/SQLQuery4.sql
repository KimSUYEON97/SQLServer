--�����Լ�
SELECT name,height,addr
FROM userTbl
WHERE height IS NOT NULL
ORDER BY height DESC;

SELECT ROW_NUMBER() OVER(ORDER BY height DESC)AS 'Ű ����',name,height,addr
FROM userTbl
WHERE height IS NOT NULL;

SELECT RANK() OVER(ORDER BY height DESC)AS 'Ű ����',name,height,addr
FROM userTbl
WHERE height IS NOT NULL;

SELECT DENSE_RANK() OVER(ORDER BY height DESC)AS 'Ű ����',name,height,addr
FROM userTbl
WHERE height IS NOT NULL;

SELECT ROW_NUMBER() OVER(PARTITION BY addr ORDER BY height DESC)AS 'Ű ����',name,height,addr
FROM userTbl
WHERE height IS NOT NULL;

SELECT userID,SUM(price*amount) AS [����ں� ���űݾ�]
FROM buyTbl
GROUP BY userID
ORDER BY SUM(price*amount) DESC;

SELECT userID,RANK() OVER(ORDER BY SUM(price*amount) DESC) AS [���ż���],SUM(price*amount) AS [����ں� ���űݾ�]
FROM buyTbl
GROUP BY userID;

SELECT userID,RANK() OVER(ORDER BY SUM(price*amount) DESC) AS [���ż���],SUM(price*amount) AS [����ں� ���űݾ�]
FROM buyTbl
GROUP BY userID
FOR XML AUTO; --FOR JSON AUTO --���� ���� ���� INTO XML OR JSON