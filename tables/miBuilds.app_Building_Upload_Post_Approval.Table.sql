USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_Building_Upload_Post_Approval]    Script Date: 1/8/2019 3:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_Building_Upload_Post_Approval](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Path] [varchar](255) NULL,
	[Root] [varchar](255) NULL,
	[Upload_Type_Id] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL,
 CONSTRAINT [PK_app_Building_Upload_Post_Approval_Record_Id] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_Building_Upload_Post_Approval]  WITH CHECK ADD  CONSTRAINT [FK_app_Building_Upload_Post_Approval_lk_Upload_Type_Upload_Type_Id] FOREIGN KEY([Upload_Type_Id])
REFERENCES [miBuilds].[lk_Upload_Type] ([Upload_Type_Id])
GO
ALTER TABLE [miBuilds].[app_Building_Upload_Post_Approval] CHECK CONSTRAINT [FK_app_Building_Upload_Post_Approval_lk_Upload_Type_Upload_Type_Id]
GO
