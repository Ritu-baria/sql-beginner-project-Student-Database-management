CREATE DATABASE college;
USE college;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    instructor VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
-- Students
INSERT INTO Students VALUES (1, 'Ravi', 20, 'Male');
INSERT INTO Students VALUES (2, 'Priya', 22, 'Female');
INSERT INTO Students VALUES (3, 'Amit', 21, 'Male');
INSERT INTO Students VALUES (4, 'Sneha', 20, 'Female');

-- Courses
INSERT INTO Courses VALUES (101, 'Math', 'Dr. Sharma');
INSERT INTO Courses VALUES (102, 'Science', 'Dr. Meena');
INSERT INTO Courses VALUES (103, 'English', 'Mr. Raj');

-- Enrollments
INSERT INTO Enrollments VALUES (1, 1, 101, 'A');
INSERT INTO Enrollments VALUES (2, 2, 101, 'B');
INSERT INTO Enrollments VALUES (3, 2, 102, 'A');
INSERT INTO Enrollments VALUES (4, 3, 103, 'C');
INSERT INTO Enrollments VALUES (5, 4, 102, 'B');
-- List all students
SELECT * FROM Students;

-- Courses and instructors
SELECT * FROM Courses;

-- Students with their course and grade
SELECT s.name, c.course_name, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON c.course_id = e.course_id;

-- Count of students in each course
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM Enrollments e
JOIN Courses c ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Average age of students
SELECT AVG(age) AS avg_student_age FROM Students;

-- Female students only
SELECT * FROM Students WHERE gender = 'Female';
