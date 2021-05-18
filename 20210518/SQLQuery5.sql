CREATE OR ALTER FUNCTION ufn_getAge(@bYear INT) -- c#�� ���� ���� ���
	RETURNS INT
AS
	BEGIN
		DECLARE @age INT
		SET @age = YEAR(GETDATE()) - @bYear
		RETURN (@age)
	END
GO

CREATE OR ALTER FUNCTION ufn_getInch(@height SMALLINT) -- c#�� ���� ���� ���
	RETURNS SMALLINT
AS
	BEGIN
		DECLARE @val INT
		SET @val = @height * 0.393 --��ġ ��ȯ
		RETURN (@val)
	END
GO

SELECT userID,name
		,birthYear
		,dbo.ufn_getZodiac(birthYear) AS '��'
		,dbo.ufn_getAge(birthYear) AS '����'
		--,addr,height
		,addr,height,dbo.ufn_getInch(height) AS 'Ű(inch)'
FROM userTbl