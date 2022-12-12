CREATE TABLE IF NOT EXISTS Genre (
	genre_ID serial PRIMARY KEY,
	title VARCHAR(40) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS Artist (
	artist_ID SERIAL PRIMARY KEY,
	name VARCHAR(80) UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS Album (
	album_ID SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
	year DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
	track_ID SERIAL PRIMARY KEY,
	title VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL,
	album_ID INTEGER NOT NULL REFERENCES Album(album_ID)
);
CREATE TABLE IF NOT EXISTS Track_collection (
	track_collection_ID SERIAL primary key,
	title VARCHAR(80) not null,
	year DATE not null
);
CREATE TABLE IF NOT EXISTS Association_artist_genres (
	ID SERIAL PRIMARY KEY,
	genre_ID INTEGER NOT NULL REFERENCES Genre(genre_ID),
	artist_ID INTEGER NOT NULL REFERENCES Artist(artist_ID)
);
CREATE TABLE IF NOT EXISTS Association_artists_albums (
	ID SERIAL PRIMARY KEY,
	album_ID INTEGER NOT NULL REFERENCES Album(album_ID),
	artist_ID INTEGER NOT NULL REFERENCES Artist(artist_ID)
);
CREATE TABLE IF NOT EXISTS Association_tracks_albums (
	ID SERIAL PRIMARY KEY,
	track_ID INTEGER NOT NULL REFERENCES Track(track_ID),
	track_collection_ID INTEGER NOT NULL REFERENCES Track_collection(track_collection_ID)
);