--WITH CTE (COLUMN명) : CTE = COMMON TABLE EXPRESSION

--비재귀적CTE
WITH CTE_SUMMARY(GRP,SUMM,DIV)
AS
(
	--GROUP BY ROLLUP
	(SELECT groupName AS GRP
		,SUM(price*amount) AS SUMM
		,GROUPING_ID(groupName) AS DIV -- 기존에 존재했던 DATA(0)인지 유추되어 나온 합계 DATA(1)인지 파악 위한 구분자
	FROM buyTbl
	GROUP BY ROLLUP(groupName))
)
--SELECT * FROM CTE_SUMMARY;
--SELECT GRP,SUMM,DIV FROM CTE_SUMMARY;
SELECT
      IIF(DIV =0,GRP,'총합계') AS [상품그룹2]
      ,CASE DIV
	  WHEN 0 THEN GRP
	  WHEN 1 THEN '총합계' END AS [상품그룹] -- CASE ~ [상품그룹] == IIF(DIV =0,GRP,'총합계') AS[상품그룹2]
	  ,SUMM AS [그룹별구매금액]
	  ,DIV
	FROM CTE_SUMMARY;