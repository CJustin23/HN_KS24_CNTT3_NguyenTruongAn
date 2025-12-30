-- CREATE DATABASE
CREATE DATABASE it_202;
USE it_202;
-- Student
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    student_email VARCHAR(100) UNIQUE NOT NULL,
    student_phone VARCHAR(15)
);
--  Course
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_credits INT NOT NULL CHECK (course_credits > 0)
);
-- Enrollment
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2) DEFAULT 0,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
-- INSERT 
INSERT INTO Student (student_name, student_email, student_phone) VALUES
('Nguyen Van A', 'a@gmail.com', '0111111111'),
('Nguyen Van B', 'b@gmail.com', '0222222222'),
('Nguyen Van C', 'c@gmail.com', '0333333333'),
('Nguyen Van D', 'd@gmail.com', '0444444444'),
('Nguyen Van E', 'e@gmail.com', '0555555555');
INSERT INTO Course (course_id, course_name, course_credits) VALUES
(1, 'van', 3),
(2, 'toan', 4),
(3, 'hoa', 3),
(4, 'sinh', 4),
(5, 'su', 3);
INSERT INTO Enrollment (student_id, course_id, grade) VALUES
(1, 101, 7.5),
(2, 102, 8.0),
(2, 103, 6.5),
(3, 101, 9.0),
(4, 104, 7.0);
-- UPDATE 
UPDATE Enrollment
SET grade = 9.0
WHERE student_id = 2
  AND course_id = 103;
-- SELECT
SELECT student_name, student_email, student_phone
FROM Student;
-- DELETE
DELETE FROM Course
WHERE course_id = 101;
-- Hệ thông báo lỗi xóa không thành công course_id=101 vì course_id=101 có trong bảng Enrollment nữa
