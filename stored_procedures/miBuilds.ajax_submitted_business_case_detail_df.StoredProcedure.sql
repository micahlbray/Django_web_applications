USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_submitted_business_case_detail_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[ajax_submitted_business_case_detail_df]
		@region_id int
as

IF @region_id = 7

	SELECT	app_pro.Probuild_Id as Probuild_Id
			,app_pro.Name as Name
			,region.Name as Region
			,rpt_pro.Fund_Bucket
			,FORMAT(ISNULL(rpt_pro.Total_CAR_Value, 0), 'C', 'en-us') as CAR_Value
			,build.Name as Build_Type
			,trans.Name as Transport_Type
			,bdr.BDR_Firstname + ' ' + BDR_LastName as BDR
			,app_pro.SubmittedBy
			,BI_MIP.miBuilds.udf_ConvertGMTtoMST(app_pro.SubmittedOn) as SubmittedOn
	FROM [BI_MIP].[miBuilds].[app_Probuild] as app_pro
		LEFT JOIN [BI_MIP].[miBuilds].[rpt_Probuild] as rpt_pro ON app_pro.Probuild_Id = rpt_pro.Probuild_id
			AND rpt_pro.Record_Id = (SELECT MAX(Record_Id) FROM [BI_MIP].[miBuilds].[rpt_Probuild] as z WHERE app_pro.Probuild_Id = z.Probuild_Id)
		LEFT JOIN BI_MIP.miBuilds.lk_Region as region ON app_pro.Region_Id = region.Region_Id
		LEFT JOIN BI_MIP.miBuilds.lk_Build_Type as build ON app_pro.Build_Type_Id = build.Build_Type_Id
		LEFT JOIN BI_MIP.miBuilds.lk_Transport_Type as trans ON app_pro.Transport_Type_Id = trans.Transport_Type_Id
		LEFT JOIN BI_MIP.miBuilds.lk_BDR as bdr ON app_pro.BDR_Id = bdr.BDR_Id
	WHERE	ISNULL(app_pro.Deleted, 0) = 0
			AND app_pro.Submitted = 1
			AND ISNULL(app_pro.Approved, 0) = 0
	ORDER BY app_pro.SubmittedOn desc

ELSE

	SELECT	app_pro.Probuild_Id as Probuild_Id
			,app_pro.Name as Name
			,region.Name as Region
			,rpt_pro.Fund_Bucket
			,FORMAT(ISNULL(rpt_pro.Total_CAR_Value, 0), 'C', 'en-us') as CAR_Value
			,build.Name as Build_Type
			,trans.Name as Transport_Type
			,bdr.BDR_Firstname + ' ' + BDR_LastName as BDR
			,app_pro.SubmittedBy
			,BI_MIP.miBuilds.udf_ConvertGMTtoMST(app_pro.SubmittedOn) as SubmittedOn
	FROM [BI_MIP].[miBuilds].[app_Probuild] as app_pro
		LEFT JOIN [BI_MIP].[miBuilds].[rpt_Probuild] as rpt_pro ON app_pro.Probuild_Id = rpt_pro.Probuild_id
			AND rpt_pro.Record_Id = (SELECT MAX(Record_Id) FROM [BI_MIP].[miBuilds].[rpt_Probuild] as z WHERE app_pro.Probuild_Id = z.Probuild_Id)
		LEFT JOIN BI_MIP.miBuilds.lk_Region as region ON app_pro.Region_Id = region.Region_Id
		LEFT JOIN BI_MIP.miBuilds.lk_Build_Type as build ON app_pro.Build_Type_Id = build.Build_Type_Id
		LEFT JOIN BI_MIP.miBuilds.lk_Transport_Type as trans ON app_pro.Transport_Type_Id = trans.Transport_Type_Id
		LEFT JOIN BI_MIP.miBuilds.lk_BDR as bdr ON app_pro.BDR_Id = bdr.BDR_Id
	WHERE	ISNULL(app_pro.Deleted, 0) = 0
			AND app_pro.Submitted = 1
			AND ISNULL(app_pro.Approved, 0) = 0
			AND app_pro.Region_Id = @region_id
	ORDER BY app_pro.SubmittedOn desc
GO
