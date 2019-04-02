USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[rpt_probuild_dict_log_insert]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[rpt_probuild_dict_log_insert]
	@probuild_id INT
	,@log_status VARCHAR(100)
	,@addedby VARCHAR(150)
	,@post_dict VARCHAR(max)
	as

INSERT INTO miBuilds.rpt_Probuild_Dict_Log
			(Probuild_Id
			,Log_Status
			,AddedOn
			,AddedBy
			,POST_Dict
			)
VALUES		(@probuild_id
			,@log_status
			,getdate()
			,@addedby
			,@post_dict
			)
GO
