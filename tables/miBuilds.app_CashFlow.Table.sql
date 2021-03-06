USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_CashFlow]    Script Date: 1/8/2019 3:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_CashFlow](
	[CashFlow_Id] [int] IDENTITY(1,1) NOT NULL,
	[Probuild_Id] [int] NOT NULL,
	[Category] [varchar](255) NULL,
	[Mnth] [int] NULL,
	[Value] [decimal](22, 6) NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL,
 CONSTRAINT [PK_app_CashFlow_CashFlow_Id] PRIMARY KEY CLUSTERED 
(
	[CashFlow_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_CashFlow]  WITH CHECK ADD  CONSTRAINT [FK_app_CashFlow_app_Probuild_Probuild_Id] FOREIGN KEY([Probuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[app_CashFlow] CHECK CONSTRAINT [FK_app_CashFlow_app_Probuild_Probuild_Id]
GO
