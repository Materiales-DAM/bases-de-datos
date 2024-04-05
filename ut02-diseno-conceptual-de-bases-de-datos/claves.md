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

# Claves

Anteriormente hablábamos de un tipo de atributo especial obligatorio, **las claves o llaves**. Ahora es el momento de abordar con mayor detalle este concepto.

Las claves de una entidad son atributos  que permiten **identificar unívocamente** a cada tupla. En otras palabras, no se permite que ningún par de tuplas tengan exactamente los mismos valores de esos atributos.

En ocasiones, puede haber varios conjuntos de atributos que nos permiten identificar a una misma entidad. En este caso tendremos varias **claves candidatas** de ser la clave principal.

* **Clave primaria (Primary Key)**: También llamada clave principal. De todas las claves candidatas, el diseñador de la base de datos ha de escoger una, que se denominará clave principal o clave primaria. La clave primaria es un atributo o conjunto de ellos, que toman valores únicos y distintos para cada ocurrencia de entidad, identificándola unívocamente. No puede contener valores nulos.
* **Claves alternativas**: son el resto de claves candidatas que no han sido escogidas como clave primaria.

<figure><img src="../.gitbook/assets/image (60).png" alt=""><figcaption><p>La entidad Alumno tiene 3 claves candidatas</p></figcaption></figure>

La representación en el modelo Entidad/Relación de las claves primarias puede realizarse de dos formas:

* Si se utilizan elipses para representar los atributos, se subrayarán aquellos que formen la clave primaria.

<figure><img src="../.gitbook/assets/image (52).png" alt=""><figcaption></figcaption></figure>

* Si se utilizan círculos para representar los atributos, se utilizará un círculo negro en aquellos que formen la clave primaria.

<figure><img src="../.gitbook/assets/image (51).png" alt=""><figcaption></figcaption></figure>

