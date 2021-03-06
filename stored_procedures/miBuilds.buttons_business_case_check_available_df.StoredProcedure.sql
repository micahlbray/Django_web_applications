USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[buttons_business_case_check_available_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [miBuilds].[buttons_business_case_check_available_df] 
		@probuild_id INT
as

WITH CTE (Probuild, Building, Business)
	AS (
			SELECT	b.Name as Probuild
					,CAST(a.Building_Id as varchar(50)) as Building
					,'None' as Business
			FROM	BI_MIP.miBuilds.app_Building as a
				JOIN BI_MIP.miBuilds.app_Probuild as b
				ON a.Probuild_Id = b.Probuild_Id
			WHERE	ISNULL(a.Deleted, 0) = 0
					and a.Building_Id IN (
											SELECT Building_Id
											FROM BI_MIP.miBuilds.app_Building
											WHERE Probuild_Id = @probuild_id
													and ISNULL(Deleted, 0) = 0
										)
			
			UNION ALL
			SELECT	a.BUILD_NAME + ' (Legacy Build)' as Probuild
					,CAST(a.NAX_BUILDING_ID as varchar(50)) as Building
					,'None' as Business
			FROM    BI_MIP.MIP2.PROBUILD_BUILDINGS as a
			WHERE   a.NAX_BUILDING_ID IN (
											SELECT Building_Id
											FROM BI_MIP.miBuilds.app_Building
											WHERE Probuild_Id = @probuild_id
										)

			UNION ALL
			SELECT  b.Name as Probuild
					,'None' as Building
					,CAST(a.Business_Id as varchar(50)) as Business
			FROM    BI_MIP.miBuilds.app_Business as a
				JOIN BI_MIP.miBuilds.app_Probuild as b
				ON a.Probuild_Id = b.Probuild_Id
			WHERE   ISNULL(a.Deleted, 0) = 0
					and a.Business_Id IN (
											SELECT Business_Id
											FROM BI_MIP.miBuilds.app_Business
											WHERE Probuild_Id = @probuild_id
													and ISNULL(Deleted, 0) = 0
										)
		)

SELECT	*
FROM	CTE
WHERE	Probuild NOT IN (
						SELECT Name
						FROM BI_MIP.miBuilds.app_Probuild
						WHERE Probuild_Id = @probuild_id
					)
		and Probuild IN (
							SELECT Name
							FROM BI_MIP.miBuilds.app_Probuild
							WHERE ISNULL(Approved,0) = 1
						)

GO
