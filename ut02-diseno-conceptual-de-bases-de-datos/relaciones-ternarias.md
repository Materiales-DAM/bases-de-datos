---
cover: ../.gitbook/assets/entidad-relacion.png
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

# Relaciones ternarias

En ocasiones, vamos a necesitar establecer relaciones entre tres entidades. En este caso hablaremos de relación ternaria.

Por ejemplo, si quisiéramos guardar los datos de los préstamos de libros de una biblioteca:

* Un libro puede ser prestado a un socio, por un bibliotecario
* Cada libro puede haber sido prestado a varios socios
* Cada libro puede haber sido prestado por varios bibliotecarios

<figure><img src="../.gitbook/assets/image (77).png" alt=""><figcaption><p>Relación ternaria</p></figcaption></figure>

## Cardinalidad

La cardinalidad se calcula de manera similiar a las relaciones binarias, en este caso se fija a UNO las entidades que están al otro lado del segmento para el que la estamos calculando.&#x20;

* Dado un socio y un libro, ¿cuántos bibliotecarios como mínimo le habrán prestado el libro? Tal vez ningún bibliotecario prestó ese libro a ese socio.
* Dado un socio y un libro, ¿cuántos bibliotecarios como máximo le habrán prestado el libro? Varios bibliotecarios podría haber prestado el mismo libro al mismo socio, por lo que N.
* Dado un bibliotecario y un libro, ¿a cuántos socios se lo habrá prestado como mínimo? Tal vez no haya prestado nunca ese libro, por lo que 0
* Dado un bibliotecario y un libro, ¿a cuántos socios se lo habrá prestado como máximo? Tal vez lo haya prestado a varios socios, por lo que N
* Dado  un socio y un bibliotecario ¿cuántos libros como mínimo le habrá prestado? Puede ser que no le haya prestado ningún libro, por lo que 0
* Dado  un socio y un bibliotecario ¿cuántos libros como máximo le habrá prestado? Puede ser que le haya prestado varios libros, por lo que N

<figure><img src="../.gitbook/assets/image (78).png" alt=""><figcaption><p>Relación ternaria con su cardinalidad</p></figcaption></figure>

