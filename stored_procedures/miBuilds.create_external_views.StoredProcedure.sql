USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[create_external_views]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [miBuilds].[create_external_views]
as

DECLARE @myCursor CURSOR
DECLARE @TableName NVARCHAR(50)
DECLARE @SQL NVARCHAR(MAX)


SET @myCursor = CURSOR FAST_FORWARD FOR
SELECT t.Name
FROM BI_MIP.sys.tables AS t
JOIN BI_MIP.sys.schemas AS s ON t.schema_id = s.schema_id
WHERE s.name = 'miBuilds'
	--and t.name like 'lk_%'
GROUP BY t.name

OPEN @myCursor
FETCH NEXT FROM @myCursor
INTO @TableName
WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @SQL =	'CREATE VIEW miBuilds_View.' + @TableName + ' AS SELECT * FROM miBuilds.' + @TableName + ' '
		PRINT @SQL
		EXECUTE (@SQL)

	FETCH NEXT FROM @myCursor
	INTO @TableName
	
	END

CLOSE @myCursor
DEALLOCATE @myCursor




GO
