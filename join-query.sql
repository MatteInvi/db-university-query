-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`, `students`.`surname`,`students`.`registration_number`, `degrees`.`name` as Corso
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia"; 
-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SElECT `departments`.`name` as "Nome Dipartimenti", `departments`.`address` as "Indirizzo dipartimento", `degrees`.`name` as "Nome Corso", `degrees`.`address` as "Indirizzo Corso"
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
AND `degrees`.`level` = "magistrale";
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT`teachers`.`name`,`teachers`.`surname`, `courses`.`name` as "nome corso"
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teachers`.`id` = 44
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT  `students`.`surname`,`students`.`name`, `degrees`.`name` as "corso di laurea", `departments`.`name` as "dipartimento"
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname`;
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `courses`.`name` as "corso laurea", `degrees`.`name` as "corso", `teachers`.`name`, `teachers`.`surname`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami
