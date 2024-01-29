SELECT * FROM STUDENT;

------------------------------------------------------------------------------------------------------------------

INSERT INTO STUDENT(ROLL_NO, EMAIL, PASS, FNAME, LNAME, GENDER, DOB, ADM_YR, YR, SEM)
VALUES(001, 'abc.def@somaiya.edu', 'aA123456', 'ABC', 'DEF', 'M', '01-10-2003', '2021', 2, 4),
(016, 'abc.ghi@somaiya.edu', 'bB123456', 'ABC', 'GHI', 'M', '01-09-2003', '2021', 2, 4),
(081, 'jkl.mno@somaiya.edu', 'jM123456', 'JKL', 'MNO', 'F', '01-11-2004', '2022', 1, 2),
(096, 'jkl.pqr@somaiya.edu', 'jP123456', 'JKL', 'PQR', 'F', '01-10-2004', '2022', 1, 2);

------------------------------------------------------------------------------------------------------------------

UPDATE STUDENT
SET BRANCH = 'COMP'
WHERE YR = 2;

------------------------------------------------------------------------------------------------------------------

UPDATE STUDENT
SET ADM_YR = 2023
WHERE FNAME = 'JKL' AND LNAME = 'MNO';

------------------------------------------------------------------------------------------------------------------

DELETE FROM STUDENT
WHERE ROLL_NO = 001;

------------------------------------------------------------------------------------------------------------------

DELETE FROM STUDENT
WHERE ROLL_NO BETWEEN 75 AND 90;

------------------------------------------------------------------------------------------------------------------

SELECT ADM_YR, SUM(ROLL_NO) AS ROLL_NO_SUM___ADM_YR_GROUP FROM STUDENT GROUP BY ADM_YR; 

------------------------------------------------------------------------------------------------------------------

SELECT ADM_YR, SUM(ROLL_NO) AS ROLL_NO_SUM___ADM_YR_GROUP FROM STUDENT GROUP BY ADM_YR 
HAVING AVG(ROLL_NO) >= ALL(SELECT AVG(ROLL_NO) FROM STUDENT GROUP BY ADM_YR);

SELECT ADM_YR, SUM(ROLL_NO) AS ROLL_NO_SUM___ADM_YR_GROUP FROM STUDENT GROUP BY ADM_YR 
HAVING AVG(ROLL_NO) <= ALL(SELECT AVG(ROLL_NO) FROM STUDENT GROUP BY ADM_YR);

------------------------------------------------------------------------------------------------------------------

SELECT ROLL_NO, COUNT(*) FROM STUDENT GROUP BY ROLL_NO;

------------------------------------------------------------------------------------------------------------------

SELECT ADM_YR, COUNT(*) FROM STUDENT GROUP BY ADM_YR;

------------------------------------------------------------------------------------------------------------------

SELECT MAX(YR) AS MAXIMUM_YEAR FROM STUDENT;

------------------------------------------------------------------------------------------------------------------

SELECT SUM(YR) AS TOTAL_YEAR FROM STUDENT;

------------------------------------------------------------------------------------------------------------------

SELECT MIN(YR) AS MINIMUM_YEAR FROM STUDENT;

------------------------------------------------------------------------------------------------------------------

INSERT INTO FACULTY(EMPLOYEE_NO, EMAIL, PASS, FNAME, LNAME, GENDER, DOB, QUALIFICATION, EXPERIENCE, COURSE, 
COURSE_ID, FSN)
VALUES(001, 'abcd.efgh@somaiya.edu', 'aE123456', 'ABCD', 'EFGH', 'M', '07-03-1970', 'M.Phil. in Mathematics', 20, 
'APPLIED MATHEMATICS-I', '116U06C101', 001),
(002, 'ijkl.mnop@somaiya.edu', 'iM123456', 'IJKL', 'MNOP', 'F', '07-03-1977', 'Ph.D. in Organic Chemistry', 15, 
'ENGINEERING CHEMISTRY', '116U06C103', 002); 

SELECT * FROM FACULTY;

INSERT INTO COURSE_FEEDBACK(COURSE_CODE, COURSE_NAME, FORM_SR_NO, STUD_ID, FAC_ID)
VALUES('116U06C101', 'APPLIED MATHEMATICS - I', 001, 016, 001);

SELECT * FROM COURSE_FEEDBACK;

