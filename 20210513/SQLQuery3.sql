INSERT INTO testTbl VALUES ('ȫ�浿','����');
INSERT INTO testTbl(userName,addr) VALUES('����','����');
INSERT INTO testTbl (userName) VALUES ('������');

--���� �ٲ� ������.
INSERT INTO testTbl(addr,userName) VALUES('����','������');
INSERT INTO testTbl(userName) VALUES('ȫ���');
--INSERT INTO testTbl(addr) VALUES ('����');

SELECT * FROM testTbl;

--delete from test tbl

INSERT INTO userTbl (userID,name,birthYear,addr)
VALUES ('IU','������',1993,'����');

SELECT * FROM userTbl WHERE userID ='IU';

INSERT INTO userTbl (userID,name,birthYear,addr,height)
VALUES ('JJH','������',1982,'�ž�',187);

SELECT * FROM userTbl;