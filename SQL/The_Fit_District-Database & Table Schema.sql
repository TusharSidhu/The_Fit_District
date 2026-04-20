# DATABASE CREATION #
CREATE DATABASE The_Fit_District;
# DATABASE CREATED #
USE The_Fit_District;
# TABLES CREATED #
-- BRANCHES TABLE --
CREATE TABLE Branches(
Branch_ID VARCHAR(200) PRIMARY KEY,
Branch_Name VARCHAR(200),
City TEXT,
Opening_Date DATE
);
-- MEMBERS TABLE --
CREATE TABLE Members(
Member_ID VARCHAR(200) PRIMARY KEY,
Member_Name TEXT,
Gender TEXT,
Age INT,
City TEXT,
Join_Date DATE,
Branch_ID VARCHAR(200),
FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);
-- TRAINERS TABLE --
CREATE TABLE Trainers(
Trainer_ID VARCHAR(200) PRIMARY KEY,
Trainer_Name TEXT,
Specialization TEXT,
XP_Years INT,
Branch_ID VARCHAR(200),
FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);
-- PLANS TABLE --
CREATE TABLE Plans(
Plan_ID VARCHAR(200) PRIMARY KEY,
Plan_Name TEXT,
Price INT,
Duration_Days INT
);
-- SUBSCRIPTIONS TABLE --
CREATE TABLE Subscriptions(
Subscription_ID VARCHAR(200) PRIMARY KEY,
Member_ID VARCHAR(200),
Plan_ID VARCHAR(200),
Start_Date DATE,
End_Date DATE,
Amount_Paid INT,
Branch_ID VARCHAR(200),
FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
FOREIGN KEY (Plan_ID) REFERENCES Plans(Plan_ID),
FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);
-- ATTENDANCE TABLE --
CREATE TABLE Attendance(
Attendance_ID VARCHAR(200) PRIMARY KEY,
Member_ID VARCHAR(200),
Branch_ID VARCHAR(200),
Attendance_Date DATE,
Checkin_Time TIME,
Checkout_Time TIME,
FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);
-- PAYMENTS TABLE -- 
CREATE TABLE Payments(
Payment_ID VARCHAR(200) PRIMARY KEY,
Member_ID VARCHAR(200),
Subscription_ID VARCHAR(200),
Payment_Date DATE,
Amount INT,
Payment_Mode TEXT,
FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
FOREIGN KEY (Subscription_ID) REFERENCES Subscriptions(Subscription_ID)
);