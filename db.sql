USE [SWP_Hotel_Booking]
GO
/****** Object:  Table [dbo].[BedS]    Script Date: 1/20/2024 4:28:38 PM ******/
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
/****** Object:  Table [dbo].[INVOICES]    Script Date: 1/20/2024 4:28:38 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[InID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 1/20/2024 4:28:38 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomServices]    Script Date: 1/20/2024 4:28:38 PM ******/
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
/****** Object:  Table [dbo].[Servicess]    Script Date: 1/20/2024 4:28:38 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1/20/2024 4:28:38 PM ******/
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
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (2, 30, 3, N'img/room/room-1.jpg', 1, 1, N'Double Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (3, 30, 2, N'img/room/room-2.jpg', 1, 1, N'Premium King Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (4, 30, 2, N'img/room/room-3.jpg', 1, 2, N'Deluxe Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (5, 30, 2, N'img/room/room-4.jpg', 1, 4, N'Queen Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (6, 30, 2, N'img/room/room-5.jpg', 1, 3, N'Veirga Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (7, 30, 2, N'img/room/room-6.jpg', 1, 2, N'Yasua Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (8, 30, 2, N'img/room/room-2.jpg', 1, 2, N'Karthus Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (9, 40, 3, N'img/room/room-b1.jpg', 1, 1, N'Bard Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (10, 40, 2, N'img/room/room-2.jpg', 1, 1, N'HeartSteal Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
INSERT [dbo].[Rooms] ([RID], [Size], [Capacity], [Img], [Status], [BID], [RoomName], [Price], [Details]) VALUES (11, 40, 2, N'img/room/room-3.jpg', 1, 2, N'Pentakill Room', 199, N'Motorhome or Trailer that is the question for you. Here are some of the advantages and disadvantages of both, so you will be confident when purchasing an RV. When comparing Rvs, a motorhome or a travel trailer, should you buy a motorhome or fifth wheeler? The advantages and disadvantages of both are studied so that you can make your choice wisely when purchasing an RV. Possessing a motorhome or fifth wheel is an achievement of a lifetime. It can be similar to sojourning with your residence as you search the various sites of our great land, America.<br>
The two commonly known recreational vehicle classes are the motorized and towable. Towable rvs are the travel trailers and the fifth wheel. The rv travel trailer or fifth wheel has the attraction of getting towed by a pickup or a car, thus giving the adaptability of possessing transportation for you when you are parked at your campsite.')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (2, 4)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (2, 5)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (3, 1)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (3, 2)
INSERT [dbo].[RoomServices] ([RID], [SeID]) VALUES (3, 3)
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

INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (1, N'password123', N'User One', N'user1@example.com', N'123-456-7890', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (2, N'password456', N'Receptionist One', N'receptionist1@example.com', N'987-654-3210', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (3, N'password789', N'Manager One', N'manager1@example.com', N'111-222-3333', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (4, N'adminpassword', N'Admin One', N'admin@example.com', N'555-666-7777', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Password], [FullName], [Email], [Phone], [Gender], [DOB], [Role]) VALUES (9, N'202cb962ac59075b964b07152d234b70', N'Nguyễn Viết Hoài Nam', N'namnvhhe170668@fpt.edu.vn', N'0376626402', 1, CAST(N'2003-03-03' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053429C1C0E9]    Script Date: 1/20/2024 4:28:38 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Servicess] ADD  DEFAULT ((0)) FOR [Status]
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
