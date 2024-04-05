---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
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

# Definición de tablas

## Tipos de datos

### Datos numéricos

* **INT o INTEGER**: se usan para guardar datos numéricos enteros, (ya no se indica entre paréntesis el número de dígitos de los que se compone, por tanto, si queremos limitar el nº de dígitos de un nº entero es mejor especificarlo como CHAR o VARCHAR)
* **FLOAT** (escala, precisión): se usa para guardar datos numéricos en coma flotante. La escala indica el número total de dígitos y la precisión el nº de posiciones decimales
* **NUMERIC 0 DECIMAL** (escala, precisión): se usa para guardar datos numéricos decimales. La escala indica el nº total de dígitos y la precisión el nº de posiciones decimales (si no se indica se supone que sería 0 y por tanto que se podría corresponder con un nº entero). Ej\*: NUMERIC (3,2) me dejaría poner el número 2.53, pero no el 25.3.

### Datos alfanuméricos o cadenas de caracteres:

* **CHAR** (long): se usa para guardar cadenas de caracteres de longitud fija especificada entre paréntesis, indicando su longitud entre paréntesis (puede ser un número entre 0 y 255)
* **VARCHAR** (long): se usa para guardar cadenas de caracteres de longitud variable cuyo límite máximo es el valor especificado entre paréntesis (su longitud máxima puede ser un nº entre 0 y 255).
* **TEXT**: un texto de longitud máxima de 65.535 caracteres (2 ^16 -1). Se almacena como un VARCHAR.
* **LONGTEXT**: un texto de longitud máxima de 4 Gigas de caracteres (2^ 32 -1). Se almacena como un VARCHAR.

<figure><img src="https://lh7-us.googleusercontent.com/71qDcGPgDGaPJL0KUV4vHzFgcyadcwH86dSO48QyDM83ohwYFyTgF0vfZGjWrt_OZV7Rh0ARrZaIX8sGVRqdYV6xR07vpI5JzFC5FyVT3ADudhQQP2P8LHMQAhjXU-vna_NsgPTeSjw3BkIm9tFqOQ=s2048" alt=""><figcaption></figcaption></figure>

### Fechas

Se tratan externamente como cadenas de caracteres, por lo que también tienen que estar entre comillas.

* **DATE**: permite almacenar fechas, incluyendo en esa información: año, mes y día con el formato ‘YYYY-MM-DD’.
* **DATETIME**: este tipo de dato permite almacenar fechas y horas, incluyendo en esa información: año, mes, día, horas, minutos y segundos con la forma ‘YYYY-MM-DD HH:MM:SS’.
* **TIME**: este tipo de dato permite almacenar horas, incluyendo en esa información: horas, minutos y segundos con la forma ‘HH:MM:SS’.

## Nombres de las tablas

* Deben comenzar con una letra
* No deben tener más de 30 caracteres
* Sólo se permiten utilizar letras del alfabeto del código [ASCII](https://es.wikipedia.org/wiki/ASCII): letras sin tildes ni diéresis (ñ no incluida)
* No puede haber dos tablas con el mismo nombre en la misma base de datos
* No puede coincidir con el nombre de una palabra reservada de SQL

## Sentencia de creación de tablas

La sentencia `CREATE TABLE` permite crear una tabla en la base de datos.

<pre class="language-sql"><code class="lang-sql">CREATE TABLE [IF NOT EXISTS] NombreTabla (
    NombreColumna1 TipoDato [ NOT NULL ]
                            [ DEFAULT default_value ]
                            [ AUTO_INCREMENT ]
                            [ UNIQUE KEY | PRIMARY KEY ]
                            [ COMMENT 'string' ],
    NombreColumna2 TipoDato [ NOT NULL ]
                            [ DEFAULT default_value ]
                            [ AUTO_INCREMENT ]
                            [ UNIQUE KEY | PRIMARY KEY ]
                            [ COMMENT 'string' ],...
  | [CONSTRAINT [constraint_name]] PRIMARY KEY [ USING BTREE | HASH ] (index_col_name, ...)

  | INDEX index_name [ USING BTREE | HASH ] (index_col_name, ...)

<strong>  | [CONSTRAINT [constraint_name]] UNIQUE INDEX 
</strong>        [ index_name ] [ USING BTREE | HASH ] (index_col_name, ...)

  | [CONSTRAINT [constraint_name]] 
        FOREIGN KEY index_name (index_col_name, ...)
        REFERENCES another_table_name (index_col_name, ...)
        [ MATCH FULL | MATCH PARTIAL | MATCH SIMPLE ]
        [ ON DELETE { RESTRICT | CASCADE | SET NULL | NO ACTION } ]
        [ ON UPDATE { RESTRICT | CASCADE | SET NULL | NO ACTION } ]

  | CHECK (expression)
    {ENGINE | TYPE} = engine_name
);
</code></pre>

### [Documentación oficial](https://dev.mysql.com/doc/refman/8.0/en/create-table.html)

Por ejemplo, si se deaseara crear una tabla para guardas la información de persona:

* DNI: es la clave primaria
* Nombre
* Apellidos

```sql
CREATE DATABASE Personas;

USE Personas;

CREATE TABLE Persona(
    Dni VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(30),
    Apellidos VARCHAR(50)
);
```

