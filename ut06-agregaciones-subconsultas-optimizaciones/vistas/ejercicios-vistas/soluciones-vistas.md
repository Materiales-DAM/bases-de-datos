---
cover: ../../../.gitbook/assets/view-in-sql-server.png
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

# Soluciones vistas

1.  Crea una vista que muestre los nombres y apellidos de todos los actores.

    ```sql
    CREATE VIEW actor_name AS
    SELECT a.first_name, a.last_name
    FROM actor a;
    ```
2.  Crea una vista que muestre los títulos de todas las películas junto con su duración en minutos.

    ```sql
    CREATE VIEW film_length AS
    SELECT f.title, f.length
    FROM film f;
    ```
3.  Crea una vista que muestre los nombres y apellidos de los clientes junto con sus correos electrónicos.

    ```sql
    CREATE VIEW customer_name_email AS
    SELECT c.first_name, c.last_naem, c.email
    FROM customer c;
    ```
4.  Crea una vista  materializada que muestre los nombres de las películas y los nombres de los actores que participaron en cada película.

    ```sql
    CREATE MATERIALIZED VIEW film_actors AS
    SELECT f.title, a.first_name, a.last_name
    FROM film f 
    INNER JOIN film_actor fa ON f.film_id = fa.film_id
    INNER JOIN actor a ON a.actor_id = fa.actor_id;
    ```
5.  Crea una vista que muestre el nombre de la película, el nombre del actor y la cantidad de veces que cada actor aparece en la película.

    ```sql
    CREATE VIEW actor_appears AS
    SELECT f.title, a.first_name, a.last_name, COUNT(*) AS times_appear
    FROM film f
    INNER JOIN film_actor fa ON f.film_id = fa.film_id
    INNER JOIN actor a ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, f.film_id;
    ```
6.  Crea una vista que muestre el nombre de la película, la cantidad de copias disponibles y la cantidad total de copias para cada película en la tienda.

    ```sql
    CREATE VIEW film_inventory AS
    SELECT i.store_id, i.film_id, f.title, COUNT(*) as inventory, COUNT(*) - COUNT(r.rental_id) as available
    FROM inventory i
    INNER JOIN film f ON f.film_id = i.film_id
    LEFT JOIN rental r ON r.inventory_id  = i.inventory_id AND r.return_date IS NULL
    GROUP BY i.store_id, i.film_id 
    ORDER BY film_id ASC;
    ```
7.  Crea una vista que muestre los nombres de los clientes junto con el total de dinero gastado por cada cliente en alquileres.

    ```sql
    CREATE VIEW customer_amount AS
    SELECT c.first_name, c.last_name , SUM(p.amount) as total_amount
    FROM customer c 
    INNER JOIN rental r ON c.customer_id = r.customer_id 
    INNER JOIN payment p ON p.rental_id  = r.rental_id 
    GROUP BY c.customer_id ;
    ```
8.  Crea una vista materializada que muestre los nombres de las películas junto con el nombre del idioma en que están disponibles.

    ```sql
    CREATE VIEW film_languages AS
    SELECT f.title, l.name
    FROM film f 
    INNER JOIN "language" l ON f.language_id= l.language_id;
    ```
9.  Crea una vista que muestre los nombres de las películas junto con el nombre de la categoría a la que pertenecen.

    ```sql
    CREATE VIEW film_categories AS
    SELECT f.title, c.name
    FROM category c 
    INNER JOIN film_category fc ON fc.category_id = c.category_id
    INNER JOIN film f ON f.film_id = fc.film_id;
    ```
10. Crea una vista materializada que muestre el nombre del actor, el nombre de la película y la fecha de alquiler de las películas en las que cada actor participó.

    ```sql
    CREATE MATERIALIZED VIEW rental_actos AS
    SELECT a.first_name, a.last_name, f.title, r.rental_date
    FROM actor a 
    INNER JOIN film_actor fa ON fa.actor_id = a.actor_id
    INNER JOIN film f ON f.film_id = fa.film_id
    INNER JOIN inventory i ON f.film_id = i.film_id
    INNER JOIN rental r ON r.inventory_id= i.inventory_id;
    ```
