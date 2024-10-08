USE [master]
GO
/****** Object:  Database [DiChoSaiGon_Ecommerce]    Script Date: 08/08/2024 4:12:16 PM ******/
CREATE DATABASE [DiChoSaiGon_Ecommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiChoSaiGon_Ecommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DiChoSaiGon_Ecommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DiChoSaiGon_Ecommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DiChoSaiGon_Ecommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiChoSaiGon_Ecommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET  MULTI_USER 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DiChoSaiGon_Ecommerce', N'ON'
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET QUERY_STORE = OFF
GO
USE [DiChoSaiGon_Ecommerce]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](150) NULL,
	[Phone] [varchar](12) NULL,
	[CreateDate] [datetime] NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](10) NULL,
	[RoleId] [int] NULL,
	[FullName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[BannerID] [int] IDENTITY(1,1) NOT NULL,
	[BannerName] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[DateModified] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[BannerText] [nvarchar](255) NULL,
	[ActiveButton] [bit] NOT NULL,
	[BannerHeaderText] [nvarchar](255) NULL,
	[OrderIndex] [int] NOT NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[BannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[Levels] [int] NULL,
	[Ordering] [int] NULL,
	[Published] [bit] NOT NULL,
	[Thumb] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Cover] [nvarchar](252) NULL,
	[SchemaMarkup] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Birthday] [datetime] NULL,
	[Avatar] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nchar](150) NULL,
	[Phone] [varchar](12) NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](10) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Functions]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[FunctionId] [int] IDENTITY(1,1) NOT NULL,
	[FunctionName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Functions] PRIMARY KEY CLUSTERED 
(
	[FunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [nvarchar](20) NULL,
	[Slug] [nvarchar](100) NULL,
	[NameWithType] [nvarchar](255) NULL,
	[PathWithType] [nvarchar](255) NULL,
	[ParentCode] [int] NULL,
	[Levels] [int] NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](250) NULL,
	[OrderNumber] [int] NULL,
	[Amount] [int] NULL,
	[Discount] [int] NULL,
	[TotalMoney] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[TransactStatusID] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentID] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
	[TotalMoney] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](250) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[CreateAt] [datetime] NULL,
	[Ordering] [int] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[FunctionId] [int] NOT NULL,
	[CanCreate] [bit] NOT NULL,
	[CanRead] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[AccessPermission] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[SContents] [nvarchar](255) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Published] [bit] NOT NULL,
	[Alias] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[Author] [nvarchar](255) NULL,
	[AccountID] [int] NULL,
	[Tags] [nvarchar](max) NULL,
	[CatID] [int] NULL,
	[isHot] [bit] NOT NULL,
	[isNewFeed] [bit] NOT NULL,
	[MetaKey] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[Views] [int] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ShortDesc] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[CatID] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Thumb] [nvarchar](255) NULL,
	[Video] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[BestSellers] [bit] NOT NULL,
	[HomeFlag] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[Alias] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[UnitInStock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](150) NULL,
	[Phone] [nchar](10) NULL,
	[Company] [nvarchar](150) NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactStatus]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TransactStatus] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishLists]    Script Date: 08/08/2024 4:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishLists](
	[WishListID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_WishLists] PRIMARY KEY CLUSTERED 
(
	[WishListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountId], [Email], [Phone], [CreateDate], [LastLogin], [Active], [Password], [Salt], [RoleId], [FullName]) VALUES (1, N'admin@gmail.com                                                                                                                                       ', N'12345', CAST(N'2024-03-17T02:13:18.470' AS DateTime), NULL, 1, N'e9954a02601a6a5454ad5e1ff288dd36', N'vil^0     ', 1, N'Admin')
INSERT [dbo].[Accounts] ([AccountId], [Email], [Phone], [CreateDate], [LastLogin], [Active], [Password], [Salt], [RoleId], [FullName]) VALUES (2, N'Staff1@gmail.com                                                                                                                                      ', N'12345', CAST(N'2024-03-20T02:29:52.030' AS DateTime), NULL, 1, N'6eaa6e764eb224b62983c80f4970e189', N'o*s8$     ', 2, N'Staff 1')
INSERT [dbo].[Accounts] ([AccountId], [Email], [Phone], [CreateDate], [LastLogin], [Active], [Password], [Salt], [RoleId], [FullName]) VALUES (5, N'test@gmail.com                                                                                                                                        ', N'0775122681', CAST(N'2024-04-21T16:22:11.330' AS DateTime), NULL, 1, N'1c16038db843ccb645958d9e2761fe83', N'!9agl     ', 6, N'Nguyễn Tuấn Anh')
INSERT [dbo].[Accounts] ([AccountId], [Email], [Phone], [CreateDate], [LastLogin], [Active], [Password], [Salt], [RoleId], [FullName]) VALUES (7, N'tuananh@gmail.com                                                                                                                                     ', N'32525', CAST(N'2024-05-08T08:21:26.167' AS DateTime), NULL, 1, N'1e6de8bf49bca3dcb4ce9f5f1e769294', N'fo&[~     ', 8, N'Nguyễn Tuấn Anh')
INSERT [dbo].[Accounts] ([AccountId], [Email], [Phone], [CreateDate], [LastLogin], [Active], [Password], [Salt], [RoleId], [FullName]) VALUES (8, N'nguyentuananh30082002@gmail.com                                                                                                                       ', N'0775122681', CAST(N'2024-05-08T10:45:04.757' AS DateTime), NULL, 1, N'ec3f79c8307063c8baabef0c6a5046ed', N'rv%m~     ', 9, N'Nguyễn Tuấn Anh')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Banners] ON 

INSERT [dbo].[Banners] ([BannerID], [BannerName], [Thumb], [DateModified], [Active], [BannerText], [ActiveButton], [BannerHeaderText], [OrderIndex]) VALUES (2, N'Chuối', N'test.jpg', CAST(N'2024-04-06T15:51:33.793' AS DateTime), 0, NULL, 1, NULL, 4)
INSERT [dbo].[Banners] ([BannerID], [BannerName], [Thumb], [DateModified], [Active], [BannerText], [ActiveButton], [BannerHeaderText], [OrderIndex]) VALUES (3, N'Test 2', N'test-2.jpg', CAST(N'2024-04-01T01:48:36.357' AS DateTime), 0, NULL, 1, NULL, 2)
INSERT [dbo].[Banners] ([BannerID], [BannerName], [Thumb], [DateModified], [Active], [BannerText], [ActiveButton], [BannerHeaderText], [OrderIndex]) VALUES (4, N'Background', N'background.jpg', CAST(N'2024-04-28T15:51:15.553' AS DateTime), 1, N'Khuyến mãi cực lớn lên đến 60%!', 1, N'Chỉ trong tháng này!', 3)
INSERT [dbo].[Banners] ([BannerID], [BannerName], [Thumb], [DateModified], [Active], [BannerText], [ActiveButton], [BannerHeaderText], [OrderIndex]) VALUES (5, N'Banner 2', N'banner-2.jpg', CAST(N'2024-04-28T16:05:35.943' AS DateTime), 0, NULL, 1, NULL, 1)
INSERT [dbo].[Banners] ([BannerID], [BannerName], [Thumb], [DateModified], [Active], [BannerText], [ActiveButton], [BannerHeaderText], [OrderIndex]) VALUES (7, N'Banner3', N'banner3.jpg', CAST(N'2024-04-03T01:46:54.560' AS DateTime), 0, NULL, 0, NULL, 5)
INSERT [dbo].[Banners] ([BannerID], [BannerName], [Thumb], [DateModified], [Active], [BannerText], [ActiveButton], [BannerHeaderText], [OrderIndex]) VALUES (8, N'Banner 4', N'banner-4.jpg', CAST(N'2024-04-03T01:49:23.643' AS DateTime), 0, NULL, 0, NULL, 6)
SET IDENTITY_INSERT [dbo].[Banners] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (1, N'Rau Củ', N'Rau củ', NULL, NULL, 1, 1, N'rau-cu.png', N'Rau củ', N'rau-cu', N'1', N'1', NULL, N'1')
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (2, N'Thịt', N'Thịt', 1, 1, 1, 1, N'1', N'Thịt', N'thit', N'1', N'1', N'1', N'1')
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (3, N'Trứng', N'Trứng', 1, 1, 1, 1, N'1', N'Trứng', N'trung', N'1', N'1', N'1', N'1')
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (4, N'Quả', N'Quả', 1, 1, 1, 1, N'1', N'Quả', N'qua', N'1', N'1', N'1', N'1')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active], [RoleId]) VALUES (1, N'Nguyễn Tuấn Anh 2', NULL, NULL, N'218 Lạc Long Quân', N'nguyentuananh30082002@gmail.com                                                                                                                       ', N'0775122681', 4, 1, 3, CAST(N'2024-01-16T16:14:21.910' AS DateTime), N'8db5ab07f3dc5d5a9b5dffd4291191c3', N'%%#^+     ', NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Functions] ON 

INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (1, N'Quản lý khách hàng')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (2, N'Quản lý đơn hàng')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (3, N'Quản lý banner')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (4, N'Quản lý sản phẩm')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (5, N'Quản lý doanh số')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (6, N'Quản lý tin tức')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (7, N'Quản lý page')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (8, N'Quản lý hệ thống tài khoản admin')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (9, N'Quản lý hệ thống danh mục')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (10, N'Quản lý hệ thống Role')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (11, N'Quản lý hệ thống quyền truy cập chức năng')
INSERT [dbo].[Functions] ([FunctionId], [FunctionName]) VALUES (12, N'Quản lý hệ thống')
SET IDENTITY_INSERT [dbo].[Functions] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [Name], [Type], [Slug], [NameWithType], [PathWithType], [ParentCode], [Levels]) VALUES (1, N'Tây Hồ', N'Quận ', N'quan', N'Quận Tây Hồ', N'Quận Tây Hồ, Thành phố Hà Nội', 4, 2)
INSERT [dbo].[Locations] ([LocationID], [Name], [Type], [Slug], [NameWithType], [PathWithType], [ParentCode], [Levels]) VALUES (2, N'Hoàn Kiếm', N'Quận', N'quan', N'Quận Hoàn Kiếm', N'Quận Hoàn Kiếm, Thành phố Hà Nội', 4, 2)
INSERT [dbo].[Locations] ([LocationID], [Name], [Type], [Slug], [NameWithType], [PathWithType], [ParentCode], [Levels]) VALUES (3, N'Bưởi', N'Phường', N'phuong', N'Phường Bưởi', N'Phường Bưởi, Quận Tây Hồ, Thành phố Hà Nội', 1, 3)
INSERT [dbo].[Locations] ([LocationID], [Name], [Type], [Slug], [NameWithType], [PathWithType], [ParentCode], [Levels]) VALUES (4, N'Hà Nội', N'Thành', N'thanh', N'Thành phố Hà Nội', N'Thành phố Hà Nội', 0, 1)
INSERT [dbo].[Locations] ([LocationID], [Name], [Type], [Slug], [NameWithType], [PathWithType], [ParentCode], [Levels]) VALUES (5, N'Hồ Chí Minh', N'Thành', N'thanh', N'Thành phố Hồ Chí Minh', N'Thành phố Hồ Chí Minh', 0, 1)
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (1, 1, 8, NULL, 1, 1, 0, 20000, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (2, 2, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-27T01:16:58.040' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (3, 3, 8, NULL, NULL, 1, NULL, 40000, CAST(N'2024-01-27T01:26:44.300' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (4, 3, 7, NULL, NULL, 1, NULL, 40000, CAST(N'2024-01-27T01:26:44.333' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (5, 4, 3, NULL, NULL, 1, NULL, 110000, CAST(N'2024-01-27T01:38:30.713' AS DateTime), 40000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (6, 4, 5, NULL, NULL, 1, NULL, 110000, CAST(N'2024-01-27T01:38:30.750' AS DateTime), 50000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (7, 4, 7, NULL, NULL, 1, NULL, 110000, CAST(N'2024-01-27T01:38:30.753' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (8, 5, 3, NULL, NULL, 1, NULL, 40000, CAST(N'2024-01-27T01:39:49.323' AS DateTime), 40000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (9, 6, 7, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-27T01:45:07.353' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (10, 7, 6, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-27T01:55:14.597' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (11, 8, 3, NULL, NULL, 1, NULL, 40000, CAST(N'2024-01-27T02:01:12.340' AS DateTime), 40000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (12, 9, 5, NULL, NULL, 1, NULL, 50000, CAST(N'2024-01-27T02:12:30.773' AS DateTime), 50000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (13, 10, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T09:08:07.053' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (14, 11, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T09:13:03.090' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (15, 12, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T09:16:49.057' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (16, 13, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T09:25:44.130' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (17, 14, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T09:26:48.703' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (18, 15, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T15:04:46.433' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (19, 16, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T22:39:33.710' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (20, 17, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T22:48:34.257' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (21, 18, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-01-28T22:50:43.607' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (22, 19, 6, NULL, NULL, 1, NULL, 70000, CAST(N'2024-01-28T23:54:44.153' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (23, 19, 5, N'Thịt Gà ', NULL, 1, NULL, 70000, CAST(N'2024-01-28T23:54:44.260' AS DateTime), 50000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (24, 20, 5, NULL, NULL, 1, NULL, 70000, CAST(N'2024-01-29T00:10:21.157' AS DateTime), 50000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (25, 20, 7, NULL, NULL, 1, NULL, 70000, CAST(N'2024-01-29T00:10:21.173' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (26, 21, 3, NULL, NULL, 1, NULL, 40000, CAST(N'2024-01-29T00:14:02.927' AS DateTime), 40000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (27, 22, 5, NULL, NULL, 1, NULL, 50000, CAST(N'2024-01-29T00:17:18.493' AS DateTime), 50000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (28, 23, 7, N'Tỏi', NULL, 1, NULL, 60000, CAST(N'2024-02-15T22:19:10.733' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (29, 23, 8, N'Hành Lá', NULL, 1, NULL, 60000, CAST(N'2024-02-15T22:19:10.750' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (30, 23, 6, N'Rau Muống', NULL, 1, NULL, 60000, CAST(N'2024-02-15T22:19:10.750' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (31, 24, 8, NULL, NULL, 1, NULL, 20000, CAST(N'2024-02-24T10:12:38.347' AS DateTime), 20000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (1031, 1023, 13, NULL, NULL, 3, NULL, 663000, CAST(N'2024-05-07T18:41:35.350' AS DateTime), 21000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (1032, 1023, 11, NULL, NULL, 6, NULL, 663000, CAST(N'2024-05-07T18:41:35.367' AS DateTime), 100000)
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [ProductID], [ProductName], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (2031, 2023, 13, NULL, NULL, 1, NULL, 21000, CAST(N'2024-08-07T09:56:17.263' AS DateTime), 21000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (1, 1, CAST(N'2011-01-01T00:00:00.000' AS DateTime), CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1, 0, 0, CAST(N'2011-01-01T00:00:00.000' AS DateTime), 1, N'218 Lạc Long Quân', 4, 1, 3, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (2, 1, CAST(N'2024-01-27T01:16:57.853' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (3, 1, CAST(N'2024-01-27T01:26:44.133' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 40000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (4, 1, CAST(N'2024-01-27T01:38:30.533' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 110000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (5, 1, CAST(N'2024-01-27T01:39:49.130' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 40000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (6, 1, CAST(N'2024-01-27T01:45:07.177' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (7, 1, CAST(N'2024-01-27T01:55:14.377' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (8, 1, CAST(N'2024-01-27T02:01:12.150' AS DateTime), NULL, 2, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 40000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (9, 1, CAST(N'2024-01-27T02:12:30.593' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 50000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (10, 1, CAST(N'2024-01-28T09:08:06.880' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (11, 1, CAST(N'2024-01-28T09:13:02.907' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (12, 1, CAST(N'2024-01-28T09:16:49.033' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (13, 1, CAST(N'2024-01-28T09:25:43.953' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (14, 1, CAST(N'2024-01-28T09:26:48.513' AS DateTime), NULL, 1, 1, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (15, 1, CAST(N'2024-01-28T15:04:46.250' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (16, 1, CAST(N'2024-01-28T22:39:33.620' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (17, 1, CAST(N'2024-01-28T22:48:34.153' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 0, 0, 0, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (18, 1, CAST(N'2024-01-28T22:50:43.510' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 4, 1, 3, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (19, 1, CAST(N'2024-01-28T23:54:43.707' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 4, 1, 3, 70000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (20, 1, CAST(N'2024-01-29T00:10:21.070' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 4, 1, 3, 70000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (21, 1, CAST(N'2024-01-29T00:14:02.857' AS DateTime), NULL, 4, 0, 1, CAST(N'2024-01-29T00:48:16.113' AS DateTime), NULL, N'218 Lạc Long Quân', 4, 1, 3, 40000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (22, 1, CAST(N'2024-01-29T00:17:18.420' AS DateTime), NULL, 4, 0, 1, CAST(N'2024-01-29T00:17:37.090' AS DateTime), NULL, N'218 Lạc Long Quân', 4, 1, 3, 50000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (23, 1, CAST(N'2024-02-15T22:19:10.670' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 4, 1, 3, 60000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (24, 1, CAST(N'2024-02-24T10:12:38.110' AS DateTime), NULL, 2, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 4, 1, 3, 20000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (1023, 1, CAST(N'2024-05-07T18:41:35.283' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 4, 1, 3, 663000)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [PaymentID], [Address], [LocationID], [District], [Ward], [TotalMoney]) VALUES (2023, 1, CAST(N'2024-08-07T09:56:17.067' AS DateTime), NULL, 1, 0, 0, NULL, NULL, N'218 Lạc Long Quân', 4, 1, 3, 21000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreateAt], [Ordering]) VALUES (4, N'Hướng dẫn mua hàng', N'<p>Hướng dẫn mua hàngHướng dẫn mua hàngHướng dẫn mua hàngHướng dẫn mua hàngHướng dẫn mua hàng<br></p>', N'huong-dan-mua-hang.png', 1, N'Hướng dẫn mua hàng', N'Hướng dẫn mua hàng', N'Hướng dẫn mua hàng', N'huong-dan-mua-hang', CAST(N'2024-01-12T22:02:34.687' AS DateTime), 2)
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreateAt], [Ordering]) VALUES (5, N'Liên hệ', N'<p>Liên hệLiên hệLiên hệLiên hệLiên hệLiên hệ<br></p>', N'lien-he.png', 1, N'Liên hệ', N'Liên hệ', N'Liên hệ', N'lien-he', CAST(N'2024-01-12T22:25:06.583' AS DateTime), 1)
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreateAt], [Ordering]) VALUES (6, N'Giới thiệu', N'<p>Giới thiệuGiới thiệuGiới thiệuGiới thiệuGiới thiệu<br></p>', N'gioi-thieu.png', 1, N'Giới thiệu', N'Giới thiệu', N'Giới thiệu', N'gioi-thieu', CAST(N'2024-01-12T22:25:35.263' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Pages] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (1, 2, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (4, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (5, 7, 1, 1, 1, 1, 1, 2)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (9, 12, 0, 0, 0, 0, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (10, 11, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (11, 3, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (12, 4, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (13, 6, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (14, 7, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (15, 8, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (16, 9, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (17, 10, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (18, 5, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (19, 1, 1, 1, 0, 0, 1, 6)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (20, 3, 1, 1, 1, 1, 1, 6)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (21, 4, 0, 1, 0, 1, 1, 6)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (23, 3, 1, 1, 1, 0, 1, 8)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (24, 3, 1, 1, 1, 1, 1, 9)
INSERT [dbo].[Permissions] ([PermissionId], [FunctionId], [CanCreate], [CanRead], [CanEdit], [CanDelete], [AccessPermission], [RoleId]) VALUES (25, 4, 0, 1, 0, 0, 1, 9)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreateDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewFeed], [MetaKey], [MetaDesc], [Views]) VALUES (1001, N'Cách bảo quản rau tươi lâu', NULL, N'<div class="rich-text" style="color: rgb(51, 51, 51); font-family: Helvetica, Arial, san-serif; font-size: 15px;"><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;"><span style="font-weight: 700;">Rau xanh là nguồn dinh dưỡng đóng góp cho cơ thể. Vậy bạn có biết cách bảo quản rau tươi lâu chưa? Làm sao để bảo quản rau tươi mà không gây ảnh hưởng đến giá trị dinh dưỡng? Dưới đây là những cách giúp bạn bảo quản rau tươi lâu, đảm bảo an toàn sức khỏe.</span></p></div><h2 style="font-family: Helvetica, Arial, san-serif; line-height: 1.3; color: rgb(51, 51, 51); margin-bottom: 10px; font-size: 27px;">1. Chỉ rửa rau trước khi nấu ăn</h2><div class="rich-text" style="color: rgb(51, 51, 51); font-family: Helvetica, Arial, san-serif; font-size: 15px;"><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;"></p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Rửa rau sau đó đem bảo quản là những sai lầm rất dễ mắc phải ở những bạn trẻ. Theo kinh nghiệm từ lâu của ông bà ta, rau sau khi rửa sẽ có thể xuất hiện dập nát. Những vị trí bị hư sau đó sẽ lan rộng dù được bảo quản vẫn không ngừng lây lan làm cho&nbsp;<a href="https://www.vinmec.com/en/tin-tuc/thong-tin-suc-khoe/dinh-duong/rau-cu-qua-cua-ban-co-tuoi-trong-bao-lau/" class="link-in-body" style="color: rgb(0, 102, 166); transition: all 0.1s ease 0s;"><span class="link-in-body" href="https://www.vinmec.com/en/tin-tuc/thong-tin-suc-khoe/dinh-duong/rau-cu-qua-cua-ban-co-tuoi-trong-bao-lau/" style="font-weight: 700;">rau tươi</span></a>&nbsp;khô héo, bốc mùi.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Trên góc nhìn của lăng kính khoa học, nước tạo ra môi trường ẩm làm cho nấm, vi khuẩn vô tình phát triển trong rau. Môi trường nhiệt độ ngăn mát lại không hề ảnh hưởng đến sự phát triển của nấm nên chúng có thể sinh sôi phát triển mạnh. Vì thế chỉ rửa rau trước khi sử dụng chứ không rửa rau rồi đem chúng đi bảo quản để nâng cao thời gian sử dụng cũng như độ tươi và giá trị dinh dưỡng của rau.</p></div><h2 style="font-family: Helvetica, Arial, san-serif; line-height: 1.3; color: rgb(51, 51, 51); margin-bottom: 10px; font-size: 27px;">2. Phân loại rau để tiện cho việc bảo quản</h2><div class="rich-text" style="color: rgb(51, 51, 51); font-family: Helvetica, Arial, san-serif; font-size: 15px;"><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;"></p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Mỗi loại rau có những đặc điểm khác nhau về dinh dưỡng và kích thước. Có loại rau lại chỉ để được trong thời gian ngắn. Nếu chúng được đặt cạnh nhau, rau héo trước sẽ khiến những loại rau còn lại bị hỏng theo. Vì thế cần phân loại ra để tránh việc củ quả ảnh hưởng đến rau có lá.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Hoa quả khi để cạnh rau chúng sẽ làm cho rau mau hỏng hơn. Vì vậy bạn cần chia ngăn hoặc không để chung hoa quả với rau. Thêm vào đó những loại củ quả còn nguyên vẹn có thể bảo quản bên ngoài, còn những củ quả đã cắt ra một phần thì nên bỏ vào túi và đặt trong tủ lạnh bảo quản.</p></div><h2 style="font-family: Helvetica, Arial, san-serif; line-height: 1.3; color: rgb(51, 51, 51); margin-bottom: 10px; font-size: 27px;">3. Lưu ý vị trí rau được đặt trên kệ bán trong cửa hàng</h2><p><figure class="post-image full" style="margin: 10px auto; max-width: 420px; text-align: center; color: rgb(51, 51, 51); font-family: Helvetica, Arial, san-serif; font-size: 15px;"></figure></p><div class="rich-text" style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Helvetica, Arial, san-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><p style="box-sizing: border-box; margin: 0px 0px 15px;"></p><p style="box-sizing: border-box; margin: 0px 0px 15px;">Rau sau thu hoạch đều đảm bảo độ tươi và dưỡng chất nhưng môi trường lại quyết định thời gian bảo quản thực tế. Một số loại rau nếu đặt ở môi trường thích hợp sau thu hoạch sẽ giữ được độ tươi khá lâu. Phần lớn các loại rau xanh đều ưa mát mẹ, nhiệt độ ổn định.</p><p style="box-sizing: border-box; margin: 0px 0px 15px;">Ngoài những yếu tố thiên nhiên bạn cũng nên chú ý đến thiết kế nơi để rau củ. Trong cửa hàng, nếu rau bày trên kệ được đặt ở nơi thoáng mát, ít bị ánh sáng chiếu vào sẽ có thể bảo quản lâu hơn.</p><p style="box-sizing: border-box; margin: 0px 0px 15px;">Không phải loại rau nào cũng có thể bảo quản tươi lâu được khi không cấp lạnh. Nhưng hầu hết các loại củ còn nguyên vẹn không dập có thể đặt ngoài tủ lạnh. Chúng bao gồm hành, tỏi, bí ngô, khoai tây, khoai lang... Duy trì mức nhiệt khoảng 10 - 20 độ, rau có thể tươi xanh được đến 1 tháng. Trong quá trình đó bạn cần thường xuyên kiểm tra để tách những củ bị hỏng hay sâu mọt ra thì những củ còn lại sẽ không bị hỏng theo.</p><p style="box-sizing: border-box; margin: 0px 0px 15px;">Đối với khoai tây và hành tây thì bạn cần lưu ý không để cạnh nhau. Bởi hơi ẩm từ hành tây sẽ là nguyên nhân làm<span>&nbsp;</span><a href="https://vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/khoai-tay-moc-mam-vi-sao-khong-nen-an/#:~:text=Khi%20khoai%20t%C3%A2y%20m%E1%BB%8Dc%20m%E1%BA%A7m,%C4%83n%20khoai%20t%C3%A2y%20m%E1%BB%8Dc%20m%E1%BA%A7m." class="link-in-body" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 102, 166); text-decoration: none; transition: all 0.1s ease 0s;"><b class="link-in-body" href="https://vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/khoai-tay-moc-mam-vi-sao-khong-nen-an/#:~:text=Khi%20khoai%20t%C3%A2y%20m%E1%BB%8Dc%20m%E1%BA%A7m,%C4%83n%20khoai%20t%C3%A2y%20m%E1%BB%8Dc%20m%E1%BA%A7m." style="box-sizing: border-box; font-weight: 700;">khoai tây nảy mầm</b></a>, tăng nguy cơ<span>&nbsp;</span><a href="https://www.vinmec.com/vi/benh/ngo-doc-thuc-pham-3244/" class="link-in-body" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 102, 166); text-decoration: none; transition: all 0.1s ease 0s;"><b class="link-in-body" href="https://www.vinmec.com/vi/benh/ngo-doc-thuc-pham-3244/" style="box-sizing: border-box; font-weight: 700;">ngộ độc thực phẩm</b></a><span>&nbsp;</span>hay phát triển<span>&nbsp;</span><a href="https://www.vinmec.com/vi/benh/ung-thu-bieu-mo-te-bao-vay-4316/" class="link-in-body" style="box-sizing: border-box; background-color: transparent; color: rgb(0, 102, 166); text-decoration: none; transition: all 0.1s ease 0s;"><b class="link-in-body" href="https://www.vinmec.com/vi/benh/ung-thu-bieu-mo-te-bao-vay-4316/" style="box-sizing: border-box; font-weight: 700;">tế bào ung thư</b></a><span>&nbsp;</span>trong cơ thể.</p><h2 style="line-height: 1.3; color: rgb(51, 51, 51); margin-bottom: 10px; font-size: 27px;">4. Mua rau mới hái nếu gần trang trại khu vực trồng rau</h2><div class="rich-text"><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;"></p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Rau vừa thu hoạch sẽ còn tươi và có thời gian bảo quản dài hơn. Nếu bạn không có tủ lạnh, hãy lựa chọn rau mới, còn tươi để dễ bảo quản bên ngoài. Rau trong 24h thu hoạch sẽ tươi ngon và giữ được nhiều chất dinh dưỡng hơn rau để lâu.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Thông thường rau sẽ được thu hoạch vào sáng sớm và tiêu thụ trong ngày. Vì thế, chúng ta có thể lựa chọn chúng vào sáng sớm rồi tiến hành bảo quản. Kèm theo đó, lượng rau sử dụng nên phù hợp với nhu cầu và thời gian tối đa nhằm đảm bảo dưỡng chất trong rau không mất đi.</p></div><h2 class="" style="line-height: 1.3; color: rgb(51, 51, 51); margin-bottom: 10px; font-size: 27px;">5. Cấp lạnh là cách bảo quản rau tươi lâu</h2><div class="rich-text"><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;"></p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Không riêng rau mà hầu hết các thực phẩm đều có thể giữ được độ tươi ngon lâu hơn nếu để trong tủ lạnh. Nhiệt độ thấp sẽ hạn chế khả năng hoạt động của&nbsp;<a href="https://www.vinmec.com/en/tin-tuc/thong-tin-suc-khoe/suc-khoe-tong-quat/vi-khuan-la-gi-co-nhung-loai-nao/" class="link-in-body" style="color: rgb(0, 102, 166); transition: all 0.1s ease 0s;"><span class="link-in-body" href="https://www.vinmec.com/en/tin-tuc/thong-tin-suc-khoe/suc-khoe-tong-quat/vi-khuan-la-gi-co-nhung-loai-nao/" style="font-weight: 700;">vi khuẩn</span></a>&nbsp;giúp rau được tươi lâu hơn. Tuy nhiên khí lạnh của tủ lạnh thường đi kèm hơi ẩm nên đó là điều kiện tốt cho&nbsp;<a href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/di-ung-nam-moc-trieu-chung-chan-doan-va-dieu-tri/" class="link-in-body" style="color: rgb(0, 102, 166); transition: all 0.1s ease 0s;"><span class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/di-ung-nam-moc-trieu-chung-chan-doan-va-dieu-tri/" style="font-weight: 700;">nấm mốc</span></a>&nbsp;phát triển.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Vì thế ngăn để rau cần được kín hoặc có ngăn kéo ngăn cách với các ngăn còn lại và trong đó độ ẩm cũng thấp hơn các ngăn bên ngoài. Bạn cũng có thể điều chỉnh tủ để giảm độ ẩm, phù hợp cho bảo quản rau tươi lâu.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;">Nếu bạn muốn bảo quản&nbsp;<a href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/lich-su-va-loi-ich-suc-khoe-cua-mang-tay/?link_type=related_posts" class="link-in-body" style="color: rgb(0, 102, 166); transition: all 0.1s ease 0s;"><span class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/lich-su-va-loi-ich-suc-khoe-cua-mang-tay/?link_type=related_posts" style="font-weight: 700;">măng tây</span></a>&nbsp;thì cần chọn loại mới thu hoạch. Sau khi thu hoạch bạn có thể giữ được độ tươi của măng tây 2- 3 ngày trong tủ lạnh. Cùng với đó là một số loại rau xanh có lá hoặc không như súp lơ,&nbsp;<a href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/dau-va-dau-ha-lan-thuc-pham-doc-dao/" class="link-in-body" style="color: rgb(0, 102, 166); transition: all 0.1s ease 0s;"><span class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/dau-va-dau-ha-lan-thuc-pham-doc-dao/" style="font-weight: 700;">đậu hà lan</span></a>, bí đao,&nbsp;<a href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/7-loi-ich-cua-nuoc-dua-chuot-giu-nuoc-va-giup-co-khoe-manh/?link_type=related_posts" class="link-in-body" style="color: rgb(0, 102, 166); transition: all 0.1s ease 0s;"><span class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/7-loi-ich-cua-nuoc-dua-chuot-giu-nuoc-va-giup-co-khoe-manh/?link_type=related_posts" style="font-weight: 700;">dưa chuột</span></a>... khi bảo quản tủ lạnh sẽ để được khoảng 3- 5 ngày. Củ cải,&nbsp;<a href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/gia-tri-dinh-duong-cua-khoai-tay/#:~:text=Khoai%20t%C3%A2y%20l%C3%A0%20m%E1%BB%99t%20lo%E1%BA%A1i,ng%E1%BB%ABa%20b%E1%BB%87nh%20tim%20hi%E1%BB%87u%20qu%E1%BA%A3." class="link-in-body" style="color: rgb(0, 102, 166); transition: all 0.1s ease 0s;"><span class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/gia-tri-dinh-duong-cua-khoai-tay/#:~:text=Khoai%20t%C3%A2y%20l%C3%A0%20m%E1%BB%99t%20lo%E1%BA%A1i,ng%E1%BB%ABa%20b%E1%BB%87nh%20tim%20hi%E1%BB%87u%20qu%E1%BA%A3." style="font-weight: 700;">khoai tây</span></a>,... có thể kéo dài đến 2 tuần.</p></div><h2 class="" style="line-height: 1.3; color: rgb(51, 51, 51); margin-bottom: 10px; font-size: 27px;"><div class="middle-services-for-u" style="background-color: rgb(244, 250, 255); display: flex; flex-direction: column; margin-bottom: 15px; align-items: center; justify-content: center;"></div>6. Bọc rau bằng khăn giấy bỏ vào túi zip</h2><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px;"><figure class="post-image full" style="margin: 10px auto; max-width: 420px; text-align: center; color: rgb(51, 51, 51);"></figure></p><div class="rich-text" style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Helvetica, Arial, san-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><p style="box-sizing: border-box; margin: 0px 0px 15px;"></p><p style="box-sizing: border-box; margin: 0px 0px 15px;">Một số loại rau xanh có lá cần giảm ẩm nếu bỏ túi để tủ lạnh vẫn sẽ dễ bị nấm mốc. Bạn có thể dùng khăn giấy cuộn rau lại rồi bỏ túi zip trước khi cho vào bảo quản. Khăn giấy sẽ hút ẩm còn túi zip hạn chế tối đa hơi ẩm xâm nhập vào rau. Nhờ đó thời gian tươi xanh của rau được kéo dài.</p><p style="box-sizing: border-box; margin: 0px 0px 15px;">Tương tự cách làm đó bạn có thể thay thế túi zip bằng hộp nhựa. Hộp sẽ giúp tận dụng tối đa không gian sử dụng mà lại tránh dập nát cho rau. Đồng thời hộp cũng khá kín có thể giúp rau tươi đến 7 ngày.</p></div></div>', N'cach-bao-quan-rau-tuoi-lau.jpg', 1, N'cach-bao-quan-rau-tuoi-lau', CAST(N'2024-05-07T18:27:00.423' AS DateTime), NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreateDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewFeed], [MetaKey], [MetaDesc], [Views]) VALUES (1002, N'GIÁ TRỊ BỔ DƯỠNG TRONG RAU CỦ QUẢ ĐỐI VỚI ĐỜI SỐNG SỨC KHỎE CON NGƯỜI', NULL, N'<h1 id="1__bai_thuoc&nbsp;bo_duong_tu_rau_cu_qua_cho&nbsp;doi_song_suc_khoe_va_dinh_duong_cua_nguoi_tieu_dung_" style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; font-weight: 700; line-height: 1.2; font-size: 2.5rem; color: var(--shop-color-title); max-width: 100%; font-family: Roboto, sans-serif;"><span style="margin: 0px; padding: 0px; max-width: 100%;">1. Bài thuốc&nbsp;bổ dưỡng từ rau củ quả cho&nbsp;đời sống sức khỏe và dinh dưỡng của người tiêu dùng:</span></h1><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif;">Từ thời ông bà xưa đến nay, sự bổ dưỡng từ rau xanh, các loại củ và hoa quả luôn là bài thuốc quý mà mẹ thiên nhiên trao tặng cho khắp muôn loài, nếu không có chúng có lẽ sự sống trên trái đất khó mà tồn tại lâu dài đến tận ngày hôm ngày, khi mà loài người ngày càng phát triển, sự sống càng được sinh sôi nảy nở, có thể nói thực vật nói chung và rau, củ, hoa quả nói riêng đóng góp một phần cực kì lớn, làm bàn đạp cho&nbsp;sự phát triển của mọi loài trên&nbsp;trái đất&nbsp;.</p><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif;">Rau xanh, củ, quả chứa những dưỡng chất từ thiên nhiên&nbsp;vô cùng cần thiết đối với cơ thể chúng ta, chúng cung cấp rất nhiều&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">chất xơ</span>, các loại&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">khoáng chất</span>,&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">nước</span>&nbsp;và&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">vitamin</span>&nbsp;bổ dưỡng cho sự sống của cơ thể, vi vậy, việc tiêu thụ rau xanh, củ và quả hằng ngày là điều mà chúng ta nên làm nếu muốn duy trì một cuộc sống khỏe mạnh, dài lâu.</p><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif;">Mỗi loại rau củ quả khác nhau sẽ cung cấp&nbsp;các dưỡng chất khác nhau đi nuôi cơ thể, khi kết hợp các loại rau củ và trái cây với nhau thì chúng kết hợp với nhau bổ sung đầy đủ các&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">dưỡng chất&nbsp;</span>cần thiết cho chúng ta. Theo các chuyên gia về thực phẩm bổ dưỡng&nbsp;cho biết, mỗi ngày cơ thể&nbsp;chúng ta cần đến&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">300gr</span>&nbsp;đến<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">&nbsp;500gr</span>&nbsp;rau sạch,<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">&nbsp;1</span>&nbsp;đến&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">2</span>&nbsp;loại trái cây mỗi ngày để đảm bảo cơ thể luôn được bổ sung đầy đủ dinh dưỡng, giảm nguy cơ mắc các bệnh về béo phì, tim mạch, đường ruột, ung thư, lão hóa sớm,...</p><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif; text-align: center;"><img alt="hoa quả bổ dưỡng" src="https://file.hstatic.net/200000460299/file/13_db75c9eaf2c44a4aafb66d535cf022cb_grande.jpg" style="margin: 0px; padding: 0px; max-width: 100%;"></p><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif; text-align: center;">&nbsp;</p><h1 id="2__tai_sao_noi_rang_rau_cu_co_gia_tri&nbsp;bo_duong_cho_suc_khoe_va_doi_song_dinh_duong_cua_con_nguoi" style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; font-weight: 700; line-height: 1.2; font-size: 2.5rem; color: var(--shop-color-title); max-width: 100%; font-family: Roboto, sans-serif;"><span style="margin: 0px; padding: 0px; max-width: 100%;">2. Tại sao nói rằng rau củ có giá trị&nbsp;bổ dưỡng cho sức khỏe và đời sống dinh dưỡng của con người</span></h1><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif;">Rau xanh củ quả mang&nbsp;<a href="https://xinhtuoi.online/blog/thanh-phan-dinh-duong-trong-rau-cu-qua.html" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">giá trị bổ dưỡng</a>&nbsp;từ thiên nhiên vô cùng to lớn,&nbsp;là bài&nbsp;thuốc quý chữa bách bệnh bởi vì trong rau xanh, củ và quà chứa chất xơ hòa tan và không hòa tan, khoáng chất như&nbsp;sắt, kẽm, kiềm, canxi,.. và các loại vitamin A, B ( B1, B2, B5, B6, B12), C, D, E,... đem lại sự khỏe mạnh&nbsp;không những&nbsp;thể chất mà còn về tinh thần cho người dùng.</p><ul style="margin-right: 0px; margin-left: 0px; padding: 0px 0px 0px 20px; list-style: initial; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif;"><li style="margin: 5px 0px; padding: 0px; max-width: 100%;">Đầu tiên là các khoáng chất như kẽm, magie, sắt, canxi,... có trong các loại hoa quả và rau củ&nbsp;giữ vai trò chuyển hóa&nbsp;các vitamin đi nuôi cơ thể, làm chắc xương, điều hòa máu và hồng cầu, tham gia vào quá trình hóa học của cơ thể,... Đối với trẻ nhỏ và phụ nữ&nbsp;có thai, khoáng chất đóng vai trò phát triển toàn diện&nbsp;giúp sự phát triển&nbsp;của trẻ nhỏ và bào thai được hoàn thiện, người mẹ cũng được hấp thụ đầy đủ dưỡng chất để nuôi bào thai. Các loại rau củ và hoa quả chứa những&nbsp;khoáng chất tác dụng tốt cho cơ thể&nbsp;đó là&nbsp;<a href="https://thucphamhahien.com/products/cai-xoan-kale-kamereo" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">cải xoăn</a>,&nbsp;<a href="https://thucphamhahien.com/products/diep-ca-tp" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">rau diếp cá</a>,&nbsp;<a href="https://thucphamhahien.com/products/can-tay-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">cần tây</a>,&nbsp;<a href="https://thucphamhahien.com/products/bong-cai-xanh-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">bông cải xanh</a>,... là những thực phẩm được biết đến có rất nhiều&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">canxi</span>,&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">vitamin K</span>&nbsp;và&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">magie</span>&nbsp;hơn cả thịt, cá, trứng, sữa, rất tốt cho xương và máu, tăng cường hệ thống miễn dịch và bổ não, đối với trẻ nhỏ, canxi có nhiệm vụ hỗ trợ&nbsp;xương răng chắc khỏe, bồi dưỡng&nbsp;cơ bắp và&nbsp;các dây thần kinh hoạt động tốt</li><li style="margin: 5px 0px; padding: 0px; max-width: 100%;"><span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">Chất xơ</span>&nbsp;có trong rau tuy không đem lại nhiều chất dinh dưỡng nhưng góp phần rất lớn vào&nbsp;quá trình tiêu hóa, cân bằng&nbsp;<a href="https://tschem.com.vn/ph-la-gi-va-cach-do-ph/" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">độ pH</a>&nbsp;trong ruột, thải&nbsp;<a href="https://thanhnien.vn/chuyen-gia-dinh-duong-5-loai-rau-tot-nhat-de-giam-cholesterol-post1465381.html?utm_source=dable" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">cholesterol</a>&nbsp;có hại cho cơ thể, giảm nguy cơ bệnh tim mạch vành,&nbsp;giảm táo bón, tốt cho nhuận tràng và giúp giảm cân tốt.</li><li style="margin: 5px 0px; padding: 0px; max-width: 100%;">Đóng vai trò quan trọng không kém đó là các<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">&nbsp;</span>vitamin có trong thực vật đem lại cho cơ thể chúng ta sức khỏe tốt, có thể nói đến các loạ<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">i&nbsp;</span>vitamin quan trọng như&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">vitamin A</span>&nbsp;có tác dụng&nbsp;tăng cường thị lực và&nbsp;bảo vệ đôi mắt của bạn, giúp hoạt động của tim mạch được tốt hơn,&nbsp;có rất nhiều trong&nbsp;<a href="https://thucphamhahien.com/products/ca-rot-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">cà rốt</a>,&nbsp;<a href="https://thucphamhahien.com/products/du-du-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">đu đủ</a>,&nbsp;<a href="https://thucphamhahien.com/products/xoai-thai" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">xoài</a>,&nbsp;<a href="https://thucphamhahien.com/products/buoi-da-xanh-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">bưởi</a>,...&nbsp; Ngoài ra còn có&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">vitamin B</span>&nbsp;giúp cải thiện trí nhớ, cải thiện làn da, ngừa&nbsp;ung thư,... có rất nhiều loại&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">vitamin B</span>&nbsp;nên chúng ta cần ăn phối hợp nhiều loại hoa quả này thì sẽ đảm bảo cơ thể luôn được cung cấp đủ các loại vitamin B như&nbsp;<a href="https://thucphamhahien.com/products/chuoi-da-lat" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">chuối</a>,&nbsp;<a href="https://thucphamhahien.com/products/ca-chua-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">cà chua</a>,&nbsp;<a href="https://thucphamhahien.com/products/dau-nhat" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">dâu</a>,...</li><li style="margin: 5px 0px; padding: 0px; max-width: 100%;"><span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">Vitamin C</span>&nbsp;là dưỡng chất rất tốt cho cơ thể vì những đặc tính có thể làm giảm các triệu chứng và phòng bệnh như giảm đau dạ dày, giải cảm do dị ứng thời tiết, tăng cường sức đề kháng trong cơ thể, đào thải cholesterol xấu, giảm bệnh gout,...&nbsp;<span style="margin: 0px; padding: 0px; font-weight: 700; max-width: 100%;">Vitamin C</span>&nbsp;từ thiên nhiên&nbsp;có rất nhiều trong các loại rau, hoa quả có vị chua như&nbsp;<a href="https://thucphamhahien.com/products/cam-uc-tui" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">cam</a>,&nbsp;<a href="https://thucphamhahien.com/products/quyt-duong-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">quýt</a>,&nbsp;<a href="https://thucphamhahien.com/products/kiwi-do" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">kiwi</a>,&nbsp;<a href="https://thucphamhahien.com/products/dau-nhat" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">dâu</a>,&nbsp;<a href="https://thucphamhahien.com/products/ot-chuong-vang-do-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">ớt chuông</a>,&nbsp;<a href="https://thucphamhahien.com/products/buoi-da-xanh-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">bưởi</a>,&nbsp;<a href="https://thucphamhahien.com/products/oi-dai-loan-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">ổi</a>,&nbsp;<a href="https://thucphamhahien.com/products/du-du-kg" style="margin: 0px; padding: 0px; color: var(--shop-color-text); outline: none; transition: all 0.3s ease-in-out 0s; max-width: 100%;">đu đủ</a>,...</li></ul><div style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif;">Cơ thể chúng ta cần hấp thụ đủ rau xanh và củ quả để giảm các nguy cơ gặp các bệnh về tim mạch, tiêu hóa, ung thư, béo phì,... bởi vì trong thực vật có rất nhiều khoáng chất và dưỡng chất rất tốt cho cơ thể chúng ta cung cấp rất nhiều khoáng chất và chất xơ cũng như các vitamin cần thiết,&nbsp;không chỉ chữa được các bệnh bên trong cơ thể, rau củ quả còn có chức năng thanh lọc cơ thể và cung cấp&nbsp;các dưỡng chất tốt giúp làn da của chúng ta luôn căng mọng, giúp xương, chân răng và tóc chắc khỏe hơn, cân bằng huyết áp và giảm các bệnh cũng như bảo vệ đôi mắt&nbsp;chúng ta, vì vậy chúng ta cần luôn hấp thụ đủ lượng rau củ, hoa quả để có được sức khỏe tốt nhất cho bản thân và gia đình bạn nhé!&nbsp;</div><div style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif;"><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%; text-align: center;"><img alt="RAU XANH" src="https://file.hstatic.net/200000460299/file/f3d748c3dc41f293b60c1b19743e57_cdde868447724ae7866ded86df21f14e_master_edfecbcfd9604151bc15f24804c3b921_grande.jpg" style="margin: 0px; padding: 0px; max-width: 100%;"></p><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; max-width: 100%;">&nbsp;</p></div><h1 id="3__an_nhieu_rau_cu_qua_co_thuc_su_bo_duong_" style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; font-weight: 700; line-height: 1.2; font-size: 2.5rem; color: var(--shop-color-title); max-width: 100%; font-family: Roboto, sans-serif;"><span style="margin: 0px; padding: 0px; max-width: 100%;">3. Ăn nhiều rau củ quả có thực sự bổ dưỡng?</span></h1><div style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(37, 42, 43); font-family: Roboto, sans-serif;">Bạn có biết rằng, nếu chúng ta tiêu thụ quá nhiều rau xanh và trái cây đôi khi sẽ gây ra phản tác dụng. Rau củ và trái cây chứa rất nhiều chất xơ, khi tiêu thụ chúng hằng ngày sẽ giúp thúc đẩy hệ tiêu hóa, giảm các bệnh đường ruột, giảm đường trong máu, cân bằng độ pH, giảm cholesterol xấu, điều hòa huyết áp, giảm bớt lượng mỡ thừa và giảm nguy cơ bị đột quỵ,... Tuy nhiên, nếu bạn ăn rau và trái cây quá nhiều, thậm chí thay thế các thực phẩm khác chứa chất béo, tinh bột, chất đạm thì sẽ dẫn đến sự mất cân bằng dinh dưỡng, thiếu nguồn năng lượng để cơ thể và trí não được hoạt động tốt, không chỉ vậy, ăn quá nhiều rau và hoa quả gây ra các bệnh khác đáng lo ngại như cơ thể giảm khả năng hấp thụ dưỡng chất, gặp các bệnh về tiêu hóa, gây ra bệnh sỏi thận, tăng nồng độ cholesterol, đối với bệnh nhân bị xơ gan nếu ăn quá nhiều chất xơ sẽ gây ra tình trạng chảy máu dạ dạy vô cùng nguy hiểm đến mạng. Vì thế, hãy luôn cân bằng bữa ăn của mình, nạp đủ các chất dinh dưỡng, giảm cân một cách khoa học và có sự tư vấn của chuyên gia dinh dưỡng để có được một cơ thể khỏe mạnh và một cuộc sống tốt đẹp bạn nhé.</div>', N'gia-tri-bo-duong-trong-rau-cu-qua-doi-voi-doi-song-suc-khoe-con-nguoi.jpg', 1, N'gia-tri-bo-duong-trong-rau-cu-qua-doi-voi-doi-song-suc-khoe-con-nguoi', CAST(N'2024-05-07T18:29:16.247' AS DateTime), NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Posts] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreateDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewFeed], [MetaKey], [MetaDesc], [Views]) VALUES (1003, N'LỰA CHỌN VÀ SỬ DỤNG THỰC PHẨM RAU CỦ QUẢ AN TOÀN', NULL, N'<p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Rau củ quả là một trong những nguồn thực phẩm cung cấp dinh dưỡng thiết yếu hàng ngày cho cơ thể con người. Tuy nhiên, để giúp cơ thể khoẻ mạnh, chống lại các nguy cơ của bệnh tật, người tiêu dùng cần có những kiến thức và thông tin để lựa chọn và sử dụng rau, củ, quả an toàn cho bản thân và gia đình</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Theo tổ chức Y tế Thế giới (WHO) mỗi người tiêu dùng nên sử dụng rau quả ít nhất 400 gram/ngày để có những lợi ích về sức khỏe và dinh dưỡng, đồng thời các chuyên gia dinh dưỡng cũng khuyến cáo rằng trong bữa ăn cần ít nhất 1 loại rau quả ăn sống như dưa leo, cà chua, salad …và nên ăn 2-3 loại rau quả ăn sống trong 1 bữa ăn.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Theo Hiệp hội Lương thực Việt Nam nên sử dụng nhiều loại rau củ quả trong bữa ăn, trong ngày, trong tuần để tránh ngộ độc vì ăn quá nhiều một loại rau mà còn đảm bảo đa dạng nhu cầu dinh dưỡng cần thiết cho cơ thể.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Rau củ quả là loại sản phẩm chủ yếu cung cấp các chất: vitamin, khoáng chất và chất sơ nên đóng vai trò quan trọng trong việc tăng cường sức khỏe, tăng sức đề kháng cho cơ thể phòng chống bệnh tật&nbsp;như cung cấp chất xơ, chống táo bón thông qua cơ chế tăng nhu động ruột, thúc đẩy cơ thể hấp thu 3 nhóm thức ăn là đạm, béo và đường. Ngoài ra, các vitamin và khoáng chất cũng rất cần thiết cho sự phát triển của trẻ em góp phần phòng chống nhiều bệnh: nhiễm trùng, tim mạch và ức chế sự phát triển khối u ác tính.<a href="https://atvstp.namdinh.gov.vn/lua-chon-va-su-dung-thuc-pham-rau-cu-qua-an-toan/#_ftn1" style="touch-action: manipulation; color: rgb(51, 72, 98);">[1]</a></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Để khẩu phần dinh dưỡng vừa đảm bảo an toàn thực phẩm vừa đảm bảo đầy đủ các dưỡng chất vitamin, chất xơ hỗ trợ tiêu hóa, tăng cường sức đề kháng trong mùa dịch bệnh hiện nay, người tiêu dùng tham khảo các phương pháp sau để lựa chọn rau, củ, quả an toàn cho bản thân và gia đình:</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">– Lựa chọn rau theo mùa vụ: Theo Cục An toàn thực phẩm, mùa khô nguy cơ ô nhiễm dư lượng thuốc bảo vệ thực vật trong rau sẽ cao hơn mùa mưa. Nên chọn rau vào vụ chính, là thời điểm cây trồng phát triển bình thường, ít bị sâu bệnh, dẫn đến số lần sử dụng thuốc bảo vệ thực và phân bón ít; ở vụ nghịch, để đạt năng suất cao phải sử dụng thuốc bảo vệ thực vật và phân bón nhiều,&nbsp;do vậy rau, quả có thể có hàm lượng dư lượng thuốc bảo vệ thực vật, phân bón hóa học vượt quá giới hạn cho phép.<a href="https://atvstp.namdinh.gov.vn/lua-chon-va-su-dung-thuc-pham-rau-cu-qua-an-toan/#_ftn2" style="touch-action: manipulation; color: rgb(51, 72, 98);">[2]</a></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);"><img fetchpriority="high" decoding="async" class=" wp-image-1342 aligncenter" src="https://atvstp.namdinh.gov.vn/wp-content/uploads/2021/09/Rau-ch%C3%ADnh-vu-600x400.jpg" alt="" width="396" height="264" srcset="/wp-content/uploads/2021/09/Rau-chính-vu-600x400.jpg 600w, /wp-content/uploads/2021/09/Rau-chính-vu-768x512.jpg 768w, /wp-content/uploads/2021/09/Rau-chính-vu.jpg 800w" sizes="(max-width: 396px) 100vw, 396px" style="max-width: 100%; height: auto; display: block; transition: opacity 1s ease 0s; opacity: 1; clear: both; margin: 0px auto;"></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241); text-align: center;"><em>Rau chính vụ, cây sinh trưởng phát triển bình thường&nbsp;(Nguồn: internet)</em></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">– Đối với sản phẩm rau quả có bao gói: Nên chọn sản phẩm mà trên bao bì hoặc nhãn gắn trực tiếp vào từng sản phẩm tối thiểu phải có các thông tin của nhà sản xuất, nhà cung cấp<sup>1</sup>; Đối với sản phẩm không bao gói: Nên chọn sản phẩm còn tươi, nguyên cuống, không dập nát, không có những đốm màu lạ<a name="_ftnref3" style="touch-action: manipulation; color: rgb(51, 72, 98);"></a><a href="https://atvstp.namdinh.gov.vn/lua-chon-va-su-dung-thuc-pham-rau-cu-qua-an-toan/#_ftn3" style="touch-action: manipulation; color: rgb(51, 72, 98);">[3]</a>.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">– Bằng mắt thường người tiêu dùng có thể chọn rau, của quả tươi theo các nhận biết sau:</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Rau củ quả có màu xanh, tươi hoặc màu đặc trưng của từng giống, từng chủng loại cây trồng.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Thân cây, cuống lá cứng cáp không mềm, cầm trên tay thân cây tương đối thẳng.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Bề mặt thân cây không có nhớt (nếu có độ nhớt là do người bán đã lặt những lá thối bên ngoài – Lá thối tạo độ nhớt).</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Đối với rau ăn lá: Không nên chọn những bó rau có màu xanh quá đậm, quá mướt, lá bóng mà nên chọn màu xanh nhạt, cây rau có vẻ bình thường.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">– Đối với rau ăn quả hay trái cây tươi:</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Chọn những quả không bị nứt, quả không thủng, không bị dập hay có mùi ủng thúi.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Nếu những quả có cành như nhãn, vải, nho… thì lõi cành bên trong có màu xanh&nbsp;<a href="https://atvstp.namdinh.gov.vn/lua-chon-va-su-dung-thuc-pham-rau-cu-qua-an-toan/#_ftn4" style="touch-action: manipulation; color: rgb(51, 72, 98);">[4]</a>.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Hạn chế mua sản phẩm gọt sẳn và xắt sẳn từ quả (xoài, cóc…) và củ (khoai tây, su su, cà rốt…), các sản phẩm này thường ngâm trong nước sau khi cắt&nbsp;(nếu nguồn nước ngâm không đảm bảo vệ sinh thì sẽ ảnh hưởng đến chất lượng của sản phẩm)&nbsp;<u>[5]</u></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Cách nhận biết cụ thể một số loại rau củ quả an toàn</p><table width="805" style="width: 787.5px; margin-bottom: 1em; border-color: rgb(236, 236, 236); border-spacing: 0px; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241); height: 1159px;"><thead><tr><td style="padding: 0.5em 0.5em 0.5em 0px; text-align: center; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);"><strong style="font-weight: bold;">STT</strong></td><td width="278" style="padding: 0.5em; text-align: center; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);"><strong style="font-weight: bold;">CHỦNG LOẠI</strong></td><td width="283" style="padding: 0.5em 0px 0.5em 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);"><p style="margin: 0.5em 0px; text-align: center;"><strong style="font-weight: bold;">CÁCH NHẬN BIẾT</strong></p></td></tr></thead><tbody><tr><td width="43" style="padding: 0.5em 0.5em 0.5em 0px; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">1</td><td width="278" style="padding: 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Rau ăn ngọn:&nbsp;rau lang, rau muống, đọt bầu bí</td><td width="283" style="padding: 0.5em 0px 0.5em 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Không nên mua những bó rau có ngọn vươn ra quá dài, do dùng thuốc chất kích thích tăng trưởng quá liều và không đảm bảo thời gian cách ly.<a href="https://atvstp.namdinh.gov.vn/lua-chon-va-su-dung-thuc-pham-rau-cu-qua-an-toan/#_ftn1" style="touch-action: manipulation; color: rgb(51, 72, 98);">[1]</a>Nếu mua về không sử dụng liền để ngày hôm sau ngọn rau sẽ vươn ra thêm một đoạn từ 5 – 10 cm.</td></tr><tr><td width="43" style="padding: 0.5em 0.5em 0.5em 0px; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">2</td><td width="278" style="padding: 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Rau cải: cải xanh, cải thảo…</td><td width="283" style="padding: 0.5em 0px 0.5em 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Khi mua nên bẻ ngang phần gốc, nếu thấy có nước từ thân tiết ra thì rau cải đã bị bón quá nhiều phân đạm, không đảm bảo thời gian cách ly, hàm lượng Nitrat trong rau còn rất cao. Nếu để quá 12 giờ thì dễ bị úng nâu đen, không nên mua.</td></tr><tr><td width="43" style="padding: 0.5em 0.5em 0.5em 0px; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">3</td><td width="278" style="padding: 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Rau muống</td><td width="283" style="padding: 0.5em 0px 0.5em 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Không nên mua những bó rau có cọng to hơn bình thường, rau giòn, lá màu xanh đen, nhìn nghiêng mặt trên của lá rau rất bóng và mướt, do sử dụng nhiều phân đạm hoặc phân bón lá. Khi nước luộc rau này nguội, nước sẽ biến thành màu xanh đen và có vẩn kết tủa đen; khi ăn xong, nếu tinh ý ta nhận thấy có vị chát.</td></tr><tr><td width="43" style="padding: 0.5em 0.5em 0.5em 0px; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">4</td><td width="278" style="padding: 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Rau bí (ngọn và lá của cây bí ngô)</td><td width="283" style="padding: 0.5em 0px 0.5em 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Không nên mua bó rau có ngọn dài, khoảng cách giữa các lóng xa nhau (ngọn vươn dài), tay cuống mập và ngắn, ít lông tơ, ngọn bí màu xanh nhạt, lá màu xanh đen…do bón thừa đạm hoặc nhiều phân bón lá và chưa đủ thời gian cách ly.</td></tr><tr><td width="43" style="padding: 0.5em 0.5em 0.5em 0px; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">5</td><td width="278" style="padding: 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Rau cần</td><td width="283" style="padding: 0.5em 0px 0.5em 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Khi thấy thân rau to, ngó rau trắng ngần, rau nhanh bị héo thì không nên mua do sử dụng quá nhiều phân bón lá và có khả năng còn tồn dư dư lượng thuốc bảo vệ thực vật. Nếu để đến ngày hôm sau thì rau héo úa, thân khô tóp lại nhăn nheo, khi xào nấu lá rau biến màu xanh đen.</td></tr><tr><td width="43" style="padding: 0.5em 0.5em 0.5em 0px; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">6</td><td width="278" style="padding: 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Củ, quả</td><td width="283" style="padding: 0.5em 0px 0.5em 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Không nên chọn những trái quá lớn, mà chọn những trái có kích thước vừa phải hoặc hơi nhỏ. Không chọn những trái da căng và có vết nứt dọc theo thân, những trái da xanh bóng.</td></tr><tr><td width="43" style="padding: 0.5em 0.5em 0.5em 0px; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">7</td><td width="278" style="padding: 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Các loại quả đậu (gồm đậu đũa, đậu cô ve, đậu Hà lan, đậu ván…)</td><td width="283" style="padding: 0.5em 0px 0.5em 0.5em; border-bottom: 1px solid rgb(236, 236, 236); line-height: 1.3; font-size: 0.9em; color: rgb(102, 102, 102);">Không nên chọn những trái khi nhìn trái bóng nhẫy, ít lông tơ…</td></tr></tbody></table><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Để rau củ quả đảm bảo an toàn thực phẩm&nbsp;và&nbsp;vẫn&nbsp;cung cấp đầy đủ các chất dinh dưỡng, người tiêu dùng lưu ý sơ chế, chế biến sản phẩm rau, củ, quả<br>như sau:</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Việc trồng và chăm sóc rau củ quả không tránh khỏi bề mặt rau củ quả chứa nhiều vi khuẩn và nguy cơ tồn dư hóa chất bảo vệ thực vật. Để giảm dư lượng thuốc bảo vệ thực vật, đảm bảo vệ sinh an toàn thực phẩm cần rửa rau củ quả dưới vòi nước sạch và chảy mạnh&nbsp;để giảm tồn dư thuốc bảo vệ thực vật trong sản phẩm.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Rau xanh có bề mặt lá to:&nbsp;Rửa từng cọng, từng lá rau. Rửa từng bề mặt lá một cách nhẹ nhàng không nóng vội.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241); text-align: center;"><img decoding="async" class="alignnone wp-image-1343" src="https://atvstp.namdinh.gov.vn/wp-content/uploads/2021/09/rua-sau-600x400.png" alt="" width="450" height="300" srcset="/wp-content/uploads/2021/09/rua-sau-600x400.png 600w, /wp-content/uploads/2021/09/rua-sau-768x512.png 768w, /wp-content/uploads/2021/09/rua-sau.png 1000w" sizes="(max-width: 450px) 100vw, 450px" style="max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1;"></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241); text-align: center;"><em>Rửa rau dưới vòi nước sạch&nbsp;(nguồn: internet)</em></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Rau xanh có lá nhỏ: Rửa trong chậu với nước sạch nhiều lần. Sau đó rửa từng mớ nhỏ bằng nắm tay dưới vòi nước.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Quả tươi: Sau khi rửa dưới vòi nước sạch nhiều lần, dùng khăn giấy sạch để lau khô nhằm loại bỏ vi khuẩn còn lại, trước khi ăn nên gọt vỏ.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Ngắt bỏ phần đọt khi sử dụng rau ăn ngọn vì nơi này chứa nhiều thuốc bảo vệ thực vật;</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">+ Rau sống như tía tô, húng cây, húng quế, diếp cá…sau khi rửa sạch, ngâm rau trong nước muối pha loãng 5-10 phút.&nbsp;Để rau không mau hỏng, người tiêu dùng nên để rau trên rổ cho ráo nước hoặc dùng lồng quay chuyên dụng để quay cho thật ráo nước, sau đó cho rau vào túi nylon sạch&nbsp;và cho vào ngăn mát.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241); text-align: center;"><img decoding="async" class="alignnone size-medium wp-image-1345" src="https://atvstp.namdinh.gov.vn/wp-content/uploads/2021/09/lam-rao-nuoc-400x400.jpg" alt="" width="400" height="400" srcset="/wp-content/uploads/2021/09/lam-rao-nuoc-400x400.jpg 400w, /wp-content/uploads/2021/09/lam-rao-nuoc-280x280.jpg 280w, /wp-content/uploads/2021/09/lam-rao-nuoc.jpg 650w" sizes="(max-width: 400px) 100vw, 400px" style="max-width: 100%; height: auto; display: inline-block; transition: opacity 1s ease 0s; opacity: 1;"></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241); text-align: center;"><em>Làm ráo nước trên bề mặt rau để bảo quản rau được lâu không bị hỏng (Nguồn: internet)</em></p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Theo Cục An toàn thực phẩm, rau củ quả là 1 loại thực phẩm đặc biệt, cứ sau 1 ngày là rau xanh mất đi lượng lớn chất dinh dưỡng nhất định. Chính vì vậy, không nên “tích trữ” rau, củ,&nbsp;quả quá lâu trong tủ lạnh và nên ăn ngay sau khi vừa chế biến<a href="https://atvstp.namdinh.gov.vn/lua-chon-va-su-dung-thuc-pham-rau-cu-qua-an-toan/#_ftn1" style="touch-action: manipulation; color: rgb(51, 72, 98);">[6]</a>.</p><p style="margin-bottom: 1.3em; color: rgb(0, 0, 0); font-family: &quot;-apple-system,BlinkMacSystemFont,&amp;quot;Segoe UI&amp;quot;,Roboto,Oxygen-Sans,Ubuntu,Cantarell,&amp;quot;Helvetica Neue&amp;quot;,sans-serif&quot;, sans-serif; font-size: 16px; background-color: rgb(241, 241, 241);">Để phòng ngừa ngộ độc thực phẩm, mỗi người tiêu dùng phải chọn mua các sản phẩm từ&nbsp;những đơn vị sản xuất, kinh doanh có uy tín, có thương hiệu, có chứng nhận chất lượng&nbsp;sản phẩm như:&nbsp;VietGAP, GlobalGAP, hữu cơ… Ngoài ra,&nbsp;nếu mua rau, củ quả tại truyền thống nên&nbsp;chọn các quầy bán không gần những khu vực có nguy cơ ô nhiễm cao (cống rãnh thoát nước thải, nơi chứa rác thải, gần nhà vệ sinh…)<sup>2</sup>. Bên cạnh đó, người tiêu dùng cũng phải lưu ý việc chế biến và sử dụng thực phẩm theo đúng nguyên tắc thực hành chế biến và sử dụng thực phẩm an toàn nhằm đảm bảo sức khỏe và an toàn khi sử dụng.</p>', N'lua-chon-va-su-dung-thuc-pham-rau-cu-qua-an-toan.jpg', 1, N'lua-chon-va-su-dung-thuc-pham-rau-cu-qua-an-toan', CAST(N'2024-05-07T18:31:47.083' AS DateTime), NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (1, N'Chanh Dây', N'Chanh Dây', N'Chanh Dây', 4, 40000, 1, N'chanh-day.png', NULL, CAST(N'2012-12-12T00:00:00.000' AS DateTime), CAST(N'2024-01-29T00:59:09.590' AS DateTime), 1, 1, 1, N'1', N'1', N'chanh-day', N'1', N'1', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (3, N'Xà Lách ', N'Xà Lách ', N'Xà Lách ', 1, 40000, 0, N'xa-lach.png', NULL, CAST(N'2024-01-08T15:49:00.000' AS DateTime), CAST(N'2024-04-28T16:44:26.333' AS DateTime), 0, 0, 1, N'1', N'1', N'xa-lach', N'1', N'1', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (4, N'Trứng Gà', N'Trứng gà', N'Trứng gà', 3, 25000, 0, N'trung-ga.jpg', NULL, CAST(N'2024-01-08T16:17:00.000' AS DateTime), CAST(N'2024-04-28T16:47:08.887' AS DateTime), 0, 0, 1, N'11', N'1', N'trung-ga', N'1', N'1', 1982)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (5, N'Thịt Gà ', N'Thịt gà ', N'Thịt gà ', 2, 50000, 0, N'thit-ga.png', NULL, CAST(N'2024-01-08T16:18:00.000' AS DateTime), CAST(N'2024-01-29T01:02:43.320' AS DateTime), 1, 0, 1, N'Thịt gà', N'Thịt gà', N'thit-ga', N'Thịt gà', N'Thịt gà', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (6, N'Rau Muống', N'Rau muống', N'Ngon ', 1, 20000, 10, N'rau-muong.png', NULL, CAST(N'2024-01-08T23:41:51.000' AS DateTime), CAST(N'2024-04-28T16:47:18.560' AS DateTime), 0, 0, 1, NULL, N'Rau muống', N'rau-muong', N'Rau muống', N'Rau muống', 200)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (7, N'Tỏi', N'Tỏi', N'TỏiTỏiTỏiTỏiTỏiTỏiTỏiTỏi', 1, 20000, 1, N'toi.png', NULL, CAST(N'2024-01-13T20:32:09.490' AS DateTime), CAST(N'2024-01-13T20:32:09.490' AS DateTime), 0, 1, 1, N'Tỏi', N'Tỏi', N'toi', N'Tỏi', N'Tỏi', 10)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (8, N'Hành Lá', N'Hành lá', N'Hành láHành láHành láHành láHành láHành láHành láHành láHành láHành lá', 1, 20000, 10, N'hanh-la.png', NULL, CAST(N'2024-01-13T20:33:15.000' AS DateTime), CAST(N'2024-01-30T15:38:20.173' AS DateTime), 0, 1, 1, N'Hành lá', N'Hành lá', N'hanh-la', N'Hành lá', N'Hành lá', 20)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (10, N'Bưởi', N'Bưởi', N'BưởiBưởiBưởiBưởiBưởiBưởiBưởiBưởiBưởi', 4, 100000, 10, N'buoi.png', NULL, CAST(N'2024-01-30T15:33:21.000' AS DateTime), CAST(N'2024-01-31T08:56:28.523' AS DateTime), 1, 1, 1, N'Bưởi', N'Bưởi', N'buoi', N'Bưởi', N'Bưởi', 321)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (11, N'Súp Lơ', N'Súp Lơ', N'Súp LơSúp LơSúp LơSúp LơSúp LơSúp Lơ', 1, 100000, 20, N'sup-lo.jpg', NULL, CAST(N'2024-02-15T21:26:38.000' AS DateTime), CAST(N'2024-04-28T16:45:41.137' AS DateTime), 0, 1, 1, N'Súp Lơ', N'Súp Lơ', N'sup-lo', N'Súp Lơ', N'Súp Lơ', 1231)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (12, N'Gừng', N'Gừng', N'GừngGừngGừngGừng', 1, 13000, 0, N'gung.jpg', NULL, CAST(N'2024-02-15T21:27:44.607' AS DateTime), CAST(N'2024-02-15T21:27:44.607' AS DateTime), 0, 0, 1, N'Gừng', N'Gừng', N'gung', N'Gừng', N'Gừng', 12)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitInStock]) VALUES (13, N'Dứa', N'Dứa', N'DứaDứaDứaDứa', 4, 21000, NULL, N'dua.jpg', NULL, CAST(N'2024-04-01T22:44:35.000' AS DateTime), CAST(N'2024-04-28T16:31:15.717' AS DateTime), 0, 1, 1, N'Dứa', N'Dứa', N'dua', N'Dứa', N'Dứa', 12)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Admin', N'Quản trị viên')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Staff', N'Nhân Viên')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'Customer', N'Khách Hàng')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (4, N'Marketing', N'Marketing')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (6, N'Test', N'Test')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (8, N'TuanAnh', N'TuanAnh')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (9, N'nguyentuananh', N'nguyentuananh')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactStatus] ON 

INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (1, N'Chờ lấy hàng', N'Đã xác nhận và đang soạn hàng')
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (2, N'Chờ xác nhận', N'Đang được người bán xác nhận với người mua')
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (3, N'Đang giao', N'Đơn hàng đang được giao tới người mua')
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (4, N'Đã giao thành công', N'Đơn hàng đã được giao thành công tới người mua')
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (5, N'Đã hủy', N'Đơn hàng đã được hủy thành công')
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (6, N'Trả hàng', N'Đơn hàng đã được trả hàng thành công')
SET IDENTITY_INSERT [dbo].[TransactStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[WishLists] ON 

INSERT [dbo].[WishLists] ([WishListID], [CustomerID], [ProductID], [Quantity]) VALUES (12, 1, 13, 1)
SET IDENTITY_INSERT [dbo].[WishLists] OFF
GO
ALTER TABLE [dbo].[WishLists] ADD  CONSTRAINT [DF_WishLists_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Locations1] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Locations1]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Roles]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TransactStatus] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[TransactStatus] ([TransactStatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TransactStatus]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Roles]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Priorities_Functions] FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Functions] ([FunctionId])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Priorities_Functions]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[WishLists]  WITH CHECK ADD  CONSTRAINT [FK_WishLists_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[WishLists] CHECK CONSTRAINT [FK_WishLists_Customers]
GO
ALTER TABLE [dbo].[WishLists]  WITH CHECK ADD  CONSTRAINT [FK_WishLists_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[WishLists] CHECK CONSTRAINT [FK_WishLists_Products]
GO
USE [master]
GO
ALTER DATABASE [DiChoSaiGon_Ecommerce] SET  READ_WRITE 
GO
