CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Employee (
    SSN int primary key identity(1,1),
    FirstName nvarchar(20),
    LastName nvarchar(20),
    BirthDate date,
    Gender bit default 0,
    Supervise int,
    DepNumber int 
);

CREATE TABLE Department (
    DepNumber int primary key identity(1,1),
    DepName nvarchar(20),
    SSN int, 
    HireDate DATE,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

ALTER TABLE Employee
ADD FOREIGN KEY (DepNumber) REFERENCES Department(DepNumber);

ALTER TABLE Employee
ADD FOREIGN KEY (Supervise) REFERENCES Employee(SSN);

CREATE TABLE Location (
    DepNumber int,
    Location nvarchar(20),
    PRIMARY KEY (DepNumber, Location),
    FOREIGN KEY (DepNumber) REFERENCES Department(DepNumber)
);

CREATE TABLE Project (
    ProjectNumber int primary key identity(1,1),
    ProjectName nvarchar(20),
    City nvarchar(20),
    Location nvarchar(20),
    DepNumber int,
    FOREIGN KEY (DepNumber) REFERENCES Department(DepNumber)
);

CREATE TABLE Work (
    SSN int,
    ProjectNumber int,
    Hours int,
    PRIMARY KEY (SSN, ProjectNumber),
  FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (ProjectNumber) REFERENCES Project(ProjectNumber)
);

CREATE TABLE Dependent (
    SSN int,
    DependentName nvarchar(20)PRIMARY KEY,
    Gender int,
	BirthDate date,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

DROP TABLE Dependent;
-----------------------------------------------------
--SHOW ALL THE TABLES
select * from Employee
select * from Department
select * from Location
select * from Project
select * from Work
select * from Department
---------------------------------------------------
-- Insert Employees
select * from Employee
---------------------------------------------------
INSERT INTO Employee (FirstName, LastName, BirthDate, Gender)
VALUES
('Ali', 'Sultan', '1990-05-10', 1),
('Sara', 'Hassan', '1995-07-12', 0),
('Khalid', 'Omar', '1988-02-20', 1),
('Noor', 'Salim', '1993-11-01', 0),
('Mona', 'Fahad', '`1998-09-09', 0);
-----------------------------------------------------
-- Insert Departments
select * from Department
-----------------------------------------------------
INSERT INTO Department (DepName, SSN, HireDate) VALUES

-----------------------------------------------------

('IT', 1, '2020-01-01'),
('HR', 2, '2021-03-10'),
('Finance', 3, '2019-06-25'),
('Marketing', 4, '2022-07-19'),
('Operations', 5, '2018-11-11');

-- Update Employee to assign Departments and Supervisors
UPDATE Employee SET DepNumber = 1, Supervise = NULL WHERE SSN = 1;
UPDATE Employee SET DepNumber = 2, Supervise = 1 WHERE SSN = 2;
UPDATE Employee SET DepNumber = 3, Supervise = 1 WHERE SSN = 3;
UPDATE Employee SET DepNumber = 4, Supervise = 3 WHERE SSN = 4;
UPDATE Employee SET DepNumber = 5, Supervise = 2 WHERE SSN = 5;
-------------------------------------------------------------
-- Insert Locations
select * from Location
INSERT INTO Location (DepNumber, Location)
------------------------------------
VALUES
(1, 'Muscat'),
(2, 'Sohar'),
(3, 'Salalah'),
(4, 'Nizwa'),
(5, 'Sur');
----------------------------------------------------------
-- Insert Projects
select * from Project
INSERT INTO Project (ProjectName, City, Location, DepNumber)

----------------------------------------------------------
VALUES
('WebsiteRevamp', 'Muscat', 'Muscat', 1),
('EmployeeWellness', 'Sohar', 'Sohar', 2),
('Budget2025', 'Salalah', 'Salalah', 3),
('NewAdCampaign', 'Nizwa', 'Nizwa', 4),
('WarehouseUpgrade', 'Sur', 'Sur', 5);
-----------------------------------------------------------
-- Insert Work records
select * from Work
INSERT INTO Work (SSN, ProjectNumber, Hours)

----------------------------------------------------------
VALUES
(1, 1, 40),
(2, 2, 35),
(3, 3, 30),
(4, 4, 25),
(5, 5, 20);
------------------------------------------------------------
-- Insert Dependents
select * from Department
INSERT INTO Dependent (SSN, DependentName, Gender, BirthDate)

-------------------------------------------------------------
VALUES
(1, 'Layla', 0, '2015-08-10'),
(1, 'Hamad', 1, '2017-04-22'),
(2, 'Omar', 1, '2020-03-30'),
(3, 'Aisha', 0, '2012-11-15'),
(5, 'Salem', 1, '2019-05-25');
---------------------------------------------------------------
-- UPDATE 
-- Update Sara Hassan's last name to 'Al-Khalili'
UPDATE Employee SET LastName = 'Al-Khalili' WHERE FirstName = 'Sara' AND LastName = 'Hassan';

-- Increase hours worked by Khalid Omar on Project 3 to 45
UPDATE Work SET Hours = 45 WHERE SSN = 3 AND ProjectNumber = 3;

---------------------------------------------------------------
-- SELECT
-- Select all employees
SELECT * FROM Employee;

-------------------------------------------------------------
-- DELETE 
-- Delete dependent 'Hamad' of employee 1
DELETE FROM Dependent WHERE SSN = 1 AND DependentName = 'Hamad';

-- Delete Project 5
DELETE FROM Work WHERE ProjectNumber = 5;
DELETE FROM Project WHERE ProjectNumber = 5;
----------------------------------------------------------


-- the problem that i face during writing the codes 

--1- proplem 1 :
--I forget the syntax of the table creation codes for example (,)

--2- problem 2 :
-- the table didt shows with me so i have to refreash it and they will appear

--3-proplem 3:
-- I didt know that i should to excute each step that i do so i face lots of problem 

--4-figer 1: 
-- use drop to delete table and then creat another (modify the previos one )

--4-problem 4:
-- i cant delete the foregon key , first i will break it from table then delete it .




