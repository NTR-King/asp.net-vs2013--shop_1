USE [master]
GO
/****** Object:  Database [coe125]    Script Date: 11/28/2018 7:41:43 PM ******/
CREATE DATABASE [coe125]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'coe125', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER1\MSSQL\DATA\coe125.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'coe125_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER1\MSSQL\DATA\coe125_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [coe125] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [coe125].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [coe125] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [coe125] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [coe125] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [coe125] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [coe125] SET ARITHABORT OFF 
GO
ALTER DATABASE [coe125] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [coe125] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [coe125] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [coe125] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [coe125] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [coe125] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [coe125] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [coe125] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [coe125] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [coe125] SET  DISABLE_BROKER 
GO
ALTER DATABASE [coe125] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [coe125] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [coe125] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [coe125] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [coe125] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [coe125] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [coe125] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [coe125] SET RECOVERY FULL 
GO
ALTER DATABASE [coe125] SET  MULTI_USER 
GO
ALTER DATABASE [coe125] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [coe125] SET DB_CHAINING OFF 
GO
ALTER DATABASE [coe125] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [coe125] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [coe125] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'coe125', N'ON'
GO
ALTER DATABASE [coe125] SET QUERY_STORE = OFF
GO
USE [coe125]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [coe125]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[uname] [varchar](50) NULL,
	[pid] [int] NULL,
	[cid] [int] IDENTITY(10000,1) NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[pid] [int] NULL,
	[rating] [varchar](50) NULL,
	[comment] [text] NULL,
	[uname] [varchar](50) NULL,
	[date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contact]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[id] [int] IDENTITY(10000,1) NOT NULL,
	[date] [datetime] NULL,
	[comment] [text] NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[login]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[vchUname] [varchar](40) NOT NULL,
	[vchPass] [varchar](40) NULL,
	[vchEmail] [varchar](255) NULL,
	[intPhone] [varchar](50) NULL,
	[intCartSize] [int] NULL,
	[boolType] [int] NULL,
 CONSTRAINT [PK_login] PRIMARY KEY CLUSTERED 
