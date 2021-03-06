USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[services_probuild_assumptions_update]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[services_probuild_assumptions_update]
	@probuild_id INT

	as

UPDATE	a
SET		a.SMB_ARPU = b.SMB_ARPU
		,a.ENT_ARPU = b.ENT_ARPU
		,a.SMB_12mo_Pen = b.SMB_12mo_Pen
		,a.SMB_36mo_Pen = b.SMB_36mo_Pen
		,a.ENT_12mo_Pen = b.ENT_12mo_Pen
		,a.ENT_36mo_Pen = b.ENT_36mo_Pen
FROM	miBuilds.app_Probuild as a
	JOIN miBuilds.assump_Region as b 
	ON a.Region_Id = b.Region_Id AND b.IsActive = 1
	--ON a.Region_Assump_Id = b.Region_Assump_Id
WHERE	a.Probuild_Id = @probuild_id
GO
