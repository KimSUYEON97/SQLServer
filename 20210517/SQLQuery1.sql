--SQL programming
DECLARE @VAR1 INT --변수선언

SET @VAR1 = 100

IF @VAR1 = 100
	BEGIN
		PRINT '@VAR1 IS 100'
	END
ELSE
	BEGIN
		PRINT '@VAR IS NOT 100'                                                      
	END

--ELSE IF
DECLARE @VAR2 INT --변수선언

SET @VAR2 = 169

IF @VAR2 < 170
	BEGIN
		PRINT 'LOWER THEN 170'
	END
ELSE IF @VAR2 =170
	BEGIN
		SELECT * FROM userTbl WHERE height = @VAR2;      
	END
ELSE
	BEGIN
		SELECT * FROM userTbl WHERE height > @VAR2;                                                   
	END