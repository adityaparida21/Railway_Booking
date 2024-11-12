CREATE DATABASE railway;
USE railway;

DROP TABLE IF EXISTS `train`;
CREATE TABLE `train` (
  `TrainNo` int NOT NULL,
  `TrainName` varchar(100) NOT NULL,
  `Source` varchar(100) NOT NULL,
  `Destination` varchar(100) NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  PRIMARY KEY (`TrainNo`),
  KEY `idx_train_source` (`Source`),
  KEY `idx_train_destination` (`Destination`),
  KEY `idx_train_route` (`Source`, `Destination`)
);

INSERT INTO `train` VALUES 
  (12345, 'Rajdhani Express', 'Delhi', 'Mumbai', '16:00:00', '08:00:00'),
  (12346, 'Shatabdi Express', 'Mumbai', 'Bangalore', '08:00:00', '22:00:00'),
  (12347, 'Duronto Express', 'Chennai', 'Kolkata', '23:00:00', '15:00:00'),
  (12348, 'Garib Rath', 'Bangalore', 'Delhi', '20:00:00', '12:00:00'),
  (12349, 'Vande Bharat Express', 'Delhi', 'Varanasi', '06:00:00', '14:00:00'),
  (12350, 'Tejas Express', 'Mumbai', 'Ahmedabad', '06:30:00', '13:30:00'),
  (12351, 'Gatimaan Express', 'Delhi', 'Jhansi', '08:45:00', '15:30:00'),
  (12352, 'Humsafar Express', 'Bangalore', 'Chennai', '16:30:00', '22:30:00');

DROP TABLE IF EXISTS `berth`;
CREATE TABLE `berth` (
  `TrainNo` int NOT NULL,
  `Berth` varchar(10) NOT NULL,
  `SLEEPER` int DEFAULT NULL,
  `AC1` int DEFAULT NULL,
  `AC2` int DEFAULT NULL,
  `AC3` int DEFAULT NULL,
  `AC_Chair` int DEFAULT NULL,
  `Exec_Chair` int DEFAULT NULL,
  KEY `idx_berth_train` (`TrainNo`)
);

INSERT INTO `berth` VALUES 
  (12345, 'LB', 1, 1, 1, 1, 1, 1),
  (12345, 'MB', 2, 2, 2, 2, 2, 2),
  (12345, 'UB', 3, 3, 3, 3, 3, 3),
  (12345, 'SL', 4, 4, 4, 4, 4, 4),
  (12346, 'LB', 1, 1, 1, 1, 1, 1),
  (12346, 'MB', 2, 2, 2, 2, 2, 2),
  (12346, 'UB', 3, 3, 3, 3, 3, 3),
  (12346, 'SL', 4, 4, 4, 4, 4, 4),
  (12347, 'LB', 1, 1, 1, 1, 1, 1),
  (12347, 'MB', 2, 2, 2, 2, 2, 2),
  (12347, 'UB', 3, 3, 3, 3, 3, 3),
  (12347, 'SL', 4, 4, 4, 4, 4, 4),
  (12348, 'LB', 1, 1, 1, 1, 1, 1),
  (12348, 'MB', 2, 2, 2, 2, 2, 2),
  (12348, 'UB', 3, 3, 3, 3, 3, 3),
  (12348, 'SL', 4, 4, 4, 4, 4, 4),
  (12349, 'LB', 1, 1, 1, 1, 1, 1),
  (12349, 'MB', 2, 2, 2, 2, 2, 2),
  (12349, 'UB', 3, 3, 3, 3, 3, 3),
  (12349, 'SL', 4, 4, 4, 4, 4, 4),
  (12350, 'LB', 1, 1, 1, 1, 1, 1),
  (12350, 'MB', 2, 2, 2, 2, 2, 2),
  (12350, 'UB', 3, 3, 3, 3, 3, 3),
  (12350, 'SL', 4, 4, 4, 4, 4, 4),
  (12351, 'LB', 1, 1, 1, 1, 1, 1),
  (12351, 'MB', 2, 2, 2, 2, 2, 2),
  (12351, 'UB', 3, 3, 3, 3, 3, 3),
  (12351, 'SL', 4, 4, 4, 4, 4, 4),
  (12352, 'LB', 1, 1, 1, 1, 1, 1),
  (12352, 'MB', 2, 2, 2, 2, 2, 2),
  (12352, 'UB', 3, 3, 3, 3, 3, 3),
  (12352, 'SL', 4, 4, 4, 4, 4, 4);

DROP TABLE IF EXISTS `coaches`;
CREATE TABLE `coaches` (
  `TrainNo` int NOT NULL,
  `SLEEPER` int DEFAULT 0,
  `AC1` int DEFAULT 0,
  `AC2` int DEFAULT 0,
  `AC3` int DEFAULT 0,
  `AC_Chair` int DEFAULT 0,
  `Exec_Chair` int DEFAULT 0,
  KEY `idx_coach_train` (`TrainNo`)
);

INSERT INTO `coaches` VALUES 
  (12345, 72, 24, 48, 64, 80, 20),
  (12346, 72, 24, 48, 64, 80, 20),
  (12347, 72, 24, 48, 64, 80, 20),
  (12348, 72, 24, 48, 64, 80, 20),
  (12349, 72, 24, 48, 64, 80, 20),
  (12350, 72, 24, 48, 64, 80, 20),
  (12351, 72, 24, 48, 64, 80, 20),
  (12352, 72, 24, 48, 64, 80, 20);

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(100) NOT NULL,
  `CustomerPassword` varchar(100) NOT NULL,
  `CustomerEmail` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CustomerEmail` (`CustomerEmail`),
  KEY `idx_customer_email` (`CustomerEmail`)
);

INSERT INTO `customers` VALUES 
  (1, 'John Doe', 'password123', 'john@example.com'),
  (2, 'Jane Smith', 'password456', 'jane@example.com'),
  (3, 'Bob Wilson', 'password789', 'bob@example.com');


CREATE TABLE `transaction` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `CustomerEmail` varchar(100) NOT NULL,
  `Train` varchar(100) NOT NULL,
  `TrainName` varchar(100) NOT NULL,
  `Source` varchar(100) NOT NULL,
  `Destination` varchar(100) NOT NULL,
  `Departure` time NOT NULL,
  `Arrival` time NOT NULL,
  `Coach` varchar(100) NOT NULL,
  `SeatNo` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `idx_transaction_customerid` (`CustomerID`),
  KEY `idx_transaction_customeremail` (`CustomerEmail`)
)