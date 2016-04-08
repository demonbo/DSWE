USE CMR
GO

CREATE TABLE Roles
(
	RoleID INT IDENTITY(1,1) NOT NULL,
	RoleName NVARCHAR(50) NOT NULL,
	RoleDescription NVARCHAR(100) NULL,
	CONSTRAINT PK_Roles PRIMARY KEY (RoleID)
	
)
GO

CREATE TABLE Position
(
	PositionID INT IDENTITY(1,1) NOT NULL,
	PositionName NVARCHAR(50) NOT NULL,
	PositionDescription NVARCHAR(100) NULL,
	RoleID INT NOT NULL,
	CONSTRAINT PK_Position PRIMARY KEY (PositionID),
	CONSTRAINT FK_Position_Roles FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
	
)
GO

CREATE TABLE Staff 
(
	StaffID int IDENTITY(1,1) NOT NULL,
	StaffName NVARCHAR(50) NOT NULL,
	Sex NVARCHAR(10) NOT NULL,
	DateofBirth DATE NOT NULL,
	StaffAddress NVARCHAR(100) NULL,
	Phone NVARCHAR(20) NULL,
	Email NVARCHAR(50) NULL,
	PositionID INT NOT NULL,
	CONSTRAINT PK_Staff PRIMARY KEY (StaffID),
	CONSTRAINT FK_Staff_Position FOREIGN KEY (PositionID) REFERENCES Position(PositionID)

)
GO

CREATE TABLE Faculty
(
	FacultyID INT IDENTITY(1,1) NOT NULL,
	FacultyName NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Faculty PRIMARY KEY (FacultyID)
)
GO

CREATE TABLE Course
(
	CourseID INT IDENTITY(1,1) NOT NULL,
	CourseName NVARCHAR(50) NOT NULL,
	CL_ID INT NULL,
	CM_ID INT NULL,
	FacultyID INT NOT NULL,
	CONSTRAINT PK_Course PRIMARY KEY (CourseID),
	CONSTRAINT FK_Course_CL FOREIGN KEY (CL_ID) REFERENCES Staff(StaffID),
	CONSTRAINT FK_Course_CM FOREIGN KEY (CM_ID) REFERENCES Staff(StaffID),
	CONSTRAINT FK_Course_Faculty FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
)
GO

CREATE TABLE CMR
(
	CMR_ID INT IDENTITY(1,1) NOT NULL,
	CMRTittle NVARCHAR(100) NOT NULL,
	CMRDate DATE NOT NULL,
	StudentCount INT NOT NULL,
	PassPercent NVARCHAR(5) NOT NULL,
	FailPercent NVARCHAR(5) NOT NULL,
	CMRState NVARCHAR(10) NULL,
	CMRComment NVARCHAR(MAX) NULL,
	CourseID INT NOT NULL,
	CONSTRAINT PK_CMR PRIMARY KEY (CMR_ID),
	CONSTRAINT FK_CMR_Course FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
	CONSTRAINT CK_CMRState CHECK(CMRState IN ('Waitting','Completed','Closed'))

)
GO

/*Insert into Course*/
INSERT INTO [dbo].[Course]
VALUES('Civil engineering 2015',NULL,NULL,1)
INSERT INTO [dbo].[Course]
VALUES('Mechanical engineering 2015',NULL,NULL,1)
INSERT INTO [dbo].[Course]
VALUES('Electrical engineering 2015',NULL,NULL,1)
INSERT INTO [dbo].[Course]
VALUES('Medical engineering 2015',NULL,NULL,1)

INSERT INTO [dbo].[Course]
VALUES('Nursing 2015',NULL,NULL,2)
INSERT INTO [dbo].[Course]
VALUES('Pharmacy 2015',NULL,NULL,2)
INSERT INTO [dbo].[Course]
VALUES('Public health 2015',NULL,NULL,2)
INSERT INTO [dbo].[Course]
VALUES('Medical science 2015',NULL,NULL,2)

INSERT INTO [dbo].[Course]
VALUES('Accountancy 2015',NULL,NULL,3)
INSERT INTO [dbo].[Course]
VALUES('Economics and finance 2015',NULL,NULL,3)
INSERT INTO [dbo].[Course]
VALUES('International business 2015',NULL,NULL,3)
INSERT INTO [dbo].[Course]
VALUES('Marketing 2015',NULL,NULL,3)

