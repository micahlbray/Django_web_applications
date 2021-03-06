USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[xref_Legacy_Build_Name_Match]    Script Date: 1/8/2019 3:27:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[xref_Legacy_Build_Name_Match](
	[Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Business_Build_Name] [varchar](255) NULL,
	[Building_Build_Name] [varchar](255) NULL,
 CONSTRAINT [PK_xref_Legacy_Build_Name_Match_Record_Id] PRIMARY KEY CLUSTERED 
(
	[Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
