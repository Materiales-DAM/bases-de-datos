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

# Soluciones seguridad de datos

1. ```sql
   #MySQL
   CREATE USER 'bob'@'%' IDENTIFIED BY 'Sandia4you';

   -- Postgres
   CREATE USER bob WITH PASSWORD 'Sandia4you';
   ```
2. ```sql
   #MySQL

   GRANT INSERT, UPDATE, SELECT ON actor TO 'bob';
   GRANT INSERT, UPDATE, SELECT ON film_actor TO 'bob'; 
   GRANT INSERT, UPDATE, SELECT ON film TO 'bob';  
   -- Postgres

   GRANT USAGE ON SCHEMA sakila TO bob;
   GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA sakila TO bob;
   GRANT INSERT, UPDATE, SELECT ON actor, film, film_actor TO bob; 
   ```
3. ```sql
   #MySQL


   -- Postgres


   ```
4. ```sql
   #MySQL


   -- Postgres


   ```
5. ```sql
   #MySQL


   -- Postgres


   ```
6. ```sql
   #MySQL


   -- Postgres


   ```
7. ```sql
   #MySQL


   -- Postgres


   ```
8. ```sql
   #MySQL


   -- Postgres


   ```
9. ```sql
   #MySQL


   -- Postgres


   ```
10. ```sql
    #MySQL


    -- Postgres


    ```
11. ```sql
    #MySQL


    -- Postgres


    ```
12. ```sql
    #MySQL


    -- Postgres


    ```

