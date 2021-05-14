--�ý����Լ�
SELECT MIN(price) FROM buyTbl;
SELECT MAX(price) FROM buyTbl;

SELECT AVG(CAST(amount AS float)) FROM buyTbl;
SELECT CAST(AVG(CAST(amount AS float)) AS DECIMAL(4,3)) FROM buyTbl;

SELECT AVG(CONVERT(FLOAT,amount)) FROM buyTbl;
SELECT AVG(TRY_CONVERT(FLOAT,amount)) FROM buyTbl;

--SELECT PARSE('3.14' AS INT);--���� �߻��� ���� ������ ����
SELECT TRY_PARSE('3.14' AS INT);--�� ��ȯ �ȵ� ��� NULL�� ��ü -> ���� ����

SELECT name,height FROM userTbl
WHERE height IS NULL;


SELECT name,height FROM userTbl
WHERE height IS NOT NULL;

--HEIGHT ==SMALL INT --> VARCHAR, CHAR CAST����
SELECT name,CAST(height AS varchar)+'CM' FROM userTbl
WHERE height IS NOT NULL;

SELECT PARSE('2021�� 5�� 14�� 10�� 27��' AS DATETIME);
SELECT PARSE('2021-05-04 10:28:10' AS DATETIME);

SELECT GETDATE();--ORACLE���� ���� -- INSERT ���� ����Ͻú��� ���� ���� ���

SELECT @@SERVERNAME;
SELECT @@SERVICENAME;
SELECT @@VERSION;

--��¥ �� �ð��Լ�
SELECT YEAR(GETDATE()) AS '����⵵';
SELECT MONTH(GETDATE()) AS '�����';
SELECT DAY(GETDATE()) AS '����';

--��ġ�Լ�
SELECT ABS(-100);
SELECT ROUND(3.141592,2);
SELECT FLOOR(RAND()*100);--����

-- ���Լ� 
SELECT IIF(100 > 200, '��', '����');
WITH CTE_SUMMARY(GRP,SUMM,DIV)
AS
(
	--GROUP BY ROLLUP
	(SELECT groupName AS GRP
		,SUM(price*amount) AS SUMM
		,GROUPING_ID(groupName) AS DIV -- ������ �����ߴ� DATA(0)���� ���ߵǾ� ���� �հ� DATA(1)���� �ľ� ���� ������
	FROM buyTbl
	GROUP BY ROLLUP(groupName))
)
SELECT
IIF(DIV =0,GRP,'���հ�') AS [��ǰ�׷�]
	FROM CTE_SUMMARY;