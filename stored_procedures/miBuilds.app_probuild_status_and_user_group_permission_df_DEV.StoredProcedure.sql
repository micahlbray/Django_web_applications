USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[app_probuild_status_and_user_group_permission_df_DEV]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[app_probuild_status_and_user_group_permission_df_DEV]
	@probuild_id INT,
	@user_id INT
as

WITH z (Probuild_Id, Child_Ct)
AS
	(
		SELECT a.Probuild_Id
				,SUM(IIF(ISNULL(b.Child, 0) = 0, 0, 1))
		FROM	BI_MIP_Dev.Dev.app_Probuild as a
			LEFT JOIN BI_MIP_Dev.Dev.app_Probuild as b
			ON a.Probuild_Id = b.Parent_Probuild_Id
		WHERE	a.Probuild_Id = @probuild_id
		GROUP BY a.Probuild_Id
	)

SELECT	a.*
		,b.*
FROM	(
			SELECT	a.Probuild_Id
					,a.AddedBy
					,ISNULL(a.Added,0) as Added
					,ISNULL(a.Submitted,0) as Submitted
					,ISNULL(a.Approved,0) as Approved
					,Parent =
						CASE
							WHEN a.Child = 1 THEN 0
							WHEN z.Child_Ct > 0 THEN 1
							ELSE 2
						END
					,ISNULL(a.Cloned,0) as Cloned
					,ISNULL(a.Child,0) as Child
					,ISNULL(b.CAR_Value,0) as CAR_Value
			FROM	BI_MIP_Dev.Dev.app_Probuild as a
				LEFT JOIN BI_MIP_Dev.Dev.rpt_Probuild as b
				ON a.Probuild_Id = b.Probuild_id
					AND b.Record_Id = (SELECT MAX(Record_Id) FROM BI_MIP_Dev.Dev.rpt_Probuild as z WHERE a.Probuild_Id = z.Probuild_Id)
				LEFT JOIN z as z
				ON a.Probuild_Id = z.Probuild_Id
			WHERE	a.Probuild_Id = @probuild_id
		) 
		AS a
,		(
			SELECT	a.Auth_User_Id
					,a.NT_Login
					,a.Region_Id
					,b.CanViewOnly
					,b.CanCreate
					,b.CanSubmit
					,b.CanApprove
					,b.CanEditSubmitted
					,b.CanEditApproved
					,b.CanViewOnlyCreated
					,b.CanViewAllRegion
					,b.CanViewAllDivision
					,b.CanDeleteOnlyCreated
					,b.CanDeleteAllRegion
					,b.CanDeleteAllDivision
					,b.CAR_MinApproval
					,b.CAR_MaxApproval
					,b.IRR_MinApproval
					,b.IRR_MaxApproval
			FROM	BI_MIP_Dev.Dev.app_User_Profile as a
				JOIN BI_MIP_Dev.Dev.app_User_Group_Permission as b
				ON a.User_Group_Permission_Id = b.User_Group_Permission_Id
				--AND a.IsActive = 1 and b.IsActive = 1
			WHERE	Auth_User_Id = @user_id
		) as b
GO
