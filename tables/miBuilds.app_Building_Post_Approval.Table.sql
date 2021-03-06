USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_Building_Post_Approval]    Script Date: 1/8/2019 3:27:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_Building_Post_Approval](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Building_Id] [int] NULL,
	[Probuild_Id] [int] NULL,
	[Probuild_Name] [varchar](255) NULL,
	[Added] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[Uploaded] [int] NULL,
	[UploadedOn] [datetime] NULL,
	[UploadedBy] [varchar](100) NULL,
	[Processed] [int] NULL,
	[ProcessedOn] [datetime] NULL,
	[ProcessedBy] [varchar](100) NULL,
 CONSTRAINT [PK_app_Building_Post_Approval_Record_Id] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
