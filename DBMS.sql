create database classattendance;
use classattendance;
create table students(roll_no int, first_name varchar(255), last_name varchar(255), email varchar(255));

--Table Creation

create table courses(course_id int primary key auto_increment, course_name varhchar(255), course_code varchar(255), instructor_name varchar(255), start_date, end_date);

create table enrollments(enrollment_id int primary key auto_increment, roll_no int, enrollment_Date date, foreign key(roll_no references students(roll_no), foreign key(course_id) references courses(course_id));

create table attendance(attendance_id int primary key auto_increment, roll_no int, course_id int, attendance_date date,
status Enum('Present', 'Absent'), foreign key(roll_no) references students(roll_no), foreign key(course_id) references courses(course_id));

show tables;

desc students;
desc courses;
desc enrollments;
desc attendance;

--Insertion Query

INSERT INTO students (roll_no, first_name, last_name, email) VALUES
(1, 'Amogh', 'Sharma', 'amogh@gmail.com'),
(2, 'Sarwodaya', 'Shrestha', 'sarwodaya@gmail.com'),
(3, 'Priyams', 'Bajracharya', 'priyams@gmail.com'),
(4, 'Aaditya', 'Shah', 'aaditya@gmail.com'),
(5, 'Anurag', 'Chaudhary', 'anurag@gmail.com'),
(6, 'Manu', 'Shrestha', 'manu@gmail.com'),
(7, 'Dilasa', 'Dahal', 'dilasa@gmail.com'),
(8, 'Vivek', 'Dahal', 'vivek@gmail.com'),
(9, 'Shobhav', 'Basnet', 'shobhav@gmail.com'),
(10, 'Sanskriti', 'Joshi', 'sanskriti@gmail.com'),
(11, 'Krishna', 'Basnet', 'krishna@gmail.com'),
(12, 'Rajan', 'Jha', 'rajan@gmail.com'),
(13, 'Dirghayu', 'Shrestha', 'dirghayu@gmail.com'),
(14, 'Om', 'Dev', 'om@gmail.com'),
(15, 'Anmol', 'Aacharya', 'anmol@gmail.com');


INSERT INTO courses (course_id, course_name, start_date, end_date) VALUES
(201, 'DBMS', '2024-09-01', '2025-01-26'),
(202, 'Networking', '2024-09-01', '2025-01-26'),
(203, 'Microprocessor', '2024-09-01', '2025-01-26'),
(204, 'Numerical Methods', '2024-09-01', '2025-01-26'),
(205, 'Differential Equation', '2024-09-01', '2025-01-26'),
(206, 'Discrete Maths', '2024-09-01', '2025-01-26'),
(207, 'Electronics', '2024-09-01', '2025-01-26'),
(208, 'Statistics', '2024-09-01', '2025-01-26'),
(209, 'DSA', '2024-09-01', '2025-01-26'),
(210, 'Digital Logic', '2024-09-01', '2025-01-26'),
(211, 'English', '2024-09-01', '2025-01-26'),
(212, 'Python', '2024-10-05', '2025-05-26'),
(213, 'Java', '2024-10-05', '2025-09-26'),
(214, 'Machine Learning', '2025-05-26', '2025-10-26'),
(215, 'OOP', '2024-09-26', '2025-01-26');


INSERT INTO attendance (attendance_id, roll_no, course_id, attendance_date, status) VALUES
(1, 1, 201, '2024-10-11', 'Present'),
(2, 1, 210, '2024-10-11', 'Absent'),
(3, 2, 208, '2024-10-11', 'Present'),
(4, 3, 211, '2024-10-11', 'Present'),
(5, 4, 213, '2024-10-11', 'Absent'),
(6, 5, 201, '2024-10-11', 'Present'),
(7, 6, 215, '2024-10-11', 'Present'),
(8, 7, 211, '2024-10-11', 'Present'),
(9, 8, 210, '2024-10-11', 'Absent'),
(10, 9, 206, '2024-10-11', 'Present'),
(11, 10, 202, '2024-10-11', 'Present'),
(12, 11, 203, '2024-10-11', 'Present'),
(13, 12, 204, '2024-10-11', 'Present'),
(14, 13, 205, '2024-10-11', 'Present'),
(15, 14, 207, '2024-10-11', 'Present'),
(16, 15, 212, '2024-10-11', 'Absent');


INSERT INTO enrollments (enrollment_id, roll_no, course_id, enrollment_Date) VALUES
(1, 1, 209, '2024-09-05'),
(2, 1, 210, '2024-09-06'),
(3, 2, 208, '2024-09-05'),
(4, 3, 211, '2024-09-03'),
(5, 4, 213, '2024-09-01'),
(6, 5, 201, '2024-09-03'),
(7, 6, 215, '2024-10-01'),
(8, 7, 211, '2024-09-05'),
(9, 8, 210, '2024-09-10'),
(10, 9, 206, '2024-09-10'),
(11, 10, 202, '2024-09-11'),
(12, 11, 203, '2024-09-10'),
(13, 12, 204, '2024-09-11'),
(14, 13, 205, '2024-09-12'),
(15, 14, 207, '2024-09-03'),
(16, 15, 212, '2024-09-07'),
(17, 12, 214, '2025-05-27');


--Join Operations
--Inner Join

select first_name, last_name, attendance.roll_no, course_id, status
from students
inner join attendance on attendance,roll_no= students.roll_no;


--Left Join
select first_name, last_name, attendance.roll_no, course_id, status
from students
left join attendance on attendance.roll_no=students.roll_no;

--Right Join
select first_name, last_name, attendance.roll_no, course_id, status
from students
right join attendance on attendance.roll_no=students.roll_no;

--Full Outer Join
select first_name, last_name, attendance.roll_no, course_id, status
from students
left join attendance on attendance.roll_no=students.roll_no
union
select first_name, last_name, attendance.roll_no, course_id, status
from students
right join attendance on attendance.roll_no=students.roll_no;

--Specific query operation
--List of all the students and their enrolled courses
select
students.student_id,
concat(students.first_name, '', students.last_name) as student_name,
courses.course_name,
enrollments.status
from 
students
join
enrollments on students.student.id= enrollments.student_id
join
courses on enrollments.course_id= courses.course_id; 


--List of the instructors and their courses;
select
instructos.instructor_id,
concat(instructors.first_name, '', instructors.last_name) as instructor_name,
courses.course_name,
courses.start_date,
courses.end_Date
from instructors
join
courses on instructors.instructor_id= courses.instructor_id;


--List of all the courses with their instructors and enrolled students
select 
courses.couse_name,
concat(instructors.first_name, '', instructors.last_name) as instructor_name,
concat(students.first_name, '', students.last_name) as student_name,
enrollments.status
from courses
join
instructors on couses.instructor_id=instructors.instructor_id
join
enrollments on course.course_id= enrollments.course)id
join
students on enrollments.student_id = students.student_id;


