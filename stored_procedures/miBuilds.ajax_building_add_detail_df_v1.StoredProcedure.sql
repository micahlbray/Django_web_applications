USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[ajax_building_add_detail_df_v1]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[ajax_building_add_detail_df_v1]
		@probuild_id int
as

SELECT	Record_Id
		--,Probuild_Id
		,Building_Id
		,ParentBuilding_Id
		,Address
		,City
		,st.Name as State
		,Zip
		,Sellability_Color_Coax as Coax_Color
		,Sellability_Color_Fiber as Fiber_Color
		,build_type.Name as Building_Type
		,dwell.Name as Dwelling_Type
		,ROE_Id
		,roe.Name as ROE_Status
FROM	BI_MIP.miBuilds.app_Building as build
		LEFT JOIN lk_State as st
		ON build.State_Id = st.State_Id
		LEFT JOIN lk_Building_Type as build_type
		ON build.Building_Type_Id = build_type.Building_Type_Id
		LEFT JOIN lk_Dwelling_Type as dwell
		ON build.Dwelling_Type_Id = dwell.Dwelling_Type_Id
		LEFT JOIN lk_ROE_Status as roe
		ON build.ROE_Status_Id = roe.ROE_Status_Id
WHERE	ISNULL(build.Deleted, 0) = 0
		AND build.Probuild_Id = @probuild_id
ORDER BY build.AddedOn desc
GO
