-- Create Academic_management_system Database
CREATE DATABASE Academic_management_system;

-- Use Academic_management_system Database
USE Academic_management_system;

-- Create StudentInfo Table
CREATE TABLE StudentInfo (
STU_ID INT PRIMARY KEY,
STU_NAME VARCHAR(50),
DOB DATE,
PHONE_NO BIGINT,
EMAIL_ID VARCHAR(50),
ADDRESS VARCHAR(100)
);

-- Create CoursesInfo Table
CREATE TABLE CoursesInfo (
COURSE_ID INT PRIMARY KEY,
COURSE_NAME VARCHAR(50),
COURSE_INSTRUCTOR_NAME VARCHAR(50)
);

-- Create EnrollmentInfo Table
CREATE TABLE EnrollmentInfo (
ENROLLMENT_ID INT PRIMARY KEY,
STU_ID INT,
COURSE_ID INT,
ENROLL_STATUS VARCHAR(15),
FOREIGN KEY(STU_ID) REFERENCES StudentInfo(STU_ID),
FOREIGN KEY(COURSE_ID) REFERENCES CoursesInfo (COURSE_ID)
);

-- Insert data into StudentInfo
INSERT INTO StudentInfo VALUES 
(1, 'John Doe', '2002-05-15', 9876543210, 'john.doe@example.com', '123 Main St, City'),
(2, 'Jane Smith', '2001-09-22', 9123456780, 'jane.smith@example.com', '456 Park Ave, City'),
(3, 'Alice Johnson', '2003-02-10', 9988776655, 'alice.johnson@example.com', '789 Lake Rd, City'),
(4, 'Michael Brown', '2000-11-03', 9012345678, 'michael.brown@example.com', '321 Hill St, City'),
(5, 'Emily Davis', '2002-07-19', 9345678901, 'emily.davis@example.com', '654 River Rd, City'),
(6, 'David Wilson', '2001-03-25', 9765432109, 'david.wilson@example.com', '987 Sunset Blvd, City'),
(7, 'Sophia Martinez', '2003-12-08', 9456123780, 'sophia.martinez@example.com', '159 Pine St, City');

-- Insert data into CoursesInfo
INSERT INTO CoursesInfo VALUES 
(101, 'Computer Science', 'Dr. Alan Turing'),
(102, 'Mathematics', 'Dr. Isaac Newton'),
(103, 'Physics', 'Dr. Albert Einstein'),
(104, 'Chemistry', 'Dr. Marie Curie'),
(105, 'English Literature', 'Prof. William Shakespeare'),
(106, 'History', 'Prof. Herodotus');

-- Insert data into EnrollmentInfo
INSERT INTO EnrollmentInfo VALUES 
(1, 1, 101, 'Enrolled'),
(2, 1, 102, 'Enrolled'),
(3, 2, 101, 'Enrolled'),
(4, 2, 103, 'Enrolled'),
(5, 3, 102, 'Enrolled'),
(6, 4, 101, 'Enrolled'),
(7, 4, 104, 'Enrolled'),
(8, 5, 105, 'Enrolled'),
(9, 5, 102, 'Enrolled'),
(10, 6, 103, 'Enrolled'),
(11, 6, 106, 'Enrolled'),
(12, 7, 104, 'Enrolled'),
(13, 7, 105, 'Enrolled'),
(14, 7, 106, 'Enrolled');


-- 3)Retrieve the student information:

-- a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status
SELECT DISTINCT s.STU_Name,s.PHONE_NO,s.EMAIL_ID,e.ENROLL_STATUS
FROM StudentInfo s
JOIN EnrollmentInfo e WHERE s.STU_ID = e.STU_ID;

-- b) Write a query to retrieve a list of courses in which a specific student is enrolled.
SELECT s.STU_ID, s.STU_NAME, c.COURSE_ID, c.COURSE_NAME, c.COURSE_INSTRUCTOR_NAME
FROM  StudentInfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID
JOIN CoursesInfo c ON e.COURSE_ID = c.COURSE_ID
WHERE s.STU_NAME ='John Doe';

-- c) Write a query to retrieve course information, including course name, instructor information.
SELECT COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME FROM CoursesInfo;

-- d) Write a query to retrieve course information for a specific course.
SELECT COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME FROM CoursesInfo 
WHERE COURSE_NAME = 'Physics';

-- e) Write a query to retrieve course information for multiple courses.
SELECT COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME FROM CoursesInfo 
WHERE COURSE_NAME IN ('Physics' , 'Chemistry');


-- 4) Reporting and Analytics (Using JOINING queries)

-- a) Write a query to retrieve the number of students enrolled in each course
SELECT c.COURSE_ID, c.COURSE_NAME,COUNT(e.STU_ID) AS number_of_students_enrolled
FROM CoursesInfo c
JOIN EnrollmentInfo e ON e.COURSE_ID = c.COURSE_ID
WHERE ENROLL_STATUS = 'Enrolled'
GROUP BY c.COURSE_ID, c.COURSE_NAME;

-- b) Write a query to retrieve the list of students enrolled in a specific course
SELECT s.STU_ID, s.STU_NAME, s.EMAIL_ID, s.PHONE_NO, c.COURSE_NAME, e.ENROLL_STATUS
FROM StudentInfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID
JOIN CoursesInfo c ON e.COURSE_ID = c.COURSE_ID
WHERE c.COURSE_NAME = 'Physics';

-- c) Write a query to retrieve the count of enrolled students for each instructor.
SELECT c.COURSE_INSTRUCTOR_NAME, c.COURSE_ID, c.COURSE_NAME, COUNT(e.STU_ID) AS number_of_students_enrolled
FROM EnrollmentInfo e 
JOIN CoursesInfo c ON c.COURSE_ID = e.COURSE_ID
WHERE e.ENROLL_STATUS = 'Enrolled'
GROUP BY c.COURSE_INSTRUCTOR_NAME, c.COURSE_ID, c.COURSE_NAME;

-- d) Write a query to retrieve the list of students who are enrolled in multiple courses
SELECT s.STU_ID, s.STU_NAME, COUNT(e.COURSE_ID) as Total_No_of_Courses_enrolled, GROUP_CONCAT(c.COURSE_NAME SEPARATOR ',') as enrolled_Subjects
FROM studentinfo s
JOIN EnrollmentInfo e ON s.STU_ID = e.STU_ID
JOIN CoursesInfo c ON c.COURSE_ID = e.COURSE_ID
WHERE  e.ENROLL_STATUS = 'Enrolled'
GROUP BY s.STU_ID,s.STU_NAME
HAVING Total_No_of_Courses_enrolled >1;

-- e) Write a query to retrieve the courses that have the highest number of enrolled students(arranging from highest to lowest)
SELECT  C.COURSE_ID,c.COURSE_NAME,  COUNT(e.STU_ID) as Total_NO_Of_Students_enrolled
FROM EnrollmentInfo e
JOIN CoursesInfo c ON c.COURSE_ID = e.COURSE_ID
WHERE  e.ENROLL_STATUS = 'Enrolled'
GROUP BY C.COURSE_ID,c.COURSE_NAME
HAVING Total_NO_Of_Students_enrolled >1 
ORDER BY Total_NO_Of_Students_enrolled DESC ;