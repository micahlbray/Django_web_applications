USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_SF_DealInHand]    Script Date: 1/8/2019 3:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_SF_DealInHand](
	[SF_DealInHand_Id] [int] IDENTITY(1,1) NOT NULL,
	[Probuild_Id] [int] NOT NULL,
	[Opportunity_Id] [varchar](255) NULL,
	[Customer_Name] [varchar](255) NULL,
	[Term_Length_Id] [int] NULL,
	[Segment_Type_Id] [int] NULL,
	[MRR] [decimal](20, 2) NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL,
 CONSTRAINT [PK_app_SF_DealInHand_SF_DealInHand_Id] PRIMARY KEY CLUSTERED 
(
	[SF_DealInHand_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_SF_DealInHand]  WITH CHECK ADD  CONSTRAINT [FK_app_SF_DealInHand_app_Probuild_Probuild_Id] FOREIGN KEY([Probuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[app_SF_DealInHand] CHECK CONSTRAINT [FK_app_SF_DealInHand_app_Probuild_Probuild_Id]
GO
ALTER TABLE [miBuilds].[app_SF_DealInHand]  WITH CHECK ADD  CONSTRAINT [FK_app_SF_DealInHand_lk_Segment_Type_Segment_Type_Id] FOREIGN KEY([Segment_Type_Id])
REFERENCES [miBuilds].[lk_Segment_Type] ([Segment_Type_Id])
GO
ALTER TABLE [miBuilds].[app_SF_DealInHand] CHECK CONSTRAINT [FK_app_SF_DealInHand_lk_Segment_Type_Segment_Type_Id]
GO
ALTER TABLE [miBuilds].[app_SF_DealInHand]  WITH CHECK ADD  CONSTRAINT [FK_app_SF_DealInHand_lk_Term_Length_Term_Length_Id] FOREIGN KEY([Term_Length_Id])
REFERENCES [miBuilds].[lk_Term_Length] ([Term_Length_Id])
GO
ALTER TABLE [miBuilds].[app_SF_DealInHand] CHECK CONSTRAINT [FK_app_SF_DealInHand_lk_Term_Length_Term_Length_Id]
GO
