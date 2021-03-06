USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[mktg_Hyperbuild_Query_Log]    Script Date: 1/8/2019 3:27:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[mktg_Hyperbuild_Query_Log](
	[Hyperbuild_Query_Id] [int] IDENTITY(1,1) NOT NULL,
	[Probuild_Id] [int] NOT NULL,
	[Region_Id] [int] NOT NULL,
	[Hyperbuild_Query_Dict] [varchar](max) NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
 CONSTRAINT [PK_mktg_Hyperbuild_Query_Hyperbuild_Query_Id] PRIMARY KEY CLUSTERED 
(
	[Hyperbuild_Query_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[mktg_Hyperbuild_Query_Log]  WITH CHECK ADD  CONSTRAINT [FK_mktg_Hyperbuild_Query_Log_app_Probuild_Probuild_Id] FOREIGN KEY([Probuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[mktg_Hyperbuild_Query_Log] CHECK CONSTRAINT [FK_mktg_Hyperbuild_Query_Log_app_Probuild_Probuild_Id]
GO
ALTER TABLE [miBuilds].[mktg_Hyperbuild_Query_Log]  WITH CHECK ADD  CONSTRAINT [FK_mktg_Hyperbuild_Query_Log_lk_Region_Region_Id] FOREIGN KEY([Region_Id])
REFERENCES [miBuilds].[lk_Region] ([Region_Id])
GO
ALTER TABLE [miBuilds].[mktg_Hyperbuild_Query_Log] CHECK CONSTRAINT [FK_mktg_Hyperbuild_Query_Log_lk_Region_Region_Id]
GO
