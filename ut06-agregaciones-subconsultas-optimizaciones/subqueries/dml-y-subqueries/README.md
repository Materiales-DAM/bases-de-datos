---
cover: ../../../.gitbook/assets/subquery.gif
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

# DML y subqueries

Las subqueries también se pueden utilizar en consultas de modificación de datos de los siguientes tipos:

* Eliminación de datos de una tabla en base a condiciones en otras tablas
* Actualización de datos de una tabla en base a condiciones en otras tablas
* Inserción / modificación de datos con valores calculados a partir de subqueries

Las subqueries en este tipo de consultas se harán en el WHERE o en el SET

## INSERT con subqueries

Por ejemplo, si queremos duplicar los pagos, cambiando la fecha hoy

```sql
INSERT INTO rental(rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
SELECT CURRENT_DATE(), r.inventory_id, r.customer_id, r.return_date, r.staff_id, NOW()
FROM rental r;
```

## DELETE con subqueries

Por ejemplo, si se desean eliminar las películas de Horror

```sql
DELETE FROM film f
WHERE f.film_id IN (
    SELECT fc.film_id
    FROM film_category fc 
    INNER JOIN category c ON fc.category_id = c.category_id
    WHERE c.name='Horror'
)
```

## UPDATE con subqueries

Por ejemplo, podría querer cambiar el año de las películas de Horror

```sql
UPDATE film f
SET release_year=2007
WHERE f.film_id IN (
    SELECT fc.film_id
    FROM film_category fc 
    INNER JOIN category c ON fc.category_id = c.category_id
    WHERE c.name='Horror'
)
```

## Actualizar las películas a la fecha más nueva

Por ejemplo, vamos a actualizar el año de las películas de Horror al año de la película más nueva en Sakila

```sql
UPDATE film f
SET release_year= (SELECT MAX(release_year) FROM film)
WHERE f.film_id IN (
    SELECT fc.film_id
    FROM film_category fc 
    INNER JOIN category c ON fc.category_id = c.category_id
    WHERE c.name='Horror'
)
```
