---
cover: ../../.gitbook/assets/join.png
coverY: 262.56266666666664
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

# Fechas

Las distintas bases de datos relacionales proporcionan funciones para trabajar con fechas y tiempos. Algunas de las funciones más comunes incluyen

### Ahora (NOW)

Devuelve la fecha y la hora actuales

{% tabs %}
{% tab title="MySQL" %}
```sql
SELECT NOW();
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
SELECT NOW(); 
```
{% endtab %}
{% endtabs %}

### **Hoy**

Devuelve la fecha y la hora actuales

{% tabs %}
{% tab title="MySQL" %}
```sql
SELECT NOW();  -- Devuelve la fecha y la hora actuales
SELECT CURDATE();  -- Devuelve la fecha actual
SELECT CURTIME();  -- Devuelve la hora actual
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
SELECT CURRENT_TIMESTAMP;  -- Devuelve la fecha y la hora actuales
SELECT CURRENT_DATE;  -- Devuelve la fecha actual
SELECT CURRENT_TIME;  -- Devuelve la hora actual
```
{% endtab %}
{% endtabs %}

### Operaciones con fechas

MySQL permite realizar operaciones aritméticas con fechas. Puedes adelantar o retrasar segundos, minutos, días, meses o años a una fecha utilizando la función correspondiente.

#### Retrasar una fecha

Es posible modificar una fecha retrasándola un intervalo de tiempo. Un intervalo de tiempo se define con un número entero y una unidad de tiempo (año, mes, día, hora, minuto o segundo)

{% tabs %}
{% tab title="MySQL" %}
```sql
-- Retrasa 1 día a cada payment_date
SELECT DATE_ADD(payment_date, INTERVAL 1 DAY)
FROM payment;  
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
-- Retrasa 1 día a cada payment_date
SELECT payment_date + INTERVAL '1 day'
FROM payment;
```
{% endtab %}
{% endtabs %}

#### Adelantar una fecha

Es posible modificar una fecha adelantándola un intervalo de tiempo. Un intervalo de tiempo se define con un número entero y una unidad de tiempo (año, mes, día, hora, minuto o segundo)

{% tabs %}
{% tab title="MySQL" %}
```sql
-- Adelanta 1 día a cada payment_date
SELECT DATE_SUB(payment_date, INTERVAL 1 DAY)
FROM payment;  
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
-- Adelanta 1 día a cada payment_date
SELECT payment_date - INTERVAL '1 day'
FROM payment;
```
{% endtab %}
{% endtabs %}

### Formateo de fechas

Puedes formatear fechas y horas según tus necesidades.

{% tabs %}
{% tab title="MySQL" %}
```sql
SELECT DATE_FORMAT(payment_date, '%Y-%m-%d %H:%i:%s')
FROM payment;
```
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
SELECT to_char(payment_date, 'yyyy-mm-dd') as formatted_date
FROM payment;
```
{% endtab %}
{% endtabs %}

### Extraer partes de una fecha

Puedes extraer partes específicas de una fecha, como año, mes, día, hora, minuto, segundo, etc., utilizando funciones.

{% tabs %}
{% tab title="MySQL" %}
<pre class="language-sql"><code class="lang-sql"><strong>SELECT 
</strong>    YEAR(payment_date) as payment_year, 
    MONTH(payment_date) as payment_month,
    MONTHNAME(payment_date) AS payment_month_name,
    DAY(payment_date) as payment_day,
    # 0 es lunes, 6 domingo
    WEEKDAY(payment_date) as payment_day_of_week,
    DAYNAME(payment_date) as payment_day_name_of_week
FROM payment;
</code></pre>
{% endtab %}

{% tab title="PostgreSQL" %}
```sql
SELECT 
    date_part('year', payment_date) as payment_year, 
    date_part('month', payment_date) as payment_month,
    to_char(payment_date, 'month') as payment_month_name,
    date_part('day', payment_date) as payment_day,
    -- 1 es lunes, 7 domingo
    date_part('dow', payment_date) as payment_day_of_week,
    to_char(payment_date, 'day') as payment_day_of_week_name
FROM payment;
```
{% endtab %}
{% endtabs %}
