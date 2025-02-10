--Insert Values In Donar Table.......

INSERT INTO Donor (DonorID, Name, Age, Gender, BloodType, Phone, Address)
VALUES
    (1, 'Md Rahman', 25, 'Male', 'O+', '01911223344', 'Dhaka'),
    (2, 'Fatima Akter', 30, 'Female', 'A+', '01755667788', 'Chittagong'),
    (3, 'Kamal Ahmed', 28, 'Male', 'B+', '01899887766', 'Sylhet'),
    (4, 'Ayesha Khan', 35, 'Female', 'AB+', '01611223344', 'Rajshahi'),
    (5, 'Nasir Uddin', 40, 'Male', 'O-', '01555667788', 'Khulna'),
    (6, 'Taslima Begum', 27, 'Female', 'A-', '01999887766', 'Barishal'),
    (7, 'Rahim Khan', 32, 'Male', 'B-', '01711223344', 'Rangpur'),
    (8, 'Anjuman Ara', 22, 'Female', 'AB-', '01655667788', 'Dinajpur'),
    (9, 'Sakib Hossain', 29, 'Male', 'O+', '01899887766', 'Jessore'),
    (10, 'Liza Rahman', 26, 'Female', 'A+', '01511223344', 'Coxs Bazar'),
    (11, 'Jamil Ahmed', 33, 'Male', 'B+', '01755667788', 'Mymensingh'),
    (12, 'Sabina Akter', 31, 'Female', 'AB+', '01999887766', 'Narayanganj'),
    (13, 'Shahid Khan', 24, 'Male', 'O-', '01611223344', 'Comilla'),
    (14, 'Moumita Islam', 36, 'Female', 'A-', '01555667788', 'Gazipur'),
    (15, 'Arif Hossain', 23, 'Male', 'B-', '01911223344', 'Tangail');

	--Insert Values In Recipient Table Recipient.....

	INSERT INTO Recipient (RecipientID, Name, Age, Gender, BloodType, Phone, Address)
VALUES
    (1, 'Sultana Khan', 35, 'Female', 'O+', '01711223344', 'Dhaka'),
    (2, 'Kamrul Islam', 40, 'Male', 'A+', '01655667788', 'Chittagong'),
    (3, 'Ayesha Begum', 37, 'Female', 'B+', '01999887766', 'Sylhet'),
    (4, 'Rahim Mia', 42, 'Male', 'AB+', '01511223344', 'Rajshahi'),
    (5, 'Rina Akter', 38, 'Female', 'O-', '01755667788', 'Khulna'),
    (6, 'Nur Islam', 45, 'Male', 'A-', '01699887766', 'Barishal'),
    (7, 'Fatema Khan', 36, 'Female', 'B-', '01911223344', 'Rangpur'),
    (8, 'Kabir Hossain', 41, 'Male', 'AB-', '01555667788', 'Dinajpur'),
    (9, 'Amina Akter', 34, 'Female', 'O+', '01799887766', 'Jessore'),
    (10, 'Sakib Rahman', 39, 'Male', 'A+', '01911223344', 'Coxs Bazar'),
    (11, 'Nisha Islam', 43, 'Female', 'B+', '01655667788', 'Mymensingh'),
    (12, 'Jamil Ahmed', 37, 'Male', 'AB+', '01799887766', 'Narayanganj'),
    (13, 'Shamima Akter', 44, 'Female', 'O-', '01511223344', 'Comilla'),
    (14, 'Rahim Hossain', 32, 'Male', 'A-', '01999887766', 'Gazipur'),
    (15, 'Sultana Khanom', 38, 'Female', 'B-', '01711223344', 'Tangail');

	--Insert Values In BloodBag Table.......

	INSERT INTO BloodBag (BagID, BloodType, DonorID, ExpiryDate)
VALUES
    (1, 'O+', 1, '2024-06-30'),
    (2, 'A+', 2, '2024-07-15'),
    (3, 'B+', 3, '2024-08-20'),
    (4, 'AB+', 4, '2024-09-25'),
    (5, 'O-', 5, '2024-10-30'),
    (6, 'A-', 6, '2024-11-05'),
    (7, 'B-', 7, '2024-12-10'),
    (8, 'AB-', 8, '2024-01-15'),
    (9, 'O+', 9, '2024-02-20'),
    (10, 'A+', 10, '2024-03-25'),
    (11, 'B+', 11, '2024-04-30'),
    (12, 'AB+', 12, '2024-05-05'),
    (13, 'O-', 13, '2024-06-10'),
    (14, 'A-', 14, '2024-07-15'),
    (15, 'B-', 15, '2024-08-20');

	--Insert Values In BloodRequest Table.......

	INSERT INTO BloodRequest (RequestID, RecipientID, BloodType, RequestDate, Status)
VALUES
    (1, 1, 'O+', '2024-05-20', 'Pending'),
    (2, 2, 'A+', '2024-05-21', 'Fulfilled'),
    (3, 3, 'B+', '2024-05-22', 'Pending'),
    (4, 4, 'AB+', '2024-05-23', 'Fulfilled'),
    (5, 5, 'O-', '2024-05-24', 'Pending'),
    (6, 6, 'A-', '2024-05-25', 'Fulfilled'),
    (7, 7, 'B-', '2024-05-26', 'Pending'),
    (8, 8, 'AB-', '2024-05-27', 'Fulfilled'),
    (9, 9, 'O+', '2024-05-28', 'Pending'),
    (10, 10, 'A+', '2024-05-29', 'Fulfilled'),
    (11, 11, 'B+', '2024-05-30', 'Pending'),
    (12, 12, 'AB+', '2024-06-01', 'Fulfilled'),
    (13, 13, 'O-', '2024-06-02', 'Pending'),
    (14, 14, 'A-', '2024-06-03', 'Fulfilled'),
    (15, 15, 'B-', '2024-06-04', 'Pending');

	--Insert Values In BloodTransfusion Table.......

	INSERT INTO BloodTransfusion (TransfusionID, RecipientID, DonorID, BagID, TransfusionDate)
