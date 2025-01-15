---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
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

# Ejercicios DELETE

Para reiniciar la base de datos de Sakila realiza los siguientes pasos:

1. Descarga este fichero

{% file src="../../../../.gitbook/assets/sakila-db.zip" %}

2. En el directorio donde se haya descargado el zip ejecutar lo siguiente

```bash
CONTAINER=diurno-mysql
PASSWORD=Sandia4you
unzip -o sakila-db.zip
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < sakila-db/sakila-schema.sql
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < sakila-db/sakila-data.sql
```

Ejercicios:

1. **Eliminar todas las películas lanzadas antes de 2005.**
2. **Borrar los registros de la tabla `payment` que tengan un monto entre 5.00 y 10.00.**
3. **Eliminar todos los alquileres que fueron realizados el 1 de enero de 2023.**
4. **Borrar las películas que contengan la palabra 'Comedy' en la descripción.**
5. **Borrar todas las películas que tengan una clasificación por edades diferente de 'G'.**
6. **Eliminar actores cuyo apellido comience con la letra 'A'.**
7. **Borrar todas las películas lanzadas después de 2010 y que tengan una duración menor a 120 minutos.**
8. **Eliminar todas las películas que tengan un título que no contenga la palabra 'Action'.**
9. **Borrar clientes que tengan una dirección de correo electrónico nula o que tengan el create\_date antes de 1980.**
10. **Eliminar todas las películas que no tengan una calificación por edades especificada (calificación nula).**
11. **Eliminar clientes que tengan un nombre que no comience con la letra 'M'.**
12. **Borrar todas las películas que tengan una duración igual a 120 minutos o una clasificación por edades igual a 'PG-13'.**
13. **Eliminar actores que tengan un nombre que contenga la palabra 'test'.**
14. **Borrar todos los alquileres realizados después del 1 de enero de 2023 y que no hayan sido devueltos.**
15. **Eliminar todas las películas que tengan una descripción que contenga la palabra 'drama' o hayan sido lanzadas antes de 2000.**
