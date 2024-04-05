---
cover: >-
  https://images.unsplash.com/photo-1569235186275-626cb53b83ce?crop=entropy&cs=srgb&fm=jpg&ixid=M3wxOTcwMjR8MHwxfHNlYXJjaHwyfHxmaWxlc3xlbnwwfHx8fDE2OTQ0MjI0OTF8MA&ixlib=rb-4.0.3&q=85
coverY: 0
---

# Ficheros de acceso directo

En este tipo de ficheros se puede acceder a un registro indicando la posición relativa del mismo dentro del archivo. Estos archivos deben almacenarse en dispositivos de memoria masiva de acceso directo, como son los discos magnéticos.

> **Campo clave:** campo que permite identificar y localizar un registro de manera ágil y organizada.

Cada uno de los registros se guarda en una **posición física**, que dependerá del espacio disponible en memoria masiva, de ahí que la distribución de los registros sea aleatoria dentro del soporte de almacenamiento. Para acceder a la posición física de un registro se utiliza una **dirección**, no siendo necesario recorrer todo el fichero para encontrar un determinado registro.

A través de una transformación específica aplicada a la clave, se obtendrá la dirección física en la que se encuentra el registro. Según la forma de realizar esta transformación, existen diferentes modos de acceso:

<figure><img src="https://aulavirtual35.educa.madrid.org/aulas/pluginfile.php/23011/mod_resource/content/1/BD01/BD01_Web/BD01_CONT_R06_Transformacion_clave_direccion_miniatura.jpg" alt=""><figcaption></figcaption></figure>

En el acceso directo la clave coincide con la dirección, debiendo ser numérica y comprendida dentro del rango de valores de las direcciones. Es el método más rápido.

Otras características fundamentales de los ficheros de acceso directo o aleatorio son:

* Posicionamiento inmediato.
* Registros de longitud fija.
* Apertura del fichero en modo mixto, para lectura y escritura.
* Permiten múltiples usuarios utilizándolos.
* Los registros se borran colocando un cero en la posición que ocupan.
* Permiten la utilización de algoritmos de compactación de huecos.
* Los archivos se crean con un tamaño definido, es decir, con un máximo de registros establecido durante la creación.
* Esta organización sólo es posible en soportes direccionables.
* Se usan cuando el acceso a los datos de un registro se hace siempre empleando la misma clave y la velocidad de acceso a un registro es lo que más nos importa.
* Permiten la actualización de los registros en el mismo fichero, sin necesidad de copiar el fichero.
* Permiten realizar procesos de actualización en tiempo real.

\
