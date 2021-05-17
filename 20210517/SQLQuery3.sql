--구매한 금액에 따라서 최우수/우수/일반 고객으로 분류하는 쿼리
--집계 함수 이외의 변수들은 전부GROUP BY되어야 한다.
WITH CTE_CUSTLEVEL([사용자ID],[회원명],[총 구매금액],[고객 등급])
AS(
SELECT U.userID AS '사용자ID'
		,U.name AS '회원명'
		, IIF (SUM(B.price*B.amount) IS NULL
				, 0
				, SUM(B.price*B.amount)) AS '총 구매가격' 
		,CASE
			WHEN SUM(B.price*B.amount) >= 1500 THEN '최우수'
			WHEN SUM(B.price*B.amount) >= 1000 THEN '우수'
			WHEN SUM(B.price*B.amount) >= 1 THEN '일반'
			ELSE 'GHOST'
		END AS '고객등급'
FROM userTbl AS U
	LEFT OUTER JOIN buyTbl AS B
	ON U.userID = B.userID
GROUP BY U.userID,U.name
--ORDER BY SUM(B.price*B.amount) DESC --WITH CTE에서 사용 불가
)

SELECT [사용자ID],[회원명]
		--,FORMAT([총 구매금액],'C4')-- \ OR $ 표시, C4 = 통화단위
		,FORMAT([총 구매금액],'#,#')--천단위 표시
		AS '총 구매가격' 
		,[고객 등급]
FROM CTE_CUSTLEVEL
ORDER BY [총 구매금액] DESC