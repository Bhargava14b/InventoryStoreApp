USE [InventoryStore]
GO
/****** Object:  Table [dbo].[tbl_Brands]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Brands](
	[Brand_Id] [int] IDENTITY(1,1) NOT NULL,
	[Brand_Name] [varchar](50) NOT NULL,
	[Brand_Status] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Brands] PRIMARY KEY CLUSTERED 
(
	[Brand_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Categories]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Categories](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](50) NULL,
	[Category_Status] [bit] NULL,
 CONSTRAINT [PK_tbl_Categories] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Groups]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Groups](
	[Group_Id] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [varchar](50) NOT NULL,
	[Menu_Access] [varchar](500) NOT NULL,
 CONSTRAINT [PK_tbl_Groups] PRIMARY KEY CLUSTERED 
(
	[Group_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Orders]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Orders](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NULL,
	[Items_Count] [int] NULL,
	[Product_Cost] [numeric](18, 0) NULL,
	[Amount] [numeric](18, 0) NULL,
	[Bill_No] [varchar](50) NOT NULL,
	[Customer_Name] [varchar](50) NULL,
	[Customer_Address] [varchar](50) NULL,
	[Customer_Phone] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Gross_Amount] [numeric](18, 0) NULL,
	[Service_Charge] [numeric](18, 0) NULL,
	[Vat_Charge] [numeric](18, 0) NULL,
	[Discount] [numeric](18, 0) NULL,
	[NetAmount] [numeric](18, 0) NULL,
	[Paid_Status] [int] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_tbl_Orders] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Products]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Products](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [varchar](50) NOT NULL,
	[SKU] [varchar](50) NOT NULL,
	[Supplier_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Brand_Id] [int] NOT NULL,
	[Store_Id] [int] NOT NULL,
	[Product_Description] [varchar](50) NOT NULL,
	[Product_Quantity] [int] NOT NULL,
	[Price] [numeric](18, 0) NOT NULL,
	[ExpiryDate] [datetime] NULL,
	[Availability] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_Products] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Stores]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Stores](
	[Store_Id] [int] IDENTITY(1,1) NOT NULL,
	[Store_Name] [varchar](50) NULL,
	[Store_Status] [bit] NULL,
 CONSTRAINT [PK_tbl_Stores] PRIMARY KEY CLUSTERED 
(
	[Store_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Supplier]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Supplier](
	[Supplier_Id] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Name] [varchar](50) NULL,
	[Service_Charge_Value] [varchar](50) NULL,
	[Vat_Charge_Value] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[Phone] [varchar](13) NULL,
	[Country] [varchar](50) NULL,
	[Message] [varchar](50) NULL,
	[Currency] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Companies] PRIMARY KEY CLUSTERED 
(
	[Supplier_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Gender] [char](1) NULL,
	[Phone] [varchar](50) NULL,
	[User_Name] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email_Id] [varchar](50) NULL,
	[Group_Id] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Orders_tbl_Products] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[tbl_Products] ([Product_ID])
GO
ALTER TABLE [dbo].[tbl_Orders] CHECK CONSTRAINT [FK_tbl_Orders_tbl_Products]
GO
ALTER TABLE [dbo].[tbl_Orders]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Orders_tbl_Users] FOREIGN KEY([User_Id])
REFERENCES [dbo].[tbl_Users] ([User_Id])
GO
ALTER TABLE [dbo].[tbl_Orders] CHECK CONSTRAINT [FK_tbl_Orders_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Products_tbl_Brand_Id] FOREIGN KEY([Brand_Id])
REFERENCES [dbo].[tbl_Brands] ([Brand_Id])
GO
ALTER TABLE [dbo].[tbl_Products] CHECK CONSTRAINT [FK_tbl_Products_tbl_Brand_Id]
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Products_tbl_Categories] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[tbl_Categories] ([Category_Id])
GO
ALTER TABLE [dbo].[tbl_Products] CHECK CONSTRAINT [FK_tbl_Products_tbl_Categories]
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Products_tbl_Stores] FOREIGN KEY([Store_Id])
REFERENCES [dbo].[tbl_Stores] ([Store_Id])
GO
ALTER TABLE [dbo].[tbl_Products] CHECK CONSTRAINT [FK_tbl_Products_tbl_Stores]
GO
ALTER TABLE [dbo].[tbl_Products]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Products_tbl_Supplier_Id] FOREIGN KEY([Supplier_Id])
REFERENCES [dbo].[tbl_Supplier] ([Supplier_Id])
GO
ALTER TABLE [dbo].[tbl_Products] CHECK CONSTRAINT [FK_tbl_Products_tbl_Supplier_Id]
GO
/****** Object:  StoredProcedure [dbo].[delete_Store]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_Store]

@store_Id	int
as

delete from  [dbo].[tbl_Stores] where [Store_Id]=@store_Id	

GO
/****** Object:  StoredProcedure [dbo].[Search_Store]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Search_Store]

@store_Id	int
as

select *  from  [dbo].[tbl_Stores] where [Store_Id]=@store_Id	

GO
/****** Object:  StoredProcedure [dbo].[SP_SaveBrand]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SaveBrand]
(
@Id INT,
@Name VARCHAR(50),
@Status BIT
)
AS
BEGIN

IF(@Id=0)
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Brands WHERE Brand_Name=@Name)
	BEGIN
		SELECT 0 AS Result,'Brand Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		INSERT INTO tbl_Brands(Brand_Name,Brand_Status)
		VALUES(@Name,@Status)
		SELECT 1 AS Result,'Brand saved Successfully!' AS Msg
	END

END
ELSE
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Brands WHERE Brand_Name=@Name AND Brand_Id<>@Id)
	BEGIN
		SELECT 0 AS Result,'Brand Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		UPDATE tbl_Brands SET Brand_Name=@Name,Brand_Status=@Status
		WHERE Brand_Id=@Id
		SELECT 1 AS Result,'Brand saved Successfully!' AS Msg
	END
END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCategory]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SaveCategory]
(
@Id INT,
@Name VARCHAR(50),
@Status BIT
)
AS
BEGIN

IF(@Id=0)
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Categories WHERE Category_Name=@Name)
	BEGIN
		SELECT 0 AS Result,'Category Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		INSERT INTO tbl_Categories(Category_Name,Category_Status)
		VALUES(@Name,@Status)
		SELECT 1 AS Result,'Category saved Successfully!' AS Msg
	END

END
ELSE
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Categories WHERE Category_Name=@Name AND Category_Id<>@Id)
	BEGIN
		SELECT 0 AS Result,'Category Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		UPDATE tbl_Categories SET Category_Name=@Name,Category_Status=@Status
		WHERE Category_Id=@Id
		SELECT 1 AS Result,'Category saved Successfully!' AS Msg
	END
END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveGroup]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SaveGroup]
(
@Id INT,
@Name VARCHAR(50),
@Menus VARCHAR(500)
)
AS
BEGIN

IF(@Id<=0)
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Groups WHERE Group_Name=@Name)
	BEGIN
		SELECT 0 AS Result,'Group Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		INSERT INTO tbl_Groups(Group_Name,Menu_Access)
		VALUES(@Name,@Menus)
		SELECT 1 AS Result,'Group saved Successfully!' AS Msg
	END

END
ELSE
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Groups WHERE Group_Name=@Name AND Group_Id<>@Id)
	BEGIN
		SELECT 0 AS Result,'Group Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		UPDATE tbl_Groups SET Group_Name=@Name,Menu_Access=@Menus
		WHERE Group_Id=@Id
		SELECT 1 AS Result,'Group saved Successfully!' AS Msg
	END
END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveStore]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SaveStore]
(
@Id INT,
@Name VARCHAR(50),
@Status BIT
)
AS
BEGIN

IF(@Id=0)
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Stores WHERE Store_Name=@Name)
	BEGIN
		SELECT 0 AS Result,'Store Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		INSERT INTO tbl_Stores(Store_Name,Store_Status)
		VALUES(@Name,@Status)
		SELECT 1 AS Result,'Store saved Successfully!' AS Msg
	END

END
ELSE
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Stores WHERE Store_Name=@Name AND Store_Id<>@Id)
	BEGIN
		SELECT 0 AS Result,'Store Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		UPDATE tbl_Stores SET Store_Name=@Name,Store_Status=@Status
		WHERE Store_Id=@Id
		SELECT 1 AS Result,'Store saved Successfully!' AS Msg
	END
END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveSupplier]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SaveSupplier]
(
@Id INT,
@Name VARCHAR(50),
@ServiceCharge VARCHAR(500),
@Vat VARCHAR(50),
@Address VARCHAR(200),
@Phone VARCHAR(13),
@Country VARCHAR(50),
@Message VARCHAR(50),
@Currency VARCHAR(50)
)
AS
BEGIN

IF(@Id<=0)
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Supplier WHERE Supplier_Name=@Name)
	BEGIN
		SELECT 0 AS Result,'Supplier Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		INSERT INTO tbl_Supplier(Supplier_Name,Service_Charge_Value,Vat_Charge_Value,Address,Phone,Country,Message,Currency)
		VALUES(@Name,@ServiceCharge,@Vat,@Address,@Phone,@Country,@Message,@Currency)
		SELECT 1 AS Result,'Supplier saved Successfully!' AS Msg
	END

END
ELSE
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Supplier WHERE Supplier_Name=@Name AND Supplier_Id<>@Id)
	BEGIN
		SELECT 0 AS Result,'Supplier Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		UPDATE tbl_Supplier SET 
		Supplier_Name=@Name,
		Service_Charge_Value=@ServiceCharge,
		Vat_Charge_Value=@Vat,
		Address=@Address,
		Phone=@Phone,
		Country=@Country,
		Message=@Message,
		Currency=@Currency
		WHERE Supplier_Id=@Id
		SELECT 1 AS Result,'Supplier saved Successfully!' AS Msg
	END
END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveUser]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SaveUser]
(
@Id INT,
@FirstName VARCHAR(50),
@LastName VARCHAR(50),
@Gender char(1),
@Phone VARCHAR(13),
@Password VARCHAR(50),
@EmailId VARCHAR(50),
@GroupId INT,
@IsActive BIT
)
AS
BEGIN

IF(@Id<=0)
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Users WHERE Email_Id=@EmailId)
	BEGIN
		SELECT 0 AS Result,'Email Id already exists!' AS Msg
	END
	ELSE
	BEGIN
		INSERT INTO tbl_Users(FirstName,LastName,Gender,Phone,[User_Name],Password,Email_Id,Group_Id,IsActive)
		VALUES(@FirstName,@LastName,@Gender,@Phone,@EmailId,@Password,@EmailId,@GroupId,@IsActive)
		SELECT 1 AS Result,'User saved Successfully!' AS Msg
	END

END
ELSE
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Users WHERE Email_Id=@EmailId AND [User_Id]<>@Id)
	BEGIN
		SELECT 0 AS Result,'Email Id already exists!' AS Msg
	END
	ELSE
	BEGIN
		UPDATE tbl_Users SET 
		FirstName=@FirstName,
		LastName=@LastName,
		Gender=@Gender,
		Phone=@Phone,
		[User_Name]=@EmailId,
		Email_Id=@EmailId,
		Group_Id=@GroupId,
		IsActive=@IsActive
		WHERE User_Id=@Id
		SELECT 1 AS Result,'User saved Successfully!' AS Msg
	END
END

END
GO
/****** Object:  StoredProcedure [dbo].[Update_Store]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Update_Store]
@Store_Name varchar(10),
@store_status int,
@store_Id	int
as

update [dbo].[tbl_Stores] set [Store_Name]=@Store_Name ,[Store_Status]=@store_status where [Store_Id]=@store_Id	

GO
/****** Object:  StoredProcedure [dbo].[ViewAll_Stores]    Script Date: 29-03-2020 23:25:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ViewAll_Stores]
as
select *  from  [dbo].[tbl_Stores] 
GO


USE [InventoryStore]
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveProduct]    Script Date: 30-03-2020 20:20:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_SaveProduct]
(
@Id INT,
@ProductName VARCHAR(50),
@SKU VARCHAR(50),
@SupplierId INT,
@CategoryId INT,
@BrandId INT,
@StoreId INT,
@Description VARCHAR(50),
@Quantity INT,
@Price numeric(18,0),
@ExpiryDate DATETIME,
@Availability BIT
)
AS
BEGIN

IF(@Id=0)
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Products WHERE Product_Name=@ProductName)
	BEGIN
		SELECT 0 AS Result,'Product Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		INSERT INTO tbl_Products(Product_Name,SKU,Supplier_Id,Category_Id,Brand_Id,Store_Id,Product_Description,Product_Quantity,Price,ExpiryDate,Availability)
		VALUES(@ProductName,@SKU,@SupplierId,@CategoryId,@BrandId,@StoreId,@Description ,@Quantity ,@Price ,@ExpiryDate,@Availability)
		SELECT 1 AS Result,'Product saved Successfully!' AS Msg
	END

END
ELSE
BEGIN

	IF EXISTS(SELECT 1 FROM tbl_Products WHERE Product_Name=@ProductName AND Product_ID<>@Id)
	BEGIN
		SELECT 0 AS Result,'Product Name already exists!' AS Msg
	END
	ELSE
	BEGIN
		UPDATE tbl_Products SET 
		Product_Name=@ProductName,
		SKU=@SKU,
		Supplier_Id=@SupplierId,
		Category_Id=@CategoryId,
		Brand_Id=@BrandId,
		Store_Id=@StoreId,
		Product_Description=@Description,
		Product_Quantity=@Quantity,
		Price=@Price,
		ExpiryDate=@ExpiryDate,
		[Availability]=@Availability

		WHERE Product_ID=@Id
		SELECT 1 AS Result,'Product saved Successfully!' AS Msg
	END
END

END
USE [InventoryStore]
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveOrder]    Script Date: 30-03-2020 20:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_SaveOrder]
(
@Id INT,
@ProductId INT,
@ItemsCount INT,
@Cost NUMERIC(18,0),
@Amount NUMERIC(18,0),
@BillNo VARCHAR(50),
@CustomerName VARCHAR(50),
@Customer_Address varchar(50),
@Phone VARCHAR(50),
@CreatedDate date,
@GrossAmount NUMERIC(18,0),
@SerivceCharge NUMERIC(18,0),
@VatCharge numeric(18,0),
@Discount NUMERIC(18,0),
@NetAmount NUMERIC(18,0),
@PaidStatus INT,
@UserId INT
)
AS
BEGIN

INSERT INTO tbl_Orders(
Order_Id,
Product_Id,
Items_Count,
Product_Cost,
Amount,
Bill_No,
Customer_Name,
Customer_Address,
Customer_Phone,
CreatedDate,
Gross_Amount,
Service_Charge,
Vat_Charge,
Discount,
NetAmount,
Paid_Status,
User_Id
)
VALUES(
@Id ,
@ProductId ,
@ItemsCount ,
@Cost ,
@Amount ,
@BillNo ,
@CustomerName ,
@Customer_Address ,
@Phone ,
@CreatedDate ,
@GrossAmount ,
@SerivceCharge ,
@VatCharge ,
@Discount ,
@NetAmount ,
@PaidStatus ,
@UserId 
)
SELECT 1 AS Result,'Order submitted Successfully!' AS Msg
		
END
