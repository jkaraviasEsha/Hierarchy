﻿USE [master]
GO
/****** Object:  Database [Tree]    Script Date: 11/23/2020 1:37:05 PM ******/
CREATE DATABASE [Tree]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tree', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tree.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tree_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tree_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tree] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tree].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tree] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tree] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tree] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tree] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tree] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tree] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tree] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tree] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tree] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tree] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tree] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tree] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tree] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tree] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tree] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tree] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tree] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tree] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tree] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tree] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tree] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tree] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tree] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tree] SET  MULTI_USER 
GO
ALTER DATABASE [Tree] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tree] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tree] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tree] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tree] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tree] SET QUERY_STORE = OFF
GO
USE [Tree]
GO
/****** Object:  Table [dbo].[DataNode]    Script Date: 11/23/2020 1:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataNode](
	[Id] [int] NOT NULL,
	[textData] [nvarchar](50) NULL,
	[integerData] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TreeNode]    Script Date: 11/23/2020 1:37:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreeNode](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentId] [bigint] NULL,
	[Data] [nvarchar](50) NULL,
 CONSTRAINT [PK_TreeNode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Tree] SET  READ_WRITE 
GO