INSERT INTO [dbo].[Course]
VALUES('Mathematics 2015',NULL,NULL,4)
INSERT INTO [dbo].[Course]
VALUES('Physics 2015',NULL,NULL,4)
INSERT INTO [dbo].[Course]
VALUES('Biological science 2015',NULL,NULL,4)
INSERT INTO [dbo].[Course]
VALUES('Chemistry 2015',NULL,NULL,4)

/*Insert into CMR 2013*/
/* Completed*/
INSERT INTO [dbo].[CMR]
VALUES ('CMR Mechanical engineering 2013','2/3/2013',345,'25%','75%','Completed','Fail percent is too high',2)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Eletrical Engineering 2013','3/3/2013',600,'55%','45%','Completed','Pass percent is not high',3)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Medical Science 2013','4/9/2013',800,'80%','20%','Completed','Pass percent is quite OK',8)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Economics and finance 2013','5/3/2013',345,'25%','75%','Completed','Fail percent is too high',10)
/* Closed*/
INSERT INTO [dbo].[CMR]
VALUES ('CMR Medical engineering 2013','5/9/2013',473,'24%','76%','Closed',NULL,4)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Pharmacy 2013','6/8/2013',456,'67%','33%','Closed',NULL,6)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Public health 2013','6/13/2013',683,'45%','55%','Closed',NULL,7)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Accountancy 2013','9/7/2013',723,'27%','73%','Closed',NULL,9)
INSERT INTO [dbo].[CMR]
VALUES ('CMR International business 2013','10/8/2013',417,'57%','43%','Closed',NULL,11)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Marketing 2013','10/11/2013',489,'68%','32%','Closed',NULL,12)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Physics 2013','11/10/2013',864,'78%','22%','Completed','Have many progress',14)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Biological science 2013','12/7/2013',678,'24%','76%','Closed',NULL,15)
GO

/*Insert into CMR 2014*/
/* Completed*/
INSERT INTO [dbo].[CMR]
VALUES ('CMR Civil engineering 2014','3/9/2014',945,'23%','77%','Completed','Fail percent is too high',17)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Public health 2014','4/11/2014',478,'67%','33%','Completed','Teaching quality needs to advanced',23)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Medical science 2014','5/9/2014',710,'80%','20%','Completed','Pass percent is better last year',24)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Marketing 2014 ','5/18/2014',820,'38%','62%','Completed','Teaching quality needs to advanced',28)
/* Closed*/
INSERT INTO [dbo].[CMR]
VALUES ('CMR Electrical engineering 2014 ','6/8/2014',467,'45%','55%','Closed',NULL,19)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Economics and finance 2014','7/3/2014',861,'48%','52%','Closed',NULL,26)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Mathematics 2014','7/4/2014',474,'78%','22%','Closed',NULL,29)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Physics 2014','8/7/2014',725,'35%','65%','Closed',NULL,30)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Chemistry 2014','8/20/2014',574,'67%','33%','Closed',NULL,32)
GO

/*Insert into CMR 2015*/
/* Completed*/
INSERT INTO [dbo].[CMR]
VALUES ('CMR Electrical engineering 2015','4/11/2015',518,'45%','55%','Completed','Fail percent is higher pass one',35)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Medical science 2015','5/8/2015',832,'80%','20%','Completed','Fail percent is too high',40)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Marketing 2015','5/9/2015',725,'78%','22%','Completed','Pass percent is better last year',44)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Physics 2015','6/10/2015',845,'12%','88%','Completed','Fail percent is too high',46)
/* Closed*/
INSERT INTO [dbo].[CMR]
VALUES ('CMR Medical engineering 2015','6/17/2015',689,'34%','66%','Closed',NULL,36)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Economics and finance 2015','6/22/2015',832,'23%','77%','Closed',NULL,42)
INSERT INTO [dbo].[CMR]
VALUES ('CMR International business 2015','7/5/2015',742,'78%','22%','Closed',NULL,43)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Biological science 2015 ','8/9/2015',838,'54%','46%','Closed',NULL,47)
INSERT INTO [dbo].[CMR]
VALUES ('CMR Chemistry 2015 ','9/7/2015',690,'67%','33%','Closed',NULL,48)
GO

