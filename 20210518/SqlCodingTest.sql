--1.
SELECT LOWER(Email) AS email,mobile ,names,addr
FROM membertbl
ORDER BY names DESC;

--2.
SELECT names,author,releaseDate,price 
FROM bookstbl;

--3.
SELECT idx
		,CONCAT('제목 : ',Names) AS Names
		,CONCAT('저자 > ',Author) AS Author
		,FORMAT(ReleaseDate,'yyyy년 MM월 dd일') AS [출판일],ISBN
		,FORMAT(Price,'#,#원') AS [가격]
FROM bookstbl
ORDER BY idx DESC;

--4.
SELECT M.Names,M.Levels,M.Addr,R.rentalDate
FROM membertbl AS M
	LEFT OUTER JOIN rentaltbl AS R
		ON M.Idx = R.memberIdx
WHERE R.memberIdx IS NULL;

--5.
SELECT D.names,FORMAT(SUM(Price),'#,#원') AS [총합계금액]
FROM bookstbl AS B
	LEFT OUTER JOIN divtbl AS D
		ON D.Division = B.Division
GROUP BY ROLLUP(D.Names);
