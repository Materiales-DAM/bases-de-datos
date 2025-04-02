---
cover: ../../../.gitbook/assets/admin.jpg
coverY: 0
---

# Soluciones tareas de administración

1. ```bash
   #MySQL
   mysqldump -h 172.17.0.1 -u root -p sakila > mysql_sakila.sql

   # Postgres
   pg_dump -h localhost -U postgres -d postgres --schema sakila -f postgres_sakila.sql 
   ```
2. ```bash
   #MySQL
   mysql -h 172.17.0.1 -u root -p -e 'CREATE DATABASE sakila;'
   mysql -h 172.17.0.1 -u root -p sakila < mysql_sakila.sql

   # Postgres
   psql -h localhost -U postgres -d postgres -f postgres_sakila.sql 

   ```
