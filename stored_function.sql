-- stored functon for eligibility for Best Puppy In Show and Best Veteran In Show as well as Best In Show
DELIMITER // 
    CREATE FUNCTION best_in_show
		(date_of_birth DATE)
	RETURNS VARCHAR(20)
    DETERMINISTIC
    BEGIN
		DECLARE best_in_show VARCHAR(20);
		IF date_of_birth > current_date() - interval 1 year
    THEN
    SET best_in_show = 'puppy_BIS';
		ELSEIF (date_of_birth < current_date() - interval 7 year)
    THEN
    SET best_in_show = 'veteran_BIS';
    END IF;
    RETURN (best_in_show);
    END // 
    DELIMITER ; 
    
-- Showing stored function in use
SELECT dog_id, 
	   dog_kc_name, 
       best_in_show(date_of_birth) AS eligibility 
       FROM dog;