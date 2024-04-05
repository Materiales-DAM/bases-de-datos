---
cover: ../../.gitbook/assets/relational.png
coverY: 96
---

# Relaciones 1:1

Las relaciones 1:1 se transforman en función de las cardinalidades:



## Cardinalidad (1,1) en ambas entidades

<figure><img src="../../.gitbook/assets/image (105).png" alt=""><figcaption></figcaption></figure>

Cuando ambas entidades participan con cardinalidades (1,1) se pueden adoptar varias soluciones:&#x20;

1.  No se necesitan 2 tablas, se puede crear una única tabla en la que se incluyan los atributos de las dos entidades, cuya clave principal será cualquiera de los atributos identificadores principales.\


    <figure><img src="../../.gitbook/assets/image (106).png" alt=""><figcaption></figcaption></figure>
2.  Propagar la clave de cualquiera de ellas a la otra tabla, teniendo en cuenta a cuál de ellas se le efectúan los accesos más frecuentes. La clave propagada será FK y UNIQUE. Esta es la opción que más utilizaremos.\
    \


    <figure><img src="../../.gitbook/assets/image (107).png" alt=""><figcaption></figcaption></figure>
3.  Propagar ambas claves de una entidad a la otra. Estas claves serán FK y UNIQUE. La solución introduce redundancias que se controlarán mediante restricciones.\


    <figure><img src="../../.gitbook/assets/image (117).png" alt=""><figcaption></figcaption></figure>



## Cardinalidad (0,1) en ambas entidades

Cuando ambas tablas tienen cardinalidades (0,1), se crea una nueva tabla a partir de la relación con lo siguiente:

* La clave primaria será la de clave de una de las dos entidades (se elige una)
* La clave de la otra entidad se incorpora a la tabla intermedia y se marca como UNIQUE
* Se crean dos FK, una para la clave de cada entidad.

Por ejemplo, tenemos una base de datos de perros y personas. Los perros pueden tener un dueño o ninguno. Cada persona podrá ser dueña de un perro o de ninguno.

<figure><img src="../../.gitbook/assets/image (109).png" alt=""><figcaption></figcaption></figure>

Se convierte en

<figure><img src="../../.gitbook/assets/image (110).png" alt=""><figcaption></figcaption></figure>

## Cardinalidad (0,1) y (1,1)

En caso de que en un extremo la cardinalidad sea (1, 1) y en el otro (0,1), se propaga la clave de la entidad con cardinalidad (1,1) a la entidad que tenga (0,1).

Por ejemplo, tenemos una base de datos de perros y personas. Todos los perros tienen un dueño. Cada persona podrá ser dueña de un perro o de ninguno.

<figure><img src="../../.gitbook/assets/image (104).png" alt=""><figcaption></figcaption></figure>

Se convierte en

<figure><img src="../../.gitbook/assets/image (118).png" alt=""><figcaption></figcaption></figure>
