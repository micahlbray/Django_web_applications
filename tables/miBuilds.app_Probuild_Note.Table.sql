USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_Probuild_Note]    Script Date: 1/8/2019 3:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_Probuild_Note](
	[Probuild_Note_Id] [int] IDENTITY(1,1) NOT NULL,
	[Probuild_Id] [int] NOT NULL,
	[Note] [varchar](max) NULL,
	[Note_Type_Id] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL,
 CONSTRAINT [PK_app_Probuild_Note_Probuild_Note_Id] PRIMARY KEY CLUSTERED 
(
	[Probuild_Note_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_Probuild_Note]  WITH CHECK ADD  CONSTRAINT [FK_app_Probuild_Note_app_Probuild_Probuild_Id] FOREIGN KEY([Probuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[app_Probuild_Note] CHECK CONSTRAINT [FK_app_Probuild_Note_app_Probuild_Probuild_Id]
GO
