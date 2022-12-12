INSERT INTO genre (title)
VALUES ('Pop'),
       ('Metal'),
       ('Jazz'),
       ('Punk'),
       ('Rock');    
      
INSERT INTO album (title, year)
VALUES ('Thriller', '19821130'),
       ('Master of Puppets', '19860303'),
       ('Oops!… I Did It Again', '20000503'),
       ('Under The Stars', '19580101'),
       ('Колхозный панк', '19910801'),
       ('Естественный отбор', '20110101'),
       ('Запутай след', '20210924'),
       ('Стая', '19990927'),
       ('Мой сон', '20000101');
       

INSERT INTO track (title, duration, album_id)
VALUES ('Beat It', '258', '1'),
       ('Thriller', '268', '1'),
       ('Battery', '313', '2'),
       ('Orion', '508', '2'),
       ('Oops!… I Did It Again', '210', '3'),
       ('Don''t Let Me Be the Last to Know', '221', '3'),
       ('Stormy Weather', '241', '4'),
       ('Have You Met Miss Jones?', '300', '4'),
       ('Попец', '184', '5'),
       ('Пасха', '335', '5'),
       ('Полцарства за коня', '309', '6'),
       ('Награбленное грабь!', '304', '6'),
       ('ПХД', '187', '7'),
       ('С нами будь', '203', '7'),
       ('Любовь', '258', '8'),
       ('Мало не много', '268', '8'), 
       ('Мой сон', '304', '9');
          
INSERT INTO track_collection (title, year)
VALUES ('Monsters of metal', '1990-05-01'),
       ('The best of pop music', '2005-02-01'),
       ('Punks not dead', '2010-01-01'),
       ('The best from jazz', '2018-01-01'),
       ('The best from the west', '2015-04-29'),
       ('Панки в городе', '2020-11-10'),
       ('Популярная музыка', '2021-11-01'),
       ('Хулиганы', '2022-12-10');
      

INSERT INTO association_artist_genres (genre_ID, artist_id)
VALUES (1, 1),
       (1, 3),
       (1, 8),
       (2, 2),
       (2, 6),
       (2, 7),
       (3, 4),
       (4, 5),
       (4, 6),
       (4, 7),
       (5, 2),
       (5, 5),
       (5, 6),
       (5, 7);

INSERT INTO association_artists_albums  (album_id, artist_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 8);

INSERT INTO association_tracks_albums (track_id, track_collection_id)
VALUES (1, 2),
       (1, 5),
       (1, 7),
       (2, 2),
       (3, 1),
       (5, 2),
       (8, 4),
       (9, 6),
       (10, 8),
       (15, 7),
       (9,3);