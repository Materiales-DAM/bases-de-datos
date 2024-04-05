---
cover: ../.gitbook/assets/mysqlpost.jpeg
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

# PostgreSQL vs MySQL

A continuación, se enumeran algunas diferencias entre los dialectos del DDL de MySQL y PostgreSQL

## Crear esquemas y bases de datos

En MySQL SCHEMA y DATABASE son sinónimos, se puede usar una palabra o la otra.

En PostgreSQL dentro de un servidor tenemos varias DATABASES, dentro de cada una puede haber varios SCHEMA.

### MySQL

En MySQL para crear una base de datos o esquema haríamos

```sql
CREATE DATABASE IF NOT EXISTS MiBaseDeDatos;
```

También valdría hacerlo con la palabra SCHEMA

```sql
CREATE SCHEMA BASE IF NOT EXISTS MiBaseDeDatos;
```

### PostgreSQL

En cambio en PostgreSQL al no ser lo mismo la base de datos y el esquema no serían intercambiables. Lo haríamos siempre de esta manera

```sql
CREATE SCHEMA IF NOT EXISTS MiBaseDeDatos;
```

## Eliminar un esquema

### MySQL

En MySQL para eliminar una base de datos o esquema haríamos

```sql
DROP DATABASE IF EXISTS MiBaseDeDatos;
```

También valdría hacerlo con la palabra SCHEMA

```sql
DROP SCHEMA BASE IF EXISTS MiEsquema;
```

### PostgreSQL

En cambio en PostgreSQL al no ser lo mismo la base de datos y el esquema no serían intercambiables. Lo haríamos siempre de esta manera

```sql
DROP SCHEMA IF EXISTS MiEsquema CASCADE;
```

## Seleccionar un esquema

### PostgreSQL

No se puede seleccionar un esquema, se debe especificar el esquema en cada consulta

```sql
CREATE TABLE MiEsquema.Product(
	Name VARCHAR(30) PRIMARY KEY,
	Calories INT NOT NULL,
	Price NUMERIC(8, 2) NOT NULL,
	BagType CHAR(3) NOT NULL
);
```

### MySQL

Se usa la sentencia USE

```sql
USE MiEsquema;
```

## Comentarios

### MySQL

En MySQL se harían con el símbolo `#`

```sql
# Esto es un comentario en MySQL
```

### PostgreSQL

En cambio en PostgreSQL se haría con `--`

<pre class="language-sql"><code class="lang-sql"><strong>-- Esto es un comentario en PostgreSQL
</strong></code></pre>

## Columnas auto-incrementales

### MySQL

En MySQL se usa `AUTO_INCREMENT`

```sql
CREATE TABLE Person(
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);
```

### PostgreSQL

En cambio en PostgreSQL se usa `SERIAL` en lguar de `INT AUTO_INCREMENT`

```sql
CREATE TABLE Person(
    Id SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);
```

