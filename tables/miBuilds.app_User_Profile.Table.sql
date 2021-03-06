USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[app_User_Profile]    Script Date: 1/8/2019 3:27:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[app_User_Profile](
	[User_Profile_Id] [int] IDENTITY(1,1) NOT NULL,
	[Auth_User_Id] [int] NOT NULL,
	[NT_Login] [varchar](255) NULL,
	[User_FirstName] [varchar](255) NULL,
	[User_LastName] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Region_Id] [int] NULL,
	[User_Group_Id] [int] NULL,
	[User_Group_Permission_Id] [int] NULL,
	[IsActive] [int] NULL,
	[AddedOn] [datetime] NULL,
	[AddedBy] [varchar](100) NULL,
	[EditedOn] [datetime] NULL,
	[EditedBy] [varchar](100) NULL,
 CONSTRAINT [PK_app_User_Profile_User_Profile_Id] PRIMARY KEY CLUSTERED 
(
	[User_Profile_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[app_User_Profile]  WITH CHECK ADD  CONSTRAINT [FK_app_User_Profile_app_User_Group_Permission_User_Group_Permission_Id] FOREIGN KEY([User_Group_Permission_Id])
REFERENCES [miBuilds].[app_User_Group_Permission] ([User_Group_Permission_Id])
GO
ALTER TABLE [miBuilds].[app_User_Profile] CHECK CONSTRAINT [FK_app_User_Profile_app_User_Group_Permission_User_Group_Permission_Id]
GO
ALTER TABLE [miBuilds].[app_User_Profile]  WITH CHECK ADD  CONSTRAINT [FK_app_User_Profile_auth_User_Auth_User_Id] FOREIGN KEY([Auth_User_Id])
REFERENCES [miBuilds].[auth_user] ([id])
GO
ALTER TABLE [miBuilds].[app_User_Profile] CHECK CONSTRAINT [FK_app_User_Profile_auth_User_Auth_User_Id]
GO
ALTER TABLE [miBuilds].[app_User_Profile]  WITH CHECK ADD  CONSTRAINT [FK_app_User_Profile_lk_Region_Region_Id] FOREIGN KEY([Region_Id])
REFERENCES [miBuilds].[lk_Region] ([Region_Id])
GO
ALTER TABLE [miBuilds].[app_User_Profile] CHECK CONSTRAINT [FK_app_User_Profile_lk_Region_Region_Id]
GO
ALTER TABLE [miBuilds].[app_User_Profile]  WITH CHECK ADD  CONSTRAINT [FK_app_User_Profile_lk_User_Group_User_Group_Id] FOREIGN KEY([User_Group_Id])
REFERENCES [miBuilds].[lk_User_Group] ([User_Group_Id])
GO
ALTER TABLE [miBuilds].[app_User_Profile] CHECK CONSTRAINT [FK_app_User_Profile_lk_User_Group_User_Group_Id]
GO
