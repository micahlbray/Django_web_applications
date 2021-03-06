USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[rpt_Calculator]    Script Date: 1/8/2019 3:27:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[rpt_Calculator](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Region_Id] [int] NOT NULL,
	[Region_Assump_Id] [int] NOT NULL,
	[MDU_Build_Region_Assump_Id] [int] NULL,
	[Customer_Contribution] [decimal](20, 2) NULL,
	[ROW_Est_Build_Cost] [decimal](20, 2) NULL,
	[HeadEnd_Cost] [decimal](20, 2) NULL,
	[Transport_Cost] [decimal](20, 2) NULL,
	[Private_Property_Cost] [decimal](20, 2) NULL,
	[SMB_ARPU] [decimal](20, 2) NULL,
	[ENT_ARPU] [decimal](20, 2) NULL,
	[SMB_12mo_Pen] [decimal](5, 3) NULL,
	[SMB_36mo_Pen] [decimal](5, 3) NULL,
	[ENT_12mo_Pen] [decimal](5, 3) NULL,
	[ENT_36mo_Pen] [decimal](5, 3) NULL,
	[Lateral_Construct_Upfront_Pct] [decimal](5, 3) NULL,
	[Fund_Bucket] [varchar](255) NULL,
	[SMB_QB_Ct] [int] NULL,
	[ENT_QB_Ct] [int] NULL,
	[Building_Ct] [int] NULL,
	[Multi_Tenant_Building_Ct] [int] NULL,
	[SMB_DealInHand_Ct] [int] NULL,
	[SMB_DealInHand_MRC] [decimal](20, 2) NULL,
	[ENT_DealInHand_Ct] [int] NULL,
	[ENT_DealInHand_MRC] [decimal](20, 2) NULL,
	[MDU_Ct] [int] NULL,
	[DataCenter_Ct] [int] NULL,
	[CAR_Value] [decimal](20, 2) NULL,
	[IRR_Pct] [decimal](5, 3) NULL,
	[IRR_Pct_Less_HE_Trnsprt] [decimal](5, 3) NULL,
	[NPV] [decimal](20, 2) NULL,
	[NPV_Less_HE_Trnsprt] [decimal](20, 2) NULL,
	[Payback_Mo] [int] NULL,
	[Passing_Cost_Per] [decimal](20, 2) NULL,
	[Additional_OSP_Lateral_Cost_per_Connect] [decimal](20, 2) NULL,
	[Business_Max_Actual_Capital] [decimal](20, 2) NULL,
	[Resi_Max_Actual_Capital] [decimal](20, 2) NULL,
	[Business_Capital_Pct] [decimal](5, 3) NULL,
	[Resi_Capital_Pct] [decimal](5, 3) NULL,
	[Added] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedBy] [varchar](100) NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_rpt_Calculator_Record_Id] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[rpt_Calculator]  WITH CHECK ADD  CONSTRAINT [FK_rpt_Calculator_assump_MDU_Build_Region_MDU_Build_Region_Assump_Id] FOREIGN KEY([MDU_Build_Region_Assump_Id])
REFERENCES [miBuilds].[assump_MDU_Build_Region] ([MDU_Build_Region_Assump_Id])
GO
ALTER TABLE [miBuilds].[rpt_Calculator] CHECK CONSTRAINT [FK_rpt_Calculator_assump_MDU_Build_Region_MDU_Build_Region_Assump_Id]
GO
ALTER TABLE [miBuilds].[rpt_Calculator]  WITH CHECK ADD  CONSTRAINT [FK_rpt_Calculator_assump_Region_Region_Assump_Id] FOREIGN KEY([Region_Assump_Id])
REFERENCES [miBuilds].[assump_Region] ([Region_Assump_Id])
GO
ALTER TABLE [miBuilds].[rpt_Calculator] CHECK CONSTRAINT [FK_rpt_Calculator_assump_Region_Region_Assump_Id]
GO
ALTER TABLE [miBuilds].[rpt_Calculator]  WITH CHECK ADD  CONSTRAINT [FK_rpt_Calculator_lk_Region_Region_Id] FOREIGN KEY([Region_Id])
REFERENCES [miBuilds].[lk_Region] ([Region_Id])
GO
ALTER TABLE [miBuilds].[rpt_Calculator] CHECK CONSTRAINT [FK_rpt_Calculator_lk_Region_Region_Id]
GO
