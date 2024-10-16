---
cover: ../../../.gitbook/assets/entidad-relacion.png
coverY: -17.90631743899708
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

# Ejercicios de diagramas ER con cardinalidades

1. Haz el diagrama ER de una base de datos que sirva para guardar los proyectos de una empresa:
   1. Se debe guardar de cada proyecto: el nombre y la fecha.
   2. Cada proyecto se compondrá de varias tareas.
   3. Cada tarea tendrá un nombe y una duración.
   4. Cada tarea será realizada por un empleado.
   5. De cada empleado guardaremos el nif, nombre y apellidos
2. Haz el diagrama ER de una base de datos que sirva para guardar los datos de libros y sus autores:
   1. De cada libro se desea guardar: ISBN, título, año de publicación
   2. Cada libro puede haber sido escrito por uno o varios autores
   3. De cada autor se desea guardar: nombre, apellidos, nacionalidad.
3. Añade las anotaciones de cardinalidad a los [ejercicios anteriores](../../ejercicios-de-diagramas-er.md).
4. Elige la cardinalidad correcta para cada caso:
   1. Un perro tiene un único dueño, pero una persona puede ser dueña de varios perros
   2. Un perro puede tener varios dueños y una persona puede ser dueña de varios perros
   3. Cada persona puede tener solo un perro, y los perros tienen un dueño
   4. Un perro puede tener varios dueños y una persona puede ser dueña un único perro
5. Crea el ERD que represente esta información:&#x20;
   1. Se quiere guardar información sobre los domicilios de unos clientes
   2. &#x20;De cada cliente se guardará su código de cliente, su nombre, sus apellidos y su domicilio.&#x20;
   3. El domicilio constará de la calle y número de su casa, y la ciudad donde vive&#x20;
   4. Un cliente sólo puede tener un domicilio, pero en el mismo domicilio pueden vivir varios clientes
6. Queremos guardar la siguiente información sobre países y presidentes en la BD:&#x20;
   1. En cada país sólo hay un presidente&#x20;
   2. De cada país se guardará el nombre, el nº de habitantes y su extensión en kilómetros cuadrados&#x20;
   3. De los presidentes se guardará su nombre y el nombre del partido al que está afiliado&#x20;
   4. Además, cada país tendrá una única capital, de la cual se guardará su nombre
