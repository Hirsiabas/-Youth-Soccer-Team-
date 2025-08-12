-- =========================================
-- Youth Soccer Team Database - Full Setup
-- Creates DB, Tables, Inserts Sample Data, and Views
-- =========================================

CREATE DATABASE IF NOT EXISTS YouthSoccerTeam;
USE YouthSoccerTeam;

-- Drop tables to start fresh
DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS Attendance;
DROP TABLE IF EXISTS Parents;
DROP TABLE IF EXISTS Coaches;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS TrainingSessions;
DROP TABLE IF EXISTS Players;

-- =============================
-- Table Definitions
-- =============================

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Position VARCHAR(30),
    JerseyNumber INT,
    ContactInfo VARCHAR(100)
);

CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    Opponent VARCHAR(100),
    Date DATE,
    Time TIME,
    Location VARCHAR(100),
    Result VARCHAR(20)
);

CREATE TABLE TrainingSessions (
    SessionID INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    Focus VARCHAR(50),
    Location VARCHAR(100)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    PlayerID INT,
    SessionID INT NULL,
    MatchID INT NULL,
    Status VARCHAR(20),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (SessionID) REFERENCES TrainingSessions(SessionID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);

CREATE TABLE Performance (
    PerformanceID INT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    Goals INT,
    Assists INT,
    Saves INT,
    Rating DECIMAL(3,1),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);

CREATE TABLE Coaches (
    CoachID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Parents (
    ParentID INT PRIMARY KEY,
    Name VARCHAR(100),
    PlayerID INT,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

-- =============================
-- Sample Data Inserts
-- =============================

INSERT INTO Players VALUES
(1, 'Aiden', 'Smith', 12, 'Forward', 9, 'aiden.smith@email.com'),
(2, 'Sophia', 'Johnson', 11, 'Midfielder', 7, 'sophia.johnson@email.com'),
(3, 'Jackson', 'Williams', 13, 'Defender', 5, 'jackson.williams@email.com'),
(4, 'Emma', 'Brown', 12, 'Goalkeeper', 1, 'emma.brown@email.com'),
(5, 'Lucas', 'Jones', 12, 'Midfielder', 10, 'lucas.jones@email.com'),
(6, 'Mia', 'Garcia', 11, 'Forward', 11, 'mia.garcia@email.com'),
(7, 'Ethan', 'Miller', 13, 'Defender', 4, 'ethan.miller@email.com'),
(8, 'Isabella', 'Davis', 12, 'Midfielder', 8, 'isabella.davis@email.com'),
(9, 'Benjamin', 'Rodriguez', 13, 'Forward', 14, 'benjamin.rodriguez@email.com'),
(10, 'Olivia', 'Martinez', 11, 'Goalkeeper', 13, 'olivia.martinez@email.com');

INSERT INTO Matches VALUES
(1, 'Eagles', '2025-08-01', '15:30:00', 'Central Park Field', 'Win'),
(2, 'Tigers', '2025-08-08', '14:00:00', 'Westside Stadium', 'Loss'),
(3, 'Hawks', '2025-08-15', '16:00:00', 'Central Park Field', 'Draw'),
(4, 'Lions', '2025-08-22', '15:00:00', 'Eastside Field', 'Win'),
(5, 'Bears', '2025-08-29', '13:30:00', 'Westside Stadium', 'Loss');

INSERT INTO TrainingSessions VALUES
(1, '2025-07-25', '17:00:00', 'Dribbling', 'Central Park Field'),
(2, '2025-07-27', '17:00:00', 'Passing', 'Central Park Field'),
(3, '2025-07-29', '17:00:00', 'Shooting', 'Central Park Field'),
(4, '2025-07-31', '17:00:00', 'Defense', 'Central Park Field'),
(5, '2025-08-03', '17:00:00', 'Goalkeeping', 'Central Park Field');

INSERT INTO Attendance VALUES
(1, 1, 1, NULL, 'Present'),
(2, 2, 1, NULL, 'Present'),
(3, 3, 1, NULL, 'Absent'),
(4, 4, 1, NULL, 'Present'),
(5, 5, 2, NULL, 'Present'),
(6, 6, 2, NULL, 'Present'),
(7, 7, 2, NULL, 'Absent'),
(8, 8, 3, NULL, 'Present'),
(9, 9, 3, NULL, 'Present'),
(10, 10, 3, NULL, 'Present'),
(11, 1, NULL, 1, 'Played'),
(12, 2, NULL, 1, 'Played'),
(13, 3, NULL, 1, 'Played'),
(14, 4, NULL, 1, 'Played'),
(15, 5, NULL, 1, 'Did Not Play'),
(16, 6, NULL, 2, 'Played'),
(17, 7, NULL, 2, 'Played'),
(18, 8, NULL, 2, 'Did Not Play'),
(19, 9, NULL, 2, 'Played'),
(20, 10, NULL, 2, 'Played');

INSERT INTO Performance VALUES
(1, 1, 1, 2, 1, 0, 8.5),
(2, 2, 1, 1, 0, 0, 7.8),
(3, 3, 1, 0, 0, 1, 7.0),
(4, 4, 1, 0, 0, 5, 9.0),
(5, 6, 2, 1, 1, 0, 8.0),
(6, 7, 2, 0, 0, 2, 7.5),
(7, 9, 2, 3, 1, 0, 9.2),
(8, 10, 2, 0, 0, 4, 8.4);

INSERT INTO Coaches VALUES
(1, 'Michael Thompson', 'Head Coach', 'michael.thompson@email.com', '555-1234'),
(2, 'Laura Wilson', 'Assistant Coach', 'laura.wilson@email.com', '555-5678'),
(3, 'David Lee', 'Goalkeeper Coach', 'david.lee@email.com', '555-8765');

INSERT INTO Parents VALUES
(1, 'Karen Smith', 1, 'karen.smith@email.com', '555-0001'),
(2, 'James Johnson', 2, 'james.johnson@email.com', '555-0002'),
(3, 'Maria Williams', 3, 'maria.williams@email.com', '555-0003'),
(4, 'Nancy Brown', 4, 'nancy.brown@email.com', '555-0004'),
(5, 'Robert Jones', 5, 'robert.jones@email.com', '555-0005'),
(6, 'Patricia Garcia', 6, 'patricia.garcia@email.com', '555-0006'),
(7, 'Charles Miller', 7, 'charles.miller@email.com', '555-0007'),
(8, 'Linda Davis', 8, 'linda.davis@email.com', '555-0008'),
(9, 'Steven Rodriguez', 9, 'steven.rodriguez@email.com', '555-0009'),
(10, 'Barbara Martinez', 10, 'barbara.martinez@email.com', '555-0010');

-- =============================
-- Views Creation
-- =============================

CREATE OR REPLACE VIEW vw_player_match_history AS
SELECT 
    p.PlayerID,
    p.FirstName,
    p.LastName,
    m.MatchID,
    m.Date,
    m.Opponent,
    m.Result,
    perf.Goals,
    perf.Assists,
    perf.Saves,
    perf.Rating
FROM Players p
JOIN Performance perf ON p.PlayerID = perf.PlayerID
JOIN Matches m ON perf.MatchID = m.MatchID
ORDER BY p.PlayerID, m.Date;

CREATE OR REPLACE VIEW vw_training_attendance AS
SELECT 
    ts.SessionID,
    ts.Date AS TrainingDate,
    ts.Focus,
    p.PlayerID,
    p.FirstName,
    p.LastName,
    a.Status
FROM Attendance a
JOIN Players p ON a.PlayerID = p.PlayerID
JOIN TrainingSessions ts ON a.SessionID = ts.SessionID;

CREATE OR REPLACE VIEW vw_top_goal_scorers AS
SELECT 
    p.PlayerID,
    p.FirstName,
    p.LastName,
    COALESCE(SUM(perf.Goals), 0) AS TotalGoals
FROM Players p
LEFT JOIN Performance perf ON p.PlayerID = perf.PlayerID
GROUP BY p.PlayerID
ORDER BY TotalGoals DESC;

CREATE OR REPLACE VIEW vw_player_parent_contacts AS
SELECT 
    p.PlayerID,
    p.FirstName AS PlayerFirstName,
    p.LastName AS PlayerLastName,
    pr.Name AS ParentName,
    pr.Email AS ParentEmail,
    pr.Phone AS ParentPhone
FROM Players p
JOIN Parents pr ON p.PlayerID = pr.PlayerID;

CREATE OR REPLACE VIEW vw_match_roster AS
SELECT 
    m.MatchID,
    m.Date,
    m.Opponent,
    pl.PlayerID,
    pl.FirstName,
    pl.LastName,
    att.Status,
    perf.Goals,
    perf.Assists,
    perf.Saves,
    perf.Rating
FROM Matches m
JOIN Attendance att ON m.MatchID = att.MatchID
JOIN Players pl ON att.PlayerID = pl.PlayerID
LEFT JOIN Performance perf 
    ON perf.MatchID = m.MatchID AND perf.PlayerID = pl.PlayerID;
