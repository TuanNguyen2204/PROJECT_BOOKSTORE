USE [master]
GO
/****** Object:  Database [PRJ_BookStore]    Script Date: 03/23/2022 11:08:09 ******/
CREATE DATABASE [PRJ_BookStore] ON  PRIMARY 
( NAME = N'PRJ_BookStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PRJ_BookStore.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRJ_BookStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\PRJ_BookStore_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRJ_BookStore] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ_BookStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ_BookStore] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PRJ_BookStore] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PRJ_BookStore] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PRJ_BookStore] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PRJ_BookStore] SET ARITHABORT OFF
GO
ALTER DATABASE [PRJ_BookStore] SET AUTO_CLOSE ON
GO
ALTER DATABASE [PRJ_BookStore] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PRJ_BookStore] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PRJ_BookStore] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PRJ_BookStore] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PRJ_BookStore] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PRJ_BookStore] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PRJ_BookStore] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PRJ_BookStore] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PRJ_BookStore] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PRJ_BookStore] SET  ENABLE_BROKER
GO
ALTER DATABASE [PRJ_BookStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PRJ_BookStore] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PRJ_BookStore] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PRJ_BookStore] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PRJ_BookStore] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PRJ_BookStore] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PRJ_BookStore] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PRJ_BookStore] SET  READ_WRITE
GO
ALTER DATABASE [PRJ_BookStore] SET RECOVERY SIMPLE
GO
ALTER DATABASE [PRJ_BookStore] SET  MULTI_USER
GO
ALTER DATABASE [PRJ_BookStore] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PRJ_BookStore] SET DB_CHAINING OFF
GO
USE [PRJ_BookStore]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 03/23/2022 11:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[catid] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[catid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 03/23/2022 11:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [varchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 03/23/2022 11:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[pid] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[catid] [varchar](50) NOT NULL,
	[image] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 03/23/2022 11:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carts](
	[username] [varchar](50) NOT NULL,
	[pid] [varchar](50) NOT NULL,
	[amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 03/23/2022 11:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bills](
	[bid] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pid] [varchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[amount] [int] NOT NULL,
	[total] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Products_Categories]    Script Date: 03/23/2022 11:08:10 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([catid])
REFERENCES [dbo].[Categories] ([catid])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
/****** Object:  ForeignKey [FK_Carts_Accounts]    Script Date: 03/23/2022 11:08:10 ******/
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Accounts] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Accounts]
GO
/****** Object:  ForeignKey [FK_Carts_Products]    Script Date: 03/23/2022 11:08:10 ******/
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
/****** Object:  ForeignKey [FK_Bills_Accounts]    Script Date: 03/23/2022 11:08:10 ******/
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Accounts] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Accounts]
GO
/****** Object:  ForeignKey [FK_Bills_Products]    Script Date: 03/23/2022 11:08:10 ******/
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Products] FOREIGN KEY([pid])
REFERENCES [dbo].[Products] ([pid])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Products]
GO
