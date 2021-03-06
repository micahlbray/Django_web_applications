USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[rpt_Probuild]    Script Date: 1/8/2019 3:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[rpt_Probuild](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Probuild_Id] [int] NOT NULL,
	[Lateral_Construct_Upfront_Pct] [decimal](5, 3) NULL,
	[Fund_Bucket] [varchar](255) NULL,
	[SMB_QB_Ct] [int] NULL,
	[ENT_QB_Ct] [int] NULL,
	[Building_Ct] [int] NULL,
	[Multi_Tenant_Building_Ct] [int] NULL,
	[CAR_Value] [decimal](20, 2) NULL,
	[IRR_Pct] [decimal](5, 3) NULL,
	[IRR_Pct_Less_HE_Trnsprt] [decimal](5, 3) NULL,
	[NPV] [decimal](20, 2) NULL,
	[Payback_Mo] [int] NULL,
	[Passing_Cost_Per] [decimal](20, 2) NULL,
	[Additional_OSP_Lateral_Cost_per_Connect] [decimal](20, 2) NULL,
	[Saved] [int] NULL,
	[Submitted] [int] NULL,
	[Approved] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[Business_Max_Actual_Capital] [decimal](20, 2) NULL,
	[Resi_Max_Actual_Capital] [decimal](20, 2) NULL,
	[Deleted] [int] NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOn] [datetime] NULL,
	[Business_Capital_Pct] [decimal](5, 3) NULL,
	[Resi_Capital_Pct] [decimal](5, 3) NULL,
	[DealInHand_Ct] [int] NULL,
	[MDU_Ct] [int] NULL,
	[DataCenter_Ct] [int] NULL,
	[NPV_Less_HE_Trnsprt] [decimal](20, 2) NULL,
	[ROW_CAR_Value] [decimal](20, 2) NULL,
	[Lat_CAR_Value] [decimal](20, 2) NULL,
	[Total_CAR_Value] [decimal](20, 2) NULL,
	[ROE_Needed] [int] NULL,
	[ROE_Acquired] [int] NULL,
	[ROE_Target] [int] NULL,
	[SMB_Additional_OSP_Lateral_Cost_per_Connect] [decimal](20, 2) NULL,
	[ENT_Additional_OSP_Lateral_Cost_per_Connect] [decimal](20, 2) NULL,
 CONSTRAINT [PK_rpt_Probuild_Record_Id] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[rpt_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_rpt_Probuild_app_Probuild_Probuild_Id] FOREIGN KEY([Probuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[rpt_Probuild] CHECK CONSTRAINT [FK_rpt_Probuild_app_Probuild_Probuild_Id]
GO
