
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100)
);


CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1)
);


CREATE TABLE Visits (
    VisitID INT PRIMARY KEY,
    DoctorID INT,
    PatientID INT,
    VisitDate DATE,
    Diagnosis VARCHAR(255),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);


CREATE TABLE Diseases (
    DiseaseID INT PRIMARY KEY,
    VisitID INT,
    DiseaseName VARCHAR(100),
    Treatment VARCHAR(255),
    FOREIGN KEY (VisitID) REFERENCES Visits(VisitID)
);


CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(50) UNIQUE
);


CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    PreferredRegionID INT,
    FOREIGN KEY (PreferredRegionID) REFERENCES Regions(RegionID)
);


CREATE TABLE Posts (
    PostID INT PRIMARY KEY,
    Title VARCHAR(255),
    Text TEXT,
    UserID INT,
    Location VARCHAR(100),
    RegionID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);


CREATE TABLE PostCategories (
    PostID INT,
    CategoryID INT,
    PRIMARY KEY (PostID, CategoryID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


CREATE TABLE Teams (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(50) UNIQUE
);


CREATE TABLE Goals (
    GoalID INT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    ScoredAt TIMESTAMP,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);


CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(50),
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);


CREATE TABLE Referees (
    RefereeID INT PRIMARY KEY,
    RefereeName VARCHAR(50) UNIQUE
);

CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    Team1ID INT,
    Team2ID INT,
    RefereeID INT,
    MatchDate DATE,
    Result VARCHAR(50),
    FOREIGN KEY (Team1ID) REFERENCES Teams(TeamID),
    FOREIGN KEY (Team2ID) REFERENCES Teams(TeamID),
    FOREIGN KEY (RefereeID) REFERENCES Referees(RefereeID)
);


CREATE TABLE Seasons (
    SeasonID INT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE
);


CREATE TABLE Standings (
    TeamID INT,
    SeasonID INT,
    Points INT,
    Wins INT,
    Draws INT,
    Losses INT,
    PRIMARY KEY (TeamID, SeasonID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID)
);
