USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_Business]    Script Date: 1/8/2019 3:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_Business](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Building_Id] [bigint] NULL,
	[ProBuild_Id] [int] NOT NULL,
	[Business_Id] [int] NULL,
	[Business_Name] [varchar](255) NULL,
	[Segment_Type_Id] [int] NULL,
	[Segment_Assump_Id] [int] NULL,
	[Revised_Segment_Type_Id] [int] NULL,
	[Revised_Segment_Notes] [varchar](255) NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL,
	[Address_Id] [bigint] NULL,
	[Address_1] [nvarchar](255) NULL,
	[Address_2] [nvarchar](255) NULL,
	[Sellability_Color_Coax] [varchar](20) NULL,
	[Sellability_Color_Fiber] [varchar](20) NULL,
	[MIP_In_Or_Out] [varchar](3) NULL,
	[City] [varchar](150) NULL,
	[State_Id] [int] NULL,
	[Zip] [varchar](50) NULL,
	[ROE_Id] [int] NULL,
 CONSTRAINT [PK_app_Business_Record_Id] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_Business]  WITH CHECK ADD  CONSTRAINT [FK_app_Business_app_Business_Probuild_Id] FOREIGN KEY([ProBuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[app_Business] CHECK CONSTRAINT [FK_app_Business_app_Business_Probuild_Id]
GO
ALTER TABLE [miBuilds].[app_Business]  WITH CHECK ADD  CONSTRAINT [FK_app_Business_assump_Segment_Segment_Assump_Id] FOREIGN KEY([Segment_Assump_Id])
REFERENCES [miBuilds].[assump_Segment] ([Segment_Assump_Id])
GO
ALTER TABLE [miBuilds].[app_Business] CHECK CONSTRAINT [FK_app_Business_assump_Segment_Segment_Assump_Id]
GO
ALTER TABLE [miBuilds].[app_Business]  WITH CHECK ADD  CONSTRAINT [FK_app_Business_lk_Segment_Type_Revised_Segment_Type_Id] FOREIGN KEY([Revised_Segment_Type_Id])
REFERENCES [miBuilds].[lk_Segment_Type] ([Segment_Type_Id])
GO
ALTER TABLE [miBuilds].[app_Business] CHECK CONSTRAINT [FK_app_Business_lk_Segment_Type_Revised_Segment_Type_Id]
GO
ALTER TABLE [miBuilds].[app_Business]  WITH CHECK ADD  CONSTRAINT [FK_app_Business_lk_Segment_Type_Segment_Type_Id] FOREIGN KEY([Segment_Type_Id])
REFERENCES [miBuilds].[lk_Segment_Type] ([Segment_Type_Id])
GO
ALTER TABLE [miBuilds].[app_Business] CHECK CONSTRAINT [FK_app_Business_lk_Segment_Type_Segment_Type_Id]
GO
ALTER TABLE [miBuilds].[app_Business]  WITH CHECK ADD  CONSTRAINT [FK_app_Business_lk_State_State_Id] FOREIGN KEY([State_Id])
REFERENCES [miBuilds].[lk_State] ([State_Id])
GO
ALTER TABLE [miBuilds].[app_Business] CHECK CONSTRAINT [FK_app_Business_lk_State_State_Id]
GO