/*Procedure*/


CREATE PROCEDURE Procedure_QuantityOfCompletedCMREveryYear
AS
BEGIN
SELECT YEAR([CMRDate]) AS 'Year',COUNT(*) AS 'Completed CMR'
FROM [dbo].[CMR]
WHERE [CMRState]='Completed'
GROUP BY YEAR([CMRDate])
END
GO
EXEC Procedure_QuantityOfCompletedCMREveryYear
GO

CREATE PROCEDURE Procedure_CompletedPercentEveryFacultyByYear @year INT
AS
BEGIN
DECLARE @loop_counter INT,@max_facultyID INT,@faculty_name NVARCHAR(50), @loop_total INT
SELECT @loop_counter=MIN([FacultyID]),@max_facultyID=MAX([FacultyID])
FROM [dbo].[Faculty]
WHILE(@loop_counter IS NOT NULL AND @loop_counter<= @max_facultyID)
BEGIN 
SELECT @faculty_name=[FacultyName]
FROM [dbo].[Faculty]
WHERE [FacultyID]=@loop_counter
SELECT @loop_total=COUNT(*) 
FROM [dbo].[CMR] cmr 
JOIN [dbo].[Course] course 
ON cmr.CourseID=course.CourseID
JOIN [dbo].[Faculty] faculty
ON course.FacultyID=faculty.FacultyID
WHERE faculty.FacultyName=@faculty_name AND YEAR(cmr.[CMRDate])=@year
SELECT @faculty_name AS 'Faculty Name',COUNT(*)*100/@loop_total AS 'Completed Percent'
FROM [dbo].[CMR] cmr 
JOIN [dbo].[Course] course 
ON cmr.CourseID=course.CourseID
JOIN [dbo].[Faculty] faculty
ON course.FacultyID=faculty.FacultyID
WHERE faculty.FacultyName=@faculty_name AND YEAR(cmr.[CMRDate])=@year AND cmr.CMRState='Completed'
SET @loop_counter+=1
END
END
GO

EXEC Procedure_CompletedPercentEveryFacultyByYear @year=2015
GO

CREATE PROCEDURE Procedure_CLOrCMNull
AS
BEGIN
SELECT [CourseName]
FROM [dbo].[Course]
WHERE [CL_ID] IS NULL OR [CM_ID] IS NULL
END
GO
EXEC Procedure_CLOrCMNull
GO

/*Admin insert*/
CREATE PROCEDURE Procedure_InsertIntoCMR @CMRTittle NVARCHAR(100),
                                         @CMRDate DATE,
										 @StudentCount INT,
										 @PassPercent NVARCHAR(5),
										 @FailPercent NVARCHAR(5),
										 @CourseID INT
AS
BEGIN
INSERT INTO [dbo].[CMR]
VALUES(@CMRTittle,@CMRDate,@StudentCount,@PassPercent,@FailPercent,'Waitting',NULL,@CourseID)
END
GO


CREATE PROCEDURE Procedure_InsertIntoStaff @StaffName nvarchar(50),
										   @Sex nvarchar(10),
										   @DateOfBirth date,
										   @StaffAddress nvarchar(100),
										   @Phone nvarchar(20),
										   @Email nvarchar(50),
										   @PositionID int
AS
BEGIN
INSERT INTO [dbo].[Staff]
VALUES(@StaffName,@Sex,@DateOfBirth,@StaffAddress,@Phone,@Email,@PositionID)
 END


CREATE PROCEDURE Procedure_InsertIntoCourse @CourseName NVARCHAR(5),
										    @CL_ID INT,
											@CM_ID INT,
											@FacultyID INT
AS
BEGIN
INSERT INTO [dbo].[Course]
VALUES(@CourseName,@CL_ID,@CM_ID,@FacultyID)
END
Go

CREATE PROCEDURE Procedure_InsertIntoCMR @CMRTittle NVARCHAR(50),
										 @CMRDate DATE,
										 @StudentCount INT,
										 @PassPercent NVARCHAR(50),
										 @FailPercent NVARCHAR (50),
										 @CMRState nvarchar(10),
										 @CMRComment NVARCHAR(MAX),
										 @CourseID INT
