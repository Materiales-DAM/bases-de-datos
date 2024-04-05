---
cover: ../../.gitbook/assets/relational.png
coverY: 96
---

# Relaciones reflexivas

En las relaciones reflexivas hay que adaptar las reglas anteriormente descritas al hecho de que en ambos extremos de la relación está la misma entidad.

En este tipo de relaciones lo que solemos tener son diferentes tuplas que se relacionan entre sí, no una tupla que se relacione consigo misma.

<figure><img src="../../.gitbook/assets/image (43).png" alt=""><figcaption><p>Ejemplo de relación reflexiva</p></figcaption></figure>

## Reflexiva 1:1

En la tabla resultante aparecerá dos veces el atributo que esa clave principal: una como clave primaria y una como clave foránea. Los dos atributos deben tener distinto nombre, en el caso del que es clave foránea se utilizará un nombre que describa el rol de la tupla al otro extremo de la relación.\


<figure><img src="../../.gitbook/assets/image (89).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (88).png" alt=""><figcaption></figcaption></figure>

## Reflexiva 1:N

Al igual que en el caso 1:1,  en la tabla resultante aparecerá dos veces el atributo que esa clave principal: una como clave primaria y una como clave foránea. Los dos atributos deben tener distinto nombre, en el caso del que es clave foránea se utilizará un nombre que describa el rol de la tupla al otro extremo de la relación. La clave foránea será NULLABLE o no en función de la cardinalidad del lado del 1



<figure><img src="../../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

### Cardinalidad (0, 1)

La FK puede ser NULL

<figure><img src="../../.gitbook/assets/image (20).png" alt=""><figcaption></figcaption></figure>

### Carinalidad (1, 1)

La FK no puede ser NULL

<figure><img src="../../.gitbook/assets/image (21).png" alt=""><figcaption></figcaption></figure>

## Reflexiva M:N

La relación se convierte en tabla y su clave primaria estará compuesta por la clave primaria de ambos roles. Estas a la vez serán clave primaria y foráneas.

<figure><img src="../../.gitbook/assets/image (22).png" alt=""><figcaption></figcaption></figure>

Se transforma en

<figure><img src="../../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>
