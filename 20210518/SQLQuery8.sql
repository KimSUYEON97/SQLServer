--입력한 출생년도 이후 사용자 중 구매등급에 따라 결과 반환
CREATE OR ALTER FUNCTION ufn_userGrade(@bYear INT)
	RETURNS @returnTable TABLE --returnTable이라는 Table을 생성 후 반환하고 버린다.
	(
		userID VARCHAR(8), name NVARCHAR(10), grade NVARCHAR(5)
	)
AS
	--N 줄 입력시 BEGIN,END
	BEGIN
		DECLARE @rowCount INT
		SELECT @rowCount = COUNT(*) FROM userTbl WHERE birthYear >= @bYear

		IF @rowCount <= 0
			BEGIN
				INSERT INTO @returnTable VALUES ('NULL','NULL','NULL');
				RETURN
			END
		ELSE --안써도 됨
			BEGIN
				--입력구문
				INSERT INTO @returnTable
					SELECT U.userID,U.name,
						CASE
							WHEN SUM(B.price*B.amount) >= 1500 THEN '최우수'
							WHEN SUM(B.price*B.amount) >= 1000 THEN '우수'
							WHEN SUM(B.price*B.amount) >= 1 THEN '일반'
							ELSE '유령'
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