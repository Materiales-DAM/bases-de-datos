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

# Ejercicios de diagramas ER

1. Diseña el diagrama de entidad-relación de una base de datos de los alumnos un instituto:
   * En una clase de un instituto estudian una serie de alumnos
   * Cada clase tiene un código que la identifica (1SMRM, 1SMRT, 2SMRM, 2SMRT) y un nº de metros cuadrados
   * De cada alumno se quiere guardar su edad, el nombre y el DNI
   * Además, algunos alumnos tienen un carnet especial que les permite salir fuera del centro
   * Se quiere guardar de cada clase en qué planta están y si se da clase de secundaria o pertenece a un ciclo formativo
2. Diseña el diagrama de entidad-relación de una base de datos de los departamentos de un instituto:
   * En un instituto hay varios departamentos&#x20;
   * Cada departamento tiene asignada una habitación, un presupuesto, un código identificativo y una serie de ordenadores&#x20;
   * A cada departamento pertenecen varios profesores&#x20;
   * De cada profesor se quiere guardar su nombre, su dni y a qué departamento pertenece&#x20;
   * De cada ordenador se quiere guardar su nº de identificación, su procesador y su memoria RAM&#x20;
   * Cada profesor cobrará más o menos en función de varios parámetros como los años que lleva siendo profesor y su categoría, por tanto, esta información también se desea guardar
3. Diseña el diagrama de entidad-relación de una base de datos de una empresa:
   * Una empresa vende diferentes productos y desea almacenar la información sobre ellos
     * Vende gusanitos, pipas, patatas fritas, snacks de maiz…
     * Además cada uno tiene un precio distinto
     * Y unas calorías diferentes por cada 100g de producto
     * También tienen nombres distintos
     * Además se quiere guardar si se vende en bolsa grande o pequeña
   * Cada uno de estos productos está compuesto por una serie de ingredientes, de los que se quiere guardar su nombre, precio y código
   * Cada uno de estos ingredientes los compra a un proveedor distinto, del que se guardará su nombre, dirección y teléfono
   * Además, cada proveedor pertenece a una provincia de la que se guardará su nombre, el código y la distancia en KM de la sede de la compañía
