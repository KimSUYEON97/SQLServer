INSERT INTO testTbl VALUES ('홍길동','서울');
INSERT INTO testTbl(userName,addr) VALUES('설현','서울');
INSERT INTO testTbl (userName) VALUES ('아이유');

--순서 바뀌어도 들어가진다.
INSERT INTO testTbl(addr,userName) VALUES('대전','김형욱');
INSERT INTO testTbl(userName) VALUES('홍길순');
--INSERT INTO testTbl(addr) VALUES ('세종');

SELECT * FROM testTbl;

--delete from test tbl

INSERT INTO userTbl (userID,name,birthYear,addr)
VALUES ('IU','아이유',1993,'서울');

SELECT * FROM userTbl WHERE userID ='IU';

INSERT INTO userTbl (userID,name,birthYear,addr,height)
VALUES ('JJH','조지훈',1982,'신안',187);

SELECT * FROM userTbl;