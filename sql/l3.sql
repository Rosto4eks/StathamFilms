-- Roles

SELECT * FROM Roles;



-- Users

-- get user by id
SELECT * FROM Users WHERE Id = 1;

-- get user by email
SELECT * FROM Users WHERE Email = 'rosto4eks@gmail.com';

-- delete user
DELETE FROM Users WHERE Email = 'rosto4eks@gmail.com';



-- SubscriptionLevels

-- get level by id
SELECT * FROM SubscriptionLevels WHERE id = 1;



-- SubscriptionTypes

-- get all subscription types
SELECT * FROM SubscriptionTypes;

-- get subscription type by id
SELECT * FROM SubscriptionTypes WHERE Id = 1;



-- Subscriptions

-- get last user subscription
SELECT * FROM Subscriptions WHERE User_id = 1 ORDER BY Ended_at DESC LIMIT 1;



-- Movies

-- get movie page
SELECT * FROM Movies OFFSET 0 LIMIT 10;

-- search movie by name
SELECT * FROM Movies WHERE Title LIKE '%де%' OFFSET 0 LIMIT 10;

-- filter movies by year
SELECT * FROM Movies WHERE Creation_year BETWEEN 2010 AND 2020 OFFSET 0 LIMIT 10;

-- delete movie 
DELETE FROM Movies WHERE Id = 2;


-- Actors

-- get actors
SELECT * FROM Actors OFFSET 0 LIMIT 10;

-- get actor by name
SELECT * FROM Actors WHERE First_name LIKE '%Дж%' OFFSET 0 LIMIT 10;

-- add actor
INSERT INTO Actors (First_name, Last_name, Birth_date) VALUES
('Джейсон', 'Стетхем', '1967-07-26');

-- edit actor 
UPDATE Actors SET (First_name, Last_name, Birth_date) = ('Джейсон', 'Стетхем', '1967-07-26')
WHERE First_name = 'Джейсон';

-- delete actor
DELETE FROM Actors WHERE Id = 1;



-- Directors

-- get directors
SELECT * FROM Directors OFFSET 0 LIMIT 10;

-- get director by name
SELECT * FROM Directors WHERE First_name LIKE '%Дж%' OFFSET 0 LIMIT 10;

-- add director
INSERT INTO Directors (First_name, Last_name, Birth_date) VALUES
('Джейсон', 'Стетхем', '1967-07-26');

-- edit director
UPDATE Directors SET (First_name, Last_name, Birth_date) = ('Джейсон', 'Стетхем', '1967-07-26')
WHERE First_name = 'Джейсон';

-- delete director
DELETE FROM Directors WHERE Id = 1;



-- ViewingHistory

-- add new 
INSERT INTO ViewingHistory (User_id, Movie_id, Watch_date, Duration) VALUES (1, 1, '2024-03-23', 1.05);


-- reviews

-- get review for film
SELECT * FROM Reviews WHERE Movie_id = 1;

-- add new review
INSERT INTO Reviews (User_id, Movie_id, Review_text, Score, Created_at) VALUES
(1, 1, 'Неплохой фильм.', 7, '2024-03-23');

-- delete review
DELETE FROM Reviews WHERE User_id = 1 AND Id = 1;



-- categories

-- add new category
INSERT INTO Categories (Title) VALUES
('Новинка');

-- delete category
DELETE FROM Categories WHERE Id = 1;

-- update category
UPDATE Categories SET Title = "Новинки" WHERE Id = 1;



-- MovieCategories

-- delete
DELETE FROM MovieCategories WHERE Id = 5;



-- MovieActors

-- delete
DELETE FROM MovieActors WHERE Id = 5;



-- MovieDirectors

-- delete
DELETE FROM MovieDirectors WHERE Id = 5;