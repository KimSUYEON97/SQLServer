--CASE WHEN THEN , IF�� ��ü ����
DECLARE @POINT INT,@CREDIT CHAR(1)

SET @POINT = 100

--SELECT, TABLE���·� ��� -- PRINT ����
SET @CREDIT =
CASE --SELECT�� ������ ������� �ʴ´�.
	WHEN @POINT >= 90 THEN 'A'
	WHEN @POINT >= 80 THEN 'B'
	WHEN @POINT >= 70 THEN 'C'
	WHEN @POINT >= 60 THEN 'D'
	ELSE 'F'
END;

PRINT CONCAT('������� : ', @POINT) --CONCAT�� POINT ����ȯ �ʿ� ����
PRINT CONCAT('GRADE : ', @CREDIT) --CONCAT�����Ұ�� '���ڿ�' + ����ȯ(����) ���