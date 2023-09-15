--1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) as `anno_iscrizione`, COUNT(`id`)
FROM `students`
GROUP BY `anno_iscrizione`;

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address`, COUNT(`id`)
FROM `teachers`
GROUP BY `office_address`;

--3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, AVG(`vote`)
FROM `exam_student`
GROUP BY `exam_id`;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id`, COUNT(`id`)
FROM `degrees`
GROUP BY `department_id`;