/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 *
  FROM [BI_MIP].[miBuilds].[app_Probuild]

SELECT TOP 1000 *
  FROM [BI_MIP].[miBuilds].[app_Building_Upload]


SELECT TOP 1000 *
  FROM [BI_MIP].[miBuilds].[app_Building]

  SELECT TOP 1000 *
  FROM [BI_MIP].[miBuilds].[app_Business]

SELECT TOP 1000 *
  FROM [BI_MIP].[miBuilds].[app_Business_Upload]

--update [BI_MIP].[miBuilds].[app_Probuild]
--set added = 1
--where probuild_id = 3

--update [BI_MIP].[miBuilds].[app_Probuild]
--set submitted = 1
--, submittedby = 'mbray201'
--, submittedon = getdate()
--where probuild_id = 2

--update [BI_MIP].[miBuilds].[app_Probuild]
--set approved = 1
--, approvedby = 'mbray201'
--, approvedon = getdate()
--where probuild_id = 1
