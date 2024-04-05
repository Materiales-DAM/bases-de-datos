---
cover: ../../.gitbook/assets/relational.png
coverY: 96
---

# Normalización

La normalización de bases de datos es un proceso importante en el diseño de bases de datos relacionales que consiste en designar y aplicar una serie de reglas a las tablas obtenidas tras el paso del modelo entidad-relación al modelo relacional con objeto de minimizar la redundancia de datos, facilitando su gestión posterior.

Las bases de datos relacionales se normalizan para:

* **Minimizar la redundancia** de los datos.
* **Disminuir problemas de actualización** de los datos en las tablas.
* Proteger la **integridad de datos**.

En el modelo relacional es frecuente llamar «tabla» a una relación; para que una tabla sea considerada como una relación tiene que cumplir con algunas restricciones:

* Cada tabla debe tener su nombre único.
* No puede haber dos filas iguales. No se permiten los duplicados.
* Todos los datos en una columna deben ser del mismo tipo.

Para comprobar que el diseño de las tablas de una bases de datos es correcto, existen  un conjunto de restricciones que conforman las **formas normales**.

## Formas normales

Las formas normales son una serie de comprobaciones que se pueden hacer sobre cada tabla de una base de datos. Cada forma normal va añadiendo restricciones a la anterior forma normal de manera que diremos que una tabla está en una determinada forma normal cunando cumple todas las restricciones de esa forma normal y de todas las anteriores

### Primera forma normal (1FN)

Una tabla está en primera forma normal si:

* **Todos los atributos son atómicos**. Un atributo es atómico si los elementos del dominio son simples e indivisibles.&#x20;
  * No puede haber atributos multivaluados
  * No puede haber atributos compuestos
* No debe existir variación en el número de columnas.
* Los campos no clave deben identificarse por la clave (dependencia funcional).&#x20;
* Debe existir una independencia del orden tanto de las filas como de las columnas; es decir, si los datos cambian de orden no deben cambiar sus significados.

#### Dependencia funcional

Un atributo es funcionalmente dependiente de la clave si y sólo si por cada valor de la clave se existe un único valor del atributo dependiente.

Por ejemplo, si tenemos una tabla Estudiante

<figure><img src="../../.gitbook/assets/image (124).png" alt=""><figcaption></figcaption></figure>

Nombre es funcionalmente dependiente de DNI, porque dado un DNI sólo hay un valor de Nombre.

Veamos un ejemplo de tabla que no cumple la 1FN:

<figure><img src="../../.gitbook/assets/image (10).png" alt="" width="222"><figcaption></figcaption></figure>

En este caso la tabla Profesor contiene un campo Telefonos que va a contener varios valores en una misma fila. Para poner una tabla en 1FN basta con hacer lo que haríamos con un atributo multivaluado: extraer una tabla.

<figure><img src="../../.gitbook/assets/image (12).png" alt="" width="375"><figcaption></figcaption></figure>

### Segunda forma normal (2FN)

Una relación está en 2FN si y sólo si:

* Se encuentra en 1FN
* Todo atributo no primo (que no pertenece a la clave primaria) depende completamente de la clave primaria (es lo mismo que decir que dependen funcionalmente de forma completa de la clave primaria)

La segunda forma normal se aplica a las tablas con claves primarias compuestas, si la clave es simple y cumple la primera forma normal, automáticamente cumple la segunda.

Por ejemplo si tuviéramos esta tabla:

<figure><img src="../../.gitbook/assets/image (15).png" alt="" width="232"><figcaption></figcaption></figure>

```sql
Docencia('00000X', 1, 2023, 'Bob Esponja', 'Matemáticas')
Docencia('00000X', 2, 2023, 'Pocoyo',           'Física')

Docencia('00001X', 1, 2023, 'Peppa Pig', 'Física')
```

Esta tabla no está en 2FN por dos razones:

* Nombre\_Profesor no depende completamente de la clave, depende exclusivamente de NIF\_Profesor
* Nombre\_Asignatura no depende completamente de la clave, depende exclusivamente de ID\_Asignatura

Para pasarla a 2FN habría que extraer una tabla por cada dependencia funcional detectada entre una parte de la clave y algún atributo. Los atributos dependientes se extraen a la tabla correspondiente.

<figure><img src="../../.gitbook/assets/image (16).png" alt="" width="563"><figcaption></figcaption></figure>

<pre class="language-sql"><code class="lang-sql">Asignatura(1, 'Matemáticas')
Asignatura(2, 'Física')
<strong>
</strong>Profesor('00000X', 'Bob Esponja')
Profesor('00001X', 'Peppa Pig')

Imparte_Curso('00000X', 1, 2023)
Imparte_Curso('00000X', 2, 2023)
Imparte_Curso('00001X', 1, 2023)
</code></pre>

### Tercera forman normal (3FN)

Una relación está en 3FN si y sólo si se cumplen las condiciones:

1. Se encuentra en 2FN
2. No existen atributos no primos que sean transitivamente dependientes de cada posible clave de la tabla (es lo mismo que decir que no deben existir atributos no primos que dependan funcionalmente de forma transitiva)

Esto quiere decir que un atributo no primo sólo se debe conocer a través de la clave principal de la tabla y no por medio de otro atributo no primo. Si el atributo B depende funcionalmente de A y el atributo C depende funcionalmente de B, pero A no depende funcionalmente de B, entonces C dependerá  funcionalmente de forma transitiva de A.

Por ejemplo, tenemos una tabla Empleado que:

* Almacena el DNI de cada empleado
* Almacena el nombre, apellidos, cargo y dirección.
* Sabemos que todos los empleados con el mismo cargo tienen el mismo sueldo

<figure><img src="../../.gitbook/assets/image (13).png" alt="" width="245"><figcaption></figcaption></figure>

```sql
Empleado('00000X', 'Bob',   'Esponja', 'Jefe', 40000)
Empleado('00001X', 'Peppa', 'Pig',     'Jefe', 45000)
Empleado('00003X', 'Geroge', 'Pig',    'Peón', 15000)
Empleado('00004X', 'Pocoyo', 'P',      'Peón', 25000)
```

Empleado no está en tercera forma normal porque hay una dependencia transitiva entre Cargo y Sueldo. Lo que haríamos para solucionar esto es extraer a otra tabla el cargo.

<figure><img src="../../.gitbook/assets/image (14).png" alt="" width="375"><figcaption></figcaption></figure>

```sql
Cargo(Cargo , Sueldo)
Cargo('Jefe', 45000)
Cargo('Peón', 15000)

Empleado(     DNI, Nombre,  Apellidos,  Cargo)
Empleado('00000X',   'Bob', 'Esponja', 'Jefe')
Empleado('00001X', 'Peppa',     'Pig', 'Jefe')
Empleado('00003X', 'Geroge',    'Pig', 'Peón')
Empleado('00004X', 'Pocoyo',      'P', 'Peón')
```

## Algoritmo para la normalización de una tabla

Para normalizar una tabla debemos seguir los siguientes pasos:

* Comprobar en que forma normal se encuentra
* Aplicar las transformaciones necesarias para llegar a la 3FN:
  * Tabla desnormalizada:&#x20;
    * Transformación a 1FN
    * Transformación a 2FN
    * Transformación a 3FN
  * Tabla en 1FN:
    * Transformación a 2FN
    * Transformación a 3FN
  * Tabla en 2FN:
    * Transformación a 3FN
  * Tabla en 3FN: no hay que hacer nada

