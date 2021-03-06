USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[construction_business_case_files_summary_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [miBuilds].[construction_business_case_files_summary_df] 
	@probuild_id INT
as

SELECT	app_file.Name
		,Root + Path as Location
		,file_type.Name
FROM BI_MIP.miBuilds.app_File as app_file
LEFT JOIN BI_MIP.miBuilds.lk_File_Type as file_type ON app_file.File_Type_Id = file_type.File_Type_Id
WHERE ISNULL(app_file.Deleted,0) = 0
	and app_file.Probuild_Id = @probuild_id
GO
