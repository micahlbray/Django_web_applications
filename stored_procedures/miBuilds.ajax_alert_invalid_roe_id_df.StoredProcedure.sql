USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_alert_invalid_roe_id_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[ajax_alert_invalid_roe_id_df]
		@roe_id int
as

IF (SELECT pramata_number FROM MIP2.PRAMATA_NUMBER WHERE pramata_number = @roe_id) >= 1
	SELECT '1' as IsValid
ELSE
	SELECT '0' as IsValid
GO
