--���ڿ��Լ�
SELECT ASCII('+'), CHAR(47); --���� LOW
SELECT UNICODE('��'),NCHAR(44035); --�Ϻ���,�߱��� ���� 

--���ڿ� ����
SELECT CONCAT('SQL ', 'SERVER ',2019) AS [NAME]; --���� HIGH

SELECT 'SQL ' + 'SERVER ' + CAST(2019 AS varchar);

--�ܾ������ġ 1����!
SELECT CHARINDEX('W','HELLO WORLD!');


SELECT LEFT('SQL SERVER 2019',3);--���ʺ��� 3�ڸ�
SELECT RIGHT('SQL SERVER 2019',4);

DECLARE @STR VARCHAR(20);
SET @STR = 'SQL SERVER 2019';
SELECT LEFT(@STR,3),RIGHT(@STR,4);

SELECT SUBSTRING('���ѹα�����',5,2);--���ڿ� �ڸ��� 5���� 2�ڸ�
SELECT LEN('HELLO WORLD!');
SELECT LOWER('hELLO wOrLD!');
SELECT UPPER('hELLO wOrLD!');

SELECT '   SQL',LTRIM('   SQL');--���� ���� ���� MIDDLE
SELECT '   SQL    ',RTRIM('   SQL    ');--MIDDLE
SELECT '   SQL    ',TRIM('   SQL    ');--HIGH

--SUPERHIGH ��
SELECT REPLACE('SQL SERVER 2019, SERVER ����', 'SERVER','����');

--HIGH��
SELECT STR(3.1415);
SELECT STR(45);

--HIGH��
SELECT GETDATE();
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss'); -- �ѱ���
SELECT FORMAT(GETDATE(), 'MM/dd/yyyy hh:mm:ss'); -- �̱���