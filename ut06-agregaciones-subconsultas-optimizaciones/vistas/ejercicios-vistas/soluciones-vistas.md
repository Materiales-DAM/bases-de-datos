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
    ```
5.  Crea una vista que muestre el nombre de la película, el nombre del actor y la cantidad de veces que cada actor aparece en la película.

    ```sql
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
    ```
8.  Crea una vista materializada que muestre los nombres de las películas junto con el nombre del idioma en que están disponibles.

    ```
    ```
9.  Crea una vista que muestre los nombres de las películas junto con el nombre de la categoría a la que pertenecen.

    ```sql
    ```
10. Crea una vista materializada que muestre el nombre del actor, el nombre de la película y la fecha de alquiler de las películas en las que cada actor participó.

    ```sql
    ```
