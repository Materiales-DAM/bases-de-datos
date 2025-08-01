---
cover: ../../../.gitbook/assets/plsql.jpg
coverY: 0
layout:
  cover:
    visible: true
    size: full
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: true
---

# Soluciones de procedimientos almacenados

1. ```plsql
   -- MySQL
   DROP PROCEDURE IF EXISTS delete_actor;
   CREATE PROCEDURE delete_actor(
   	IN actor_id INT
   )
   BEGIN
     START TRANSACTION;
     DELETE FROM film_actor fa WHERE fa.actor_id = actor_id;
     DELETE FROM actor a WHERE a.actor_id = actor_id;
     COMMIT;
   END;

   CALL delete_actor(1);

   -- Postgres

   CREATE OR REPLACE PROCEDURE delete_actor(
   	IN actor_id INT
   )
   LANGUAGE plpgsql
   AS $$
   BEGIN
     	DELETE FROM film_actor fa WHERE fa.actor_id = delete_actor.actor_id;
     	DELETE FROM actor a WHERE a.actor_id = delete_actor.actor_id;
   END;$$

   CALL delete_actor(1);
   ```
2. ```plsql
   -- MySQL
   DROP PROCEDURE IF EXISTS delete_films_older;
   CREATE PROCEDURE delete_films_older(
   	IN ryear int 
   	)
   BEGIN
   	START TRANSACTION;
   	DELETE 
   	FROM payment  
   	WHERE rental_id IN (
   		SELECT r.rental_id
   		FROM rental r
   		INNER JOIN inventory i USING (inventory_id)
   		INNER JOIN film f USING (film_id)
   		WHERE f.release_year < ryear);
   	
    	DELETE 
   	FROM rental 
   	WHERE inventory_id IN (
   		SELECT i.inventory_id
   		FROM inventory i 
   		INNER JOIN film f USING (film_id)
   		WHERE f.release_year < ryear);
   	
   	DELETE 
   	FROM inventory 
   	WHERE film_id IN (
   		SELECT f.film_id 
   		FROM film f
   		WHERE f.release_year < ryear);
   	DELETE 
   	FROM film_category 
   	WHERE film_id IN (
   		SELECT f.film_id 
   		FROM film f
   		WHERE f.release_year < ryear);
   	DELETE 
   	FROM film_actor 
   	WHERE film_id IN (
   		SELECT f.film_id 
   		FROM film f
   		WHERE f.release_year < ryear );
   	DELETE 
   	FROM film f
   	WHERE f.release_year<ryear;
   	
   	COMMIT;
   END;

   CALL delete_films_older (2008);

   -- Postgres
   CREATE OR REPLACE PROCEDURE delete_films_older(
   	IN ryear INT
   )
   LANGUAGE plpgsql
   AS $$
   BEGIN
   	DELETE 
   	FROM payment  
   	WHERE rental_id IN (
   		SELECT r.rental_id
   		FROM rental r
   		INNER JOIN inventory i USING (inventory_id)
   		INNER JOIN film f USING (film_id)
   		WHERE f.release_year < ryear);
   	
    	DELETE 
   	FROM rental 
   	WHERE inventory_id IN (
   		SELECT i.inventory_id
   		FROM inventory i 
   		INNER JOIN film f USING (film_id)
   		WHERE f.release_year < ryear);
   	
   	DELETE 
   	FROM inventory 
   	WHERE film_id IN (
   		SELECT f.film_id 
   		FROM film f
   		WHERE f.release_year < ryear);
   	DELETE 
   	FROM film_category 
   	WHERE film_id IN (
   		SELECT f.film_id 
   		FROM film f
   		WHERE f.release_year < ryear);
   	DELETE 
   	FROM film_actor 
   	WHERE film_id IN (
   		SELECT f.film_id 
   		FROM film f
   		WHERE f.release_year < ryear );
   	DELETE 
   	FROM film f
   	WHERE f.release_year<ryear;
   	
   END;$$

   CALL delete_films_older (2008);
   ```
