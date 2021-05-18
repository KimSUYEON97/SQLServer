SELECT PC.ProductCategoryID
		,PC.Name
FROM SalesLT.ProductCategory AS PC

--DATA 295개 inner
SELECT PD.Name AS product_Name,PD.ProductNumber
		,PD.Color,PD.StandardCost
		,PD.ListPrice,PD.Size,PD.Weight
		,PC.ProductCategoryID,PC.Name AS category_Name
FROM SalesLT.Product AS PD
	INNER JOIN SalesLT.ProductCategory AS PC
		ON PD.ProductCategoryID = PC.ProductCategoryID

--DATA 299개 OUTER = NULL 4개!
SELECT PD.Name AS product_Name,PD.ProductNumber
		,PD.Color,PD.StandardCost
		,PD.ListPrice,PD.Size,PD.Weight
		,PC.Name AS category_Name
FROM SalesLT.Product AS PD
	RIGHT OUTER JOIN SalesLT.ProductCategory AS PC
		ON PD.ProductCategoryID = PC.ProductCategoryID

--CUSTOMER 847개 ADDRESS 450개 CUSTOMERADDRESS 417개
SELECT * FROM SalesLT.Customer AS C
SELECT * FROM SalesLT.Address AS AD
SELECT * FROM SalesLT.CustomerAddress AS CA

--1
SELECT C.CustomerID
		,CONCAT(C.Title,' ',C.FirstName,' ',C.MiddleName,' ',C.LastName)AS FullName
		,C.CompanyName,C.EmailAddress,C.Phone
FROM SalesLT.Customer AS C
--2
SELECT AD.AddressID, AD.PostalCode
		,CONCAT(AD.AddressLine1,' ',AD.AddressLine2,', ',AD.City,', ',AD.StateProvince) AS addr
		,AD.CountryRegion AS Country
FROM SalesLT.Address AS AD
--3
SELECT CA.CustomerID,CA.AddressID,CA.AddressType
FROM SalesLT.CustomerAddress AS CA

--1,3,2 JOIN
--DATA 417명
SELECT C.CustomerID
		,CONCAT(C.Title,' ',C.FirstName,' ',C.MiddleName,' ',C.LastName)AS FullName
		,C.CompanyName,C.EmailAddress,C.Phone
		,CA.AddressType
		,AD.AddressID, AD.PostalCode
		,CONCAT(AD.AddressLine1,' ',AD.AddressLine2,', ',AD.City,', ',AD.StateProvince) AS addr
		,AD.CountryRegion AS Country
FROM SalesLT.Customer AS C
	INNER JOIN SalesLT.CustomerAddress AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN SalesLT.Address AS AD
		ON AD.AddressID = CA.AddressID

--DATA 857명
SELECT C.CustomerID
		,CONCAT(C.Title,' ',C.FirstName,' ',C.MiddleName,' ',C.LastName)AS FullName
		,C.CompanyName,C.EmailAddress,C.Phone
		,CA.AddressType
		,AD.AddressID, AD.PostalCode
		,CONCAT(AD.AddressLine1,' ',AD.AddressLine2,', ',AD.City,', ',AD.StateProvince) AS addr
		,AD.CountryRegion AS Country
FROM SalesLT.Customer AS C
	LEFT OUTER JOIN SalesLT.CustomerAddress AS CA
		ON C.CustomerID = CA.CustomerID
	LEFT OUTER JOIN SalesLT.Address AS AD
		ON AD.AddressID = CA.AddressID