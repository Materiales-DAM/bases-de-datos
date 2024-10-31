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

# Soluciones ER extendida

1. Crea un diagrama con las entidades Escuela y Persona.
   * Escuela: nombre, idEscuela
   * Persona: dni, nombre, Dirección (Población, CP)&#x20;
   * Las personas se subdividen en Director, Docente, Administrativo.&#x20;
   * Docente: materia.
   * Administrativo: grupo.
   * Director: grado
   * Cada escuela tiene un director
   * Cada escuela tiene varios docentes y administrativos\
     ![](<../../../.gitbook/assets/image (1) (1) (1).png>)
2. Crea un diagrama con las entidades Hospital, Planta y Empleado.
   * Hospital: idHospital, nombre , Dirección (Población, CP)
   * Planta:  idPlanta, numero,
   * Empleado: idEmpleado, nombre, NIF
   * Los empleados se subdividen en Auxiliar, Enfermero, Médico.
   * Médico: especialidad.
   * Enfermero: turno
   * Auxiliar: tipo
   * Un hospital puede tener uno o varios empleados, y un empleado puede estar en uno o varios hospitales.
   * Un hospital puede tener una o varias plantas, y una planta solo puede estar en un hospital.
   *   Un planta puede tener uno o varios empleados, y un empleado solo puede trabajar en una planta.\


       <figure><img src="../../../.gitbook/assets/image (2) (1).png" alt=""><figcaption></figcaption></figure>
3.  Una empresa está dividida en varios departamentos de los que se conoce su nombre que los identifica y número de empleados. De los empleados se conoce su número, nombre, dirección y departamento en el que trabaja. Si el empleados es chofer, se conoce su número de libreta y número de accidentes que tuvo. Si es administrativo, los idiomas que habla. Si es técnico, las especialidades en las que puede trabajar. La empresa tiene un conjunto de coches (conducidos por chóferes) de los que se conoce matrícula y marca. A cualquier chofer se le puede asignar cualquier coche. Se registra la fecha en que cada chofer manejó cada coche. Un Chofer conduce un coche por día y no siempre el mismo.\


    <figure><img src="../../../.gitbook/assets/image (157).png" alt=""><figcaption></figcaption></figure>
4.  Las sedes olímpicas se dividen en complejos deportivos. Los complejos deportivos se subdividen en aquellos en los que se desarrolla un único deporte y en los polideportivos. Los complejos polideportivos tienen áreas designadas para cada deporte con un indicador de localización (ejemplo: centro, esquinaNE, etc.).&#x20;

    Un complejo tiene una localización, un jefe de organización individual y un área total ocupada. Los dos tipos de complejos (deporte único y polideportivo) tendrán diferentes tipos de información.&#x20;

    Para cada sede, se conservará el número de complejos junto con su presupuesto aproximado. Cada complejo celebra una serie de eventos (ejemplo: la pista del estadio puede celebrar muchas carreras distintas.).&#x20;

    Para cada evento está prevista una fecha, duración, número de participantes, número de comisarios.&#x20;

    Una lista de todos los comisarios se conservará junto con la lista de los eventos en los que esté involucrado cada comisario ya sea cumpliendo la tarea de juez u observador. \


    \


    <figure><img src="../../../.gitbook/assets/image (158).png" alt=""><figcaption></figcaption></figure>
