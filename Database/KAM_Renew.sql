CREATE DATABASE KAM_Renew
GO

USE KAM_Renew
GO

--Create full table.
CREATE TABLE KhoaHoc
(
	ID int NOT NULL IDENTITY(1, 1),
	TenKhoaHoc nvarchar(30),
	GiaKhoaHoc decimal(18, 0),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_KhoaHoc PRIMARY KEY (ID)
)

CREATE TABLE LopHoc
(
	ID int NOT NULL IDENTITY(1, 1),
	IDKhoaHoc int NOT NULL,
	TenLopHoc nvarchar(30),
	KhuyenMai int,
	NgayBatDau date,
	ThoiLuongToiDa nvarchar(30),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_LopHoc PRIMARY KEY (ID)
)

CREATE TABLE MonHoc
(
	ID int NOT NULL IDENTITY(1, 1),
	TenMonHoc nvarchar(30) NOT NULL,
	DeCuong nvarchar(MAX),
	ThoiLuong nvarchar(30),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_MonHoc PRIMARY KEY (ID)
)

CREATE TABLE GiangVien
(
	ID int NOT NULL IDENTITY(1, 1),
	HoTen nvarchar(30),
	NgaySinh date,
	CMND varchar(9),
	Email varchar(30),
	SDT varchar(10),
	DiaChi nvarchar(50),
	GioiTinh nvarchar(3),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_GiangVien PRIMARY KEY (ID)
)

CREATE TABLE HocVien
(
	ID int NOT NULL IDENTITY(1, 1),
	HoTen nvarchar(30),
	NgaySinh date,
	CMND varchar(9),
	Email varchar(30),
	SDT varchar(10),
	DiaChi nvarchar(50),
	GioiTinh nvarchar(3),
	ChuyenMon nvarchar(30),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_HocVien PRIMARY KEY (ID)
)

CREATE TABLE LopHocMonHoc
(
	IDLopHoc int NOT NULL,
	IDMonHoc int NOT NULL,
	CONSTRAINT PK_LopHocMonHoc PRIMARY KEY (IDLopHoc, IDMonHoc)
)

CREATE TABLE HocVienLopHoc
(
	IDHocVien int NOT NULL,
	IDLopHoc int NOT NULL,
	HocPhi decimal(18, 0),
	GiamGia decimal(18, 0),
	HocPhiDaDong decimal(18, 0),
	HocPhiConLai decimal(18, 0),
	GhiChu nvarchar(MAX),
	CONSTRAINT PK_HocVienLopHoc PRIMARY KEY (IDHocVien, IDLopHoc)
)

CREATE TABLE GiangVienLopHoc
(
	IDGiangVien int NOT NULL,
	IDLopHoc int NOT NULL,
	Luong decimal(18, 0),
	TinhTrang nvarchar(30),
	CONSTRAINT PK_GiangVienLopHoc PRIMARY KEY (IDGiangVien, IDLopHoc)
)

CREATE TABLE Thu
(
	ID int NOT NULL IDENTITY(1, 1),
	IDLoaiThu int NOT NULL,
	NgayThu date,
	SoTien decimal (18, 0),
	LoaiThanhToan nvarchar(30),
	GhiChu nvarchar(MAX),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_Thu PRIMARY KEY (ID)
)

CREATE TABLE LoaiThu
(
	ID int NOT NULL IDENTITY(1, 1),
	TenLoaiThu nvarchar(30),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_LoaiThu PRIMARY KEY (ID)
)

CREATE TABLE Chi
(
	ID int NOT NULL IDENTITY(1, 1),
	IDLoaiChi int NOT NULL,
	NgayChi date,
	SoTien decimal (18, 0),
	LoaiThanhToan nvarchar(30),
	GhiChu nvarchar(MAX),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_Chi PRIMARY KEY (ID)
)

CREATE TABLE LoaiChi
(
	ID int NOT NULL IDENTITY(1, 1),
	TenLoaiChi nvarchar(30),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_LoaiChi PRIMARY KEY (ID)
)

CREATE TABLE Vay
(
	ID int NOT NULL IDENTITY(1, 1),
	TenVay nvarchar(30),
	LoaiVay nvarchar(30),
	NgayVay date,
	HoTenNguoiVay nvarchar(30),
	NgaySinhNguoiVay date,
	CMNDNguoiVay varchar(9),
	EmailNguoiVay varchar(30),
	SDTNguoiVay varchar(10),
	DiaChiNguoiVay nvarchar(50),
	GioiTinhNguoiVay nvarchar(3),
	SoTien decimal(18, 0),
	TrangThai bit NOT NULL DEFAULT 1,
	CONSTRAINT PK_Vay PRIMARY KEY (ID)
)


--Create full foreign key.
ALTER TABLE LopHoc
ADD CONSTRAINT FK_LopHoc_KhoaHoc FOREIGN KEY (IDKhoaHoc) REFERENCES KhoaHoc(ID)

ALTER TABLE LopHocMonHoc
ADD CONSTRAINT FK_LopHocMonHoc_LopHoc FOREIGN KEY (IDLopHoc) REFERENCES LopHoc(ID)
ALTER TABLE LopHocMonHoc
ADD CONSTRAINT FK_LopHocMonHoc_MonHoc FOREIGN KEY (IDMonHoc) REFERENCES MonHoc(ID)

ALTER TABLE HocVienLopHoc
ADD CONSTRAINT FK_HocVienLopHoc_HocVien FOREIGN KEY (IDHocVien) REFERENCES HocVien(ID)
ALTER TABLE HocVienLopHoc
ADD CONSTRAINT FK_HocVienLopHoc_LopHoc FOREIGN KEY (IDLopHoc) REFERENCES LopHoc(ID)

ALTER TABLE GiangVienLopHoc
ADD CONSTRAINT FK_GiangVienLopHoc_GiangVien FOREIGN KEY (IDGiangVien) REFERENCES GiangVien(ID)
ALTER TABLE GiangVienLopHoc
ADD CONSTRAINT FK_GiangVienLopHoc_LopHoc FOREIGN KEY (IDLopHoc) REFERENCES LopHoc(ID)


ALTER TABLE Thu
ADD CONSTRAINT FK_Thu_LoaiThu FOREIGN KEY (IDLoaiThu) REFERENCES LoaiThu(ID)

ALTER TABLE Chi
ADD CONSTRAINT FK_Chi_LoaiChi FOREIGN KEY (IDLoaiChi) REFERENCES LoaiChi(ID)