USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[calculations_smb_ent_inputs_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [miBuilds].[calculations_smb_ent_inputs_df]
	@probuild_id int

	as

SELECT	app_pro.probuild_id 
        ,ISNULL(customer_contribution, 0) as customer_contribution 
        ,access_fees_one_time 
        ,access_fees_monthly 
        ,row_est_build_cost 
        ,headend_cost
        ,transport_cost
        ,private_property_cost
        ,lateral_construct_upfront_pct as lat_construct_upfront_pct
        ,smb_arpu 
        ,ent_arpu 
        ,smb_12mo_pen 
        ,smb_36mo_pen
        ,ent_12mo_pen 
        ,ent_36mo_pen
FROM	miBuilds.app_Probuild as app_pro
	LEFT JOIN BI_MIP.miBuilds.rpt_Probuild as rpt_pro ON app_pro.Probuild_Id = rpt_pro.Probuild_id
	AND rpt_pro.Record_Id = (SELECT MAX(Record_Id) FROM BI_MIP.miBuilds.rpt_Probuild as z WHERE app_pro.Probuild_Id = z.Probuild_Id)
WHERE	app_pro.Probuild_Id = @probuild_id
GO
