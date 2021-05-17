--������ �ݾ׿� ���� �ֿ��/���/�Ϲ� ������ �з��ϴ� ����
--���� �Լ� �̿��� �������� ����GROUP BY�Ǿ�� �Ѵ�.
WITH CTE_CUSTLEVEL([�����ID],[ȸ����],[�� ���űݾ�],[�� ���])
AS(
SELECT U.userID AS '�����ID'
		,U.name AS 'ȸ����'
		, IIF (SUM(B.price*B.amount) IS NULL
				, 0
				, SUM(B.price*B.amount)) AS '�� ���Ű���' 
		,CASE
			WHEN SUM(B.price*B.amount) >= 1500 THEN '�ֿ��'
			WHEN SUM(B.price*B.amount) >= 1000 THEN '���'
			WHEN SUM(B.price*B.amount) >= 1 THEN '�Ϲ�'
			ELSE 'GHOST'
		END AS '�����'
FROM userTbl AS U
	LEFT OUTER JOIN buyTbl AS B
	ON U.userID = B.userID
GROUP BY U.userID,U.name
--ORDER BY SUM(B.price*B.amount) DESC --WITH CTE���� ��� �Ұ�
)

SELECT [�����ID],[ȸ����]
		--,FORMAT([�� ���űݾ�],'C4')-- \ OR $ ǥ��, C4 = ��ȭ����
		,FORMAT([�� ���űݾ�],'#,#')--õ���� ǥ��
		AS '�� ���Ű���' 
		,[�� ���]
FROM CTE_CUSTLEVEL
ORDER BY [�� ���űݾ�] DESC