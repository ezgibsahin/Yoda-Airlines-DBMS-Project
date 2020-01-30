

CREATE TABLE [dbo].[AIRPLANE]
(
	[AId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[MTOW] [nvarchar](50) NULL,
	[Range] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL
)

CREATE TABLE [dbo].[FLIGHT]
(
	[FId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[AId] [int] FOREIGN KEY REFERENCES AIRPLANE(AId),
	[DWhere] [nvarchar](50) NULL,
	[DFrom] [nvarchar](50) NULL,
	[Date] [datetime] NULL
)


CREATE TABLE [dbo].[FLIGHT_CLASS]
(
	[FClassType] [nvarchar](50) PRIMARY KEY NOT NULL,
	[Luggage] [nvarchar](50) NULL,
	[ExtraServices] [nvarchar](50) NULL,
	[SeatSelection] [datetime] NULL,
	[ChangeOrRefund] [nvarchar](50) NULL
)


CREATE TABLE [dbo].[PASSENGER]
(
	[PId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[NationalId] [int] NULL,
	[PName] [nvarchar](50) NULL,
	[PSurname] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL
)

CREATE TABLE [dbo].[USER_INFORMATION]
(
	[UId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[NationalId] [int] NULL,
	[UName] [nvarchar](50) NULL,
	[USurname] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Nationality] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL
)


CREATE TABLE [dbo].[PAYMENT_INFORMATION]
(
	[PId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[UId] [int] FOREIGN KEY REFERENCES USER_INFORMATION(UId),
	[CardNumber] [int] NULL,
	[CreditCardHolder] [nvarchar](50) NULL,
	[ExpiryDate] [date] NULL,
	[CVV] [int] NULL
)


CREATE TABLE [dbo].[STAFF]
(
	[SId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[SName] [nvarchar](50) NULL,
	[SSurname] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Profession] [nvarchar](50) NULL,
	[Salary] [nvarchar](50) NULL,
	[DatHired] [date] NULL
)

CREATE TABLE [dbo].[FLIGHT_ATTENDANT]
(
	[SId] [int] FOREIGN KEY REFERENCES STAFF(SId) NULL,
	[FId] [int] FOREIGN KEY REFERENCES FLIGHT(FId) NULL
	
)


CREATE TABLE [dbo].[PILOT]
(
	[SId] [int] FOREIGN KEY REFERENCES STAFF(SId) NULL,
	[FId] [int] FOREIGN KEY REFERENCES FLIGHT(FId) NULL
)
CREATE TABLE [dbo].[SEAT]
(
	[SId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[AId] [int] FOREIGN KEY REFERENCES AIRPLANE(AId),
	[SType] [nvarchar](50) NULL,
)

CREATE TABLE [dbo].[TICKET]
(
	[TId] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[SId] [int] FOREIGN KEY REFERENCES SEAT(SId) NULL,
	[FId] [int] FOREIGN KEY REFERENCES FLIGHT(FId) NULL,
	[FClassType] [nvarchar](50) FOREIGN KEY REFERENCES FLIGHT_CLASS(FClassType),
	[PId] [int] FOREIGN KEY REFERENCES PASSENGER(PId) NULL
)



//inserting into USER INFORMATION table
INSERT INTO [dbo].[USER_INFORMATION]([NationalId],[UName],[USurname],[Gender],[Nationality],[Language],[Profession],[DateOfBirth],[Phone],[Email],[Password])
VALUES (23, 'Yoda', '-', 'Erkek', 'Tekir', 'Türkçe', 'Kedi', '2018-08-15', '0xxxxxxxxxx', 'xxx@xxx', 'kediyimben')

//inserting into AIRPLANE table
INSERT INTO [dbo].[AIRPLANE]([Model],[MTOW],[Range])
VALUES ('Airbus A220', '60,800', '3,200')

//inserting into FLIGHT table
INSERT INTO [dbo].[FLIGHT]([AId], [Date], [DFrom], [DWhere])
VALUES (4, '2019-01-14 22:00:00.000', 'SEUL', 'İZMİR')

//inserting into FLIGHT CLASS table
INSERT INTO [dbo].[FLIGHT_CLASS]([FClassType],[Luggage],[ExtraServices],[SeatSelection],[ChangeOrRefund])
VALUES ('BUSINESS','20 KG + 12 KG KABİN','+','+','+') 

//inserting into PAYMENT INFORMATION table
INSERT INTO [dbo].[PAYMENT_INFORMATION]
VALUES (3, '2XXX 3XXX 4XXX 5XXX', 'YODA', '12/20', '355')

//inserting into SEAT table
INSERT INTO [dbo].[SEAT]([AId],[SType])
VALUES (4,'Diğer Koltuklar')

//inserting into STAFF table
INSERT INTO [dbo].[STAFF]
VALUES ('Ceren', 'Öğüt', 'Kadın', '1996-07-12', '0xxxxxxxxxx', 'xxx@xxx', 'FLIGHT ATTENDANT', '3200','2018-12-04')

//inserting into FLIGHT ATTENDANT table
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (13, 4)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (8, 7)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (12, 1)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (10, 3)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (11, 5)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (9, 4)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (7, 2)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (14, 6)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (13, 8)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (14, 9)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (13, 10)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (7, 11)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (9, 12)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (12, 13)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (13, 14)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (8, 15)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (10, 16)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (11, 17)
INSERT INTO [dbo].[FLIGHT_ATTENDANT]
VALUES (11, 18)

//inserting into PILOT table
INSERT INTO [dbo].[PILOT]
VALUES (1,8)
INSERT INTO [dbo].[PILOT]
VALUES (1,4)
INSERT INTO [dbo].[PILOT]
VALUES (1,9)
INSERT INTO [dbo].[PILOT]
VALUES (1,10)
INSERT INTO [dbo].[PILOT]
VALUES (1,11)

INSERT INTO [dbo].[PILOT]
VALUES (2,2)
INSERT INTO [dbo].[PILOT]
VALUES (2,3)
INSERT INTO [dbo].[PILOT]
VALUES (2,13)
INSERT INTO [dbo].[PILOT]
VALUES (2,14)

INSERT INTO [dbo].[PILOT]
VALUES (3,5)
INSERT INTO [dbo].[PILOT]
VALUES (3,6)
INSERT INTO [dbo].[PILOT]
VALUES (3,15)
INSERT INTO [dbo].[PILOT]
VALUES (3,16)
INSERT INTO [dbo].[PILOT]
VALUES (3,17)
INSERT INTO [dbo].[PILOT]
VALUES (3,18)

INSERT INTO [dbo].[PILOT]
VALUES (4,1)
INSERT INTO [dbo].[PILOT]
VALUES (4,7)
INSERT INTO [dbo].[PILOT]
VALUES (4,12)


USE [YodaAirlines]
GO

/****** Object:  View [dbo].[PrintedTicket]    Script Date: 12/25/2018 8:09:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PrintedTicket]
AS
	SELECT P.PName AS NAME, P.PSurname AS SURNAME, P.Gender AS GENDER, P.NationalId AS NATIONALID, F.DFrom AS DEPARTURE, F.DWhere AS ARRIVAL, F.Date AS DATE, S.SType, FC.FClassType
	FROM [dbo].[TICKET] AS T, [dbo].[FLIGHT] AS F, [dbo].[PASSENGER] AS P, [dbo].[FLIGHT_CLASS] AS FC, [dbo].[SEAT] AS S
	WHERE T.FId = F.FId AND T.SId = S.SId AND T.PId = P.PId AND T.FClassType = FC.FClassType
GO





USE [YodaAirlines]
GO

/****** Object:  View [dbo].[ReturnFlights]    Script Date: 12/25/2018 8:10:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[ReturnFlights]
AS
	SELECT DISTINCT P.DFrom AS DEPARTURE, P.DWhere AS ARRIVAL, A.Model AS AIRPLANE, CONVERT(VARCHAR(10),P.Date,3) AS DATE, CONVERT(VARCHAR(10),P.Date,8) AS TIME
	FROM [dbo].[FLIGHT] AS F, [dbo].FLIGHT AS P, [dbo].[AIRPLANE] AS A
	WHERE F.DFrom = P.DWhere AND F.DWhere = P.DFrom AND F.Date < P.Date AND P.AId = A.AId
GO





USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteById]    Script Date: 12/25/2018 8:05:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SP_DeleteById] @Id int
as
	delete from [dbo].[USER_INFORMATION] where [dbo].[USER_INFORMATION].UId = @Id


USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetFlightDateByFromWhere]    Script Date: 12/25/2018 8:06:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GetFlightDateByFromWhere] @selectedFrom NVARCHAR(50), @selectedWhere NVARCHAR(50)
AS
	SELECT CONVERT(VARCHAR(10),[dbo].[FLIGHT].Date,3)
	FROM [dbo].[FLIGHT] 
	WHERE [dbo].[FLIGHT].DFrom = @selectedFrom AND [dbo].[FLIGHT].DWhere = @selectedWhere 
	GROUP BY [dbo].[FLIGHT].Date 
	ORDER BY [dbo].[FLIGHT].Date ASC



USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetFlightsBySelection]    Script Date: 12/25/2018 8:06:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_GetFlightsBySelection] @selectedCityFrom NVARCHAR(50), @selectedCityTo NVARCHAR(50), @selectedDate VARCHAR(10)
AS
	SELECT [dbo].[FLIGHT].DFrom AS DEPARTURE, [dbo].[FLIGHT].DWhere AS ARRIVAL, [dbo].[AIRPLANE].Model AS AIRPLANE, CONVERT(VARCHAR(10),[dbo].[FLIGHT].Date,3) AS DATE, CONVERT(VARCHAR(10),[dbo].[FLIGHT].Date,8) AS TIME
	FROM [dbo].[FLIGHT] JOIN [dbo].[AIRPLANE] ON [dbo].[FLIGHT].AId = [dbo].[AIRPLANE].AId
	WHERE @selectedCityFrom = [dbo].[FLIGHT].DFrom AND @selectedCityTo = [dbo].[FLIGHT].DWhere AND @selectedDate =  CONVERT(VARCHAR(10),[dbo].[FLIGHT].Date,3)






USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetReturnFligthsBySelection]    Script Date: 12/25/2018 8:07:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GetReturnFligthsBySelection] @selectedFrom NVARCHAR(50), @selectedTo NVARCHAR(50), @selectedDate NVARCHAR(50)
AS
	SELECT * FROM [dbo].[ReturnFlights] AS WR
	WHERE WR.DEPARTURE = @selectedFrom AND WR.ARRIVAL = @selectedTo AND WR.DATE = @selectedDate



USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoundTripFrom]    Script Date: 12/25/2018 8:07:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GetRoundTripFrom]
AS
	SELECT DISTINCT F.DFrom FROM [dbo].[FLIGHT] AS F, [dbo].FLIGHT AS P
	WHERE F.DFrom = P.DWhere AND F.DWhere = P.DFrom AND F.Date < P.Date




USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoundTripToByFrom]    Script Date: 12/25/2018 8:07:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GetRoundTripToByFrom] @selectedFrom NVARCHAR(50)
AS
	SELECT DISTINCT F.DWhere FROM [dbo].[FLIGHT] AS F, [dbo].FLIGHT AS P
	WHERE F.DFrom = P.DWhere AND F.DWhere = P.DFrom AND F.Date < P.Date AND F.DFrom = @selectedFrom




USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetToByFrom]    Script Date: 12/25/2018 8:07:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GetToByFrom] @selectedFrom NVARCHAR(50)
AS
	SELECT DISTINCT F.DWhere 
	FROM [dbo].[FLIGHT] AS F  JOIN [dbo].[FLIGHT] AS P ON F.AId = P.AId
	WHERE F.DFrom = @selectedFrom





USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserByID]    Script Date: 12/25/2018 8:07:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GetUserByID]  @ID int
AS
SELECT [dbo].[USER_INFORMATION].UId as UId, [dbo].[USER_INFORMATION].NationalId as UNId, [dbo].[USER_INFORMATION].UName as UName, [dbo].[USER_INFORMATION].USurname as USurname, [dbo].[USER_INFORMATION].Gender as UGender, [dbo].[USER_INFORMATION].Nationality as UNationality, [dbo].[USER_INFORMATION].Language as ULanguage, [dbo].[USER_INFORMATION].Profession as UProfession, [dbo].[USER_INFORMATION].DateOfBirth as UDateOfBirth, [dbo].[USER_INFORMATION].Phone as UPhone, [dbo].[USER_INFORMATION].Email as UEmail, [dbo].[USER_INFORMATION].Password as UPassword
from [dbo].[USER_INFORMATION]
WHERE UId = @ID





USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[SP_UserAdd]    Script Date: 12/25/2018 8:08:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_UserAdd] (@UName nvarchar(50) = null, @USurname nvarchar(50) = null, @Gender nvarchar(50) = null, @NationalId int = null, @Nationality nvarchar(50) = null, @Language nvarchar(50) = null, @Profession nvarchar(50) = null, @DateOfBirth date = null, @Email nvarchar(50) = null, @Phone nvarchar(50) = null, @Password nvarchar(50) = null)
AS
begin
INSERT INTO [dbo].[USER_INFORMATION]([NationalId],[UName],[USurname],[Gender],[Nationality],[Language],[Profession],[DateOfBirth],[Phone],[Email],[Password])
VALUES (@NationalId, @UName, @USurname, @Gender, @Nationality, @Language, @Profession, @DateOfBirth, @Phone, @Email, @Password)
end




USE [YodaAirlines]
GO
/****** Object:  StoredProcedure [dbo].[spSelectUsers]    Script Date: 12/25/2018 8:08:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spSelectUsers] 
AS
	SELECT [dbo].[USER_INFORMATION].UId as UId, [dbo].[USER_INFORMATION].NationalId as UNId, [dbo].[USER_INFORMATION].UName as UName, [dbo].[USER_INFORMATION].USurname as USurname, [dbo].[USER_INFORMATION].Gender as UGender, [dbo].[USER_INFORMATION].Nationality as UNationality, [dbo].[USER_INFORMATION].Language as ULanguage, [dbo].[USER_INFORMATION].Profession as UProfession, [dbo].[USER_INFORMATION].DateOfBirth as UDateOfBirth, [dbo].[USER_INFORMATION].Phone as UPhone, [dbo].[USER_INFORMATION].Email as UEmail, [dbo].[USER_INFORMATION].Password as UPassword 
	from [dbo].[USER_INFORMATION]
