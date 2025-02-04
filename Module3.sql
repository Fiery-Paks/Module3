USE [master]
GO
/****** Object:  Database [Module3DB]    Script Date: 31.01.2025 15:04:19 ******/
CREATE DATABASE [Module3DB]
GO
USE [Module3DB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 31.01.2025 15:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[LastDateAuthorization] [date] NOT NULL,
	[RoleID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[BadLoginTry] [int] NULL,
	[NewUser] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 31.01.2025 15:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 31.01.2025 15:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([ID], [Login], [Password], [FullName], [LastDateAuthorization], [RoleID], [StatusID], [BadLoginTry], [NewUser]) VALUES (1, N'login1', N'password1', N'Иванов Иван Иванович', CAST(N'2025-01-30' AS Date), 2, 1, 0, 1)
INSERT [dbo].[Accounts] ([ID], [Login], [Password], [FullName], [LastDateAuthorization], [RoleID], [StatusID], [BadLoginTry], [NewUser]) VALUES (2, N'login2', N'password2', N'Петров Пётр Петрович', CAST(N'2025-01-26' AS Date), 2, 1, 0, 1)
INSERT [dbo].[Accounts] ([ID], [Login], [Password], [FullName], [LastDateAuthorization], [RoleID], [StatusID], [BadLoginTry], [NewUser]) VALUES (3, N'login3', N'password3', N'Семёнов Семён Семонович', CAST(N'2024-12-10' AS Date), 2, 2, 0, 0)
INSERT [dbo].[Accounts] ([ID], [Login], [Password], [FullName], [LastDateAuthorization], [RoleID], [StatusID], [BadLoginTry], [NewUser]) VALUES (4, N'login4', N'password4', N'Груздьев Сергей Викторович', CAST(N'2025-01-30' AS Date), 1, 1, NULL, NULL)
GO
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (2, N'User')
GO
INSERT [dbo].[Statuses] ([ID], [Name]) VALUES (1, N'Active')
INSERT [dbo].[Statuses] ([ID], [Name]) VALUES (2, N'Blocked')
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Users_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Users_Statuses]
GO
USE [master]
GO
ALTER DATABASE [Module3DB] SET  READ_WRITE 
GO
