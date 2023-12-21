CREATE DATABASE School;

USE School;

CREATE TABLE CourseMaster (
    CID INT PRIMARY KEY,
    CourseName VARCHAR(40) NOT NULL,
    Category CHAR(1) CHECK (Category IN ('B', 'M', 'A')),
    Fee SMALLMONEY NOT NULL CHECK (Fee >= 0) 
);

CREATE TABLE StudentMaster (
    SID TINYINT PRIMARY KEY,
    StudentName VARCHAR(40) NOT NULL,
    Origin CHAR(1) NOT NULL CHECK (Origin IN ('L', 'F')),
    Type CHAR(1) NOT NULL CHECK (Type IN ('U', 'G'))
);

CREATE TABLE EnrollmentMaster (
    CID INT NOT NULL,
    SID TINYINT NOT NULL,
    DOE DATETIME NOT NULL,
    FWF BIT NOT NULL,
    Grade CHAR(1) CHECK (Grade IN ('O', 'A', 'B', 'C')), 

    PRIMARY KEY (CID, SID),
    FOREIGN KEY (CID) REFERENCES CourseMaster (CID),
    FOREIGN KEY (SID) REFERENCES StudentMaster (SID)
);

INSERT INTO CourseMaster (CID, CourseName, Category, Fee)
VALUES
    (1, 'Introduction to Programming', 'B', 100.00),
    (2, 'Data Structures', 'M', 150.00),
    (3, 'Algorithms', 'A', 200.00),
    (4, 'Web Development', 'B', 120.00),
    (5, 'Database Design', 'M', 180.00),
    (6, 'Machine Learning', 'A', 250.00),
    (7, 'Computer Networks', 'B', 80.00),
    (8, 'Analysis and Design of Algorithm', 'A', 220.00),
    (9, 'Data Science', 'B', 90.00),
    (10, 'Mathematics', 'M', 160.00);

INSERT INTO StudentMaster (SID, StudentName, Origin, Type)
VALUES
    (1, 'John Doe', 'L', 'U'),
    (2, 'Jane Doe', 'F', 'G'),
    (3, 'Chandler Bing', 'L', 'U'),
    (4, 'Monica Geller', 'F', 'G'),
    (5, 'Ross Geller', 'L', 'U'),
    (6, 'Rachel Green', 'F', 'G'),
    (7, 'Joey Tribiani', 'L', 'U'),
    (8, 'Taylor Swift', 'F', 'G'),
    (9, 'Pheobe Buffay', 'L', 'U'),
    (10, 'Vaibhav Sharma', 'F', 'G');

INSERT INTO EnrollmentMaster (CID, SID, DOE, FWF, Grade)
VALUES
    (1, 1, '2023-01-01', 0, 'A'),
    (2, 2, '2023-02-02', 1, 'B'),
    (3, 3, '2023-03-03', 0, 'A'),
    (4, 4, '2023-04-04', 1, 'C'),
    (5, 5, '2023-05-05', 0, 'B'),
    (6, 6, '2023-06-06', 1, 'A'),
    (7, 7, '2023-07-07', 0, 'B'),
    (8, 8, '2023-08-08', 1, 'C'),
    (9, 9, '2023-09-09', 0, 'A'),
    (10, 10, '2023-10-10', 1, 'B');

SELECT * FROM StudentMaster;
SELECT * FROM CourseMaster;
SELECT * FROM EnrollmentMaster;

-- 1.	List the course wise total no. of Students enrolled. Provide the information only for students of foreign origin and only if the total exceeds 10.
SELECT C.CourseName, COUNT(E.SID) AS TotalNoOfStudents
FROM CourseMaster C
JOIN EnrollmentMaster E ON C.CID = E.CID
JOIN StudentMaster S ON E.SID = S.SID
WHERE S.Origin = 'F'
GROUP BY C.CourseName
HAVING COUNT(E.SID) > 10;

-- 2.	List the names of the Students who have not enrolled for Java course.
SELECT StudentName
FROM StudentMaster
WHERE SID NOT IN (SELECT SID FROM EnrollmentMaster WHERE CID = (SELECT CID FROM CourseMaster WHERE CourseName = 'Java'));

