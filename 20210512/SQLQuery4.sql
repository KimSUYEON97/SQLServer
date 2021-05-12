USE sqlDB;
GO

SELECT * 
  FROM userTbl
    WHERE userID = 'kkh';

--����� ���̺��� ����⵵ 1970 ~1980������̸鼭, Ű�� 180�̻��� ��� ��ȸ
SELECT *
  FROM userTbl
    WHERE birthYear > 1970 AND birthYear<=1980 AND HEIGHT>=180;

SELECT *
  FROM userTbl
    WHERE birthYear BETWEEN 1970 AND 1980 AND HEIGHT>=180;

--����⵵�� 1970�⵵ �����̰ų� Ű�� 182�̻��� ��� ��ȸ
SELECT *
  FROM userTbl
    WHERE birthYear >= 1970 OR height >= 182;

--����� �� ������ �泲,����,����� ����� ��ȸ
--[] = COLUMN �ǹ� , ���� ����� �ʿ�� ����
SELECT [name],userID,addr FROM userTbl
  WHERE addr ='�泲' OR addr ='���' OR addr ='����';

SELECT [name],userID,addr FROM userTbl
  WHERE addr IN ('�泲','����','���');

--LIKE�� = ���ڿ����� ���ϴ� ���ڿ��� �ִ� Ʃ�� �˻�(CONTAIN)
SELECT name,height,addr FROM userTbl
  WHERE name LIKE '��%';

SELECT name,height,addr FROM userTbl
  WHERE name LIKE '��______'; -- ��ĭ�� ���ڸ����� ���ܾ���

 --subquery
 SELECT * FROM userTbl
 WHERE height >175;

 --���ȣ���� Ű�� ū��� ��ȸ SUBQUERY
 SELECT * FROM userTbl
 WHERE height >(SELECT height FROM userTbl WHERE name='���ȣ');

 SELECT * FROM userTbl
 WHERE height > ANY (SELECT height FROM userTbl WHERE addr ='�泲');

 --IN == =ANY
 SELECT * FROM userTbl
 WHERE height IN (SELECT height FROM userTbl WHERE addr ='�泲');

 SELECT * FROM userTbl
 WHERE height = ANY (SELECT height FROM userTbl WHERE addr ='�泲');

 --ORDERBY ���� USERID(PK)�� �ڵ� �������� ���ĵȴ�
 SELECT * FROM userTbl 
 ORDER BY userID DESC;

 SELECT * FROM userTbl 
 ORDER BY  height DESC , name ASC; -- HEIGHT ������ ���� ���� ��� NAME���� ���Ľ�Ŵ

 SELECT * FROM userTbl
 ORDER BY mobile1 ASC, mobile2 DESC;

 SELECT COUNT(*) FROM userTbl;
 SELECT COUNT(*) FROM buyTbl;


 SELECT DISTINCT addr FROM userTbl;

--TOP
USE AdventureWorksLT2019;
GO

SELECT TOP 10 * FROM SalesLT.Customer;
SELECT TOP (10) * FROM SalesLT.Customer
WHERE Title = 'Ms.'
ORDER BY CustomerID DESC; 
--TOP�� SUBQUERY����!

--10%SAMPLING
SELECT * FROM SalesLT.Customer 
TABLESAMPLE (10 PERCENT);

SELECT * FROM SalesLT.Customer 
ORDER BY FirstName
OFFSET 5 ROW --�� �Ⱦ�
FETCH NEXT 3 ROWS ONLY; -- ���� ���ν���/�Լ� �Ҷ� ����ϰ� �ȴ�.