USE [BI_MIP]
GO

SELECT	app_build.Building_Id
		,app_build.ParentBuilding_Id
		,app_build.Address
		,app_build.City
		,app_build.State_Id
		,app_build.Zip
		,build_type.Name
		,dwell_type.Name
		,app_build.Sellability_Color_Coax
		,app_build.Sellability_Color_Fiber
		,app_build.Building_ROE_Id	
FROM BI_MIP.miBuilds_View.app_Building as app_build
LEFT JOIN BI_MIP.miBuilds_View.lk_Building_Type as build_type ON app_build.Building_Type_Id = build_type.Building_Type_Id
LEFT JOIN BI_MIP.miBuilds_View.lk_Dwelling_Type as dwell_type ON app_build.Dwelling_Type_Id = dwell_type.Dwelling_Type_Id
WHERE ISNULL(app_build.Deleted,0) = 0
	and app_build.Probuild_Id = @probuild_id