AS
BEGIN
INSERT INTO [dbo].[CMR]
VALUES(@CMRTittle,@CMRDate,@StudentCount,@PassPercent,@FailPercent,NULL,NULL,@CourseID)
END








CREATE PROCEDURE Procedure_InsertCMRComment @CMRComment NVARCHAR(MAX),
											@CMR_ID INT
AS
BEGIN
UPDATE [dbo].[CMR]
SET [CMRComment]=@CMRComment,[CMRState]='Completed'
WHERE [CMR_ID]=@CMR_ID
END
GO

/*Procedure Update*/
CREATE PROCEDURE Procedure_UpdateStaff @StaffName nvarchar(50),
										   @Sex nvarchar(10),
										   @DateOfBirth date,
										   @StaffAddress nvarchar(100),
										   @Phone nvarchar(20),
										   @Email nvarchar(50),
										   @PositionID int
as
begin
update [dbo].[Staff]
set [StaffName]=@StaffName,[Sex]=@Sex,[DateofBirth]=@DateOfBirth,[StaffAddress]=@StaffAddress,[Phone]=@Phone,[Email]=@Email,[PositionID]=@PositionID
end
go

CREATE PROCEDURE Procedure_UpdateCourse @CourseName NVARCHAR(5),
										    @CL_ID INT,
											@CM_ID INT,
											@FacultyID INT
AS
BEGIN
UPDATE [dbo].[Course]
SET [CourseName]=@CourseName,[CL_ID]=@CL_ID,[CM_ID]=@CM_ID,[FacultyID]=@FacultyID
END

CREATE PROCEDURE Procedure_UpdateCMR


CREATE PROCEDURE Procedure_CourseNotCMREveryFacultyByYear @year NVARCHAR(50)
AS
BEGIN
DECLARE @loop_counter INT,@max_facultyID INT,@faculty_name NVARCHAR(50), @loop_total INT
SELECT @loop_counter=MIN([FacultyID]),@max_facu[Email]ltyID=MAX([FacultyID])
FROM [dbo].[Faculty]
WHILE(@loop_counter IS NOT NULL AND @loop_counter<= @max_facultyID)
BEGIN 
SELECT @faculty_name=[FacultyName]
FROM [dbo].[Faculty]
WHERE [FacultyID]=@loop_counter
SELECT @faculty_name AS 'Faculty Name',[CourseName]
FROM  [dbo].[Course] course 
JOIN [dbo].[Faculty] faculty
ON course.FacultyID=faculty.FacultyID
WHERE faculty.FacultyName=@faculty_name AND ([CL_ID] IS NULL OR [CM_ID] IS NULL) AND [CourseName] LIKE '%'+@year+'%'
SET @loop_counter+=1
END
END
GO
/*Procedure Delete*/
CREATE PROCEDURE Procedure_DeleteStaff @StaffID int
as
begin
delete [dbo].[Staff]
where [StaffID]=@StaffID
end
go

CREATE PROCEDURE Procedure_DeleteCourse @CourseID int
as
begin
delete [dbo].[Course]
where [CourseID]=@CourseID
end
go

CREATE PROCEDURE Procedure_DeleteCMR @CMR_ID int
as
begin
delete [dbo].[CMR]
where [CMR_ID]=@CMR_ID
end
go

CREATE PROCEDURE Procedure_CMRNotComment
AS
BEGIN
SELECT [CMRTittle],[CMRDate],[CourseName],[FacultyName],[CMRState]
FROM [dbo].[CMR] cmr 
JOIN [dbo].[Course] course 
ON cmr.CourseID=course.CourseID
JOIN [dbo].[Faculty] faculty
ON course.FacultyID=faculty.FacultyID
WHERE cmr.CMRComment IS NULL
END
GO
EXEC Procedure_CMRNotComment
GO

/*Trigger*/
CREATE TRIGGER Trigger_CloseComment
ON [dbo].[CMR]
AFTER INSERT,UPDATE
AS
BEGIN
UPDATE [dbo].[CMR]
SET [CMRState]='Closed' 
WHERE [CMRDate]<= GETDATE()-14 AND [CMRComment] IS NULL AND [CMRState]='Waitting'
END
GO










	
	