3. ```plsql
   -- MySQL
   DROP PROCEDURE IF EXISTS store_move;
   CREATE PROCEDURE store_move(
   	IN original_store_id int,
   	IN destination_store_id int
   	)
   BEGIN
   	START TRANSACTION;
   	UPDATE inventory  
   	SET store_id = store_move.destination_store_id
   	WHERE store_id = store_move.original_store_id;

   	UPDATE staff 
   	SET store_id = store_move.destination_store_id
   	WHERE store_id = store_move.original_store_id;	
   	COMMIT;	
   END;
   	
   CALL store_move(2, 1); 


   -- PostgreSQL

   DROP PROCEDURE IF EXISTS  store_move;
   CREATE OR REPLACE PROCEDURE store_move(
   	IN original_store_id int,
   	IN destination_store_id int
   	)
   	LANGUAGE plpgsql
   	AS $$
   	BEGIN
   		UPDATE inventory  
   		SET store_id = store_move.destination_store_id
   		WHERE store_id = store_move.original_store_id;

   		UPDATE staff 
   		SET store_id = store_move.destination_store_id
   		WHERE store_id = store_move.original_store_id;		
   	END;$$
   	
   CALL store_move(2, 1); 
   ```
4. ```plsql
   -- MySQL
   DROP PROCEDURE IF EXISTS duplicate_film;
   CREATE PROCEDURE duplicate_film(
   	IN filmid int
   	)
   BEGIN
   	DECLARE new_film_id INT;
   	
   	START TRANSACTION;

   	INSERT INTO film(title, description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating,special_features,last_update)
   	SELECT CONCAT('Copia de ', title), description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating,special_features,last_update
   	FROM film
   	WHERE film_id = filmid;

   	SET new_film_id = LAST_INSERT_ID();

   	INSERT INTO film_actor(film_id, actor_id)
   	SELECT new_film_id, actor_id
   	FROM film_actor
   	WHERE film_id = filmid;
   	
   	INSERT INTO film_category(film_id, category_id)
   	SELECT new_film_id, category_id
   	FROM film_category
   	WHERE film_id = filmid;

   	COMMIT;	
   END;

   -- PostgreSQL
   DROP PROCEDURE IF EXISTS  duplicate_film;
   CREATE OR REPLACE PROCEDURE duplicate_film(
   	IN filmid int
   	)
   LANGUAGE plpgsql
   AS $$
   DECLARE
       new_film_id INT;
   BEGIN
   	
   	INSERT INTO film(title, description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating,special_features,last_update)
   	SELECT CONCAT('Copia de ', title), description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating,special_features,last_update
   	FROM film
   	WHERE film_id = filmid
   	RETURNING film_id INTO new_film_id;


   	INSERT INTO film_actor(film_id, actor_id)
   	SELECT new_film_id, actor_id
   	FROM film_actor
   	WHERE film_id = filmid;
   	
   	INSERT INTO film_category(film_id, category_id)
   	SELECT new_film_id, category_id
   	FROM film_category
   	WHERE film_id = filmid;
   END;$$

   CALL duplicate_film(1);
   ```
5. ```plsql
   -- MySQL
   CREATE PROCEDURE delete_store(IN storeid int)
   BEGIN
   	START TRANSACTION;
   	  
   	SET FOREIGN_KEY_CHECKS=0;
   	
   	DELETE  FROM payment
   	WHERE rental_id IN(SELECT rental_id
                   FROM rental
   	        INNER JOIN inventory USING (inventory_id)
   		INNER JOIN store st USING(store_id)
   		WHERE st.store_id = storeid);

   	DELETE  FROM rental 
   	WHERE inventory_id IN (SELECT inventory_id
   		FROM inventory inv
   		INNER JOIN store st USING(store_id)
   		WHERE st.store_id = storeid);

   	DELETE  FROM staff
   	WHERE store_id = storeid;

   	DELETE  FROM customer
   	WHERE store_id = storeid;

   	DELETE  FROM inventory
   	WHERE store_id = storeid;

   	DELETE  FROM store
   	WHERE store_id = storeid;

   	SET FOREIGN_KEY_CHECKS=1;
   	COMMIT; 
   END;

   -- Postgres
   CREATE OR REPLACE PROCEDURE delete_store(IN storeid int)
   LANGUAGE plpgsql
   AS $$
   BEGIN
   	SET session_replication_role = 'replica';  

   	DELETE  FROM payment
   	WHERE rental_id IN(SELECT rental_id
                   FROM rental
   	        INNER JOIN inventory USING (inventory_id)
   		INNER JOIN store st USING(store_id)
   		WHERE st.store_id = storeid);

   	DELETE  FROM rental 
   	WHERE inventory_id IN (SELECT inventory_id
   		FROM inventory inv
   		INNER JOIN store st USING(store_id)
   		WHERE st.store_id = storeid);

   	DELETE  FROM staff
   	WHERE store_id = storeid;

   	DELETE  FROM customer
   	WHERE store_id = storeid;

   	DELETE  FROM inventory
   	WHERE store_id = storeid;

   	DELETE  FROM store
   	WHERE store_id = storeid;

   	SET session_replication_role = 'origin'; 
   END;$$ 
   ```
