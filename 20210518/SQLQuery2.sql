--매개변수 PROC작성
CREATE PROC usp_users1
	--PARAMETER : declare필요 x
	@userName NVARCHAR(10)
AS
	--LOGIC
	SELECT userID,name,birthYear FROM userTbl
	WHERE name = @userName;
GO

EXEC usp_users1 '성시경'; --SPACEBAR 후 값 나열하여 변수 INPUT

SELECT * FROM v_userbuyInfo WHERE name = '성시경'

--CREATE OR ALTER PROC/FUNC NAME : 생성, 수정 동시에
--PROC 또는 사용자 정의 함수 수정시 바로 반영됨
CREATE OR ALTER PROC usp_users2
	--PARAMETER : declare필요 x
	@userBirthYear INT,
	@userHeight INT
AS
	--LOGIC
	SELECT userID,name,birthYear,height,mDate FROM userTbl
	WHERE birthYear >= @userBirthYear AND height >= @userHeight;
GO

EXEC usp_users2 1970,178; --변수 2개 이상부터는 ','로 구분 입력
EXEC usp_users2 @userHeight = 178, @userBirthYear = 1970; --동일 결과 거의 사용 안함

CREATE PROC usp_users3
	--PARAMETER : declare필요 x
	@lastName NVARCHAR(2),
	@outCount INT OUTPUT --RETURN 받는 변수, 결과값 받는 역할
AS
	--LOGIC
	SELECT @outCount = COUNT(*) -- OUTCOUNT에 COUNT(*)값 대입
	FROM userTbl
	WHERE name LIKE @lastName + '%'; --CONCAT도 가능
GO

SELECT COUNT(*) FROM userTbl WHERE name LIKE '김%';

DECLARE @myValue INT --변수 설정
EXEC usp_users3 '김',@myValue OUTPUT; --설정한 변수를 OUTPUT 변수로 입력

PRINT CONCAT('김씨 사용자 수 : ',@myValue);
