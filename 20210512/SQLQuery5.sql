--DB ��ȸ
EXEC sp_helpdb;

--���̺� ���� ��ȸ
EXEC sp_tables;

EXEC sp_tables @table_type ="'TABLE'";--table type�� TABLE�ΰ͸�

--column ��ȸ
EXEC sp_columns @table_name='buyTbl', @table_owner ='dbo';