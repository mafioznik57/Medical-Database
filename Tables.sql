CREATE TABLE Departments (
    ID INT PRIMARY KEY,
    HeadDoctor VARCHAR(100),
    Floor INT,
    Phone VARCHAR(20)
);

CREATE TABLE Offices (
    ID INT PRIMARY KEY,
    DoctorID INT,
    RoomNum VARCHAR(10),
    Floor INT,
    Type VARCHAR(50),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(ID)
);

CREATE TABLE Doctors (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepNum INT,
    Gender VARCHAR(10),
    Age INT,
    Speciality VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    FOREIGN KEY (DepNum) REFERENCES Departments(ID)
);

CREATE TABLE Medications (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description TEXT,
    SideEffects TEXT
);

CREATE TABLE Prescriptions (
    ID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    MedicationID INT,
    Dosage VARCHAR(50),
    Frequency VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(ID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(ID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(ID)
);

CREATE TABLE Billing (
    ID INT PRIMARY KEY,
    PatientID INT,
    Date DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    Status VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patient(ID)
);

CREATE TABLE Referrals (
    ID INT PRIMARY KEY,
    FromDoctorID INT,
    ToDepartmentID INT,
    PatientID INT,
    Reason TEXT,
    Date DATE,
    FOREIGN KEY (FromDoctorID) REFERENCES Doctors(ID),
    FOREIGN KEY (ToDepartmentID) REFERENCES Departments(ID),
    FOREIGN KEY (PatientID) REFERENCES Patient(ID)
);

CREATE TABLE Appointments (
    ID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Time TIME,
    Reason TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(ID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(ID)
);

CREATE TABLE Surgeries (
    ID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    SurgeryType VARCHAR(100),
    Date DATE,
    Outcome TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(ID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(ID)
);

CREATE TABLE LabTests (
    ID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    TestType VARCHAR(100),
    Date DATE,
    Result TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(ID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(ID)
);

CREATE TABLE Patient (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Address TEXT,
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE MedicalRoom (
    ID INT PRIMARY KEY,
    Type VARCHAR(100),
    Capacity INT,
    Floor INT,
    Status VARCHAR(20)
);

CREATE TABLE EmergencyContacts (
    ID INT PRIMARY KEY,
    PatientID INT,
    Name VARCHAR(100),
    Relationship VARCHAR(50),
    PhoneNumber VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient(ID)
);

CREATE TABLE MedicalHistory (
    ID INT PRIMARY KEY,
    PatientID INT,
    Condition VARCHAR(100),
    DiagnosisDate DATE,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(ID)
);

CREATE TABLE Insurance (
    ID INT PRIMARY KEY,
    PatientID INT,
    Provider VARCHAR(100),
    PolicyNumber VARCHAR(50),
    Coverage TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(ID)
);
