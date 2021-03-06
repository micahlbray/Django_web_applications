USE [BI_MIP]
GO
/****** Object:  Table [miBuilds].[auth_user_groups]    Script Date: 1/8/2019 3:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [miBuilds].[auth_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [auth_user_groups_user_id_group_id_94350c0c_uniq] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [miBuilds].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [miBuilds].[auth_group] ([id])
GO
ALTER TABLE [miBuilds].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [miBuilds].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [miBuilds].[auth_user] ([id])
GO
ALTER TABLE [miBuilds].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
