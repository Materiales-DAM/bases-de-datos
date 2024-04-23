---
cover: ../../.gitbook/assets/cybersecurity.png
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

# Ejercicios seguridad de datos

1. Crea un usuario llamado bob y el password Sandia4you
2. Permite que bob haga las siguientes operaciones
   1. Insertar datos en actor, film, actor\_film
   2. Modificar datos en actor, film, actor\_film
   3. Leer los datos de actor, film, actor\_film
3. Crea un role llamado informes
4. Dale al role informes permiso para leer todas las tablas de sakila
5. Crea un role llamado sakila\_admin
6. Dale permisos al role sakila\_admin para leer, insertar, modificar y elminar datos de todas las tablas de sakila
7. Asígnale a bob el role informes
8. Abre una conexión a la base de datos con el usuario bob y comprueba que no puedes insertar datos en sakila
9. Crea un usuario con el role salika\_admin llamado peppa y el password Sandia4you&#x20;
10. Abre una conexión a la base de datos con el usuario peppa y comprueba que puedes insertar datos en sakila
