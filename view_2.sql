 -- Shows all entries ready to send to printers for printing the catalogue
/*CREATE VIEW dog_entries_per_breed
AS
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
    ORDER BY class_id; */
    
SELECT * FROM dog_entries_per_breed