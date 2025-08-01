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
   SELECT AVG(rentals_per_store)
   FROM (
   	SELECT COUNT(r.rental_id) AS rentals_per_store
   	FROM store s 
   	LEFT JOIN inventory i USING(store_id)
   	LEFT JOIN rental r USING(inventory_id) 
   	GROUP BY s.store_id
   ) AS average_rentals_per_store; 
   ```
9. ```sql
   SELECT AVG(revenue) AS avg_revenue_per_store
   FROM (
       SELECT SUM(amount) AS revenue
       FROM store s
       LEFT JOIN inventory USING (store_id)
       LEFT JOIN rental USING (inventory_id)
       LEFT JOIN payment USING (rental_id)
       GROUP BY store_id
   ) AS revenue_per_store;
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
    SELECT c.customer_id, COUNT(p.amount) AS num_payments
    FROM customer c
    LEFT JOIN payment p USING (customer_id)
    GROUP BY c.customer_id
    HAVING sum(p.amount) > (
        SELECT AVG(total_amount)
        FROM (
            SELECT c.customer_id, sum(p.amount) AS total_amount
    	FROM customer c
    	LEFT JOIN payment p USING (customer_id)
    	GROUP BY c.customer_id
        )AS customer_total_amount
    ); 
    ```
12. ```sql
    SELECT s.store_id, count(r.rental_id) AS num_rentals
    FROM store s
    LEFT JOIN inventory c USING(store_id)
    LEFT JOIN rental r USING(inventory_id)
    GROUP BY s.store_id
    HAVING count(r.rental_id) < (
        SELECT AVG(num_rentals)
        FROM (
            SELECT s.store_id, count(r.rental_id) AS num_rentals
    	FROM store s
    	LEFT JOIN inventory c USING(store_id)
    	LEFT JOIN rental r USING(inventory_id)
    	GROUP BY s.store_id
        ) AS store_rentals
    ); 
    ```
13. ```sql
    SELECT s.store_id, SUM(p.amount) AS ingresos
    FROM store s
    LEFT JOIN inventory USING (store_id)
    LEFT JOIN rental USING(inventory_id)
    LEFT JOIN payment p USING(rental_id)
    GROUP BY s.store_id
    HAVING COUNT(p.amount) > (
        SELECT AVG(num_payments)
        FROM (
            SELECT s.store_id, COUNT(p.amount) AS num_payments
            FROM store s
            LEFT JOIN inventory USING (store_id)
         	LEFT JOIN rental USING(inventory_id)
         	LEFT JOIN payment p USING(rental_id)
            GROUP BY s.store_id
        ) AS store_payments
    ); 
    ```
14. ```sql
    SELECT * 
    FROM film
    WHERE film_id NOT IN(
    	SELECT inv.film_id
    	FROM rental r
    	INNER JOIN inventory inv USING(inventory_id)
    	INNER JOIN store sto USING(store_id)
    	INNER JOIN address ad USING(address_id)
    	INNER JOIN city ci USING(city_id)
    	INNER JOIN country co USING(country_id)
    	WHERE co.country = 'Spain'
    ); 
    ```
