---
cover: ../../.gitbook/assets/select.png
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

# Consulta de datos

La instrucción **`SELECT`** es una de las más fundamentales y poderosas en SQL y se utiliza para recuperar datos de una o varias tablas de una base de datos.

## Sintaxis básica

```sql
SELECT
    select_expr [, select_expr] ...
    FROM table_name
    [WHERE where_condition]
    [ORDER BY {col_name | expr | position}
      [ASC | DESC], ... [WITH ROLLUP]]
    [LIMIT {[offset,] row_count | row_count OFFSET offset}]
```

Por ejemplo, una consulta que devuelve todos los clientes de una base de datos sería

```sql
SELECT * FROM Customer 
```

## Selección de columnas

En una consulta `SELECT` en SQL, las opciones disponibles para seleccionar columnas proporcionan flexibilidad para recuperar datos específicos de una tabla o varias tablas. Aquí están algunas de las opciones comunes:

#### **Seleccionar Todas las Columnas (`*`)**

```sql
SELECT * FROM Customer;
```

Esto seleccionará todas las columnas disponibles en la tabla especificada. Es útil cuando deseas recuperar todos los datos de una tabla.

#### **Seleccionar columnas específicas**

```sql
SELECT Name, BirthDate FROM Customer;
```

Puedes enumerar las columnas específicas que deseas recuperar, separadas por comas. Esto es útil cuando solo necesitas información de algunas columnas.

#### **Alias de Columnas**

Puedes usar `AS` para asignar alias a las columnas seleccionadas. Los alias son útiles para cambiar el nombre de la columna en el resultado de la consulta.

```sql
SELECT Name AS Nombre FROM Customer;
```

#### **Operaciones en Columnas**

Puedes realizar operaciones en columnas, como sumarlas o concatenarlas, y asignar un alias al resultado. Esto es útil para realizar cálculos o manipulaciones en los datos durante la consulta.

```sql
SELECT Columna1 + Columna2 AS Suma FROM Tabla;
```

#### **Concatenación de Cadenas**

La función `CONCAT` se usa para concatenar cadenas. En este ejemplo, se crea una columna `nombre_completo` combinando las columnas `nombre` y `apellido`.

```sql
SELECT CONCAT(Name, ' ', Surname) AS FullName FROM Customer;
```

#### **Literales**

```sql
SELECT Name, 'Texto Fijo' AS LiteralValue, 42 AS LiteralNumber FROM Customer;
```

Puedes seleccionar constantes o expresiones literales como parte de tu resultado. En este caso, la consulta selecciona el nombre de los clientes, una cadena de texto fija y el número 42.

##

