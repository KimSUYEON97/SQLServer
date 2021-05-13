--UPDATE

--TRANSACTION START
--BEGIN TRANSACTION;
BEGIN TRAN;

UPDATE testTbl
  SET userName = '성명건'
  WHERE ID = 2; 

UPDATE testTbl
  SET userName = '김네모'
      ,addr ='부산'
  WHERE ID = 4;

SELECT * FROM testTbl;

COMMIT;
ROLLBACK;

--존재하는 데이터 전부를 삭제하고 index 초기화 1
TRUNCATE TABLE testTbl;