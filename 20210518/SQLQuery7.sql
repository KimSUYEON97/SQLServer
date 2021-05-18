--table반환 함수
CREATE OR ALTER FUNCTION ufn_getUsers(@height SMALLINT)
	RETURNS TABLE
AS
	--INLINE함수의 TABLE만 반환시 BEGIN,END 필요 없음
	RETURN
	(
		SELECT * FROM userTbl
		WHERE height > @height
	)
GO

--EXEC dbo.ufn_getUsers 170;
--보통 함수는 EXEC사용하지 않는다.
--SELECT로 함수 호출
SELECT * FROM dbo.ufn_getUsers(180);