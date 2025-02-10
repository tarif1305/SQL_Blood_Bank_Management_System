--Sql Project Blood Bank Management System

Drop Database if exists [BloodBankManagementSystem];
Go
Create Database [BloodBankManagementSystem]

ON  PRIMARY 
( NAME = 'BloodBankManagementSystem', FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BloodBankManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = 'BloodBankManagementSystem_log', FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BloodBankManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )

Go
create login ProjectUser with password ='Admin@123', DEFAULT_DATABASE = BloodBankManagementSystem;

go
alter server role serveradmin
add member ProjectUser
go
use BloodBankManagementSystem
go
create role UserRole
go
alter role db_owner
add member UserRole
go
create schema BBMS
go
grant select,insert, update, delete, execute
on schemas::BBMS
to UserRole
go
create user ProjectDBUser for login ProjectUser
with default_schema=BBMS
go
alter role UserRole
add member ProjectDBUser

Go

Use [BloodBankManagementSystem]

GO
--Create Blood Doner Table.....


	CREATE TABLE Donor (
    DonorID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    BloodType VARCHAR(5),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

Go
 --Craete Table for Recipent_____
 CREATE TABLE Recipient (
    RecipientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    BloodType VARCHAR(5),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);
Go
	--Create Table For BloodBag

	CREATE TABLE BloodBag (
    BagID INT PRIMARY KEY,
    BloodType VARCHAR(5),
    DonorID INT,
    ExpiryDate DATE,
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID)
);
Go
	--Crerate Table For BloodRequest 

CREATE TABLE BloodRequest (
    RequestID INT PRIMARY KEY,
    RecipientID INT,
    BloodType VARCHAR(5),
    RequestDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (RecipientID) REFERENCES Recipient(RecipientID));

	Go
		--Create Table For BloodTransfusion

	CREATE TABLE BloodTransfusion (
    TransfusionID INT PRIMARY KEY,
    RecipientID INT,
    DonorID INT,
    BagID INT,
    TransfusionDate DATE,
    FOREIGN KEY (RecipientID) REFERENCES Recipient(RecipientID),
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID),
    FOREIGN KEY (BagID) REFERENCES BloodBag(BagID)
);
Go


	--Create Table For BloodDonationRecord


	CREATE TABLE BloodDonationRecord (
    DonationID INT PRIMARY KEY,
    DonorID INT,
    BagID INT,
    DonationDate DATE,
    FOREIGN KEY (DonorID) REFERENCES Donor(DonorID),
    FOREIGN KEY (BagID) REFERENCES BloodBag(BagID)
);
Go


	--Create Table For BloodBank

	CREATE TABLE BloodBank (
    BankID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255)
);
Go


--Create View...............................................................................
	go

	CREATE VIEW BloodDonorDetails 
	AS
	SELECT d.Name AS DonorName, d.BloodType, b.ExpiryDate AS DonationDate
	FROM Donor as d
	JOIN BloodBag as b 
	ON d.DonorID = b.DonorID;

	Go
	--Create Store Procedure-1.........................................................................

	-- Create a stored procedure for inserting values into the Donor table
	CREATE PROCEDURE InsertDonor
	@DonarId int,
    @Name VARCHAR(50),
    @Age INT,
    @Gender VARCHAR(10),
    @BloodType VARCHAR(5),
    @Phone VARCHAR(20),
    @Address VARCHAR(255)
	AS
	BEGIN
    INSERT INTO Donor (DonorID,Name, Age, Gender, BloodType, Phone, Address)
    VALUES (@DonarId,@Name, @Age, @Gender, @BloodType, @Phone, @Address)
	END
	GO

	
	--Create Store Procedure-2..........................................................................

	CREATE PROCEDURE GetPendingBloodRequests
	AS
	BEGIN
    SELECT r.*, b.Location AS BloodBankLocation
    FROM BloodRequest as br
    JOIN Recipient  as r 
	ON br.RecipientID = r.RecipientID
    JOIN BloodBank as b 
	ON r.Address = b.Location
    WHERE br.Status = 'Pending';
	END;

	--Create Fanction............................................................................................
	Go
	CREATE FUNCTION dbo.GetSameBloodTypeNames ()
	RETURNS @Result TABLE (Name VARCHAR(100))
	AS
	BEGIN
    INSERT INTO @Result (Name)
    SELECT d.Name
    FROM Donor as d
    JOIN Recipient as r 
	ON d.BloodType = r.BloodType;

    RETURN;
	END;
	Go

	--Create Table Valued Fanction.....................................................................

	CREATE FUNCTION GetDonorInformation()
RETURNS TABLE
AS
RETURN
(
    SELECT D.DonorID,
           D.Name AS DonorName,
           D.Age AS DonorAge,
           D.Gender AS DonorGender,
           D.BloodType AS DonorBloodType,
           D.Phone AS DonorPhone,
           D.Address AS DonorAddress,
           B.BagID,
           B.ExpiryDate AS BloodExpiryDate
    FROM Donor as D
    JOIN BloodBag as B ON D.DonorID = B.DonorID
);


Go
--Create Table Valued Fanction.....................................................................

CREATE FUNCTION GetDonorAndRecipientData()
RETURNS @Data TABLE
(
    ID INT,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    BloodType VARCHAR(5),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    BagID INT,
    ExpiryDate DATE,
    RequestID INT,
    RequestDate DATE,
    RequestStatus VARCHAR(20),
    TransfusionID INT,
    TransfusionDate DATE
)
AS
BEGIN
    -- Insert data for donors
    INSERT INTO @Data (ID, Name, Age, Gender, BloodType, Phone, Address)
    SELECT DonorID, Name, Age, Gender, BloodType, Phone, Address
    FROM Donor;

    -- Insert data for blood bags
    INSERT INTO @Data (BagID, BloodType, ExpiryDate)
    SELECT BagID, BloodType, ExpiryDate
    FROM BloodBag;

    -- Insert data for recipients
    INSERT INTO @Data (ID, Name, Age, Gender, BloodType, Phone, Address)
    SELECT RecipientID, Name, Age, Gender, BloodType, Phone, Address
    FROM Recipient;

    -- Insert data for blood requests
    INSERT INTO @Data (RequestID, RequestDate, RequestStatus)
    SELECT RequestID, RequestDate, Status
    FROM BloodRequest;

    -- Insert data for blood transfusions
    INSERT INTO @Data (TransfusionID, TransfusionDate)
    SELECT TransfusionID, TransfusionDate
    FROM BloodTransfusion;

    RETURN;
END;
Go

--Crete Instead of trigger..............................................................  

	CREATE TRIGGER InsteadOfInsert_Donor
	ON Donor
	INSTEAD OF INSERT
	AS
	BEGIN
    DECLARE @MinAge INT = 18; 
    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE Age >= @MinAge
    )
    BEGIN
        INSERT INTO Donor (DonorID, Name, Age, Gender, BloodType, Phone, Address)
        SELECT DonorID, Name, Age, Gender, BloodType, Phone, Address
        FROM inserted
        WHERE Age >= @MinAge;
        
        PRINT 'Insertion successful.';
    END
    ELSE
    BEGIN
        PRINT 'Insertion failed. Donors must be at least 18 years old.';
    END
	END;


