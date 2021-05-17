--TRAN 3번
BEGIN TRAN
UPDATE userTbl SET addr = '제주' WHERE userID='KBS'
COMMIT

BEGIN TRAN
UPDATE userTbl SET addr = '미국' WHERE userID='KKH'
ROLLBACK

BEGIN TRAN
UPDATE userTbl SET addr = '호주' WHERE userID='JYP'
COMMIT

SELECT * FROM userTbl;

--TRAN 1번
BEGIN TRAN
UPDATE userTbl SET addr = '뉴욕' WHERE userID='KBS'
UPDATE userTbl SET addr = '델리' WHERE userID='KKH'
UPDATE userTbl SET addr = '런던' WHERE userID='JYP'
--ROLLBACK
COMMIT


--TRAN 처리 순서 SIMULATION
USE sampleDB;
GO

CREATE TABLE testTbl2(num INT);
GO

INSERT INTO testTbl2 VALUES (1),(3),(5);


BEGIN TRAN
UPDATE testTbl2 SET num = 11 WHERE num = 1;--1 실행 중에 PROCESS종료(작업관리자. 세부정보. MSSQLSERVER 종료) -> 서비스 시작(IN SERVICE MSC) -> ROLLBACK 확인가능
UPDATE testTbl2 SET num = 33 WHERE num = 3;
UPDATE testTbl2 SET num = 55 WHERE num = 5;
COMMIT
ROLLBACK

SELECT * FROM testTbl2;

SELECT @@TRANCOUNT --TRAN 걸려있는 여부 확인