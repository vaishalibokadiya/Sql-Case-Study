CREATE DATABASE CrimeReportingSystemProject;

USE CrimeReportingSystemProject;

CREATE TABLE Victims (
    victimID INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    dateOfBirth VARCHAR(20),
    gender VARCHAR(10),
    address VARCHAR(200),
    phoneNumber VARCHAR(20)
);

CREATE TABLE Suspects (
    suspectID INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    dateOfBirth VARCHAR(20),
    gender VARCHAR(10),
    address VARCHAR(200),
    phoneNumber VARCHAR(20)
);

CREATE TABLE Incidents (
    incidentID INT PRIMARY KEY,
    incidentType VARCHAR(100),
    incidentDate VARCHAR(20),
    location VARCHAR(250),
    description TEXT,
    status VARCHAR(50),
    victimID INT,
    suspectID INT,
    FOREIGN KEY (victimID) REFERENCES Victims(victimID),
    FOREIGN KEY (suspectID) REFERENCES Suspects(suspectID)
);

CREATE TABLE LawEnforcementAgencies (
    agencyID INT PRIMARY KEY,
    agencyName VARCHAR(150),
    jurisdiction VARCHAR(100),
    contactInformation VARCHAR(200),
);

CREATE TABLE Officers (
    officerID INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    badgeNumber VARCHAR(50),
    rank VARCHAR(50),
    contactInformation VARCHAR(200),
    agencyID INT,
    FOREIGN KEY (agencyID) REFERENCES LawEnforcementAgencies(agencyID)
);

CREATE TABLE Evidence (
    evidenceID INT PRIMARY KEY,
    description TEXT,
    locationFound VARCHAR(200),
    incidentID INT,
    FOREIGN KEY (incidentID) REFERENCES Incidents(incidentID) ON DELETE CASCADE
);


CREATE TABLE Reports (
    reportID INT PRIMARY KEY,
    incidentID INT,
    reportingOfficer INT,
    reportDate VARCHAR(20),
    reportDetails TEXT,
    status VARCHAR(50),
    FOREIGN KEY (incidentID) REFERENCES Incidents(incidentID) ON DELETE CASCADE,
    FOREIGN KEY (reportingOfficer) REFERENCES Officers(officerID)
);

INSERT INTO Victims (victimID, firstName, lastName, dateOfBirth, gender, address, phoneNumber)
VALUES
	(1,'John','Doe','1990-05-15','Male','123 Main St,Cityville','987-555-1234'),
	(2,'Jane', 'Doe','1985-08-20','Female','456 Oak St,Townsville','999-555-5678'),
	(3,'Chandler','Bing','07-09-1982','Male','789 Side St,Villegeville','888-567-8458'),
	(4,'Joey','Tribiani','02-07-1999','Male','789 Pine St, Villagetown','777-888-9999'),
	(5,'Pheobe','Buffay','02-04-1999','Female','567 Elm St, Cityville','111-222-4444'),
	(6,'Monica','Geller','07-12-2000','Female','890 Cedar St, Townsville','222-555-9999'),
	(7,'Rachel','Green','10-07-2000','Female','234 Birch St, Villagetown','555-888-9999'),
	(8,'Ross','Geller','10-09-1990','Male','111 Maple St, Cityville','444-999-0000'),
	(9,'Salena','Gomez','15-09-2000','Female','222 Pine St, Townsville','666-999-0000'),
	(10,'Taylor','Swift','16-09-2000','Female','333 Elm St, Villagetown','777-888-0999');

INSERT INTO Suspects (suspectID, firstName, lastName, dateOfBirth, gender, address, phoneNumber)
VALUES
	(1, 'Michael', 'Williams', '1987-07-08', 'Male', '567 Elm St, Cityville', '555-4321'),
	(2, 'Emily', 'Davis', '1992-04-25', 'Female', '890 Cedar St, Townsville', '555-8765'),
	(3, 'David', 'Anderson', '1980-12-18', 'Male', '234 Birch St, Villagetown', '555-5432'),
	(4, 'Sarah', 'Johnson', '1995-09-02', 'Female', '111 Pine St, Cityville', '555-9876'),
	(5, 'Jason', 'Smith', '1983-03-15', 'Male', '999 Oak St, Townsville', '555-1111'),
	(6, 'Amanda', 'Brown', '1990-11-30', 'Female', '777 Maple St, Villagetown', '555-2222'),
	(7, 'Brian', 'Taylor', '1988-06-20', 'Male', '333 Elm St, Cityville', '555-3333'),
	(8, 'Jessica', 'Miller', '1993-01-12', 'Female', '444 Pine St, Townsville', '555-4444'),
	(9, 'Ryan', 'Clark', '1985-08-05', 'Male', '666 Cedar St, Villagetown', '555-5555'),
	(10, 'Lauren', 'White', '1991-04-18', 'Female', '222 Birch St, Cityville', '555-6666');
	

