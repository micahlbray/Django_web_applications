USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_highlight_business_invalid_roe_id_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[ajax_highlight_business_invalid_roe_id_df]
		@probuild_id int
as

SELECT	a.Record_Id
FROM	app_Business as a
	LEFT JOIN (
			SELECT DISTINCT 
					pramata_number 
			FROM	MIP2.PRAMATA_NUMBER as a
			WHERE	ISNULL(a.is_deleted, 'False') = 'False'
		) as b
	ON a.ROE_Id = b.pramata_number
WHERE	a.Probuild_Id = @probuild_id 
		and ISNULL(a.Deleted,0) = 0
		and b.pramata_number IS NULL
GO
