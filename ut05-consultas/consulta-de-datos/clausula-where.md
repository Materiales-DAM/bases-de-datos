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

# Cláusula WHERE

Con la cláusula WHERE vamos a expresar qué filas queremos seleccionar en la query.

### Comparaciones

#### **Igual (=)**



```sql
SELECT * FROM Customer WHERE City = 'CiudadABC';
```

Esta sentencia devuelve los clientes cuya ciudad sea 'CiudadABC'.

#### **No Igual (!= o <>)**

```sql
SELECT * FROM Customer WHERE Age <> 25;
```

Esta sentencia devuelve los clientes donde la edad no es igual a 25.

#### **Mayor que (>)**

```sql
SELECT * FROM Customer WHERE Age > 30;
```

Esta sentencia devuelve los clientes donde la edad es mayor a 30.

#### **Menor que (<)**

```sql
SELECT * FROM Customer WHERE Age < 30;
```

Esta sentencia devuelve los clientes donde la edad es menor a 30.

#### **Mayor o igual que (>=) y Menor o igual que (<=)**

```sql
SELECT * FROM Customer WHERE Age >= 25 AND Age <= 30;
```

Esta sentencia devuelve los clientes donde la edad está entre 25 y 30, inclusive.

#### Es null

<pre class="language-sql"><code class="lang-sql"><strong>SELECT * FROM Customer WHERE Age IS NULL;
</strong></code></pre>

#### No es null

```sql
SELECT * FROM Customer WHERE Age IS NOT NULL;
```

#### Entre (BETWEEN)

```sql
SELECT * FROM Customer WHERE Age BETWEEN 20 AND 30;
```

Esta sentencia devuelve los clientes donde la edad está entre 20 y 30, inclusive.

#### Parecido a (LIKE)

Sirve para comprobar patrones en una cadena de texto. El símbolo % es un comodín (wildcard) con el que expresamos un determinado patrón.

```sql
SELECT * FROM Customer WHERE Name LIKE 'A%';
```

Esta sentencia devuelve los clientes donde el nombre comienza con la letra 'A'.

**Comodín de un solo carácter \_**

Esta sentencia devuelvelos clientes donde el nombre comienza con 'Ma' seguido de un solo carácter.

```sql
SELECT * FROM Customer WHERE Name LIKE 'Ma_';
```

Si se desea seleccionar las filas que NO cumplen un patrón usaremos el NOT LIKE

```sql
-- Se muestran todos los clientes cuyo nombre no empiece por Ma
SELECT * FROM Customer WHERE Name NOT LIKE 'Ma%';
```

### Fechas

```sql
SELECT * FROM Customer WHERE BirthDate >= '2001-01-01';
```

Esta sentencia devuelve los clientes donde la fecha del pedido es igual o posterior al 1 de enero de 2001.

Recuerda que el formato de la fecha puede variar dependiendo del sistema de gestión de bases de datos que estés utilizando.

### **Combinar condiciones**

#### **AND**

```sql
SELECT * FROM Customer WHERE City = 'CiudadABC' AND Age > 25;
```

Esta sentencia devuelve los clientes  donde la ciudad es 'CiudadABC' y la edad es mayor a 25.

#### **OR**

```sql
SELECT * FROM Customer WHERE City = 'CiudadABC' OR City = 'CiudadXYZ';
```

Esta sentencia devuelve los clientes donde la ciudad es 'CiudadABC' o 'CiudadXYZ'.

