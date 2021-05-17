--CASE WHEN THEN , IF문 대체 가능
DECLARE @POINT INT,@CREDIT CHAR(1)

SET @POINT = 100

--SELECT, TABLE형태로 출력 -- PRINT 가능
SET @CREDIT =
CASE --SELECT가 없으면 실행되지 않는다.
	WHEN @POINT >= 90 THEN 'A'
	WHEN @POINT >= 80 THEN 'B'
	WHEN @POINT >= 70 THEN 'C'
	WHEN @POINT >= 60 THEN 'D'
	ELSE 'F'
END;

PRINT CONCAT('취득점수 : ', @POINT) --CONCAT로 POINT 형변환 필요 없음
PRINT CONCAT('GRADE : ', @CREDIT) --CONCAT사용안할경우 '문자열' + 형변환(변수) 사용