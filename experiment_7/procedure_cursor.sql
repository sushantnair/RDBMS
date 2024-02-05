-- Procedure

---- a)	Procedure which returns the total number of students in student table.

CREATE OR REPLACE PROCEDURE totalstudents()
AS $$
    declare total_students_fy integer;
	declare total_students_sy integer;
	declare total_students_ty integer;
        BEGIN
			SELECT COUNT(ROLL_NO) into total_students_fy FROM student WHERE yr = 1;
				RAISE NOTICE 'Total number of students in FY: %', total_students_fy;
			SELECT COUNT(ROLL_NO) into total_students_sy FROM student WHERE yr = 2;
				RAISE NOTICE 'Total number of students in SY: %', total_students_sy;
			SELECT COUNT(ROLL_NO) into total_students_ty FROM student WHERE yr = 3;
				RAISE NOTICE 'Total number of students in TY: %', total_students_ty;
        END;
    $$
LANGUAGE plpgsql;

-- b)	Procedure which updates the password of a particular student 
-- (this is based on the transfer procedure given as an example)

Code for Procedure
CREATE OR REPLACE PROCEDURE change_password(
	r_no int,
	password varchar(20))
	LANGUAGE plpgsql
	AS $$
	BEGIN
		-- updating student's password 
		UPDATE student
		SET pass = password
		WHERE roll_no = r_no;
		COMMIT;
	END
	$$;

-- Cursor

---- a)	A cursor which gives details of all the students who are ordered by their admission years 
---- so that the result appears neat (all students admitted in a particular year are displayed together; 
---- then all students admitted in the following year are displayed together and so on)

CREATE OR REPLACE FUNCTION function_admyr() RETURNS refcursor AS $$
	DECLARE
	ref_cursor REFCURSOR := 'admyr_cursor';
	BEGIN
		OPEN ref_cursor FOR SELECT roll_no, email, fname, lname, adm_yr
		FROM student ORDER BY adm_yr desc;
		RETURN (ref_cursor);
	END;
	$$
LANGUAGE plpgsql

---- b)	A cursor which shows average experience of faculty members

CREATE OR REPLACE FUNCTION function_exp() RETURNS refcursor AS $$
	DECLARE
	ref_cursor REFCURSOR := 'exp_cursor';
	BEGIN
		OPEN ref_cursor FOR SELECT
		AVG(experience) from faculty;
		RETURN (ref_cursor);
	END;
	$$ LANGUAGE plpgsql;

---- c)	Cursor to display all faculty members who are holders of a mentioned degree.

CREATE OR REPLACE FUNCTION function_degree(degree varchar(100)) RETURNS refcursor AS $$
	DECLARE
	ref_cursor REFCURSOR := 'degree_cursor';
	BEGIN
		OPEN ref_cursor FOR SELECT
		employee_no, email, fname, lname, gender FROM faculty
		WHERE qualification=degree;
		RETURN (ref_cursor);
	END;
$$ LANGUAGE plpgsql;
