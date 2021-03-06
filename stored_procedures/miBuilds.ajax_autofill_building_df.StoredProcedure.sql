USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_autofill_building_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[ajax_autofill_building_df] 
		@building_id VARCHAR(25)
as

SELECT  a.nax_building_address as address
		,a.nax_building_city as city
		,b.state_id as state
		,a.nax_building_zip as zip
		,a.MIP_SELLABILITY_COLOR_COAX as sellability_color_coax
		,a.MIP_SELLABILITY_COLOR_FIBER as sellability_color_fiber
		,building_type =
			CASE 
				WHEN mip_building_type = 'COMMERCIAL' THEN '1'
				WHEN mip_building_type = 'MDU' THEN '2'
				WHEN mip_building_type = 'RESIDENTIAL' THEN '3'
				WHEN mip_building_type = 'DATA CENTER' THEN '1'
				ELSE '1'
			END
		,dwelling_type = 
			CASE
				WHEN MIP_TOTAL_BUSINESSES_IN > 1 THEN '2'
				WHEN MIP_TOTAL_BUSINESSES_IN <= 1 THEN '1'
				ELSE '1'
			END
		,roe_status_id = 
			CASE
				WHEN c.ROE_ACQUIRED_YN = 1 THEN '1'
				ELSE '3'
			END
		,c.Pramata_Id as roe_id
FROM     ExternalUser.MIP.MIP2_BUILDING_PROFILE as a
	JOIN miBuilds.lk_State as b
	ON a.nax_building_state = b.abbrev
	LEFT JOIN MIP2.ROE_Building_XREF as c
	ON a.NAX_BUILDING_ID = c.Building_ID
WHERE   a.NAX_BUILDING_ID = @building_id
GO