INSERT INTO Incidents (incidentID, incidentType, incidentDate, location, description, status, victimID, suspectID)
VALUES
	(1, 'Robbery', '2023-01-01', '40.7128, -74.0060', 'Armed robbery at a convenience store', 'Open', 1, 1),
	(2, 'Homicide', '2023-02-15', '34.0522, -118.2437', 'Fatal shooting in a residential area', 'Closed', 2, 2),
	(3, 'Theft', '2023-03-20', '41.8781, -87.6298', 'Car theft in downtown', 'Under Investigation', 3, 3),
	(4, 'Assault', '2023-04-10', '32.7157, -117.1611', 'Physical assault reported at a bar', 'Open', 4, 4),
	(5, 'Burglary', '2023-05-05', '37.7749, -122.4194', 'Residential burglary during daytime', 'Closed', 5, 5),
	(6, 'Fraud', '2023-06-15', '39.9526, -75.1652', 'Identity theft and financial fraud', 'Under Investigation', 6, 6),
	(7, 'Kidnapping', '2023-07-20', '29.7604, -95.3698', 'Suspected kidnapping incident', 'Open', 7, 7),
	(8, 'Vandalism', '2023-08-10', '33.6844, -117.8265', 'Vandalism reported in a public park', 'Closed', 8, 8),
	(9, 'Drug Offense', '2023-09-05', '41.8781, -87.6298', 'Drug-related incident in an alley', 'Under Investigation', 9, 9),
	(10, 'Missing Person', '2023-10-15', '34.0522, -118.2437', 'Report of a missing person', 'Open', 10, 10);


INSERT INTO LawEnforcementAgencies (agencyID, agencyName, jurisdiction, contactInformation)
VALUES
	(1, 'Cityville Police Department', 'Cityville', '123 Police Ave, Cityville, 555-7890'),
	(2, 'Townsville Sheriff''s Office', 'Townsville', '456 Sheriff St, Townsville, 555-0123'),
	(3, 'Villagetown Police Department', 'Villagetown', '789 Cop Ln, Villagetown, 555-2345'),
	(4, 'Hamlet Police Department', 'Hamlet', '456 Cop St, Hamlet, 555-4567'),
	(5, 'Suburbia Security Services', 'Suburbia', '789 Security Ln, Suburbia, 555-6789'),
	(6, 'Metropolis Police Department', 'Metropolis', '123 Hero Ave, Metropolis, 555-8901'),
	(7, 'County Law Enforcement', 'Countywide', '111 County Blvd, Countyville, 555-3456'),
	(8, 'Rural Sheriff''s Department', 'Rural Area', '789 Farm Rd, Countryside, 555-7890'),
	(9, 'Coastal Patrol', 'Coastal Area', '345 Beach Blvd, Coastal City, 555-1234'),
	(10, 'Mountain Rangers', 'Mountain Region', '567 Summit Ln, Mountain Town, 555-5678');

INSERT INTO Officers (officerID, firstName, lastName, badgeNumber, rank, contactInformation, agencyID)
VALUES
	(1, 'John', 'Smith', '12345', 'Detective', '111 Main St, Cityville, 555-1111', 1),
	(2, 'Emily', 'Johnson', '67890', 'Sergeant', '222 Oak St, Townsville, 555-2222', 2),
	(3, 'Michael', 'Brown', '34567', 'Patrol Officer', '333 Pine St, Villagetown, 555-3333', 3),
	(4, 'Jessica', 'Miller', '78901', 'Detective', '444 Elm St, Cityville, 555-4444', 4),
	(5, 'David', 'Clark', '23456', 'Lieutenant', '555 Cedar St, Townsville, 555-5555', 5),
	(6, 'Sarah', 'Williams', '78901', 'Sergeant', '666 Birch St, Villagetown, 555-6666', 6),
	(7, 'Brian', 'Davis', '12345', 'Patrol Officer', '777 Pine St, Cityville, 555-7777', 7),
	(8, 'Amanda', 'Anderson', '67890', 'Captain', '888 Oak St, Townsville, 555-8888', 8),
	(9, 'Jason', 'Taylor', '34567', 'Lieutenant', '999 Maple St, Villagetown, 555-9999', 9),
	(10, 'Lauren', 'White', '78901', 'Patrol Officer', '222 Cedar St, Cityville, 555-0000', 10);

INSERT INTO Evidence (evidenceID, description, locationFound, incidentID)
VALUES
	(1, 'Weapon found at the crime scene', 'Street near 123 Main St, Cityville', 1),
	(2, 'Fingerprints on the door handle', 'Entrance of 456 Oak St, Townsville', 2),
	(3, 'Security camera footage', 'Intersection of 789 Pine St, Villagetown', 3),
	(4, 'Bloodstains in the vehicle', 'Parking lot near 111 Elm St, Cityville', 4),
	(5, 'Broken window glass', 'Outside 555 Oak St, Townsville', 5),
	(6, 'Financial documents', 'Office at 666 Pine St, Villagetown', 6),
	(7, 'Kidnapper''s vehicle', 'Alley near 777 Cedar St, Cityville', 7),
	(8, 'Vandalized property', 'Park at 888 Birch St, Townsville', 8),
	(9, 'Drug paraphernalia', 'Alley near 999 Elm St, Villagetown', 9),
	(10, 'Personal belongings', 'Street near 222 Maple St, Cityville', 10);

INSERT INTO Reports (reportID, incidentID, reportingOfficer, reportDate, reportDetails, status)
VALUES
	(1, 1, 1, '2023-01-02', 'Initial incident report filed', 'Finalized'),
	(2, 2, 2, '2023-02-16', 'Investigation summary report', 'Finalized'),
	(3, 3, 3, '2023-03-21', 'Ongoing investigation report', 'Draft'),
	(4, 4, 4, '2023-04-11', 'Assault incident report', 'Finalized'),
	(5, 5, 5, '2023-05-06', 'Burglary case closed report', 'Finalized'),
	(6, 6, 6, '2023-06-20', 'Fraud investigation report', 'Draft'),
	(7, 7, 7, '2023-07-21', 'Kidnapping case update report', 'Draft'),
	(8, 8, 8, '2023-08-11', 'Vandalism incident report', 'Finalized'),
	(9, 9, 9, '2023-09-06', 'Drug offense investigation report', 'Draft'),
	(10, 10, 10, '2023-10-16', 'Missing person report in progress', 'Draft');

