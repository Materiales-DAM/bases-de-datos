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

# Soluciones de procedimientos almacenados

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
2. ```plsql
   ```
3. ```plsql
   ```
4. ```plsql
   ```
5. ```plsql
   ```
