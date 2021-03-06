USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[mktg_Probuild_Campaign]    Script Date: 1/8/2019 3:27:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[mktg_Probuild_Campaign](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Probuild_Id] [int] NOT NULL,
	[Region_Id] [int] NOT NULL,
	[SFDC_ENT_Campaign_Id] [varchar](20) NULL,
	[SFDC_ENT_Campaign_Name] [varchar](200) NULL,
	[SFDC_SMB_Campaign_Id] [varchar](20) NULL,
	[SFDC_SMB_Campaign_Name] [varchar](200) NULL,
 CONSTRAINT [PK_mktg_Probuild_Campaign_Record_Id] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[mktg_Probuild_Campaign]  WITH CHECK ADD  CONSTRAINT [FK_mktg_Probuild_Campaign_app_Probuild_Probuild_Id] FOREIGN KEY([Probuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[mktg_Probuild_Campaign] CHECK CONSTRAINT [FK_mktg_Probuild_Campaign_app_Probuild_Probuild_Id]
GO
ALTER TABLE [miBuilds].[mktg_Probuild_Campaign]  WITH CHECK ADD  CONSTRAINT [FK_mktg_Probuild_Campaign_lk_Region_Region_Id] FOREIGN KEY([Region_Id])
REFERENCES [miBuilds].[lk_Region] ([Region_Id])
GO
ALTER TABLE [miBuilds].[mktg_Probuild_Campaign] CHECK CONSTRAINT [FK_mktg_Probuild_Campaign_lk_Region_Region_Id]
GO
