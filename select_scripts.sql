SELECT track_title, track_length
FROM tracks
ORDER BY track_length DESC
LIMIT 1;

SELECT track_title
FROM tracks
WHERE track_length >= 210;

SELECT compilation_title
FROM compilations
WHERE release_year BETWEEN 2018 AND 2020;

SELECT author_name
FROM authors
WHERE author_name NOT LIKE '% %';

SELECT track_title
FROM tracks
WHERE track_title ~* '\y(my|мой)\y';

SELECT g.genre_name, COUNT(ag.author_id) AS authors_count
FROM genres g
LEFT JOIN authors_genres ag ON g.genre_id = ag.genre_id
GROUP BY g.genre_name
ORDER BY authors_count DESC;

SELECT COUNT(t.track_id) AS tracks_count
FROM tracks t
JOIN albums a ON t.album_id = a.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT a.album_title, ROUND(AVG(t.track_length)) AS avg_track_length_sec
FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_title
ORDER BY avg_track_length_sec DESC;

SELECT author_name
FROM authors
WHERE author_id NOT IN (
    SELECT DISTINCT aa.author_id
    FROM album_authors aa
    JOIN albums a ON aa.album_id = a.album_id
    WHERE a.release_year = 2020);

SELECT DISTINCT c.compilation_title
FROM compilations c
JOIN compilation_tracks ct ON c.compilation_id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.track_id
JOIN albums a ON t.album_id = a.album_id
JOIN album_authors aa ON a.album_id = aa.album_id
WHERE aa.author_id = 3;