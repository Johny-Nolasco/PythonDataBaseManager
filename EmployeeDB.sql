-- EmployeeDB.sql
-- SQL script to create a basic Employee database schema

CREATE DATABASE IF NOT EXISTS EmployeeDB;
USE EmployeeDB;

-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    HireDate DATE NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table: Positions
CREATE TABLE Positions (
    PositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionTitle VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table: EmployeePositions
CREATE TABLE EmployeePositions (
    EmployeeID INT,
    PositionID INT,
    StartDate DATE NOT NULL,
    EndDate DATE,
    PRIMARY KEY (EmployeeID, PositionID, StartDate),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

-- Sample data for Departments
INSERT INTO Departments (DepartmentName) VALUES
('Human Resources'),
('Engineering'),
('Sales'),
('Marketing'),
('Finance'),
('Customer Support');

-- Sample data for Employees
INSERT INTO Employees (FirstName, LastName, Email, HireDate, DepartmentID, Salary) VALUES
('Alice', 'Smith', 'alice.smith@example.com', '2020-01-15', 1, 60000.00),
('Bob', 'Johnson', 'bob.johnson@example.com', '2019-03-22', 2, 85000.00),
('Carol', 'Williams', 'carol.williams@example.com', '2021-07-01', 3, 55000.00),
('David', 'Brown', 'david.brown@example.com', '2018-11-10', 2, 95000.00),
('Eve', 'Davis', 'eve.davis@example.com', '2022-02-18', 4, 62000.00),
('Frank', 'Miller', 'frank.miller@example.com', '2020-09-30', 5, 78000.00),
('Grace', 'Wilson', 'grace.wilson@example.com', '2021-12-05', 6, 48000.00),
('Henry', 'Moore', 'henry.moore@example.com', '2017-06-23', 2, 105000.00),
('Ivy', 'Taylor', 'ivy.taylor@example.com', '2019-08-14', 3, 57000.00),
('Jack', 'Anderson', 'jack.anderson@example.com', '2023-03-10', 6, 45000.00),
('Karen', 'Thomas', 'karen.thomas@example.com', '2021-04-12', 1, 63000.00),
('Leo', 'Martin', 'leo.martin@example.com', '2020-05-20', 2, 91000.00),
('Mona', 'Clark', 'mona.clark@example.com', '2019-09-17', 3, 56000.00),
('Nina', 'Lewis', 'nina.lewis@example.com', '2022-08-25', 4, 65000.00),
('Oscar', 'Walker', 'oscar.walker@example.com', '2018-10-05', 5, 80000.00),
('Paul', 'Hall', 'paul.hall@example.com', '2021-11-11', 6, 47000.00),
('Quinn', 'Allen', 'quinn.allen@example.com', '2020-02-28', 2, 99000.00),
('Rita', 'Young', 'rita.young@example.com', '2019-12-19', 3, 59000.00),
('Sam', 'King', 'sam.king@example.com', '2023-01-07', 4, 61000.00),
('Tina', 'Scott', 'tina.scott@example.com', '2022-03-15', 5, 82000.00);

-- Sample data for Positions
INSERT INTO Positions (PositionTitle, DepartmentID) VALUES
('HR Manager', 1),
('Software Engineer', 2),
('Sales Representative', 3),
('Marketing Specialist', 4),
('Finance Analyst', 5),
('Customer Support Agent', 6),
('Lead Engineer', 2),
('Sales Manager', 3),
('Chief Marketing Officer', 4),
('Support Supervisor', 6);

-- Sample data for EmployeePositions
INSERT INTO EmployeePositions (EmployeeID, PositionID, StartDate, EndDate) VALUES
(1, 1, '2020-01-15', NULL),
(2, 2, '2019-03-22', NULL),
(3, 3, '2021-07-01', NULL),
(4, 2, '2018-11-10', '2022-12-31'),
(4, 7, '2023-01-01', NULL),
(5, 4, '2022-02-18', NULL),
(6, 5, '2020-09-30', NULL),
(7, 6, '2021-12-05', NULL),
(8, 7, '2017-06-23', NULL),
(9, 8, '2019-08-14', NULL),
(10, 6, '2023-03-10', NULL),
(3, 8, '2022-01-01', '2022-12-31'),
(7, 10, '2022-06-01', NULL),
(5, 9, '2023-01-01', NULL),
(11, 1, '2021-04-12', NULL),
(12, 2, '2020-05-20', NULL),
(13, 3, '2019-09-17', NULL),
(14, 4, '2022-08-25', NULL),
(15, 5, '2018-10-05', NULL),
(16, 6, '2021-11-11', NULL),
(17, 7, '2020-02-28', NULL),
(18, 8, '2019-12-19', NULL),
(19, 4, '2023-01-07', NULL),
(20, 5, '2022-03-15', NULL);