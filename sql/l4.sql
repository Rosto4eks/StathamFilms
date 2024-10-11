-- users

-- add new user
INSERT INTO Users (Username, Email, User_password, Role_id) VALUES
('rosto4eks', 'rosto4eks@gmail.com', 'rosto4eks', (SELECT Id FROM Roles WHERE Title = 'admin'));

-- update user 
UPDATE Users SET Role_id = (SELECT Id FROM Roles WHERE Title = 'admin') WHERE Email = 'rosto4eks@gmail.com';
UPDATE Users SET Username = "rs" WHERE Email = 'rosto4eks@gmail.com';
UPDATE Users SET User_password = "rs12345" WHERE Email = 'rosto4eks@gmail.com';

-- get all users and their subscriptions
SELECT Users.Id, Users.Username, Subscriptions.SubscriptionType_id
FROM Users
LEFT JOIN Subscriptions ON Users.Id = Subscriptions.User_id;

-- get user who have at least one review
SELECT u.Id, u.Email
FROM Users u
WHERE EXISTS (
    SELECT 1
    FROM Reviews r
    WHERE r.User_id = u.Id
);



--- subscriptionTypes

-- add new subscription type
INSERT INTO SubscriptionTypes (Title, Price, Month_duration, Subscription_level) VALUES
('omega', 49.99, 3, (SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 3));



-- subscriptions

-- add new subscription
INSERT INTO Subscriptions (User_id, SubscriptionType_id, Started_at, Ended_at) VALUES
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), 2, '2024-01-19', '2025-01-19');

-- get how much each user spend

SELECT user_id, SUM(Price) FROM Subscriptions
JOIN SubscriptionTypes ON Subscriptions.SubscriptionType_id = SubscriptionTypes.Id
GROUP BY user_id;



-- subscription levels
SELECT 
Subscription_level,
CASE Subscription_level
    WHEN 0 THEN 'only free films'
    WHEN 1 THEN 'oldest films'
    WHEN 2 THEN 'most films'
    WHEN 3 THEN 'all films'
    ELSE 'new subscription'
END AS Details
FROM SubscriptionLevels;



-- movies

-- add new movie
INSERT INTO Movies (Subscription_level, Title, Creation_year, Duration) VALUES
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1), 'Карты, деньги, два ствола', 1998, 1.47);

-- update movie
UPDATE Movies SET (Subscription_level, Title, Creation_year, Duration) = ((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1), 'Карты, деньги, два ствола', 1998, 1.47)
WHERE Id = 2;

-- filter movies by actor
SELECT * FROM Movies m
JOIN MovieActors ma ON m.Id = ma.Movie_id
JOIN Actors a ON ma.Actor_id = a.id
WHERE a.First_name LIKE 'Сильвестр' AND a.Last_name LIKE 'Сталоне';

-- filter movies by subscription level
SELECT * FROM Movies m
JOIN SubscriptionLevels s ON m.Subscription_level = s.id;

-- get actor movies
SELECT * FROM Actors a
JOIN MovieActors ma ON a.Id = ma.Actor_id
JOIN Movies m ON m.Id = ma.Movie_id
WHERE First_name Like '%Вин%'
OFFSET 0 LIMIT 10;

-- get director movies
SELECT * FROM Directors a
JOIN MovieDirectors ma ON a.Id = ma.Actor_id
JOIN Movies m ON m.Id = ma.Movie_id
WHERE First_name Like '%Вин%'
OFFSET 0 LIMIT 10;



-- Viewing history

-- get user history
SELECT * FROM ViewingHistory v 
JOIN Movies m ON v.Movie_id = m.Id
WHERE User_id = 1 ORDER BY Watch_date DESC;

-- get users who ever had watched films

SELECT user_id, SUM(Duration) as s FROM ViewingHistory
GROUP BY user_id
HAVING SUM(Duration) > 0
ORDER BY SUM(Duration) DESC;


-- categories

-- get movie categories
SELECT Title FROM Categories c
JOIN MovieCategories mc ON c.Id = mc.Category_id AND mc.Movie_id = 1;

-- movieCategories

-- add
INSERT INTO MovieCategories (Movie_id, Category_id) VALUES
((SELECT Id FROM Movies WHERE Title = 'Карты, деньги, два ствола'), (SELECT Id FROM Categories WHERE Title = 'Комедия'));



-- movieActors

-- add
INSERT INTO MovieActors (Movie_id, Actor_id) VALUES
((SELECT Id FROM Movies WHERE Title = 'Карты, деньги, два ствола'), (SELECT Id FROM Actor WHERE First_name = 'Джейсон'));



-- movieDirectors

-- add
INSERT INTO MovieDirectors (Movie_id, Director_id) VALUES
((SELECT Id FROM Movies WHERE Title = 'Карты, деньги, два ствола'), (SELECT Id FROM Directors WHERE First_name = 'Сильвестр'));



-- get all actors and directors
SELECT First_name, Last_name FROM actors
UNION
SELECT First_name, Last_name FROM directors;



-- view
CREATE OR REPLACE VIEW UserLevels AS
SELECT Users.Id, COALESCE(SubscriptionLevels.Subscription_level, 0) AS subscription_level FROM Users
LEFT JOIN Subscriptions ON Users.Id = Subscriptions.user_id AND Subscriptions.Ended_at >= NOW()
LEFT JOIN SubscriptionTypes ON SubscriptionTypes.Id = Subscriptions.SubscriptionType_id
LEFT JOIN SubscriptionLevels ON SubscriptionLevels.Id = SubscriptionTypes.Subscription_level;

-- select from view
SELECT subscription_level FROM UserLevels WHERE Id = 2;