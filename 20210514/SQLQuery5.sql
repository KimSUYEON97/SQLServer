-- INNERJOIN 내부 조인
SELECT *
FROM userTbl
INNER JOIN buyTbl ON userTbl.userID = buyTbl.userID;

SELECT userTbl.userID,userTbl.name,userTbl.addr, CONCAT(userTbl.mobile1,userTbl.mobile2) AS mobile
    ,buyTbl.num,buyTbl.prodName,buyTbl.price,buyTbl.amount
FROM userTbl
INNER JOIN buyTbl ON userTbl.userID = buyTbl.userID;

SELECT u.userID,u.name,u.addr, CONCAT(u.mobile1,u.mobile2) AS mobile
    ,b.num,b.prodName,b.price,b.amount
FROM userTbl AS u
INNER JOIN buyTbl AS b --AS 생략 가능 
  ON u.userID = b.userID
WHERE u.userID = 'JYP';