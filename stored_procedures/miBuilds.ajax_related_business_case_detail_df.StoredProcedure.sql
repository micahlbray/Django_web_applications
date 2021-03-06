USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_related_business_case_detail_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[ajax_related_business_case_detail_df]
		@probuild_id int
as

DECLARE @IsChild INT = (SELECT ISNULL(Child, 0) FROM miBuilds.app_Probuild WHERE Probuild_Id = @probuild_id)

IF @IsChild = 0

	SELECT	app_pro.Probuild_Id
			,app_pro.Name as Name
			,Relationship = 'Child'
	FROM	BI_MIP.miBuilds.app_Probuild as app_pro
	WHERE	Parent_Probuild_Id = @probuild_id
			AND ISNULL(Cloned, 0) = 0
			AND Child = 1
			--AND ISNULL(app_pro.Deleted, 0) = 0

ELSE

	SELECT	app_pro.Probuild_Id
			,app_pro.Name as Name
			,Relationship = 'Parent'
	FROM	BI_MIP.miBuilds.app_Probuild as app_pro
	WHERE	Probuild_Id = (SELECT Parent_Probuild_Id FROM miBuilds.app_Probuild WHERE Probuild_Id = @probuild_id)
			AND ISNULL(Cloned, 0) = 0
			--AND ISNULL(app_pro.Deleted, 0) = 0

	UNION ALL

	SELECT	app_pro.Probuild_Id
			,app_pro.Name as Name
			,Relationship = 'Fellow Child'
	FROM	BI_MIP.miBuilds.app_Probuild as app_pro
	WHERE	Parent_Probuild_Id = (SELECT Parent_Probuild_Id FROM miBuilds.app_Probuild WHERE Probuild_Id = @probuild_id)
			AND Probuild_Id <> @probuild_id
			AND ISNULL(Cloned, 0) = 0
			--AND ISNULL(app_pro.Deleted, 0) = 0
GO
