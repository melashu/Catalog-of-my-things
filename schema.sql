CREATE TABLE IF NOT EXISTS authors (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  FOREIGN KEY(item_id) REFERENCES item(id)
);
CREATE TABLE IF NOT EXISTS games (
  id INT,
  multiplayer BOOLEAN,
  last_played_at DATE,
  PRIMARY KEY (id),
  FOREIGN KEY(game_id) REFERENCES games(id),
  FOREIGN KEY(author_id) REFERENCES authors(id)
)
CREATE TABLE IF NOT EXISTS music_album (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    source VARCHAR(255) NOT NULL,
    lable VARCHAR(255) NOT NULL,
    publish_date DATE NOT NULL,
    archived boolean
);

CREATE TABLE IF NOT EXISTS genre (
    id SERIAL PRIMARY KEY,
    music_albums_id integer,
    genre_name VARCHAR(255) NOT NULL,
    CONSTRAINT music_genre FOREIGN KEY(music_albums_id) REFERENCES music_album (id));


CREATE TABLE IF NOT EXISTS label (
    id SERIAL PRIMARY KEY,
    label_id integer,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255)
    CONSTRAINT label_fk FOREIGN KEY(label_id) REFERENCES book (id));

CREATE TABLE IF NOT EXISTS book (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    source VARCHAR(255) NOT NULL,
    lable VARCHAR(255) NOT NULL,
    publish_date DATE NOT NULL,
    publisher VARCHAR(255) NOT NULL
    cover_state VARCHAR(255) NOT NULL
    archived boolean
);



