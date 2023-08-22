-- Create event ready for 1 month following the show to truncate the entry table
CREATE EVENT update_for_next_show
	ON SCHEDULE 
		EVERY 6 MONTH 
        STARTS '2023-09-15 00:00:00'
    DO TRUNCATE entry;