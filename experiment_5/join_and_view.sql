-- Step 1: Add values to STUDENT, FACULTY and COURSE_FEEDBACK tables.

INSERT INTO STUDENT(ROLL_NO, EMAIL, PASS, FNAME, LNAME, GENDER, DOB, ADM_YR, YR, SEM)
VALUES(22001, 'rohit.gupta@somaiya.edu', 'rG123456', 'ROHIT', 'GUPTA', 'M', '01-10-2004', '2022', 1, 1),
(22002, 'yuvraj.zala@somaiya.edu', 'yZ123456', 'YUVRAJ', 'ZALA', 'M', '01-09-2004', '2022', 1, 1),
(22003, 'chaitanya.pratosh@somaiya.edu', 'cP123456', 'CHAITANYA', 'PRATOSH', 'M', '01-11-2004', '2022', 1, 1),
(22004, 'bhargavaram.k@somaiya.edu', 'bK123456', 'BHARGAVARAM', 'KRISHNAPUR', 'M', '01-10-2004', '2022', 1, 1),
(21001, 'rahul.gundre@somaiya.edu', 'rG123456', 'RAHUL', 'GUNDRE', 'M', '01-10-2003', '2021', 2, 3),
(21002, 'amrish.diwakar@somaiya.edu', 'aD123456', 'AMRISH', 'DIWAKAR', 'M', '01-09-2003', '2021', 2, 3),
(21003, 'vighnesh.sallagiri@somaiya.edu', 'vS123456', 'VIGHNESH', 'SALLAGIRI', 'M', '10-10-2003', '2021', 2, 3),
(21004, 'aditya.bhattad@somaiya.edu', 'aB123456', 'ADITYA', 'BHATTAD', 'M', '09-11-2003', '2021', 2, 3),
(20001, 'rakesh.ganapa@somaiya.edu', 'Rg123456', 'RAKESH', 'GANAPA', 'M', '01-10-2002', '2020', 3, 5),
(20002, 'shubham.biyani@somaiya.edu', 'sB123456', 'SHUBHAM', 'BIYANI', 'M', '01-09-2002', '2020', 3, 5),
(20003, 'venkatesh.gunake@somaiya.edu', 'vG123456', 'VENKATESH', 'GUNAKE', 'M', '10-10-2002', '2020', 3, 5),
(20004, 'samadhan.maske@somaiya.edu', 'sM123456', 'SAMADHAN', 'MASKE', 'M', '01-11-2002', '2020', 3, 5);

INSERT INTO FACULTY(EMPLOYEE_NO, EMAIL, PASS, FNAME, LNAME, GENDER, DOB, QUALIFICATION, EXPERIENCE, COURSE)
VALUES(001, 'avinash.chavan@somaiya.edu', 'aC123456', 'AVINASH', 'CHAVAN', 'M', '01-10-1965', 'M.Phil.', 25, 'AM-I, AM-II'),
(002, 'rahul.patil@somaiya.edu', 'rP123456', 'RAHUL', 'PATIL', 'M', '01-06-1985', 'Ph.D.', 15, 'EC'),
(003, 'vishnu.gadasiya@somaiya.edu', 'vG123456', 'VISHNU', 'GADASIYA', 'M', '07-10-1975', 'Ph.D.', 20, 'EEEE'),
(004, 'nivedita.sirdesai@somaiya.edu', 'nS123456', 'NIVEDITA', 'SIRDESAI', 'F', '01-12-1980', 'Ph.D.', 15, 'ED'),
(005, 'gauranga.das@somaiya.edu', 'gD123456', 'GAURANGA', 'DAS', 'M', '01-10-1985', 'M.Phil.', 10, 'WS-I, WS-II');

INSERT INTO COURSE_FEEDBACK(STUD_ID, FAC_ID, COURSE_CODE, COURSE_NAME, FORM_SR_NO)
VALUES(22001, 001, '116U06C101', 'AM-I', 1),
(22002, 001, '116U06C101', 'AM-I', 2),
(22003, 001, '116U06C101', 'AM-I', 3),
(22004, 001, '116U06C101', 'AM-I', 4);

-- Step 2: Implement CROSS JOIN

---- a)	With custom selection of columns

SELECT s.roll_no, s.fname, s.lname, f.employee_no, f.fname, f.lname, f.course
FROM student AS s CROSS JOIN faculty AS f;
------ (total number of columns displayed is 7; total number of rows displayed is 12*5 = 60, 
------ 12 rows from student table and 5 rows from faculty table)

---- b)	With selection of all columns

SELECT *
FROM student CROSS JOIN faculty;
(total number of columns displayed is 13+12 = 25; total number of rows displayed is 12*5 = 60)

-- Step 2: Implementation of INNER JOIN

---- a)	With custom selection of columns

SELECT s.roll_no, s.fname, s.lname, f.employee_no, f.fname, f.lname, f.course
FROM student AS s INNER JOIN faculty AS f ON s.gender = f.gender;

SELECT s.roll_no, s.fname, s.lname, f.employee_no, f.fname, f.lname, f.course
FROM student AS s INNER JOIN faculty AS f ON s.gender != f.gender;

---- b)	With selection of all columns

SELECT *
FROM student AS s INNER JOIN faculty AS f ON s.gender != f.gender;

-- Step 3: Implementation of LEFT OUTER JOIN

---- a)	With custom selection of columns

SELECT s.roll_no, s.fname, s.lname, f.employee_no, f.fname, f.lname, f.course
FROM student AS s LEFT OUTER JOIN faculty AS f ON s.gender = f.gender;

---- b)	With selection of all columns

SELECT *
FROM student AS s LEFT OUTER JOIN faculty AS f ON s.gender = f.gender;

-- Step 4: Implementation of RIGHT OUTER JOIN

---- a)	With custom selection of columns

SELECT s.roll_no, s.fname, s.lname, f.employee_no, f.fname, f.lname, f.course
FROM student AS s RIGHT OUTER JOIN faculty AS f ON s.gender = f.gender;

---- b)	With selection of all columns

SELECT *
FROM student AS s RIGHT OUTER JOIN faculty AS f ON s.gender = f.gender;

-- Step 5: Implementation of FULL OUTER JOIN

---- a)	With custom selection of columns

SELECT s.roll_no, s.fname, s.lname, f.employee_no, f.fname, f.lname, f.course
FROM student AS s FULL OUTER JOIN faculty AS f ON s.gender = f.gender;

---- b)	With selection of all columns

SELECT *
FROM student AS s FULL OUTER JOIN faculty AS f ON s.gender = f.gender;

-- Step 6: Creating a View

CREATE VIEW student_view AS
SELECT ROW_NUMBER() OVER() AS sr_no, fname, lname, dob
FROM STUDENT;

-- Step 7: Dropping a View

DROP VIEW student_view; 
