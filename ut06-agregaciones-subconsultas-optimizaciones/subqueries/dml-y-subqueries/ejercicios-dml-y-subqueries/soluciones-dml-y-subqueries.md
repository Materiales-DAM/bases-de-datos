---
cover: ../../../../.gitbook/assets/subquery.gif
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

# Soluciones DML y subqueries

1.  Elimina los film\_category de películas que hayan sido protagonizadas por "PENELOPE GUINESS"

    ```sql
    DELETE FROM film_category fc
    WHERE fc.film_id IN (
    	SELECT fa.film_id
    	FROM film_actor fa 
    	INNER JOIN actor a ON a.actor_id = fa.actor_id 
    	WHERE a.first_name = 'PENELOPE' AND a.last_name = 'GUINESS' 
    );
    ```
2.  Haz que el amount de los payment de tiendas de Woodridge sea el doble que el actual

    ```sql
    UPDATE payment p
    SET p.amount = p.amount *2
    WHERE p.rental_id IN (
    	SELECT r.rental_id
    	FROM rental r
    	INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    	INNER JOIN store s ON s.store_id=i.store_id
    	INNER JOIN address a ON s.address_id= a.address_id
    	INNER JOIN city c ON c.city_id = a.city_id
    	WHERE c.city = 'Woodridge'
    );
    ```
3.  Elimina los payments de las tiendas de Woodridge

    ```sql
    ```
4.  Cambia el apellido de los actores que actuaron en más de dos películas a "Esponja"

    ```sql
    ```
5.  Haz una copia de los actores en la base de datos

    ```sql
    ```
