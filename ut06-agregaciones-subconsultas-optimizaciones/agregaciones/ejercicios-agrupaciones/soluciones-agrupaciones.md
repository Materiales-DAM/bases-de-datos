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

# Soluciones agrupaciones

1. ```sql
   SELECT i.film_id, SUM(p.amount) AS amount_per_film
   FROM inventory i
   INNER JOIN rental r ON r.inventory_id = i.inventory_id
   INNER JOIN payment p ON p.rental_id = r.rental_id
   GROUP BY i.film_id;
   ```
2. ```sql
   SELECT  customer_id ,count(*) AS numeros_de_alquleres
   FROM rental 
   GROUP BY customer_id ; 
   ```
3. ```sql
   SELECT c.category_id, c.name, COUNT(*) as num_films
   FROM film f
   INNER JOIN film_category fc ON f.film_id = fc.film_id 
   INNER JOIN category c ON fc.category_id = c.category_id 
   GROUP BY c.category_id ;
   ```
4. ```sql
   SELECT c.category_id, avg (p.amount) AS Calculo_Rental
   FROM rental r
   INNER JOIN payment p ON r.rental_id = p.rental_id
   INNER JOIN inventory i ON r.inventory_id = i.inventory_id
   INNER JOIN film f ON i.film_id = f.film_id
   INNER JOIN film_category fc ON f.film_id = fc.film_id
   INNER JOIN category c ON fc.category_id = c.category_id
   GROUP BY c.category_id; 
   ```
5. ```sql
   SELECT  f.film_id, f.title, COUNT(r.rental_id) AS total_alquileres
   FROM film f 
   INNER JOIN inventory i ON f.film_id = i.inventory_id
   INNER JOIN rental r ON i.inventory_id = r.inventory_id
   GROUP BY f.film_id; 
   ```
6. ```sql
   SELECT f.rating,AVG(f.length) AS duracion_rating
   FROM film f
   GROUP BY f.rating
   HAVING duracion_rating > 100; 
   ```
7. ```sql
   SELECT sta.first_name,sta.last_name,SUM(amount) AS ingresos
   FROM staff sta
   JOIN payment p ON sta.staff_id=p.staff_id
   GROUP BY sta.staff_id; 
   ```
8. ```sql
   SELECT sto.store_id, COUNT(ren.rental_id) AS Numero_de_alquileres_realizados
   FROM store sto
   LEFT JOIN inventory inv ON inv.store_id = sto.store_id
   LEFT JOIN rental ren ON ren.inventory_id = inv.inventory_id
   GROUP BY sto.store_id;
   ```
9. ```sql
   SELECT a.actor_id, a.first_name, a.last_name, MIN(f.length) AS minimum_length
   FROM actor a
   INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
   INNER JOIN film f ON fa.film_id = f.film_id
   GROUP BY a.actor_id; 
   ```
10. ```sql
    SELECT c.customer_id, SUM(p.amount) AS average_customer
    FROM payment p
    INNER JOIN rental r ON p.rental_id = r.rental_id 
    INNER JOIN customer c ON r.customer_id =c.customer_id
    GROUP BY c.customer_id; 
    ```
11. ```sql
    SELECT MONTH(r.rental_date) AS rental_month, COUNT(*) AS num_rentals
    FROM rental r
    GROUP BY rental_month; 
    ```
12. ```sql
    SELECT fa.actor_id ,sum(p.amount) AS amount
    FROM payment p 
    INNER JOIN rental r ON p.rental_id  =r.rental_id 
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON f.film_id = i.film_id
    INNER JOIN film_actor fa ON f.film_id =fa.film_id
    GROUP BY fa.actor_id; 
    ```
13. ```sql
    SELECT s.store_id, MAX(f.length) AS max_duration
    FROM store s
    INNER JOIN inventory i ON s.store_id = i.store_id
    INNER JOIN film f ON i.film_id = f.film_id
    GROUP BY s.store_id; 
    ```
14. ```sql
    ```
15. ```sql
    ```
16. ```sql
    ```
17. ```sql
    ```
18. ```sql
    ```
19. ```sql
    ```
20. ```sql
    ```
