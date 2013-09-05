CREATE DATABASE [SlowTest] ON  PRIMARY 
( NAME = N'SlowTest', FILENAME = N'E:\MSSQL\DATA\SlowTest.mdf' , SIZE = 3MB , FILEGROWTH = 64KB )
 LOG ON 
( NAME = N'SlowTest_log', FILENAME = N'E:\MSSQL\DATA\SlowTest_log.ldf' , SIZE = 512KB , FILEGROWTH = 64KB)
GO

USE SlowTest;
GO
CREATE TABLE dbo.UglyDesign (ID INT IDENTITY(1,1) PRIMARY KEY CLUSTERED, MyField CHAR(5000));
GO
INSERT INTO dbo.UglyDesign (MyField)
SELECT collation_name
FROM sys.all_columns
GO 100

DROP TABLE dbo.UglyDesign
GO

USE master;
GO
DROP DATABASE SlowTest;
GO
