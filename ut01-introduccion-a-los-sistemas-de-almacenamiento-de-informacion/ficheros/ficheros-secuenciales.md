---
cover: >-
  https://images.unsplash.com/photo-1569235186275-626cb53b83ce?crop=entropy&cs=srgb&fm=jpg&ixid=M3wxOTcwMjR8MHwxfHNlYXJjaHwyfHxmaWxlc3xlbnwwfHx8fDE2OTQ0MjI0OTF8MA&ixlib=rb-4.0.3&q=85
coverY: 0
---

# Ficheros secuenciales

Un fichero con organización secuencial se caracteriza porque sus registros están almacenados de forma contigua, de manera, que la única forma de acceder a él, es leyendo un registro tras otro desde el principio hasta el final. En los ficheros secuenciales suele haber una marca indicativa del fin del fichero, que suele denominarse **EOF** (End of File). Para detectar el final del fichero sólo es necesario encontrar la marca EOF.

Este tipo de ficheros pueden utilizar dispositivos o soportes no direccionables o de acceso secuencial, como son las cintas magnéticas de almacenamiento de datos. También se utiliza en los CD de audio y los DVD de vídeo, en los que la música o las imágenes se almacenan a lo largo de una espiral continua.

Los registros almacenados se identifican por medio de una información ubicada en uno de sus campos, a este campo se le denomina **clave o llave**. Si se ordena un archivo secuencial por su clave, es más rápido realizar cualquier operación de lectura o escritura.

Otras características relevantes de los ficheros secuenciales son:

* La lectura siempre se realiza hacia delante.
* Son ficheros monousuario, no permiten el acceso simultáneo de varios usuarios.
* Tienen una estructura rígida de campos. Todos los registros deben aparecer en orden, es decir, la posición de los campos de cada registro siempre ha de ser la misma.
* El modo de apertura del fichero, condiciona la lectura o escritura.
* Aprovechan al máximo el soporte de almacenamiento, al no dejar huecos vacíos.
* Se pueden grabar en cualquier tipo de soporte, tanto en secuenciales como direccionables.
* Todos los lenguajes de programación disponen de instrucciones para trabajar con este tipo de ficheros.
* No se pueden insertar registros entre los que ya están grabados.

En el siguiente gráfico se observa la estructura de un fichero secuencial.

<figure><img src="https://aulavirtual35.educa.madrid.org/aulas/pluginfile.php/23011/mod_resource/content/1/BD01/BD01_Web/BD01_CONT_R05_Fichero_secuencial_miniatura.jpg" alt=""><figcaption><p>Estructura de registros de un fichero secuencial</p></figcaption></figure>
