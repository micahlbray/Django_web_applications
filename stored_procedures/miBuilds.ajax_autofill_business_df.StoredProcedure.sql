USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_autofill_business_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [miBuilds].[ajax_autofill_business_df] 
		@business_id VARCHAR(25)
as

DECLARE @sql NVARCHAR(MAX)
SET @sql =	'SELECT  a.nax_building_id as building_id
                    ,a.busn_name as business_name
                    ,a.nax_address_id as address_id
                    ,b.nax_conformed_address_1 as address_1
                    ,b.nax_conformed_address_2 as address_2
                    ,b.MIP_SUITE_SELLABILITY_COLOR_COAX as sellability_color_coax
                    ,b.MIP_SUITE_SELLABILITY_COLOR_FIBER as sellability_color_fiber
                    ,c.segment_type_id as segment_type_id
            FROM    ExternalUser.MIP.MIP2_BUSINESS_PROFILE as a
                JOIN ExternalUser.MIP.MIP2_ADDRESS_PROFILE as b
                ON a.nax_address_id = b.nax_address_id
                JOIN BI_MIP.miBuilds.lk_Segment_Type as c
                ON a.mip_segment = c.name
            WHERE   IsNull(comcast_division,''NONE'') IN (''NONE'',''WEST DIVISION'')
                    and busn_id IN (' + @business_id + ')'
EXECUTE (@sql)
GO
