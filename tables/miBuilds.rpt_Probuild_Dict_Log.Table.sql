USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[rpt_Probuild_Dict_Log]    Script Date: 1/8/2019 3:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[rpt_Probuild_Dict_Log](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Probuild_Id] [int] NOT NULL,
	[Log_Status] [varchar](100) NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[POST_Dict] [nvarchar](max) NULL,
	[META_Dict] [nvarchar](max) NULL,
 CONSTRAINT [PK_rpt_Probuild_Dict_Log_Record_Id] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[rpt_Probuild_Dict_Log]  WITH CHECK ADD  CONSTRAINT [FK_rpt_Probuild_Dict_Log_app_Probuild_Probuild_Id] FOREIGN KEY([Probuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[rpt_Probuild_Dict_Log] CHECK CONSTRAINT [FK_rpt_Probuild_Dict_Log_app_Probuild_Probuild_Id]
GO
