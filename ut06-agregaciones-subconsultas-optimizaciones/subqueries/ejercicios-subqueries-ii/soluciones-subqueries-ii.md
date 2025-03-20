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

# Soluciones subqueries II

1. ```sql
   # MySQL
   SELECT title
   FROM film
   WHERE film_id IN(
   	SELECT i.film_id
   	FROM rental r
   	INNER JOIN inventory i USING (inventory_id)
   	WHERE r.rental_date > DATE_SUB(NOW(), INTERVAL '25' YEAR)
   );

   -- PostgreSQL
   SELECT title
   FROM film
   WHERE film_id IN(
   	SELECT i.film_id
   	FROM rental r
   	INNER JOIN inventory i USING (inventory_id)
   	WHERE r.rental_date > NOW() - INTERVAL '25' year
   );
   ```
2. ```sql
   SELECT a.first_name
   FROM actor a 
   WHERE actor_id IN (
   	SELECT fa.actor_id  
   	FROM film_actor fa  
   	INNER JOIN film f ON fa.film_id = f.film_id 
   	WHERE f.rating = 'PG-13'
   ); 
   ```
3. ```sql
   select avg(num_rentals) as average_rentals 
   from( 
   	select c.customer_id, count(rental.rental_id) as num_rentals
   	from customer c
   	inner join rental using(customer_id)
   	group by c.customer_id 
   ) as rentals_per_customer; 
   ```
4. ```sql
   SELECT f.*
   FROM film f
   WHERE f.film_id IN (
       SELECT i.film_id
       FROM rental r
       JOIN inventory i USING (inventory_id)
       JOIN store s USING (store_id)
       JOIN address a USING (address_id)
       JOIN city ci USING (city_id)
       WHERE ci.city = 'Woodridge'
   );
   ```
5. ```sql
   SELECT  AVG(total_amount) AS average_amount
   FROM (
       SELECT customer_id , sum(amount) AS total_amount
       FROM payment p
       GROUP BY customer_id
   ) AS amount_per_customer; 
   ```
6. ```sql
   SELECT *
   FROM staff
   WHERE store_id = (
   	SELECT store_id
   	FROM store s
   	LEFT JOIN inventory i USING (store_id)
   	LEFT JOIN rental r USING (inventory_id)
   	GROUP BY store_id
   	ORDER BY COUNT(r.rental_id) DESC
   	LIMIT 1
   );
   ```
7. ```sql
   SELECT f.title
   FROM film f 
   INNER JOIN film_category fc USING (film_id)
   WHERE category_id=(
   	SELECT  category_id
   	FROM film_category fc 
   	INNER JOIN category c USING (category_id)
   	GROUP BY category_id
   	ORDER BY count(film_id) DESC  
   	LIMIT 1
   ); 
   ```
8. ```sql
   SELECT a.actor_id,COUNT(fa.film_id) AS num_films
   FROM actor a
   INNER JOIN film_actor fa USING(actor_id)
   GROUP BY a.actor_id
   HAVING COUNT(fa.film_id) > (
   	SELECT AVG(num_films)
   	FROM (
   		SELECT a.actor_id, COUNT(fa.film_id) AS num_films
   		FROM actor a
   		INNER JOIN film_actor fa USING(actor_id)
   		GROUP BY a.actor_id
   	) AS actor_total_film
   ); 
   ```
9. ```sql
   SELECT st.store_id, SUM(f.film_id) AS films
   FROM store st
   INNER JOIN inventory i USING(store_id)
   INNER JOIN film f USING(film_id)
   GROUP BY st.store_id
   HAVING COUNT(f.film_id) > (
   	SELECT AVG(total_films)
   	FROM (
   		SELECT st.store_id, COUNT(f.film_id) AS total_films
   		FROM store st
   		INNER JOIN inventory i USING(store_id)
   		INNER JOIN film f USING(film_id)
   		GROUP BY st.store_id
   	) AS films_store
   ); 
   ```
