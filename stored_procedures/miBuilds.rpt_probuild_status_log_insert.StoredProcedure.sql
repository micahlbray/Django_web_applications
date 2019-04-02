USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[rpt_probuild_status_log_insert]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[rpt_probuild_status_log_insert]
	@probuild_id int
	,@addedon VARCHAR(100)
	,@addedby VARCHAR(150)
	,@status VARCHAR(50)
	as

INSERT INTO miBuilds.rpt_Probuild_Status_Log
           (Probuild_Id
           ,AddedOn
           ,AddedBy
		   ,Status
           )
VALUES		(@probuild_id
           ,@addedon
           ,@addedby
		   ,@status
		   )
GO
