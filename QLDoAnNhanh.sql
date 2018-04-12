create database BanDoAnNhanh
go
use BanDoAnNhanh
go

-- danh mục như đồ uống, đồ tráng miệng, thức ăn nhanh
CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL,
)
GO

-- bảng thức ăn 
CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL ,
	idCategory INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idCategory) REFERENCES dbo.FoodCategory(id)
)
GO

CREATE TABLE Login(
	Name VARCHAR(50) NOT NULL,
	Pass VARCHAR(50) NOT NULL
);
go
-- nhân viên 
create table Employee( 
	id int IDENTITY PRIMARY KEY, 
	name NVARCHAR(100) NOT NULL ,
	phone varchar(11) not null,
	address nvarchar(100) not null ,
	sex bit not null,
	
);
go

-- khuyến mãi
create table Coupon(
	id VARCHAR(50) PRIMARY KEY, 
	description NVARCHAR(100) NOT NULL , -- mô tả về coupon được áp dụng
	valueCoupon varchar(10) -- giá trị khuyến mãi bao nhiêu phần trăm
);
go
--hóa đơn
create table Bill(
idCoupon VARCHAR(50) REFERENCES dbo.Coupon(id) DEFAULT NULL,
cashier int references Employee(id),
paymentTime date,  -- thời gian thanh toán
idFood INT references Food(id),
count int,
);
go
--------------------------------------------------------------instert

INSERT dbo.FoodCategory VALUES  ( N'Sinh tố')
INSERT dbo.FoodCategory VALUES  ( N'Matcha')
INSERT dbo.FoodCategory VALUES  ( N'Cafe')
INSERT dbo.FoodCategory VALUES  ( N'Trà')

go
----update foodCategory
UPDATE dbo.FoodCategory SET name=N'Đồ ăn' WHERE id=1

GO
DELETE dbo.FoodCategory WHERE id=1
go
SELECT * FROM dbo.FoodCategory 

go
------Food
INSERT dbo.Food VALUES  ( N'Sinh tố hoa quả', 2, 48000.0 )
INSERT dbo.Food VALUES  ( N'Sinh tố dâu', 2, 48000.0 )
INSERT dbo.Food VALUES  ( N'Sinh tố cam', 2, 48000.0 )
INSERT dbo.Food VALUES  ( N'Sinh tố xoài', 2, 48000.0 )



INSERT dbo.Food VALUES  ( N'Matcha trà xanh', 2, 48000.0 )
INSERT dbo.Food VALUES  ( N'Matcha chocolate', 2, 48000.0 )
INSERT dbo.Food VALUES  ( N'Matcha cam', 2, 48000.0 )
INSERT dbo.Food VALUES  ( N'Matcha dâu', 2, 48000.0 )
INSERT dbo.Food VALUES  ( N'Matcha bạc hà', 2, 48000.0 )


INSERT dbo.Food VALUES  ( N'Cafe Nâu', 3, 48000.0 )
INSERT dbo.Food VALUES  ( N'Cafe Đen', 3, 48000.0 )
INSERT dbo.Food VALUES  ( N'Cafe sữa đá', 3, 48000.0 )
INSERT dbo.Food VALUES  ( N'Cafe Nóng', 3, 48000.0 )


INSERT dbo.Food VALUES  ( N'Trà thái', 3, 48000.0 )
INSERT dbo.Food VALUES  ( N'Trà Lipton', 3, 48000.0 )
INSERT dbo.Food VALUES  ( N'Trà gừng', 3, 48000.0 )
INSERT dbo.Food VALUES  ( N'Trà mạn', 3, 48000.0 )

go
UPDATE dbo.Food SET	name=N'luong' WHERE id=1

GO
INSERT dbo.Login
        ( Name, Pass )
VALUES  ( 'admin', -- Name - varchar(50)
          '123'  -- Pass - varchar(50)
          )
GO
INSERT dbo.Coupon
        ( id, description, valueCoupon )
VALUES  ( 'C1', -- id - varchar(50)
          N'Khuyễn mãi 10%', -- description - nvarchar(100)
          '10'  -- valueCoupon - varchar(10)
          )
INSERT dbo.Coupon
        ( id, description, valueCoupon )
VALUES  ( 'C2', -- id - varchar(50)
          N'Khuyễn mãi 20%', -- description - nvarchar(100)
          '20'  -- valueCoupon - varchar(10)
          )
GO
INSERT dbo.Employee
        ( name, phone, address, sex )
VALUES  ( N'Hoàng Thanh Thúy', -- name - nvarchar(100)
          '0934234232', -- phone - varchar(11)
          N'Hà nội', -- address - nvarchar(100)
          0  -- sex - bit
          )

INSERT dbo.Employee
        ( name, phone, address, sex )
VALUES  ( N'Hoàng Đức Mập', -- name - nvarchar(100)
          '0934234232', -- phone - varchar(11)
          N'Hà nội', -- address - nvarchar(100)
          0  -- sex - bit
          )

INSERT dbo.Employee
        ( name, phone, address, sex )
VALUES  ( N'Nguyễn Thanh Thúy', -- name - nvarchar(100)
          '0934234232', -- phone - varchar(11)
          N'Hà nội', -- address - nvarchar(100)
          0  -- sex - bit
          )

INSERT dbo.Employee
        ( name, phone, address, sex )
VALUES  ( N'Lưu Thanh Hải', -- name - nvarchar(100)
          '0934234232', -- phone - varchar(11)
          N'Hà nội', -- address - nvarchar(100)
          0  -- sex - bit
          )

GO
INSERT dbo.Bill
        ( idCoupon ,
          cashier ,
          paymentTime ,
          idFood ,
          count
        )
VALUES  ( 'C1' , -- idCoupon - varchar(50)
          1 , -- cashier - int
          GETDATE() , -- paymentTime - date
          1 , -- idFood - int
          1  -- count - int
        )
go
INSERT dbo.Bill
        ( idCoupon ,
          cashier ,
          paymentTime ,
          idFood ,
          count
        )
VALUES  ( 'C1' , -- idCoupon - varchar(50)
          2 , -- cashier - int
          GETDATE() , -- paymentTime - date
          2 , -- idFood - int
          2  -- count - int
        )

go
INSERT dbo.Bill
        ( idCoupon ,
          cashier ,
          paymentTime ,
          idFood ,
          count
        )
VALUES  ( 'C2' , -- idCoupon - varchar(50)
          2 , -- cashier - int
          GETDATE() , -- paymentTime - date
          4 , -- idFood - int
          4  -- count - int
        )

go


SELECT * FROM  dbo.Food