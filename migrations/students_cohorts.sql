CREATE TABLE cohorts (
  id SERIAL NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE,
  end_date DATE,
  CONSTRAINT cohorts_pk PRIMARY KEY (id)
);

CREATE TABLE students (
  id SERIAL NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  github VARCHAR(255),
  start_date DATE,
  end_date DATE,
  cohort_id INTEGER,
  CONSTRAINT students_pk PRIMARY KEY (id),
  CONSTRAINT students_fk FOREIGN KEY (cohort_id) REFERENCES cohorts (id) ON DELETE CASCADE
);