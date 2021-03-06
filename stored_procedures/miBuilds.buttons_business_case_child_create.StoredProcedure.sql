USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[buttons_business_case_child_create]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[buttons_business_case_child_create] 
		@probuild_id NVARCHAR(25),
		@childby NVARCHAR(25)
AS

DECLARE @myCursor CURSOR
DECLARE @DbName NVARCHAR(50)
DECLARE @SchemaName NVARCHAR(50)
DECLARE @TableName NVARCHAR(50)
DECLARE @TablePK NVARCHAR(50)
DECLARE @Childen int
DECLARE @ProbuildName NVARCHAR(255)
DECLARE @ChildName NVARCHAR(255)
DECLARE @ChildId NVARCHAR(50)
DECLARE @SQL NVARCHAR(MAX)

---- Set the clone variables based off of the probuild_id from the app
SET @Childen = (SELECT COUNT(1) FROM miBuilds.app_Probuild WHERE Parent_Probuild_Id = @probuild_id AND ISNULL(Cloned, 0) = 0) + 1
SET @ProbuildName = (SELECT Name FROM miBuilds.app_Probuild WHERE Probuild_Id = @probuild_id)
SET @ChildName = @ProbuildName + ' - Phase ' + CAST(@Childen as NVARCHAR(50))

SELECT @ChildName as Child_Name

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
				SET @SQL = @SQL + 'UPDATE #z SET Name = ''' + @ChildName + ''' '
				--- Update Parent_Probuild_Id to CloneID
				SET @SQL = @SQL + 'UPDATE #z SET Parent_Probuild_Id = ' + @probuild_id + ' '
				--- Update Child value to 1
				SET @SQL = @SQL + 'UPDATE #z SET Child = 1 '
				--- Update ChildOn to current date/time
				SET @SQL = @SQL + 'UPDATE #z SET ChildOn = GETDATE() '
				--- Update ChildBy to App variable
				SET @SQL = @SQL + 'UPDATE #z SET ChildBy = ''' + @childby + ''' '
				--- Drop PK column from temp table because it can't be inserted
				SET @SQL = @SQL + 'ALTER TABLE #z DROP COLUMN ' + @TablePK + ' '
				--- Insert values into main table
				SET @SQL = @SQL + 'INSERT INTO ' + @DbName + '.' + @SchemaName + '.' + @TableName + ' SELECT * FROM #z '
				EXECUTE (@SQL)

				SET @ChildId = (SELECT Probuild_Id FROM BI_MIP.miBuilds.app_Probuild WHERE Name = @ChildName)

			END
			 
		ELSE
			BEGIN
				SET @SQL = 'SECT NOCOUNT ON; '
				--- Drop temp table
				SET @SQL = 'IF OBJECT_ID(''tempdb..#z'') IS NOT NULL DROP TABLE #z '
				--- Insert values into temp table
				SET @SQL = @SQL + 'SELECT * INTO #z FROM ' + @DbName + '.' + @SchemaName + '.' + @TableName + ' WHERE Probuild_Id = ' + @probuild_id + ' '
				--- Update Probuild_Id to CloneID
				SET @SQL = @SQL + 'UPDATE #z SET Probuild_Id = ' + @ChildId + ' '
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