10. ```sql
    # MySQL
    SELECT a.*
    FROM actor a
    WHERE a.actor_id IN (
        SELECT fa.actor_id
        FROM film_actor fa
        JOIN inventory i USING (film_id)
        JOIN rental r USING (inventory_id)
        GROUP BY fa.actor_id, MONTH(r.rental_date)
        HAVING COUNT(*) > 50
    ); 

    -- PostgreSQL
    SELECT a.*
    FROM actor a
    WHERE a.actor_id IN (
        SELECT fa.actor_id
        FROM film_actor fa
        JOIN inventory i USING (film_id)
        JOIN rental r USING (inventory_id)
        GROUP BY fa.actor_id,DATE_PART('MONTH', r.rental_date)
        HAVING COUNT(*) > 50
    ); 
    ```
11. ```sql
    SELECT c.*
    FROM category c 
    WHERE c.category_id IN(
    	SELECT fc.category_id 
    	FROM film_category fc 
    	JOIN film f ON fc.film_id = f.film_id
    	GROUP BY fc.category_id
    	HAVING AVG(f.length)>120
    ); 
    ```
12. ```sql
    SELECT f.* 
    FROM film f 
    WHERE film_id IN (
    	SELECT i.film_id 
    	FROM inventory i
    	INNER JOIN rental r USING(inventory_id)
    	GROUP BY i.film_id
    	HAVING COUNT(r.rental_id) > 10
    ); 
    ```
13. ```sql
    SELECT *
    FROM actor
    WHERE actor_id NOT IN (
    	SELECT fa_other.actor_id
    	FROM film f
    	INNER JOIN film_actor fa_penelope USING (film_id)
    	INNER JOIN actor penelope USING (actor_id)
    	INNER JOIN film_actor fa_other ON fa_other.film_id = f.film_id 
    	WHERE penelope.first_name = 'PENELOPE' AND penelope.last_name = 'GUINESS'
    );
    ```
14. ```sql
    SELECT c.*
    FROM customer c
    INNER JOIN rental USING(customer_id)
    INNER JOIN inventory USING(inventory_id)
    INNER JOIN film USING (film_id)
    INNER JOIN film_actor USING (film_id)
    INNER JOIN actor a USING(actor_id)
    WHERE a.first_name = 'PENELOPE' AND a.last_name = 'GUINESS'
    GROUP BY c.customer_id
    HAVING COUNT(DISTINCT f.film_id) = (
    	SELECT COUNT(*)
    	FROM film f
    	INNER JOIN film_actor USING (film_id)
    	INNER JOIN actor a USING (actor_id)
    	WHERE a.first_name = 'PENELOPE' AND a.last_name = 'GUINESS'
    );
    ```
15. ```sql
    SELECT renta_max.*
    FROM (
         SELECT SUM(p.amount) AS suma_total, a.*
         FROM actor a
         JOIN film_actor fa USING (actor_id)
         JOIN inventory USING(film_id)
         JOIN rental USING(inventory_id)
         JOIN payment p USING(rental_id)
         GROUP BY actor_id
    ) AS renta_max
    ORDER BY suma_total DESC
    LIMIT 1; 
    ```
16. ```sql
    SELECT co.country, COUNT(customer_id) AS num_customer
    FROM customer
    INNER JOIN address USING(address_id)
    INNER JOIN city USING(city_id)
    INNER JOIN country co USING(country_id)
    GROUP BY co.country
    HAVING COUNT(customer_id) > (
    	SELECT AVG(num_customer) 
    	FROM (
    		SELECT COUNT(customer_id) AS num_customer
    		FROM customer
    		INNER JOIN address USING(address_id)
    		INNER JOIN city USING(city_id)
    		INNER JOIN country co USING(country_id)
    		GROUP BY co.country
    	) AS num_customer_per_country	
    ); 
    ```
