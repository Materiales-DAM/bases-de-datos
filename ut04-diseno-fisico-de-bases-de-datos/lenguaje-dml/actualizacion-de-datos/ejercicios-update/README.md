---
cover: ../../../../.gitbook/assets/mysqlpost.jpeg
coverY: 0
---

# Ejercicios UPDATE

Para reiniciar la base de datos ejecuta desde la terminal el script de creación:

{% file src="../../../../.gitbook/assets/world-db.zip" %}

En el directorio donde se haya descargado el zip ejecutar lo siguiente

```bash
CONTAINER=diurno-mysql
PASSWORD=Sandia4you
unzip -o world-db.zip
docker exec -i $CONTAINER mysql -u root -p$PASSWORD < world-db/world.sql
```

Realiza estas consultas en la base de datos [world-db](broken-reference) de MySQL

1. **Modifica la tabla country, añadiendo un foreing key que apunte desde Capital a city.Id**
2. **Actualizar el nombre del país a "Nuevo Mundo" donde el código del país sea 'USA'.**
3. **Cambiar la población a 75 millones de todos los países que tienen una población entre 50 y 100 millones .**
4. **Actualizar la capital de los países que contienen la letra "o" en su nombre a 'Herat' (busca el código de esa ciudad).**
5. **Cambiar el continente  a 'Oceania' de los países cuya población es mayor que 200 millones.**
6. **Modificar la esperanza de vida a 70 años de los países que no son de Europe y tienen una esperanza de vida menor que 70.**
7. **Actualizar el año de independencia a 1800 de los países que se independizaron antes de 1800 .**
8. **Cambiar la población de los países cuyo nombre comienza con 'B' a la mitad de su población actual.**
9. **Actualizar la capital a 'Herat' de los países que no están en Europa y tienen una población mayor que 100 millones**&#x20;
10. **Cambiar la esperanza de vida  a 75 años de los países que contienen "land" en su nombre**
11. **Actualizar el año de independencia  1900 de los países que se independizaron después de 1900 .**
12. **Cambiar la población a 50 millones de los países que no están en Asia y tienen una población menor que 50 millones.**
13. **Actualizar el continente a 'Europe' de los países cuyo nombre contiene 'Republic' .**
14. **Establecer la esperanza de vida a 75 en los países que tienen una esperanza de vida mayor de 75 años.**
15. **Actualizar el año de independencia  a 2000 de los países que no se independizaron en un año terminado en '00'.**
16. **Establecer la población a 80 millones de los países que están en Europa y tienen una población mayor que 80 millones.**
17. **Cambiar la esperanza de vida a 70 años de los países que se independizaron antes de 1700.**
18. **Actualizar el año de independencia  a 1950. de los países que se independizaron en un año terminado en '50'**
19. **Establecer la población a 120 millones de los países que no están en África y tienen una población mayor que 120 millones.**
20. **Actualizar el continente a 'Oceania' de los países que contienen "Island" en su nombre.**
