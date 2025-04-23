-- 11. Tests/Lab Results
CREATE TABLE TestsLabResults (
    ID INT PRIMARY KEY,
    PatientID INT,
    TestType VARCHAR(100),
    Date DATE,
    Result TEXT,
    DoctorID INT
);

-- 12. Surgeries
CREATE TABLE Surgeries (
    ID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    SurgeryType VARCHAR(100),
    Date DATE,
    Outcome TEXT
);

-- 13. Emergency Contacts
CREATE TABLE EmergencyContacts (
    ID INT PRIMARY KEY,
    PatientID INT,
    Name VARCHAR(100),
    Relationship VARCHAR(50),
    PhoneNumber VARCHAR(20)
);

-- 14. Medical History
CREATE TABLE MedicalHistory (
    ID INT PRIMARY KEY,
    PatientID INT,
    Condition VARCHAR(100),
    DiagnosisDate DATE,
    Notes TEXT
);

-- 15. Insurance
CREATE TABLE Insurance (
    ID INT PRIMARY KEY,
    PatientID INT,
    ProviderName VARCHAR(100),
    PolicyNumber VARCHAR(50),
    CoverageDetails TEXT
);
