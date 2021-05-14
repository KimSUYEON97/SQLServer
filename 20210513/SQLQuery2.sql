--WITH CTE (COLUMN��) : CTE = COMMON TABLE EXPRESSION

--�������CTE
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
--SELECT * FROM CTE_SUMMARY;
--SELECT GRP,SUMM,DIV FROM CTE_SUMMARY;
SELECT
      IIF(DIV =0,GRP,'���հ�') AS [��ǰ�׷�2]
      ,CASE DIV
	  WHEN 0 THEN GRP
	  WHEN 1 THEN '���հ�' END AS [��ǰ�׷�] -- CASE ~ [��ǰ�׷�] == IIF(DIV =0,GRP,'���հ�') AS[��ǰ�׷�2]
	  ,SUMM AS [�׷캰���űݾ�]
	  ,DIV
	FROM CTE_SUMMARY;