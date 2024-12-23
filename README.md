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

Сортировка фильмов по различным параметрам (год, название, рейтинг)

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

<hr></hr>

### аутентификация / авторизация пользователей

аутентификация пользователей посредством сравнения почты и пароля

<hr></hr>

### CRUD операции

CRUD операции с пользователями, актерами, режиссерами, отзывами, фильмами и категориями

<hr></hr>

### Роли

Пользователь (user) - просмотр фильмов, CRUD своих отзывов, покупка подписки.

Администратор (admin) - весь функционал пользователя, CRUD всех фильмов, категорий.

<hr></hr>

### Журналирование

Сохранение истории подписок и просмотренных фильмов пользователя.

# Таблицы базы данных
![alt text](https://github.com/Rosto4eks/StathamFilms/blob/master/content/diagram.png)


1. Таблица `Roles`:
   - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор роли.
   - `Title` (VARCHAR(64) UNIQUE NOT NULL): Название роли, должно быть уникальным и не может быть пустым.

2. Таблица `Users`:
   - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор пользователя.
   - `Username` (VARCHAR(64) NOT NULL): Имя пользователя, не может быть пустым.
   - `Email` (VARCHAR(128) UNIQUE NOT NULL): Электронная почта пользователя, должна быть уникальной и не может быть пустой.
   - `User_password` (VARCHAR(128) NOT NULL): Пароль пользователя, не может быть пустым.
   - `Role_id` (INTEGER REFERENCES Roles(Id)): Идентификатор роли пользователя, ссылается на таблицу `Roles`.

3. Таблица `SubscriptionLevels`:
   - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор уровня подписки.
   - `Subscription_level` (INTEGER NOT NULL): Уровень подписки, не может быть пустым.

4. Таблица `SubscriptionTypes`:
   - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор типа подписки.
   - `Title` (VARCHAR(128) UNIQUE NOT NULL): Название типа подписки, должно быть уникальным и не может быть пустым.
   - `Price` (NUMERIC(10, 2) NOT NULL): Цена подписки, не может быть пустой и должна быть положительной (CHECK(Price > 0)).
   - `Month_duration` (INTEGER NOT NULL): Продолжительность подписки в месяцах, не может быть пустой и должна быть положительной (CHECK(Month_duration > 0)).
   - `Subscription_level` (INTEGER REFERENCES SubscriptionLevels(Id)): Идентификатор уровня подписки, ссылается на таблицу `SubscriptionLevels`.

5. Таблица `Subscriptions`:
   - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор подписки .
   - `User_id` (INTEGER NOT NULL REFERENCES Users(Id)): Идентификатор пользователя, ссылается на таблицу `Users`.
   - `SubscriptionType_id` (INTEGER NOT NULL REFERENCES SubscriptionTypes(Id)): Идентификатор типа подписки, ссылается на таблицу `SubscriptionTypes`.
   - `Started_at` (DATE NOT NULL): Дата начала подписки, не может быть пустой.
   - `Ended_at` (DATE NOT NULL): Дата окончания подписки, не может быть пустой.

6. Таблица `Movies`:
   - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор фильма .
   - `Subscription_level` (INTEGER REFERENCES SubscriptionLevels(Id)): Идентификатор уровня подписки, необходимого для просмотра фильма, ссылается на таблицу `SubscriptionLevels`.
   - `Title` (VARCHAR(256) UNIQUE NOT NULL): Название фильма, должно быть уникальным и не может быть пустым.
   - `Creation_year` (INTEGER NOT NULL): Год создания фильма, не может быть пустым.
   - `Duration` (NUMERIC(10, 2) NOT NULL): Продолжительность фильма, не может быть пустой и должна быть положительной (CHECK(Duration > 0)).

7. Таблица `Actors`:
   - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор актера .
   - `First_name` (VARCHAR(128) NOT NULL): Имя актера, не может быть пустым.
   - `Last_name` (VARCHAR(128) NOT NULL): Фамилия актера, не может быть пустой.
   - `Birth_date` (DATE NOT NULL): Дата рождения актера, не может быть пустой.

8. Таблица `Directors`:
   - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор режиссера .
   - `First_name` (VARCHAR(128) NOT NULL): Имя режиссера, не может быть пустым.
   - `Last_name` (VARCHAR(128) NOT NULL): Фамилия режиссера, не может быть пустой.
   - `Birth_date` (DATE NOT NULL): Дата рождения режиссера, не может быть пустой.

9. Таблица `ViewingHistory`:
    - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор записи в истории просмотров .
    - `User_id` (INTEGER NOT NULL REFERENCES Users(Id) ON DELETE CASCADE): Идентификатор пользователя, ссылается на таблицу `Users`. При удалении пользователя, соответствующие записи в истории просмотров также удаляются (ON DELETE CASCADE).
    - `Movie_id` (INTEGER NOT NULL REFERENCES Movies(Id)): Идентификатор просмотренного фильма, ссылается на таблицу `Movies`.
    - `Watch_date` (DATE NOT NULL): Дата просмотра фильма, не может быть пустой.
    - `Duration` (NUMERIC(10, 2) NOT NULL): Продолжительность просмотра фильма, не может быть пустой и должна быть положительной (CHECK(Duration > 0)).

10. Таблица `Reviews`:
    - `Id` (SERIAL PRIMARY KEY): Уникальный идентификатор отзыва .
    - `User_id` (INTEGER NOT NULL REFERENCES Users(Id) ON DELETE CASCADE): Идентификатор пользователя, оставившего отзыв, ссылается на таблицу `Users`. При удалении пользователя, соответствующие отзывы также удаляются (ON DELETE CASCADE).
    - `Movie_id` (INTEGER NOT NULL REFERENCES Movies(Id) ON DELETE CASCADE): Идентификатор фильма, на который оставлен отзыв, ссылается на таблицу `Movies`. При удалении фильма, соответствующие отзывы также удаляются (ON DELETE CASCADE).
    - `Review_text` (TEXT NOT NULL): Текст отзыва, не может быть пустым.
    - `Score` (INTEGER NOT NULL): Оценка фильма, не может быть пустой и должна быть в диапазоне от 1 до 10 (CHECK(Score > 0 AND Score <= 10)).
    - `Created_at` (DATE NOT NULL): Дата создания отзыва, не может быть пустой.

11. Таблица `Categories`:
    - `Id` (SERIAL PRIMARY KEY): Уникальный идентифик
    - `Title` (VARCHAR(128) UNIQUE NOT NULL): Название категории, должно быть уникальным и не может быть пустым.

12. Таблица `MovieCategories`:
    - `Movie_id` (INTEGER NOT NULL REFERENCES Movies(Id) ON DELETE CASCADE): Идентификатор фильма, ссылается на таблицу `Movies`. При удалении фильма, соответствующие записи в этой таблице также удаляются (ON DELETE CASCADE).
    - `Category_id` (INTEGER NOT NULL REFERENCES Categories(Id) ON DELETE CASCADE): Идентификатор категории, ссылается на таблицу `Categories`. При удалении категории, соответствующие записи в этой таблице также удаляются (ON DELETE CASCADE).

13. Таблица `MovieActors`:
    - `Movie_id` (INTEGER NOT NULL REFERENCES Movies(Id) ON DELETE CASCADE): Идентификатор фильма, ссылается на таблицу `Movies`. При удалении фильма, соответствующие записи в этой таблице также удаляются (ON DELETE CASCADE).
    - `Actor_id` (INTEGER NOT NULL REFERENCES Actors(Id) ON DELETE CASCADE): Идентификатор актера, ссылается на таблицу `Actors`. При удалении актера, соответствующие записи в этой таблице также удаляются (ON DELETE CASCADE).
    - `Movie_role` (VARCHAR(128) DEFAULT 'актёр'): Роль актера в фильме, по умолчанию 'актёр'.

14. Таблица `MovieDirectors`:
    - `Movie_id` (INTEGER NOT NULL REFERENCES Movies(Id) ON DELETE CASCADE): Идентификатор фильма, ссылается на таблицу `Movies`. При удалении фильма, соответствующие записи в этой таблице также удаляются (ON DELETE CASCADE).
    - `Director_id` (INTEGER NOT NULL REFERENCES Directors(Id) ON DELETE CASCADE): Идентификатор режиссера, ссылается на таблицу `Directors`. При удалении режиссера, соответствующие записи в этой таблице также удаляются (ON DELETE CASCADE).
