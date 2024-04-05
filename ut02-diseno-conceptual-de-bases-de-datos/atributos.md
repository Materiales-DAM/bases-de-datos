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

# Atributos

Los atributos sirven para definir las características de las entidades. Cada entidad contiene varios atributos. Estos atributos pueden ser de distintos tipos (numéricos, texto, fecha...).

<figure><img src="https://lh4.googleusercontent.com/7S74iSdxPoKFx9F5PvY5QxpRGhYfKzWFYIZCuMjzwUu8v3gDB_ovb1gmpvz0m6NBvz1RDdokQDKHR3jGR8pDIlin8LAUjLUar-KCYYFj34InP8C-n8AHAgS3o5K9WjTORBXK7EaOy2yyu-rWR-dxyw=s2048" alt=""><figcaption><p>La entidad Coches y sus atributos</p></figcaption></figure>

Los atributos se representan como círculos que descienden de una entidad, y no es necesario representarlos todos, sino los más significativos, como a continuación.

**Siempre debe existir, al menos, un atributo identificativo (o clave).**

En un modelo relacional (ya implementado en una base de datos) una ejemplo de tabla dentro de una BBDD podría ser el siguiente.

<figure><img src="https://lh3.googleusercontent.com/-5rS_70LoNk6D8Ixgr6JbQ6BkOo_gdBVl5XeSyzGf9zRmY-Kq93xwR6UZ9R9U9n4NnU4QgJPz5luhmsSrgNn5otvfkjz_qr588OQ6-1Ith4ebyW9tiU-qRdQxpgPY8kqh4msKwQO0YPwrBMFY_BZEg=s2048" alt=""><figcaption><p>Tabla Coches</p></figcaption></figure>

## Tipos de atributos

Los atributos se pueden clasificar de varias maneras:

### Por su composición

* **Simples**: Toman valores simples, que no se pueden descomponer en partes.
* **Compuestos**: Son atributos que pueden ser descompuesto en otros atributos pertenecientes a distintos dominios.

<figure><img src="https://lh3.googleusercontent.com/qRo7s4odwN9iLRsAL0z89XLUuPq-0l7JiGr73UwN1FLL6WUyi_xhZMHfgICP-T3hsQLdimRvcAllCUSfanu6Zow_kvNLzXOeLYUvAyNxQY79vheqG6VCjdemXVALsFYWy5ssMSxxpdGpK95UA1X_Dg=s2048" alt=""><figcaption><p>Dirección es un atributo compuesto, teléfono es simple</p></figcaption></figure>

### Identificadores o descriptores

* **Identificadores**: los atributos identificadores identifican de forma única a una tupla. Puede haber uno o varios atributos identificadores. No puede haber dos tuplas con los mismos valores en sus atributos identificadores.
* **Descriptores**: son todos los atributos que no son identificadores. Sus valores se pueden repetir a lo largo de las distintas tuplas.

### Por la cantidad de valores que puede tomar

* **Univalorados**: Cada tupla debe especificar un valor.
* **Multivalorados**: Cada tupla puede definir varios valores.
* **Opcionales / Nulos**: Cada tupla tiene la opción de definir o no definir un valor.
* **Derivados**: Se obtienen a partir de otros campos. Por ejemplo, la edad se puede calcular a partir de la fecha de nacimiento.

<figure><img src="https://lh3.googleusercontent.com/XyRDH0Ee89OanC-l3GBeLTsbWiC6Vtj3yNjC2kvi_J6tnV2yMbII5TL-qNmoqOTPGPpBARHGHum8Eix68wDgPMl8Uw3CrGrV6FTRYVIcix8YvEpvYbEopBeF33JFrytA-zeKJ_mQXuEHuJXorUuGvw=s2048" alt=""><figcaption><p>Símbolos para cada tipo de atributo</p></figcaption></figure>

### Por su dominio

El dominio de un atributo representa al conjunto de valores que ese atributo puede tomar. Existen dos tipos:

* **Predefinidos**: son dominios proporcionados por la base de datos (enteros, cadenas, etc...)
* **Definidos por el usuario**: son definidos en el ámbito del sistema y sirven para acotar un conjunto de valores que el atributo puede tomar.
