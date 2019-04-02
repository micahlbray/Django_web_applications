USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[rpt_CAR_Value_Diff]    Script Date: 1/8/2019 3:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[rpt_CAR_Value_Diff](
	[Probuild_id] [float] NULL,
	[BUILD_NAME] [nvarchar](255) NULL,
	[Legacy] [float] NULL,
	[Legacy_CAR_Value] [float] NULL,
	[New_CAR_Value] [float] NULL,
	[CAR_Diff] [float] NULL
) ON [PRIMARY]
GO
