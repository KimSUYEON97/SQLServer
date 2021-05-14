--CROSSJOIN

SELECT * FROM userTbl CROSS JOIN buyTbl;

--UNION����
SELECT StdName,Region FROM stdTbl
UNION 
SELECT ClubName,ClubRoom FROM clubTbl;

--Data type ��ġ�ؾ� union����
SELECT CAST(ID AS VARCHAR),StdID FROM regiInfoTbl
UNION --�ߺ�����
SELECT ClubName,ClubRoom FROM clubTbl;

SELECT StdName,Region  FROM stdTbl
UNION ALL --�ߺ� ���
SELECT StdName,Region FROM stdTbl;

--except
SELECT name, CONCAT(mobile1,mobile2) as mobile FROM userTbl
EXCEPT
SELECT name, CONCAT(mobile1,mobile2) as mobile FROM userTbl
WHERE mobile1 is not null;

--�� ���̺� ���� �����Ǵ� ������ ���� 
SELECT name, CONCAT(mobile1,mobile2) as mobile FROM userTbl
INTERSECT
SELECT name, CONCAT(mobile1,mobile2) as mobile FROM userTbl
WHERE mobile1 is not null;