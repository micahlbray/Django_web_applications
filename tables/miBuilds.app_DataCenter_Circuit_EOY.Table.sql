USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_DataCenter_Circuit_EOY]    Script Date: 1/8/2019 3:27:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_DataCenter_Circuit_EOY](
	[DataCenter_Id] [int] NOT NULL,
	[Yr] [int] NULL,
	[Circuit_Ct] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_DataCenter_Circuit_EOY]  WITH CHECK ADD  CONSTRAINT [FK_app_DataCenter_Circuit_EOY_app_DataCenter_DataCenter_Id] FOREIGN KEY([DataCenter_Id])
REFERENCES [miBuilds].[app_DataCenter] ([DataCenter_Id])
GO
ALTER TABLE [miBuilds].[app_DataCenter_Circuit_EOY] CHECK CONSTRAINT [FK_app_DataCenter_Circuit_EOY_app_DataCenter_DataCenter_Id]
GO
