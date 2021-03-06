USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[app_user_group_permission_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[app_user_group_permission_df]
	@user_id INT
as

SELECT	a.Auth_User_Id
		,a.NT_Login
		,a.Region_Id
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
FROM	BI_MIP.miBuilds.app_User_Profile as a
	JOIN BI_MIP.miBuilds.app_User_Group_Permission as b
	ON a.User_Group_Permission_Id = b.User_Group_Permission_Id
	--AND a.IsActive = 1 and b.IsActive = 1
WHERE	Auth_User_Id = @user_id



GO
