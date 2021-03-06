USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[calculations_child_probuild_id_list_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [miBuilds].[calculations_child_probuild_id_list_df]
	@probuild_id int

	as

SELECT DISTINCT 
		Probuild_Id
FROM	miBuilds.app_Probuild as app_pro
WHERE	app_pro.Parent_Probuild_Id = @probuild_id
	and Child = 1
	and ISNULL(Deleted, 0) = 0
GO
