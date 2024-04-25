---
cover: ../../../.gitbook/assets/admin.jpg
coverY: 0
---

# Soluciones tareas de administración

## Mysql

```bash
# BACKUP
mysqldump -h 172.17.0.1 -u root -p sakila > mysql.sql

## RESTORE
mysql -h 172.17.0.1 -u root -p -e 'CREATE DATABASE copia;'
mysql -h 172.17.0.1 -u root -p copia < mysql.sql
```

## PostgreSQL

```bash
# BACKUP
pg_dump -h 172.17.0.1 -U postgres -d postgres -f postgres.sql

## RESTORE
createdb -U postgres -h 172.17.0.1  copia
psql -U postgres -C -h 172.17.0.1 -f postgres.sql -d copia
```
