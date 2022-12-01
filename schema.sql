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