USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[app_building_available_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[app_building_available_df] 
		@building_id_list VARCHAR(MAX)
as

DECLARE @sql NVARCHAR(MAX)
SET @sql =	'SELECT	b.Name as Probuild
					,a.Building_Id as Building
			FROM	BI_MIP.miBuilds.app_Building as a
				JOIN BI_MIP.miBuilds.app_Probuild as b
				ON a.Probuild_Id = b.Probuild_Id
			WHERE	a.Building_Id IN (' + @building_id_list + ')
						and ISNULL(a.Deleted, 0) = 0
			
			UNION ALL
			SELECT	a.BUILD_NAME + '' (Legacy Build)'' as Probuild
					,CAST(a.NAX_BUILDING_ID as INT) as Building
			FROM    BI_MIP.MIP2.PROBUILD_BUILDINGS as a
			WHERE   a.NAX_BUILDING_ID IN (' + @building_id_list + ')'
EXECUTE (@sql)
GO
