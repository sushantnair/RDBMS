-- a.	Simple select query

EXPLAIN SELECT * FROM student;

INSERT INTO STUDENT(ROLL_NO, EMAIL, PASS, FNAME, LNAME, GENDER, DOB, ADM_YR, YR, SEM)
VALUES(22013, 'rohit.gupta@somaiya.edu', 'rG123456', 'ROHIT', 'GUPTA', 'M', '01-10-2004', '2022', 1, 1),
(22014, 'yuvraj.zala@somaiya.edu', 'yZ123456', 'YUVRAJ', 'ZALA', 'M', '01-09-2004', '2022', 1, 1),
(22015, 'chaitanya.pratosh@somaiya.edu', 'cP123456', 'CHAITANYA', 'PRATOSH', 'M', '01-11-2004', '2022', 1, 1),
(22016, 'bhargavaram.k@somaiya.edu', 'bK123456', 'BHARGAVARAM', 'KRISHNAPUR', 'M', '01-10-2004', '2022', 1, 1),
(21009, 'rahul.gundre@somaiya.edu', 'rG123456', 'RAHUL', 'GUNDRE', 'M', '01-10-2003', '2021', 2, 3),
(21010, 'amrish.diwakar@somaiya.edu', 'aD123456', 'AMRISH', 'DIWAKAR', 'M', '01-09-2003', '2021', 2, 3),
(21011, 'vighnesh.sallagiri@somaiya.edu', 'vS123456', 'VIGHNESH', 'SALLAGIRI', 'M', '10-10-2003', '2021', 2, 3),
(21012, 'aditya.bhattad@somaiya.edu', 'aB123456', 'ADITYA', 'BHATTAD', 'M', '09-11-2003', '2021', 2, 3),
(20009, 'rakesh.ganapa@somaiya.edu', 'Rg123456', 'RAKESH', 'GANAPA', 'M', '01-10-2002', '2020', 3, 5),
(20010, 'shubham.biyani@somaiya.edu', 'sB123456', 'SHUBHAM', 'BIYANI', 'M', '01-09-2002', '2020', 3, 5),
(20011, 'venkatesh.gunake@somaiya.edu', 'vG123456', 'VENKATESH', 'GUNAKE', 'M', '10-10-2002', '2020', 3, 5),
(20012, 'samadhan.maske@somaiya.edu', 'sM123456', 'SAMADHAN', 'MASKE', 'M', '01-11-2002', '2020', 3, 5);
	
EXPLAIN SELECT * FROM student;

EXPLAIN (ANALYZE) SELECT * FROM student;

-- b.	Select query with where clause

EXPLAIN SELECT * FROM student WHERE roll_no > 22000;

EXPLAIN ANALYZE SELECT * FROM student WHERE roll_no > 22000;

CREATE INDEX ON student(roll_no);

EXPLAIN SELECT * FROM student WHERE roll_no > 22000;

EXPLAIN (ANALYZE) SELECT * FROM student WHERE roll_no > 22000;

SET enable_seqscan TO OFF;
EXPLAIN (ANALYZE) SELECT * FROM student WHERE roll_no > 22000;

SET enable_seqscan TO ON;

EXPLAIN SELECT * FROM student WHERE roll_no < 22000;

EXPLAIN SELECT * FROM student
WHERE roll_no < 22000 AND fname LIKE '%raj';

-- c.	Select query using Order By

DROP INDEX student_roll_no_idx;
EXPLAIN (ANALYZE) SELECT * FROM student ORDER BY roll_no;

-- d.	Select query using Join

EXPLAIN (ANALYZE) SELECT * FROM student JOIN course_feedback ON 
student.roll_no = course_feedback.stud_id;

-- e.	Select query using Aggregation

EXPLAIN (ANALYZE) SELECT student.roll_no, SUM(student.sem)
FROM student
WHERE roll_no > 22000
GROUP BY 1;

CREATE INDEX student_roll_no_sem ON student(roll_no, sem)
 
CREATE INDEX student_roll_no ON student(roll_no)

