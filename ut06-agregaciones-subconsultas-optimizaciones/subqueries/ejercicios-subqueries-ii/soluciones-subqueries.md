---
cover: ../../../.gitbook/assets/subquery (1).gif
coverY: 0
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

# Soluciones subqueries

1.  Encuentra el título de todas las películas que fueron alquiladas en los últimos 25 años.

    ```sql
    SELECT f.title
    FROM film f 
    WHERE f.film_id IN (
    	SELECT DISTINCT i.film_id 
    	FROM rental r 
    	INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
    	WHERE r.rental_date >= DATE_SUB(NOW(), INTERVAL 25 YEAR)
    );
    ```
2.  Lista los nombres de los actores que han actuado en películas clasificadas como 'PG-13'.

    ```sql
    SELECT a.first_name, a.last_name 
    FROM actor a 
    WHERE a.actor_id IN(
    	SELECT DISTINCT fa.actor_id
    	FROM film_actor fa 
    	WHERE fa.film_id IN (
    		SELECT f.film_id FROM film f WHERE f.rating = 'PG-13'
    	)
    );
    ```
3.  Calcula la media de alquileres realizados por cliente.

    ```sql
    select AVG(rentals) FROM (
    	SELECT COUNT(*) as rentals
    	FROM 
    		rental r 
    	GROUP BY r.customer_id
    ) as rentals_per_customer;
    ```
4.  Muestra los datos de las películas que han sido alquiladas en Woodridge.

    ```sql
    SELECT f.*
    FROM
    	film f 
    WHERE f.film_id IN(
    	SELECT DISTINCT i.film_id
    	FROM
    		rental r 
    		INNER JOIN inventory i ON r.inventory_id =i.inventory_id 
    	WHERE i.store_id IN (
    		SELECT s.store_id
    		FROM store s 
    		INNER JOIN address a ON s.address_id  = a.address_id 
    		INNER JOIN city c ON c.city_id = a.city_id 
    		WHERE c.city = 'Woodridge'
    	)
    )
    ```
5.  Calcula la media de gasto por cliente

    ```sql
    SELECT AVG(amount)
    FROM (
    	SELECT c.customer_id, SUM(p.amount) AS amount
    	FROM
    		customer c 
    		LEFT JOIN payment p ON p.customer_id = c.customer_id
    	GROUP BY c.customer_id
    ) AS customer_amount;
    ```
6.  Muestra el personal de la tienda en la cual se han realizado más alquileres

    ```sql
    SELECT *
    FROM staff s 
    WHERE s.store_id  = 
    (
    	SELECT sto.store_id
    	FROM
    		store sto
    		LEFT JOIN inventory i ON sto.store_id = i.inventory_id 
    		LEFT JOIN rental r ON r.inventory_id = i.inventory_id 
    	GROUP BY sto.store_id 
    	ORDER BY COUNT(r.rental_id) DESC
    	LIMIT 1
    )
    ```
7.  Muestra las películas de la categoría que más películas tenga.

    ```sql
    SELECT f.*
    FROM film f
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    WHERE fc.category_id = (
    	SELECT fc.category_id
    	FROM film_category fc 
    	GROUP BY fc.category_id 
    	ORDER BY COUNT(*) DESC 
    	LIMIT 1
    );
    ```
8.  Muestra los actores, cuántas películas han realizado, solo para aquellos actores que hayan hecho más películas que la media.

    ```sql
    SELECT fa.actor_id, COUNT(*) as films_per_actor
    FROM film_actor fa 
    GROUP BY fa.actor_id 
    HAVING films_per_actor > (
    	SELECT AVG(films_per_actor) as average 
    	FROM (
    		SELECT COUNT(*) AS films_per_actor
    		FROM film_actor fa 
    		GROUP BY fa.actor_id 
    	) as actor_films
    );
    ```
9.  Consulta para encontrar las tiendas que tienen más películas alquiladas que la media de todas las tiendas

    ```sql
    SELECT s.*
    FROM store s 
    LEFT JOIN inventory i ON i.store_id =s.store_id 
    LEFT JOIN rental r ON r.inventory_id = i.inventory_id 
    GROUP BY s.store_id 
    HAVING COUNT(r.rental_id) > (
    	SELECT AVG(rentals)
    	FROM (
    		SELECT COUNT(r.rental_id) as rentals
    		FROM store s 
    		LEFT JOIN inventory i ON s.store_id  = i.store_id 
    		LEFT JOIN rental r ON r.inventory_id = i.inventory_id 
    		GROUP BY s.store_id 
    	) as store_rentals
    );
    ```
