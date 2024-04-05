# Sakila

"Sakila" es una base de datos de ejemplo que se utiliza comúnmente en la educación y la práctica con sistemas de gestión de bases de datos relacionales (RDBMS). Fue desarrollada originalmente por MySQL y se utiliza para demostrar cómo funcionan y cómo se pueden consultar bases de datos.

La base de datos Sakila está diseñada para representar un sistema de gestión de una tienda de alquiler de películas, similar a una videoteca.&#x20;

### [Instalación MySQL](broken-reference)

### [Instalación Postgres](broken-reference)



A continuación, se detalla información sobre las tablas de la base de datos:

## Tablas de entidades

1. **`actor`:**
   * **Campos Principales:**
     * `actor_id` (clave primaria): Identificador único para cada actor.
     * `first_name`: Primer nombre del actor.
     * `last_name`: Apellido del actor.
   * **Descripción:** Almacena información sobre los actores que participan en las películas.
2. **`category`:**
   * **Campos Principales:**
     * `category_id` (clave primaria): Identificador único para cada categoría.
     * `name`: Nombre de la categoría.
   * **Descripción:** Contiene las categorías a las que pertenecen las películas.
3. **`film`:**
   * **Campos Principales:**
     * `film_id` (clave primaria): Identificador único para cada película.
     * `title`: Título de la película.
     * `description`: Descripción de la trama de la película.
     * `release_year`: Año de lanzamiento de la película.
     * `length`: Duración de la película en minutos.
   * **Descripción:** Almacena detalles sobre las películas, incluyendo título, descripción, año de lanzamiento y duración.
4. **`customer`:**
   * **Campos Principales:**
     * `customer_id` (clave primaria): Identificador único para cada cliente.
     * `first_name`: Primer nombre del cliente.
     * `last_name`: Apellido del cliente.
     * `email`: Dirección de correo electrónico del cliente.
   * **Descripción:** Contiene información sobre los clientes que realizan alquileres de películas.
5. **`rental`:**
   * **Campos Principales:**
     * `rental_id` (clave primaria): Identificador único para cada alquiler.
     * `rental_date`: Fecha en que se realizó el alquiler.
     * `return_date`: Fecha de devolución de la película alquilada.
   * **Relaciones:** Se relaciona con las entidades `customer` y `inventory`.
   * **Descripción:** Registra la información sobre los alquileres de películas.
6. **`inventory`:**
   * **Campos Principales:**
     * `inventory_id` (clave primaria): Identificador único para cada copia de película disponible.
   * **Relaciones:** Se relaciona con las entidades `film` y `rental`.
   * **Descripción:** Mantiene un registro de las copias físicas de las películas disponibles para alquilar.

## Tablas de relaciones

* **`film_actor`:**
  * **Campos:**
    * `actor_id` (clave foránea): Se relaciona con `actor.actor_id`.
    * `film_id` (clave foránea): Se relaciona con `film.film_id`.
  * **Descripción:** Asocia actores con las películas en las que participan.
* **`film_category`:**
  * **Campos:**
    * `film_id` (clave foránea): Se relaciona con `film.film_id`.
    * `category_id` (clave foránea): Se relaciona con `category.category_id`.
  * **Descripción:** Asocia películas con las categorías a las que pertenecen.
* **`inventory_film`:**
  * **Campos:**
    * `film_id` (clave foránea): Se relaciona con `film.film_id`.
    * `inventory_id` (clave foránea): Se relaciona con `inventory.inventory_id`.
  * **Descripción:** Asocia películas con las copias físicas disponibles en el inventario.
* **`rental_inventory`:**
  * **Campos:**
    * `rental_id` (clave foránea): Se relaciona con `rental.rental_id`.
    * `inventory_id` (clave foránea): Se relaciona con `inventory.inventory_id`.
  * **Descripción:** Asocia los alquileres con las copias físicas de las películas que se alquilaron.

Estas relaciones modelan la estructura de la base de datos Sakila y cómo las diferentes entidades están conectadas entre sí. Puedes utilizar estas relaciones para realizar consultas complejas que involucren información de varias tablas en la base de datos.

### [Documentación](https://dev.mysql.com/doc/sakila/en/)

<figure><img src="../.gitbook/assets/image (145).png" alt=""><figcaption></figcaption></figure>
