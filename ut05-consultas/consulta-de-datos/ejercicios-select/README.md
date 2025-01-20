---
cover: ../../../.gitbook/assets/select.png
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

# Ejercicios SELECT

Ejercicios Sakila:

1. Recupera las descripciones de las películas de la tabla `film` que contienen la palabra 'Adventure' o 'Action', ordenadas alfabéticamente por título.
2. Selecciona todas los columnas de la tabla `category` donde la categoría sea 'Drama' o 'Music', ordenados por nombre de manera ascendente.
3. Muestra los nombres de las ciudades de la tabla `city` que pertenecen al país con el ID 1 o al país con el ID 2, ordenados por nombre de ciudad de manera descendente.
4. Obtén los nombres y apellidos de los clientes de la tabla `customer` que tienen una dirección de correo electrónico, ordenados por apellido de manera ascendente.
5. Recupera las direcciones de la tabla `address` donde el código postal comience con '48' y el distrito sea 'California', ordenadas city\_id de forma descendente.
6. Selecciona todas las filas de la tabla `language` donde el nombre del idioma sea 'Spanish' o 'French', ordenadas por nombre de idioma de manera ascendente.
7. World-db: Obtén los nombres de los países de la tabla `country` cuyo continente sea 'Europe' o 'Asia', ordenados por nombre de país de manera descendente.
8. Muestra los nombres de las categorías de la tabla `category` que tengan una longitud de más de 10 caracteres o que comiencen con la letra 'A', ordenados alfabéticamente por nombre de categoría. USAR LA FUNCIÓN LENGTH()
9. Obtén los nombres de las categorías de la tabla `category` donde la categoría sea 'Action' o 'Travel', ordenados alfabéticamente por nombre.
10. Recupera los nombres y apellidos de los empleados de la tabla `staff` que tienen un picture y trabajan en la tienda con ID 1 o ID 2, ordenados por apellido de manera ascendente.
11. Mostrar los nombres y apellidos de los clientes ordenados alfabéticamente por apellido, muestra la segunda página teniendo en cuenta que cada página tiene 50 elementos.
12. Obtener los títulos y descripciones de las películas cuya duración sea mayor a 120 minutos, ordenadas por duración de manera descendente y título, muestra la cuarta página teniendo en cuenta que cada página tiene 10 elementos.
13. Obtener los nombres de las categorías de películas cuyo nombre contenga la palabra 'me', ordenadas alfabéticamente, limitando a 1 registros .
14. Obtener todos los datos de las películas cuyo título contenga la palabra 'Paced' o 'of' y que su release\_year sea mayor que 2000 o su duración mayor que 100
