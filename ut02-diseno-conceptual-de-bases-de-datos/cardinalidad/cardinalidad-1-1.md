---
cover: ../../.gitbook/assets/entidad-relacion.png
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

# Cardinalidad 1:1

Vamos a ilustrar este caso con un ejemplo, tenemos una base de datos que almacena información de alumnos y sus expedientes:

* Cada alumno tiene un expediente.
* Todo expediente es de un alumno

Esta base de de dato está compuesta por las entidades Alumno y Expediente, que se asocián a través de la relación Tiene.

<figure><img src="../../.gitbook/assets/image (54).png" alt=""><figcaption></figcaption></figure>

Para establecer la cardinalidad mínima y máxima entre Alumno y Expediente debemos fijar a UNO las tuplas del otro extremo de la relación:&#x20;

* Dado un Alumno, ¿cuántos expedientes como mínimo va tener? Siempre 1
* Dado un Alumno, ¿cuántos expedientes como máximo va tener? Siempre 1
* Por tanto la cardinalidad es (1,1)

Ahora vamos a calcular la cardinalidad la otra dirección de esta misma relación. Para ello fijaremos a UNO Expediente:

* Dado un Expediente, ¿a cuántos alumnos como mínimo pertenece?  Siempre 1
* Dado un Expediente, ¿a cuántos alumnos como máximo pertenece?  Siempre 1
* Por tanto la cardinalidad es (1, 1)

<figure><img src="../../.gitbook/assets/image (56).png" alt=""><figcaption></figcaption></figure>

Por tanto la relación será de tipo 1:1, lo indicaremos de la siguiente manera

<figure><img src="../../.gitbook/assets/image (57).png" alt=""><figcaption></figcaption></figure>

### Ejemplo de relaciones 1:1 entre tuplas

<figure><img src="../../.gitbook/assets/image (66).png" alt=""><figcaption><p>Tuplas relacionadas en relación 1:1</p></figcaption></figure>
