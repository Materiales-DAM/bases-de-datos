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
   ```
7. ```sql
   ```
8. ```sql
   ```
9. ```sql
   ```
10. ```sql
    ```
11. ```sql
    ```
12. ```sql
    ```
13. ```sql
    ```
14. ```sql
    ```
15. ```sql
    ```
16. ```sql
    ```
