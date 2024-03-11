-- Create the CarConnect database
CREATE DATABASE CarConnect;

-- Use the CarConnect database
USE CarConnect;

-- Create the Customer table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Address TEXT,
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(255),
    RegistrationDate DATE
);

-- Create the Vehicle table
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY IDENTITY,
    Model VARCHAR(255),
    Make VARCHAR(255),
    Year INT,
    Color VARCHAR(50),
    RegistrationNumber VARCHAR(50) UNIQUE,
    Availability BIT,
    DailyRate DECIMAL(10, 2)
);

-- Create the Reservation table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    VehicleID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    TotalCost DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID)
);

-- Create the Admin table
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(255),
    Role VARCHAR(50),
    JoinDate DATE
);
-- Inserting sample values into the Customer table
INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address, Username, Password, RegistrationDate) 
VALUES 
('John', 'Doe', 'john@example.com', '1234567890', '123 Main St', 'johndoe', 'hashedpassword', '2024-03-11'),
('Alice', 'Smith', 'alice@example.com', '0987654321', '456 Elm St', 'alicesmith', 'hashedpassword', '2024-03-11'),
('Bob', 'Johnson', 'bob@example.com', '5555555555', '789 Oak St', 'bobjohnson', 'hashedpassword', '2024-03-11'),
('Emily', 'Brown', 'emily@example.com', '2223334444', '101 Pine St', 'emilybrown', 'hashedpassword', '2024-03-11'),
('Michael', 'Jones', 'michael@example.com', '7778889999', '202 Maple St', 'michaeljones', 'hashedpassword', '2024-03-11'),
('Sarah', 'Davis', 'sarah@example.com', '4444444444', '303 Cedar St', 'sarahdavis', 'hashedpassword', '2024-03-11'),
('David', 'Wilson', 'david@example.com', '6666666666', '404 Birch St', 'davidwilson', 'hashedpassword', '2024-03-11'),
('Laura', 'Taylor', 'laura@example.com', '9999999999', '505 Walnut St', 'laurataylor', 'hashedpassword', '2024-03-11'),
('Chris', 'Anderson', 'chris@example.com', '1112223333', '606 Spruce St', 'chrisanderson', 'hashedpassword', '2024-03-11'),
('Emma', 'Martinez', 'emma@example.com', '3336669999', '707 Fir St', 'emmamartinez', 'hashedpassword', '2024-03-11');

-- Inserting sample values into the Vehicle table
INSERT INTO Vehicle (Model, Make, Year, Color, RegistrationNumber, Availability, DailyRate) 
VALUES 
('Corolla', 'Toyota', 2023, 'Blue', 'XYZ123', 1, 50.00),
('Civic', 'Honda', 2022, 'Red', 'ABC456', 1, 60.00),
('Accord', 'Honda', 2023, 'Black', 'DEF789', 1, 70.00),
('Camry', 'Toyota', 2024, 'White', 'GHI123', 1, 80.00),
('Mustang', 'Ford', 2022, 'Yellow', 'JKL456', 1, 90.00),
('Cruze', 'Chevrolet', 2023, 'Green', 'MNO789', 1, 55.00),
('Fusion', 'Ford', 2024, 'Silver', 'PQR123', 1, 65.00),
('Malibu', 'Chevrolet', 2022, 'Gray', 'STU456', 1, 75.00),
('Sentra', 'Nissan', 2023, 'Purple', 'VWX789', 1, 85.00),
('Altima', 'Nissan', 2024, 'Orange', 'YZA123', 1, 95.00);

-- Inserting sample values into the Reservation table
INSERT INTO Reservation (CustomerID, VehicleID, StartDate, EndDate, TotalCost, Status) 
VALUES 
(1, 1, '2024-03-12 10:00:00', '2024-03-14 10:00:00', 100.00, 'confirmed'),
(2, 2, '2024-03-13 11:00:00', '2024-03-15 11:00:00', 120.00, 'pending'),
(3, 3, '2024-03-14 12:00:00', '2024-03-16 12:00:00', 140.00, 'completed'),
(4, 4, '2024-03-15 13:00:00', '2024-03-17 13:00:00', 160.00, 'confirmed'),
(5, 5, '2024-03-16 14:00:00', '2024-03-18 14:00:00', 180.00, 'pending'),
(6, 6, '2024-03-17 15:00:00', '2024-03-19 15:00:00', 200.00, 'completed'),
(7, 7, '2024-03-18 16:00:00', '2024-03-20 16:00:00', 220.00, 'confirmed'),
(8, 8, '2024-03-19 17:00:00', '2024-03-21 17:00:00', 240.00, 'pending'),
(9, 9, '2024-03-20 18:00:00', '2024-03-22 18:00:00', 260.00, 'completed'),
(10, 10, '2024-03-21 19:00:00', '2024-03-23 19:00:00', 280.00, 'confirmed');

