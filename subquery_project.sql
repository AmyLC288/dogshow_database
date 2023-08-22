-- Subquery to find dogs and their total_classes_entered in classes 5, 6, 7
Select dog_id, total_classes_entered
FROM dog
WHERE dog_id IN
(SELECT dog_id FROM entry
 WHERE class_id IN (5, 6, 7))
 ORDER BY dog_id 