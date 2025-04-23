---
cover: ../../.gitbook/assets/plsql.jpg
coverY: 0
layout:
  cover:
    visible: true
    size: full
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

# Ejercicios de procedimientos almacenados

Escribe los siguientes procedimientos almacendados en sakila:

1. delete\_actor: Recibe como parámetro un actor\_id, elimina todos los film\_actor de ese actor y el actor también.
2. delete\_films\_older:  Recibe como parámetro un año (INT),  elimina películas más antiguas que el año del parámetro (film, film\_actor, film\_category, inventory, rental y payment)
3. transfer\_inventory(original\_store\_id, destination\_store\_id): transfiere todo el inventario y personal de un store a otro, una vez ejecutado el procedimiento el original\_store\_id debe quedar sin inventario ni personal.
4. duplicate\_film(film\_id): Dado un film\_id, crea una nueva película con los mismos datos y el título 'Copia de \<original>', cópialo con sus categorías y actores.
5. delete\_store(storeid): Haz un procedimiento que elimine todos los datos de una tienda incluyendo sus clientes, su staff, su inventario, sus rentals y sus payments.
