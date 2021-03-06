USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_business_case_undelete_update]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[ajax_business_case_undelete_update] 
		@probuild_id NVARCHAR(25)
AS

DECLARE @myCursor CURSOR
DECLARE @DbName NVARCHAR(50)
DECLARE @SchemaName NVARCHAR(50)
DECLARE @TableName NVARCHAR(50)
DECLARE @SQL NVARCHAR(MAX)

SET @DbName = 'BI_MIP'
SET @SchemaName = 'miBuilds'

SET @myCursor = CURSOR FAST_FORWARD FOR
SELECT t.Name
FROM BI_MIP.sys.tables AS t
JOIN BI_MIP.sys.schemas AS s ON t.schema_id = s.schema_id
WHERE s.name = 'miBuilds'
	and (t.name like 'app_%'
		or t.name like 'rpt_%')
GROUP BY t.name

OPEN @myCursor
FETCH NEXT FROM @myCursor
INTO @TableName
WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @SQL =	'UPDATE	a 
					SET		Deleted = NULL
							,DeletedBy = NULL
							,DeletedOn = NULL
					FROM	' + @DbName + '.' + @SchemaName + '.' + @TableName + ' as a 
					WHERE	Probuild_Id IN (' + @probuild_id + ')'
		--PRINT @SQL
		EXECUTE (@SQL)


	FETCH NEXT FROM @myCursor
	INTO @TableName
	
	END

CLOSE @myCursor
DEALLOCATE @myCursor
GO
