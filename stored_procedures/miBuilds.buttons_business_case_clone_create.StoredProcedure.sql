USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[buttons_business_case_clone_create]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[buttons_business_case_clone_create] 
		@probuild_id NVARCHAR(25),
		@clonedby NVARCHAR(25)
AS

DECLARE @myCursor CURSOR
DECLARE @DbName NVARCHAR(50)
DECLARE @SchemaName NVARCHAR(50)
DECLARE @TableName NVARCHAR(50)
DECLARE @TablePK NVARCHAR(50)
DECLARE @Clones int
DECLARE @ProbuildName NVARCHAR(255)
DECLARE @ClonedName NVARCHAR(255)
DECLARE @CloneId NVARCHAR(50)
DECLARE @SQL NVARCHAR(MAX)

---- Set the clone variables based off of the probuild_id from the app
SET @Clones = (SELECT COUNT(1) FROM BI_MIP.miBuilds.app_Probuild WHERE Parent_Probuild_Id = @probuild_id AND ISNULL(Child, 0) = 0) + 1
SET @ProbuildName = (SELECT Name FROM BI_MIP.miBuilds.app_Probuild WHERE Probuild_Id = @probuild_id)
SET @ClonedName = @ProbuildName + ' - Clone ' + CAST(@Clones as NVARCHAR(50))

SELECT @ClonedName as Cloned_Name

SET @myCursor = CURSOR FAST_FORWARD FOR
SELECT tbl_DB, tbl_Schema, tbl_Name, tbl_PK
FROM BI_MIP.miBuilds.xref_Clone_Probuild_Tables AS t
ORDER BY Record_Id

OPEN @myCursor
FETCH NEXT FROM @myCursor
INTO @DbName, @SchemaName, @TableName, @TablePK
WHILE @@FETCH_STATUS = 0
	BEGIN
		---- If table is Probuild, then create a clone with a ClonedName and who cloned it. Set Parent_Probuild_Id
		IF @TableName = 'app_Probuild'
			BEGIN
				SET @SQL = 'SECT NOCOUNT ON; '
				--- Drop temp table
				SET @SQL = 'IF OBJECT_ID(''tempdb..#z'') IS NOT NULL DROP TABLE #z '
				--- Insert values into temp table
				SET @SQL = @SQL + 'SELECT * INTO #z FROM ' + @DbName + '.' + @SchemaName + '.' + @TableName + ' WHERE Probuild_Id = ' + @probuild_id + ' '
				--- Update Name to ClonedName
				SET @SQL = @SQL + 'UPDATE #z SET Name = ''' + @ClonedName + ''' '
				--- Update Parent_Probuild_Id to CloneID
				SET @SQL = @SQL + 'UPDATE #z SET Parent_Probuild_Id = ' + @probuild_id + ' '
				--- Update Cloned value to 1
				SET @SQL = @SQL + 'UPDATE #z SET Cloned = 1 '
				--- Update Cloned on to current date/time
				SET @SQL = @SQL + 'UPDATE #z SET ClonedOn = GETDATE() '
				--- Update ClonedBy to App variable
				SET @SQL = @SQL + 'UPDATE #z SET ClonedBy = ''' + @clonedby + ''' '
				--- Drop PK column from temp table because it can't be inserted
				SET @SQL = @SQL + 'ALTER TABLE #z DROP COLUMN ' + @TablePK + ' '
				--- Insert values into main table
				SET @SQL = @SQL + 'INSERT INTO ' + @DbName + '.' + @SchemaName + '.' + @TableName + ' SELECT * FROM #z '
				EXECUTE (@SQL)

				SET @CloneId = (SELECT Probuild_Id FROM BI_MIP.miBuilds.app_Probuild WHERE Name = @ClonedName)

			END
			 
		ELSE
			BEGIN
				SET @SQL = 'SECT NOCOUNT ON; '
				--- Drop temp table
				SET @SQL = 'IF OBJECT_ID(''tempdb..#z'') IS NOT NULL DROP TABLE #z '
				--- Insert values into temp table
				SET @SQL = @SQL + 'SELECT * INTO #z FROM ' + @DbName + '.' + @SchemaName + '.' + @TableName + ' WHERE Probuild_Id = ' + @probuild_id + ' '
				--- Update Probuild_Id to CloneID
				SET @SQL = @SQL + 'UPDATE #z SET Probuild_Id = ' + @CloneId + ' '
				--- Drop PK column from temp table because it can't be inserted
				SET @SQL = @SQL + 'ALTER TABLE #z DROP COLUMN ' + @TablePK + ' '
				--- Insert values into main table
				SET @SQL = @SQL + 'INSERT INTO ' + @DbName + '.' + @SchemaName + '.' + @TableName + ' SELECT * FROM #z '
				EXECUTE (@SQL)
			END


	FETCH NEXT FROM @myCursor
	INTO @DbName, @SchemaName, @TableName, @TablePK
	
	END

CLOSE @myCursor
DEALLOCATE @myCursor
GO
