USE [master]
GO
/****** Object:  Database [SWP_Hotel_Booking]    Script Date: 1/18/2024 4:05:08 PM ******/
CREATE DATABASE [SWP_Hotel_Booking]
GO
ALTER DATABASE [SWP_Hotel_Booking] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [SWP_Hotel_Booking] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [SWP_Hotel_Booking] SET RECOVERY FULL 
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
EXEC sys.sp_db_vardecimal_storage_format N'SWP_Hotel_Booking', N'ON'
GO
ALTER DATABASE [SWP_Hotel_Booking] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP_Hotel_Booking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP_Hotel_Booking]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 1/18/2024 4:05:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] NOT NULL,
	[ReservationID] [int] NULL,
	[IssueDate] [date] NULL,
	[DueDate] [date] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[PaymentStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 1/18/2024 4:05:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] NOT NULL,
	[UserID] [int] NULL,
	[RoomID] [int] NULL,
	[CheckInDate] [date] NULL,
	[CheckOutDate] [date] NULL,
	[ReservationStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 1/18/2024 4:05:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] NOT NULL,
	[RoomNumber] [varchar](20) NULL,
	[RoomStatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomServices]    Script Date: 1/18/2024 4:05:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomServices](
	[RoomServiceID] [int] NOT NULL,
	[ReservationID] [int] NULL,
	[ServiceID] [int] NULL,
	[Quantity] [int] NULL,
	[TotalCost] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 1/18/2024 4:05:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] NOT NULL,
	[ServiceName] [varchar](100) NULL,
	[ServiceDescription] [varchar](255) NULL,
	[ServiceRate] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/18/2024 4:05:08 PM ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534682F627F]    Script Date: 1/18/2024 4:05:08 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[RoomServices]  WITH CHECK ADD FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[RoomServices]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
USE [master]
GO
ALTER DATABASE [SWP_Hotel_Booking] SET  READ_WRITE 
GO
