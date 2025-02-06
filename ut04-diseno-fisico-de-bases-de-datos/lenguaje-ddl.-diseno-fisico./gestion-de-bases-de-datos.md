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
CREATE SCHEMA <nombre_db>;
```

## Eliminación de una base de datos

Elimina la base de datos del SGBD.

```sql
DROP SCHEMA <nombre_db>;
```

## Listar bases de datos

Permite listar todas las bases de datos que residen en el SGBD.

```sql
SHOW DATABASES;
```

## Seleccionar un schema

Nos permite cambiar el esquema con la que estamos trabajando. Estas sentencias deben ejecutarse cada vez que se abre el script.

{% tabs %}
{% tab title="MySQL" %}
```sql
USE <nombre_db>;
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
SET search_path TO <schema>;
```
{% endtab %}
{% endtabs %}
