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
   ```
5. ```plsql
   ```
