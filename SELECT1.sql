SELECT genre.title AS "Жанр", COUNT(artist.name) AS "Кол-во исполнителей"
FROM association_artist_genres
JOIN genre
ON association_artist_genres.genre_id = genre.genre_id
JOIN artist 
ON association_artist_genres.artist_id = artist.artist_id 
GROUP BY genre.title; 

SELECT album.title AS "Альбом", COUNT(album.album_id) AS "Кол-во треков"
FROM album
JOIN track
ON year >= '2019-01-01' AND year <= '2021-12-31' AND album.album_id = track.album_id 
GROUP BY album.title;

SELECT album.title AS "Альбом", AVG(track.duration) AS "Средняя продолжительность, сек."
FROM album
JOIN track
ON album.album_id = track.album_id
GROUP BY album.title;

SELECT DISTINCT(a.name) AS "Исполнители не выпустившие альбом"
FROM album 
JOIN association_artists_albums aaa 
ON year NOT BETWEEN '20200101' AND '20201231' AND album.album_id = aaa.album_id 
JOIN artist a 
ON aaa.artist_id = a.artist_id;

SELECT track_collection.title  AS "Испонитель в сборниках:"
FROM track
JOIN album
ON track.album_id  = album.album_id
JOIN association_artists_albums
ON association_artists_albums.album_id = album.album_id
JOIN artist
ON artist.artist_id = association_artists_albums.artist_id AND artist.name ILIKE '%сектор%'
JOIN association_tracks_albums
ON association_tracks_albums.track_id  = track.track_id
JOIN track_collection
ON track_collection.track_collection_id = association_tracks_albums.track_collection_id;

SELECT album.title
FROM album
JOIN  association_artists_albums
ON album.album_id = association_artists_albums.album_id 
JOIN artist
ON artist.artist_id = association_artists_albums.artist_id 
JOIN association_artist_genres
ON association_artist_genres.artist_id = artist.artist_id 
JOIN genre
ON genre.genre_id  = association_artist_genres.genre_id
GROUP BY album.title
HAVING COUNT(genre.title) > 1;

SELECT track.title AS "Треки не вошедшие в сборники"
FROM track
LEFT JOIN association_tracks_albums
ON association_tracks_albums.track_id = track.track_id
GROUP BY track.title 
HAVING COUNT(association_tracks_albums.track_collection_id) < 1;

SELECT a2.name AS "Исполнитель короткого трека"
FROM track
JOIN album a 
ON track.album_id  = a.album_id
JOIN association_artists_albums aaa 
ON aaa.album_id = a.album_id 
JOIN artist a2 
ON a2.artist_id = aaa.artist_id AND "duration" = (SELECT min(duration) FROM track) 
GROUP BY a2.artist_id;

SELECT a.title  
FROM album a
LEFT JOIN track 
ON track.album_id = a.album_id
WHERE track.album_id in (
SELECT album_id FROM track 
GROUP BY album_id 
HAVING count(album_id) = (SELECT count(track_id) 
FROM track 
GROUP BY album_id ORDER BY count LIMIT 1)
)
ORDER BY a.title;