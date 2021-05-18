--�Ű����� PROC�ۼ�
CREATE PROC usp_users1
	--PARAMETER : declare�ʿ� x
	@userName NVARCHAR(10)
AS
	--LOGIC
	SELECT userID,name,birthYear FROM userTbl
	WHERE name = @userName;
GO

EXEC usp_users1 '���ð�'; --SPACEBAR �� �� �����Ͽ� ���� INPUT

SELECT * FROM v_userbuyInfo WHERE name = '���ð�'

--CREATE OR ALTER PROC/FUNC NAME : ����, ���� ���ÿ�
--PROC �Ǵ� ����� ���� �Լ� ������ �ٷ� �ݿ���
CREATE OR ALTER PROC usp_users2
	--PARAMETER : declare�ʿ� x
	@userBirthYear INT,
	@userHeight INT
AS
	--LOGIC
	SELECT userID,name,birthYear,height,mDate FROM userTbl
	WHERE birthYear >= @userBirthYear AND height >= @userHeight;
GO

EXEC usp_users2 1970,178; --���� 2�� �̻���ʹ� ','�� ���� �Է�
EXEC usp_users2 @userHeight = 178, @userBirthYear = 1970; --���� ��� ���� ��� ����

CREATE PROC usp_users3
	--PARAMETER : declare�ʿ� x
	@lastName NVARCHAR(2),
	@outCount INT OUTPUT --RETURN �޴� ����, ����� �޴� ����
AS
	--LOGIC
	SELECT @outCount = COUNT(*) -- OUTCOUNT�� COUNT(*)�� ����
	FROM userTbl
	WHERE name LIKE @lastName + '%'; --CONCAT�� ����
GO

SELECT COUNT(*) FROM userTbl WHERE name LIKE '��%';

DECLARE @myValue INT --���� ����
EXEC usp_users3 '��',@myValue OUTPUT; --������ ������ OUTPUT ������ �Է�

PRINT CONCAT('�达 ����� �� : ',@myValue);
