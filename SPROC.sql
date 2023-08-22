-- Stored procedure to call the class_entries_by_breed to call use Call sproc_class_entries_by_breed ('Pug') etc 
Call sproc_class_entries_by_breed ('Pug')

DELIMITER //
CREATE PROCEDURE sproc_class_entries_by_breed(IN breed VARCHAR(50))
BEGIN
SELECT 
	breed.breed_name,
    class.class_id,
    class.class_name,
    dog.dog_id,
    dog.dog_kc_name
    FROM dog
    INNER JOIN breed ON  breed.breed_id = dog.breed_id
    INNER JOIN entry ON entry.dog_id = dog.dog_id
    INNER JOIN class ON class.class_id = entry.class_id
    WHERE breed_name = breed;
    END //
    DELIMITER ;