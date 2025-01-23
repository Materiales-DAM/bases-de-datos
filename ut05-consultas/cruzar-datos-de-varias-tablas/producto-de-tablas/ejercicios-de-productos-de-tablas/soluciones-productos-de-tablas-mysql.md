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
4. ```
   ```
5. ```sql
   ```
6. ```sql
   ```
7. ```sql
   ```
8. ```sql
   ```
9. ```sql
   ```
