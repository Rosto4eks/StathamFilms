INSERT INTO Roles (Title) VALUES
('user'),
('admin');

INSERT INTO Users (Username, Email, User_password, Role_id) VALUES
('rosto4eks', 'rosto4eks@gmail.com', 'rosto4eks', (SELECT Id FROM Roles WHERE Title = 'admin')),
('statham', 'statham@gmail.com', 'statham', (SELECT Id FROM Roles WHERE Title = 'admin')),
('pupsik228', 'pupsik228@gmail.com', 'pupsik228', (SELECT Id FROM Roles WHERE Title = 'user')),
('yarik1337', 'yarik1337@gmail.com', 'yarik1337', (SELECT Id FROM Roles WHERE Title = 'user')),
('messi10', 'messi10@gmail.com', 'messi10', (SELECT Id FROM Roles WHERE Title = 'user')),
('ronaldo7', 'ronaldo7@gmail.com', 'ronaldo7', (SELECT Id FROM Roles WHERE Title = 'user'));

INSERT INTO SubscriptionLevels (Subscription_level) VALUES
(0),
(1),
(2),
(3);

INSERT INTO SubscriptionTypes (Title, Price, Month_duration, Subscription_level) VALUES
('plus', 9.99, 1, (SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1)),
('mega plus', 99.99, 12, (SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1)),
('parker', 19.99, 1, (SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 2)),
('mechanic', 199.99, 12, (SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 2)),
('sigma', 29.99, 1, (SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 3)),
('statham', 299.99, 12, (SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 3));

INSERT INTO Subscriptions (User_id, SubscriptionType_id, Started_at, Ended_at) VALUES
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM SubscriptionTypes WHERE Title = 'statham'), '2024-01-19', '2025-01-19'),
((SELECT Id FROM Users WHERE Email = 'statham@gmail.com'), (SELECT Id FROM SubscriptionTypes WHERE Title = 'statham'), '2024-01-19', '2025-01-19'),
((SELECT Id FROM Users WHERE Email = 'pupsik228@gmail.com'), (SELECT Id FROM SubscriptionTypes WHERE Title = 'mechanic'), '2024-01-19', '2025-01-19'),
((SELECT Id FROM Users WHERE Email = 'yarik1337@gmail.com'), (SELECT Id FROM SubscriptionTypes WHERE Title = 'mega plus'), '2024-01-19', '2025-01-19'),
((SELECT Id FROM Users WHERE Email = 'messi10@gmail.com'), (SELECT Id FROM SubscriptionTypes WHERE Title = 'plus'), '2024-01-19', '2024-02-19');

INSERT INTO Movies (Subscription_level, Title, Creation_year, Duration) VALUES
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1), 'Карты, деньги, два ствола', 1998, 1.47),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 0), 'Большой куш',2000, 1.44),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1), 'Перевозчик', 2002, 1.32),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 0), 'Ограбление по-итальянски', 2003, 1.51),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1), 'Револьвер', 2005, 1.51),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1), 'Перевозчик 2', 2005, 1.27),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 2), 'Перевозчик 3', 2008, 1.44),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 0), 'Неудержимые', 2010, 1.43),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1), 'Механик', 2011, 1.33),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 1), 'Паркер', 2013, 1.58),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 2), 'Форсаж 6', 2013, 2.10),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 2), 'Форсаж 7', 2015, 2.17),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 2), 'Механик: Воскрешение', 2016, 1.38),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 3), 'Форсаж 8', 2017, 2.16),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 3), 'Мег: Монстр глубины', 2018, 1.53),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 3), 'Хоббс и Шоу', 2019, 2.17),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 3), 'Гнев человеческий', 2021, 1.59),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 2), 'Операция Фортуна', 2023, 1.54),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 3), 'Мег 2: Впадина', 2023, 1.56),
((SELECT Id FROM SubscriptionLevels WHERE Subscription_level = 2), 'Пчеловод', 2024, 1.51);

INSERT INTO Actors (First_name, Last_name, Birth_date) VALUES
('Джейсон', 'Стетхем', '1967-07-26'),
('Винни', 'Джонм', '1965-01-25'),
('Брэд', 'Питт', '1963-12-18'),
('Марк', 'Уолберг', '1971-06-05'),
('Сильвестр', 'Сталоне', '1946-07-06'),
('Дженифер', 'Лопес', '1969-07-24'),
('Вин', 'Дизель', '1967-07-18'),
('Дуэйн', 'Джонсон', '1972-05-02'),
('Эдвард', 'Нортон', '1969-08-18'),
('Пол', 'Уокер', '1973-09-12'),
('Ярослав', 'Ястремский', '2005-02-02'),
('Павел', 'Красёв', '2004-09-21'),
('Егор', 'Форинов', '2004-09-22'),
('Ростислав', 'Сергеев', '2005-01-14'),
('Антон', 'Гулис', '2004-03-29'),
('Станислав', 'Бекарев', '2005-01-24'),
('Шишов', 'Егор', '2004-12-01');

