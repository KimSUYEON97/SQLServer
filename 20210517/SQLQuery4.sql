--1���� 100���� ���� �ݺ��ϸ鼭 7�� ��� ���� �ջ��϶�
--GOTO�� ������� ����
DECLARE @I INT,@SUM BIGINT

SET @I = 0
SET @SUM = 0

WHILE @I <=100
	BEGIN
		IF @I % 7 = 0
			BEGIN
				PRINT CONCAT('7�� ��� : ',@I)
				SET @I = @I + 1 -- @I++
				CONTINUE
			END
		SET @SUM = @SUM + @I
		IF @SUM > 1000 
			BREAK
		SET @I = @I + 1 -- @I++
	END
PRINT CONCAT('1 ~ 100 �� : ',@SUM)
