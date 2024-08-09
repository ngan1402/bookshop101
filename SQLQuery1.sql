USE [master]
GO
/****** Object:  Database [BSDB2]    Script Date: 11/1/2016 11:25:55 PM ******/
CREATE DATABASE [BSDB2]
GO
ALTER DATABASE [BSDB2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BSDB2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BSDB2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BSDB2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BSDB2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BSDB2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BSDB2] SET ARITHABORT OFF 
GO
ALTER DATABASE [BSDB2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BSDB2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BSDB2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BSDB2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BSDB2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BSDB2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BSDB2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BSDB2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BSDB2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BSDB2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BSDB2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BSDB2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BSDB2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BSDB2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BSDB2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BSDB2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BSDB2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BSDB2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BSDB2] SET  MULTI_USER 
GO
ALTER DATABASE [BSDB2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BSDB2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BSDB2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BSDB2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BSDB2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BSDB2]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[IDAdmin] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietDDH]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDDH](
	[MaSach] [int] NOT NULL,
	[MaDDH] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC,
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [smalldatetime] NULL DEFAULT (getdate()),
	[NgayGiao] [smalldatetime] NULL,
	[TinhTrang] [bit] NULL,
	[MaKH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[DienThoai] [varchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaLH] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[DienThoai] [varchar](50) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[NgayCapNhat] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNXB] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[DienThoai] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [int] IDENTITY(1,1) NOT NULL,
	[MaLoai] [int] NOT NULL,
	[MaNXB] [int] NOT NULL,
	[MaTG] [int] NOT NULL,
	[TenSach] [nvarchar](250) NULL,
	[GiaBan] [money] NULL,
	[Mota] [nvarchar](500) NULL,
	[NguoiDich] [nvarchar](50) NULL,
	[AnhBia] [varchar](50) NULL,
	[NgayCapNhat] [smalldatetime] NULL DEFAULT (getdate()),
	[SoLuongTon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTG] [int] IDENTITY(1,1) NOT NULL,
	[TenTG] [nvarchar](50) NULL,
	[QueQuan] [nvarchar](250) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[NgayMat] [smalldatetime] NULL,
	[TieuSu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 11/1/2016 11:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([IDAdmin], [TaiKhoan], [MatKhau], [HoTen], [TrangThai]) VALUES (1, N'admin', N'admin', N'Phong', 1)
INSERT [dbo].[Admin] ([IDAdmin], [TaiKhoan], [MatKhau], [HoTen], [TrangThai]) VALUES (3, N'vhp', N'123456', N'VHP', NULL)
SET IDENTITY_INSERT [dbo].[Admin] OFF
INSERT [dbo].[ChiTietDDH] ([MaSach], [MaDDH], [SoLuong], [DonGia]) VALUES (14, 2, 2, 475000.0000)
INSERT [dbo].[ChiTietDDH] ([MaSach], [MaDDH], [SoLuong], [DonGia]) VALUES (16, 1, 1, 60000.0000)
INSERT [dbo].[ChiTietDDH] ([MaSach], [MaDDH], [SoLuong], [DonGia]) VALUES (16, 2, 3, 60000.0000)
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [NgayGiao], [TinhTrang], [MaKH]) VALUES (1, CAST(N'2016-07-05 13:22:00' AS SmallDateTime), CAST(N'2016-07-08 13:22:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[DonDatHang] ([MaDDH], [NgayDat], [NgayGiao], [TinhTrang], [MaKH]) VALUES (2, CAST(N'2016-07-05 13:24:00' AS SmallDateTime), CAST(N'2016-07-08 13:24:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Email], [DiaChi], [DienThoai], [NgaySinh], [TaiKhoan], [MatKhau], [NgayTao], [TrangThai]) VALUES (1, N'test1', N'test1@gmail.com', N'hcm', N'123456', CAST(N'1995-11-05 00:00:00' AS SmallDateTime), N'test', N'123', CAST(N'2016-07-01 11:14:10.630' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Email], [DiaChi], [DienThoai], [NgaySinh], [TaiKhoan], [MatKhau], [NgayTao], [TrangThai]) VALUES (7, N'admin', N'emty@gmail.com', N'TP.HCM', N'123456789', CAST(N'2016-10-04 00:00:00' AS SmallDateTime), N'admin', N'123456', CAST(N'2016-10-28 22:41:31.740' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [Email], [DiaChi], [DienThoai], [NgaySinh], [TaiKhoan], [MatKhau], [NgayTao], [TrangThai]) VALUES (10, N'P', N'test2@gmail.com', N'TP.HCM', N'123456', CAST(N'2016-06-05 00:00:00' AS SmallDateTime), N'test2', N'123456', CAST(N'2016-10-28 22:49:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([MaLH], [Ho], [Ten], [Email], [DienThoai], [NoiDung], [NgayCapNhat]) VALUES (2, N'a', N'a', N'a@gmail.com', N'123456', N'đây là nội dung thứ 2', CAST(N'2016-07-01 00:00:00' AS SmallDateTime))
INSERT [dbo].[LienHe] ([MaLH], [Ho], [Ten], [Email], [DienThoai], [NoiDung], [NgayCapNhat]) VALUES (3, N'b', N'b', N'test@gmail.com', N'1', N'nội dung 3', CAST(N'2016-07-01 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[LienHe] OFF
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (1, N'Nxb Lao động', N'175 Giảng Võ, Q. Đống Đa, Hà Nội', N'04.38515380')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (2, N'Nxb Thế giới', NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (3, N'Nxb Tri thức', NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (4, N'NXB Phụ Nữ', N'16 Alexandre de Rhodes, Bến Nghé, Quận 1, Hồ Chí Minh', N'08 3829 4459')
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (5, N'Nxb Phương Đông', NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (6, N'Nxb Trẻ', NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (7, N'ArtBook', NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (8, N'CDIMex', NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (9, N'Nxb Hội Nhà Văn', NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (10, N'Nxb Khoa học xã hội', NULL, NULL)
INSERT [dbo].[NhaXuatBan] ([MaNXB], [TenNXB], [DiaChi], [DienThoai]) VALUES (11, N' NXB Chính Trị Quốc Gia', NULL, NULL)
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (1, 1, 7, 12, N'Me Before You', 250000.0000, N'THE NEW YORK TIMES NUMBER 1 BESTSELLING NOVEL THAT IS LOVED AROUND THE WORLD, SOON TO BE RELEASED AS A FILM STARRING EMILIA CLARKE AND SAM CLAFLINLou Clark knows lots of things. She knows how many footsteps there are between the bus stop and home. ', NULL, N'me-before-you.jpg', CAST(N'2016-06-21 00:00:00' AS SmallDateTime), 10)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (8, 3, 2, 2, N'Combo Cứ Bình Tĩnh + Sẽ Có Cách, Đừng Lo', 113000.0000, N' Cứ Bình Tĩnh!Tuần hoàn cuộc sống, có yêu thì sẽ có ghét. Sẽ là bất khả thi nếu khuyên con người đừng ghét bỏ ai. Tôi cũng từng ghét người khác, vì tôi nghĩ rằng họ là tác nhân khiến tôi mất đi điều tôi yêu quý. Nhưng suy cho cùng, ', NULL, N'cu-binh-tinh.jpg', CAST(N'2016-06-29 00:00:00' AS SmallDateTime), 5)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (9, 7, 4, 5, N'Mỗi Buổi Sáng, Hãy Tạo Ra Một Điều Gì Đó Mới Mẻ', 90000.0000, N'Từ khi mới sinh ra, bạn đã là người vô cùng sáng tạo.Bạn nhìn thế giới này với một con mắt tò mò, ngạc nhiên đầy phấn khích.Bạn không hề biết sợ, không hề biết lùi bước, bạn luôn đặt mình vào trong những tình huống thử thách cao độ.Bạn ...', NULL, N'moi-buoi-sang-hay-tao-ra-mot-dieu-gi-do-moi-me.jpg', CAST(N'2016-06-29 00:00:00' AS SmallDateTime), 8)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (10, 3, 3, 9, N'Ngày Xưa Có Một Chuyện Tình', 118000.0000, N'Ngày xưa có một chuyện tình là một câu chuyện cảm động khi người ta yêu nhau, nỗi khát khao một hạnh phúc êm đềm ấm áp đến thế; hay đơn giản chỉ là chuyện ba người - anh, em, và người ấy…?', NULL, N'ngay-xua-co-mot-chuyen-tinh.jpg', CAST(N'2016-06-29 00:00:00' AS SmallDateTime), 12)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (11, 1, 8, 13, N'Harry Potter And The Cursed Child - Parts I & II ', 530000.0000, NULL, NULL, N'harrypotter.jpg', CAST(N'2016-07-01 00:00:00' AS SmallDateTime), 4)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (12, 2, 1, 14, N'Nhà Đào Tạo Sành Sỏi', 112000.0000, N'MỌI THỨ BẠN CẦN CHO ĐÀO TẠO & PHÁT TRIỂN“Ngày nay chỉ có một thứ không đổi đó chính là...sự thay đổi.”“Hãy đối mặt với sự thật rằng một nhà lãnh đạo muốn có các nhân viên tốt chỉ có hai sự lựa chọn: hoặc đi thuê hoặc phải đứng ..', NULL, N'nha-dao-tao-sanh-soi.jpg', CAST(N'2016-07-02 00:00:00' AS SmallDateTime), 12)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (13, 2, 1, 15, N'Dám Làm Giàu', 132000.0000, N'Có nhiều con đường khác nhau để trở nên giàu có, nhưng để đi như thế nào để đến được đích của sự giàu có thì đó mới là điều để chúng ta quan tâm. Trong thời đại sống với công nghệ, thì việc làm ra tiền là điều không hề khó, điều quan', NULL, N'dam-lam-giau.jpg', CAST(N'2016-07-03 00:00:00' AS SmallDateTime), 7)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (14, 3, 9, 16, N'Việt Nam Thi Ca Luận Và Văn Chương Xã Hội', 54000.0000, N'Với Lương Đức Thiệp, Văn học là sản phẩm và vũ khí của đấu tranh đẳng cấp. Văn chương dùng để gieo rắc những ý tưởng vào ý thức dân chúng. Xung đột đẳng cấp càng gắt gao, đâu cũng phải chịu sức chi phối âm u của quyền lợi đẳng', NULL, N'viet-nam.jpg', CAST(N'2016-07-05 00:00:00' AS SmallDateTime), 4)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (15, 10, 1, 8, N'Chuyên Đề Ôn Tập Và Luyện Thi Hóa Học 12 ', 77000.0000, N'Cuốn sách "Chuyên đề ôn tập và luyện thi hóa học 12" sẽ cung cấp tài liệu tham khảo cần thiết cho các thầy, cô giáo và các em học sinh ôn tập để nâng cao kiến thức chất lượng kỳ thi tốt nghiệp THPT và kỳ thi tuyển sinh Đại học, Cao đẳng, đảm ... Xem chi tiết', N'Nguyên Hương', N'hoa-hoc-12.jpg', CAST(N'2016-07-05 00:00:00' AS SmallDateTime), 34)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (16, 4, 9, 17, N'Đèn Không Hắt Bóng', 148000.0000, N'Tinh hoa văn học của nhân loại nào cũng cần được khám phá và tái khám phá. Mỗi tác phẩm lớn là một sự kỳ diệu và mỗi lần ta tìm đến là thực hiện những cuộc phiêu lưu hoan lạc. Đến với tiểu thuyết Đèn Không Hắt Bóng là chúng ta đang bước', NULL, N'den-khong-hat-bong.jpg', CAST(N'2016-07-07 00:00:00' AS SmallDateTime), 23)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (17, 9, 1, 4, N'Mộng Đổi Đời ', 419000.0000, N'Khát vọng đổi đời như một hạt giống được gieo mầm, truyền từ đời này sang đời khác.Đôi khi hạt giống nơi đất cằn cũng tự phát triển mập mạp, nhưng phần lớn nhanh chóng bị èo uột giữa chừng bởi những điều kiện khách quan. Vấn đề là ... Xem chi tiết', NULL, N'mong-doi-doi.jpg', CAST(N'2016-07-05 00:00:00' AS SmallDateTime), 22)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (18, 5, 6, 18, N'Combo Chào Con', 129000.0000, N'1. Chào Con! Ba Mẹ Đã Sẵn Sàng!"Chào con! Ba mẹ đã sẵn sàng!" - Cuốn sách không chỉ được viết trên nền tảng khoa học của một bác sĩ mà còn chứa chan tình yêu của một người mẹ.Chắc chắn bạn cũng sẽ cảm nhận được những điểm hay và thực', NULL, N'combo-chao-con.jpg', CAST(N'2016-07-06 00:00:00' AS SmallDateTime), 22)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (29, 13, 6, 11, N'Cô Gái Đan Mạch', 95000.0000, N'Cô gái đan mạch là một câu chuyện cảm động về người chuyển giới đầu tiên trên thế giới, một họa sĩ  người đan mạch đã dũng cảm đối diện và tìm về với bản ngã của chính mình. Đây cũng là câu chuyện về lòng vị tha, đức hy sinh trong tình yêu.Tất cả đều được thể hiện bằng một văn phong trong sáng, đẹp đẽ.', NULL, N'co-gai-dan-mach.jpg', CAST(N'2016-11-01 15:21:00' AS SmallDateTime), 6)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (30, 6, 4, 19, N'Phát Triển Khả Năng Ngôn Ngữ', 36000.0000, N'Bộ sách Phát Triển Trí Tuệ Của Trẻ Qua Trò Chơi Dán Hình (4-6 tuổi) giúp trẻ phát triển khả năng Sáng tạo, Toán học, Ngôn Ngữ, Tư duy, rèn trí thông minh, luyện tay khéo léo. Sách với 150-300 hình dán + câu chuyện + trò chơi giúp bé chơi mà học.Mời bạn ..', NULL, N'phat-trien-kha-nang-ngon-ngu.jpg', CAST(N'2016-11-01 20:51:00' AS SmallDateTime), 16)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (31, 8, 10, 20, N'Luyện Thi Toeic 750 Reading', 87000.0000, N'5 TIẾNG MỖI NGÀY, ĐẠT NGAY 750 ĐIỂM• CUNG CẤP ĐỀ THI VÀ CÂU MẪU PHONG PHÚ, ĐA DẠNG• PHÂN TÍCH CHI TIẾT, HIỆU QUẢ CÁCH LÀM PHẦN 7HIỆU QUẢ TỨC THÌ – TỰ TIN HOÀN THÀNH BÀI THI TOEIC1. Dũng cảm phá bỏ quan niệm ‘lý thuyết là cơ bản’!Dù học thuộc ', NULL, N'luyen-thi-toeic.jpg', CAST(N'2016-11-01 20:54:00' AS SmallDateTime), NULL)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (32, 9, 1, 21, N'Tam Tạng Pháp Số', 374000.0000, N'Tam Tạng Pháp Số còn gọi Đại Minh Pháp Số hay Phật Học Từ Điển… là bộ sách giúp người học Phật dễ dàng tra cứu giáo lí Phật đà, phù hợp cho nhiều tầng lớp đối tượng: từ sơ học đến người đã có trình độ cao, do Nhất Như, Đạo ...', NULL, N'tam-tang-phap.jpg', CAST(N'2016-11-01 20:56:00' AS SmallDateTime), NULL)
INSERT [dbo].[Sach] ([MaSach], [MaLoai], [MaNXB], [MaTG], [TenSach], [GiaBan], [Mota], [NguoiDich], [AnhBia], [NgayCapNhat], [SoLuongTon]) VALUES (33, 14, 11, 22, N'Lịch Bloc Siêu Đại (20x30)', 200000.0000, N'Lịch Bloc Siêu Đại (20x30) - Việt Nam Quê Hương Tôi', NULL, N'bloc-sieu-dai.jpg', CAST(N'2016-11-01 20:59:00' AS SmallDateTime), NULL)
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (1, N'Donald J. Trump ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (2, N'Xuân Quỳnh', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (3, N'Trịnh Huyền Trang', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (4, N'Nguyễn Nhật Ánh', N'Thăng Bình', CAST(N'1955-05-07 00:00:00' AS SmallDateTime), NULL, N'Nguyễn Nhật Ánh là tên và cũng là bút danh của một nhà văn Việt Nam chuyên viết cho tuổi mới lớn. Ông sinh ngày 7 tháng 5 năm 1955 tại huyện Thăng Bình, Quảng Nam.')
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (5, N'Nguyễn Kim Tuấn ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (6, N'Võ Văn Nhị', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (7, N'May McCarthy', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (8, N'Nguyễn Danh Lam', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (9, N'Ái vân', N'Hà nội', CAST(N'1954-05-20 00:00:00' AS SmallDateTime), NULL, N'Ái Vân là một ca sĩ nhạc nhẹ được nhiều người biết đến trong thập niên 1970 và 1980 tại Việt Nam qua các bài hát như Triệu bông hồng, Trăng chiều hay Bài ca xây dựng. Từ năm 1990 Ái Vân bắt đầu ở lại Đức và sau đó sang Hoa Kỳ sinh sống và biểu diễn.')
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (10, N'Mỹ Chi', N'Khánh Hòa', NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (11, N'David Ebershoff ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (12, N'Jojo Moyes ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (13, N'J. K. Rowling ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (14, N'Đỗ Huân ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (15, N'Phạm Tuấn Sơn ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (16, N' Lương Đức Thiệp ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (17, N'Watanabe Dzunichi ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (18, N'Trần Thị Huyên Thảo ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (19, N'Tiểu Hồng Hoa ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (20, N'Jo Gang-Soo ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (21, N'Thích Nhất Như ', NULL, NULL, NULL, NULL)
INSERT [dbo].[TacGia] ([MaTG], [TenTG], [QueQuan], [NgaySinh], [NgayMat], [TieuSu]) VALUES (22, N' NXB Chính Trị Quốc Gia', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TacGia] OFF
SET IDENTITY_INSERT [dbo].[TheLoai] ON 

INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (1, N'Sách Ngoại Văn')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (2, N'Sách Kinh Tế')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (3, N'Sách Văn Học Trong Nước')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (4, N'Sách Văn Học Nước Ngoài')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (5, N'Sách Thường Thức - Đời Sống')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (6, N'Sách Thiếu Nhi')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (7, N'Sách Phát Triển Bản Thân')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (8, N'Sách Tin Học - Ngoại Ngữ')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (9, N'Sách Chuyên Ngành')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (10, N'Sách Giáo Khoa - Giáo Trình')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (13, N'Sách Văn Học-Tiều Thuyết')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (14, N'Tạp Chí - Văn Phòng Phẩm')
SET IDENTITY_INSERT [dbo].[TheLoai] OFF
ALTER TABLE [dbo].[ChiTietDDH]  WITH CHECK ADD FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
GO
ALTER TABLE [dbo].[ChiTietDDH]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NhaXuatBan] ([MaNXB])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaTG])
REFERENCES [dbo].[TacGia] ([MaTG])
GO
USE [master]
GO
ALTER DATABASE [BSDB2] SET  READ_WRITE 
GO
