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

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
8.  Muestra los actores, cuántas películas han realizado, solo para aquellos actores que hayan hecho más películas que la media.

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
9.  Consulta para encontrar las tiendas que tienen más películas alquiladas que la media de todas las tiendas

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
10. Consulta para identificar a los actores cuyas películas han sido alquiladas más de 50 veces en un mes específico

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
11. Encuentra los nombres de las categorías que contienen películas con una duración promedio superior a 120 minutos.

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
12. Encuentra el título de las películas que han sido alquiladas más de 10 veces en total.

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
13. Encuentra los nombres de los actores que nunca han actuado en una misma película con 'PENELOPE GUINESS'.

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
14. Encuentra los nombres de los clientes que han alquilado todas las películas de 'PENELOPE GUINESS'.

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
15. Encuentra el nombre del actor que ha recaudado más dinero con sus películas (payments).

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
16. Muestra el número de clientes por país, sólo deben aparecer los países con más clientes que la media por país.

    <pre class="language-sql"><code class="lang-sql"><strong>
    </strong></code></pre>
