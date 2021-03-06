USE [master]
GO
/****** Object:  Database [ProcessWizard]    Script Date: 5/26/2018 10:37:11 PM ******/
CREATE DATABASE [ProcessWizard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProcessWizard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProcessWizard.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProcessWizard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ProcessWizard_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProcessWizard] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProcessWizard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProcessWizard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProcessWizard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProcessWizard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProcessWizard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProcessWizard] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProcessWizard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProcessWizard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProcessWizard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProcessWizard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProcessWizard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProcessWizard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProcessWizard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProcessWizard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProcessWizard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProcessWizard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProcessWizard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProcessWizard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProcessWizard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProcessWizard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProcessWizard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProcessWizard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProcessWizard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProcessWizard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProcessWizard] SET  MULTI_USER 
GO
ALTER DATABASE [ProcessWizard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProcessWizard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProcessWizard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProcessWizard] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProcessWizard] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProcessWizard]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/26/2018 10:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeDetail]    Script Date: 5/26/2018 10:37:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchNo] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[WorkFlowStage] [int] NULL CONSTRAINT [DF_EmployeeDetail_WorkFlowStage]  DEFAULT ((0)),
	[IsCompleted] [bit] NULL CONSTRAINT [DF_EmployeeDetail_IsCompleted]  DEFAULT ((0)),
 CONSTRAINT [PK_EmployeeDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Email], [Password]) VALUES (1, N'dhirenpatel@hotmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[EmployeeDetail] ON 

INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (1, N'1', N'Ahmedabad', N'Mihir', N'Patel', N'Anand', N'Gujarat', N'India', 30, 1)
INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (2, N'12', N'Anand', N'Vicky', N'Shah', N'Anand', N'Gujarat', N'India', 30, 1)
INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (3, N'2', N'Anand', N'Kajal', N'Patel', N'Anand', N'Gujarat', N'India', 30, 1)
INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (4, N'3', N'Vadodara', N'Nevil', N'Shah', N'Anand', N'Gujarat', N'India', 30, 1)
INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (5, N'5', N'Anand', N'Vatsal', N'Patel', N'Anand', N'Gujarat', N'India', 30, 1)
INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (6, N'6', N'Anand', N'Kusum', N'Patel', NULL, NULL, NULL, 20, 0)
INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (7, N'7', N'abc', NULL, NULL, NULL, NULL, NULL, 10, 0)
INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (8, N'8', N'om', NULL, NULL, NULL, NULL, NULL, 10, 0)
INSERT [dbo].[EmployeeDetail] ([Id], [BranchNo], [Name], [FirstName], [LastName], [City], [State], [Country], [WorkFlowStage], [IsCompleted]) VALUES (9, N'9', N'xyz', NULL, NULL, NULL, NULL, NULL, 10, 0)
SET IDENTITY_INSERT [dbo].[EmployeeDetail] OFF
USE [master]
GO
ALTER DATABASE [ProcessWizard] SET  READ_WRITE 
GO
