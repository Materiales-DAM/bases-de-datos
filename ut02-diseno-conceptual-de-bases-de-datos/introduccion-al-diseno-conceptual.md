---
cover: ../.gitbook/assets/diseño-bbdd.png
coverY: 0
---

# Introducción al diseño conceptual

El diseño de base de datos es un proceso fundamental a la hora de **modelar nuestros conjuntos de datos y definir las operaciones que queremos realizar sobre ellos**. Los datos son el activo más importante de nuestra organización y una base de datos bien diseñada influye de forma directa en la eficiencia que obtendremos a la hora de almacenar, recuperar y analizar nuestros datos.

### Ventajas un buen diseño de base de datos

Un diseño de base de datos realizado de forma correcta nos proporciona una **ventajas** fundamentales:

* Nos permite **ahorrar espacio**, mediante el diseño de base de datos optimizadas y sin datos duplicados.
* Nos ayuda a que se preserve la **precisión e integridad de los datos** y que no se pierda información.
* Agiliza de forma extrema el **acceso y el procesamiento de los datos**.

## Fases del diseño de base de datos

<figure><img src="https://lh6.googleusercontent.com/Tzu6QjyEysnjMtj89ecyTfI3C8NGi4TFRtVziQMSHY1zaj7OtMGuoi2B72QlweQxfEqtYNIi1KcAWujIZNIj0s9w_SrLfUsubQEQ5D9V9Fh6LgeiHG_TNgWbo5HmoKL1ka2wT5soOfSUcCIe6F-kBg=s2048" alt=""><figcaption><p>Fases del diseño de bases de datos</p></figcaption></figure>

### 1. Recopilación y análisis de requisitos

Esta primera fase consiste en un paso previo obligatorio, para asegurarnos de que nuestra base de datos cumplirá con nuestros objetivos. Para ello, deberemos analizar distintas cuestiones:

* Qué **datos** que necesitamos almacenar y de dónde provienen.
* La **información** que los datos describen.
* Quienes van a acceder a la base de datos y qué necesidades tienen a la hora de acceder a los datos.

### [2. Diseño conceptual](diseno-conceptual.md)

En esta fase se realiza una representación a alto nivel del contenido de la base de datos, independientemente del sistema de gestión de base de datos que se vaya a utilizar. El diseño conceptual se materializa en un diagrama de entidad-relación que defina:

* **Entidades**
* **Atributos** de las entidades.
* **Relaciones** entre las entidades.

### 3. Diseño lógico

En esta fase, se traduce el modelo conceptual  a un esquema lógico, que describe **la estructura de la base de datos**. Se trata de la fase en la cual se diseñan las tablas propiamente dichas, con sus filas, columnas y relaciones. El modelo lógico depende del SGBD que se utilizará.

### 4. Diseño físico

En esta fase se definen **las estructuras de almacenamiento** de la base de datos de forma física. Es cuando se escribe el código (por ejemplo, SQL)  para concretar el diseño en el motor de base de datos que hemos escogido.

