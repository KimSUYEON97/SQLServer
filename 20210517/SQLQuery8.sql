--VIEW
USE sampleDB
GO

--DDL
CREATE VIEW v_userTbl
AS
	SELECT userID,name,addr FROM userTbl;
GO

SELECT userID,name,addr FROM v_userTbl

SELECT * FROM v_buyTbl

SELECT U.userID,U.name,B.prodName,B.price
FROM userTbl AS U
	INNER JOIN buyTbl AS B
	ON U.userID=B.userID
ORDER BY B.price DESC;

CREATE VIEW v_userbuyINFO
AS
SELECT U.userID,U.name,B.prodName,B.price
FROM userTbl AS U
	INNER JOIN buyTbl AS B
	ON U.userID=B.userID
GO

SELECT * FROM v_userbuyINFO
ORDER BY price DESC

DROP VIEW v_userTbl