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

# Soluciones productos de tablas PostgreSQL

1. ```sql
   SELECT a.first_name, a.last_name
   FROM sakila.actor a, sakila.film_actor fa
   WHERE fa.actor_id = a.actor_id AND fa.film_id = 5
   ```
2. ```sql
   SELECT c.first_name, r.rental_date 
   FROM sakila.customer c, sakila.rental r
   WHERE c.customer_id = r.customer_id
   ORDER BY c.first_name, r.rental_date; 
   ```
3. ```sql
   SELECT c.first_name, a.postal_code
   FROM sakila.customer c, sakila.address a
   WHERE c.address_id = a.address_id
   ORDER BY c.last_name, c.first_name; 
   ```
4. ```sql
   SELECT 
       c.name, f.title
   FROM sakila.category c, sakila.film_category fc, sakila.film f 
   WHERE c.category_id = fc.category_id AND f.film_id = fc.film_id;
   ```
5. ```sql
   SELECT c.first_name,f.title, i.inventory_id
   FROM sakila.customer c, sakila.rental r, sakila.inventory i, sakila.film f 
   WHERE c.customer_id = r.customer_id AND i.inventory_id = r.inventory_id AND f.film_id = i.film_id ; 
   ```
6. ```sql
   ```
7. ```sql
   ```
8. ```sql
   ```
9. ```sql
   ```
