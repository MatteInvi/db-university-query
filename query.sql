-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;
-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT *
FROM `courses`
WHERE (`cfu`) > 10;
-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM `students`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) > 30;
-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
-- laurea (286)
SELECT *
FROM `courses`
WHERE `period` LIKE "I semestre"
AND `year` LIKE "1";
-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
-- 20/06/2020 (21)
SELECT *
FROM `exams`
WHERE `date` LIKE "2020-06-20"
AND `hour` > "14:00:00";
-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT *
FROM `degrees`
WHERE `name` LIKE "Corso di Laurea Magistrale%";
-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(`id`)
FROM `departments`;
-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(`id`)
FROM `teachers`
WHERE `phone` IS NULL;
-- 9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo
-- degree_id, inserire un valore casuale)
INSERT INTO `students` SET degree_id=69,name="matteo",surname="invidia", date_of_birth="1998-09-16", fiscal_code="NVDMTT98P16C978I",enrolment_date="2020-06-18",registration_number="646464",email="matteoinvidia@gmail.com";
-- 10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126
UPDATE `teachers` SET  office_number="126"
WHERE Id="58";
-- 11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9
DELETE FROM `students` WHERE Id="5001";


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id), YEAR(`enrolment_date`)
FROM `students`
GROUP BY YEAR(`enrolment_date`);
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id), `office_address`
FROM `teachers`
GROUP BY (`office_address`);
-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`), `exam_id`
FROM `exam_student`
GROUP BY(`exam_id`);
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`id`), `department_id`
FROM `degrees`
GROUP BY (`department_id`);






















ALTER TABLE `students`
ADD `actual_data` DATE;