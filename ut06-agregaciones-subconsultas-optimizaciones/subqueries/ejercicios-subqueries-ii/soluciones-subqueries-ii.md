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
