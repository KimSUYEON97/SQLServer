--����
USE sqlDB;
GO

SELECT * FROM userTbl;

SELECT *FROM userTbl
WHERE userID='BBK';

SELECT *FROM userTbl
WHERE name LIKE '��%';

-- ...

--SELECT INTO USERTBL_NEW TABLE���� ����(PK���� �̻���)
--SELECT *INTO userTBL_NEW FROM userTbl;

--SELECT userID , name,addr INTO userTBL_Backup FROM userTbl;

--SELECT userID , name,addr INTO userTBL_Backup2 FROM userTbl WHERE addr ='����';

--GROUP BY ���̵� ���� ���� �� ��� �� ��ȸ
SELECT userID, SUM(amount) AS '�� ���� ����' , SUM(amount*price) AS '�ѱ��űݾ�'
FROM buyTbl GROUP BY userID 
ORDER BY SUM(amount*price) DESC;

-- AS == []
SELECT AVG(price) AS [��ձ��űݾ�] FROM buyTbl;

--Űū ��� �������
SELECT name,height FROM userTbl 
WHERE height = (SELECT MAX(height) FROM userTbl)
OR height = (SELECT MIN(height) FROM userTbl);

--HAVING 
--�����Լ��� WHERE���� ���� �Ұ��� ONLY IN SELECT, HAVING��
SELECT userID AS '�����ID' ,SUM(price*amount) AS [�� ���űݾ�]
FROM buyTbl
GROUP BY userID
HAVING SUM(price*amount) >=1000;

--���
--����ڰ� ������ �׷캰�� �󸶸� �����ߴ��� ��ȸ
SELECT userID,groupName,SUM(price*amount) AS [�� ���űݾ�]
FROM buyTbl
GROUP BY groupName,userID; 

SELECT groupName,userID,SUM(price*amount) AS [�� ���űݾ�]
FROM buyTbl
GROUP BY ROLLUP (groupName),userID; 

--A
SELECT groupName,userID,SUM(price*amount) AS [�� ���űݾ�]
FROM buyTbl
GROUP BY ROLLUP (groupName,userID); --��ü ���űݾ��� �����

--B
SELECT groupName,SUM(price*amount) AS [�� ���űݾ�]
FROM buyTbl
GROUP BY groupName; -- ROLLUP ���� ��ü �հ� �����

--A+B ��� = CUBE
SELECT groupName,userID,SUM(price*amount) AS [�� ���űݾ�]
FROM buyTbl
GROUP BY CUBE (groupName,userID);

SELECT groupName,SUM(price*amount) AS [�� ���űݾ�], GROUPING_ID(groupName) AS 'SUM'
FROM buyTbl
GROUP BY ROLLUP (groupName);