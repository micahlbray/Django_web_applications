USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[construction_business_case_business_summary_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[construction_business_case_business_summary_df] 
	@probuild_id INT
as

SELECT	Business_Id
		,Building_Id
		,Business_Name
		,Address_1
		,Address_2
		,seg_type.Name
		,rev_seg_type.Name
		,Revised_Segment_Notes
		,Sellability_Color_Coax
		,Sellability_Color_Fiber
		,ROE_Id
FROM BI_MIP.miBuilds.app_Business as app_biz
LEFT JOIN BI_MIP.miBuilds.lk_Segment_Type as seg_type ON app_biz.Segment_Type_Id = seg_type.Segment_Type_Id
LEFT JOIN BI_MIP.miBuilds.lk_Segment_Type as rev_seg_type ON app_biz.Revised_Segment_Type_Id = rev_seg_type.Segment_Type_Id
WHERE ISNULL(app_biz.Deleted,0) = 0
	and app_biz.Probuild_Id = @probuild_id
GO
