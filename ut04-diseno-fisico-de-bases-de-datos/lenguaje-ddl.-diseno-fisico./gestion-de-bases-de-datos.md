---
cover: ../../.gitbook/assets/mysqlpost.jpeg
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

# Gestión de bases de datos

## Creación de una base de datos

Crea la base de datos en el SBDB.

```sql
CREATE DATABASE <nombre_db>;
```

## Eliminación de una base de datos

Elimina la base de datos del SGBD.

```sql
DROP DATABASE <nombre_db>;
```

## Listar bases de datos

Permite listar todas las bases de datos que residen en el SGBD.

```sql
SHOW DATABASES;
```

## Usar una base de datos

Nos permite cambiar la base de datos con la que estamos trabajando.

```sql
USE <nombre_db>;
```
