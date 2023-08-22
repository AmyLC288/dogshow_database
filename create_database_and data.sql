/* CREATE DATABASE UK_DOGSHOW;
    
Use UK_DOGSHOW;

-- Create tables without foreign keys first
CREATE TABLE owner(
		owner_id INT NOT NULL,
		first_name VARCHAR (50) NOT NULL,
        last_name VARCHAR (50) NOT NULL,
        address VARCHAR (100),
        postcode CHAR (8),
        phone_number CHAR (11),
        PRIMARY KEY(owner_id)
        );

-- Data for owner table
Insert into owner
	(owner_id, first_name, last_name, address, postcode, phone_number) 
VALUES  (1, 'Debbie', 'Jones',	'White House, Lixum, Wrexham, Flintshire',	'CH9 8LE', '07775149564'),
		(2, 'Barry', 'Irving', '1, Swallow Court, Whitegate, Cheshyre',	'CW5 1TR', '07888536223'),
		(3, 'Barry', 'Coulson',	'The Beeches, George Road, Opperham, Hompshire', 'HP50 0GL', '07782635244'),
		(4, 'Elaine', 'Barlow',	'Hillview, Lakeside Street, Harslow, Essix', 'CL17 8DY', '07988277112'),
		(5, 'Kevin', 'Dover', '96, Derby Road, Riderly, Derbyshire', 'DE72 3SU', '07787122437'),
		(6, 'Heath', 'Bonner', '118, Aberdare Park, Julesy, Fafferly', 'KY3 0EW', '07877987778'),
		(7, 'Sarah', 'Shepherd', '9 Brecon Grove, Whitley, Bradford, West Yorkshire', 'BD6 5TR', '07798865536'),
		(8, 'Steve', 'Jones', 'Cwm Ynys House, Pontyfen, Port Talbot, West Glamorgan', 'PT12 3RY', '07998198387'),
		(9, 'Jeff',	'Kellyswell', '7 St Mary Drive, Hordle, Lymm, Hampshire', 'SO31 7OR', '07798637265'),
		(10, 'Julia', 'Skipp', '22 Maseyfield Drive, Downham, Norfolk', 'PE31 9TS', '07763162233'),
		(11, 'Alison', 'Hunter', '56 Reading Road, Frogmore, Woolyton, Sarrey', 'GU17 0RB', '07762153443'),
		(12, 'Ben', 'Lang',	'12 Albert Square, Redington, Ayrshire', 'KA15 6EJ', '07781612328'),
		(13, 'Nathan', 'Golding', '7 The Villas, Hawk Bridge, Trialey, Gloucestershire', 'GL29 4HD', '07780977867'),
		(14, 'Diane', 'Jones', '34 Sedgewick Lane, Pond Mill, Nuttinghamshire', 'NE16 4DY', '07786694153'),
		(15, 'Martin', 'Taylor', '46 Margate Drive, Oopswitch, Sufferolk', 'SK3 9EK', '07776654487'),
		(16, 'Abby', 'Richards', '32 New Road, Lesgold, Lenokshire', 'LE26 0EX', '07767897513'),
		(17, 'Keith', 'Thomas', '55 Fords Lane, Vinesoss, Heathton, East Sussex', 'TL21 9PD', '07788232563'),
		(18, 'Chris', 'Heaton', '5 Littledown Close, Exton, Devouir', 'EN8 2SY', '07732411653'),
		(19, 'Lee',	'Gerald', 'Dowells Farm, Startsy Lane, Bridgewaterton, Summerset', 'ST1 6RT', '07778800903'),
		(20, 'Amanda', 'Gould', 'Green House, South Court, Hewerich, York, North Yerkshire', 'YE21 1AF', '07889076887'),
		(21, 'Ian',	'Bennett', 'Hartoford Farm, Back Lane, Llanidloes, Powers', 'P18 6DR', '07780065221'),
		(22, 'Dave', 'Munnings', '33 Flower Lane, Thornton, Bradyford, Harwitch, West Yorkshire', 'LS3 3WP', '07786753454'),
		(23, 'Bethany',	'Todd',	'1 Oakwood Court, Radley, Huntshire', 'RG15 3RS', '07768680074'),
		(24, 'Laura', 'Wildman', 'Park Farm, Tillington Road, Biddulph, Staffshire', 'SA2 7SE', '07780014320'),
		(25, 'Kayleigh', 'Lewis', '87 Littlesoot Street, Pinkerley, Whitshire', 'WE13 2DS', '07688902361'); 
        
-- Create next table without foreign keys, breed
CREATE TABLE breed(
	breed_id INT NOT NULL,
    breed_name VARCHAR (50),
    PRIMARY KEY (breed_id));

-- Data for breed table
Insert into breed
	(breed_id, breed_name)
VALUES  (1, 'Great Dane'),
		(2, 'Golden Retriever'),
		(3, 'Jack Russell Terrier'),
		(4, 'Pembroke Corgi'),
		(5, 'Pug'); 
       
-- Create final table without any foreign keys, judge
CREATE TABLE judge (
		judge_id INT NOT NULL,
		first_name VARCHAR (50) NOT NULL,
        last_name VARCHAR (50) NOT NULL,
        Address VARCHAR (100),
        Postcode CHAR (8),
        phone_number CHAR (11), 
        PRIMARY KEY (judge_id)
        );

-- Data for judge table
INSERT INTO judge
	(judge_id, first_name, last_name, address, postcode, phone_number)
VALUES  (1, 'Liz', 'Thomas', '15 Golden Drive, Holywell, Newquay, Cornwall', 'CN2 6EP', '07777850800'),
		(2, 'Steve', 'George', '54 Kingsmead, Holton, Bristol, North Somerset', 'BS23 2AJ', '07767654112'),
		(3, 'Finley', 'Corish', '6 Oakley Avenue, Tipton, West Midlands', 'WM4 0PR', '07969134783'),
		(4, 'Linda', 'Pink', '76 Kingfisher Road, Boston, Licolnshire', 'PE21 0KR', '07798300928'),
		(5, 'Thomas', 'Newhouse', '2 Church Street, Ilchester, Birmight, Somerset', 'TA22 9LJ', '07764145882');

-- Create dog table, 2 foreign keys (breed_id and owner_id) also final column (total_classes_entered) ready for trigger
CREATE TABLE dog(
		dog_id INT auto_increment NOT NULL,
        dog_kc_name VARCHAR (50),
        date_of_birth DATE,
        breed_id INT,
        owner_id INT, 
        total_classes_entered INT,
        PRIMARY KEY (dog_id),
        FOREIGN KEY (breed_id) 
	REFERENCES breed(breed_id),
        FOREIGN KEY (owner_id)
	REFERENCES owner(owner_id)
		);

-- Date ready for insert into dog table. Had to use escape character to overcome the issue with ' in kc_name
Insert into dog 
	(dog_kc_name, date_of_birth, breed_id, owner_id, total_classes_entered)
VALUES ('Toodles Costa Lot', '2015-10-24', 4, 1, 0),
	   ('Chicka Dip Yer Butty',	'2022-11-24', 3, 2, 0),
	   ('Chicka Cut The Mustard', '2022-08-08', 3, 2, 0),	
	   ('Pemcader Super Ted', '2022-04-20', 4, 3, 0),
	   ('Pemcader Jester', '2022-09-17', 4, 3, 0),
	   ('Cornylwood Glorious Twelfth', '2019-03-23', 1, 4, 0),	
	   ('Cornylwood Sunny', '2022-05-12', 1, 4, 0),
	   ('Cornylwood Chocolate Orange', '2022-11-29', 5, 4, 0),	 
	   ('Oakmarsh Summer Star', '2022-07-07',	5, 5, 0),
	   ('Oakmarsh Fire Spark', '2022-01-22', 5, 5, 0),	
	   ('Ellesmere Winners Take It All', '2023-01-18', 4, 6, 0), 
	   ('Jetsetter Land of Dreams',	'2022-11-03',	4, 7, 0),	
	   ('Larkrise Invincible',	'2021-02-03',	3, 8, 0),
	   ('Larkrise Incredible',	'2021-02-03', 3, 8, 0),
	   ('Larkrise Spellbound',	'2021-09-13',	3, 8, 0),
	   ('Bridgelert Don\'t Push It',	'2023-01-21', 1, 9, 0),
	   ('Bridgelert Any Dream Will Do', '2020-07-19', 1, 9, 0),
	   ('Pemtyk Rule The World', '2015-12-01', 2, 10, 0),
	   ('Pemtyk Keep Dreaming', '2022-08-10', 2, 10, 0),
	   ('Pemtyk Bad Blood', '2022-09-21', 2, 10, 0),
	   ('Gwendiff Limited Edition', '2022-10-27', 2, 11, 0),
	   ('Sandystorm Golden Girl', '2022-12-01', 3, 12, 0),
	   ('Sandystorm Pin Up Girl', '2014-09-24', 3, 12, 0),
	   ('Sandystorm All That Jazz', '2021-10-31', 3, 12, 0),
	   ('Sandystorm Picture This', '2022-12-01', 3, 12, 0),
	   ('Allhops Written On Mars', '2022-10-10',	5, 13, 0),
	   ('Allhops Walk On The Wildside', '2022-03-24',	5, 13, 0),	
	   ('Jayders Pawsitive Attitude', '2016-07-23',  4, 14, 0),
	   ('Asterix Truly Captivating',	'2023-01-04',	5, 15, 0),
	   ('Asterix Temptress',	'2022-07-16',	2, 15, 0),
	   ('Asterix I\'m Your Man',	'2022-10-08',	2, 15, 0),
	   ('Asterix\'s Greatest Day', '2022-08-31', 5, 15, 0),
       ('Leritall Stuck On You', '2022-01-15',	4, 16, 0),	
	   ('Leritall No You Hang Up', '2022-09-30', 4, 16, 0),
	   ('Ravenout Eye Of The Tiger', '2023-05-05',	2, 17, 0),
	   ('Ravenout You Wish', '2021-11-26',	3, 17, 0),
	   ('Dennyer Double Or Stick',	'2022-04-08',	2, 18, 0),
	   ('Dennyer In Your Dreams', '2021-03-22',	2,	18, 0),	
	   ('Dennyer Know Your Worth',	'2023-02-14',	3,	18, 0),
	   ('Molain Simply The Best',	'2023-01-31',	3, 19, 0),
	   ('Haydenbear Classy Lady', '2023-02-13', 2, 20, 0),
       ('Haydenbear Mr Bright Skies', '2016-02-15', 2, 20, 0),
	   ('Afterglow Pretty Perfect', '2021-06-05', 2, 21, 0),
	   ('Afterglow Thinking Out Loud', '2022-08-07', 2, 21, 0),
	   ('Sassypants Bye Felicia',	'2015-12-25',	5, 22, 0),
	   ('Sassypants Hakuna Matata', '2020-03-07', 5, 22, 0),
	   ('Finesse Standing Ovation', '2023-01-01', 2, 23, 0),
	   ('Parisskies King Of Hearts', '2020-03-03', 2, 24, 0),
	   ('Kennycar Can\'t Handle This', '2022-11-10', 1, 25, 0); 
        
-- Create table class with 2 foreign keys (breed_id and judge_id)
 CREATE TABLE class (
	class_id INT auto_increment,
    class_name VARCHAR (50) NOT NULL,
    breed_id INT NOT NULL,
	judge_id INT NOT NULL,
    cost DECIMAL (4,2),
    PRIMARY KEY (class_id),
    FOREIGN KEY (judge_id)
    REFERENCES judge(judge_id),
    FOREIGN KEY (breed_id)
    REFERENCES breed(breed_id));

-- Data ready for insert into class table
Insert into class
	(class_name, breed_id, judge_id, cost)
VALUES  ('puppy', 1, 1, 12.50),
		('junior', 1, 1, 12.50),
        ('post graduate', 1, 1, 12.50),
        ('open', 1, 1, 12.50),
        ('puppy', 2, 2, 17.50),
		('junior', 2, 2, 17.50),
        ('post graduate', 2, 2, 17.50),
        ('limit', 2,2, 17.50),
        ('open', 2, 2, 17.50),
        ('puppy', 3, 3, 17.50),
		('junior', 3, 3, 17.50),
        ('post graduate', 3, 3, 17.50),
        ('open', 3, 3, 17.50),
        ('puppy', 4, 4, 17.50),
		('junior', 4, 4, 17.50),
        ('post graduate', 4, 4, 17.50),
        ('open', 4, 4, 17.50),
        ('puppy', 5, 5, 12.50),
		('junior', 5, 5, 12.50),
        ('open', 5, 5, 12.50);

-- Table for entry into classes, 2 foreign keys (dog_id and class_id)
Create TABLE entry (
	entry_id INT auto_increment,
    dog_id INT NOT NULL,
    class_id INT NOT NULL,
    PRIMARY KEY (entry_id),
    FOREIGN KEY (dog_id)
    REFERENCES dog(dog_id),
    FOREIGN KEY (class_id)
    REFERENCES class(class_id)
    );
    
-- Trigger ready for entry table data, to increase number of classes entered
DELIMITER //
   
   CREATE TRIGGER update_total_classes_entered
	AFTER INSERT ON entry
    FOR EACH ROW
    BEGIN
		UPDATE dog
		SET total_classes_entered = total_classes_entered + 1
		WHERE dog_id = NEW.dog_id;
    END //
    
    DELIMITER ; 
    
    -- trigger ready incase any dogs, removed from a class
    DELIMITER //
   
   CREATE TRIGGER reduce_total_classes_entered
	AFTER DELETE ON entry
    FOR EACH ROW
    BEGIN
		UPDATE dog
		SET total_classes_entered = total_classes_entered - 1
		WHERE dog_id = OLD.dog_id;
    END //
    
    DELIMITER ;
    
-- Ensure trigger is created and works before entering this data, check by select * from dog and total_classes_entered, should have a value >0
INSERT INTO entry 
(entry.dog_id, entry.class_id)
VALUES  (1, 17),
		(2, 10),
        (3, 12),
        (4, 15),
        (5, 14),
        (6, 4),
        (7, 2),
        (7, 3),
        (8, 18),
        (9, 19),
        (10, 20),
        (11, 14),
        (11, 15),
        (11, 16),
        (12, 15),
        (13, 12),
        (14, 13),
        (15, 13),
        (16, 1),
        (16, 2),
        (17, 4),
        (18, 9),
        (19, 6), 
        (19, 8),
        (20, 5),
        (20, 6),
        (20, 7),
        (21, 5), 
        (22, 10),
        (22, 11),
        (23, 13), 
        (24, 12),
        (25, 10),
        (25, 11),
        (26, 5),
        (27, 6),
        (28, 17),
        (29, 18),
        (30, 6),
        (30, 7),
        (31, 5),
        (32, 18),
        (32, 19),
        (33, 15),
        (33, 16),
        (33, 17),
        (34, 14),
        (34, 15),
        (35, 5),
        (35, 6),
        (36, 13),
        (37, 6),
        (38, 7),
        (39, 10),
        (40, 10),
        (40, 11), 
        (41, 5),
        (42, 9),
        (43, 8), 
        (44, 6),
        (44, 9),
        (45, 20),
        (46, 20), 
        (47, 5),
        (48, 8),
        (49, 1),
        (49, 2),
        (49, 3);