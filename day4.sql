-- Group BY 
SELECT column1, Aggregate_function(column2) from tablename Group BY column1;
Agggregate functions are SUM,MIN,MAX,COUNT.
Gropu BY Eliminates Duplicate Values;

SELECT * from movies;
SELECT movie_lang,COUNT(movie_lang) from movies GROUP BY movie_lang;
SELECT movie_lang,AVG(movie_length) from movies GROUP By movie_lang ORDER BY movie_lang;
SELECT age_certificate,SUM(movie_length) from movies GROUP BY age_certificate;
SELECT movie_lang,MIN(movie_length),MAX(movie_length) FROM movies GROUP BY movie_lang;
SELECT movie_length from movies GROUP BY movie_length;
SELECT movie_length from movies ORDER BY movie_length;

-- Using Order BY with Multiple Columns,Order BY
SELECT movie_lang,age_certificate,AVG(movie_length) as "AVG movie length" from movies GROUP BY movie_lang,age_certificate ORDER BY movie_lang,3 DESC;



