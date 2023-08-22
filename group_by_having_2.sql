  -- Finding the classes especially for Golden Retriever breed
SELECT class_id, breed_name from dog_entries_per_breed
GROUP BY breed_name, class_id
HAVING breed_name = 'Golden Retriever' 