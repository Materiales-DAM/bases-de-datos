---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
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

# Soluciones agregaciones Mysql

1. ```sql
   SELECT count(*) as num_payments
   FROM payment;
   ```
2. ```sql
   SELECT sum(amount) AS total_amount
   FROM payment;
   ```
3. ```sql
   SELECT COUNT(f.film_id) AS total_horror
   FROM film f
   INNER JOIN film_category fc ON f.film_id= fc.film_id
   INNER JOIN category c ON fc.category_id= c.category_id
   WHERE c.name= 'Horror'; 
   ```
4. ```sql
   SELECT avg(p.amount) as avg_amount
   FROM payment p
   WHERE 
       YEAR(payment_date)=2005 
       AND 
       MONTH(payment_date)=5; 
   ```
5. ```sql
   ```
6. ```sql
   ```
