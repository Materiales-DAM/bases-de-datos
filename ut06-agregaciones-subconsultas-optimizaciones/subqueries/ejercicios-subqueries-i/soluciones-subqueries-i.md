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
   SELECT s.*
   FROM store s
   WHERE s.store_id IN (
   	SELECT i.store_id
   	FROM inventory i
   	INNER JOIN film f USING(film_id)
   	INNER JOIN film_category fc USING(film_id)
   	INNER JOIN category c USING(category_id)
   	WHERE c.name = 'Action'
   );
   ```
5. ```sql
   SELECT c.*
   FROM customer c
   WHERE c.customer_id IN (
   	SELECT r.customer_id
   	FROM rental r
   	INNER JOIN inventory USING(inventory_id)
   	INNER JOIN film USING(film_id)
   	INNER JOIN film_category USING (film_id)
   	INNER JOIN category c USING (category_id)
   	WHERE c.name = 'Horror'
   );
   ```
6. ```sql
   SELECT AVG(categories_per_film.num_categories) AS average_categories_per_film
   FROM (
       SELECT f.film_id, COUNT(c.category_id)AS num_categories
       FROM film f
       LEFT JOIN film_category fc USING(film_id)
       LEFT JOIN category c USING(category_id)
       GROUP BY f.film_id
   ) AS categories_per_film; 
   ```
7. ```sql
   SELECT MAX(payments_per_customer.payments) AS maxs_payment
   FROM (
   	SELECT  COUNT(p.amount) AS payments
   	FROM payment p
   	GROUP BY p.customer_id
   ) AS payments_per_customer; 
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
