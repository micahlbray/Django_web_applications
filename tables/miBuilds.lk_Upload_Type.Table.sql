USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[lk_Upload_Type]    Script Date: 1/8/2019 3:27:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[lk_Upload_Type](
	[Upload_Type_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[IsActive] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
 CONSTRAINT [PK_lk_Upload_Type_Upload_Type_Id] PRIMARY KEY CLUSTERED 
(
	[Upload_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
