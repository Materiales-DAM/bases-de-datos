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

Escribe los siguientes procedimientos almacendados en sakila:

1.  delete\_actor: Recibe como parámetro un actor\_id, elimina todos los film\_actor de ese actor y el actor también.

    ```sql
    set plpgsql.variable_conflict to use_variable;

    CREATE OR REPLACE PROCEDURE sakila.delete_actor(
    	IN actor_id INT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
      	DELETE FROM film_actor fa WHERE fa.actor_id= actor_id ;
      	DELETE FROM actor a WHERE a.actor_id= actor_id;
    END;$$

    CALL sakila.delete_actor(1);
    ```
2.  delete\_films\_older:  Recibe como parámetro un año (INT),  elimina películas más antiguas que el año del parámetro (film, film\_actor, film\_category, inventory, rental y payment)

    ```sql
    CREATE OR REPLACE PROCEDURE sakila.delete_films_older
    (
    	IN release_year INT
    )
    LANGUAGE plpgsql
    AS $$
    BEGIN
    	SET constraints ALL deferred;
    	DELETE FROM film f WHERE f.release_year > año;
    	DELETE FROM film_category fc WHERE fc.film_id 
    	IN 
    		(
    			SELECT f.film_id
    			FROM film f
    			WHERE f.release_year > delete_films_older.release_year 
    		);
    	DELETE FROM payment p WHERE p.rental_id
    	IN 
    		(
    			SELECT r.rental_id
    			FROM rental r
    			INNER JOIN inventory i ON i.inventory_id = r.inventory_id
    			INNER JOIN film f ON f.film_id = i.film_id
    			WHERE f.release_year > delete_films_older.release_year
    		);
    	DELETE FROM rental r WHERE r.inventory_id
    	IN 
    		(
    			SELECT i.inventory_id
    			FROM inventory i
    			INNER JOIN film f ON f.film_id = i.film_id
    			WHERE f.release_year > delete_films_older.release_year
    		);
    	DELETE FROM film_actor fa WHERE fa.film_id
    	IN 
    		(
    			SELECT f.film_id
    			FROM film f
    			WHERE f.release_year > delete_films_older.release_year 
    		); 
    	DELETE FROM inventory i WHERE i.film_id
    	IN 
    		(
    			SELECT f.film_id
    			FROM film f 
    			WHERE f.release_year > delete_films_older.release_year
    		);
    END;$$
    ```
3. transfer\_inventory(original\_store\_id, destination\_store\_id): transfiere todo el inventario y personal de un store a otro, una vez ejecutado el procedimiento el original\_store\_id debe quedar sin inventario ni personal.
4. duplicate\_film(film\_id): Dado un film\_id, crea una nueva película con los mismos datos y el título 'Copia de \<original>', cópialo con sus categorías y actores.
5. create\_user(user, password, schema): Haz un procedimiento que crea el usuario con el nombre del primer parámetro, el password del segundo parámetro y dale todos los permisos sobre el schema del tercer parámetro
