USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[decorators_probuild_user_values_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[decorators_probuild_user_values_df]
	@probuild_id INT
as

SELECT	a.Added
		,a.AddedBy
		,a.AddedOn
		,a.Edited
		,a.EditedBy
		,a.EditedOn
		,a.Submitted
		,a.SubmittedBy
		,a.SubmittedOn
		,a.Approved
		,a.ApprovedBy
		,a.ApprovedOn
		,b.CAR_Value
		,b.IRR_Pct
		,b.IRR_Pct_Less_HE_Trnsprt
FROM	BI_MIP.miBuilds.app_Probuild as a
	LEFT JOIN BI_MIP.miBuilds.rpt_Probuild as b
	ON a.Probuild_Id = b.Probuild_Id
WHERE	a.Probuild_Id = @probuild_id
GO
