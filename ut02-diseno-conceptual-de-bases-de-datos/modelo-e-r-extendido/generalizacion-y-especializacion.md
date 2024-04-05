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

# Generalización y especialización

Estas dos formas de abstracción representan técnicas inversas para conseguir una jerarquía de entidades que nos permite representar de una manera más adecuada el modelo que queremos representar.

<figure><img src="https://lh3.googleusercontent.com/uGUVX5yxjtRpxKe9o74d7fEz3Oq-wuIQ6ftNodwJxf4heBpSb-JsFyuuVdVE5bW91dATiKwuCVNzofGcuvR3R3jiOVxrs1O8YIVhYpakO7oGlWOejr2UQQYa61KDYKY0lWsIM-wi2AL62aS9tdqWgg=s2048" alt=""><figcaption></figcaption></figure>

<figure><img src="https://lh5.googleusercontent.com/4_8WkhuxXbliGDY5VKuctrh6VL0u_rDdupQKdwqVKgIp7aSoa1909hlr7d8jgBMHO9VfoONGVXhfmdCuKU7k6_ppxOKuN4e6vB06knqy3f3p_ga7YYS1Q1j98_kpkE2JuQeH41YG84Vq53KAbaqAwQ=s2048" alt=""><figcaption></figcaption></figure>

## Generalización

La generalización es el proceso por el cual se unifican dos o más entidades, de bajo nivel, para producir una entidad de más alto nivel.&#x20;

Por ejemplo, si tenemos una base de datos que permite almacenar datos de los miembros de equipos de programadores y managers como se ve.

<figure><img src="../../.gitbook/assets/image (80).png" alt=""><figcaption></figcaption></figure>

Si aplicáramos la técnica de generalización a este ejemplo podríamos extraer una entidad más general llamada Empleado de la que hereden Programador y Manager de la siguiente manera

<figure><img src="../../.gitbook/assets/image (81).png" alt=""><figcaption></figcaption></figure>

Algunas características de las entidades resultantes son:

* Las entidades de nivel más bajo se denominan subclases y la de nivel alto superclase.
* Las subclases heredan los atributos de la superclase
* Las subclases pueden definir sus propios atributos
* Por cada tupla en las subclases habrá una tupla relacionada en la superclase, que representan al mismo objeto.
* Permite eliminar la redundacia de atributos en varias entidades
* Para la representación de este tipo de interrelación, utilizamos un triángulo invertido, con la base paralela al rectángulo que representa el supertipo y conectado a éste y a los subtipos
* Las cardinalidades son siempre (1,1) en la superclase y (0,1) en las subclases

## Especialización

La especialización es el proceso por el cual se divide una entidad de alto nivel, en varios subconjuntos o entidades de bajo nivel. La especialización parte de una situación opuesta a la de la generalización, en este caso se parte de un exceso de generalización.

Por ejemplo, partamos de otra versión del ejemplo de la empesa de programadores en la que ha habido un exceso de generalización.

<figure><img src="../../.gitbook/assets/image (82).png" alt=""><figcaption></figcaption></figure>

En este diseño se meten todos los trabajadores en la entidad Trabajador, unos serán managers y otros programadores y dependiendo de esto establecerán relaciones de un tipo u otro. Este diseño resulta poco adecuado ya que es posible crear relaciones indeaseadas. Por ejemplo, se podría establecer que un programador dirige un equipo, cuando eso no debería ser legal.

Aplicando un proceso de especialización podríamos extraer las entidades Programador y Manager y llegar al diseño anterior (más adecuados)



<figure><img src="../../.gitbook/assets/image (81).png" alt=""><figcaption></figcaption></figure>
