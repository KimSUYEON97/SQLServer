--TABLE ����
USE sampleDB;
GO

--DDL table����
CREATE TABLE ddlTbl
(
	ID INT NOT NULL PRIMARY KEY,
	name NVARCHAR(20) NOT NULL,
	regiDate DATETIME
);
GO

--DDL table ����
-- IDENTITY�� ALTER�� �Ұ��� , CREATE�� ����!
ALTER TABLE ddlTbl ADD newColumn VARCHAR(10) NOT NULL

DROP TABLE ddlTbl

--DDL table����
CREATE TABLE ddlTbl
(
	ID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	name NVARCHAR(20) NOT NULL,
	regiDate DATETIME
);
GO

