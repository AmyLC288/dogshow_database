-- subquery to find out number of entries in the classes where the cost of the class is >15.00
SELECT   c.class_id, 
          c.class_name, 
		  (Select Count(e.entry_id) FROM entry AS e WHERE e.class_id = c.class_id) 
	      FROM class AS c
WHERE cost < 15.00

