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

# Cardinalidad 1:N

Vamos a ilustrar este caso con otro ejemplo, tenemos una base de datos que almacena información de paquetes y camioneros:

* Cada paquete puede haber sido recogido o no por un camionero.
* Un camionero puede haber recogido varios paquetes.
* Puede haber camioneros que aún no hayan recogido ningún paquete
* Puede haber paquetes que aún no hayan sido recogidos por ningún camionero.

Esta base de de dato está compuesta por las entidades Camionero y Paquete, que se asocián a través de la relación Recoge.

<figure><img src="../../.gitbook/assets/image (45).png" alt=""><figcaption><p>Relación entre camionero y paquete</p></figcaption></figure>

Para establecer la cardinalidad mínima y máxima entre Camionero y Paquete debemos fijar a UNO las tuplas del otro extremo de la relación:&#x20;

* Dado un paquete, ¿cuántos camioneros como mínimo van a recoger un paquete? Si el paquete aún no ha sido recogido será 0
* Dado un paquete, ¿cuántos camioneros como máximo van a recoger un paquete? El paquete puede ser recogido por un camionero, una vez recogido ya no puede ser recogido por otro.
* Por tanto la cardinalidad es (0,1)

Ahora vamos a calcular la cardinalidad la otra dirección de esta misma relación. Para ello fijaremos a UNO Camionero:

* Dado un camionero, ¿cuántos paquetes como mínimo va a recoger? Dado que es posible que acabemos de dar de alta al camionero, es posible que no haya recogido ningún paquete.
* Dado un camionero, ¿cuántos paquetes como máximo va a recoger? Un mismo camionero puede haber recogido una cantidad indeterminada de paquetes, por lo que usaremos la letra N
* Por tanto la cardinalidad es (0,N)

<figure><img src="../../.gitbook/assets/image (46).png" alt=""><figcaption><p>La relación con la cardinalidad anotada</p></figcaption></figure>

Por tanto la relación será de tipo 1:N, lo indicaremos de la siguiente manera

<figure><img src="../../.gitbook/assets/image (47).png" alt=""><figcaption><p>Relación con la cardinalidad anotada</p></figcaption></figure>

### Ejemplo de relaciones 1:N entre tuplas

<figure><img src="../../.gitbook/assets/image (67).png" alt=""><figcaption><p>Tuplas relacionadas 1:N</p></figcaption></figure>
