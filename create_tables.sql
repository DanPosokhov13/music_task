DROP TABLE IF EXISTS compilation_tracks;
DROP TABLE IF EXISTS compilations;
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS album_authors;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS authors_genres;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS genres;

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    album_title VARCHAR(200) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year >= 1900)
);

CREATE TABLE tracks (
    track_id SERIAL PRIMARY KEY,
    track_title VARCHAR(200) NOT NULL,
    album_id INTEGER NOT NULL REFERENCES albums(album_id) ON DELETE CASCADE,
    track_length INTEGER NOT NULL CHECK (track_length > 0) -- в секундах
);

CREATE TABLE compilations (
    compilation_id SERIAL PRIMARY KEY,
    compilation_title VARCHAR(200) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year >= 1900)
);

CREATE TABLE authors_genres (
    author_id INTEGER NOT NULL REFERENCES authors(author_id) ON DELETE CASCADE,
    genre_id INTEGER NOT NULL REFERENCES genres(genre_id) ON DELETE CASCADE,
    CONSTRAINT authors_genres_pk PRIMARY KEY (author_id, genre_id)
);

CREATE TABLE album_authors (
    album_id INTEGER NOT NULL REFERENCES albums(album_id) ON DELETE CASCADE,
    author_id INTEGER NOT NULL REFERENCES authors(author_id) ON DELETE CASCADE,
    CONSTRAINT album_authors_pk PRIMARY KEY (album_id, author_id)
);

CREATE TABLE compilation_tracks (
    compilation_id INTEGER NOT NULL REFERENCES compilations(compilation_id) ON DELETE CASCADE,
    track_id INTEGER NOT NULL REFERENCES tracks(track_id) ON DELETE CASCADE,
    CONSTRAINT compilation_tracks_pk PRIMARY KEY (compilation_id, track_id)
);