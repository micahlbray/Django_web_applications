USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_DataCenter]    Script Date: 1/8/2019 3:27:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_DataCenter](
	[DataCenter_Id] [int] IDENTITY(1,1) NOT NULL,
	[Probuild_Id] [int] NOT NULL,
	[Name] [varchar](255) NULL,
	[Data_Center_Type_Id] [int] NULL,
	[Data_Center_Equip_Type_Id] [int] NOT NULL,
	[Data_Center_Type_Assump_Id] [int] NULL,
	[Data_Center_Equip_Type_Assump_Id] [int] NULL,
	[Data_Center_Circuit_EOY_Assump_Id] [int] NULL,
	[Comments] [varchar](255) NULL,
	[IsConnected] [int] NULL,
	[DC_Circuit_Ct] [int] NULL,
	[Rack] [decimal](20, 2) NULL,
	[Colo_Fee] [decimal](20, 2) NULL,
	[Connect_Cost] [decimal](20, 2) NULL,
	[MRR_Per_Circ_Avg] [decimal](20, 2) NULL,
	[Equip_Capex] [decimal](20, 2) NULL,
	[Equip_Opex] [decimal](20, 2) NULL,
	[Opex_Pct] [decimal](5, 3) NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[Deleted] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL,
	[Yr1_Circuit_Ct] [int] NULL,
	[Yr2_Circuit_Ct] [int] NULL,
	[Yr3_Circuit_Ct] [int] NULL,
	[Yr4_Circuit_Ct] [int] NULL,
	[Yr5_Circuit_Ct] [int] NULL,
 CONSTRAINT [PK_app_DataCenter_DataCenter_Id] PRIMARY KEY CLUSTERED 
(
	[DataCenter_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_DataCenter]  WITH CHECK ADD  CONSTRAINT [FK_app_DataCenter_app_Probuild_Probuild_Id] FOREIGN KEY([Probuild_Id])
REFERENCES [miBuilds].[app_Probuild] ([Probuild_Id])
GO
ALTER TABLE [miBuilds].[app_DataCenter] CHECK CONSTRAINT [FK_app_DataCenter_app_Probuild_Probuild_Id]
GO
ALTER TABLE [miBuilds].[app_DataCenter]  WITH CHECK ADD  CONSTRAINT [FK_app_DataCenter_assump_Data_Center_Equip_Type_Data_Center_Equip_Type_Assump_Id] FOREIGN KEY([Data_Center_Equip_Type_Assump_Id])
REFERENCES [miBuilds].[assump_Data_Center_Equip_Type] ([Data_Center_Equip_Type_Assump_Id])
GO
ALTER TABLE [miBuilds].[app_DataCenter] CHECK CONSTRAINT [FK_app_DataCenter_assump_Data_Center_Equip_Type_Data_Center_Equip_Type_Assump_Id]
GO
ALTER TABLE [miBuilds].[app_DataCenter]  WITH CHECK ADD  CONSTRAINT [FK_app_DataCenter_assump_Data_Center_Type_Data_Center_Type_Assump_Id] FOREIGN KEY([Data_Center_Type_Assump_Id])
REFERENCES [miBuilds].[assump_Data_Center_Type] ([Data_Center_Type_Assump_Id])
GO
ALTER TABLE [miBuilds].[app_DataCenter] CHECK CONSTRAINT [FK_app_DataCenter_assump_Data_Center_Type_Data_Center_Type_Assump_Id]
GO
ALTER TABLE [miBuilds].[app_DataCenter]  WITH CHECK ADD  CONSTRAINT [FK_app_DataCenter_lk_Data_Center_Equip_Type_Data_Center_Equip_Type_Id] FOREIGN KEY([Data_Center_Equip_Type_Id])
REFERENCES [miBuilds].[lk_Data_Center_Equip_Type] ([Data_Center_Equip_Type_Id])
GO
ALTER TABLE [miBuilds].[app_DataCenter] CHECK CONSTRAINT [FK_app_DataCenter_lk_Data_Center_Equip_Type_Data_Center_Equip_Type_Id]
GO
ALTER TABLE [miBuilds].[app_DataCenter]  WITH CHECK ADD  CONSTRAINT [FK_app_DataCenter_lk_Data_Center_Type_Data_Center_Type_Id] FOREIGN KEY([Data_Center_Type_Id])
REFERENCES [miBuilds].[lk_Data_Center_Type] ([Data_Center_Type_Id])
GO
ALTER TABLE [miBuilds].[app_DataCenter] CHECK CONSTRAINT [FK_app_DataCenter_lk_Data_Center_Type_Data_Center_Type_Id]
GO
