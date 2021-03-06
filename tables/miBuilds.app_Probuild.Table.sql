USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_Probuild]    Script Date: 1/8/2019 3:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_Probuild](
	[Probuild_Id] [int] IDENTITY(1,1) NOT NULL,
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
	[Legacy] [int] NULL,
 CONSTRAINT [PK_app_Probuild_Probuild_Id] PRIMARY KEY CLUSTERED 
(
	[Probuild_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_app_Probuild_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_assump_MDU_Build_Region_MDU_Build_Region_Assump_Id] FOREIGN KEY([MDU_Build_Region_Assump_Id])
REFERENCES [miBuilds].[assump_MDU_Build_Region] ([MDU_Build_Region_Assump_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_assump_MDU_Build_Region_MDU_Build_Region_Assump_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_assump_Region_Region_Assump_Id] FOREIGN KEY([Region_Assump_Id])
REFERENCES [miBuilds].[assump_Region] ([Region_Assump_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_assump_Region_Region_Assump_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_BDR_BDR_Id] FOREIGN KEY([BDR_Id])
REFERENCES [miBuilds].[lk_BDR] ([BDR_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_BDR_BDR_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_Build_Type_Build_Type_Id] FOREIGN KEY([Build_Type_Id])
REFERENCES [miBuilds].[lk_Build_Type] ([Build_Type_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_Build_Type_Build_Type_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_Disposition_Type_Disposition_Type_Id] FOREIGN KEY([Disposition_Type_Id])
REFERENCES [miBuilds].[lk_Disposition_Type] ([Disposition_Type_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_Disposition_Type_Disposition_Type_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_Download_Speed_Download_Speed_Id] FOREIGN KEY([Download_Speed_Id])
REFERENCES [miBuilds].[lk_Download_Speed] ([Download_Speed_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_Download_Speed_Download_Speed_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_Region_Region_Id] FOREIGN KEY([Region_Id])
REFERENCES [miBuilds].[lk_Region] ([Region_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_Region_Region_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_State_State_Id] FOREIGN KEY([State_Id])
REFERENCES [miBuilds].[lk_State] ([State_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_State_State_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_Survey_Type_Survey_Type_Id] FOREIGN KEY([Survey_Type_Id])
REFERENCES [miBuilds].[lk_Survey_Type] ([Survey_Type_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_Survey_Type_Survey_Type_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_Term_Length_Term_Length_Id] FOREIGN KEY([Term_Length_Id])
REFERENCES [miBuilds].[lk_Term_Length] ([Term_Length_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_Term_Length_Term_Length_Id]
GO
ALTER TABLE [miBuilds].[app_Probuild]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_lk_Transport_Type_Transport_Type_Id] FOREIGN KEY([Transport_Type_Id])
REFERENCES [miBuilds].[lk_Transport_Type] ([Transport_Type_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild] CHECK CONSTRAINT [FK_app_Probuild_lk_Transport_Type_Transport_Type_Id]
GO
