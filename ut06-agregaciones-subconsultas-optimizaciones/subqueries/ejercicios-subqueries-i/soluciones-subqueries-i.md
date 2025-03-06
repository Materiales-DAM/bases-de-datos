---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
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

# Soluciones subqueries I

1. ```sql
   SELECT *
   FROM film
   WHERE film_id IN (
   	SELECT film_id
   	FROM film_category
   	WHERE category_id IN (
   		SELECT category_id
   		FROM category
   		WHERE name = 'Action' OR name = 'Horror'
   	)
   );
   ```
2. ```sql
   SELECT a.*
   FROM actor a
   WHERE a.actor_id IN (
   	SELECT fa.actor_id
   	FROM film_actor fa
   	INNER JOIN film f USING(film_id)
   	INNER JOIN language l USING(language_id)
   	WHERE l.name = 'English'
   );
   ```
3. ```sql

   SELECT * 
   FROM payment p 
   WHERE p.rental_id IN (
   	SELECT r.rental_id 
   	FROM rental r 
   	WHERE r.inventory_id  IN(
   		SELECT i.inventory_id 
   		FROM inventory i
   		INNER JOIN store s USING(store_id)
   		INNER JOIN address a USING(address_id)
   		INNER JOIN city c USING(city_id)
   		WHERE c.city = 'Woodridge'
   	)
   ); 
   ```
4. ```sql
   ```
5. ```sql
   ```
6. ```sql
   ```
7. ```sql
   ```
8. ```sql
   ```
9. ```sql
   ```
10. ```sql
    SELECT c.*, COUNT(fc.film_id) AS num_films
    FROM category c
    LEFT JOIN film_category fc USING(category_id)
    GROUP BY c.category_id
    HAVING COUNT(fc.film_id) > (
    	SELECT AVG(num_films)
    	FROM (
    		SELECT c.*, COUNT(fc.film_id) AS num_films
    		FROM category c
    		LEFT JOIN film_category fc USING(category_id)
    		GROUP BY c.category_id
    	) AS category_num_films
    );
    ```
11. ```sql
    ```
12. ```sql
    ```
13. ```sql
    ```
14. ```sql
    ```
