--1부터 100까지 수를 반복하면서 7의 배수 제외 합산하라
--GOTO는 사용하지 말것
DECLARE @I INT,@SUM BIGINT

SET @I = 0
SET @SUM = 0

WHILE @I <=100
	BEGIN
		IF @I % 7 = 0
			BEGIN
				PRINT CONCAT('7의 배수 : ',@I)
				SET @I = @I + 1 -- @I++
				CONTINUE
			END
		SET @SUM = @SUM + @I
		IF @SUM > 1000 
			BREAK
		SET @I = @I + 1 -- @I++
	END
PRINT CONCAT('1 ~ 100 합 : ',@SUM)
