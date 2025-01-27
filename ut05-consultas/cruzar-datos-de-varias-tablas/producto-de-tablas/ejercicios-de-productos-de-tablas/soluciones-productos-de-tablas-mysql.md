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

# Soluciones productos de tablas MySQL



1. ```sql
   SELECT a.first_name, a.last_name
   FROM actor a, film_actor fa
   WHERE fa.actor_id = a.actor_id AND fa.film_id = 5;
   ```
2. ```sql
   SELECT c.first_name, r.rental_date 
   FROM customer c, rental r
   WHERE c.customer_id = r.customer_id
   ORDER BY c.first_name, r.rental_date; 

   ```
3. ```sql
   SELECT c.first_name, a.postal_code
   FROM customer c, address a
   WHERE c.address_id = a.address_id
   ORDER BY c.last_name, c.first_name; 
   ```
4. ```sql
   SELECT 
       c.name, f.title
   FROM category c, film_category fc, film f 
   WHERE 
       c.category_id = fc.category_id AND 
       f.film_id = fc.film_id;
   ```
5. ```sql
   SELECT c.first_name,f.title, i.inventory_id
   FROM customer c, rental r, inventory i, film f 
   WHERE 
       c.customer_id = r.customer_id AND 
       i.inventory_id = r.inventory_id AND 
       f.film_id = i.film_id ; 
   ```
6. ```sql
   SELECT a.first_name,f.title
   FROM actor a  , film_actor fc , film f
   WHERE 
       a.actor_id = fc.actor_id AND 
       fc.film_id =f.film_id
   ORDER BY a.first_name; 
   ```
7. ```sql
   SELECT f.title , r.return_date
   FROM film f , inventory i , rental r
   WHERE 
       f.film_id = i.film_id AND 
       i.inventory_id = r.inventory_id; 
   ```
8. ```sql
   SELECT a.first_name , f.title 
   FROM actor a , film f , film_actor fa 
   WHERE 
       a.actor_id= fa.actor_id AND
       fa.film_id=f.film_id AND 
       f.rating !='PG-13';
   ```
9. ```sql
   SELECT c.first_name , c.last_name , r.rental_date 
   FROM customer c , rental r
   WHERE c.customer_id = r.customer_id
   ORDER BY r.rental_date DESC 
   LIMIT 1; 
   ```
