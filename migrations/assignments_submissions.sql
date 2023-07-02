CREATE TABLE assignments (
  id SERIAL NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER,
  CONSTRAINT assignments_pk PRIMARY KEY (id)
);

CREATE TABLE assignment_submissions (
  id SERIAL NOT NULL,
  assignment_id INTEGER,
  student_id INTEGER,
  duration INTEGER,
  submission_date DATE,
  CONSTRAINT assignments_submission_pk PRIMARY KEY (id),
  CONSTRAINT assignment_id_fk
    FOREIGN KEY (assignment_id) 
    REFERENCES assignments (id) ON DELETE CASCADE,
  CONSTRAINT student_id_fk 
    FOREIGN KEY (student_id) 
    REFERENCES students (id) ON DELETE CASCADE
);

