--UPDATE

--TRANSACTION START
--BEGIN TRANSACTION;
BEGIN TRAN;

UPDATE testTbl
  SET userName = '�����'
  WHERE ID = 2; 

UPDATE testTbl
  SET userName = '��׸�'
      ,addr ='�λ�'
  WHERE ID = 4;

SELECT * FROM testTbl;

COMMIT;
ROLLBACK;

--�����ϴ� ������ ���θ� �����ϰ� index �ʱ�ȭ 1
TRUNCATE TABLE testTbl;