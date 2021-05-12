--DB 조회
EXEC sp_helpdb;

--테이블 정보 조회
EXEC sp_tables;

EXEC sp_tables @table_type ="'TABLE'";--table type이 TABLE인것만

--column 조회
EXEC sp_columns @table_name='buyTbl', @table_owner ='dbo';