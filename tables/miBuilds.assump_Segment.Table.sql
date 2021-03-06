USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[assump_Segment]    Script Date: 1/8/2019 3:27:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[assump_Segment](
	[Segment_Assump_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Segment_Type_Id] [int] NOT NULL,
	[Capex] [decimal](20, 2) NULL,
	[Capex_Data_and_Install] [decimal](20, 2) NULL,
	[Capex_Voice_and_Install] [decimal](20, 2) NULL,
	[Capex_Video_and_Install] [decimal](20, 2) NULL,
	[Maint_Opex] [decimal](20, 2) NULL,
	[Opex_Load] [decimal](5, 3) NULL,
	[Churn] [decimal](5, 3) NULL,
	[IsActive] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](50) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
 CONSTRAINT [PK_assump_Segment_Segment_Assump_Id] PRIMARY KEY CLUSTERED 
(
	[Segment_Assump_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[assump_Segment]  WITH CHECK ADD  CONSTRAINT [FK_assump_Segment_lk_Segment_Segment_Type_Id] FOREIGN KEY([Segment_Type_Id])
REFERENCES [miBuilds].[lk_Segment_Type] ([Segment_Type_Id])
GO
ALTER TABLE [miBuilds].[assump_Segment] CHECK CONSTRAINT [FK_assump_Segment_lk_Segment_Segment_Type_Id]
GO
