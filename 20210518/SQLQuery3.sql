CREATE OR ALTER PROC usp_isyoung
	@userName NVARCHAR(10)
AS
	--DECLARE 가능
	DECLARE @bYear INT
	
	SELECT @bYear = birthYear FROM userTbl
	WHERE name = @userName;

	IF @bYear >=1980
		BEGIN
			PRINT 'STILL YOUNG'
		END
	ELSE
		BEGIN
			PRINT 'OLD PERSON!'
		END
GO

EXEC usp_isyoung '이승기';

/*	동일 구문
	public void usp_isyoung(string userName)
	{
		int bYear
		
		if (name = userName) bYear = birthYear
	}
*/