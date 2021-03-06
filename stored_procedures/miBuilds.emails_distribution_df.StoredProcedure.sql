USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[emails_distribution_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [miBuilds].[emails_distribution_df]
		@region_id INT

as

SELECT  Lead_Email as lead_email
		,Lead_Backup_Email as lead_backup_email
		,Invest_Committ_Email_Distro as invest_committ_email_distro
		,Review_Email as review_email
		,Construction_Email as construction_email
		,Other_Email as other_email
FROM    BI_MIP.miBuilds.lk_Region as a
WHERE   Region_Id = @region_id
GO
