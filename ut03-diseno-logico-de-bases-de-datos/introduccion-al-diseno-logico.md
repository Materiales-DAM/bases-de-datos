---
cover: ../.gitbook/assets/relational.png
coverY: 96
---

# Introducción al diseño lógico

Una vez obtenido el esquema conceptual en la fase anterior llega el momento de convertir ese modelo al esquema lógico

<figure><img src="https://lh6.googleusercontent.com/Tzu6QjyEysnjMtj89ecyTfI3C8NGi4TFRtVziQMSHY1zaj7OtMGuoi2B72QlweQxfEqtYNIi1KcAWujIZNIj0s9w_SrLfUsubQEQ5D9V9Fh6LgeiHG_TNgWbo5HmoKL1ka2wT5soOfSUcCIe6F-kBg=s2048" alt=""><figcaption><p>Fases del diseño de bases de datos</p></figcaption></figure>

El modelo que se usa para el diseño lógico es el modelo relacional.

El modelo relacional para el modelado y la gestión de bases de datos es un modelo de datos basado en la lógica de predicados y en la teoría de conjuntos.

Su idea fundamental es el uso de **relaciones**. Estas relaciones podrían considerarse en forma lógica como conjuntos de datos llamados **tuplas**. Pese a que esta es la teoría de las bases de datos relacionales creadas por Codd, la mayoría de las veces se conceptualiza de una manera más fácil de imaginar, pensando en cada relación como si fuese una **tabla** que está compuesta por **registros** (cada fila de la tabla sería un registro o "tupla") y **columnas** (también llamadas "campos").

Es el modelo más utilizado en la actualidad para modelar problemas reales y administrar datos dinámicamente.

El modelo relacional es independiente de la forma en que se almacenan los datos y de la forma de representarlos, por tanto, la base de datos se puede implementar en cualquier SGBD y los datos se pueden gestionar utilizando cualquier aplicación gráfica. Por ejemplo. se pueden manejar las tablas de una base de datos MySQL u Oracle con Microsoft Access.

<figure><img src="https://lh6.googleusercontent.com/cE2O4SgPvtljz2PDW9VEPTxLa9L98YIVY2sQpBCNfT3u3U9cvIMMD2-pnknpA-MLUtv1ZTrB2uEIxRT-7aTaM6BzoKqGW02AVDwzFqM8HByrgs3NNPw8ov_1YD7BWIq8V-msAMMJIzG97IRXN3KKFA=s2048" alt=""><figcaption><p>Esquema relacional</p></figcaption></figure>

El modelo relacional fue creado por Codd, y está basado en la teoría de las relaciones, álgebra y cálculo relacional, para cumplir con los siguientes objetivos:

* **Independencia física**: que el modo en que se almacenan los datos no influya en su manipulación lógica. De esta forma si hay cambios en el almacenamiento físico no afectaría a los programas que acceden a la información
* **Independencia lógica**: que al tener que añadir, modificar o eliminar objetos de la base de datos no afecte a las interacciones del usuario con el programa

## Relaciones o tablas

Las relaciones o tablas son el elemento fundamental del modelo relacional:

* Cada tabla define un conjunto de atributos, no puede haber dos atributos con el mismo nombre en una tabla.
* Cada tabla define su clave primaria, que identifica cada tupla de forma única
* En cada tabla se almacenan varias tuplas (o registros). No puede haber tuplas duplicadas.
* Cada tabla puede definir relaciones con otras tablas a través de las claves foráneas.
* Dentro de una tabla, no existe un orden intrínseco a nivel de atributos ni de tuplas.

<figure><img src="https://lh6.googleusercontent.com/hwlU99kfgsfKonQ84CCgq_qqHbsoIHuLZOKqPy_TVTFAzKLMN1KRSxNBECmJ3sjkL8GDD7YtK-oRhkrqYLC2Vm8GnPebO9vVSmqJqbXKs89SxRLxttvE6LnvsyjXGAT9kRJpFS1Ody7mZIxQSaHK_Q=s2048" alt=""><figcaption></figcaption></figure>
