USE [master]
GO
/****** Object:  Database [Aakar]    Script Date: 08/01/2021 01:37:33 م ******/
CREATE DATABASE [Aakar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstat', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\RealEstat.mdf' , SIZE = 19520KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RealEstat_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\RealEstat_log.ldf' , SIZE = 3520KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Aakar] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aakar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aakar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Aakar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Aakar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Aakar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Aakar] SET ARITHABORT OFF 
GO
ALTER DATABASE [Aakar] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Aakar] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Aakar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Aakar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Aakar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Aakar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Aakar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Aakar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Aakar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Aakar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Aakar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Aakar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Aakar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Aakar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Aakar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Aakar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Aakar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Aakar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Aakar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Aakar] SET  MULTI_USER 
GO
ALTER DATABASE [Aakar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Aakar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Aakar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Aakar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Aakar]
GO
/****** Object:  Table [dbo].[apartments]    Script Date: 08/01/2021 01:37:34 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apartments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[area] [nvarchar](50) NULL,
	[floor] [nvarchar](50) NULL,
	[room_count] [int] NULL,
	[price] [int] NULL,
	[details] [nvarchar](300) NULL,
	[available] [bit] NOT NULL,
	[kiswa] [nvarchar](50) NULL,
	[main_img] [image] NULL,
 CONSTRAINT [PK_apartments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 08/01/2021 01:37:34 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[text] [nvarchar](300) NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rentals]    Script Date: 08/01/2021 01:37:34 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[apartment_id] [int] NULL,
	[rental_date] [date] NULL,
	[rental_period] [nvarchar](50) NULL,
	[price] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_rentals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rom_images]    Script Date: 08/01/2021 01:37:34 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rom_images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image] [image] NULL,
	[apart_id] [int] NOT NULL,
 CONSTRAINT [PK_rom_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 08/01/2021 01:37:34 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[apartments] ADD  CONSTRAINT [DF_apartments_available]  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_type]  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_users]
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD  CONSTRAINT [FK_rentals_apartments] FOREIGN KEY([apartment_id])
REFERENCES [dbo].[apartments] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rentals] CHECK CONSTRAINT [FK_rentals_apartments]
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD  CONSTRAINT [FK_rentals_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[rentals] CHECK CONSTRAINT [FK_rentals_users]
GO
ALTER TABLE [dbo].[rom_images]  WITH CHECK ADD  CONSTRAINT [FK_rom_images_apartments] FOREIGN KEY([apart_id])
REFERENCES [dbo].[apartments] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rom_images] CHECK CONSTRAINT [FK_rom_images_apartments]
GO
USE [master]
GO
ALTER DATABASE [Aakar] SET  READ_WRITE 
GO
