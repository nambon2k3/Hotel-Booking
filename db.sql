USE [master]
GO
/****** Object:  Database [SWP_Hotel_Booking]    Script Date: 2/19/2024 11:33:56 AM ******/
CREATE DATABASE [SWP_Hotel_Booking]
GO
ALTER DATABASE [SWP_Hotel_Booking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_Hotel_Booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_Hotel_Booking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_Hotel_Booking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_Hotel_Booking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP_Hotel_Booking] SET QUERY_STORE = OFF
GO
USE [SWP_Hotel_Booking]
GO
/****** Object:  Table [dbo].[BedS]    Script Date: 2/19/2024 11:33:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BedS](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[BedName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/19/2024 11:33:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[roomid] [int] NULL,
	[rating] [int] NULL,
	[content] [text] NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVOICES]    Script Date: 2/19/2024 11:33:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVOICES](
	[InID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoomID] [int] NULL,
	[CheckInDate] [date] NULL,
	[CheckOutDate] [date] NULL,
	[ReservationStatus] [int] NULL,
	[NumberPerson] [int] NULL,
	[NumberRooms] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[transactionCode] [varchar](20) NULL,
	[TypePayment] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 2/19/2024 11:33:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[conversationId] [int] NULL,
	[message] [nvarchar](max) NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 2/19/2024 11:33:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[Size] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
	[Img] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[BID] [int] NULL,
	[RoomName] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[Details] [nvarchar](max) NULL,
	[TotalRoom] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomServices]    Script Date: 2/19/2024 11:33:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomServices](
	[RID] [int] NOT NULL,
	[SeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC,
	[SeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicess]    Script Date: 2/19/2024 11:33:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicess](
	[SeID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](200) NOT NULL,
	[Status] [int] NOT NULL,
	[Icon] [nvarchar](max) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[SeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/19/2024 11:33:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](255) NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Gender] [bit] NULL,
	[DOB] [date] NULL,
	[Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BedS] ON 
GO
INSERT [dbo].[BedS] ([BID], [BedName]) VALUES (1, N'Single Bed')
GO
INSERT [dbo].[BedS] ([BID], [BedName]) VALUES (2, N'Kings Bed')
GO
INSERT [dbo].[BedS] ([BID], [BedName]) VALUES (3, N'Queens Bed')
GO
INSERT [dbo].[BedS] ([BID], [BedName]) VALUES (4, N'Double Bed')
GO
SET IDENTITY_INSERT [dbo].[BedS] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
INSERT [dbo].[Feedback] ([id], [userid], [roomid], [rating], [content], [createdDate]) VALUES (18, 9, 2, 4, N'123', CAST(N'2024-02-09' AS Date))
GO
INSERT [dbo].[Feedback] ([id], [userid], [roomid], [rating], [content], [createdDate]) VALUES (19, 9, 2, 4, N'123', CAST(N'2024-02-09' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[INVOICES] ON 
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (3, 1, 2, CAST(N'2024-01-20' AS Date), CAST(N'2024-01-22' AS Date), 1, 2, 1, N'Booking for user 101', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (4, 2, 3, CAST(N'2024-01-21' AS Date), CAST(N'2024-01-24' AS Date), 1, 1, 2, N'Booking for user 102', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (5, 3, 4, CAST(N'2024-01-22' AS Date), CAST(N'2024-01-23' AS Date), 1, 3, 1, N'Booking for user 103', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (6, 1, 2, CAST(N'2024-01-20' AS Date), CAST(N'2024-01-20' AS Date), 1, 2, 1, N'Booking for user 101', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (7, 2, 3, CAST(N'2024-01-21' AS Date), CAST(N'2024-01-19' AS Date), 1, 1, 2, N'Booking for user 102', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (8, 3, 4, CAST(N'2024-01-22' AS Date), CAST(N'2024-01-18' AS Date), 1, 3, 1, N'Booking for user 103', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (9, 1, 2, CAST(N'2024-01-20' AS Date), CAST(N'2024-01-20' AS Date), 1, 2, 1, N'Booking for user 101', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (10, 2, 3, CAST(N'2024-01-21' AS Date), CAST(N'2024-01-19' AS Date), 1, 1, 2, N'Booking for user 102', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (11, 3, 4, CAST(N'2024-01-22' AS Date), CAST(N'2024-01-18' AS Date), 1, 3, 1, N'Booking for user 103', NULL, NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (12, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'123', N'33520135', NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (13, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'0870', N'19623078', NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (14, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'-090--0', N'53228723', NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (15, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'-090--0', N'58007168', NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (16, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'098', N'55843229', NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (17, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'098098', N'12826230', NULL)
GO
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (18, 9, 11, CAST(N'2024-02-19' AS Date), CAST(N'2024-02-20' AS Date), 1, 1, 1, N'', N'65820634', 1)
GO
SET IDENTITY_INSERT [dbo].[INVOICES] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (2, 30, 3, N'img/room/room-1.jpg', 1, 1, N'Double Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (3, 30, 2, N'img/room/room-2.jpg', 1, 1, N'Premium King Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (4, 30, 2, N'img/room/room-3.jpg', 1, 2, N'Deluxe Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (5, 30, 2, N'img/room/room-4.jpg', 1, 4, N'Queen Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (6, 30, 2, N'img/room/room-5.jpg', 1, 3, N'Veirga Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (7, 30, 2, N'img/room/room-6.jpg', 1, 2, N'Yasua Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (8, 30, 2, N'img/room/room-2.jpg', 1, 2, N'Karthus Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (9, 40, 3, N'img/room/room-b1.jpg', 1, 1, N'Bard Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (10, 40, 2, N'img/room/room-2.jpg', 1, 1, N'HeartSteal Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (11, 50, 2, N'img/room/room-3.jpg', 1, 2, N'Pentakill Room', 199, NULL, 50)
GO
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (12, 0, 1, N'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/a/a2/Yondu_Profile%281%29.png/revision/latest?cb=20231114031143', 1, 1, N'Galazy Room', 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (2, 1)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (2, 2)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (3, 3)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (3, 4)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (4, 5)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (4, 6)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (5, 1)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (5, 3)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (6, 2)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (6, 5)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (7, 4)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (7, 6)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (8, 1)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (8, 4)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (9, 2)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (9, 6)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (10, 3)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (10, 5)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (11, 1)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (11, 6)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (12, 3)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (12, 5)
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (12, 6)
GO
SET IDENTITY_INSERT [dbo].[Servicess] ON 
GO
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (1, N'Travel Plan', 1, N'flaticon-036-parking', N'Let us handle the details of your journey with our Travel Plan service. From flights to accommodations, we create personalized itineraries for a stress-free travel experience.')
GO
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (2, N'Catering Service', 1, N'flaticon-033-dinner', N'Elevate your events with our Catering Service. Our chefs craft exquisite menus for any occasion, using the finest ingredients to leave a lasting impression on your guests.')
GO
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (3, N'Babysitting', 1, N'flaticon-026-bed', N'Enjoy worry-free time away with our Babysitting service. Our reliable caregivers create a safe and entertaining environment for your little ones.')
GO
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (4, N'Laundry', 1, N'flaticon-024-towel', N'Simplify your life with our Laundry service. We take care of your garments, delivering fresh and neatly folded clothes to your doorstep.')
GO
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (5, N'Hire Driver', 1, N'flaticon-044-clock-1', N'Ensure a comfortable journey with our Hire Driver service. Our professional drivers provide reliable and punctual transportation for a stress-free travel experience.')
GO
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (6, N'Bar & Drink', 1, N'flaticon-012-cocktail', N'Add sophistication to your events with our Bar & Drink service. From signature cocktails to classics, our premium beverages and skilled bartenders create a memorable experience for you and your guests.')
GO
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (7, N'4LUA', 1, N'', N'ga`
')
GO
SET IDENTITY_INSERT [dbo].[Servicess] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (1, N'password123', N'User One', N'user1@example.com', N'123-456-7890', NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (2, N'password456', N'Receptionist One', N'receptionist1@example.com', N'987-654-3210', NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (3, N'password789', N'Manager One', N'manager1@example.com', N'111-222-3333', NULL, NULL, NULL)
GO
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (4, N'adminpassword', N'Admin One', N'admin@example.com', N'555-666-7777', 1, CAST(N'9999-09-09' AS Date), 0)
GO
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (9, N'e10adc3949ba59abbe56e057f20f883e', N'Nguyễn Viết Hoài Nam', N'namnvhhe170668@fpt.edu.vn', N'0376626402', 1, CAST(N'2003-03-03' AS Date), 1)
GO
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (10, N'1', N'1', N'1@1', N'1', 1, CAST(N'1111-11-11' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534712A9688]    Script Date: 2/19/2024 11:33:57 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[INVOICES] ADD  CONSTRAINT [df_typePayment]  DEFAULT ((1)) FOR [TypePayment]
GO
ALTER TABLE [dbo].[Message] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Servicess] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([roomid])
REFERENCES [dbo].[Rooms] ([RID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[INVOICES]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RID])
GO
ALTER TABLE [dbo].[INVOICES]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([BID])
REFERENCES [dbo].[BedS] ([BID])
GO
ALTER TABLE [dbo].[RoomServices]  WITH CHECK ADD FOREIGN KEY([SeID])
REFERENCES [dbo].[Servicess] ([SeID])
GO
ALTER TABLE [dbo].[RoomServices]  WITH CHECK ADD FOREIGN KEY([RID])
REFERENCES [dbo].[Rooms] ([RID])
GO
USE [master]
GO
ALTER DATABASE [SWP_Hotel_Booking] SET  READ_WRITE 
GO
