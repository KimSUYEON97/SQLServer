--TRAN 3��
BEGIN TRAN
UPDATE userTbl SET addr = '����' WHERE userID='KBS'
COMMIT

BEGIN TRAN
UPDATE userTbl SET addr = '�̱�' WHERE userID='KKH'
ROLLBACK

BEGIN TRAN
UPDATE userTbl SET addr = 'ȣ��' WHERE userID='JYP'
COMMIT

SELECT * FROM userTbl;

--TRAN 1��
BEGIN TRAN
UPDATE userTbl SET addr = '����' WHERE userID='KBS'
UPDATE userTbl SET addr = '����' WHERE userID='KKH'
UPDATE userTbl SET addr = '����' WHERE userID='JYP'
--ROLLBACK
COMMIT


--TRAN ó�� ���� SIMULATION
USE sampleDB;
GO

CREATE TABLE testTbl2(num INT);
GO

INSERT INTO testTbl2 VALUES (1),(3),(5);


BEGIN TRAN
UPDATE testTbl2 SET num = 11 WHERE num = 1;--1 ���� �߿� PROCESS����(�۾�������. ��������. MSSQLSERVER ����) -> ���� ����(IN SERVICE MSC) -> ROLLBACK Ȯ�ΰ���
UPDATE testTbl2 SET num = 33 WHERE num = 3;
UPDATE testTbl2 SET num = 55 WHERE num = 5;
COMMIT
ROLLBACK

SELECT * FROM testTbl2;

SELECT @@TRANCOUNT --TRAN �ɷ��ִ� ���� Ȯ��