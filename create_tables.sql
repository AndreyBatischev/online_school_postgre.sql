CREATE TABLE subjects 
(
 id SERIAL PRIMARY KEY,
 name VARCHAR(100) NOT NULL
);

CREATE TABLE teachers 
(
 id INTEGER PRIMARY KEY,
 subject_id INTEGER NOT NULL,
 name VARCHAR(50) NOT NULL,
 is_union_member BOOLEAN NOT NULL,
 work_experience NUMERIC CHECK(work_experience > 1),
 phone_number TEXT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (subject_id) REFERENCES subjects (id)
 );

CREATE TABLE subjectsstudents 
(
	id SERIAL PRIMARY KEY,
	students_id INTEGER NOT NULL,
	subjects_id INTEGER NOT NULL,
	FOREIGN KEY (students_id) REFERENCES students (id) ON DELETE CASCADE,
	FOREIGN KEY (subjects_id) REFERENCES subjects (id) ON DELETE CASCADE
);


CREATE TABLE students 
(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	phone_number TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO public.subjects (id, name)
    VALUES (1, 'Biology'),
    (2, 'Chemistry'),
    (3, 'Computer science'),
    (4, 'English'),
    (5, 'Geography'),
    (6, 'node.js');

INSERT INTO public.teachers (id, subject_id, name, is_union_member, work_experience, phone_number)
	VALUES (1,1,'IVAN', true, 3.7, '987987987'),
	(2,2,'Sonya', false, 2.5, '9646546546'),
	(3,3,'Pavel', false, 12, '32132213217');

INSERT INTO public.students (id, name, phone_number)
    VALUES (1,'IVAN T', '987987987'),
    (2,'May Sonya', '9646546546'),
    (3,'Trofimov Pavel', '32132213217');

INSERT INTO public.subjectsstudents (id, students_id, subjects_id)
    VALUES  (1,1,1),
            (2,1,2),
            (3,2,3),
            (4,3,3);