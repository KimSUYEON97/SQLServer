--table��ȯ �Լ�
CREATE OR ALTER FUNCTION ufn_getUsers(@height SMALLINT)
	RETURNS TABLE
AS
	--INLINE�Լ��� TABLE�� ��ȯ�� BEGIN,END �ʿ� ����
	RETURN
	(
		SELECT * FROM userTbl
		WHERE height > @height
	)
GO

--EXEC dbo.ufn_getUsers 170;
--���� �Լ��� EXEC������� �ʴ´�.
--SELECT�� �Լ� ȣ��
SELECT * FROM dbo.ufn_getUsers(180);