USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[xref_Clone_Probuild_Tables_test]    Script Date: 1/8/2019 3:27:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[xref_Clone_Probuild_Tables_test](
	[tbl_DB] [varchar](100) NULL,
	[tbl_Schema] [varchar](100) NULL,
	[tbl_Name] [varchar](100) NULL,
	[tbl_PK] [nvarchar](255) NULL,
	[Record_Id] [int] NULL
) ON [PRIMARY]
GO
