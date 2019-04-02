USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_Probuild_Restore]    Script Date: 1/8/2019 3:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_Probuild_Restore](
	[Probuild_Id] [int] NOT NULL,
	[Name] [varchar](150) NULL,
	[Region_Id] [int] NOT NULL,
	[Probuild_City] [varchar](75) NULL,
	[State_Id] [int] NULL,
	[Build_Type_Id] [int] NULL,
	[Survey_Type_Id] [int] NULL,
	[Cross_Functional_Review_On] [datetime] NULL,
	[Historical_Opportunities] [int] NULL,
	[JT_Id] [bigint] NULL,
	[Est_Compl_Dt] [datetime] NULL,
	[ROE_Gate] [int] NULL,
	[ROE_Gate_Dt] [datetime] NULL,
	[Permitting_Gate_Dt] [datetime] NULL,
	[Region_Assump_Id] [int] NULL,
	[MDU_Build_Region_Assump_Id] [int] NULL,
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
	[Fiber_Competitors_Ct] [int] NULL,
	[Fiber_Competitors] [varchar](max) NULL,
	[Download_Speed_Id] [int] NULL,
	[Term_Length_Id] [int] NULL,
	[Access_Fees_One_Time] [decimal](20, 2) NULL,
	[Access_Fees_Monthly] [decimal](20, 2) NULL,
	[Comments] [varchar](max) NULL,
	[Considerations] [varchar](max) NULL,
	[Investment_Committee_Takeaway] [varchar](max) NULL,
	[Added] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[Edited] [int] NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[Submitted] [int] NULL,
	[SubmittedOn] [datetime] NULL,
	[SubmittedBy] [varchar](100) NULL,
	[Approved] [int] NULL,
	[ApprovedOn] [datetime] NULL,
	[ApprovedBy] [varchar](100) NULL,
	[ToDelete] [int] NULL,
	[ToDeleteOn] [datetime] NULL,
	[ToDeleteBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL,
	[Transport_Type_Id] [int] NULL,
	[Spectrum_Job_Id] [varchar](150) NULL,
	[Customer_Contribution] [decimal](20, 2) NULL,
	[BDR_Id] [int] NULL,
	[Disposition_Type_Id] [int] NULL,
	[Parent_Probuild_Id] [int] NULL,
	[Cloned] [int] NULL,
	[ClonedOn] [datetime] NULL,
	[ClonedBy] [varchar](100) NULL,
	[Child] [int] NULL,
	[ChildOn] [datetime] NULL,
	[ChildBy] [varchar](100) NULL,
	[Legacy] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