--Cartesian Product
select first_name, last_name, email, students.roll_no, course_id, status
from students
cross join attendance;


--Selection
select *from students
where last_name like 'D%' and
roll_no>3;

--Projection
select roll_no, status from attendance;


--Normalization
create table unnormalized_table(roll_no int, student_name varchar(255), course_info varchar(255), enrollment_info int, attendance_info int);


desc unnormalized_table;

insert into unnormalized_table(roll_no, student_name, course_info, enrollment_info, attendance_info)
values
(1,'Amogh Sharma', '201:DBMS, 210:Digital Logic', '1', '1:Present, 2:Absent'),
(2,'Aaditya Shah', '213:JAVA', '5','5:Absent');


select *from unnormalized_table;

--First Normal From
CREATE TABLE first_normal_form (
    roll_no INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    course_id INT,
    course_name VARCHAR(255),
    enrollment_id INT,
    attendance_id INT,
    attendance_status VARCHAR(255)
);

INSERT INTO first_normal_form (roll_no, first_name, last_name, course_id, course_name, enrollment_id, attendance_id, attendance_status)
VALUES
    (1, 'Amogh', 'Sharma', 201, 'DBMS', 1, 1, 'Present'),
    (4, 'Aaditya', 'Shah', 213, 'JAVA', 5, 5, 'Absent');



--2NF
CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(255)
);

CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    roll_no INT,
    course_id INT,
    FOREIGN KEY (roll_no) REFERENCES student(roll_no),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE atendance (
    enrollment_id INT PRIMARY KEY,
    status VARCHAR(50),
    FOREIGN KEY (enrollment_id) REFERENCES enrollment(enrollment_id)
);


INSERT INTO student (roll_no, first_name, last_name)
VALUES
    (1, 'Amogh', 'Sharma'),
    (4, 'Aaditya', 'Shah');



INSERT INTO enrollment(roll_no, course_id, enrollment_id)
VALUES
    (1, '210', 1),
    (1, '211', 2),
    (4, '213', 5);


INSERT INTO course (course_id, course_name)
VALUES
    (210, 'Dbms'),
    (211, 'Networking'),
    (213, 'JAVA');

INSERT INTO attendance(roll_no, course_id, enrollment_id, status)
VALUES
    (1, '210', 1, 'Present'),
    (4, '213', 5, 'Absent');



--Stored Procedure
DELIMITER $$
CREATE PROCEDURE GetAttendanceByStudent(IN student_roll_no INT)
BEGIN
    SELECT 
        a.attendance_id,
        c.course_name,
        a.status
    FROM 
        attendance a
    JOIN 
        courses c 
    ON 
        a.course_id = c.course_id
    WHERE 
        a.roll_no = student_roll_no;
END $$
DELIMITER ;

DELIMITER;
CALL GetAttendanceByStudent(12);


DELIMITER $$
CREATE PROCEDURE EnrollStudent(
    IN student_roll_no INT,
    IN course_id INT,
    IN enrollment_date DATE
)
BEGIN
    INSERT INTO enrollments (roll_no, course_id, enrollment_date)
    VALUES (student_roll_no, course_id, enrollment_date);
END $$
DELIMITER ;

DELIMITER;
CALL EnrollStudent(2,210,'2024-10-11');


--Transaction 

DELIMITER $$

CREATE PROCEDURE EnrollStudentAndMarkAttendance(
    IN student_roll_no INT,
    IN course_id INT,
    IN enrollment_date DATE,
    IN attendance_date DATE,
    IN attendance_status VARCHAR(20)
)
BEGIN
    -- Declare a condition handler for errors
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    ROLLBACK;

    -- Start transaction
    START TRANSACTION;

    -- Insert into enrollments table
    INSERT INTO enrollments (roll_no, course_id, enrollment_date)
    VALUES (student_roll_no, course_id, enrollment_date);

    -- Insert into attendance table
    INSERT INTO attendance (roll_no, course_id, attendance_date, status)
    VALUES (student_roll_no, course_id, attendance_date, attendance_status);

    -- Commit transaction
    COMMIT;
END $$

DELIMITER ;
CALL EnrollStudentAndMarkAttendance(12,202,'2024-10-15','2024-10-15','Present');
Select *from enrollments where roll_no=12 AND course_id=202;

select *from attendance where roll_no=12 and course_id=202;





