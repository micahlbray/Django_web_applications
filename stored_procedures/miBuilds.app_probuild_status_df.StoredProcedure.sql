USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[app_probuild_status_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[app_probuild_status_df]
	@probuild_id INT
as

SELECT	Probuild_Id
		,AddedBy
		,Added
		,Submitted
		,Approved
FROM	BI_MIP.miBuilds.app_Probuild as a
WHERE	Probuild_Id = @probuild_id

GO
