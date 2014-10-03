# Select 50 worst rated movies.
SELECT title, rating FROM movies ORDER BY rating LIMIT 50;

# Movies without rating.
SELECT title, rating FROM movies WHERE rating = 0 ORDER BY title;

# Movies that have the word thrilling in synopsis.
SELECT title FROM movies WHERE synopsis LIKE '%thrilling%';

# highest rated sciend fiction and fantasy movies in the 80's
SELECT title, year, rating FROM movies WHERE genre_id = 17 AND year > 1980 AND year < 1990 ORDER BY rating DESC;

# actors that have starred as james bond
SELECT movies.title, movies.year, actors.name
FROM movies
JOIN cast_members ON movies.id = cast_members.movie_id
JOIN actors ON cast_members.actor_id = actors.id
WHERE character LIKE '%James Bond%'
ORDER BY movies.year;

# What movies has Julianne Moore starred in? movie title, year released, name of genre, sorted by genre first and then movie.
SELECT movies.title, movies.year, genres.name
FROM movies
JOIN cast_members ON movies.id = cast_members.movie_id
JOIN actors ON cast_members.actor_id = actors.id
JOIN genres ON genres.id = movies.genre_id
WHERE actors.name LIKE '%Julianne Moore%'
ORDER BY genres, title;

# Five earliest horror movies and what studios producd them? movie title, year released, and studio name, sorted by year.
SELECT movies.title, movies.year, studios.name
FROM movies
JOIN studios ON movies.studio_id = studios.id
JOIN genres ON movies.genre_id = genres.id
WHERE genres.name = 'Horror'
ORDER BY year
LIMIT 5;

##################
##### Part 2 #####
##################

CREATE TABLE recipes (
  id serial PRIMARY KEY,
  name varchar(200) NOT NULL,
  yields_servings integer,
  total_time integer,
  directions text NOT NULL
)

CREATE TABLE ingredients (
  id serial NOT NULL,
  recipe_id integer FOREIGN KEY recipes(id),
  ingredient_amount integer NOT NULL,
  ingredient_name varchar(255) NOT NULL
)

# Green Eggs
INSERT INTO recipes (name, yields_servings, total_time, directions) VALUES ('Green Eggs & Ham', 2, 25, '1. Cook the eggs 2. Cook the ham 3. Combine.');

INSERT INTO ingredients (recipe_id, ingredient_amount, ingredient_name) VALUES (1,4,'green eggs';)
INSERT INTO ingredients (recipe_id, ingredient_amount, ingredient_name) VALUES (1,.5,'lb of ham';)

INSERT INTO recipes (name, yields_servings, directions) VALUES ('Martini', 1, '1. Pour all ingredients into mixing glass with ice cubes 2. Stir well 3. Strain in chilled martini cocktail glass, 4. Squeeze oil from lemon peel onto the drink, or garnish with olive.');

UPDATE ingredients SET ingredient_amount = 3 WHERE recipe_id = 2;

DELETE FROM recipes WHERE ID = 1;
DELECT FROM ingredients WHERE recipe_id = 1; 
