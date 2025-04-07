---
cover: ../../../.gitbook/assets/plsql.jpg
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

# Copy of Ejercicios de procedimientos almacenados

Escribe los siguientes procedimientos almacendados en sakila:

1. ```plsql
   -- MySQL
   DROP PROCEDURE IF EXISTS delete_actor;
   CREATE PROCEDURE delete_actor(
   	IN actor_id INT
   )
   BEGIN
     START TRANSACTION;
     DELETE FROM film_actor fa WHERE fa.actor_id = @actor_id;
     DELETE FROM actor a WHERE a.actor_id = @actor_id;
     COMMIT;
   END;

   CALL delete_actor(1);

   -- Postgres

   CREATE OR REPLACE PROCEDURE delete_actor(
   	IN actor_id INT
   )
   LANGUAGE plpgsql
   AS $$
   BEGIN
     	DELETE FROM film_actor fa WHERE fa.actor_id = delete_actor.actor_id;
     	DELETE FROM actor a WHERE a.actor_id = delete_actor.actor_id;
   END;$$

   CALL delete_actor(1);
   ```
2. delete\_films\_older:  Recibe como parámetro un año (INT),  elimina películas más antiguas que el año del parámetro (film, film\_actor, film\_category, inventory, rental y payment)
3. transfer\_inventory(original\_store\_id, destination\_store\_id): transfiere todo el inventario y personal de un store a otro, una vez ejecutado el procedimiento el original\_store\_id debe quedar sin inventario ni personal.
4. duplicate\_film(film\_id): Dado un film\_id, crea una nueva película con los mismos datos y el título 'Copia de \<original>', cópialo con sus categorías y actores.
5. create\_user(user, password, schema): Haz un procedimiento que crea el usuario con el nombre del primer parámetro, el password del segundo parámetro y dale todos los permisos sobre el schema del tercer parámetro
