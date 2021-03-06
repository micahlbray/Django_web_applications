USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[app_user_profile_update]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [miBuilds].[app_user_profile_update]
as

INSERT INTO BI_MIP.miBuilds.app_User_Profile (
	Auth_User_Id
	,NT_Login
	,IsActive
)
SELECT	id
		,username
		,is_active
FROM BI_MIP.miBuilds.auth_user as a
WHERE NOT EXISTS 
		(SELECT 1 
		FROM BI_MIP.miBuilds.app_User_Profile as b 
		WHERE a.id = b.Auth_User_Id)

UPDATE	a
SET		User_Group_Id = d.User_Group_Id
FROM	BI_MIP.miBuilds.app_User_Profile as a
	JOIN BI_MIP.miBuilds.auth_user_groups as b 
	ON a.Auth_User_Id = b.user_id
	JOIN BI_MIP.miBuilds.auth_group as c 
	ON b.group_id = c.id
	JOIN BI_MIP.miBuilds.lk_User_Group as d 
	ON c.name = d.Name and d.IsActive = 1

UPDATE	a
SET		a.User_Group_Permission_Id = b.User_Group_Permission_Id
FROM	BI_MIP.miBuilds.app_User_Profile as a
	JOIN BI_MIP.miBuilds.app_User_Group_Permission as b 
	ON a.User_Group_Id = b.User_Group_Id and b.IsActive = 1

UPDATE	a
SET		a.User_FirstName = b.FirstName
		,a.User_LastName = b.LastName
		,a.Email = b.Mail
FROM	BI_MIP.miBuilds.app_User_Profile as a
	JOIN WISDM.Dim.Employee as b 
	ON a.NT_Login = b.NTLogin and b.IsCurrent = 1

UPDATE	a
SET		a.Region_Id = b.Region_Id
FROM	BI_MIP.miBuilds.app_User_Profile as a
	JOIN	(
				SELECT	NTLogin
						, Region = 
							CASE
								WHEN OrgHierarchyLevel2Descr IN ('California Region') THEN 'California'
								WHEN OrgHierarchyLevel2Descr IN ('Houston Region') THEN 'Houston'
								WHEN OrgHierarchyLevel2Descr IN ('Mile High Region', 'Mountain West Region') THEN 'Mountain West'
								WHEN OrgHierarchyLevel2Descr IN ('Portland', 'Portland Region') THEN 'Portland'
								WHEN OrgHierarchyLevel2Descr IN ('Seattle', 'Seattle Region') THEN 'Seattle'
								WHEN OrgHierarchyLevel2Descr IN ('Twin Cities Region') THEN 'Twin Cities'
								WHEN OrgHierarchyLevel2Descr IN ('West Division Other','Division Shared Services') THEN 'Division'
							END
				FROM WISDM.Dim.Employee as a
				WHERE IsCurrent = 1
			) as z 
	ON a.NT_Login = z.NTLogin
	JOIN BI_MIP.miBuilds.lk_Region as b
	ON z.Region = b.Name

UPDATE	a
SET		IsActive = 1
FROM	BI_MIP.miBuilds.app_User_Profile as a
WHERE	User_Group_Id IS NOT NULL


DELETE
FROM	BI_MIP.miBuilds.app_User_Profile
WHERE	User_FirstName IS NULL
		AND User_LastName IS NULL
		AND Email IS NULL


SELECT *
FROM BI_MIP.miBuilds.app_User_Profile
GO