SELECT * FROM FACULTY WHERE EXISTS(SELECT * FROM COURSE_FEEDBACK WHERE FACULTY.FSN = COURSE_FEEDBACK.FORM_SR_NO);

------------------------------------------------------------------------------------------------------------------

SELECT * FROM FACULTY WHERE NOT EXISTS
(SELECT * FROM COURSE_FEEDBACK WHERE FACULTY.FSN = COURSE_FEEDBACK.FORM_SR_NO);

------------------------------------------------------------------------------------------------------------------

SELECT ROLL_NO, FNAME, LNAME, YR FROM STUDENT WHERE YR IN (1, 2);

------------------------------------------------------------------------------------------------------------------

SELECT ROLL_NO, FNAME, LNAME, YR FROM STUDENT WHERE YR NOT IN (1, 2);

------------------------------------------------------------------------------------------------------------------

SELECT ROLL_NO, FNAME, LNAME, DOB FROM STUDENT WHERE DOB BETWEEN '2002-01-01' AND '2003-01-01';

------------------------------------------------------------------------------------------------------------------

SELECT ROLL_NO, FNAME, LNAME FROM STUDENT WHERE FNAME LIKE 'A%';

------------------------------------------------------------------------------------------------------------------

SELECT ROLL_NO, FNAME, LNAME FROM STUDENT WHERE FNAME LIKE '_Z%';

------------------------------------------------------------------------------------------------------------------

SELECT S.ROLL_NO, S.FNAME, S.DOB, F.EMPLOYEE_NO, F.FNAME, F.DOB 
FROM STUDENT AS S, FACULTY AS F
WHERE S.ROLL_NO = F.EMPLOYEE_NO;

SELECT S.ROLL_NO, S.FNAME, S.DOB, F.EMPLOYEE_NO, F.FNAME, F.DOB 
FROM STUDENT AS S, FACULTY AS F
WHERE S.ROLL_NO < F.EMPLOYEE_NO;

SELECT S.ROLL_NO, S.FNAME, S.DOB, F.EMPLOYEE_NO, F.FNAME, F.DOB 
FROM STUDENT AS S, FACULTY AS F
WHERE S.ROLL_NO > F.EMPLOYEE_NO;

------------------------------------------------------------------------------------------------------------------

INSERT INTO STUDENT(ROLL_NO, EMAIL, PASS, FNAME, LNAME, GENDER, DOB, ADM_YR, YR, SEM)
VALUES(006, 'stu.vwx@somaiya.edu', 'sV123456', 'STU', 'VWX', 'F', '01-10-2004', '2022', 1, 2),
(007, 'abc.bcd@somaiya.edu', 'aB123456', 'ABC', 'YZA', 'F', '01-09-2004', '2022', 1, 2),
(008, 'abc.hij@somaiya.edu', 'aH123456', 'ABC', 'HIJ', 'M', '01-11-2004', '2022', 1, 2),
(009, 'abc.nop@somaiya.edu', 'aN123456', 'ABC', 'NOP', 'M', '01-10-2004', '2022', 1, 2);

SELECT DISTINCT FNAME FROM STUDENT;

------------------------------------------------------------------------------------------------------------------

SELECT ROLL_NO, GENDER FROM STUDENT
UNION
SELECT EMPLOYEE_NO, GENDER FROM FACULTY;

SELECT ROLL_NO, GENDER FROM STUDENT
UNION ALL
SELECT EMPLOYEE_NO, GENDER FROM FACULTY;

SELECT ROLL_NO, GENDER FROM STUDENT
INTERSECT
SELECT EMPLOYEE_NO, GENDER FROM FACULTY;

SELECT ROLL_NO, GENDER FROM STUDENT
EXCEPT
SELECT EMPLOYEE_NO, GENDER FROM FACULTY;

------------------------------------------------------------------------------------------------------------------

SELECT ROLL_NO, FNAME, ADM_YR FROM STUDENT
WHERE FSN = ANY(SELECT FSN FROM COURSE_FEEDBACK WHERE FSN = 1);

SELECT ROLL_NO, FNAME, ADM_YR FROM STUDENT
WHERE FSN = ALL(SELECT FSN FROM COURSE_FEEDBACK WHERE FSN = 1);

------------------------------------------------------------------------------------------------------------------