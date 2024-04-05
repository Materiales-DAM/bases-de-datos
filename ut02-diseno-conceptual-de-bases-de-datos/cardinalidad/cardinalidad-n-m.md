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

# Cardinalidad N:M

Vamos a ilustrar este caso con otro ejemplo, tenemos una base de datos que almacena información de pedidos y productos:

* Un pedido debe contener al menos un producto
* Un rproducto puede haber sido pedido en varios pedidos
* Un producto puede no haber sido pedido nunca

Esta base de de dato está compuesta por las entidades Producto y Pedido, que se asocián a través de la relación Forma parte de.

<figure><img src="../../.gitbook/assets/image (62).png" alt=""><figcaption></figcaption></figure>

Ahora vamos a calcular la cardinalidad la otra dirección de esta misma relación. Para ello fijaremos a UNO Pedido:

* Dado un Pedido, ¿cuántos productos como mínimo va a tener? Al menos debe haber un producto
* Dado un Pedido, ¿cuántos productos como máximo va a tener? Puede haber varios productos en un Pedido
* Por tanto la cardinalidad es (1,N)

Para establecer la cardinalidad mínima y máxima entre Producto y Pedido debemos fijar a UNO las tuplas del otro extremo de la relación:&#x20;

* Dado un Producto, ¿en cuántos pedidos como mínimo puede estar? Si el nunca ha sido pedido será 0
* Dado un Producto, ¿en cuántos pedidos como máximo puede estar? Puede haber sido pedido en varios pedidos
* Por tanto la cardinalidad es (0,M). Usamos la M porque ya se ha utilizado la N en la otra dirección.

<figure><img src="../../.gitbook/assets/image (63).png" alt=""><figcaption></figcaption></figure>

Por tanto la relación será de tipo N:M, lo indicaremos de la siguiente manera

<figure><img src="../../.gitbook/assets/image (64).png" alt=""><figcaption></figcaption></figure>

### Ejemplo de relaciones N:M entre tuplas

<figure><img src="../../.gitbook/assets/image (68).png" alt=""><figcaption><p>Tuplas relacionadas N:M</p></figcaption></figure>
