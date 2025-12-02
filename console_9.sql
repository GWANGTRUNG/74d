CREATE SCHEMA school;
CREATE TABLE school.Students (
                                 student_id INT PRIMARY KEY,
                                 name VARCHAR(255),
                                 dob DATE
);
CREATE TABLE school.Courses (
                                course_id INT PRIMARY KEY,
                                course_name VARCHAR(255),
                                credits INT
);
CREATE TABLE school.Enrollments (
                                    enrollment_id SERIAL PRIMARY KEY,
                                    student_id INT,
                                    course_id INT,
                                    grade CHAR(1),
                                    CONSTRAINT fk_student
                                        FOREIGN KEY (student_id)
                                            REFERENCES school.Students(student_id),
                                    CONSTRAINT fk_course
                                        FOREIGN KEY (course_id)
                                            REFERENCES school.Courses(course_id),
                                    CONSTRAINT chk_grade
                                        CHECK (grade IN ('A', 'B', 'C', 'D', 'F'))
);
