---
cover: ../../.gitbook/assets/aggregation.png
coverY: 69.50399999999999
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

# Agregaciones

Las agregaciones en SQL son operaciones que operan sobre conjuntos de valores para resumir o calcular información resumida, como la suma, el promedio, el conteo, el mínimo y el máximo, entre otros.&#x20;

Las agregaciones son esenciales cuando se necesita obtener información resumida o realizar cálculos sobre grandes conjuntos de datos. Por ejemplo, podrías usar agregaciones para calcular el total de ventas de un producto, encontrar el promedio de edad de los clientes, contar el número de pedidos realizados en un período de tiempo determinado, entre otros casos de uso.

## Funciones de agregación

Las funciones de agregación definen operaciones sobre conjuntos de datos que nos permiten obtener un sólo valor a partir todos los valores de una columna. Estas funciones se utilizan comúnmente junto con la instrucción `SELECT` para resumir datos en una tabla.

### **SUM()**

Calcula la suma de los valores en una columna numérica.

Por ejemplo, si quisiéramos calcular la cantidad total de pagos que se han hecho podríamos ejecutar esta query.

```sql
SELECT SUM(amount) AS total_amount
FROM payment;
```

### **AVG()**

Calcula el promedio de los valores en una columna numérica.

```sql
SELECT AVG(amount) AS average_amount
FROM payment;
```

### **COUNT()**&#x20;

Cuenta el número de filas o el número de valores no nulos en una columna.&#x20;

Podemos querer contar el número de direcciones que tienen un valor para address2

```sql
SELECT COUNT(address2) 
FROM address a;
```

Si se desean contar el número total de filas se usa el \* en lugar de una columna

```sql
SELECT COUNT(*) 
FROM address a;
```

### **MIN()**

Encuentra el valor mínimo en una columna.

```sql
SELECT MIN(amount) AS min_amount
FROM payment;
```

### **MAX()**

Encuentra el valor máximo en una columna.

```sql
SELECT MAX(amount) AS max_amount
FROM payment;
```

##

