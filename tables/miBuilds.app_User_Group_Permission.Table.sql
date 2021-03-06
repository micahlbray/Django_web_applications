USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_User_Group_Permission]    Script Date: 1/8/2019 3:27:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_User_Group_Permission](
	[User_Group_Permission_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[User_Group_Id] [int] NOT NULL,
	[CanCreate] [int] NULL,
	[CanSubmit] [int] NULL,
	[CanApprove] [int] NULL,
	[CanEditSubmitted] [int] NULL,
	[CanEditApproved] [int] NULL,
	[CanViewOnlyCreated] [int] NULL,
	[CanViewAllRegion] [int] NULL,
	[CanViewAllDivision] [int] NULL,
	[CanDeleteOnlyCreated] [int] NULL,
	[CanDeleteAllRegion] [int] NULL,
	[CanDeleteAllDivision] [int] NULL,
	[CAR_MinApproval] [decimal](20, 2) NULL,
	[CAR_MaxApproval] [decimal](20, 2) NULL,
	[IRR_MinApproval] [decimal](5, 3) NULL,
	[IRR_MaxApproval] [decimal](5, 3) NULL,
	[IsActive] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
	[CanViewOnly] [int] NULL,
 CONSTRAINT [PK_app_User_Group_Permission_User_Group_Permission_Id] PRIMARY KEY CLUSTERED 
(
	[User_Group_Permission_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_User_Group_Permission]  WITH CHECK ADD  CONSTRAINT [FK_app_User_Group_Permission_lk_User_Group_User_Group_Id] FOREIGN KEY([User_Group_Id])
REFERENCES [miBuilds].[lk_User_Group] ([User_Group_Id])
GO
ALTER TABLE [miBuilds].[app_User_Group_Permission] CHECK CONSTRAINT [FK_app_User_Group_Permission_lk_User_Group_User_Group_Id]
GO
