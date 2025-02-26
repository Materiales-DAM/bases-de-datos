---
cover: ../../.gitbook/assets/aggregation.png
coverY: 36.37866666666667
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

# Agrupaciones por varias columnas

En ocasiones vamos a querer agrupar por más de una columna. Por ejemplo, si quisiera saber la cantidad de copias de cada película en cada tienda:

```sql
SELECT i.store_id, f.title, COUNT(*) as copies
FROM
    inventory i
    INNER JOIN film f ON f.film_id= i.film_id
GROUP BY i.store_id, f.film_id;
```

#### **Datos de ejemplo (`film`)**

| film\_id | title            | release\_year | rental\_rate | length | rating |
| -------- | ---------------- | ------------- | ------------ | ------ | ------ |
| 1        | ACADEMY DINOSAUR | 2006          | 2.99         | 86     | PG     |
| 2        | ACE GOLDFINGER   | 2006          | 4.99         | 48     | G      |
| 3        | ADAPTATION HOLES | 2006          | 2.99         | 50     | NC-17  |
| 4        | AFFAIR PREJUDICE | 2006          | 2.99         | 117    | G      |

#### **Datos de ejemplo (`inventory`)**

| inventory\_id | film\_id | store\_id |
| ------------- | -------- | --------- |
| 1             | 1        | 1         |
| 2             | 1        | 1         |
| 3             | 2        | 1         |
| 4             | 2        | 2         |
| 5             | 3        | 1         |
| 6             | 3        | 1         |
| 7             | 3        | 2         |
| 8             | 4        | 2         |
| 9             | 4        | 2         |

***

#### **Resultado de la Query**

| store\_id | title            | copies |
| --------- | ---------------- | ------ |
| 1         | ACADEMY DINOSAUR | 2      |
| 1         | ACE GOLDFINGER   | 1      |
| 1         | ADAPTATION HOLES | 2      |
| 2         | ACE GOLDFINGER   | 1      |
| 2         | ADAPTATION HOLES | 1      |
| 2         | AFFAIR PREJUDICE | 2      |
