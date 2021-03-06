USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_flag_building_transport_type_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[ajax_flag_building_transport_type_df]
		@probuild_id INT

as

;WITH
	cteBuildingFlag (Building_Id, Flag)
	AS
	(
		SELECT	a.Building_Id
				,Flag = 
					CASE
						WHEN b.Transport_Type_Id = 1 
							AND a.Sellability_Color_Coax IN ('GREEN', 'LIME GREEN', 'PURPLE') THEN 1		-- single-tenant flag for buildings that have more than 1 business
						WHEN b.Transport_Type_Id = 2 
							AND a.Sellability_Color_Fiber IN ('GREEN', 'LIME GREEN', 'PURPLE') THEN 1		-- multi-tenant flag for buildings that have less than or equal to 1 business
						WHEN b.Transport_Type_Id = 3 
							AND 
							(
								a.Sellability_Color_Coax IN ('PURPLE') OR a.Sellability_Color_Fiber IN ('PURPLE')
							) THEN 1
						ELSE 0
					END
		FROM	BI_MIP.miBuilds.app_Building as a
			JOIN BI_MIP.miBuilds.app_Probuild as b
			ON a.Probuild_Id = b.Probuild_Id
		WHERE	a.Probuild_Id = @probuild_id 
				and ISNULL(a.Deleted,0) = 0
	)

SELECT	a.Record_Id
FROM	BI_MIP.miBuilds.app_Building as a
	JOIN cteBuildingFlag as b
	ON a.Building_Id = b.Building_Id
WHERE	a.Probuild_Id = @probuild_id 
		and ISNULL(a.Deleted,0) = 0
		and b.Flag = 1
GO
