CREATE OR ALTER FUNCTION ufn_getAge(@bYear INT) -- c#과 같은 선언 방법
	RETURNS INT
AS
	BEGIN
		DECLARE @age INT
		SET @age = YEAR(GETDATE()) - @bYear
		RETURN (@age)
	END
GO

CREATE OR ALTER FUNCTION ufn_getInch(@height SMALLINT) -- c#과 같은 선언 방법
	RETURNS SMALLINT
AS
	BEGIN
		DECLARE @val INT
		SET @val = @height * 0.393 --인치 변환
		RETURN (@val)
	END
GO

SELECT userID,name
		,birthYear
		,dbo.ufn_getZodiac(birthYear) AS '띠'
		,dbo.ufn_getAge(birthYear) AS '나이'
		--,addr,height
		,addr,height,dbo.ufn_getInch(height) AS '키(inch)'
FROM userTbl