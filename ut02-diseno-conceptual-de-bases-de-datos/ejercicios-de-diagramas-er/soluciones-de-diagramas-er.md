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

# Soluciones de diagramas ER

1.  Diseña el diagrama de entidad-relación de una base de datos de los alumnos un instituto:



    <figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>
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
