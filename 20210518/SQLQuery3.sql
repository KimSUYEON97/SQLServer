CREATE OR ALTER PROC usp_isyoung
	@userName NVARCHAR(10)
AS
	--DECLARE ����
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

EXEC usp_isyoung '�̽±�';

/*	���� ����
	public void usp_isyoung(string userName)
	{
		int bYear
		
		if (name = userName) bYear = birthYear
	}
*/