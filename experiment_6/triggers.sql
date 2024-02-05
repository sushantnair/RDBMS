-- To display details of faculty members who have changed their password

CREATE TABLE faculty_pword_audits(
	employee_no NUMERIC(11) NOT NULL PRIMARY KEY, 
	email VARCHAR(50) NOT NULL, 
	pass VARCHAR(20) NOT NULL, 
	fname VARCHAR(30) NOT NULL, 
	lname VARCHAR(30) NOT NULL,
	time_of_change TIMESTAMP(6) NOT NULL);

CREATE OR REPLACE FUNCTION log_f_pword_changes()
	RETURNS trigger AS
	$BODY$
	BEGIN
		IF NEW.pass <> OLD.pass THEN
			INSERT INTO faculty_pword_audits(employee_no, email, pass, fname, lname, time_of_change)
			VALUES(OLD.employee_no, OLD.email, OLD.pass, OLD.fname, OLD.lname, now());
		END IF;
		RETURN NEW;
	END
	$BODY$
	LANGUAGE plpgsql

------------------------------------------------------------------------------

CREATE TRIGGER f_password_changes
	BEFORE UPDATE
	ON faculty
	FOR EACH ROW
	EXECUTE PROCEDURE log_f_pword_changes();

------------------------------------------------------------------------------

SELECT employee_no, email, pass, fname, lname
FROM faculty;

------------------------------------------------------------------------------

UPDATE faculty
SET pass = 'aD108108'
WHERE employee_no = 001;

------------------------------------------------------------------------------

SELECT *
FROM faculty_pword_audits;

------------------------------------------------------------------------------

CREATE TABLE student_pword_audits(
	roll_no NUMERIC(11) NOT NULL PRIMARY KEY,
	email VARCHAR(50) NOT NULL, 
	pass VARCHAR(20) NOT NULL, 
	fname VARCHAR(30) NOT NULL, 
	lname VARCHAR(30) NOT NULL,
	time_of_change TIMESTAMP(6) NOT NULL);

CREATE OR REPLACE FUNCTION log_s_pword_changes()
	RETURNS trigger AS
	$BODY$
	BEGIN
		IF NEW.pass <> OLD.pass THEN
			INSERT INTO student_pword_audits(roll_no, email, pass, fname, lname, time_of_change)
			VALUES(OLD.roll_no, OLD.email, OLD.pass, OLD.fname, OLD.lname, now());
		END IF;
		RETURN NEW;
	END
	$BODY$
	LANGUAGE plpgsql

------------------------------------------------------------------------------

CREATE TRIGGER s_password_changes
	BEFORE UPDATE
	ON student
	FOR EACH ROW
	EXECUTE PROCEDURE log_s_pword_changes();

------------------------------------------------------------------------------

SELECT roll_no, email, pass, fname, lname
FROM student;

------------------------------------------------------------------------------

UPDATE student
SET pass = 'rnD108108'
WHERE roll_no = 22001;

------------------------------------------------------------------------------

SELECT *
FROM student_pword_audits;

------------------------------------------------------------------------------

-- Write a trigger to count number of new tuples inserted using each insert 
-- statement.

CREATE OR REPLACE FUNCTION log_insertions()
	RETURNS trigger AS
    	$BODY$
        BEGIN
        	INSERT INTO insertions(last_name, inserted_on)
            VALUES(NEW.last_name, now());
            RETURN NEW;
        END
        $BODY$
    LANGUAGE plpgsql
    
CREATE TRIGGER insertions_changes
	BEFORE INSERT
    ON employees_expt6
    FOR EACH ROW
    EXECUTE PROCEDURE log_insertions();

------------------------------------------------------------------------------
