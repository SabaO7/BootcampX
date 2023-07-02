/*Students in Cohort*/

SELECT id, name
FROM students
WHERE cohort_id = 7
ORDER BY name ASC;

/*Total Students in Cohorts*/

SELECT COUNT(*)
FROM students
WHERE cohort_id IN (1, 2, 3);

/*Contact Details*/

SELECT name, id, cohort_id
FROM students
WHERE email IS NULL OR phone IS NULL;

/*Non Gmail Students*/

SELECT name, id, email, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com' AND phone IS NULL;

/*Currently Enrolled Students*/

SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id ASC;

/*Github Activity*/

SELECT name, email, phone 
FROM students
WHERE github IS NULL;