---
cover: >-
  https://images.unsplash.com/photo-1569235186275-626cb53b83ce?crop=entropy&cs=srgb&fm=jpg&ixid=M3wxOTcwMjR8MHwxfHNlYXJjaHwyfHxmaWxlc3xlbnwwfHx8fDE2OTQ0MjI0OTF8MA&ixlib=rb-4.0.3&q=85
coverY: 0
---

# Sistemas de gestión de ficheros

Un sistema de gestión de ficheros es el [_software_](https://es.wikipedia.org/wiki/Software) que proporciona a los usuarios y aplicaciones de servicios para el uso, acceso y control de accesos, tanto de archivos como a directorios.

Sus objetivos son:

* Garantizar que la información del archivo sea válida.
* Optimizar el acceso a los archivos.
* Proveer soporte E/S a gran variedad de dispositivos de almacenamiento.
* Entregar los datos que el usuario pide.
* Minimizar o eliminar una potencial pérdida de datos.
* Proveer un conjunto estándar de rutinas E/S.
* Proveer soporte de E/S a múltiples usuarios.
* Clasificación por materias o asuntos.

Los sistemas de archivos son de gran utilidad en la informática pero su uso plantea algunos inconvenientes o limitaciones:

* **Programación compleja**: Ya que los programadores se deben de encargar de lo que tiene que hacer la aplicación y además de estructurar los datos en disco.
* **Redundancia**: Podría ocurrir que una segunda aplicación utilice datos de personales, que resulta que ya estaban almacenados en los ficheros de una primera aplicación, pero como ambas son independientes, los datos se repetirán.
* **No garantizan la integridad referencial**: Datos de distinto tipo pueden estar relacionados, los ficheros no garantizan que las relaciones que establezcamos se mantengan sin fallos.&#x20;
* **Difícil acceso a los datos**. Cada vez que se requiera una consulta no prevista inicialmente, hay que modificar el código de las aplicaciones o incluso crear una nueva aplicación. Esto hace imposible pensar en nuevas consultas e instantáneamente obtener sus resultados; inviable para aplicaciones que requieren grandes capacidades de consultas y análisis de datos.
* **Coste elevado**. Al almacenarse varias veces el mismo dato, se requiere más espacio en los discos. Además, las aplicaciones también ocupan mucho al tener que pensar en todas las posibles consultas sobre los datos que la organización precisa.
* **Dificultad para el acceso simultáneo** a los datos. El acceso simultáneo requiere que varios usuarios al puedan acceder a la misma información. Con este tipo de sistemas es extremadamente difícil conseguir esta capacidad.\
