DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS playlists;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS lyrics;

CREATE DATABASE capstone_db;

\c capstone_db;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  username VARCHAR,
  password VARCHAR
);

CREATE TABLE follows (
  following_user_id INTEGER,
  followed_user_id INTEGER,
  created_at TIMESTAMP,
  FOREIGN KEY (following_user_id) REFERENCES users(id),
  FOREIGN KEY (followed_user_id) REFERENCES users(id)
);

CREATE TABLE playlists (
  playlist_id INTEGER PRIMARY KEY,
  playlist_title VARCHAR,
  owner_id INTEGER,
  FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE songs (
  song_id INTEGER PRIMARY KEY,
  song_name TEXT,
  artist TEXT,
  owner_id INTEGER,
  FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE lyrics (
  lyric_id INTEGER PRIMARY KEY,
  lyric TEXT,
  song VARCHAR,
  artist VARCHAR,
  owner_id INTEGER,
  FOREIGN KEY (owner_id) REFERENCES users(id)
);



