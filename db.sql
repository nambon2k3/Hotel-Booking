USE [SWP_Hotel_Booking]
GO
/****** Object:  Table [dbo].[BedS]    Script Date: 2/27/2024 4:41:07 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 2/27/2024 4:41:07 PM ******/
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
/****** Object:  Table [dbo].[INVOICES]    Script Date: 2/27/2024 4:41:07 PM ******/
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
/****** Object:  Table [dbo].[Rooms]    Script Date: 2/27/2024 4:41:07 PM ******/
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
/****** Object:  Table [dbo].[RoomServices]    Script Date: 2/27/2024 4:41:07 PM ******/
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
/****** Object:  Table [dbo].[Servicess]    Script Date: 2/27/2024 4:41:07 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2/27/2024 4:41:07 PM ******/
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

INSERT [dbo].[BedS] ([BID], [BedName]) VALUES (1, N'Single Bed')
INSERT [dbo].[BedS] ([BID], [BedName]) VALUES (2, N'Kings Bed')
INSERT [dbo].[BedS] ([BID], [BedName]) VALUES (3, N'Queens Bed')
INSERT [dbo].[BedS] ([BID], [BedName]) VALUES (4, N'Double Bed')
SET IDENTITY_INSERT [dbo].[BedS] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([id], [userid], [roomid], [rating], [content], [createdDate]) VALUES (18, 9, 2, 4, N'13981273981273912', CAST(N'2024-02-22' AS Date))
INSERT [dbo].[Feedback] ([id], [userid], [roomid], [rating], [content], [createdDate]) VALUES (19, 9, 2, 4, N'13981273981273912', CAST(N'2024-02-22' AS Date))
INSERT [dbo].[Feedback] ([id], [userid], [roomid], [rating], [content], [createdDate]) VALUES (20, 9, 4, 1, N'1209380129312', CAST(N'2024-02-22' AS Date))
INSERT [dbo].[Feedback] ([id], [userid], [roomid], [rating], [content], [createdDate]) VALUES (21, 9, 5, 4, N'give feedback', CAST(N'2024-02-22' AS Date))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[INVOICES] ON 

INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (3, 1, 2, CAST(N'2024-01-20' AS Date), CAST(N'2024-01-22' AS Date), 1, 2, 1, N'Booking for user 101', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (4, 2, 3, CAST(N'2024-01-21' AS Date), CAST(N'2024-01-24' AS Date), 1, 1, 2, N'Booking for user 102', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (5, 3, 4, CAST(N'2024-01-22' AS Date), CAST(N'2024-01-23' AS Date), 1, 3, 1, N'Booking for user 103', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (6, 1, 2, CAST(N'2024-01-20' AS Date), CAST(N'2024-01-20' AS Date), 1, 2, 1, N'Booking for user 101', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (7, 2, 3, CAST(N'2024-01-21' AS Date), CAST(N'2024-01-19' AS Date), 1, 1, 2, N'Booking for user 102', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (8, 3, 4, CAST(N'2024-01-22' AS Date), CAST(N'2024-01-18' AS Date), 1, 3, 1, N'Booking for user 103', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (9, 1, 2, CAST(N'2024-01-20' AS Date), CAST(N'2024-01-20' AS Date), 1, 2, 1, N'Booking for user 101', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (10, 2, 3, CAST(N'2024-01-21' AS Date), CAST(N'2024-01-19' AS Date), 1, 1, 2, N'Booking for user 102', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (11, 3, 4, CAST(N'2024-01-22' AS Date), CAST(N'2024-01-18' AS Date), 1, 3, 1, N'Booking for user 103', NULL, NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (12, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'123', N'33520135', NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (13, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'0870', N'19623078', NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (14, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'-090--0', N'53228723', NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (15, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'-090--0', N'58007168', NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (16, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'098', N'55843229', NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (17, 9, 2, CAST(N'2024-01-24' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 8, N'098098', N'12826230', NULL)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (18, 9, 4, CAST(N'2024-02-15' AS Date), CAST(N'2024-01-31' AS Date), 0, 1, 1, N'123123', N'20775101', 1)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (19, 9, 5, CAST(N'2024-02-29' AS Date), CAST(N'2024-01-24' AS Date), 0, 1, 10, N'231423423', N'12838059', 1)
INSERT [dbo].[INVOICES] ([InID], [UserID], [RoomID], [CheckInDate], [CheckOutDate], [ReservationStatus], [NumberPerson], [NumberRooms], [Note], [transactionCode], [TypePayment]) VALUES (20, 9, 3, CAST(N'2024-02-23' AS Date), CAST(N'2024-01-24' AS Date), 1, 1, 1, N'asldjhaslkdjlkasd', N'90896054', 1)
SET IDENTITY_INSERT [dbo].[INVOICES] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (2, 30, 3, N'img/room/room-1.jpg', 1, 1, N'Double Room', 1000000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (3, 30, 2, N'img/room/room-2.jpg', 1, 1, N'Premium King Room', 800000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (4, 30, 2, N'img/room/room-3.jpg', 1, 2, N'Deluxe Room', 1000000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (5, 30, 2, N'img/room/room-4.jpg', 1, 4, N'Queen Room', 800000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (6, 30, 2, N'img/room/room-5.jpg', 1, 3, N'Veirga Room', 1000000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (7, 30, 2, N'img/room/room-6.jpg', 1, 2, N'Yasua Room', 800000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (8, 30, 2, N'img/room/room-2.jpg', 1, 2, N'Karthus Room', 1000000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (9, 40, 3, N'img/room/room-b1.jpg', 1, 1, N'Bard Room', 800000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (10, 40, 2, N'img/room/room-2.jpg', 1, 1, N'HeartSteal Room', 1000000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details], [TotalRoom]) VALUES (11, 40, 2, N'img/room/room-3.jpg', 1, 2, N'Pentakill Room', 800000, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.', 50)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (2, 1)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (2, 2)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (3, 3)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (3, 4)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (4, 5)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (4, 6)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (5, 1)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (5, 3)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (6, 2)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (6, 5)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (7, 4)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (7, 6)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (8, 1)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (8, 4)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (9, 2)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (9, 6)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (10, 3)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (10, 5)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (11, 1)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (11, 6)
GO
SET IDENTITY_INSERT [dbo].[Servicess] ON 

INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (1, N'Travel Plan', 1, N'flaticon-036-parking', N'Let us handle the details of your journey with our Travel Plan service. From flights to accommodations, we create personalized itineraries for a stress-free travel experience.')
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (2, N'Catering Service', 1, N'flaticon-033-dinner', N'Elevate your events with our Catering Service. Our chefs craft exquisite menus for any occasion, using the finest ingredients to leave a lasting impression on your guests.')
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (3, N'Babysitting', 1, N'flaticon-026-bed', N'Enjoy worry-free time away with our Babysitting service. Our reliable caregivers create a safe and entertaining environment for your little ones.')
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (4, N'Laundry', 1, N'flaticon-024-towel', N'Simplify your life with our Laundry service. We take care of your garments, delivering fresh and neatly folded clothes to your doorstep.')
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (5, N'Hire Driver', 1, N'flaticon-044-clock-1', N'Ensure a comfortable journey with our Hire Driver service. Our professional drivers provide reliable and punctual transportation for a stress-free travel experience.')
INSERT [dbo].[Servicess] ([SeID], [ServiceName], [Status], [Icon], [Description]) VALUES (6, N'Bar & Drink', 1, N'flaticon-012-cocktail', N'Add sophistication to your events with our Bar & Drink service. From signature cocktails to classics, our premium beverages and skilled bartenders create a memorable experience for you and your guests.')
SET IDENTITY_INSERT [dbo].[Servicess] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (1, N'202cb962ac59075b964b07152d234b70', N'User One', N'user@hotel.com', N'123-456-7890', NULL, NULL, 0)
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (2, N'202cb962ac59075b964b07152d234b70', N'Receptionist One', N'receptionist1@example.com', N'987-654-3210', NULL, NULL, 2)
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (3, N'202cb962ac59075b964b07152d234b70', N'Manager One', N'manager@example.com', N'111-222-3333', NULL, NULL, 1)
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (4, N'202cb962ac59075b964b07152d234b70', N'Admin One', N'admin@example.com', N'555-666-7777', NULL, NULL, 1)
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (9, N'202cb962ac59075b964b07152d234b70', N'Nguyễn Viết Hoài Nam', N'namnvhhe170668@fpt.edu.vn', N'0376626402', 1, CAST(N'2003-08-24' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053429C1C0E9]    Script Date: 2/27/2024 4:41:07 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[INVOICES] ADD  CONSTRAINT [df_typePayment]  DEFAULT ((1)) FOR [TypePayment]
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