(
	[vchUname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[PID] [int] IDENTITY(10000,1) NOT NULL,
	[PName] [varchar](50) NULL,
	[PCateg] [varchar](50) NULL,
	[PQuantity] [varchar](50) NULL,
	[PDescription] [text] NULL,
	[PFeat] [int] NULL,
	[PPrice] [decimal](18, 2) NULL,
	[PImgPath] [text] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([uname], [pid], [cid]) VALUES (N'Test', 10003, 10026)
INSERT [dbo].[cart] ([uname], [pid], [cid]) VALUES (N'ADMIN', 10003, 10028)
SET IDENTITY_INSERT [dbo].[cart] OFF
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (1, N'4', N'aasd', N'asd', CAST(N'2017-02-12T11:38:04.970' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'3', N'Hello its me', N'seolhyun6969', CAST(N'2017-02-12T12:00:45.180' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'3', N'test', N'seolhyun6969', CAST(N'2017-02-12T12:01:58.133' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'4', N'asd', N'seolhyun6969', CAST(N'2017-02-12T12:03:57.077' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'3', N'aneeyong', N'admin', CAST(N'2017-03-14T22:38:21.920' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'3', N'test', N'admin', CAST(N'2017-03-14T22:39:02.633' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'3', N'hello', N'admin', CAST(N'2017-03-14T22:39:55.680' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'4', N'test', N'admin', CAST(N'2017-03-14T22:40:20.683' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10003, N'2', N'asd', N'admin', CAST(N'2017-03-14T22:41:57.107' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'3', N'asd', N'seolhyun6969', CAST(N'2017-02-12T12:04:59.190' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'5', N'hello', N'seolhyun6969', CAST(N'2017-02-12T12:06:19.077' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10005, N'4', N'cool!', N'seolhyun6969', CAST(N'2017-02-12T12:07:22.453' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10004, N'5', N'debug', N'seolhyun6969', CAST(N'2017-02-12T12:08:53.910' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10004, N'3', N'test', N'seolhyun6969', CAST(N'2017-02-12T12:09:47.030' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10003, N'2', N'ez', N'seolhyun6969', CAST(N'2017-02-12T12:10:59.720' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10004, N'3', N'boombayah', N'seolhyun6969', CAST(N'2017-02-12T12:11:43.013' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'4', N'hi im seulgi', N'seolhyun6969', CAST(N'2017-02-12T12:19:49.973' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'4', N'HELLO WORLD', N'test', CAST(N'2017-02-12T13:19:27.960' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'0', N'asd', N'test', CAST(N'2017-02-12T13:19:34.830' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'0', N'test', N'test', CAST(N'2017-02-12T13:22:46.993' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10004, N'4', N'test', N'test', CAST(N'2017-02-12T13:26:31.777' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10004, N'2', N'wassup bitches
yo', N'test', CAST(N'2017-02-12T13:33:05.913' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10002, N'3', N'fapfapfap', N'hyosungfapfap', CAST(N'2017-02-12T15:09:35.617' AS DateTime))
INSERT [dbo].[comments] ([pid], [rating], [comment], [uname], [date]) VALUES (10003, N'4', N'test', N'Test', CAST(N'2017-03-14T23:34:11.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([name], [email], [id], [date], [comment]) VALUES (N'john', N'johnny', 10000, CAST(N'2017-02-14T20:42:53.610' AS DateTime), N'jon')
INSERT [dbo].[contact] ([name], [email], [id], [date], [comment]) VALUES (N'wasak', N'ang', 10001, CAST(N'2017-02-14T20:44:00.893' AS DateTime), N'edsa')
INSERT [dbo].[contact] ([name], [email], [id], [date], [comment]) VALUES (N'a', N's', 10002, CAST(N'2017-02-14T20:48:09.783' AS DateTime), N'd')
INSERT [dbo].[contact] ([name], [email], [id], [date], [comment]) VALUES (N'a', N'a', 10003, CAST(N'2017-02-14T20:49:02.150' AS DateTime), N'a')
INSERT [dbo].[contact] ([name], [email], [id], [date], [comment]) VALUES (N'a', N'a', 10004, CAST(N'2017-02-14T20:49:52.537' AS DateTime), N'd')
INSERT [dbo].[contact] ([name], [email], [id], [date], [comment]) VALUES (N'just', N'some', 10005, CAST(N'2017-02-14T20:51:06.223' AS DateTime), N'comment')
INSERT [dbo].[contact] ([name], [email], [id], [date], [comment]) VALUES (N'test', N'fap', 10006, CAST(N'2017-02-14T20:52:18.773' AS DateTime), N'fapfap')
INSERT [dbo].[contact] ([name], [email], [id], [date], [comment]) VALUES (N'heoew', N'pouhz', 10007, CAST(N'2017-02-14T20:55:09.713' AS DateTime), N'worlzsd')
SET IDENTITY_INSERT [dbo].[contact] OFF
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'', N'', N'', N'', NULL, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'123', N'asddd', N'asd', N'123', 0, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'admin', N'asd123', N'admin', N'99999999', 0, 1)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'ang', N'wasak', N'esda', N'2301', 0, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'asd', N'asd1', N'asd', N'123', 0, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'asdasd', N'asd', N'asd@asd.com', N'12352', 0, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'hyosungfapfap', N'asd123', N'asdd@gmail.com', N'2195082', 0, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'imhandsome', N'asd123', N'emmanuel.logatoc@gmail.com', N'123098213', NULL, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'johnn', N'asd123', N'wasak@ang.edsa', N'2013', NULL, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'johnny', N'asd123', N'john@wasak', N'120939042091', NULL, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'johnny123', N'asd123', N'eqwe', N'1235231', NULL, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'seolhyun6969', N'fapfapfap', N'fapfap@gmail.com', N'912854231', 0, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'seqwr', N'asd', N'asd', N'2712363', 0, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'test', N'test', N'test', N'2135', 0, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'testing', N'asd123', N'emmanuel.logatoc@gmail.com', N'09158832893', NULL, 0)
INSERT [dbo].[login] ([vchUname], [vchPass], [vchEmail], [intPhone], [intCartSize], [boolType]) VALUES (N'xd', N'xd', N'xd@gmail.com', N'52325', 0, 0)
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([PID], [PName], [PCateg], [PQuantity], [PDescription], [PFeat], [PPrice], [PImgPath]) VALUES (10002, N'ASUS ROG GR8-R013R', N'Desktop', N'19', N'Intel Core i7- 4510U<br /><br /><br />
Chipset: Integrated<br /><br /><br />
RAM: 8GB DDDR3<br /><br /><br />
HDD: 1TB<br /><br /><br />
NVIDIA GEFORCE GTX750TI 2GB<br /><br /><br />
LAN: 10/100/1000/Gigabits Mbps<br /><br /><br />
Bluetooth v4.0 <br /><br /><br />
Wi-Fi B/G/N/AC <br /><br /><br />
Card Reader <br /><br /><br />
2-USB 3.0, 4-USB 2.0 Ports<br /><br /><br />
Gaming Mechanical Keyboard<br /><br /><br />
ROG Gladius Mouse<br /><br /><br />
Microsoft Wndows 8<br /><br /><br />
<br /><br />
', 0, CAST(2000.00 AS Decimal(18, 2)), N'assets/img/asus_rog_gr8-300x300.jpg')
INSERT [dbo].[products] ([PID], [PName], [PCateg], [PQuantity], [PDescription], [PFeat], [PPrice], [PImgPath]) VALUES (10003, N'Acer S5-371-767Q', N'Laptop', N'19', N'Intel Core i7-6500U<br />
(2.5 GHz up to 3.1 GHz / 6MB Cache)<br />
Intel Chipset<br />
Intel HD Graphics 520<br />
Acer Wireless 802.11 a/b/g/n/ac<br />
Windows 10 Home<br />
13.3in IPS FHD LED Display (1920 x 1080)<br />
4GB DDR3L (ON BOARD)<br />
512GB SATA<br />
No ODD<br />
Acer Crystal Eye Camera<br />
Bluetooth 4.0<br />
USB, Card Reader, HDMI, No VGA<br />
3-Cell Battery (Built-In) / 100/1000 LAN<br />
Acer Laptop Bag / 1.42Kg<br />
1 Year Carry In<br />
Colors:<br />
S5-371-767Q &ndash; Obsidian Black<br />
S5-371-74H1 &ndash; Pearl White<br />
<br />
', 1, CAST(30000.00 AS Decimal(18, 2)), N'assets/img/Acer-S5-371-767Q-300x300.png')
INSERT [dbo].[products] ([PID], [PName], [PCateg], [PQuantity], [PDescription], [PFeat], [PPrice], [PImgPath]) VALUES (10004, N'Asus Nexus 7 K008-1A053A White', N'Phone', N'19', N'NEXUS 7 WIFI K008-1A053A BLACK<br /><br />
QUALCOMM SNAPDRAGON S4 PRO 8064 1.5GHZ L2<br /><br />
2MB,QUAD CORE<br /><br />
ANDRIOD 4.3 JELLY BEAN<br /><br />
2GB<br /><br />
32GB<br /><br />
7&Prime; IPS PANEL<br /><br />
<br /><br />
', 1, CAST(15000.00 AS Decimal(18, 2)), N'assets/img/Asus-Nexus-7K008-300x300.png')
INSERT [dbo].[products] ([PID], [PName], [PCateg], [PQuantity], [PDescription], [PFeat], [PPrice], [PImgPath]) VALUES (10005, N'Kingston HyperX Cloud II ', N'Perip', N'19', N'Advanced USB audio control box with built-in DSP sound card<br />
Hi-Fi capable with 53mm drivers for supreme audio quality<br />
Hardware-driven virtual 7.1 surround sound<br />
Comfortable, 100% memory foam on headband <br />
and leatherette cushions<br />
Pro-Gaming optimized with closed cup design for<br />
passive noise cancellation<br />
Compatible &ndash; USB connectivity for PC &amp; Mac. <br />
Stereo compatible with PS4, Xbox One1 and mobile', 1, CAST(2000.00 AS Decimal(18, 2)), N'assets/img/HyperX-Cloud-II.jpg')
INSERT [dbo].[products] ([PID], [PName], [PCateg], [PQuantity], [PDescription], [PFeat], [PPrice], [PImgPath]) VALUES (10006, N'Intel Z270 Core i7 Configurator', N'desktop', N'13', N'Operating System :: None- Pre-formatted Hard Drive Only<br />
Case :: iBUYPOWER Element Gaming Case (Front & Side Glass Panel) - 3x Red LED Ring Fans<br />
iBUYPOWER Elite Build Package :: None<br />
LED Fan Lighting :: None<br />
Case Lighting :: None<br />
iBUYPOWER Labs - Noise Reduction :: None<br />
iBUYPOWER Labs - Internal Expansion :: None<br />
Processor :: Intel® Core™ i7-7700 Processor (4x 3.60GHz/8MB L3 Cache) - Free Upgrade to Intel i7-7700K Processor<br />
iBUYPOWER PowerDrive :: None<br />
Processor Cooling :: Asetek 550LC 120mm Liquid CPU Cooler - Standard 120mm Fan<br />
Memory :: 8 GB [4 GB x2] DDR4-2400 Memory Module - Corsair or Major Brand **Free Upgrade to DDR4-3000 ADATA XPG**<br />
Video Card :: NVIDIA GeForce GTX 1060 - 3GB (VR-Ready)<br />
SLI Bridge :: None<br />
Motherboard :: MSI Z270 PC Mate -- 3x PCIe x16, 1x USB 3.1 Gen2 Type-C, 6x USB 3.1 Gen1[Intel Optane Ready] - Free Upgrade to MSI Z270 Tomahawk ARCTIC<br />
Power Supply :: 400 Watt - Standard 80 PLUS Bronze - Free Upgrade to 800W Standard 80 PLUS Bronze<br />
Advance Cabling Options :: Standard Default Cables<br />
M.2/PCI-E SSD Card :: None<br />
Primary Hard Drive :: 1 TB Hard Drive -- 32MB Cache, 7200RPM, 6.0Gb/s - includes [FREE] 120GB ADATA SP550 SSD<br />
Data Hard Drive :: None<br />
Optical Drive :: None<br />
2nd Optical Drive :: None<br />
Media Card Reader / Writer :: None<br />
Meter Display :: None<br />
Sound Card :: 3D Premium Surround Sound Onboard<br />
Network Card :: Onboard LAN Network (Gb or 10/100)<br />
USB Expansion Card :: None', 0, CAST(40000.00 AS Decimal(18, 2)), N'assets/img/400-slate-1-new1.png')
INSERT [dbo].[products] ([PID], [PName], [PCateg], [PQuantity], [PDescription], [PFeat], [PPrice], [PImgPath]) VALUES (10008, N'Corsair Gaming K70 RGB Mechanical Gaming', N'perip', N'231', N'Key Switches Cherry® MX Blue/ Brown /Red Mechanical<br /><br />
Keyboard Backlighting RGB LED<br /><br />
Dimensions 438mm x 163mm x 24mm<br /><br />
Macro Keys All Keys<br /><br />
Report Rate Selectable 8ms, 4ms, 2ms, 1ms and BIOS mode<br /><br />
Matrix 100% anti-ghosting and 104 Key Rollover<br /><br />
Weight 2.73lbs<br /><br />
Keyboard Size Standard<br /><br />
On-board Memory Yes<br /><br />
Media Keys Six dedicated multimedia keys<br /><br />
Wrist Rest Full length detachable with soft touch finish<br /><br />
CUE Software Enabled<br /><br />
Cable Type Braided Fiber<br /><br />
WIN Lock Yes', 0, CAST(7250.00 AS Decimal(18, 2)), N'assets/img/Corsair-Gaming-K70-RGB.png')
SET IDENTITY_INSERT [dbo].[products] OFF
ALTER TABLE [dbo].[comments] ADD  CONSTRAINT [DF_comments_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[contact] ADD  CONSTRAINT [DF_contact_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[contact] ADD  CONSTRAINT [DF_contact_comment]  DEFAULT ('getdateandtime()') FOR [comment]
GO
ALTER TABLE [dbo].[login] ADD  CONSTRAINT [DF_login_boolType]  DEFAULT ((0)) FOR [boolType]
GO
/****** Object:  StoredProcedure [dbo].[addCart]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addCart]
		(@uname varchar(50),
		@pid int,
		@ret int output
		)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	if(@@ROWCOUNT = 0)
	begin

		INSERT INTO cart (uname,pid)
		VALUES (@uname,@pid)
			set @ret=1;
	end
	else
		set @ret=0;
END

GO
/****** Object:  StoredProcedure [dbo].[addComment]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addComment]
			(@pid int,
			@rating varchar(50),
			@comment text,
			@uname varchar(50),
			@ret int output)
AS
BEGIN
	SET NOCOUNT ON;
	
	if(@@ROWCOUNT = 0)
	begin

		INSERT INTO comments (pid,rating,comment,uname)
		VALUES (@pid,@rating,@comment,@uname)
			set @ret=1;
	end
	else
		set @ret=0;
END

GO
/****** Object:  StoredProcedure [dbo].[addContact]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addContact]
(@name varchar(50),
@email varchar(50),
@comment text,
@ret int output)
AS
BEGIN
	if(@@ROWCOUNT = 0)
	begin
		INSERT INTO contact (name, email, comment)
		VALUES (@name,@email,@comment)
			set @ret=1;
	end
	else
		set @ret=0;
END

GO
/****** Object:  StoredProcedure [dbo].[addlogin]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addlogin] 
	-- Add the parameters for the stored procedure here
	(@vchUname varchar(40),
	@vchPass varchar(40),
	@vchEmail varchar(50),
	@intPhone varchar(50),
	@ret int output)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	if(@@ROWCOUNT = 0)
	begin

		INSERT INTO login (vchUname,vchPass,vchEmail,intPhone)
		VALUES (@vchUname,@vchPass,@vchEmail,@intPhone)
			set @ret=1;
	end
	else
		set @ret=0;
END

GO
/****** Object:  StoredProcedure [dbo].[checkUser]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[checkUser] 
	(@vchUname varchar(40),
	@vchPass varchar(40),
	@login int output)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	if ((select vchPass from login where vchUname=@vchUname) = @vchPass)
	begin
		set @login = 1;
		select * from login where vchUname=@vchUname;
	end
else
		set @login=0;
END

GO
/****** Object:  StoredProcedure [dbo].[deleteCart]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteCart]
		(@user varchar(40))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE from cart where uname = @user

END

GO
/****** Object:  StoredProcedure [dbo].[deleteItem]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteItem]
		(@cid int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

    -- Insert statements for procedure here
	DELETE from cart where cid = @cid
END

GO
/****** Object:  StoredProcedure [dbo].[deleteProduct]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteProduct]
(@pid int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	delete from products where pid = @pid;
END

GO
/****** Object:  StoredProcedure [dbo].[getCart]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getCart]
		(@user varchar(40))
AS
BEGIN
	select * from cart where uname = @user
END

GO
/****** Object:  StoredProcedure [dbo].[getCartItems]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getCartItems]
(@uname varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		SELECT [pid] FROM [cart] WHERE ([uname] = @uname)
END

GO
/****** Object:  StoredProcedure [dbo].[getComments]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getComments]
(@pid int
)
AS
BEGIN
	SELECT [rating], [comment], [uname], [date] FROM [comments] WHERE ([pid] = @pid) ORDER BY [date] DESC
END

GO
/****** Object:  StoredProcedure [dbo].[getContactMessage]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getContactMessage]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select * from contact ORDER BY [date] DESC

	END

GO
/****** Object:  StoredProcedure [dbo].[getFeatured]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getFeatured]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT PName, PFeat, PCateg, PDescription, PPrice, PID, PImgPath FROM products WHERE (PFeat = 1)
END

GO
/****** Object:  StoredProcedure [dbo].[getFiltered]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getFiltered]
(@PCateg varchar(50))
AS
BEGIN
	select * from products where  PCateg = @PCateg

END

GO
/****** Object:  StoredProcedure [dbo].[getItem]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getItem]
				(@PID int)


AS
BEGIN
				SELECT * FROM products where PID = @PID
END

GO
/****** Object:  StoredProcedure [dbo].[productAdd]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE PROCEDURE [dbo].[productAdd]
(
@PName varchar(50),
@PCateg varchar(50),
@PQuantity varchar(50),
@PDescription text,
@PFeat int,
@PPrice decimal,
@PImgPath text
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into products (PName, PCateg, PQuantity, PDescription, PFeat, PPrice, PImgPath )
	values (@PName, @PCateg,@PQuantity,@PDescription,@PFeat,@PPrice,@PImgPath)
END

GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateProduct]
(
@PID int,
@PName varchar(50),
@PCateg varchar(50),
@PQuantity varchar(50),
@PDescription text,
@PFeat int,
@PPrice decimal,
@PImgPath text
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update products
	set
	PName = @PName,
	PCateg = @PCateg,
	PQuantity = @PQuantity,
	PDescription = @PDescription,
	PFeat = @PFeat,
	PPrice = @PPrice,
	PImgPath = @PImgPath
	where
	pid = @pid;
END

GO
/****** Object:  StoredProcedure [dbo].[viewCatalog]    Script Date: 11/28/2018 7:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[viewCatalog]
AS
BEGIN
	SELECT PID, PName, PPrice, PImgPath, PCateg, PFeat, PQuantity FROM products
END

GO
USE [master]
GO
ALTER DATABASE [coe125] SET  READ_WRITE 
GO
