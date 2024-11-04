---
cover: ../../.gitbook/assets/relational.png
coverY: 96
---

# Relaciones 1:N

En las relaciones 1:N la entidad del lado N de la relación añade el conjunto de campos necesarios para incorporar a sus atributos la totalidad de la clave primaria de la entidad del lado 1, creando una clave ajena, de modo que se puedan relacionar ambas tablas mediante operadores relacionales. El nombre de la relación desaparece.

Como norma general se propaga la clave de la entidad que tiene cardinalidad máxima 1 a la que tiene cardinalidad máxima N.

<figure><img src="../../.gitbook/assets/image (95).png" alt=""><figcaption></figcaption></figure>

Se convierte en

<figure><img src="../../.gitbook/assets/image (112).png" alt=""><figcaption></figcaption></figure>

## Transformación 1:N con cardinalidad (0,1)

En caso de que la cardinalidad del lado 1 sea (0,1), la foreign key debe poder ser NULL

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

Se transformaría a&#x20;

<figure><img src="../../.gitbook/assets/image (168).png" alt=""><figcaption></figcaption></figure>

## Transformación 1:N con entidad débil

Para transformar una relación de **1:N** que incluye una **entidad débil** en un modelo relacional, es importante comprender que una entidad débil depende de su entidad fuerte para existir y se identifica parcialmente mediante un atributo o conjunto de atributos que, junto con la clave primaria de la entidad fuerte, forma su clave primaria.

Veamos un ejemplo

<figure><img src="../../.gitbook/assets/image (3) (1).png" alt=""><figcaption></figcaption></figure>

Si aplicamos la transformación quedaría

<figure><img src="../../.gitbook/assets/image (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

La clave primaria de Tarea incluiría su clave parcial NombreTarea (viene de la entidad Tarea.Nombre) y  la clave principal de su entidad fuerte NombreProyecto (viene de la entidad Proyecto.Nombre)
