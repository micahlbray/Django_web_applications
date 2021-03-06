USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[search_business_case_detail_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[search_business_case_detail_df]
		@probuild_id_list ProbuildIdList READONLY, -- table variable
		@region_id int
		
as

IF @region_id = 7

	SELECT	app_pro.Probuild_Id
			,app_pro.Name as Name
			,region.Name as Region
			,rpt_pro.Fund_Bucket
			,FORMAT(ISNULL(rpt_pro.Total_CAR_Value, 0), 'C', 'en-us') as CAR_Value
			,build.Name as Build_Type
			,trans.Name as Transport_Type
			,app_pro.AddedBy
			,bdr.BDR_Firstname + ' ' + BDR_LastName as BDR
			,BI_MIP.miBuilds.udf_ConvertGMTtoMST(app_pro.AddedOn) as AddedOn
	FROM [BI_MIP].[miBuilds].[app_Probuild] as app_pro
		LEFT JOIN (
					SELECT  Probuild_Id
							,Fund_Bucket
							,Total_CAR_Value
					FROM	[BI_MIP].[miBuilds].[rpt_Probuild] as rpt_pro
					WHERE	rpt_pro.Record_Id = (SELECT MAX(Record_Id) FROM [BI_MIP].[miBuilds].[rpt_Probuild] as z WHERE rpt_pro.Probuild_Id = z.Probuild_Id)
				) as rpt_pro
			ON app_pro.Probuild_Id = rpt_pro.Probuild_id
		LEFT JOIN BI_MIP.miBuilds.lk_Region as region ON app_pro.Region_Id = region.Region_Id
		LEFT JOIN BI_MIP.miBuilds.lk_Build_Type as build ON app_pro.Build_Type_Id = build.Build_Type_Id
		LEFT JOIN BI_MIP.miBuilds.lk_Transport_Type as trans ON app_pro.Transport_Type_Id = trans.Transport_Type_Id
		LEFT JOIN BI_MIP.miBuilds.lk_BDR as bdr ON app_pro.BDR_Id = bdr.BDR_Id
	WHERE	ISNULL(app_pro.Deleted, 0) = 0
			AND app_pro.Probuild_Id IN (SELECT Probuild_Id FROM @probuild_id_list)

ELSE
	
	SELECT	app_pro.Probuild_Id
			,app_pro.Name as Name
			,region.Name as Region
			,rpt_pro.Fund_Bucket
			,FORMAT(ISNULL(rpt_pro.Total_CAR_Value, 0), 'C', 'en-us') as CAR_Value
			,build.Name as Build_Type
			,trans.Name as Transport_Type
			,app_pro.AddedBy
			,bdr.BDR_Firstname + ' ' + BDR_LastName as BDR
			,BI_MIP.miBuilds.udf_ConvertGMTtoMST(app_pro.AddedOn) as AddedOn
	FROM [BI_MIP].[miBuilds].[app_Probuild] as app_pro
		LEFT JOIN (
					SELECT  Probuild_Id
							,Fund_Bucket
							,Total_CAR_Value
					FROM	[BI_MIP].[miBuilds].[rpt_Probuild] as rpt_pro
					WHERE	rpt_pro.Record_Id = (SELECT MAX(Record_Id) FROM [BI_MIP].[miBuilds].[rpt_Probuild] as z WHERE rpt_pro.Probuild_Id = z.Probuild_Id)
				) as rpt_pro
			ON app_pro.Probuild_Id = rpt_pro.Probuild_id
		LEFT JOIN BI_MIP.miBuilds.lk_Region as region ON app_pro.Region_Id = region.Region_Id
		LEFT JOIN BI_MIP.miBuilds.lk_Build_Type as build ON app_pro.Build_Type_Id = build.Build_Type_Id
		LEFT JOIN BI_MIP.miBuilds.lk_Transport_Type as trans ON app_pro.Transport_Type_Id = trans.Transport_Type_Id
		LEFT JOIN BI_MIP.miBuilds.lk_BDR as bdr ON app_pro.BDR_Id = bdr.BDR_Id
	WHERE	ISNULL(app_pro.Deleted, 0) = 0
			AND app_pro.Probuild_Id IN (SELECT Probuild_Id FROM @probuild_id_list)
GO
