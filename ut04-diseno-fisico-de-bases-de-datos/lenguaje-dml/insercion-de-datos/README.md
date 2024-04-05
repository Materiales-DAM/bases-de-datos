---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Inserción de datos

El comando `INSERT` se utiliza para agregar nuevos registros a una tabla. Permite especificar los valores que se deben insertar en cada columna o proporcionar los valores en el mismo orden en el que las columnas fueron definidas en la tabla. Aquí tienes una explicación básica del comando `INSERT` junto con algunos ejemplos:

## Sintaxis básica

```sql
INSERT INTO NombreDeTabla (Columna1, Columna2, Columna3, ...)
VALUES (valor1, valor2, valor3, ...);
```

Supongamos que tenemos la siguiente tabla:

```sql
CREATE TABLE Person (
    Id INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL
);
```

Ahora, vamos a insertar un nuevo usuario en esta tabla:

<pre class="language-sql"><code class="lang-sql"># Esta sentencia inserta una persona en la base de datos
<strong>INSERT INTO Person (Id, Name, Age)
</strong>VALUES (1, 'Juan Perez', 25);
</code></pre>

### [Documentación oficial](https://dev.mysql.com/doc/refman/8.0/en/insert.html)

## Literales en SQL

\
En SQL, los literales son representaciones constantes de valores que se utilizan en las consultas y sentencias SQL. En el lenguaje DML vamos a usar literales para introducir datos a la base de datos.

### &#x20;Cadenas de Caracteres

Los literales de cadenas de caracteres se representan encerrando el texto entre comillas simples (`'`) .

```sql
# Juan Perez va entre comillas simples porque es un literal de cadena de caracteres
INSERT INTO Person (Id, Name, Age)
VALUES (1, 'Juan Perez', 25);
```

### Números

Los literales de números se representan sin comillas y pueden incluir enteros, decimales o números en notación científica.

```sql
-- Entero
123

-- Decimal
45.67

-- Notación científica
1.23e4  -- Equivalente a 12300
```

```sql
# Insertamos el literal 25 como Edad de Juan
INSERT INTO Person (Id, Name, Age)
VALUES (1, 'Juan Perez', 25);
```

### &#x20;Fechas

Los literales de fechas se representan encerrando la fecha entre comillas simples y utilizando un formato específico dependiendo del sistema de gestión de bases de datos.

Ejemplos:

```sql
-- Fecha en formato YYYY-MM-DD (ISO 8601)
'2023-12-07'

-- Fecha y hora en formato YYYY-MM-DD HH:mm:SS
'2023-12-07 14:30:00'
```

Es importante notar que el formato de fecha puede variar entre diferentes sistemas de gestión de bases de datos. Algunos sistemas pueden aceptar varios formatos de fecha, pero es recomendable seguir el estándar SQL o el formato específico del sistema que estás utilizando.

Por ejemplo, podríamos crear la siguiente tabla

```sql
CREATE TABLE Event (
    EventId INT PRIMARY KEY,
    EventName VARCHAR(50) NOT NULL,
    EventDate DATE NOT NULL
);
```

Luego podemos insertar

```sql
# Esta fecha sigue el formato YYYY-MM-DD, o sea sería el día 15 de diciembre de 2023
INSERT INTO Event (EventId, EventName, EventDate)
VALUES (1, 'TechX Conference', '2023-12-15');
```

## **Insertar múltiples registros en  un comando.**

En la gestión de bases de datos, la capacidad de insertar múltiples filas de datos en una sola operación es esencial para optimizar y simplificar la manipulación de información. El comando `INSERT` con varias filas en SQL se presenta como una herramienta clave para llevar a cabo esta tarea de manera eficiente y concisa.

A diferencia de las inserciones tradicionales, donde cada registro se agrega de forma individual, el `INSERT` con varias filas permite especificar y agregar conjuntos completos de datos en una única declaración. Este enfoque no solo reduce la complejidad del código SQL, sino que también mejora el rendimiento al minimizar la cantidad de consultas necesarias para insertar datos múltiples.

```sql
INSERT INTO nombre_de_tabla (columna1, columna2, columna3, ...)
VALUES
    (valor1, valor2, valor3, ...),
    (valor4, valor5, valor6, ...),
    ...;
```

Esta opción es útil cuando se desean agregar varios registros en una sola consulta.

```sql
# Inserta dos personas en un único comando
INSERT INTO Person (Id, Name, Age)
VALUES
    (3, 'Pedro Rodríguez', 28),
    (4, 'Ana Martínez', 22);
```

## Inserción en tablas con AUTO\_INCREMENT

Cuando utilizas una columna con la propiedad `AUTO_INCREMENT`, el sistema de gestión de bases de datos se encarga de incrementar automáticamente el valor de esa columna para cada nueva fila que se inserta. Aquí tienes un ejemplo de cómo realizar una inserción con una columna `AUTO_INCREMENT` en MySQL:

#### Creación de la Tabla con AUTO\_INCREMENT:

```sql
CREATE TABLE AppUser (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL
);

```

En este ejemplo, la columna `UserId` se configura con `AUTO_INCREMENT`, lo que significa que se incrementará automáticamente con un valor único para cada nueva fila.

```sql
INSERT INTO AppUser (Name, Age)
VALUES
    ('Ana', 28),
    ('Juan', 35),
    ('María', 22);
```

En este caso, no es necesario proporcionar un valor para la columna `UserId` en la sentencia `INSERT`, ya que se generará automáticamente. El sistema asignará automáticamente un valor único incremental para cada fila.

Después de ejecutar esta inserción, la tabla `AppUser` podría tener datos como estos:

```diff
+--------+--------+------+
| UserId |  Name  |  Age |
+--------+--------+------+
|   1    |  Ana   |  28  |
|   2    |  Juan  |  35  |
|   3    | María  |  22  |
+--------+--------+------+
```

Es importante tener en cuenta que la sintaxis exacta y la forma de implementar el incremento automático pueden variar según el sistema de gestión de bases de datos que estés utilizando (por ejemplo, MySQL, PostgreSQL, SQL Server, etc.). Este ejemplo es específico para MySQL.
