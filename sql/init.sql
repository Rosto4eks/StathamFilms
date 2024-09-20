  CREATE TABLE Roles (
    Id SERIAL PRIMARY KEY,
    Title VARCHAR(64) UNIQUE NOT NULL
  );

  CREATE TABLE Users (
    Id SERIAL PRIMARY KEY,
    Username VARCHAR(64) NOT NULL,
    Email VARCHAR(128) UNIQUE NOT NULL,
    User_password VARCHAR(128) NOT NULL,
    Role_id INTEGER REFERENCES Roles (Id)
  );

  CREATE TABLE SubscriptionLevels (
    Id SERIAL PRIMARY KEY,
    Subscription_level INTEGER NOT NULL
  );

  CREATE TABLE SubscriptionTypes (
    Id SERIAL PRIMARY KEY,
    Title VARCHAR(128) UNIQUE NOT NULL,
    Price numeric(10, 2) NOT NULL,
    Month_duration INTEGER NOT NULL,
    Subscription_level INTEGER REFERENCES SubscriptionLevels (Id),
    CHECK(Price > 0 AND Month_duration > 0)
  );

  CREATE TABLE Subscriptions (
    Id SERIAL PRIMARY KEY,
    User_id INTEGER NOT NULL REFERENCES Users (Id),
    SubscriptionType_id INTEGER NOT NULL REFERENCES SubscriptionTypes (Id),
    Started_at DATE NOT NULL,
    Ended_at DATE NOT NULL
  );

  CREATE TABLE Movies (
    Id SERIAL PRIMARY KEY,
    Subscription_level INTEGER REFERENCES SubscriptionLevels (Id),
    Title VARCHAR(256) UNIQUE NOT NULL,
    Creation_year INTEGER NOT NULL,
    Duration NUMERIC(10, 2) NOT NULL,
    CHECK(Duration > 0)
  );

  CREATE TABLE Actors (
    Id SERIAL PRIMARY KEY,
    First_name VARCHAR(128) NOT NULL,
    Last_name VARCHAR(128) NOT NULL,
    Birth_date DATE NOT NULL
  );

  CREATE TABLE Directors (
    Id SERIAL PRIMARY KEY,
    First_name VARCHAR(128) NOT NULL,
    Last_name VARCHAR(128) NOT NULL,
    Birth_date DATE NOT NULL
  );

  CREATE TABLE ViewingHistory (
    Id SERIAL PRIMARY KEY,
    User_id INTEGER NOT NULL REFERENCES Users (Id) ON DELETE CASCADE,
    Movie_id INTEGER NOT NULL REFERENCES Movies (Id),
    Watch_date DATE NOT NULL,
    Duration NUMERIC(10, 2) NOT NULL,
    CHECK(Duration > 0)
  );

  CREATE TABLE Reviews (
    Id SERIAL PRIMARY KEY,
    User_id INTEGER NOT NULL REFERENCES Users (Id) ON DELETE CASCADE,
    Movie_id INTEGER NOT NULL REFERENCES Movies (Id) ON DELETE CASCADE,
    Review_text TEXT NOT NULL,
    Score INTEGER NOT NULL,
    Created_at DATE NOT NULL,
    CHECK(Score > 0 AND Score <= 10)
  );

  CREATE TABLE Categories (
    Id SERIAL PRIMARY KEY,
    Title VARCHAR(128) UNIQUE NOT NULL
  );

  CREATE TABLE MovieCategories (
    Movie_id INTEGER NOT NULL REFERENCES Movies (Id) ON DELETE CASCADE,
    Category_id INTEGER NOT NULL REFERENCES Categories (Id) ON DELETE CASCADE
  );

  CREATE TABLE MovieActors (
    Movie_id INTEGER NOT NULL REFERENCES Movies (Id) ON DELETE CASCADE,
    Actor_id INTEGER NOT NULL REFERENCES Actors (Id) ON DELETE CASCADE,
    Movie_role VARCHAR(128) DEFAULT 'актёр'
  );

  CREATE TABLE MovieDirectors (
    Movie_id INTEGER NOT NULL REFERENCES Movies (Id) ON DELETE CASCADE,
    Director_id INTEGER NOT NULL REFERENCES Directors (Id) ON DELETE CASCADE
  );
