/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 *
  FROM [BI_MIP].[MIP2].[BUILDING_XREF] as a
  join [BI_MIP].[MIP2].[BUSINESS_PROFILE_HIERARCHY] as b on a.[EPS_BUILDING_ID] = b.[BLDG_ID]