CREATE TABLE IF NOT EXISTS music_albums (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL,
    source VARCHAR(50) NOT NULL,
    lable VARCHAR(50) NOT NULL,
    publish_date DATE NOT NULL,
    archived boolean
);

CREATE TABLE IF NOT EXISTS genre (
    id SERIAL PRIMARY KEY,
    music_albums_id integer,
    genre_name VARCHAR(50) NOT NULL,
    CONSTRAINT music_genre FOREIGN KEY(music_albums_id) REFERENCES music_albums (id));



