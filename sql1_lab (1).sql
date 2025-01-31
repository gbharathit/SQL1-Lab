-- SQL Exercises (With Answers)

-- 1. Retrieve all students who enrolled in 2023.
SELECT *
FROM students
WHERE YEAR (EnrollmentDate) = 2023;

-- 2. Find students whose email contains 'gmail.com'.
SELECT *
FROM students
WHERE Email LIKE '%gmail.com';

-- 3. Count how many students are enrolled in the database.
SELECT COUNT(StudentID) 
FROM students;

-- 4. Find students born between 2000 and 2005.
SELECT *
FROM students
WHERE YEAR (DateofBirth) BETWEEN 2000 AND 2005;

-- 5. List students sorted by last name in descending order.
SELECT *
FROM students
ORDER BY LastName DESC;

-- 6. Find the names of students and the courses they are enrolled in.
SELECT students.FirstName, students.LastName, courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;


-- 7. List all students and their courses, ensuring students without courses are included (LEFT JOIN).
SELECT Students.FirstName, Students.LastName, Courses.CourseName 
FROM Students 
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID 
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;


-- 8. Find all courses with no students enrolled (LEFT JOIN).
SELECT courses.CourseName
FROM courses
LEFT JOIN enrollments ON courses.CourseID = enrollments.CourseID
WHERE enrollments.CourseID IS NULL;

-- 10. List courses and show the number of students enrolled in each course.
SELECT courses.CourseName, COUNT(enrollments.StudentID)
FROM courses LEFT JOIN enrollments ON enrollments.CourseID = courses.CourseID
GROUP BY courses.CourseID, courses.CourseName;


