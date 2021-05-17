USE sampleDB
GO

CREATE TABLE userTbl
(
	userID CHAR(8) NOT NULL PRIMARY KEY
	,name NVARCHAR(10) NOT NULL
	,birthYear INT NOT NULL
	,height SMALLINT
);

CREATE TABLE buyTbl
(
	num INT NOT NULL PRIMARY KEY
	,userID CHAR(8) NOT NULL 
		FOREIGN KEY REFERENCES userTbl(userID)--RDB,relational
	,prodName NCHAR(6) NOT NULL
	,price INT NOT NULL
);
GO

--1개 이상 pk지정
CREATE TABLE prodTbl
(
	/*prodCode NCHAR(3) NOT NULL PRIMARY KEY,
	prodID NCHAR(4) NOT NULL PRIMARY KEY,--ERROR*/
	prodCode NCHAR(3) NOT NULL,
	prodID NCHAR(4) NOT NULL,
	prodDate DATETIME NOT NULL,
	prodCur NCHAR(10) NULL,
	CONSTRAINT PK_prodTbl_prodCode_prodID --PK명
		PRIMARY KEY(prodCode,prodID)
);
GO


ALTER TABLE userTbl
	ADD email VARCHAR(50) NULL UNIQUE;

ALTER TABLE userTbl
	ADD CONSTRAINT UK_EMAIL UNIQUE(email)

--CHECK <- 객체지향의 get set 과 비슷
ALTER TABLE userTbl
	ADD CONSTRAINT CK_birthYear
	CHECK (birthYear >= 1900 AND birthYear <= YEAR(GETdATE()))
	--2021까지