# TASK-1-Academic-management-system---madhcher
Designing and Developing Academic management system DBMS using SQL

**Academic Management System**
This SQL script sets up a basic Academic Management System database, including tables for student information, course details, and enrollment records. It also provides various queries for retrieving student and course information, and generating analytics on enrollment.

**Database Schema**
The database consists of the following tables:
•	**StudentInfo**: Stores details about students.
o	STU_ID (INT, PRIMARY KEY)
o	STU_NAME (VARCHAR(50))
o	DOB (DATE)
o	PHONE_NO (BIGINT)
o	EMAIL_ID (VARCHAR(50))
o	ADDRESS (VARCHAR(100))
•	**CoursesInfo**: Stores details about courses.
o	COURSE_ID (INT, PRIMARY KEY)
o	COURSE_NAME (VARCHAR(50))
o	COURSE_INSTRUCTOR_NAME (VARCHAR(50))
•	**EnrollmentInfo**: Records student enrollment in courses.
o	ENROLLMENT_ID (INT, PRIMARY KEY)
o	STU_ID (INT, FOREIGN KEY references StudentInfo)
o	COURSE_ID (INT, FOREIGN KEY references CoursesInfo)
o	ENROLL_STATUS (VARCHAR(15))

**Script Sections**
1.	**Database Creation and Selection**:
o	CREATE DATABASE Academic_management_system;
o	USE Academic_management_system;
2.	**Table Creation**:
o	CREATE TABLE StudentInfo (...)
o	CREATE TABLE CoursesInfo (...)
o	CREATE TABLE EnrollmentInfo (...)
3.	**Data Insertion**:
o	INSERT INTO StudentInfo VALUES (...)
o	INSERT INTO CoursesInfo VALUES (...)
o	INSERT INTO EnrollmentInfo VALUES (...)
o	Includes sample data for students, courses, and enrollments.
4.	**Student Information Retrieval**:
o	Queries to retrieve student details, contact information, and enrollment status.
o	Queries to list courses a specific student is enrolled in.
o	Queries to retrieve general course information.
o	Queries to retrieve information for specific courses (single or multiple).
5.	**Reporting and Analytics (Using JOINING queries)**:
o	Queries to count students enrolled in each course.
o	Queries to list students enrolled in a specific course.
o	Queries to count enrolled students per instructor.
o	Queries to list students enrolled in multiple courses.
o	Queries to identify courses with the highest number of enrolled students.
**How to Use**
1.	Execute the script: Run the entire TASK 1 - Academic management system.sql script in your SQL client (e.g., MySQL Workbench, DBeaver, SQL Server Management Studio) to create the database, tables, and populate them with sample data.
2.	Explore the queries: You can then run individual queries from sections 3 and 4 to retrieve specific information and generate reports. Modify the WHERE clauses as needed to fit your specific data retrieval requirements.
**Prerequisites**
•	An SQL database system (e.g., MySQL, PostgreSQL, SQL Server).
•	A SQL client to execute the script.