VALUES
    (1, 1, 1, 1, '2024-05-22'),
    (2, 2, 2, 2, '2024-05-23'),
    (3, 3, 3, 3, '2024-05-24'),
    (4, 4, 4, 4, '2024-05-25'),
    (5, 5, 5, 5, '2024-05-26'),
    (6, 6, 6, 6, '2024-05-27'),
    (7, 7, 7, 7, '2024-05-28'),
    (8, 8, 8, 8, '2024-05-29'),
    (9, 9, 9, 9, '2024-05-30'),
    (10, 10, 10, 10, '2024-06-01');

	--Insert Values In BloodDonationRecord Table.......
	
INSERT INTO BloodDonationRecord (DonationID, DonorID, BagID, DonationDate)
VALUES
    (1, 1, 1, '2024-05-01'),
    (2, 2, 2, '2024-05-10'),
    (3, 3, 3, '2024-05-15'),
    (4, 4, 4, '2024-05-20'),
    (5, 5, 5, '2024-05-25'),
    (6, 6, 6, '2024-05-30'),
    (7, 7, 7, '2024-06-05'),
    (8, 8, 8, '2024-06-10'),
    (9, 9, 9, '2024-06-15'),
    (10, 10, 10, '2024-06-20');	


	--Insert Values In BloodBank Table.......

	INSERT INTO BloodBank (BankID, Name, Location)
VALUES
    (1, 'Dhaka Blood Bank', 'Dhaka'),
    (2, 'Chittagong Blood Bank', 'Chittagong'),
    (3, 'Sylhet Blood Bank', 'Sylhet'),
    (4, 'Rajshahi Blood Bank', 'Rajshahi'),
    (5, 'Khulna Blood Bank', 'Khulna'),
    (6, 'Barishal Blood Bank', 'Barishal'),
    (7, 'Rangpur Blood Bank', 'Rangpur'),
    (8, 'Dinajpur Blood Bank', 'Dinajpur'),
    (9, 'Jessore Blood Bank', 'Jessore'),
    (10, 'Coxs Bazar Blood Bank', 'Coxs Bazar');

	Select *
	From Donor

 Go

	Select *
	From Recipient

go

	Select *
	From BloodBag
Go

	Select *
	From BloodRequest

Go

	Select *
	From BloodTransfusion

Go

	Select *
	From BloodDonationRecord

Go

	Select *
	From BloodBank

	--Some Query Example from Blood bank Management system:

	Select *
	From BloodBank
	Where Location ='Chittagong'

	go
	Select Name, Age
	From Donor
	Order by age desc

	go

	Select * 
	From Recipient
	where Age between 30 and 40

	go

	Select d.DonorID,d.Name, d.BloodType,r.RecipientID,r.Name,r.BloodType
	from Donor as D
	Join Recipient as R
	on  d.DonorID=r.RecipientID

	go

	Select *
	From Donor
	where Gender like 'Male'

	go

	Select Count(Distinct DonorID) as NumberOfDonors,
	count(DonorID) as TotalDonars
	From Donor

	go

	Select Gender, age, count (*) as Qty
	From Donor
	where Gender like 'Male'
	Group By Rollup (Gender,Age)
	Order By Age desc

	go

	Select Gender, age, count (*) as Qty
	From Donor
	where Gender like 'Male'
	Group By Cube (Gender,Age)
	Order By Age desc
	go
	SELECT 
    Name,
    BloodType,
    CASE 
        WHEN BloodType = 'O+' THEN 'Universal Donor'
        WHEN BloodType = 'O-' THEN 'Universal Donor'
        WHEN BloodType = 'AB+' THEN 'Universal Recipient'
        WHEN BloodType = 'AB-' THEN 'Universal Recipient'
        ELSE 'Regular Donor'
    END AS DonorCategory
FROM Donor;

	  
go

	With MyCte
	as
	(Select *
	From Donor
	where Gender like 'Female'
	)
	Select *
	From MyCte


	select *
	From Recipient
	where RecipientID=(select Status from BloodRequest where Status= 'pending')


	--Call View----

	Go
	Select *
	From BloodDonorDetails
	Go

	-- Call the stored procedure to insert a donor..............................................................................
	EXEC InsertDonor 16,'Ahsan', 28, 'Male', 'A+', '01838696365', 'Chittagong'

	--Call Store Procedure
		go
	EXEC GetPendingBloodRequests;


	--Call Function---------------------
go
	SELECT * 
	FROM dbo.GetSameBloodTypeNames();

	Go

		
	--Call Function..............

	SELECT * FROM GetDonorInformation();
go
	--Call Function..............
go
	SELECT * FROM GetDonorAndRecipientData();
Go
	INSERT INTO Donor (DonorID, Name, Age, Gender, BloodType, Phone, Address)
	VALUES (16, 'Abdullah Noman', 17, 'Male', 'A+', '01628926578', 'Chittagong');


	Go

