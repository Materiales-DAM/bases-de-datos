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
    INNER JOIN film f ON f.film_id= i.inventory_id
GROUP BY i.store_id, f.film_id;
```
