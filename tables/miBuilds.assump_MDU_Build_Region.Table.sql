USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[assump_MDU_Build_Region]    Script Date: 1/8/2019 3:27:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[assump_MDU_Build_Region](
	[MDU_Build_Region_Assump_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Region_Id] [int] NOT NULL,
	[Video_Penetration] [decimal](5, 3) NULL,
	[Data_Penetration] [decimal](5, 3) NULL,
	[Voice_Penetration] [decimal](5, 3) NULL,
	[Video_ARPU] [decimal](20, 2) NULL,
	[Data_ARPU] [decimal](20, 2) NULL,
	[Voice_ARPU] [decimal](20, 2) NULL,
	[IsActive] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
 CONSTRAINT [PK_assump_MDU_Build_Region_MDU_Build_Region_Assump_Id] PRIMARY KEY CLUSTERED 
(
	[MDU_Build_Region_Assump_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[assump_MDU_Build_Region]  WITH CHECK ADD  CONSTRAINT [FK_assump_MDU_Build_Region_lk_Region_Region_Id] FOREIGN KEY([Region_Id])
REFERENCES [miBuilds].[lk_Region] ([Region_Id])
GO
ALTER TABLE [miBuilds].[assump_MDU_Build_Region] CHECK CONSTRAINT [FK_assump_MDU_Build_Region_lk_Region_Region_Id]
GO