-- Inserting sample values into the Admin table
INSERT INTO Admin (FirstName, LastName, Email, PhoneNumber, Username, Password, Role, JoinDate) 
VALUES 
('Admin', 'User', 'admin@example.com', '9876543210', 'adminuser', 'adminpassword', 'super admin', '2024-03-11'),
('Fleet', 'Manager', 'fleetmanager@example.com', '1234567890', 'fleetmanager', 'fleetpassword', 'fleet manager', '2024-03-11'),
('System', 'Administrator', 'sysadmin@example.com', '5555555555', 'sysadmin', 'syspassword', 'system admin', '2024-03-11'),
('Operations', 'Supervisor', 'ops@example.com', '7777777777', 'opssupervisor', 'opspassword', 'operations supervisor', '2024-03-11'),
('Support', 'Coordinator', 'support@example.com', '9999999999', 'supportcoordinator', 'supportpassword', 'support coordinator', '2024-03-11'),
('Customer', 'Service', 'cs@example.com', '1111111111', 'customerservice', 'cspassword', 'customer service', '2024-03-11'),
('Marketing', 'Manager', 'marketing@example.com', '3333333333', 'marketingmanager', 'marketingpassword', 'marketing manager', '2024-03-11');

/*Interfaces:
• ICustomerService:
• GetCustomerById(customerId)
• GetCustomerByUsername(username)
• RegisterCustomer(customerData)
• UpdateCustomer(customerData)
• DeleteCustomer(customerId)
*/
-- Get customer by ID
SELECT * FROM Customer WHERE CustomerID = 1;

-- Get customer by username
SELECT * FROM Customer WHERE Username = 'johndoe';

-- Register a new customer
INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address, Username, Password, RegistrationDate) 
VALUES ('Ayesha', 'Shahul', 'ayesha@example.com', '8765432189', '123 Paul st', 'ayeshashahul', 'mashedpassword', '2024-03-05');

-- Update customer information
UPDATE Customer 
SET FirstName = 'John', LastName = 'Doe', Email = 'john@example.com', 
    PhoneNumber = '1234567890', Address = '123 Main St', Password = 'hashedpassword' 
WHERE CustomerID = 1;

-- Delete associated records in Reservation table first
DELETE FROM Reservation WHERE CustomerID = 1;

-- Now, delete the customer from the Customer table
DELETE FROM Customer WHERE CustomerID = 1;

/*IVehicleService:
• GetVehicleById(vehicleId)
• GetAvailableVehicles()
• AddVehicle(vehicleData)
• UpdateVehicle(vehicleData)
• RemoveVehicle(vehicleId)*/

-- Get vehicle by ID
SELECT * FROM Vehicle WHERE VehicleID = 1;

-- Get available vehicles
SELECT * FROM Vehicle WHERE Availability = 1;

--Add a new vehicle
INSERT INTO Vehicle (Model, Make, Year, Color, RegistrationNumber, Availability, DailyRate) 
VALUES ('A4', 'Audi', 2023, 'Silver', 'AAA111', 1, 100.00);

-- Update vehicle information for a new vehicle
UPDATE Vehicle 
SET Model = 'Series', Make = 'BMW', Year = 2022, Color = 'Black', 
    RegistrationNumber = 'BBB222', Availability = 1, DailyRate = 110.00
WHERE VehicleID = 9;

--Remove vehicle by id
DELETE FROM Vehicle WHERE VehicleID = 1;

/*IReservationService:
• GetReservationById(reservationId)
• GetReservationsByCustomerId(customerId)
• CreateReservation(reservationData)
• UpdateReservation(reservationData)
• CancelReservation(reservationId)*/

--get reservation by id
SELECT * FROM Reservation WHERE ReservationID = 2;

-- Get reservations by customer ID
SELECT * FROM Reservation WHERE CustomerID = 3;

--create a new reservation
INSERT INTO Reservation (CustomerID, VehicleID, StartDate, EndDate, TotalCost, Status) 
VALUES (11, 11, '2024-03-17 12:00:00', '2024-04-28 12:00:00', 250.00, 'confirmed');

UPDATE Reservation 
SET StartDate = '2024-03-16', EndDate = '2024-03-21', TotalCost = 270.00, 
    Status = 'confirmed' 
WHERE ReservationID = 2;

DELETE FROM Reservation WHERE ReservationID = 2;

--select admin by id
SELECT * FROM Admin WHERE AdminID = 1;

SELECT * FROM Admin WHERE Username = 'adminuser';

INSERT INTO Admin (FirstName, LastName, Email, PhoneNumber, Username, Password, Role, JoinDate) 
VALUES ('John', 'Doe', 'john@example.com', '1234567890', 
        'johndoe', 'hashedpassword', 'super admin', '2024-03-11');

UPDATE Admin 
SET FirstName = 'Jane', LastName = 'Doe', 
    Email = 'jane@example.com', PhoneNumber = '9876543210',
    Username = 'janedoe', Password = 'hashedpassword', 
    Role = 'admin', JoinDate = '2024-03-12' 
WHERE AdminID = 1;

DELETE FROM Admin WHERE AdminID = 1;







