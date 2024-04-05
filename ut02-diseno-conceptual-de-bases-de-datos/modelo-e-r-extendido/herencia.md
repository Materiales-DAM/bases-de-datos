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

# Herencia

La herencia consiste en relacionar varias entidades de manera jerárquica, habiendo normalmente una entidad de alto nivel (entidad padre o supertipo) y varias de bajo nivel (entidades hijas o subtipo).

La entidad padre es una reprentación general de algo, mientras que las entidades hijas representan algo más específico.

Una relación de herencia se expresa con un triángulo invertido

Por ejemplo, si deseamos almacenar los datos de los trabajadores de una empresa de programación, podríamos tener:

<figure><img src="../../.gitbook/assets/image (81).png" alt=""><figcaption><p>Herencia de empleados</p></figcaption></figure>

Algunas características de la  herencia son:

* Los atributos de la entidad alto nivel son heredados por las de entidades de nivel más bajo. &#x20;
* Un subtipo puede tener atributos propios (específicos) y participar en relaciones por separado.
* Un subtipo hereda todos los atributos del supertipo, y toda relación en la que participa en supertipo.