INSERT INTO Directors (First_name, Last_name, Birth_date) VALUES
('Гай', 'Ричи', '1968-09-01'),
('Гэри', 'Грэй', '1969-07-17'),
('Оливье', 'Мегатон', '1965-08-06'),
('Тейлор', 'Хэкфорд', '1944-12-31'),
('Джастин', 'Лин', '1971-10-11'),
('Джеймс', 'Ван', '1977-02-26'),
('Деннис', 'Ганзель', '1973-10-04'),
('Бен', 'Уитли', '1972-05-07'),
('Дэвид', 'Эйер', '1968-01-18'),
('Луи', 'Летерье', '1973-06-17'),
('Сильвестр', 'Сталоне', '1946-07-06'),
('Дэвид', 'Литч', '1975-11-16'),
('Саймон', 'Уэст', '1961-07-17');

INSERT INTO ViewingHistory (User_id, Movie_id, Watch_date, Duration) VALUES
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Механик'), '2024-03-23', (SELECT Duration FROM Movies WHERE Title = 'Механик')),
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Гнев человеческий'), '2024-04-18', (SELECT Duration FROM Movies WHERE Title = 'Гнев человеческий')),
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Револьвер'), '2024-06-12', 0.57),
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Неудержимые'), '2024-07-06', (SELECT Duration FROM Movies WHERE Title = 'Неудержимые')),
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Операция Фортуна'), '2024-08-01', (SELECT Duration FROM Movies WHERE Title = 'Операция Фортуна')),
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Пчеловод'), '2024-08-02', (SELECT Duration FROM Movies WHERE Title = 'Пчеловод')),
((SELECT Id FROM Users WHERE Email = 'yarik1337@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Перевозчик'), '2024-05-12', 1.17),
((SELECT Id FROM Users WHERE Email = 'yarik1337@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Револьвер'), '2024-06-23', (SELECT Duration FROM Movies WHERE Title = 'Револьвер')),
((SELECT Id FROM Users WHERE Email = 'pupsik228@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Пчеловод'), '2024-07-28', 1.17),
((SELECT Id FROM Users WHERE Email = 'pupsik228@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Операция Фортуна'), '2024-08-18', (SELECT Duration FROM Movies WHERE Title = 'Операция Фортуна'));

INSERT INTO Reviews (User_id, Movie_id, Review_text, Score, Created_at) VALUES
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Механик'), 'Неплохой фильм.', 7, '2024-03-23'),
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Гнев человеческий'), 'Один из лучших фильмов с участием Стетхема, которые я видел. Сюжет на высоте.', 9, '2024-04-19'),
((SELECT Id FROM Users WHERE Email = 'rosto4eks@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Револьвер'), 'Необычная картина от всеми любимого Гая Ричи. Сюжет я так доконца и не понял', 8, '2024-06-12'),
((SELECT Id FROM Users WHERE Email = 'yarik1337@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Револьвер'), 'Под пиво пойдет', 8, '2024-06-24'),
((SELECT Id FROM Users WHERE Email = 'pupsik228@gmail.com'), (SELECT Id FROM Movies WHERE Title = 'Пчеловод'), 'Середнячок. Есть много фильмов, намного лучше этого. Сюжет слишком прямолинейный, ни один герой кроме самого СТетхема не запомнился.', 5, '2024-07-28');

INSERT INTO Categories (Title) VALUES
('Новинка'),
('Боевик'),
('Мелодрама'),
('Экшн'),
('Гонки'),
('Сложный'),
('Комедия');

