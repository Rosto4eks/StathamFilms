## Ростислав Сергеев 253502
### StathamFilms - онлайн кинотеатр со всеми фильмами Джейсона Стейтхема (Json Statham)
Пользователи сайта имеют возможность просматривать фильмы, некоторые фильмы требуют наличия определенной подписки у пользователя. Также пользователи имеют возможность оставлять отзывы к фильмам.

Пользователи с ролью администратора могут выкладывать новые фильмы, добавлять актеров, режиссеров, удалять чужие отзывы, добавлять новые подписки и категории.
## Функциональные требования:
### - аутентификация / авторизация пользователей

аутентификация пользователей посредством сравнения почты и хэшированного пароля

авторизация пользователей с использованием JWT токенов

### - CRUD операции

CRUD операции с пользователями, актерами, режиссерами, отзывами, фильмами и категориями

### - Роли

Пользователь (user) - просмотр фильмов, CRUD своих отзывов, покупка подписки.

Администратор (admin) - весь функционал пользователя, CRUD всех фильмов, отзывов, категорий, актеров и режиссеров.

## Журналирование

Сохранение истории подписок и просмотренных фильмов пользователя.

# Таблицы базы данных
users (Таблица пользователей): 
  - id integer Primary key - первичный ключ
  - username varchar not null - пользовательское имя
  - email varchar Unique not null- электронная почта
  - password varchar not null- пароль
  - role varchar not null - роль

movies (1:M Таблица с фильмами):
  - id integer Primary key - первичный ключ
  - subscription_id integer not null references subscriptions(id) 
  - title varchar not null - название фильма
  - year date not null - год выпуска фильма
  - duration float not null - длительность

actors (Таблица с актерами):
  - id integer Primary key - первичный ключ
  - first_name varchar not null - имя актера
  - last_name varchar not null - фамилия актера
  - birth_date date - день рождения актера

directors (Таблица с режиссерами):
  - id integer Primary key - первичный ключ
  - first_name varchar not null - имя режиссера
  - last_name varchar not null - фамилия режиссера
  - birth_date date - день рождения режиссера

subscriptionTypes (Таблица с подписками):
  - id integer Primary key - первичный ключ
  - name varchar not null - название подписки
  - price money not null - цена
  - duration integer not null - длительность подписки в месяцах

reviews (1:M Таблица с отзывами):
  - id integer Primary key - первичный ключ
  - user_id integer not null references users(id) - внешний ключ 
  - movie_id integer not null references movies(id) - внешний ключ 
  - created_at date not null - дата написания отзыва

Subscruptions (1:1 Таблица подписок пользователей):
  - id integer Primary key - первичный ключ
  - user_id integer Unique not null references users(id) - уникальный внешний ключ users.id
  - subscriptionType_id integer not null references users(id) - внешний ключ
  - amount integer not null - количество
  - start_date date not null - начало
  - end_date date not null - окончание

viewingHistory (M:1 Таблица просмотров фильмов):
  - id integer Primary key - первичный ключ
  - user_id integer not null references users(id) -  внешний ключ users.id
  - movie_id integer not null references movies(id) - внешний ключ movies.id
  - watch_date date not null - дата просмотра
  - duration float not null - продолжительность

categories (Таблица категорий):
  - id integer Primary key - первичный ключ
  - name varchar not null - название категории

movieCategories (M:M Таблица связи фильмов и категорий):
  - movie_id integer not null references movies(id) - внешний ключ movies.id
  - category_id integer not null references categories(id) - внешний ключ categories.id
}

movieActors (M:M Таблица связи фильмов и актеров):
  - movie_id integer not null references movies(id) - внешний ключ movies.id
  - actor_id integer not null references actors(id) - внешний ключ actors.id
  - role varchar - роль в фильме

movieDirectors (M:M Таблица связи фильмов и режиссеров):
  - movie_id integer not null references movies(id) - внешний ключ movies.id
  - director_id integer not null references directors(id) - внешний ключ directors.id
