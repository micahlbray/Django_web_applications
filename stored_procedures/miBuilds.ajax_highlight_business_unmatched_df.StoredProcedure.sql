USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_highlight_business_unmatched_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[ajax_highlight_business_unmatched_df]
		@probuild_id INT

as

SELECT	a.Record_Id
FROM	BI_MIP.miBuilds.app_Business as a
WHERE	a.Probuild_Id = @probuild_id
		and ISNULL(a.Deleted,0) = 0
		and NOT EXISTS(SELECT Building_Id 
						FROM BI_MIP.miBuilds.app_Building as b 
						WHERE a.Building_Id = b.Building_Id 
							and ISNULL(b.Deleted,0) = 0)
GO
