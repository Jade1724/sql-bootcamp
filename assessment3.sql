-- Assessment test 3

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER,
	department VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	phone VARCHAR(50) UNIQUE
);

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	email VARCHAR(50) UNIQUE,
	phone VARCHAR(50) UNIQUE NOT NULL,
	graduation_year DATE CHECK (graduation_year > '1900-01-01')
);

INSERT INTO students(
	first_name,
	last_name,
	homeroom_number,
	phone,
	graduation_year
)
VALUES(
	'Mark',
	'Watney',
	5,
	'777-555-1234',
	'2035-01-01'
);


INSERT INTO teachers(
	first_name,
	last_name,
	homeroom_number,
	department,
	email,
	phone
)
VALUES(
	'Jonas',
	'Salk',
	5,
	'Biology',
	'jsalk@school.org',
	'777-555-4321'
);