INSERT INTO MovieCategories (Movie_id, Category_id) VALUES
((SELECT Id FROM Movies WHERE Title = 'Карты, деньги, два ствола'), (SELECT Id FROM Categories WHERE Title = 'Комедия')),
((SELECT Id FROM Movies WHERE Title = 'Большой куш'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик'), (SELECT Id FROM Categories WHERE Title = 'Боевик')),
((SELECT Id FROM Movies WHERE Title = 'Ограбление по-итальянски'), (SELECT Id FROM Categories WHERE Title = 'Боевик')),
((SELECT Id FROM Movies WHERE Title = 'Револьвер'), (SELECT Id FROM Categories WHERE Title = 'Сложный')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик 2'), (SELECT Id FROM Categories WHERE Title = 'Боевик')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик 3'), (SELECT Id FROM Categories WHERE Title = 'Боевик')),
((SELECT Id FROM Movies WHERE Title = 'Неудержимые'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Механик'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Паркер'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 6'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 7'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 6'), (SELECT Id FROM Categories WHERE Title = 'Гонки')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 7'), (SELECT Id FROM Categories WHERE Title = 'Гонки')),
((SELECT Id FROM Movies WHERE Title = 'Механик: Воскрешение'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 8'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 8'), (SELECT Id FROM Categories WHERE Title = 'Гонки')),
((SELECT Id FROM Movies WHERE Title = 'Мег: Монстр глубины'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Хоббс и Шоу'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Хоббс и Шоу'), (SELECT Id FROM Categories WHERE Title = 'Комедия')),
((SELECT Id FROM Movies WHERE Title = 'Гнев человеческий'), (SELECT Id FROM Categories WHERE Title = 'Боевик')),
((SELECT Id FROM Movies WHERE Title = 'Операция Фортуна'), (SELECT Id FROM Categories WHERE Title = 'Боевик')),
((SELECT Id FROM Movies WHERE Title = 'Операция Фортуна'), (SELECT Id FROM Categories WHERE Title = 'Комедия')),
((SELECT Id FROM Movies WHERE Title = 'Мег 2: Впадина'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Пчеловод'), (SELECT Id FROM Categories WHERE Title = 'Экшн')),
((SELECT Id FROM Movies WHERE Title = 'Пчеловод'), (SELECT Id FROM Categories WHERE Title = 'Новинка'));

INSERT INTO MovieActors (Movie_id, Actor_id) VALUES
((SELECT Id FROM Movies WHERE Title = 'Карты, деньги, два ствола'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Большой куш'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Большой куш'), (SELECT Id FROM Actors WHERE Last_name = 'Питт')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Ограбление по-итальянски'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Револьвер'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик 2'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик 3'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Неудержимые'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Неудержимые'), (SELECT Id FROM Actors WHERE Last_name = 'Сталоне')),
((SELECT Id FROM Movies WHERE Title = 'Механик'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Паркер'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 6'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 6'), (SELECT Id FROM Actors WHERE Last_name = 'Уокер')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 6'), (SELECT Id FROM Actors WHERE Last_name = 'Дизель')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 7'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 7'), (SELECT Id FROM Actors WHERE Last_name = 'Дизель')),
((SELECT Id FROM Movies WHERE Title = 'Механик: Воскрешение'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 8'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 8'), (SELECT Id FROM Actors WHERE Last_name = 'Дизель')),
((SELECT Id FROM Movies WHERE Title = 'Мег: Монстр глубины'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Хоббс и Шоу'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Хоббс и Шоу'), (SELECT Id FROM Actors WHERE Last_name = 'Джонсон')),
((SELECT Id FROM Movies WHERE Title = 'Гнев человеческий'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Операция Фортуна'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Мег 2: Впадина'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем')),
((SELECT Id FROM Movies WHERE Title = 'Пчеловод'), (SELECT Id FROM Actors WHERE Last_name = 'Стетхем'));

INSERT INTO MovieDirectors (Movie_id, Director_id) VALUES
((SELECT Id FROM Movies WHERE Title = 'Карты, деньги, два ствола'), (SELECT Id FROM Directors WHERE Last_name = 'Ричи')),
((SELECT Id FROM Movies WHERE Title = 'Большой куш'), (SELECT Id FROM Directors WHERE Last_name = 'Ричи')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик'), (SELECT Id FROM Directors WHERE Last_name = 'Летерье')),
((SELECT Id FROM Movies WHERE Title = 'Ограбление по-итальянски'), (SELECT Id FROM Directors WHERE Last_name = 'Грэй')),
((SELECT Id FROM Movies WHERE Title = 'Револьвер'), (SELECT Id FROM Directors WHERE Last_name = 'Ричи')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик 2'), (SELECT Id FROM Directors WHERE Last_name = 'Летерье')),
((SELECT Id FROM Movies WHERE Title = 'Перевозчик 3'), (SELECT Id FROM Directors WHERE Last_name = 'Мегатон')),
((SELECT Id FROM Movies WHERE Title = 'Неудержимые'), (SELECT Id FROM Directors WHERE Last_name = 'Сталоне')),
((SELECT Id FROM Movies WHERE Title = 'Механик'), (SELECT Id FROM Directors WHERE Last_name = 'Уэст')),
((SELECT Id FROM Movies WHERE Title = 'Паркер'), (SELECT Id FROM Directors WHERE Last_name = 'Хэкфорд')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 6'), (SELECT Id FROM Directors WHERE Last_name = 'Лин')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 7'), (SELECT Id FROM Directors WHERE Last_name = 'Ван')),
((SELECT Id FROM Movies WHERE Title = 'Механик: Воскрешение'), (SELECT Id FROM Directors WHERE Last_name = 'Ганзель')),
((SELECT Id FROM Movies WHERE Title = 'Форсаж 8'), (SELECT Id FROM Directors WHERE Last_name = 'Грэй')),
((SELECT Id FROM Movies WHERE Title = 'Мег: Монстр глубины'), (SELECT Id FROM Directors WHERE Last_name = 'Грэй')),
((SELECT Id FROM Movies WHERE Title = 'Хоббс и Шоу'), (SELECT Id FROM Directors WHERE Last_name = 'Литч')),
((SELECT Id FROM Movies WHERE Title = 'Гнев человеческий'), (SELECT Id FROM Directors WHERE Last_name = 'Ричи')),
((SELECT Id FROM Movies WHERE Title = 'Операция Фортуна'), (SELECT Id FROM Directors WHERE Last_name = 'Ричи')),
((SELECT Id FROM Movies WHERE Title = 'Мег 2: Впадина'), (SELECT Id FROM Directors WHERE Last_name = 'Уитли')),
((SELECT Id FROM Movies WHERE Title = 'Пчеловод'), (SELECT Id FROM Directors WHERE Last_name = 'Эйер'));
