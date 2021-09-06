DROP TABLE IF EXISTS movie_batch1;

CREATE TABLE movie_batch1
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	Year int NOT NULL,
	Promising_Young_Woman int,
	Wonderwoman int,
	Cruella int,
	Minari int,
	Sound_of_Metal int,
	Joker int
);

Insert INTO movie_batch1 (Year,Promising_Young_Woman,Wonderwoman,Cruella,Minari,Sound_of_Metal,Joker)
VALUES (2020,3,5,4,4,5,null), (2020,3,5,5,null,2,3), (2021,3,4,3,2,4,5), (2020,null,2,null,null,5,5), (2019,5,4,5,4,5,5), (2019,4,3,5,null,null,null);

DROP TABLE IF EXISTS movie_batch2;

CREATE TABLE movie_batch2
(
	id BIGSERIAL NOT NULL PRIMARY KEY,
	Year int NOT NULL,
	Promising_Young_Woman int,
	Wonderwoman int,
	Cruella int,
	Minari int,
	Sound_of_Metal int,
	Joker int
);

Insert INTO movie_batch2 (Year,Promising_Young_Woman,Wonderwoman,Cruella,Minari,Sound_of_Metal,Joker)
VALUES (2020,5,5,4,5,5,4), (2020,null,3,2,3,4,null), (2021,4,5,3,2,1,2), (2020,null,null,3,2,2,3), (2019,5,5,3,2,4,null), (2019,2,3,2,3,3,3);

DROP TABLE IF EXISTS movie_ratings;

CREATE TABLE movie_ratings
	AS (SELECT * FROM movie_batch1
	   UNION
		SELECT * FROM movie_batch2
	   );

ALTER TABLE movie_ratings
DROP Year, DROP id, ADD id BIGSERIAL NOT NULL PRIMARY KEY;