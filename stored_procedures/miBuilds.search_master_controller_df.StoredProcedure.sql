USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[search_master_controller_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [miBuilds].[search_master_controller_df]
	@search_type_id nvarchar(2)
	,@region_id nvarchar(2)
	,@search_value nvarchar(255)
as

SET NOCOUNT ON;

DECLARE @stored_procedure nvarchar(255), @SQL nvarchar(max)
SET @stored_procedure = (SELECT Stored_Procedure FROM miBuilds.lk_Search_Type WHERE Search_Type_Id = @search_type_id) 

SET @SQL =	'EXEC ' + @stored_procedure + ' @region_id = ' + @region_id + ', @search_value = ''' + @search_value + ''' '
--PRINT @SQL
EXECUTE (@SQL)




GO
