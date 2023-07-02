/*Assignments Per Day*/

SELECT day, COUNT(*) AS total_assignments
FROM assignments
GROUP BY day
ORDER BY day ASC;

/*Busy Days*/

SELECT day, COUNT(*) AS total_assignments
FROM assignments
GROUP BY day
HAVING COUNT(*) >= 10
ORDER BY day ASC;

/*Large Cohorts*/

SELECT cohorts.name AS cohort_name, COUNT(*) AS total_students
FROM cohorts
JOIN students 
  ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(*) >= 18
ORDER BY total_students ASC;

/*Total Assignment Submissions*/

SELECT cohorts.name AS cohort_name, COUNT(*) AS total_submissions
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;

/*Average Completion Time*/

SELECT students.name, AVG(assignment_submissions.duration) AS average_completion_time
FROM students
JOIN assignment_submissions 
  ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_completion_time DESC;

/*Low Average Completion Time*/

SELECT students.name AS student_name, 
  AVG(assignment_submissions.duration) AS average_completion_time,
  AVG(assignments.duration) AS average_suggested_completion_time
FROM students
JOIN assignment_submissions 
  ON students.id = assignment_submissions.student_id
JOIN assignments 
  ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.id, students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_completion_time ASC;


