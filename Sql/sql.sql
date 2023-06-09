USE [master]
GO
/****** Object:  Database [virtual_classroom_db]    Script Date: 4/4/2023 3:09:39 AM ******/
CREATE DATABASE [virtual_classroom_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'virtual_classroom_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\virtual_classroom_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'virtual_classroom_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\virtual_classroom_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [virtual_classroom_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [virtual_classroom_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [virtual_classroom_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [virtual_classroom_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [virtual_classroom_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [virtual_classroom_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [virtual_classroom_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET RECOVERY FULL 
GO
ALTER DATABASE [virtual_classroom_db] SET  MULTI_USER 
GO
ALTER DATABASE [virtual_classroom_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [virtual_classroom_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [virtual_classroom_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [virtual_classroom_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [virtual_classroom_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [virtual_classroom_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'virtual_classroom_db', N'ON'
GO
ALTER DATABASE [virtual_classroom_db] SET QUERY_STORE = OFF
GO
USE [virtual_classroom_db]
GO
/****** Object:  Table [dbo].[classroom]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classroom](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code_class] [varchar](255) NULL,
	[description_class] [varchar](255) NULL,
	[name_class] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[timestamp] [datetime2](7) NULL,
	[news_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[homework]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[homework](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [varbinary](max) NULL,
	[description] [varchar](255) NULL,
	[homework_code] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[score] [int] NULL,
	[size] [bigint] NULL,
	[class_id] [bigint] NOT NULL,
	[parent_homework_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[homework_user]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[homework_user](
	[homework_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[homework_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NULL,
	[timestamp] [datetime2](7) NULL,
	[title] [varchar](255) NULL,
	[class_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news_user]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news_user](
	[news_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[news_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_class]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_class](
	[user_id] [bigint] NOT NULL,
	[class_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 4/4/2023 3:09:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[reset_pass_token] [varchar](255) NULL,
	[user_email] [varchar](255) NULL,
	[user_name] [varchar](255) NULL,
	[user_password] [varchar](255) NULL,
	[user_status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[classroom] ON 

INSERT [dbo].[classroom] ([id], [code_class], [description_class], [name_class]) VALUES (1, N'983707', N'123456', N'l?p toán')
INSERT [dbo].[classroom] ([id], [code_class], [description_class], [name_class]) VALUES (2, N'359213', N'123', N'l?p van')
SET IDENTITY_INSERT [dbo].[classroom] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'STUDENT')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'TEACHER')
INSERT [dbo].[roles] ([id], [name]) VALUES (3, N'ADMIN')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
INSERT [dbo].[user_class] ([user_id], [class_id]) VALUES (1, 1)
INSERT [dbo].[user_class] ([user_id], [class_id]) VALUES (1, 2)
GO
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (1, 2)
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (2, 1)
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [reset_pass_token], [user_email], [user_name], [user_password], [user_status]) VALUES (1, NULL, N'teacher@gmail.com', N'teacher', N'$2a$10$r3OJNPwPWCT9xCMJ7QKCNOPpYYAa4SeB.7iYBVq11FBZ.DcVgLtSq', NULL)
INSERT [dbo].[users] ([id], [reset_pass_token], [user_email], [user_name], [user_password], [user_status]) VALUES (2, NULL, N'student@gmail.com', N'student', N'$2a$10$VKdBrNVluJ5DhhuLiaovr.zhjs4BN0gKPPrC38vRnGnRqQenI2ydy', NULL)
INSERT [dbo].[users] ([id], [reset_pass_token], [user_email], [user_name], [user_password], [user_status]) VALUES (3, NULL, N'admin@gmail.com', N'admin', N'$2a$10$fS/No2X6NY1.hzGbBv5QqeIHfR.6XY9DSoE2G8qL4..9.W2OE6Q46', NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FKnxm8x9npdhuwxv2x2wxsghm17] FOREIGN KEY([news_id])
REFERENCES [dbo].[news] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FKnxm8x9npdhuwxv2x2wxsghm17]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FKqm52p1v3o13hy268he0wcngr5] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FKqm52p1v3o13hy268he0wcngr5]
GO
ALTER TABLE [dbo].[homework]  WITH CHECK ADD  CONSTRAINT [FK9xwbqs1bki99ou9xnxjtggh0c] FOREIGN KEY([parent_homework_id])
REFERENCES [dbo].[homework] ([id])
GO
ALTER TABLE [dbo].[homework] CHECK CONSTRAINT [FK9xwbqs1bki99ou9xnxjtggh0c]
GO
ALTER TABLE [dbo].[homework]  WITH CHECK ADD  CONSTRAINT [FKn1ui9ewnbiu3vw2gp0kc6jxje] FOREIGN KEY([class_id])
REFERENCES [dbo].[classroom] ([id])
GO
ALTER TABLE [dbo].[homework] CHECK CONSTRAINT [FKn1ui9ewnbiu3vw2gp0kc6jxje]
GO
ALTER TABLE [dbo].[homework_user]  WITH CHECK ADD  CONSTRAINT [FKn8o7bqyur225pxwu0e2nnbrg7] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[homework_user] CHECK CONSTRAINT [FKn8o7bqyur225pxwu0e2nnbrg7]
GO
ALTER TABLE [dbo].[homework_user]  WITH CHECK ADD  CONSTRAINT [FKos6qejhkyqx3ugym74exyrc55] FOREIGN KEY([homework_id])
REFERENCES [dbo].[homework] ([id])
GO
ALTER TABLE [dbo].[homework_user] CHECK CONSTRAINT [FKos6qejhkyqx3ugym74exyrc55]
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD  CONSTRAINT [FKf9vbp25r68cy0vyrmakob4p6] FOREIGN KEY([class_id])
REFERENCES [dbo].[classroom] ([id])
GO
ALTER TABLE [dbo].[news] CHECK CONSTRAINT [FKf9vbp25r68cy0vyrmakob4p6]
GO
ALTER TABLE [dbo].[news_user]  WITH CHECK ADD  CONSTRAINT [FKmab7hwwyla3mpc38asv3okucm] FOREIGN KEY([news_id])
REFERENCES [dbo].[news] ([id])
GO
ALTER TABLE [dbo].[news_user] CHECK CONSTRAINT [FKmab7hwwyla3mpc38asv3okucm]
GO
ALTER TABLE [dbo].[news_user]  WITH CHECK ADD  CONSTRAINT [FKpc5o31e83px1gq5gifa3u1rd2] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[news_user] CHECK CONSTRAINT [FKpc5o31e83px1gq5gifa3u1rd2]
GO
ALTER TABLE [dbo].[user_class]  WITH CHECK ADD  CONSTRAINT [FKn7a0281tjtcfwrq86ij6sspk8] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_class] CHECK CONSTRAINT [FKn7a0281tjtcfwrq86ij6sspk8]
GO
ALTER TABLE [dbo].[user_class]  WITH CHECK ADD  CONSTRAINT [FKrklbgwfxq2b88cwb63p1ro70b] FOREIGN KEY([class_id])
REFERENCES [dbo].[classroom] ([id])
GO
ALTER TABLE [dbo].[user_class] CHECK CONSTRAINT [FKrklbgwfxq2b88cwb63p1ro70b]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FKj345gk1bovqvfame88rcx7yyx] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FKj345gk1bovqvfame88rcx7yyx]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FKt7e7djp752sqn6w22i6ocqy6q] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FKt7e7djp752sqn6w22i6ocqy6q]
GO
USE [master]
GO
ALTER DATABASE [virtual_classroom_db] SET  READ_WRITE 
GO
