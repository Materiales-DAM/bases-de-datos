---
cover: ../../.gitbook/assets/relational.png
coverY: 96
---

# Transformaciones

Para pasar del modelo conceptual (modelo entidad relación) al lógico (modelo relacional) debemos aplicar una serie de transformaciones sobre el esquema conceptual que nos van a llevar a un nuevo esquema en el que solo va a haber tablas (con sus claves y columnas).

La transformación se realiza empleando las siguientes reglas:

* Toda entidad se transforma en una tabla.
* Todo atributo se transforma en columna dentro de la tabla.
* El identificador único de la entidad se convierte en clave primaria.
* Como las relaciones del modelo E/R no tienen equivalente en el modelo relacional, dichas relaciones se transformarán siguiendo las reglas que se especifican a continuación.
