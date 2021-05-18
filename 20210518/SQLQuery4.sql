CREATE OR ALTER PROC usp_ziodiac
	@userName NVARCHAR(10)
AS
	DECLARE @bYear INT
	DECLARE @zodiac NVARCHAR(10) --띠 이름 변수
	SELECT @bYear = birthYear FROM userTbl
	WHERE name = @userName;

	SET @zodiac = 
		CASE 
			WHEN (@bYear%12 = 0) THEN '원숭이'--신
			WHEN (@bYear%12 = 1) THEN '닭'--유
			WHEN (@bYear%12 = 2) THEN '개'--술
			WHEN (@bYear%12 = 3) THEN '돼지'--해
			WHEN (@bYear%12 = 4) THEN '쥐' --자
			WHEN (@bYear%12 = 5) THEN '소'--축
			WHEN (@bYear%12 = 6) THEN '호랑이'--인
			WHEN (@bYear%12 = 7) THEN '토끼'--묘
			WHEN (@bYear%12 = 8) THEN '용'--진
			WHEN (@bYear%12 = 9) THEN '뱀'--사
			WHEN (@bYear%12 = 10) THEN '말'--오
			ELSE '양'--미
		END
	PRINT CONCAT(@userName, '(',@bYear,')의 띠는 ',@zodiac,'입니다.')
GO

EXEC usp_ziodiac '성시경'
EXEC usp_ziodiac '이승기'

--시스템 저장 프로시져 : sp로 작성되어있다.
--SQL server관리와 관련 작업 위해 사용
EXEC sp_databases
EXEC sp_tables 'userTbl','dbo'

