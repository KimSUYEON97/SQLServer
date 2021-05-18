--�Է��� ����⵵ ���� ����� �� ���ŵ�޿� ���� ��� ��ȯ
CREATE OR ALTER FUNCTION ufn_userGrade(@bYear INT)
	RETURNS @returnTable TABLE --returnTable�̶�� Table�� ���� �� ��ȯ�ϰ� ������.
	(
		userID VARCHAR(8), name NVARCHAR(10), grade NVARCHAR(5)
	)
AS
	--N �� �Է½� BEGIN,END
	BEGIN
		DECLARE @rowCount INT
		SELECT @rowCount = COUNT(*) FROM userTbl WHERE birthYear >= @bYear

		IF @rowCount <= 0
			BEGIN
				INSERT INTO @returnTable VALUES ('NULL','NULL','NULL');
				RETURN
			END
		ELSE --�Ƚᵵ ��
			BEGIN
				--�Է±���
				INSERT INTO @returnTable
					SELECT U.userID,U.name,
						CASE
							WHEN SUM(B.price*B.amount) >= 1500 THEN '�ֿ��'
							WHEN SUM(B.price*B.amount) >= 1000 THEN '���'
							WHEN SUM(B.price*B.amount) >= 1 THEN '�Ϲ�'
							ELSE '����'
						END
					FROM userTbl AS U
						LEFT OUTER JOIN buyTbl AS B ON U.userID = B.userID
					WHERE U.birthYear >= @bYear
					GROUP BY U.userID,U.name;
				RETURN;
			END
		RETURN;
	END
GO

SELECT * FROM dbo.ufn_userGrade(1970);
SELECT * FROM dbo.ufn_userGrade(1990);
SELECT * FROM dbo.ufn_userGrade(1999);