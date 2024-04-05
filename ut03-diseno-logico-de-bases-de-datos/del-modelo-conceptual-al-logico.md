---
cover: ../.gitbook/assets/relational.png
coverY: 96
---

# Del modelo conceptual al lógico

En esta unidad vamos a estudiar como pasar del modelo conceptual al lógico. Este es el paso previo a poder crear una base de datos real en un SGBD.

<figure><img src="https://lh6.googleusercontent.com/sa4gldGhDO5WrhnxT9ZZcZsOIjxjp4pM61_QB36y3VEY_vpdRF4M3poBR-FfoOXgHUL6T_lz00ClQfuYS46TL95UWwRnvVStwi5sN4fMJYT3s5Vw2UVSrbjqqeq3M5Pc2c_44yjKruKeGY3Lev7qog=s2048" alt=""><figcaption></figcaption></figure>

Algunos conceptos que vale la pena repasar:

* **Atributo**: Características que describen a una entidad o relación.
* **Dominio**: Conjunto de valores permitidos para un atributo. Por ejemplo, cadenas de caracteres. números enteros, los valores Sí o No, etc.
* **Restricciones de semántica**: Condiciones que deben cumplir los datos para su correcto almacenamiento.&#x20;
* **Clave candidata**: Es una clave que identifican de forma única una ocurrencia de entidad. Las claves pueden ser simples (atómicas) o compuestas.&#x20;
* **Clave primaria**: De entre las claves candidatas, es aquella que se selecciona para identificar a cada tupla.
* **Clave alternativa**: Son claves que no fueron elegidas como clave primaria pero que pueden identiciar de forma única a cada tupla
* **Clave foránea**: Un atributo o conjunto de atributos que se corresponden con una clave candidata de otra tabla. Sirven para enlazar datos entre diferentes tablas.
* **Grado**: indica el tamaño de una tabal en base a su número de atributos.
* **Cardinalidad**: indica el tamaño de una tabal en base al número de tuplas.

<figure><img src="https://lh6.googleusercontent.com/QMaHVKo3VdIS-mmw17TvY9l_e1RriF6vZG-JyhJ5-134-pLh6UXLPDnzjFahR3V15UtlVvKfo6pFqvFE48ReO_ufGBGv_mOquJpJYG6X4R1TW1jVQhZ3s0aqK_gnWtE1-hiuB7zbm-xoJI5fDsjprw=s2048" alt=""><figcaption></figcaption></figure>
