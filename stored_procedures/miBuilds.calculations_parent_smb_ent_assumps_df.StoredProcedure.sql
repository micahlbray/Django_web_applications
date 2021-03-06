USE [BI_MIP]
GO
/****** Object:  StoredProcedure [miBuilds].[calculations_parent_smb_ent_assumps_df]    Script Date: 1/8/2019 2:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [miBuilds].[calculations_parent_smb_ent_assumps_df]
	@probuild_id int

	as

SET NOCOUNT ON;

IF OBJECT_ID('tempdb..#x') IS NOT NULL DROP TABLE #x
SELECT	app_pro.Probuild_Id
		,app_pro.SMB_12mo_Pen
		,app_pro.SMB_36mo_Pen
		,app_pro.ENT_12mo_Pen
		,app_pro.ENT_36mo_Pen
		,app_pro.SMB_ARPU
		,app_pro.ENT_ARPU
		,rpt_pro.Lateral_Construct_Upfront_Pct
		,business_ct.SMB_QB_Ct
		,business_ct.ENT_QB_Ct
INTO	#x
FROM	miBuilds.app_Probuild as app_pro
	LEFT JOIN miBuilds.rpt_Probuild as rpt_pro ON app_pro.Probuild_Id = rpt_pro.Probuild_id
		AND rpt_pro.Record_Id = (SELECT MAX(Record_Id) FROM miBuilds.rpt_Probuild as z WHERE app_pro.Probuild_Id = z.Probuild_Id)
	LEFT JOIN	(
					SELECT	Probuild_Id
							,COUNT(Record_Id) as business_ct
							,SUM(IIF(ISNULL(Revised_Segment_Type_Id, Segment_Type_Id) = 1, 1, 0)) as smb_qb_ct
							,SUM(IIF(ISNULL(Revised_Segment_Type_Id, Segment_Type_Id) <> 1, 1, 0)) as ent_qb_ct
					FROM miBuilds.app_Business
					WHERE ISNULL(Deleted, 0) = 0
					GROUP BY Probuild_Id
				) as business_ct
	ON app_pro.Probuild_Id = business_ct.Probuild_Id
WHERE	app_pro.Parent_Probuild_Id = @probuild_id
	and ISNULL(app_pro.Deleted, 0) = 0
	and ISNULL(Cloned, 0) = 0

IF OBJECT_ID('tempdb..#y') IS NOT NULL DROP TABLE #y
SELECT	Probuild_Id
		,Lat_Pct_Base = ISNULL(Lateral_Construct_Upfront_Pct, 0) * (ISNULL(SMB_QB_Ct, 0) + ISNULL(ENT_QB_CT, 0))
		,SMB_12mo_Pen_Base = ISNULL(SMB_12mo_Pen, 0) * ISNULL(SMB_QB_Ct, 0)
		,SMB_36mo_Pen_Base = ISNULL(SMB_36mo_Pen, 0) * ISNULL(SMB_QB_Ct, 0)
		,ENT_12mo_Pen_Base = ISNULL(ENT_12mo_Pen, 0) * ISNULL(ENT_QB_Ct, 0)
		,ENT_36mo_Pen_Base = ISNULL(ENT_36mo_Pen, 0) * ISNULL(ENT_QB_Ct, 0)
		,SMB_ARPU_Base = ISNULL(SMB_ARPU, 0) * ISNULL(SMB_36mo_Pen, 0) * ISNULL(SMB_QB_Ct, 0)
		,ENT_ARPU_Base = ISNULL(ENT_ARPU, 0) * ISNULL(ENT_36mo_Pen, 0) * ISNULL(ENT_QB_Ct, 0)
INTO	#y
FROM	#x

SELECT	SUM(lat_pct) as lat_pct
		,SUM(smb_12mo_pen) as smb_12mo_pen
		,SUM(smb_36mo_pen) as smb_36mo_pen
		,SUM(ent_12mo_pen) as ent_12mo_pen
		,SUM(ent_36mo_pen) as ent_36mo_pen
		,SUM(smb_arpu) as smb_arpu
		,SUM(ent_arpu) as ent_arpu
FROM	(
			SELECT	lat_pct = 
						CASE
							WHEN (SELECT SUM(SMB_QB_Ct) FROM #x) = 0 OR (SELECT SUM(ENT_QB_CT) FROM #x) = 0 THEN 0
							ELSE Lat_Pct_Base / (SELECT SUM(ISNULL(SMB_QB_Ct, 0) + ISNULL(ENT_QB_CT, 0)) FROM #x)
						END
					,smb_12mo_pen = 
						CASE
							WHEN (SELECT SUM(SMB_QB_Ct) FROM #x) = 0 THEN 0
							ELSE SMB_12mo_Pen_Base / (SELECT SUM(SMB_QB_Ct) FROM #x)
						END
					,smb_36mo_pen = 
						CASE
							WHEN (SELECT SUM(SMB_QB_Ct) FROM #x) = 0 THEN 0
							ELSE SMB_36mo_Pen_Base / (SELECT SUM(SMB_QB_Ct) FROM #x)
						END
					,ent_12mo_pen = 
						CASE
							WHEN (SELECT SUM(ENT_QB_Ct) FROM #x) = 0 THEN 0
							ELSE ENT_12mo_Pen_Base / (SELECT SUM(ENT_QB_Ct) FROM #x)
						END
					,ent_36mo_pen = 
						CASE
							WHEN (SELECT SUM(ENT_QB_Ct) FROM #x) = 0 THEN 0
							ELSE ENT_36mo_Pen_Base / (SELECT SUM(ENT_QB_Ct) FROM #x)
						END
					,smb_arpu =
						CASE
							WHEN (SELECT SUM(SMB_36mo_Pen_Base) FROM #y) = 0 THEN 0
							ELSE SMB_ARPU_Base / (SELECT SUM(SMB_36mo_Pen_Base) FROM #y)
						END
					,ent_arpu = 
						CASE
							WHEN (SELECT SUM(ENT_36mo_Pen_Base) FROM #y) = 0 THEN 0
							ELSE ENT_ARPU_Base / (SELECT SUM(ENT_36mo_Pen_Base) FROM #y)
						END
			FROM	#y
		) as y
GO
