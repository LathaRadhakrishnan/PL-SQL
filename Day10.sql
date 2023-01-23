
-- Using cursors
-- Understanding row by row operations
1.SQL retrievel operation work sets of rows as 'result set' or 'dataset'.
2.The rows returns all the rows that returns match a SQL statement.Either zero or more of them.
3.When you use a smple SELECT statment ,there s no way to get the First row,the next row or the previus 5 rows and this is a how relational DBMS works.
4.Traditional procedural languages like python,phpcan opearte on a row by row.
5.Sometime you need to step through rows forward or backward and one or more at a time..This is what cursor is used for.
6.A cursor enable SQL to retrieve (or update,or delete) a single row at a time.
7.A cursor is like a pointer that point or locate specific table row.
8.Once the cursor is active or stored,you can
 SELECT UPDATE or DELETE 
 a row at which the cursor is pointing.

--  Cursors and procedural Language 
1.cursors are very valuabe if you want to retrieve selected rows from a table.
2.once retrieved,you can check the contents of the result set and perform different operations on those results.
3.procedural language -What to do and how do to
4.Non procedural Language -What to do but not how to do 

-- Steps to create a cursor
1.Declare 
2.Open
3.Fetch
4.Close

-- Creating a cursor
1.Declare a cursor using refcursor data type
REFCURSOR to declare a variable

DECLARE cursor_name refcursor;

-- create a cursor that bounds to a query expression
cursor_name [cursor-scrollability] CURSOR [(name datatype,name datatype)]
FOR queryexpression
cursor-scrollability:SCROLL or NO SCROLL .NOSCROLL means the cursor cannot scroll backward.

DECLARE 
cur_all_movies CURSOR 
FOR 
SELECT movie_name,movie_length from movies;

-- Declare a cursor using query parameters
DECLARE 
curl_all_movies_by_year CURSOR (custom_year integer)
FOR
SELECT movie_name,movie_length from movies WHERE EXTRACT('YEAR'from release_date)=custom_year

-- Opening a Cursor
-- Unbound cursor,bound cursor

-- Opening an unbound cursor
OPEN unbound_cursor_varible [[NO]SCROLL] FOR QUERY;
OPEN cur_directors_us
FOR
SELECT first_name,last_name,date_of_birth from directors WHERE nationality="American"

-- Opening an unbound cursor with dynamic values

OPEN unbound_cursor_variable[[NO]SCROLL]
FOR EXECUTE 
 queryexpression [[using expression...]]

 my_query:='SELECT DISTINCT(NATIONALITY) from directors ORDER BY $1'
 OPEN cur_directors_nationality
 FOR EXECUTE 
 my_query USING sort_field;

--  Bound Cursor
OPEN cursor_variable[(name:=value,name:=value,,)]
OPEN cur_all_movies;

DECLARE cur_all_movies_by_year CURSOR(custom_year integer)
FOR
SELECT
movie_name,movie_length from movies WHERE EXTRACT ('YEAR' FROM release_date)=custom_year

OPEN cur_all_movies_by_year (custom_year:=2010)


-- Using A cursor 
-- Following operations can be done once cursor is open
FETCH ,MOVE ,UPDATE OR DELETE Statement
-- FETCH Statement
FETCH (direction(FROM|IN)) cursor_variable INTO target_variable;
FETCH cur_all_movies into row_movie;

-- Cursor gets next row by default
NEXT 
LAST 
PRIOR 
FIRST 
ABSOLUTE COUNT 
RELATIVE COUNT 
forward 
BACKWARD 

If you enable SCROLL at the decalaration of the cursor ,then only you can use 
FORWARD
BACKWARD

MOVE (direction(from|IN)) cursor_variable;
MOVE cur_all_movies;
MOVE LAST FROM cur_all_movies;
MOVE relative-1 FROM cur_all_movies;
MOVE FORWARD 4 FROM  cur_all_movies;

-- Updating data using Cursor 
-- Once a cursor is positioned,we can delete or update row by the cursor using the following statement.
DELETE WHERE CURRENT OF OR 
UPDATE WHERE CURRENT OF 

UPDATE MOVIES SET YEAR (release_date)=custom_year WHERE current of cur_all_movies;

-- Closing a cursor 
CLOSE cursor_variable;

CLOSE cur_all_movies;

-- Creating a Pl/pgsql Curosr
SELECT * from movies order by movie_name;

DO
$$
DECLARE 
output_text text DEFAULT '';
rec_movie record ;
cur_all_movies CURSOR  FOR 
SELECT * from movies ;
BEGIN 
OPEN  cur_all_movies;
LOOP
FETCH cur_all_movies INTO rec_movie;
EXIT WHEN NOT FOUND;

output_text:=output_text ||''||rec_movie.movie_name;
END LOOP;
RAISE NOTICE 'ALL MOVIES NAMES %',output_text;
END;
$$

CREATE OR REPLACE FUNCTION fn_get_movie_name_by_year(custom_year integer)
RETURNS text
LANGUAGE PLPGSQL
AS
$$
DECLARE
movie_names TEXT DEFAULT '';
rec_movie record;
cur_all_movie_by_year CURSOR (custom_year integer )
FOR 
SELECT movie_name,EXTRACT('YEAR'FROM release_date )as releasse_year
FROM movies
EXTRACT('YEAR' FROM release_date)=custom_year;
BEGIN
OPEN cur_all_movie_by_year(custom_year);
LOOP
FETCH cur_all_movie_by_year INTO rec_movie;
EXIT WHEN NOT FOUND;

IF rec_movie.movie_name LIKE '%Star%' THEN 
movie_names:=movie_names||''||rec_movie.movie_name||:||rec_movie.releasse_year
END IF;
END LOOP;

close cur_all_movie_by_year;
RETURN movie_names;
END;
$$


END LOOP;


-- Server PRogramming
-- PostgresSQL as a development platform?
-- Why anyone chose postgresql as development platform?
-- cost of acquisition
oracle - Free edition->enterprise sales ->licencing cost
Microsoft SQL -variation based on database size/database design 
Open sourse 

-- Fun With Subquery
-- Subquery with WHERE clause














































$$
























