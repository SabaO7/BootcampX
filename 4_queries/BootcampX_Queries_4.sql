/*Total Teacher Assistance Requests*/

SELECT teachers.name AS teacher_name, COUNT(*) AS total_assistance_requests
FROM teachers
JOIN assistance_requests 
  ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.id, teachers.name;

/*Total Student Assistance Requests*/

SELECT students.name AS student_name, COUNT(*) AS total_assistance_requests
FROM students
JOIN assistance_requests 
  ON students.id = assistance_requests.student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;

/*Assistance Requests Data*/

SELECT teachers.name AS teacher_name,
  students.name AS student_name,
  assignments.name AS assignment_name,
  (completed_at - started_at) AS duration
FROM assistance_requests
JOIN teachers 
  ON assistance_requests.teacher_id = teachers.id
JOIN students 
  ON assistance_requests.student_id = students.id
LEFT JOIN assignments 
  ON assistance_requests.assignment_id = assignments.id
ORDER BY duration;

/*Average Assistance Time*/

SELECT AVG(completed_at - created_at) AS average_assistance_request_duration
FROM assistance_requests;

/*Average Cohort Assistance Time*/

SELECT cohorts.name AS cohort_name, 
  AVG(completed_at - started_at) AS average_assistance_request_duration
FROM cohorts
JOIN students 
  ON cohorts.id = students.cohort_id
JOIN assistance_requests 
  ON students.id = assistance_requests.student_id
GROUP BY cohorts.id, cohorts.name
ORDER BY average_assistance_request_duration ASC;

/*Cohort With Longest Assistances*/

SELECT cohorts.name AS cohort_name, 
  AVG(completed_at - started_at) AS average_assistance_request_duration
FROM cohorts
JOIN students 
  ON cohorts.id = students.cohort_id
JOIN assistance_requests 
  ON students.id = assistance_requests.student_id
GROUP BY cohorts.id, cohorts.name
ORDER BY average_assistance_request_duration DESC
LIMIT 1;

/*Average Assistance Request Wait Time*/

SELECT AVG(started_at - created_at) AS average_wait_time
FROM assistance_requests

/*Total Cohort Assistance Duration*/

SELECT cohorts.name AS cohort_name, 
  SUM(completed_at - started_at) AS total_assistance_request_duration
FROM cohorts
JOIN students 
  ON cohorts.id = students.cohort_id
JOIN assistance_requests 
  ON students.id = assistance_requests.student_id
GROUP BY cohorts.id, cohorts.name
ORDER BY total_assistance_request_duration;

/*Cohort Average Assistance Duration*/

SELECT AVG(total_assistance_request_duration) AS average_total_duration
FROM (
  SELECT cohorts.name AS cohort_name, 
    SUM(completed_at - started_at) AS total_assistance_request_duration
  FROM cohorts
  JOIN students 
    ON cohorts.id = students.cohort_id
  JOIN assistance_requests 
    ON students.id = assistance_requests.student_id
  GROUP BY cohorts.id, cohorts.name
) AS subquery;

/*Most Confusing Assignments*/

SELECT assignments.id, assignments.day, assignments.chapter, assignments.name, 
  COUNT(assistance_requests.id) AS total_assistances
FROM assignments
LEFT JOIN assistance_requests 
  ON assignments.id = assistance_requests.assignment_id
GROUP BY assignments.id, assignments.day, assignments.chapter, assignments.name
ORDER BY total_assistances DESC;


/*Total Assignments and duration*/

SELECT day, COUNT(*) AS number_of_assignments, SUM(duration) AS total_duration
FROM assignments
GROUP BY day
ORDER BY day;

/*Name of Teachers That Assisted*/

SELECT DISTINCT teachers.name AS instructor_name, cohorts.name AS cohort_name
FROM assistance_requests
JOIN teachers
  ON assistance_requests.teacher_id = teachers.id
JOIN students 
  ON assistance_requests.student_id = students.id
JOIN cohorts 
  ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY instructor_name;


/*Name of Teachers and Number of Assistances*/

SELECT cohorts.name AS cohort_name, teachers.name AS teacher_name,
  COUNT(assistance_requests.id) AS assistance_count
FROM cohorts
JOIN students 
  ON cohorts.id = students.cohort_id
JOIN assistance_requests 
  ON students.id = assistance_requests.student_id
JOIN teachers 
  ON assistance_requests.teacher_id = teachers.id
GROUP BY cohorts.id, cohorts.name, teachers.id, teachers.name
ORDER BY cohort_name, teacher_name;








