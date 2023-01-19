CREATE TABLE games (
    id INT GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    author VARCHAR(50),
    archived BOOLEAN,
    published_date DATE,
    PRIMARY KEY(id)
);

CREATE TABLE author (
  id  INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  PRIMARY KEY(id)
);