10. Consulta para identificar a los actores cuyas películas han sido alquiladas más de 50 veces en un mismo mes

    ```sql
    SELECT a.actor_id 
    FROM actor a
    WHERE a.actor_id  IN (
    	SELECT DISTINCT fa.actor_id
    	FROM film_actor fa  
    	INNER JOIN inventory i ON fa.film_id = i.film_id 
    	INNER JOIN rental r ON r.inventory_id = i.inventory_id 
    	GROUP BY fa.actor_id, MONTH(r.rental_date), YEAR(r.rental_date)
    	HAVING COUNT(r.rental_id) > 50 
    );
    ```
11. Encuentra los nombres de las categorías cuya duración promedio sea superior a 120 minutos.

    ```sql
    SELECT c.name
    FROM category c 
    WHERE c.category_id IN (
    	SELECT fc.category_id
    	FROM film_category fc 
    	INNER JOIN film f ON f.film_id = fc.film_id 
    	GROUP BY fc.category_id 
    	HAVING AVG(f.length) > 120
    );
    ```
12. Encuentra el título de las películas que han sido alquiladas más de 10 veces.

    ```sql
    SELECT f.title
    FROM film f 
    WHERE f.film_id IN (
    	SELECT i.film_id 
    	FROM rental r 
    	INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
    	GROUP BY i.film_id 
    	HAVING COUNT(*) > 10
    );
    ```
13. Encuentra los nombres de los actores que nunca han actuado en una misma película con 'PENELOPE GUINESS'.

    ```sql
    SELECT a.*
    FROM actor a 
    WHERE a.actor_id NOT IN(
    	SELECT DISTINCT other_actors.actor_id
    	FROM film f 
    	INNER JOIN film_actor fa_penelope ON f.film_id = fa_penelope.film_id 
    	INNER JOIN actor penelope ON penelope.actor_id = fa_penelope.actor_id 
    	INNER JOIN film_actor other_actors ON other_actors.film_id = f.film_id
    	WHERE penelope.first_name ='PENELOPE' AND penelope.last_name ='GUINESS'
    );
    ```
14. Encuentra los nombres de los clientes que han alquilado todas las películas de 'PENELOPE GUINESS'.

    ```sql
    SELECT c.*
    FROM customer c 
    INNER JOIN rental r ON r.customer_id = c.customer_id 
    INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
    INNER JOIN film f ON f.film_id = i.film_id 
    INNER JOIN film_actor fa ON f.film_id = fa.film_id 
    INNER JOIN actor a ON fa.actor_id = a.actor_id 
    WHERE a.first_name ='PENELOPE' AND a.last_name ='GUINESS'
    GROUP BY c.customer_id, i.film_id 
    HAVING COUNT(*) = ( 
    	SELECT COUNT(*)
    	FROM film f 
    	INNER JOIN film_actor fa ON f.film_id = fa.film_id 
    	INNER JOIN actor a ON fa.actor_id = a.actor_id 
    	WHERE a.first_name ='PENELOPE' AND a.last_name ='GUINESS'
    )
    order by c.customer_id ;
    ```
15. Encuentra el nombre del actor que ha recaudado más dinero con sus películas (payments).

    ```sql
    SELECT CONCAT(a.first_name, ' ', a.last_name) as full_name
    FROM actor a 
    WHERE a.actor_id = (
    	SELECT fa.actor_id
    	FROM film_actor fa 
    	INNER JOIN inventory i ON fa.film_id = i.film_id
    	INNER JOIN rental r ON r.inventory_id = i.inventory_id
    	INNER JOIN payment p ON r.rental_id = p.rental_id
    	GROUP BY fa.actor_id
    	ORDER BY SUM(p.amount) DESC 
    	LIMIT 1
    );
    ```
16. Muestra el número de clientes por país, sólo deben aparecer los países con más clientes que la media por país.

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
