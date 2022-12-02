CREATE TABLE IF NOT EXISTS authors (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  game_id integer,
  music_albums_id integer,
  book_id integer,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  CONSTRAINT authors_game_fk FOREIGN KEY(game_id) REFERENCES games (id),
  CONSTRAINT authors_music_album_fk FOREIGN KEY(music_albums_id) REFERENCES music_album (id),
  CONSTRAINT authors_book_fk FOREIGN KEY(book_id) REFERENCES book (id)
  );

CREATE TABLE IF NOT EXISTS games (
  id INT,
  multiplayer BOOLEAN,
  last_played_at DATE,
  genre VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  lable VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
)

CREATE TABLE IF NOT EXISTS book (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    lable VARCHAR(255) NOT NULL,
    publish_date DATE NOT NULL,
    publisher VARCHAR(255) NOT NULL
    cover_state VARCHAR(255) NOT NULL
    archived boolean
);

CREATE TABLE IF NOT EXISTS music_album (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    lable VARCHAR(255) NOT NULL,
    publish_date DATE NOT NULL,
    archived boolean
);

CREATE TABLE IF NOT EXISTS genre (
    id SERIAL PRIMARY KEY,
    music_albums_id integer,
    book_id integer,
    game_id integer,
    genre_name VARCHAR(255) NOT NULL,
    CONSTRAINT music_genre_fk FOREIGN KEY(music_albums_id) REFERENCES music_album (id),
    CONSTRAINT genre_book_fk FOREIGN KEY(book_id) REFERENCES book (id),
    CONSTRAINT genre_game_fk FOREIGN KEY(game_id) REFERENCES games (id)
    );


CREATE TABLE IF NOT EXISTS label (
    id SERIAL PRIMARY KEY,
    label_id integer,
    music_albums_id integer,
    game_id integer,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255)
    CONSTRAINT label_book_fk FOREIGN KEY(label_id) REFERENCES book (id),
    CONSTRAINT label_music_album_fk FOREIGN KEY(music_albums_id) REFERENCES music_album (id),
    CONSTRAINT label_game_fk FOREIGN KEY(game_id) REFERENCES games (id)
    );




