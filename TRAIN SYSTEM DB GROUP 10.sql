CREATE DATABASE train_system;

USE train_system;

CREATE TABLE passenger (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Gender ENUM('Male', 'Female', 'Other'),
    Age INT
);

CREATE TABLE train (
    TrainID INT PRIMARY KEY AUTO_INCREMENT,
    TrainName VARCHAR(100),
    TrainType ENUM('Express', 'Sleeper'),
    Capacity INT
);

CREATE TABLE station (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    StationName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE route (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    OriginStationID INT,
    DestinationStationID INT,
    Distance FLOAT,
    FOREIGN KEY (OriginStationID) REFERENCES station(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES station(StationID)
);

CREATE TABLE schedule (
    ScheduleID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT,
    RouteID INT,
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    FOREIGN KEY (TrainID) REFERENCES train(TrainID),
    FOREIGN KEY (RouteID) REFERENCES route(RouteID)
);

CREATE TABLE booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    ScheduleID INT,
    BookingDate DATETIME,
    SeatNumber INT,
    BookingStatus ENUM('Confirmed', 'Cancelled'),
    FOREIGN KEY (PassengerID) REFERENCES passenger(PassengerID),
    FOREIGN KEY (ScheduleID) REFERENCES schedule(ScheduleID)
);

CREATE TABLE payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentMethod ENUM('Credit Card', 'Debit Card', 'Cash'),
    Amount INT,
    FOREIGN KEY (BookingID) REFERENCES booking(BookingID)
);




-- Use the train_system database
USE train_system;

-- Insert data into passenger table with Kenyan names and emails
INSERT INTO passenger (Name, Email, Phone, Gender, Age)
VALUES 
('James Mwangi', 'james.mwangi@example.com', '0712345678', 'Male', 30),
('Mary Wanjiru', 'mary.wanjiru@example.com', '0723456789', 'Female', 25),
('Alex Njoroge', 'alex.njoroge@example.com', '0734567890', 'Other', 28);

-- Insert data into train table
INSERT INTO train (TrainName, TrainType, Capacity)
VALUES 
('Express 101', 'Express', 200),
('Sleeper 102', 'Sleeper', 150),
('Express 202', 'Express', 220);

-- Insert data into station table
INSERT INTO station (StationName, Location)
VALUES 
('Nairobi Central', 'Nairobi'),
('Mombasa Terminal', 'Mombasa'),
('Kisumu Station', 'Kisumu');

-- Insert data into route table
INSERT INTO route (OriginStationID, DestinationStationID, Distance)
VALUES 
(1, 2, 480.5),
(1, 3, 350.8),
(2, 3, 200.3);

-- Insert data into schedule table
INSERT INTO schedule (TrainID, RouteID, DepartureTime, ArrivalTime)
VALUES 
(1, 1, '2025-01-15 08:00:00', '2025-01-15 14:00:00'),
(2, 2, '2025-01-15 09:00:00', '2025-01-15 14:30:00'),
(3, 3, '2025-01-15 10:00:00', '2025-01-15 12:30:00');

-- Insert data into booking table
INSERT INTO booking (PassengerID, ScheduleID, BookingDate, SeatNumber, BookingStatus)
VALUES 
(1, 1, '2025-01-10 10:00:00', 12, 'Confirmed'),
(2, 2, '2025-01-11 15:00:00', 45, 'Cancelled'),
(3, 3, '2025-01-12 08:00:00', 78, 'Confirmed');

-- Insert data into payment table
INSERT INTO payment (BookingID, PaymentMethod, Amount)
VALUES 
(1, 'Credit Card', 5000),
(2, 'Cash', 4500),
(3, 'Debit Card', 4000);
