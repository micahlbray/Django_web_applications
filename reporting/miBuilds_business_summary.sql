USE [BI_MIP]
GO

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
FROM BI_MIP.miBuilds_View.app_Business as app_biz
LEFT JOIN BI_MIP.miBuilds_View.lk_Segment_Type as seg_type ON app_biz.Segment_Type_Id = seg_type.Segment_Type_Id
LEFT JOIN BI_MIP.miBuilds_View.lk_Segment_Type as rev_seg_type ON app_biz.Revised_Segment_Type_Id = rev_seg_type.Segment_Type_Id
WHERE ISNULL(app_biz.Deleted,0) = 0
	and app_biz.Probuild_Id = @probuild_id