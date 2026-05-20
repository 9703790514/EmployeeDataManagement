-- ===================================================
-- Employee Data Management System - Database Schema
-- ===================================================
-- MySQL Database Script
-- ===================================================

-- Create Database (if using local MySQL)
CREATE DATABASE IF NOT EXISTS employee_management;
USE employee_management;

-- ===================================================
-- Table: users
-- Purpose: Store user authentication and registration details
-- ===================================================
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===================================================
-- Table: employee
-- Purpose: Store employee information
-- ===================================================
CREATE TABLE IF NOT EXISTS employee (
    employeeId VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    fathersName VARCHAR(100),
    dateOfBirth DATE,
    salary DECIMAL(10, 2) NOT NULL,
    address TEXT,
    phoneNumber VARCHAR(15) NOT NULL,
    emailId VARCHAR(100) NOT NULL UNIQUE,
    highestEducation VARCHAR(100),
    designation VARCHAR(100) NOT NULL,
    aadharNo VARCHAR(12) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (emailId),
    INDEX idx_phone (phoneNumber),
    INDEX idx_aadhar (aadharNo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===================================================
-- Sample Data for Testing
-- ===================================================

-- Insert sample users (password: admin123)
-- NOTE: In production, passwords should be hashed using BCrypt or similar
INSERT INTO users (full_name, email, phone, password) VALUES
('Admin User', 'admin@example.com', '9876543210', 'admin123'),
('John Doe', 'john.doe@example.com', '9876543211', 'password123'),
('Jane Smith', 'jane.smith@example.com', '9876543212', 'password123');

-- Insert sample employees
INSERT INTO employee (employeeId, name, fathersName, dateOfBirth, salary, address, 
                     phoneNumber, emailId, highestEducation, designation, aadharNo) VALUES
('EMP001', 'Rajesh Kumar', 'Suresh Kumar', '1990-05-15', 50000.00, 
 '123 MG Road, Bangalore', '9876543220', 'rajesh.kumar@company.com', 
 'B.Tech', 'Software Engineer', '123456789012'),
 
('EMP002', 'Priya Sharma', 'Ramesh Sharma', '1992-08-22', 45000.00, 
 '456 Park Street, Delhi', '9876543221', 'priya.sharma@company.com', 
 'MCA', 'Senior Developer', '123456789013'),
 
('EMP003', 'Amit Patel', 'Vijay Patel', '1988-03-10', 60000.00, 
 '789 Ring Road, Mumbai', '9876543222', 'amit.patel@company.com', 
 'M.Tech', 'Tech Lead', '123456789014'),
 
('EMP004', 'Sneha Reddy', 'Krishna Reddy', '1995-11-30', 40000.00, 
 '321 Lake View, Hyderabad', '9876543223', 'sneha.reddy@company.com', 
 'B.Sc', 'Junior Developer', '123456789015'),
 
('EMP005', 'Vikram Singh', 'Rajendra Singh', '1987-07-18', 75000.00, 
 '654 Mall Road, Pune', '9876543224', 'vikram.singh@company.com', 
 'MBA', 'Project Manager', '123456789016');

-- ===================================================
-- Display Tables
-- ===================================================
SELECT 'Users Table Created and Populated' as Status;
SELECT * FROM users;

SELECT 'Employee Table Created and Populated' as Status;
SELECT * FROM employee;

-- ===================================================
-- End of Schema
-- ===================================================
