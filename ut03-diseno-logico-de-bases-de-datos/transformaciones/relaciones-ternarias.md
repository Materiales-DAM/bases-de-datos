---
cover: ../../.gitbook/assets/relational.png
coverY: 96
---

# Relaciones ternarias

Dependiendo del tipo de relación ternaria aplicaremos distintas reglas

## Caso N:M:Q

Se genera una tabla intermedia a partir de la relación ternaria. La clave primaria de dicha tabla estará compuesta por la unión de las claves de las tres tablas que relaciona.

<figure><img src="../../.gitbook/assets/image (24).png" alt=""><figcaption></figcaption></figure>

La tabla intermedia sería Consulta que combinaría todas las claves de las otras tres tablas.

<figure><img src="../../.gitbook/assets/image (26).png" alt=""><figcaption></figcaption></figure>

## Caso 1:N:M

Se genera una tabla intermedia a partir de la relación ternaria. La clave primaria de dicha tabla estará compuesta por la unión de las claves de las dos tablas con cardinalidad máxima N, mientras que la clave de la otra tabla será solo FK.

Por ejemplo, si tenemos la siguiente relación ternaria:

<figure><img src="../../.gitbook/assets/image (30).png" alt=""><figcaption></figcaption></figure>

Se transforma a:

<figure><img src="../../.gitbook/assets/image (31).png" alt=""><figcaption></figcaption></figure>

## Caso 1:1:N

En este caso no es necesario crear una tabla para la relación. La tabla derivada de la entidad que participa con N en la relación recibe las claves de las otras dos entidades y las incorpora como parte de su clave primaria.

<figure><img src="../../.gitbook/assets/image (33).png" alt=""><figcaption></figcaption></figure>

Se transforma en:

<figure><img src="../../.gitbook/assets/image (93).png" alt=""><figcaption></figcaption></figure>
