USE [master]
GO
/****** Object:  Database [RealEstateAgency]    Script Date: 07.02.2024 14:55:28 ******/
CREATE DATABASE [RealEstateAgency]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstateAgency', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RealEstateAgency.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RealEstateAgency_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\RealEstateAgency_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RealEstateAgency] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstateAgency].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstateAgency] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RealEstateAgency] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstateAgency] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstateAgency] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstateAgency] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstateAgency] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstateAgency] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstateAgency] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RealEstateAgency] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstateAgency] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstateAgency] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstateAgency] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstateAgency] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstateAgency] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstateAgency] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstateAgency] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RealEstateAgency] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstateAgency] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstateAgency] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstateAgency] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstateAgency] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RealEstateAgency] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RealEstateAgency] SET QUERY_STORE = OFF
GO
USE [RealEstateAgency]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Patronymic] [nvarchar](20) NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientEmployee]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientEmployee](
	[IdClient] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
 CONSTRAINT [PK_ClientEmployee] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC,
	[IdEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developer]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[IdDeveloper] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Developer] PRIMARY KEY CLUSTERED 
(
	[IdDeveloper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[IdDistrict] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[IdDistrict] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[IdEmployee] [int] NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Patronymic] [nvarchar](20) NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[Login] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](40) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IdEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flat]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flat](
	[IdFlat] [int] IDENTITY(1,1) NOT NULL,
	[BuildingNumberOfRoom] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[NumberOfRooms] [int] NOT NULL,
	[Area] [int] NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[EntanceNumber] [int] NOT NULL,
	[IdSkyscraper] [int] NOT NULL,
	[ImagePreview] [varbinary](max) NULL,
 CONSTRAINT [PK_Flat] PRIMARY KEY CLUSTERED 
(
	[IdFlat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[IdMaterial] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[IdMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[IdRequset] [int] IDENTITY(1,1) NOT NULL,
	[MinimumPrice] [money] NULL,
	[MaximumPrice] [money] NOT NULL,
	[NumberOfRooms] [int] NOT NULL,
	[MinimumArea] [int] NOT NULL,
	[MaximumArea] [int] NULL,
	[RequestDate] [date] NOT NULL,
	[IdDistrict] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[IdClient] [int] NOT NULL,
	[IdRequestStatus] [int] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[IdRequset] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestFlat]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestFlat](
	[IdRequest] [int] NOT NULL,
	[IdFlat] [int] NOT NULL,
 CONSTRAINT [PK_RequestFlat] PRIMARY KEY CLUSTERED 
(
	[IdRequest] ASC,
	[IdFlat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestStatus]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestStatus](
	[IdRequestStatus] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_RequestStatus] PRIMARY KEY CLUSTERED 
(
	[IdRequestStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRole] [int] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skyscraper]    Script Date: 07.02.2024 14:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skyscraper](
	[IdSkyscraper] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[NumberOfFloors] [int] NOT NULL,
	[NumberOfEntrances] [int] NOT NULL,
	[NumberOfApartments] [int] NOT NULL,
	[IdDistrict] [int] NOT NULL,
	[IdMaterial] [int] NOT NULL,
	[IdDeveloper] [int] NOT NULL,
 CONSTRAINT [PK_Skyscraper] PRIMARY KEY CLUSTERED 
(
	[IdSkyscraper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([IdClient], [FirstName], [LastName], [Patronymic], [Phone], [Comment]) VALUES (1, N'Матвей', N'Лакеев', N'Артёмович', N'89189997878', N'Квартира с хорошей шумоизоляцией для битмейкера.')
INSERT [dbo].[Client] ([IdClient], [FirstName], [LastName], [Patronymic], [Phone], [Comment]) VALUES (2, N'София', N'Дмитрова', N'Алексеевна', N'89182502588', NULL)
INSERT [dbo].[Client] ([IdClient], [FirstName], [LastName], [Patronymic], [Phone], [Comment]) VALUES (3, N'Вадим', N'Цветков', N'Владимирович', N'89607129977', N'С видом на парк Краснодар.')
INSERT [dbo].[Client] ([IdClient], [FirstName], [LastName], [Patronymic], [Phone], [Comment]) VALUES (4, N'Леонтий', N'Нестеров', N'Донатович', N'85009187755', N'Обязательно школа и садик рядом.')
INSERT [dbo].[Client] ([IdClient], [FirstName], [LastName], [Patronymic], [Phone], [Comment]) VALUES (5, N'Эшли', N'Соболева', N'Вячеславовна', N'89179634256', NULL)
INSERT [dbo].[Client] ([IdClient], [FirstName], [LastName], [Patronymic], [Phone], [Comment]) VALUES (6, N'София', N'Ширяева', N'Тимофеевна', N'89176302541', N'Рядом с озером.')
INSERT [dbo].[Client] ([IdClient], [FirstName], [LastName], [Patronymic], [Phone], [Comment]) VALUES (7, N'Келен', N'Орлова', N'Тимуровна', N'89178974163', NULL)
INSERT [dbo].[Client] ([IdClient], [FirstName], [LastName], [Patronymic], [Phone], [Comment]) VALUES (8, N'Милиса', N'Анисимова', N'Ефимовна', N'89601236547', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[ClientEmployee] ([IdClient], [IdEmployee]) VALUES (1, 2)
INSERT [dbo].[ClientEmployee] ([IdClient], [IdEmployee]) VALUES (2, 5)
INSERT [dbo].[ClientEmployee] ([IdClient], [IdEmployee]) VALUES (3, 2)
INSERT [dbo].[ClientEmployee] ([IdClient], [IdEmployee]) VALUES (4, 2)
INSERT [dbo].[ClientEmployee] ([IdClient], [IdEmployee]) VALUES (5, 2)
INSERT [dbo].[ClientEmployee] ([IdClient], [IdEmployee]) VALUES (6, 2)
INSERT [dbo].[ClientEmployee] ([IdClient], [IdEmployee]) VALUES (7, 2)
INSERT [dbo].[ClientEmployee] ([IdClient], [IdEmployee]) VALUES (8, 5)
GO
SET IDENTITY_INSERT [dbo].[Developer] ON 

INSERT [dbo].[Developer] ([IdDeveloper], [Name], [Description]) VALUES (1, N'АСК', N'«АСК» — часть холдинга AVA Group. AVA Group — девелопер федерального уровня, в портфеле компании 115 сданных объектов общей площадью более 1 280 000 кв.м.')
INSERT [dbo].[Developer] ([IdDeveloper], [Name], [Description]) VALUES (2, N'ЮгСтройИмпериал', N'Строительная компания')
INSERT [dbo].[Developer] ([IdDeveloper], [Name], [Description]) VALUES (3, N'Девелопмент-Юг', N'Сегодня корпорацией реализуются проекты в восьми городах - Краснодаре, Перми, Ростове-на-Дону, Батайске, Астрахани, Владивостоке, Нижнем Новгороде и Екатеринбурге. Особое внимание уделяется качеству жилья и формированию комфортной среды для жизни.')
SET IDENTITY_INSERT [dbo].[Developer] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([IdDistrict], [Name]) VALUES (1, N'ЧМР')
INSERT [dbo].[District] ([IdDistrict], [Name]) VALUES (2, N'ЦМР')
INSERT [dbo].[District] ([IdDistrict], [Name]) VALUES (3, N'ФМР')
INSERT [dbo].[District] ([IdDistrict], [Name]) VALUES (4, N'ЮМР')
INSERT [dbo].[District] ([IdDistrict], [Name]) VALUES (5, N'ГМР')
SET IDENTITY_INSERT [dbo].[District] OFF
GO
INSERT [dbo].[Employee] ([IdEmployee], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [Role]) VALUES (1, N'Александр', N'Богданов', N'Даниилович', N'89189693142', N'admin', N'admin', 2)
INSERT [dbo].[Employee] ([IdEmployee], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [Role]) VALUES (2, N'Василиса', N'Агапова', N'Кирилловна', N'89189917578', N'rel2', N'rel2', 2)
INSERT [dbo].[Employee] ([IdEmployee], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [Role]) VALUES (3, N'Дмитрий', N'Гордеев', N'Владиславович', N'89605553754', N'hrm1', N'hrm1', 1)
INSERT [dbo].[Employee] ([IdEmployee], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [Role]) VALUES (4, N'Елена', N'Матвеева', N'Сергеевна', N'89189994455', N'rel3', N'qhsTCORbIX', 2)
INSERT [dbo].[Employee] ([IdEmployee], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [Role]) VALUES (5, N'Александр', N'Богданов', N'Артемович', N'89601114455', N'hrm2', N'd2NngYpmh1', 1)
INSERT [dbo].[Employee] ([IdEmployee], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [Role]) VALUES (6, N'Аделина', N'Михайлова', N'Владиславовна', N'89604441177', N'rel4', N'kBOCmHzVTQ', 2)
INSERT [dbo].[Employee] ([IdEmployee], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [Role]) VALUES (7, N'Лика', N'Шестакова', N'Александровна', N'89189995566', N'rel5', N'WR29EdbngR', 2)
INSERT [dbo].[Employee] ([IdEmployee], [FirstName], [LastName], [Patronymic], [Phone], [Login], [Password], [Role]) VALUES (8, N'Ольга', N'Чехова', N'Демьяновна', N'89603335511', N'rel6', N'k69LXtBsEl', 2)
GO
SET IDENTITY_INSERT [dbo].[Flat] ON 

INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (46, 100, 4000000.0000, 1, 32, 8, 1, 6, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (47, 179, 5500000.0000, 2, 60, 10, 4, 7, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (48, 189, 7500000.0000, 3, 90, 17, 3, 8, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (49, 200, 11000000.0000, 3, 100, 12, 2, 9, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (50, 41, 8500000.0000, 3, 75, 11, 5, 10, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (51, 25, 9500000.0000, 3, 80, 3, 2, 6, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (52, 90, 9000000.0000, 3, 79, 27, 4, 7, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (53, 52, 4500000.0000, 2, 50, 5, 1, 8, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (54, 30, 5200000.0000, 2, 55, 4, 4, 7, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (55, 24, 5000000.0000, 2, 50, 8, 3, 9, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (56, 64, 4900000.0000, 2, 49, 15, 1, 10, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (57, 195, 4500000.0000, 1, 31, 9, 4, 6, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (58, 102, 4700000.0000, 1, 42, 7, 2, 7, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (59, 111, 4800000.0000, 1, 45, 16, 3, 8, NULL)
INSERT [dbo].[Flat] ([IdFlat], [BuildingNumberOfRoom], [Price], [NumberOfRooms], [Area], [FloorNumber], [EntanceNumber], [IdSkyscraper], [ImagePreview]) VALUES (60, 72, 4400000.0000, 1, 37, 20, 1, 9, NULL)
SET IDENTITY_INSERT [dbo].[Flat] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([IdMaterial], [Name]) VALUES (1, N'Кирпич')
INSERT [dbo].[Material] ([IdMaterial], [Name]) VALUES (2, N'Монолит')
INSERT [dbo].[Material] ([IdMaterial], [Name]) VALUES (3, N'Монолит-кирпич')
INSERT [dbo].[Material] ([IdMaterial], [Name]) VALUES (4, N'Панель')
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([IdRequset], [MinimumPrice], [MaximumPrice], [NumberOfRooms], [MinimumArea], [MaximumArea], [RequestDate], [IdDistrict], [IdEmployee], [IdClient], [IdRequestStatus]) VALUES (17, 4100000.0000, 4700000.0000, 1, 31, 43, CAST(N'2022-05-21' AS Date), 1, 2, 1, 2)
INSERT [dbo].[Request] ([IdRequset], [MinimumPrice], [MaximumPrice], [NumberOfRooms], [MinimumArea], [MaximumArea], [RequestDate], [IdDistrict], [IdEmployee], [IdClient], [IdRequestStatus]) VALUES (18, 5000000.0000, 10000000.0000, 3, 90, 120, CAST(N'2022-06-01' AS Date), 4, 2, 8, 1)
INSERT [dbo].[Request] ([IdRequset], [MinimumPrice], [MaximumPrice], [NumberOfRooms], [MinimumArea], [MaximumArea], [RequestDate], [IdDistrict], [IdEmployee], [IdClient], [IdRequestStatus]) VALUES (19, NULL, 90000000.0000, 3, 70, NULL, CAST(N'2022-06-02' AS Date), 2, 2, 7, 1)
INSERT [dbo].[Request] ([IdRequset], [MinimumPrice], [MaximumPrice], [NumberOfRooms], [MinimumArea], [MaximumArea], [RequestDate], [IdDistrict], [IdEmployee], [IdClient], [IdRequestStatus]) VALUES (20, NULL, 7000000.0000, 2, 50, NULL, CAST(N'2022-06-08' AS Date), 3, 2, 6, 2)
INSERT [dbo].[Request] ([IdRequset], [MinimumPrice], [MaximumPrice], [NumberOfRooms], [MinimumArea], [MaximumArea], [RequestDate], [IdDistrict], [IdEmployee], [IdClient], [IdRequestStatus]) VALUES (21, NULL, 5000000.0000, 1, 35, NULL, CAST(N'2022-06-09' AS Date), 5, 2, 5, 3)
INSERT [dbo].[Request] ([IdRequset], [MinimumPrice], [MaximumPrice], [NumberOfRooms], [MinimumArea], [MaximumArea], [RequestDate], [IdDistrict], [IdEmployee], [IdClient], [IdRequestStatus]) VALUES (22, NULL, 6000000.0000, 1, 30, NULL, CAST(N'2022-06-04' AS Date), 3, 2, 4, 1)
INSERT [dbo].[Request] ([IdRequset], [MinimumPrice], [MaximumPrice], [NumberOfRooms], [MinimumArea], [MaximumArea], [RequestDate], [IdDistrict], [IdEmployee], [IdClient], [IdRequestStatus]) VALUES (23, NULL, 6.0000, 5, 9, NULL, CAST(N'2022-05-31' AS Date), 2, 5, 3, 1)
INSERT [dbo].[Request] ([IdRequset], [MinimumPrice], [MaximumPrice], [NumberOfRooms], [MinimumArea], [MaximumArea], [RequestDate], [IdDistrict], [IdEmployee], [IdClient], [IdRequestStatus]) VALUES (24, NULL, 5.0000, 2, 2, NULL, CAST(N'2022-06-01' AS Date), 4, 5, 2, 1)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
INSERT [dbo].[RequestFlat] ([IdRequest], [IdFlat]) VALUES (17, 57)
INSERT [dbo].[RequestFlat] ([IdRequest], [IdFlat]) VALUES (17, 58)
GO
SET IDENTITY_INSERT [dbo].[RequestStatus] ON 

INSERT [dbo].[RequestStatus] ([IdRequestStatus], [Status]) VALUES (1, N'Выполнена')
INSERT [dbo].[RequestStatus] ([IdRequestStatus], [Status]) VALUES (2, N'Обрабатывается')
INSERT [dbo].[RequestStatus] ([IdRequestStatus], [Status]) VALUES (3, N'Не выполнена')
SET IDENTITY_INSERT [dbo].[RequestStatus] OFF
GO
INSERT [dbo].[Role] ([IdRole], [Name], [Description]) VALUES (1, N'Кадровик', N'Сотрудник, который регистрирует риелтора в системе.')
INSERT [dbo].[Role] ([IdRole], [Name], [Description]) VALUES (2, N'Риелтор', N'Сотрудник, котрый работает с клиентом, застройщиками, объектами недвижимости.')
GO
SET IDENTITY_INSERT [dbo].[Skyscraper] ON 

INSERT [dbo].[Skyscraper] ([IdSkyscraper], [Name], [Address], [NumberOfFloors], [NumberOfEntrances], [NumberOfApartments], [IdDistrict], [IdMaterial], [IdDeveloper]) VALUES (6, N'ЖК Достоевский', N'ул Мира 30', 21, 5, 200, 1, 3, 3)
INSERT [dbo].[Skyscraper] ([IdSkyscraper], [Name], [Address], [NumberOfFloors], [NumberOfEntrances], [NumberOfApartments], [IdDistrict], [IdMaterial], [IdDeveloper]) VALUES (7, N'ЖК Тургенев', N'ул Озерная 15', 30, 7, 250, 2, 1, 1)
INSERT [dbo].[Skyscraper] ([IdSkyscraper], [Name], [Address], [NumberOfFloors], [NumberOfEntrances], [NumberOfApartments], [IdDistrict], [IdMaterial], [IdDeveloper]) VALUES (8, N'ЖК Большой', N'ул Красная 72', 25, 5, 220, 2, 2, 2)
INSERT [dbo].[Skyscraper] ([IdSkyscraper], [Name], [Address], [NumberOfFloors], [NumberOfEntrances], [NumberOfApartments], [IdDistrict], [IdMaterial], [IdDeveloper]) VALUES (9, N'ЖК Элегант', N'ул Старокубанская 131', 25, 5, 230, 4, 4, 1)
INSERT [dbo].[Skyscraper] ([IdSkyscraper], [Name], [Address], [NumberOfFloors], [NumberOfEntrances], [NumberOfApartments], [IdDistrict], [IdMaterial], [IdDeveloper]) VALUES (10, N'ЖК Фамилия', N'ул Старокубанская 124', 30, 7, 240, 3, 3, 3)
SET IDENTITY_INSERT [dbo].[Skyscraper] OFF
GO
ALTER TABLE [dbo].[ClientEmployee]  WITH CHECK ADD  CONSTRAINT [FK_ClientEmployee_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientEmployee] CHECK CONSTRAINT [FK_ClientEmployee_Client]
GO
ALTER TABLE [dbo].[ClientEmployee]  WITH CHECK ADD  CONSTRAINT [FK_ClientEmployee_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([IdEmployee])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientEmployee] CHECK CONSTRAINT [FK_ClientEmployee_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([IdRole])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Flat]  WITH CHECK ADD  CONSTRAINT [FK_Flat_Skyscraper] FOREIGN KEY([IdSkyscraper])
REFERENCES [dbo].[Skyscraper] ([IdSkyscraper])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Flat] CHECK CONSTRAINT [FK_Flat_Skyscraper]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Client]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_District] FOREIGN KEY([IdDistrict])
REFERENCES [dbo].[District] ([IdDistrict])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_District]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([IdEmployee])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Employee]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_RequestStatus] FOREIGN KEY([IdRequestStatus])
REFERENCES [dbo].[RequestStatus] ([IdRequestStatus])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_RequestStatus]
GO
ALTER TABLE [dbo].[RequestFlat]  WITH CHECK ADD  CONSTRAINT [FK_RequestFlat_Flat] FOREIGN KEY([IdFlat])
REFERENCES [dbo].[Flat] ([IdFlat])
GO
ALTER TABLE [dbo].[RequestFlat] CHECK CONSTRAINT [FK_RequestFlat_Flat]
GO
ALTER TABLE [dbo].[RequestFlat]  WITH CHECK ADD  CONSTRAINT [FK_RequestFlat_Request] FOREIGN KEY([IdRequest])
REFERENCES [dbo].[Request] ([IdRequset])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestFlat] CHECK CONSTRAINT [FK_RequestFlat_Request]
GO
ALTER TABLE [dbo].[Skyscraper]  WITH CHECK ADD  CONSTRAINT [FK_Skyscraper_Developer] FOREIGN KEY([IdDeveloper])
REFERENCES [dbo].[Developer] ([IdDeveloper])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Skyscraper] CHECK CONSTRAINT [FK_Skyscraper_Developer]
GO
ALTER TABLE [dbo].[Skyscraper]  WITH CHECK ADD  CONSTRAINT [FK_Skyscraper_District] FOREIGN KEY([IdDistrict])
REFERENCES [dbo].[District] ([IdDistrict])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Skyscraper] CHECK CONSTRAINT [FK_Skyscraper_District]
GO
ALTER TABLE [dbo].[Skyscraper]  WITH CHECK ADD  CONSTRAINT [FK_Skyscraper_Material] FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[Material] ([IdMaterial])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Skyscraper] CHECK CONSTRAINT [FK_Skyscraper_Material]
GO
USE [master]
GO
ALTER DATABASE [RealEstateAgency] SET  READ_WRITE 
GO
