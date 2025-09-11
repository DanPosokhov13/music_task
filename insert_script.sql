INSERT INTO genres (genre_name)
VALUES
    ('Rock'),
    ('Pop'),
    ('Hip-Hop'),
    ('Electronic');

INSERT INTO authors (author_name)
VALUES
    ('ACDC'),
    ('Alla Pugacheva'),
    ('JZ'),
    ('Omnia');

INSERT INTO albums (album_title, release_year)
VALUES
    ('Albom 1', 1969),
    ('Albom 2', 1984),
    ('Albom 3', 2010),
    ('Albom 4', 2013),
    ('Albom 5', 2019);

INSERT INTO authors_genres (author_id, genre_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (2, 1),
    (4, 2);

INSERT INTO album_authors (album_id, author_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 3),
    (5, 2);

INSERT INTO tracks (track_title, album_id, track_length)
VALUES
    ('Random title 1', 1, 259),
    ('Random title 2', 1, 182),
    ('Random title 3', 2, 225),
    ('Random title 4', 2, 211),
    ('Random title 5', 3, 292),
    ('Random title 6', 3, 538),
    ('Random title 7', 4, 248),
    ('Random title 8', 4, 337),
    ('Random title 9', 5, 210),
    ('Random title 10', 5, 185);

INSERT INTO compilations (compilation_title, release_year)
VALUES
    ('Collection 1', 2018),
    ('Collection 2', 2019),
    ('Collection 3', 2020),
    ('Collection 4', 2021);

INSERT INTO compilation_tracks (compilation_id, track_id)
VALUES
    (1, 3),
    (1, 4),
    (2, 5),
    (2, 6),
    (3, 7),
    (3, 8),
    (4, 1),
    (4, 2),
    (4, 6);