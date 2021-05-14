--외부조인
SELECT *
FROM userTbl AS U
  INNER JOIN buyTbl AS B
    ON U.userID=B.userID;

SELECT U.userID,U.name,B.prodName,U.addr,CONCAT(U.mobile1,U.mobile2) AS mobile
FROM userTbl AS U
  INNER JOIN buyTbl AS B
    ON U.userID=B.userID
ORDER BY U.userID;

SELECT U.userID,U.name,B.prodName,U.addr,CONCAT(U.mobile1,U.mobile2) AS mobile
FROM userTbl AS U
  LEFT OUTER JOIN buyTbl AS B
    ON U.userID=B.userID
ORDER BY U.userID;

--쇼핑몰 물건 한번도 안 산 사람
SELECT U.userID,U.name,B.prodName,U.addr,CONCAT(U.mobile1,U.mobile2) AS mobile
FROM userTbl AS U
  LEFT OUTER JOIN buyTbl AS B
    ON U.userID=B.userID
WHERE B.prodName IS NULL
ORDER BY U.userID;

--
SELECT U.userID,U.name,B.prodName,U.addr,CONCAT(U.mobile1,U.mobile2) AS mobile
FROM userTbl AS U
  RIGHT OUTER JOIN buyTbl AS B
    ON U.userID=B.userID
WHERE B.prodName IS NULL
ORDER BY U.userID;

--학생/동아리/가입정보테이블
--OUTER JOIN
SELECT S.StdID,S.StdName,S.Region,R.ClubName,C.ClubName,C.ClubRoom,R.RegiDate
FROM stdTbl AS S
LEFT OUTER JOIN regiInfoTbl AS R
  ON S.StdID = R.StdID
LEFT OUTER JOIN clubTbl AS C
  ON C.ClubName = R.ClubName;

SELECT S.StdID,S.StdName,S.Region,R.ClubName,C.ClubName,C.ClubRoom,R.RegiDate
FROM stdTbl AS S
RIGHT OUTER JOIN regiInfoTbl AS R
  ON S.StdID = R.StdID
RIGHT OUTER JOIN clubTbl AS C
  ON C.ClubName = R.ClubName;

SELECT S.StdID,S.StdName,S.Region,R.ClubName,C.ClubName,C.ClubRoom,R.RegiDate
FROM stdTbl AS S
FULL OUTER JOIN regiInfoTbl AS R
  ON S.StdID = R.StdID
FULL OUTER JOIN clubTbl AS C
  ON C.ClubName = R.ClubName;

SELECT C.ClubName,C.ClubRoom, R.ID, R.RegiDate
FROM clubTbl AS C
LEFT OUTER JOIN regiInfoTbl AS R --LEFT = CLUBTBL, RIGHT = REGIINFOTBL
  ON R.ClubName = C.ClubName;
