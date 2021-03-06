USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[calculations_parent_roe_gate_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[calculations_parent_roe_gate_df]
		@probuild_id int
as

SELECT	COUNT(b.Record_Id) as business_ct
		,roe_acquired = 
			SUM(
				IIF(ROE_ACQUIRED_YN = 1, 1, 0) 
				+ IIF(ROE_Id IS NOT NULL, 1, 0)
			)
FROM	app_Probuild as a
	JOIN app_Business as b
	ON a.Probuild_Id  = b.Probuild_Id
	LEFT JOIN BI_MIP.MIP2.ROE_Building_XREF as c
	ON b.Building_Id = c.Building_ID
WHERE	a.Parent_Probuild_Id = @probuild_id
		AND a.Child = 1
		AND ISNULL(a.Deleted, 0) = 0
		AND ISNULL(b.Deleted, 0) = 0
		
GO
