--1.
SELECT LOWER(Email) AS email,mobile ,names,addr
FROM membertbl
ORDER BY names DESC;

--2.
SELECT names,author,releaseDate,price 
FROM bookstbl;

--3.
SELECT idx
		,CONCAT('���� : ',Names) AS Names
		,CONCAT('���� > ',Author) AS Author
		,FORMAT(ReleaseDate,'yyyy�� MM�� dd��') AS [������],ISBN
		,FORMAT(Price,'#,#��') AS [����]
FROM bookstbl
ORDER BY idx DESC;

--4.
SELECT M.Names,M.Levels,M.Addr,R.rentalDate
FROM membertbl AS M
	LEFT OUTER JOIN rentaltbl AS R
		ON M.Idx = R.memberIdx
WHERE R.memberIdx IS NULL;

--5.
SELECT D.names,FORMAT(SUM(Price),'#,#��') AS [���հ�ݾ�]
FROM bookstbl AS B
	LEFT OUTER JOIN divtbl AS D
		ON D.Division = B.Division
GROUP BY ROLLUP(D.Names);
