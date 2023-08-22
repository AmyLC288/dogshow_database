-- Query to find out the number of puppies in each breed where the number of puppies >5
SELECT COUNT(d.dog_id) AS '# of dogs',
         b.breed_name
         FROM dog AS d
         INNER JOIN breed AS b ON b.breed_id = d.breed_id
         WHERE d.date_of_birth < current_date() - interval 1 year
         GROUP BY b.breed_name
         HAVING COUNT(d.dog_id) > 5

    -- Finding the classes especially for Golden Retriever breed
SELECT class_id, breed_name from dog_entries_per_breed
GROUP BY breed_name, class_id
HAVING breed_name = 'Golden Retriever'