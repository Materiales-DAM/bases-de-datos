---
cover: ../../../.gitbook/assets/aggregation.png
coverY: 36.37866666666667
layout:
  cover:
    visible: true
    size: hero
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

1. Calcular el total de ingresos generados por cada película.

```sql
SELECT f.film_id, SUM(p.amount) as amount_per_film
FROM 
	film f 
	INNER JOIN inventory i ON f.film_id = i.film_id 
	INNER JOIN rental r ON r.inventory_id = i.inventory_id 
	INNER JOIN payment p ON p.rental_id = r.rental_id 
GROUP BY f.film_id; 
```

2.  Determinar el número de alquileres por cliente.

    ```sql
    SELECT c.customer_id, COUNT(*)
    FROM
    	customer c 
    	LEFT JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id  ;
    ```
3.  Calcular el número de películas por cada categoría.

    ```sql
    SELECT c.*, COUNT(*)
    FROM
    	category c 
    	LEFT JOIN film_category fc ON fc.category_id  = c.category_id 
    	LEFT JOIN film f ON f.film_id = fc.film_id 
    GROUP BY c.category_id
    ORDER BY COUNT(*);
    ```
4.  Calcular el ingreso promedio de los alquileres.

    ```sql
    SELECT AVG(p.amount)
    FROM
    	payment p;
    ```
5.  Contar el número total de alquileres por película.

    ```sql

    SELECT f.film_id, COUNT(r.rental_id) as rentals
    FROM
    	film f 
    	LEFT JOIN inventory i ON i.film_id  = f.film_id  
    	LEFT JOIN rental r ON i.inventory_id = r.inventory_id  
    GROUP BY f.film_id 
    ORDER BY rentals;
    ```
6.  Encontrar la duración promedio de todas las películas.

    ```sql
    SELECT AVG(f.length)
    FROM film f ;
    ```
7.  Determinar el total de ingresos generados por cada miembro del personal.

    ```sql
    SELECT s.staff_id, SUM(p.amount) AS total_amount
    FROM
    	staff s 
    	LEFT JOIN payment p ON s.staff_id = p.staff_id 
    GROUP BY s.staff_id;
    ```
8.  Calcular el número de alquileres realizados en cada tienda.

    ```sql
    SELECT s.store_id, COUNT(r.rental_id) AS rentals
    FROM
    	store s
    	LEFT JOIN inventory i ON s.store_id = i.store_id  
    	LEFT JOIN rental r ON i.inventory_id = r.inventory_id  
    GROUP BY s.store_id;

    ```
9.  Encontrar el número total de alquileres por cliente.

    ```sql
    SELECT c.customer_id, COUNT(r.rental_id) AS rentals
    FROM
    	customer c
    	LEFT JOIN rental r  ON r.customer_id = c.customer_id 
    GROUP BY c.customer_id 
    ORDER BY rentals;
    ```
10. Determinar la duración mínima de las películas de cada actor.

    ```sql
    SELECT a.actor_id, MIN(f.length) AS min_duration
    FROM 
    	actor a 
    	LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id 
    	LEFT JOIN film f ON f.film_id = fa.film_id 
    GROUP BY a.actor_id 
    ORDER BY min_duration;
    ```
11. Calcular el promedio de ingresos generados por cliente.

    ```sql
    SELECT c.customer_id, SUM(p.amount) as total_amount
    FROM
    	customer c 
    	LEFT JOIN payment p ON p.customer_id = c.customer_id 
    GROUP BY c.customer_id 
    ORDER BY total_amount;
    ```
12. Calcular el número de alquileres por mes.

    ```sql
    SELECT 
    	date_part('month', r.rental_date) as month,
    	COUNT(*) AS rentals
    FROM
    	rental r 
    GROUP BY date_part('month', r.rental_date);
    ```
13. Determinar la cantidad total de ingresos generados por cada actor.

    ```sql
    SELECT a.*, SUM(p.amount) AS total_amount
    FROM
    	actor a 
    	LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id 
    	LEFT JOIN film f ON f.film_id = fa.film_id 
    	LEFT JOIN inventory i ON i.film_id = f.film_id 
    	LEFT JOIN rental r ON r.inventory_id = i.inventory_id 
    	LEFT JOIN payment p ON p.rental_id = r.rental_id 
    GROUP BY a.actor_id
    ORDER BY total_amount DESC;
    ```
14. Encontrar la duración máxima de peícula por tienda.

    ```sql
    SELECT s.store_id, MAX(f.`length`) as max_length
    FROM
    	store s 
    	LEFT JOIN inventory i ON i.store_id = s.store_id 
    	LEFT JOIN film f ON f.film_id = i.film_id 
    GROUP BY s.store_id ;
    ```
15. Determinar el total de ingresos generados por cada categoría.

    ```sql
    SELECT c.category_id, c.name , SUM(p.amount) as category_amount
    FROM
    	category c 
    	LEFT JOIN film_category fc ON fc.category_id = c.category_id 
    	LEFT JOIN film f ON f.film_id = fc.film_id 
    	LEFT JOIN inventory i ON i.film_id = f.film_id 
    	LEFT JOIN rental r ON r.inventory_id = i.inventory_id 
    	LEFT JOIN payment p ON p.rental_id = r.rental_id 
    GROUP BY c.category_id 
    ORDER BY category_amount DESC;
    ```
16. Calcular el promedio de duración de las películas en cada categoría.

    ```sql
    SELECT c.category_id, c.name, AVG(f.length) 
    FROM
    	category c 
    	LEFT JOIN film_category fc ON fc.category_id =c.category_id 
    	LEFT JOIN film f ON f.film_id = fc.film_id 
    GROUP BY c.category_id;
    ```
17. Encontrar el número total de alquileres por actor, incluye sólo aquellos actores que tengan más de 3 alquileres .

    ```sql
    SELECT a.actor_id, COUNT(*) as rentals
    FROM
    	actor a 
    	INNER JOIN film_actor fa ON fa.actor_id = a.actor_id 
    	INNER JOIN film f ON f.film_id = fa.film_id 
    	INNER JOIN inventory i ON i.film_id = f.film_id 
    	INNER JOIN rental r ON r.inventory_id = i.inventory_id 
    GROUP BY a.actor_id 
    HAVING rentals > 3;
    ```
18. Determinar el total de ingresos generados por cada cliente, incluye sólo aquellos clientes que hayan hecho más de 2 payments.

    ```sql
    SELECT c.customer_id, SUM(p.amount) as customer_amount
    FROM
    	customer c 
    	INNER JOIN payment p ON p.customer_id = c.customer_id 
    GROUP BY c.customer_id 
    HAVING COUNT(*) > 2;
    ```
19. Calcular el número de alquileres por día de la semana, incluye solo de lunes a viernes.

    ```sql
    SELECT WEEKDAY(r.rental_date) as week_day, COUNT(*) as rentals
    FROM
    	rental r 
    WHERE 
    	WEEKDAY(r.rental_date) BETWEEN 1 AND 5
    GROUP BY week_day;
    ```
20. Muestra las películas que se hayan alquilado más de 18 veces en Woodridge

```sql
SELECT f.film_id, COUNT(*) as rentals
FROM
	city c 
	INNER JOIN address a ON c.city_id =a.city_id 
	INNER JOIN store s ON a.address_id = s.address_id 
	INNER JOIN inventory i ON i.store_id = s.store_id 
	INNER JOIN film f ON f.film_id = i.film_id 
	INNER JOIN rental r ON i.inventory_id = r.inventory_id 
WHERE 
	c.city = 'Woodridge' 
GROUP BY f.film_id 
HAVING rentals > 18;
```