-- 3.	List the name of the advanced course where the enrollment by foreign students is the highest.	
SELECT C.CourseName
FROM CourseMaster C
JOIN EnrollmentMaster E ON C.CID = E.CID
JOIN StudentMaster S ON E.SID = S.SID
WHERE C.Category = 'A' AND S.Origin = 'F'
GROUP BY C.CourseName
ORDER BY COUNT(S.SID) DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

-- 4.	List the names of the students who have enrolled for at least one basic course in the current month.
SELECT DISTINCT S.StudentName
FROM StudentMaster S
JOIN EnrollmentMaster E ON S.SID = E.SID
JOIN CourseMaster C ON E.CID = C.CID
WHERE C.Category = 'B' AND MONTH(E.DOE) = MONTH(GETDATE());

-- 5.	List the names of the Undergraduate, local students who have got a �C� grade in any basic course.
SELECT DISTINCT S.StudentName
FROM StudentMaster S
JOIN EnrollmentMaster E ON S.SID = E.SID
JOIN CourseMaster C ON E.CID = C.CID
WHERE S.Type = 'U' AND S.Origin = 'L' AND C.Category = 'B' AND E.Grade = 'C';

-- 6.	List the names of the courses for which no student has enrolled in the month of May 2020.
SELECT CourseName
FROM CourseMaster
WHERE CID NOT IN (SELECT CID FROM EnrollmentMaster WHERE MONTH(DOE) = 5 AND YEAR(DOE) = 2020);

-- 7.	List name, Number of Enrollments and Popularity for all Courses. Popularity has to be displayed as �High� if number of enrollments is higher than 50,  �Medium� if greater than or equal to 20 and less than 50, and �Low� if the no.  Is less than 20.
SELECT
    C.CourseName,
    COUNT(E.SID) AS NumEnrollments,
    CASE
        WHEN COUNT(E.SID) > 50 THEN 'High'
        WHEN COUNT(E.SID) >= 20 AND COUNT(E.SID) <= 50 THEN 'Medium'
        ELSE 'Low'
    END AS Popularity
FROM CourseMaster C
LEFT JOIN EnrollmentMaster E ON C.CID = E.CID
GROUP BY C.CourseName;

-- 8.	List the most recent enrollment details with information on Student Name, Course name and age of enrollment in days.
SELECT
    S.StudentName,
    C.CourseName,
    E.DOE,
    DATEDIFF(DAY, E.DOE, GETDATE()) AS AgeOfEnrollmentInDays
FROM EnrollmentMaster E
JOIN StudentMaster S ON E.SID = S.SID
JOIN CourseMaster C ON E.CID = C.CID
ORDER BY E.DOE DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

-- 9.	List the names of the Local students who have enrolled for exactly 3 basic courses. 
SELECT S.StudentName
FROM StudentMaster S
JOIN EnrollmentMaster E ON S.SID = E.SID
JOIN CourseMaster C ON E.CID = C.CID
WHERE S.Origin = 'L' AND C.Category = 'B'
GROUP BY S.StudentName
HAVING COUNT(C.CID) = 1;

-- 10.	List the names of the Courses enrolled by all (every) students.
SELECT C.CourseName
FROM CourseMaster C
JOIN EnrollmentMaster E ON C.CID = E.CID
JOIN StudentMaster S ON E.SID = S.SID
GROUP BY C.CourseName
HAVING COUNT(DISTINCT S.SID) = (SELECT COUNT(*) FROM StudentMaster);

-- 11.	For those enrollments for which fee have been waived, provide the names of students who have got �O� grade.
SELECT S.StudentName
FROM StudentMaster S
JOIN EnrollmentMaster E ON S.SID = E.SID
WHERE E.FWF = 1 AND E.Grade = 'O';

-- 12.	List the names of the foreign, undergraduate students who have got grade �C� in any basic course.
SELECT DISTINCT S.StudentName
FROM StudentMaster S
JOIN EnrollmentMaster E ON S.SID = E.SID
JOIN CourseMaster C ON E.CID = C.CID
WHERE S.Origin = 'F' AND S.Type = 'U' AND C.Category = 'B' AND E.Grade = 'C';

-- 13.	List the course name, total no. of enrollments in the current month.
SELECT C.CourseName, COUNT(E.SID) AS TotalEnrollments
FROM CourseMaster C
LEFT JOIN EnrollmentMaster E ON C.CID = E.CID AND MONTH(E.DOE) = MONTH(GETDATE())
GROUP BY C.CourseName;





