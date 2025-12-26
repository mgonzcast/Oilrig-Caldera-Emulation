CREATE DATABASE sitedata
GO
USE sitedata

DECLARE @sql NVARCHAR(MAX)
DECLARE @filePath NVARCHAR(MAX) = 'E:\sqlserver2019\minfac.csv'
DECLARE @tableName NVARCHAR(MAX) = 'minfac'
DECLARE @colString NVARCHAR(MAX)

SET @sql = 'SELECT @res = LEFT(BulkColumn, CHARINDEX(CHAR(10),BulkColumn)) FROM  OPENROWSET(BULK ''' + @filePath + ''', SINGLE_CLOB) AS x'
exec sp_executesql @sql, N'@res NVARCHAR(MAX) output', @colString output;

SELECT @sql = 'DROP TABLE IF EXISTS ' + @tableName + ';  CREATE TABLE [dbo].[' + @tableName + ']( ' + STRING_AGG(name, ', ') + ' ) '
FROM (
    SELECT ' [' + value + '] nvarchar(max) ' as name
    FROM STRING_SPLIT(@colString, ',')
) t

EXECUTE(@sql)