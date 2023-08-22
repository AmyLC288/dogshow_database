 -- View ready for checking judges for each breed
/* CREATE VIEW breed_judge
 AS
 SELECT DISTINCT CONCAT(judge.first_name, ' ', judge.last_name) as judge_name, 
		breed.breed_name
 FROM judge
 JOIN class ON class.judge_id = judge.judge_id
 JOIN breed ON breed.breed_id = class.breed_id
 ORDER BY breed_name;*/
 
 SELECT * FROM breed_judge
 
