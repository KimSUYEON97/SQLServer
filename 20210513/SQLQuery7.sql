--programming start

--변수 선언 DECLARE @변수명 데이터 형식
DECLARE @varAge INT; -- 스칼라 변수 선언
SET @varAge = 44;

SELECT @varAge AS '나이';
--PRINT @varAge;