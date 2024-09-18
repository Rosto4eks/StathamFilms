## Ростислав Сергеев 253502
### StathamFilms - онлайн кинотеатр со всеми фильмами Джейсона Стейтхема (Json Statham)
Пользователи сайта имеют возможность просматривать фильмы, некоторые фильмы требуют наличия определенной подписки у пользователя. Также пользователи имеют возможность оставлять отзывы к фильмам.

Пользователи с ролью администратора могут выкладывать новые фильмы, добавлять актеров, режиссеров, удалять чужие отзывы, добавлять новые подписки и категории.
## Функциональные требования:
<hr></hr>

### Каталог фильмов:
Отображение списка всех доступных фильмов с Джейсоном Стейтхемом

Фильтрация фильмов по жанру, году выпуска, рейтингу

Поиск фильмов по названию, актерам, режиссерам

Сортировка фильмов по различным параметрам (дата добавления, рейтинг, популярность)

Отображение детальной информации о фильме (описание, актерский состав, режиссер, год выпуска, рейтинг)

<hr></hr>

### Система подписок:
Различные типы подписок с разным набором доступных фильмов

Возможность приобретения подписки

Отображение информации о текущей подписке и сроке ее действия

<hr></hr>

### Отзывы и рейтинги:
Возможность оставлять текстовые отзывы к фильмам

Система оценок фильмов (например, от 1 до 10 звезд)

Отображение средней оценки фильма

Возможность лайкать/дизлайкать отзывы других пользователей

<hr></hr>

### аутентификация / авторизация пользователей

аутентификация пользователей посредством сравнения почты и хэшированного пароля

авторизация пользователей с использованием JWT токенов

<hr></hr>

### CRUD операции

CRUD операции с пользователями, актерами, режиссерами, отзывами, фильмами и категориями

<hr></hr>

### Роли

Пользователь (user) - просмотр фильмов, CRUD своих отзывов, покупка подписки.

Администратор (admin) - весь функционал пользователя, CRUD всех фильмов, отзывов, категорий, актеров и режиссеров.

<hr></hr>

### Журналирование

Сохранение истории подписок и просмотренных фильмов пользователя.

# Таблицы базы данных
![alt text](https://github.com/Rosto4eks/StathamFilms/blob/master/content/diagram.png)

Users (
  - Id SERIAL PRIMARY KEY,
  - Username VARCHAR(64) NOT NULL,
  - Email VARCHAR(128) UNIQUE NOT NULL,
  - User_password VARCHAR(128) NOT NULL,
  - User_role VARCHAR(64) DEFAULT 'guest',
);

SubscriptionTypes (
  - Id SERIAL PRIMARY KEY,
  - Title VARCHAR(128) UNIQUE NOT NULL,
  - Price numeric(10, 2) NOT NULL,
  - Month_duration INTEGER NOT NULL,
);

Subscriptions (
  - Id SERIAL PRIMARY KEY,
  - User_id INTEGER NOT NULL REFERENCES Users (Id),
  - SubscriptionType_id INTEGER NOT NULL REFERENCES SubscriptionTypes (Id),
  - Started_at DATE NOT NULL,
  - Ended_at DATE NOT NULL
);

Movies (
  - Id SERIAL PRIMARY KEY,
  - Subscription_id INTEGER REFERENCES SubscriptionTypes (Id),
  - Title VARCHAR(256) NOT NULL,
  - Created_at DATE NOT NULL,
  - Duration NUMERIC(10, 2) NOT NULL,
);

Actors (
  - Id SERIAL PRIMARY KEY,
  - First_name VARCHAR(128) NOT NULL,
  - Last_name VARCHAR(128) NOT NULL,
  - Birth_date DATE NOT NULL
);

Directors (
  - Id SERIAL PRIMARY KEY,
  - First_name VARCHAR(128) NOT NULL,
  - Last_name VARCHAR(128) NOT NULL,
  - Birth_date DATE NOT NULL
);

Reviews (
  - Id SERIAL PRIMARY KEY,
  - User_id INTEGER NOT NULL REFERENCES Users (Id) ON DELETE CASCADE,
  - Movie_id INTEGER NOT NULL REFERENCES Movies (Id) ON DELETE CASCADE,
  - Review_text TEXT NOT NULL,
  - Score INTEGER NOT NULL,
  - Created_at DATE NOT NULL,
);

ViewingHistory (
  - Id SERIAL PRIMARY KEY,
  - User_id INTEGER NOT NULL REFERENCES Users (Id) ON DELETE CASCADE,
  - Movie_id INTEGER NOT NULL REFERENCES Movies (Id),
  - Watch_date DATE NOT NULL,
  - Duration NUMERIC(10, 2) NOT NULL,
);

Categories (
  - Id SERIAL PRIMARY KEY,
  - Title VARCHAR(128) UNIQUE NOT NULL
);

MovieCategories (
  - Movie_id INTEGER NOT NULL REFERENCES Movies (Id) ON DELETE CASCADE,
  - Category_id INTEGER NOT NULL REFERENCES Categories (Id) ON DELETE CASCADE
);

MovieActors (
  - Movie_id INTEGER NOT NULL REFERENCES Movies (Id) ON DELETE CASCADE,
  - Actor_id INTEGER NOT NULL REFERENCES Actors (Id) ON DELETE CASCADE,
  - Movie_role VARCHAR(128) NOT NULL
);

MovieDirectors (
  - Movie_id INTEGER NOT NULL REFERENCES Movies (Id) ON DELETE CASCADE,
  - Director_id INTEGER NOT NULL REFERENCES Directors (Id) ON DELETE CASCADE
);
