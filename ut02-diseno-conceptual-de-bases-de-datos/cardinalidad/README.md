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

# Cardinalidad

La cardinalidad de una relación es el número de filas relacionadas de cada uno de los objetos en la relación. En cada extremo de la relación se va a anotar el mínimo y máximo número de tuplas que puede haber.

Se anota en términos de:

* **Cardinalidad mínima**. Indica el número mínimo de asociaciones en las que aparecerá cada ejemplar de la entidad (el valor que se anota es de cero o uno, aunque tenga una cardinalidad mínima de más de uno, se indica sólo un uno)
* **Cardinalidad máxima**. Indica el número máximo de asociaciones en las que puede aparecer cada ejemplar de la entidad. Puede ser uno, otro valor concreto mayor que uno (tres por ejemplo) o muchos (se representa con n).&#x20;

Una vez establecidas las cardinalidades máxima y mínima en ambas direcciones de la relación podemos obtener la cardinalidad de la relación en sí de la siguiente manera:

* [**Uno a uno (1:1)**](cardinalidad-1-1.md): La cardinalidad máxima en ambas direcciones es 1.
* [**Uno a varios (1:N)**](cardinalidad-1-n.md): La cardinalidad máxima en una dirección es 1 y en la otra varios.
* **Varios a uno (N:1)**: La cardinalidad máxima en una dirección es varios y en la otra uno. Es básicamente lo mismo que la 1:N pero en sentido contrario.
* [**Varios a varios (N:M)**](cardinalidad-n-m.md): La cardinalidad máxima en ambas direcciones es varios

<figure><img src="../../.gitbook/assets/image (47).png" alt=""><figcaption><p>Ejemplo de relación con la cardinalidad anotada</p></figcaption></figure>
