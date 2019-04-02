USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[xref_Spectrum_Region_Id]    Script Date: 1/8/2019 3:27:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[xref_Spectrum_Region_Id](
	[Region_Id] [int] NULL,
	[miBuilds_Region_Name] [varchar](100) NULL,
	[Spectrum_Region_Code] [varchar](2) NULL
) ON [PRIMARY]
GO
