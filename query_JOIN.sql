--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * 
FROM `students`
INNER JOIN `degrees`
	ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.name LIKE "%laurea in Economia%";

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT * 
FROM `degrees`
INNER JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
WHERE `degrees`.`level` = "magistrale"
AND `departments`.`name` = "Dipartimento di Neuroscienze";

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato
SELECT * 
FROM `courses`
INNER JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`name` = "Fulvio"
AND `teachers`.`surname` = "Amato";

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a 
--cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT * 
FROM `students`
INNER JOIN `degrees`
	ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`name`, `students`.`surname`;

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT * 
FROM `courses`
INNER JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica
SELECT `teachers`.`name`, `teachers`.`surname`, `departments`.`name`
FROM `teachers`
INNER JOIN `course_teacher`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica";

--7. Selezionare per ogni studente il numero di tentativi sostenuti
--per ogni esame, stampando anche il voto massimo. Successivamente,
--filtrare i tentativi con voto minimo 18

SELECT `students`.`name`, `students`.`surname`, `exams`.`course_id`, COUNT(`exams`.`course_id`) as `tentativi_esame`, `exam_student`.`vote`, MAX(`exam_student`.`vote`) as `voto_max`
FROM `students`
INNER JOIN `exam_student`
	ON `students`.`id` = `exam_student`.`student_id`
INNER JOIN `exams`
	ON `exam_student`.`exam_id` = `exams`.`id`
GROUP BY `students`.`name`, `students`.`surname`, `exams`.`course_id`, `exam_student`.`vote`
	HAVING `exam_student`.`vote` >= 18;