---
cover: ../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Actualización de datos

El comando `UPDATE` en MySQL se emplea para modificar datos existentes en una o varias filas de una tabla. La sintaxis es la siguiente:

```sql
UPDATE NombreDeLaTabla
SET NombreColumna1 = Valor1, NombreColumna2 = Valor2, ...
WHERE Condicion;
```

A continuación, una explicación de los elementos clave:

* `NombreDeLaTabla`: Especifica el nombre de la tabla que se actualizará, en singular y en upper camel case.
* `NombreColumna1`, `NombreColumna2`, ...: Son las columnas que se actualizarán, en singular y en upper camel case.
* `Valor1`, `Valor2`, ...: Representan los nuevos valores que se asignarán a las respectivas columnas.
* `Condicion`: Define la condición que determina qué filas se actualizarán. Si esta condición no se especifica, todas las filas de la tabla se verán afectadas.

Por ejemplo, supongamos que tenemos una tabla llamada `Employee` con las columnas `Name`, `Salary`, y `Departament`. Si queremos aumentar el salario en un 10% para todos los empleados en el departamento 'Ventas', podríamos utilizar el comando `UPDATE` de la siguiente manera:

```sql
UPDATE Employee
SET Salary = Salary * 1.1
WHERE Departament = 'Ventas';
```

Es importante ser precavido al usar el comando `UPDATE`, asegurándote de tener una condición adecuada para afectar solo las filas deseadas y evitar cambios no deseados en toda la tabla. Mantener una convención de nombres consistente mejora la legibilidad y mantenimiento del código.

### [Documentación oficial](https://dev.mysql.com/doc/refman/8.0/en/update.html)

## Cláusula WHERE

Con la claúsula WHERE vamos a expresar qué filas deseamos que se vean afectadas por la modificación.

### Comparaciones

#### **Igual (=)**

<pre class="language-sql"><code class="lang-sql"><strong>UPDATE Customer SET Name='Bob' WHERE City = 'CiudadABC';
</strong></code></pre>

Esta sentencia establece el nombre 'Bob' a todos los clientes cuya ciudad sea 'CiudadABC'.

#### **No Igual (!= o <>)**

```sql
UPDATE Customer SET Name='Bob' WHERE Age <> 25;
```

Esta sentencia establece el nombre 'Bob' a todos los clientes donde la edad no es igual a 25.

#### **Mayor que (>)**

```sql
UPDATE Customer SET Name='Bob' WHERE Age > 30;
```

Esta sentencia establece el nombre 'Bob' a todos los clientes donde la edad es mayor a 30.

#### **Menor que (<)**

```sql
UPDATE Customer SET Name='Bob' WHERE Age < 30;
```

Esta sentencia establece el nombre 'Bob' a todos los clientes donde la edad es menor a 30.

#### **Mayor o igual que (>=) y Menor o igual que (<=)**

```sql
UPDATE Customer SET Name='Bob' WHERE Age >= 25 AND Age <= 30;
```

Esta sentencia establece el nombre 'Bob' a todos los clientes donde la edad está entre 25 y 30, inclusive.

#### Es null

```sql
UPDATE Customer SET Name='Bob' WHERE Age IS NULL;
```

#### No es null

```sql
UPDATE Customer SET Name='Bob' WHERE Age IS NOT NULL;
```

#### Entre (BETWEEN)

```sql
UPDATE Customer SET Name='Bob' WHERE Age BETWEEN 20 AND 30;
```

Esta sentencia establece el nombre 'Bob' a todos los clientes donde la edad está entre 20 y 30, inclusive.

#### Parecido a (LIKE)

Sirve para comprobar patrones en una cadena de texto. El símbolo % es un comodín (wildcard) con el que expresamos un determinado patrón.

```sql
UPDATE Customer SET Name='Bob' WHERE Name LIKE 'A%';
```

Esta sentencia establece el nombre 'Bob' a todos los clientes donde el nombre comienza con la letra 'A'.

**Comodín de un solo carácter \_**

Esta sentencia establece el nombre 'Bob' a todos los clientes donde el nombre comienza con 'Ma' seguido de un solo carácter.

<pre class="language-sql"><code class="lang-sql"><strong>UPDATE Customer SET Name='Bob' WHERE Name LIKE 'Ma_';
</strong></code></pre>

Si se desea seleccionar las filas que NO se parecen a un patrón usaremos el NOT LIKE

```sql
-- Se actualizan todos los clientes cuyo nombre no empiece por Ma
UPDATE Customer SET Name='Bob' WHERE Name NOT LIKE 'Ma%';
```

### Fechas

```sql
UPDATE Customer SET Name='Bob' WHERE BirthDate >= '2001-01-01';
```

Esta sentencia establece el nombre 'Bob' a todos los clientes donde la fecha del pedido es igual o posterior al 1 de enero de 2001.

Recuerda que el formato de la fecha puede variar dependiendo del sistema de gestión de bases de datos que estés utilizando.

### **Combinar condiciones**

#### **AND**

```sql
UPDATE Customer SET Name='Bob' WHERE City = 'CiudadABC' AND Age > 25;
```

Esta sentencia establece el nombre 'Bob' a todos los clientes  donde la ciudad es 'CiudadABC' y la edad es mayor a 25.

#### **OR**

```sql
UPDATE Customer SET Name='Bob' WHERE City = 'CiudadABC' OR City = 'CiudadXYZ';
```

Esta sentencia establece el nombre 'Bob' a todos los clientes donde la ciudad es 'CiudadABC' o 'CiudadXYZ'.
