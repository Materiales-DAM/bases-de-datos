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

1. delete\_actor: Recibe como parámetro un actor\_id, elimina todos los film\_actor de ese actor y el actor también. Realiza estos pasos en una transacción
2. delete\_films\_older:  Recibe como parámetro un año (INT), inicia una transacción para eliminar películas más antiguas que el año del parámetro (film, film\_actor, film\_category, inventory, rental y payment)
3. transfer\_inventory(original\_store\_id, destintation\_store\_id): transfiere todo el inventario y personal de un store a otro, una vez ejecutado el procedimiento el original\_store\_id debe quedar sin inventario ni personal.  Realiza estos pasos en una transacción
4. duplicate\_film(film\_id): Dado un film\_id, crea una nueva película con los mismos datos y el título 'Copia de \<original>', cópialo con sus categorías y actores.  Realiza estos pasos en una transacción
5. create\_user(user, password, schema): Haz un procedimiento que crea el usuario con el nombre del primer parámetro, el password del segundo parámetro y dale todos los permisos sobre el schema del tercer parámetro
