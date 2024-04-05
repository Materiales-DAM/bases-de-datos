---
cover: ../../.gitbook/assets/relational.png
coverY: 96
---

# Jerarquías

En el modelo relacional solo existen tablas, atributos y claves, por lo que no es posible representar de manera directa una jerarquía de tablas.

Dependiendo de las características de la jerarquía que se va a transformar, se elegirña una de estas estrategias.

## Jerarquías con subtipos poco especializados

Aplicaremos la siguiente estrategia cuando se cumplan todos los siguientes preceptos:

* Si los subtipos tienen casi todos los campos en común&#x20;
* Todas las relaciones son compartidas por todos los subtipos&#x20;

En este caso, vamos a unificar toda la jerarquía en una única tabla. Dicha tabla contendrá todos los atributos de la jerarquía, los atributos específicos podrán ser NULL.

Dependiendo de si la jerarquía es inclusiva o exclusiva, codificaremos el subtipo de la entidad de diferente manera:

### Jerarquía exclusiva

Añadiremos un atributo "tipo" para saber de que subtipo es cada tupla.

<figure><img src="../../.gitbook/assets/image (97).png" alt=""><figcaption></figcaption></figure>

Como la jerarquía es exclusiva creamos el campo Tipo\_Empleado

<figure><img src="../../.gitbook/assets/image (120).png" alt=""><figcaption></figcaption></figure>

A nivel de dato sería



```sql
# En el modelo conceptual
Empleado (1, 'Bob')
Enfermero(1, 'Tarde')

Empleado (2, 'Peppa')
Medico (2, 'Cirujano')

# En el modelo relacional
Empleado (NIF, Nombre, Tipo_Empleado, Especialidad,   Turno, Tipo)
Empleado(  1,   'Bob',           'E',         null, 'Tarde', null)
Empleado(  2, 'Peppa',           'M',   'Cirujano',    null, null)
```

### Jerarquía inclusiva

Añadiremos un atributo por cada subtipo que compruebe si pertence o no a ese subtipo. Por ejemplo, esDirectivo, esTecnico...

Si en el ejemplo anterior la jerarquía fuera inclusiva, es decir un empleado puede ser a la vez médico, enfermero y auxiliar. Crearíamos un campo BOOL por cada subtipo.

<figure><img src="../../.gitbook/assets/image (119).png" alt=""><figcaption></figcaption></figure>

A nivel de datos quedaría



```sql
# En el modelo conceptual
Empleado (1, 'Bob')
Medico (1, 'Cirujano')
Enfermero(1, 'Tarde')

Empleado (2, 'Peppa')
Medico (2, 'Cirujano')
Auxiliar(2, 'ATS')

# En el modelo relacional
Empleado (NIF, Nombre, Es_Medico, ES_Enfermero, ES_Auxiliar, Especialidad,   Turno,  Tipo)
Empleado(  1,   'Bob',      true,         true,       false,   'Cirujano', 'Tarde',  null)
Empleado(  2, 'Peppa',      true,        false,        true,    'Cirujano',   null,  'ATS')
```

## Jerarquías exclusivas y totales con subtipos muy especializados

Aplicaremos la siguiente estrategia cuando se cumplan todos los siguientes preceptos:

* La jerarquía sea total y exclusiva.
* Los atributos de los subtipos son muy diferentes entre sí y/o las **interrelaciones son diferentes entre los distintos subtipos**.

En este caso, vamos a eliminar la entidad padre e incorporar los atributos y relaciones de la misma  a los subtipos. Para poder implementar las restricciones semánticas, será necesario programar CHECKS y TRIGGERS.

<figure><img src="../../.gitbook/assets/image (128).png" alt=""><figcaption></figcaption></figure>

Se elimina el supertipo y se incorporán los campos a las tablas hijas

<figure><img src="../../.gitbook/assets/image (102).png" alt=""><figcaption></figcaption></figure>

A nivel de dato sería:



```sql
# En el modelo conceptual
Escuela(1, 'Tierno Galván')

Persona (DNI, NOMBRE, DIRECCION)
Persona ('1X', 'Bob', 'Calle Falsa')
Persona ('2X', 'Peppa', 'Calle Falsa')
Persona ('3X', 'Pocoyo', 'Calle Falsa')

Director(DNI,   GRADO)
Director('1X', 'Alto') -> Escuela(1)

Docente(  DNI,       MATERIA)
Docente ('2X', 'Matemáticas') -> Escuela(1)

Administrativo ( DNI, GRADO)
Adiministrativo('3X',  'A1') -> Escuela(1)

# En el modelo relacional
Escuela(ID,          NOMBRE, NIF_DIRECTOR)
Escuela( 1, 'Tierno Galván',         '1X')

Director(DNI, NOMBRE,    DIRECCION,   GRADO)
Director('1X', 'Bob', 'Calle Falsa', 'Alto')  

Docente( DNI,  NOMBRE,     DIRECCION,       MATERIA, ID_ESCUELA)
Docente('2X', 'Peppa', 'Calle Falsa', 'Matemáticas',          1)  

Administrativo( DNI,   NOMBRE,     DIRECCION, GRUPO, ID_ESCUELA)
Administrativo('3X', 'Pocoyo', 'Calle Falsa',  'A1',          1)  
```

## Resto de jerarquías

Para las jerarquías que no cumplen ninguno de los dos casos anteriores aplicaremos estas transformaciones.

Los atributos se mantienen y cada subtipo se identificará con una clave ajena referenciando a la clave primaria de la entidad padre.

<figure><img src="../../.gitbook/assets/image (96).png" alt=""><figcaption></figcaption></figure>

Se crearía una tabla por cada entidad de la jerarquía

<figure><img src="../../.gitbook/assets/image (103).png" alt=""><figcaption></figcaption></figure>

A nivel de datos



```sql
# En el modelo conceptual
Empleado(ID,    NOMBRE, APELLIDOS)
Empleado( 1,     'Bob', 'Esponja')
Empleado( 2,   'Peppa',     'Pig')
Empleado( 3,  'George',     'Pig')

Peon(ID,       PUESTO)
Peon( 1,     'Cajero')  # Bob es Peon
Peon( 3,  'Reponedor')  # George es Peon

Jefe(ID)
Jefe(2) # Peppa es jefa
Jefe(3) # George es jefe

# En el modelo relacional
Empleado(ID,    NOMBRE, APELLIDOS)
Empleado( 1,     'Bob', 'Esponja')
Empleado( 2,   'Peppa',     'Pig')
Empleado( 3,  'George',     'Pig')

Peon(ID,       PUESTO)
Peon( 1,     'Cajero')  # Bob es Peon
Peon( 3,  'Reponedor')  # George es Peon

Jefe(ID)
Jefe(2) # Peppa es jefa
Jefe(3) # George es jefe
```
