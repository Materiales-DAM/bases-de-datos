---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
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

# Soluciones DML y subqueries

1. ```sql
   DELETE FROM film_category fc
   WHERE fc.film_id IN (
   	SELECT f.film_id
   	FROM film f
   	INNER JOIN film_actor fa USING (film_id)
   	INNER JOIN actor a USING (actor_id)
   	WHERE a.first_name = 'PENELOPE' AND a.last_name='GUINESS'
   ); 
   ```
2. ```sql
   UPDATE payment p
   SET amount = amount*2
   WHERE rental_id IN (
   	SELECT r.rental_id 
   	FROM rental r
   	INNER JOIN inventory i USING (inventory_id)
   	INNER JOIN store s USING (store_id)
   	INNER JOIN address a USING (address_id)
   	INNER JOIN city ci USING (city_id)
   	WHERE ci.city = 'Lethbridge');
   ```
3. ```sql
   DELETE
   FROM payment p 
   WHERE rental_id IN (
      SELECT r.rental_id
      FROM rental r
      INNER JOIN inventory i USING (inventory_id)
      INNER JOIN store s USING (store_id)
      INNER JOIN address a USING (address_id)
      INNER JOIN city ci USING (city_id)
      WHERE ci.city= 'Lethbridge'); 
   ```
4. ```sql
   UPDATE actor
   SET last_name = 'Esponja'
   WHERE actor_id IN (
       SELECT fa.actor_id
       FROM film_actor fa
       GROUP BY fa.actor_id
       HAVING COUNT(fa.film_id) > 2
   ); 
   ```
5. ```sql
   UPDATE actor
   SET last_name = 'Esponja'
   WHERE actor_id IN (
       SELECT fa.actor_id
       FROM film_actor fa
       GROUP BY fa.actor_id
       HAVING COUNT(fa.film_id) > 2
   ); 
   ```
