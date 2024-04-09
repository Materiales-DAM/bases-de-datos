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

1.  Muestra las películas que sean de la categoría Horror o Action.

    ```sql
    SELECT f.* 
    FROM film f 
    WHERE f.film_id IN (
    	SELECT DISTINCT fc.film_id
    	FROM film_category fc 
    	INNER JOIN category c ON c.category_id = fc.category_id 
    	WHERE c.name = 'Horror' OR c.name = 'Action'
    );
    ```
2.  Muestra los actores que trabajen en películas en inglés

    ```sql
    SELECT a.*
    FROM actor a 
    WHERE a.actor_id IN(
    	SELECT DISTINCT fa.actor_id
    	FROM film_actor fa 
    	INNER JOIN film f ON f.film_id = fa.film_id 
    	INNER JOIN `language` l ON f.language_id = l.language_id 
    	WHERE l.name = 'English'
    );
    ```
3.  Muestra los pagos de alquileres en tiendas de Woodridge.

    ```sql
    SELECT p.*
    FROM payment p 
    INNER JOIN rental r ON r.rental_id = p.rental_id 
    INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
    WHERE i.store_id IN (
    	SELECT s.store_id
    	FROM store s 
    	INNER JOIN address a ON a.address_id  = s.address_id 
    	INNER JOIN city c ON c.city_id = a.city_id 
    	WHERE c.city = 'Woodridge'
    );
    ```
4.  Muestra las tiendas que tienen películas de la categoría Action

    ```sql
    SELECT s.*
    FROM store s 
    WHERE s.store_id IN(
    	SELECT DISTINCT i.store_id
    	FROM inventory i  
    	INNER JOIN film_category fc ON fc.film_id = i.film_id 
    	INNER JOIN category c ON c.category_id= fc.category_id
    	WHERE c.name = 'Action'	
    );
    ```
5.  Muestra los clientes que han alquilado una película de la categoría Horror

    ```sql
    SELECT c.*
    FROM customer c 
    WHERE c.customer_id IN(
    	SELECT DISTINCT r.customer_id
    	FROM category c
    	INNER JOIN film_category fc ON fc.category_id= fc.category_id
    	INNER JOIN inventory i ON i.film_id = fc.film_id
    	INNER JOIN rental r ON r.inventory_id = i.inventory_id
    	WHERE c.name = 'Horror'
    );
    ```
6.  Calcula la media del número de categorías por película

    ```sql
    SELECT AVG(categories)
    FROM (
    	SELECT fc.film_id, COUNT(*) as categories
    	FROM film_category fc  
    	GROUP BY fc.film_id
    ) as film_categories;
    ```
7.  Calcula el máximo de pagos por cliente.

    ```sql
    SELECT MAX(payments) as max_payments
    FROM (
    	SELECT p.customer_id, COUNT(*) as payments
    	FROM payment p 
    	GROUP BY p.customer_id 
    ) as customer_payments;
    ```
8.  Calcula la media de alquileres por tienda.

    ```sql
    SELECT AVG(rentals)
    FROM (
    	SELECT i.store_id, COUNT(*) as rentals
    	FROM 
    		rental r 
    		INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
    	GROUP BY i.store_id
    ) as store_rentals;
    ```
9.  Calcula la media de ingresos por tienda.

    ```sql
    SELECT AVG(store_income)
    FROM (
    	SELECT SUM(p.amount) as store_income
    	FROM store s
    	LEFT JOIN inventory i ON s.store_id = i.store_id
    	LEFT JOIN rental r ON r.inventory_id = i.inventory_id
    	LEFT JOIN payment p ON p.rental_id = r.rental_id
    	GROUP BY s.store_id	
    ) as stores_income;
    ```
10. Muestra las categorías junto con el número de películas de dicha categoría, solo deben aparecer categorías que tengan más películas que la media

    ```sql
    SELECT c.name, COUNT(fc.film_id) AS category_films
    FROM category c 
    LEFT JOIN film_category fc ON c.category_id = fc.category_id
    GROUP BY c.category_id
    HAVING category_films > (
    	SELECT AVG(category_films)
    	FROM (
    		SELECT COUNT(fc.film_id) as category_films
    		FROM category c 
    		LEFT JOIN film_category fc ON c.category_id = fc.category_id
    		GROUP BY c.category_id
    	) as category_films
    );
    ```
11. Muestra el número de pagos por cliente, para clientes que hayan gastado más que la media.

    ```sql
    SELECT p.customer_id, COUNT(*)  as payments
    FROM payment p 
    GROUP BY p.customer_id
    HAVING SUM(p.amount) > (
    	SELECT AVG(total_amount) as average_amount
    	FROM (
    		SELECT SUM(p.amount) AS total_amount
    		FROM payment p
    		GROUP BY p.customer_id 
    	) as customer_amount
    );
    ```
12. Muestra el número de alquileres por tienda, para tiendas que hayan alquilado menos de la media.

    ```sql
    SELECT s.*, COUNT(r.rental_id) AS store_rentals
    FROM store s 
    LEFT JOIN inventory i ON i.store_id =s.store_id 
    LEFT JOIN rental r ON r.inventory_id = i.inventory_id 
    GROUP BY s.store_id 
    HAVING store_rentals < (
    	SELECT AVG(store_rentals)
    	FROM (
    		SELECT COUNT(r.rental_id) AS store_rentals
    		FROM inventory i 
    		LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    		GROUP BY i.store_id
    	) as store_rentals
    );
    ```
13. Muestra los ingresos por tienda, para tiendas que hayan recibido más pagos que la media.

    ```sql
    SELECT i.store_id , SUM(p.amount) AS income
    FROM payment p 
    INNER JOIN rental r ON r.rental_id = p.rental_id 
    INNER JOIN inventory i ON i.inventory_id = r.inventory_id 
    GROUP BY i.store_id 
    HAVING COUNT(*) > (
    	SELECT AVG(rentals) AS average_rentals
    	FROM (
    		SELECT COUNT(*) as rentals
    		FROM store s 
    		INNER JOIN inventory i ON s.store_id = i.store_id 
    		INNER JOIN rental r ON r.inventory_id = i.inventory_id 
    		GROUP BY s.store_id 
    	) as store_rentals
    );
    ```
