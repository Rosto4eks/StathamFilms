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
users (Таблица пользователей): 
  - id integer Primary key - первичный ключ
  - username varchar(64) not null - пользовательское имя
  - email varchar(128) Unique not null- электронная почта
  - password varchar(128) not null- пароль
  - role varchar(64) not null - роль

movies (1:M Таблица с фильмами):
  - id integer Primary key - первичный ключ
  - subscription_id integer not null references subscriptions(id) 
  - title varchar(256) not null - название фильма
  - year date not null - год выпуска фильма
  - duration interval not null - длительность

actors (Таблица с актерами):
  - id integer Primary key - первичный ключ
  - first_name varchar(128) not null - имя актера
  - last_name varchar(128) not null - фамилия актера
  - birth_date date - день рождения актера

directors (Таблица с режиссерами):
  - id integer Primary key - первичный ключ
  - first_name varchar(128) not null - имя режиссера
  - last_name varchar(128) not null - фамилия режиссера
  - birth_date date - день рождения режиссера

subscriptionTypes (Таблица с подписками):
  - id integer Primary key - первичный ключ
  - name varchar(128) not null - название подписки
  - price numeric not null - цена
  - duration interval not null - длительность подписки в месяцах

reviews (1:M Таблица с отзывами):
  - id integer Primary key - первичный ключ
  - user_id integer not null references users(id) - внешний ключ 
  - movie_id integer not null references movies(id) - внешний ключ
  - text text not null - текст отзыва
  - score integer not null - оценка
  - created_at date not null - дата написания отзыва

subscriptions (1:1 Таблица подписок пользователей):
  - id integer Primary key - первичный ключ
  - user_id integer Unique not null references users(id) - уникальный внешний ключ users.id
  - subscriptionType_id integer not null references users(id) - внешний ключ
  - start_date date not null - начало
  - end_date date not null - окончание

viewingHistory (M:1 Таблица просмотров фильмов):
  - id integer Primary key - первичный ключ
  - user_id integer not null references users(id) -  внешний ключ users.id
  - movie_id integer not null references movies(id) - внешний ключ movies.id
  - watch_date date not null - дата просмотра
  - duration interval not null - продолжительность

categories (Таблица категорий):
  - id integer Primary key - первичный ключ
  - name varchar(128) not null - название категории

movieCategories (M:M Таблица связи фильмов и категорий):
  - movie_id integer not null references movies(id) - внешний ключ movies.id
  - category_id integer not null references categories(id) - внешний ключ 

movieActors (M:M Таблица связи фильмов и актеров):
  - movie_id integer not null references movies(id) - внешний ключ movies.id
  - actor_id integer not null references actors(id) - внешний ключ actors.id
  - role varchar - роль в фильме

movieDirectors (M:M Таблица связи фильмов и режиссеров):
  - movie_id integer not null references movies(id) - внешний ключ movies.id
  - director_id integer not null references directors(id) - внешний ключ directors.id
