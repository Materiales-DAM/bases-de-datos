---
cover: ../../../.gitbook/assets/cybersecurity.png
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

## MySQL

```sql
CREATE USER 'bob'@'%' IDENTIFIED BY 'Sandia4you';


GRANT INSERT, UPDATE, SELECT ON sakila.actor  TO 'bob';
GRANT INSERT, UPDATE, SELECT ON sakila.film_actor  TO 'bob';
GRANT INSERT, UPDATE, SELECT ON sakila.film  TO 'bob';

CREATE ROLE 'informes';

GRANT SELECT ON sakila.* TO 'informes';

CREATE ROLE 'sakila_admin';

GRANT INSERT, UPDATE, DELETE, SELECT ON sakila.* TO 'sakila_admin';

GRANT 'informes' TO 'bob';
SET DEFAULT ROLE 'informes' TO 'bob';


CREATE USER 'peppa'@'%' IDENTIFIED BY 'Sandia4you';
GRANT 'sakila_admin' TO 'peppa';
SET DEFAULT ROLE 'sakila_admin' TO 'peppa';

REVOKE 'informes' FROM 'bob';

DROP USER 'bob';
```

## PostgreSQL

```sql
CREATE USER bob WITH PASSWORD 'Sandia4you';

GRANT USAGE ON SCHEMA sakila TO bob;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA sakila TO bob;
GRANT INSERT, UPDATE, SELECT, DELETE ON sakila.actor, sakila.film, sakila.film_actor TO bob;

CREATE ROLE informes;

GRANT USAGE ON SCHEMA sakila TO informes;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA sakila TO informes;
GRANT SELECT ON ALL TABLES IN SCHEMA sakila TO informes;

CREATE ROLE sakila_admin;
GRANT USAGE ON SCHEMA sakila TO sakila_admin;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA sakila TO sakila_admin;
GRANT INSERT, UPDATE, DELETE, SELECT ON ALL TABLES IN SCHEMA sakila TO sakila_admin;

GRANT informes TO bob;

CREATE USER peppa WITH PASSWORD 'Sandia4you';
GRANT sakila_admin TO peppa;


REVOKE informes FROM bob;

REVOKE USAGE ON SCHEMA sakila FROM bob;
REVOKE USAGE, SELECT ON ALL SEQUENCES IN SCHEMA sakila FROM bob;
REVOKE INSERT, UPDATE, DELETE, SELECT ON sakila.actor, sakila.film, sakila.film_actor FROM bob;

DROP USER bob;
```
